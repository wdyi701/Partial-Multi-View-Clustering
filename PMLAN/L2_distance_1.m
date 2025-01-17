% compute squared Euclidean distance
% ||A-B||^2 = ||A||^2 + ||B||^2 - 2*A'*B
function d = L2_distance_1(a,b)
% a,b: two matrices. each column is a data
% d:   distance matrix of a and b

if (size(a,1) == 1)
  a = [a; zeros(1,size(a,2))]; 
  b = [b; zeros(1,size(b,2))]; 
end

aa=sum(a.*a); bb=sum(b.*b); ab=a'*b; 
d = repmat(aa',[1 size(bb,2)]) + repmat(bb,[size(aa,2) 1]) - 2*ab;

d = real(d);
d = max(d,0);

%将距离规范化，可尝试多种规范化方法
%     for  i = 1:size(d,1)
%         d(i,:) = (d(i,:) - min( d(i,:) ) ) / (max( d(i,:) )-min( d(i,:) )+eps) ;%eps防止分母为0
%     end