function weights = gene_distance_feature(feat1, feat2, type)
% note that the feature should be N*P
%P : dimention N : feagure number
switch lower(type)
    case 'exp'
        tmp1 = sum( (feat1 - feat2).^2, 2);
        valDistances = sqrt(tmp1)+eps; 
        minVal = min(valDistances);
        valDistances=(valDistances-minVal)/(max(valDistances)-minVal);
%         weights = exp(-valDistances/(max(valDistances) + eps));
       weights = exp(-10*valDistances);
    case 'dot'
        tmp1 = sum((feat1.*feat2), 2);
        valDistances = tmp1;
        minVal = min(valDistances);
        valDistances=(valDistances-minVal)/(max(valDistances)-minVal);
        weights= valDistances;
end