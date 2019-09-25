Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A8BDF8D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4706EBC2;
	Wed, 25 Sep 2019 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1646EBBB;
 Wed, 25 Sep 2019 13:57:29 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PDs665047220;
 Wed, 25 Sep 2019 13:57:27 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2v5b9tvvd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 13:57:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PDs3oE127114;
 Wed, 25 Sep 2019 13:57:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2v82q9mr06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 13:57:26 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8PDvPSi031413;
 Wed, 25 Sep 2019 13:57:25 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Sep 2019 06:57:25 -0700
Date: Wed, 25 Sep 2019 16:57:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.gmeiner@gmail.com
Subject: [bug report] drm/etnaviv: add infrastructure to query perf counter
Message-ID: <20190925135719.GA26488@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=IfMUiM/EoJwYpZ2ALVklID19nNIhgikCF4V8iUhsdZQ=;
 b=Ejw4Q3owHlrh9bVm+IEDWSqtKDWBr5yETKtzRJmKcRjU0Ug0pBcnrsHpJZrmSbnlTEyP
 2VwynS96Jyj0bnBa04HATcUEsFqB5xMKFUFrfOxc9yGn98FDL46PhCXY9gXn17QlfunX
 oWQNhQ/EnNJYeYPJe9+nrC+RjJdK5zgPB47P65qf3HIp8h7/tHKy3c6hznZCN6ZMeCGL
 Lmcg5B28zN0sH6sL+pQoggrt+AhxIwXogNSTj58vjocEcY1vuP6y77PIaiJmFVkUUCRO
 ycYR3ENSRyW8OqpymYDed6vKmcPp63uuiP/CBWlQLKYcCEWFeHzLGl+l5q7dcosXXUQx 3A== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQ2hyaXN0aWFuIEdtZWluZXIsCgpUaGUgcGF0Y2ggOWUyYzJlMjczMDEyOiAiZHJtL2V0
bmF2aXY6IGFkZCBpbmZyYXN0cnVjdHVyZSB0byBxdWVyeQpwZXJmIGNvdW50ZXIiIGZyb20gU2Vw
IDI0LCAyMDE3LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYwpjaGVja2VyIHdhcm5pbmc6
CgoJZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYzo0NDkgZXRuYXZpdl9pb2N0
bF9wbV9xdWVyeV9kb20oKQoJd2FybjogJ2FyZ3MtPnBpcGUnIGlzIG91dCBvZiBib3VuZHMgJzMn
IHZzICcyJwoKZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwogICA0MzUgIHN0
YXRpYyBpbnQgZXRuYXZpdl9pb2N0bF9wbV9xdWVyeV9kb20oc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKICAgNDM2ICAgICAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKICAg
NDM3ICB7CiAgIDQzOCAgICAgICAgICBzdHJ1Y3QgZXRuYXZpdl9kcm1fcHJpdmF0ZSAqcHJpdiA9
IGRldi0+ZGV2X3ByaXZhdGU7CiAgIDQzOSAgICAgICAgICBzdHJ1Y3QgZHJtX2V0bmF2aXZfcG1f
ZG9tYWluICphcmdzID0gZGF0YTsKICAgNDQwICAgICAgICAgIHN0cnVjdCBldG5hdml2X2dwdSAq
Z3B1OwogICA0NDEgIAogICA0NDIgICAgICAgICAgaWYgKGFyZ3MtPnBpcGUgPj0gRVROQV9NQVhf
UElQRVMpCiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgph
cmctPnBpcGUgZ29lcyB1cCB0byAzLgoKICAgNDQzICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CiAgIDQ0NCAgCiAgIDQ0NSAgICAgICAgICBncHUgPSBwcml2LT5ncHVbYXJncy0+cGlw
ZV07CiAgIDQ0NiAgICAgICAgICBpZiAoIWdwdSkKICAgNDQ3ICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTlhJTzsKICAgNDQ4ICAKICAgNDQ5ICAgICAgICAgIHJldHVybiBldG5hdml2X3BtX3F1
ZXJ5X2RvbShncHUsIGFyZ3MpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eXgpUaGF0IGlzIGludmFsaWQgaGVyZS4KCiAgIDQ1MCAgfQoKZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKICAgNDExICBzdGF0aWMgY29uc3Qg
c3RydWN0IGV0bmF2aXZfcG1fZG9tYWluX21ldGEgZG9tc19tZXRhW10gPSB7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXgpUaGlzIGFy
cmF5IGhhcyAzIGVsZW1lbnRzLgoKICAgNDEyICAgICAgICAgIHsKICAgNDEzICAgICAgICAgICAg
ICAgICAgLm5yX2RvbWFpbnMgPSBBUlJBWV9TSVpFKGRvbXNfM2QpLAogICA0MTQgICAgICAgICAg
ICAgICAgICAuZG9tYWlucyA9ICZkb21zXzNkWzBdCiAgIDQxNSAgICAgICAgICB9LAogICA0MTYg
ICAgICAgICAgewogICA0MTcgICAgICAgICAgICAgICAgICAubnJfZG9tYWlucyA9IEFSUkFZX1NJ
WkUoZG9tc18yZCksCiAgIDQxOCAgICAgICAgICAgICAgICAgIC5kb21haW5zID0gJmRvbXNfMmRb
MF0KICAgNDE5ICAgICAgICAgIH0sCiAgIDQyMCAgICAgICAgICB7CiAgIDQyMSAgICAgICAgICAg
ICAgICAgIC5ucl9kb21haW5zID0gQVJSQVlfU0laRShkb21zX3ZnKSwKICAgNDIyICAgICAgICAg
ICAgICAgICAgLmRvbWFpbnMgPSAmZG9tc192Z1swXQogICA0MjMgICAgICAgICAgfQogICA0MjQg
IH07CiAgIDQyNSAgCiAgIDQyNiAgaW50IGV0bmF2aXZfcG1fcXVlcnlfZG9tKHN0cnVjdCBldG5h
dml2X2dwdSAqZ3B1LAogICA0MjcgICAgICAgICAgc3RydWN0IGRybV9ldG5hdml2X3BtX2RvbWFp
biAqZG9tYWluKQogICA0MjggIHsKICAgNDI5ICAgICAgICAgIGNvbnN0IHN0cnVjdCBldG5hdml2
X3BtX2RvbWFpbl9tZXRhICptZXRhID0gJmRvbXNfbWV0YVtkb21haW4tPnBpcGVdOwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl4KSWYgZG9tYWluLT5waXBlIGlzIDMgdGhlbiB3ZSBhcmUgb25l
IGVsZW1lbnQgYmV5b25kIHRoZSBlbmQgb2YgdGhlCmFycmF5LgoKICAgNDMwICAgICAgICAgIGNv
bnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tOwogICA0MzEgIAogICA0MzIgICAgICAg
ICAgaWYgKGRvbWFpbi0+aXRlciA+PSBtZXRhLT5ucl9kb21haW5zKQogICA0MzMgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgNDM0ICAKICAgNDM1ICAgICAgICAgIGRvbSA9IG1l
dGEtPmRvbWFpbnMgKyBkb21haW4tPml0ZXI7CiAgIDQzNiAgCiAgIDQzNyAgICAgICAgICBkb21h
aW4tPmlkID0gZG9tYWluLT5pdGVyOwogICA0MzggICAgICAgICAgZG9tYWluLT5ucl9zaWduYWxz
ID0gZG9tLT5ucl9zaWduYWxzOwogICA0MzkgICAgICAgICAgc3RybmNweShkb21haW4tPm5hbWUs
IGRvbS0+bmFtZSwgc2l6ZW9mKGRvbWFpbi0+bmFtZSkpOwogICA0NDAgIAogICA0NDEgICAgICAg
ICAgZG9tYWluLT5pdGVyKys7CiAgIDQ0MiAgICAgICAgICBpZiAoZG9tYWluLT5pdGVyID09IG1l
dGEtPm5yX2RvbWFpbnMpCiAgIDQ0MyAgICAgICAgICAgICAgICAgIGRvbWFpbi0+aXRlciA9IDB4
ZmY7CiAgIDQ0NCAgCiAgIDQ0NSAgICAgICAgICByZXR1cm4gMDsKICAgNDQ2ICB9CgpyZWdhcmRz
LApkYW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
