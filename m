Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566CAFAC9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EDE6EA7D;
	Wed, 11 Sep 2019 10:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518036EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:49:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BAmvG1176343;
 Wed, 11 Sep 2019 10:49:43 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2uw1jkh22g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 10:49:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BAmgDu099560;
 Wed, 11 Sep 2019 10:49:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2uxj88nasg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 10:49:42 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8BAnbYk021939;
 Wed, 11 Sep 2019 10:49:37 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Sep 2019 03:49:36 -0700
Date: Wed, 11 Sep 2019 13:49:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190911104928.GA15930@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909110099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909110099
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=O142t2Aqio/yATZmFf7buzHUM+fnfQ15Mwv2B5Kdx9I=;
 b=gnu1EySbhFaYMPRJGQRIq0RMkZFgSS0UG1E63/l+C/yfZ5kjAGLVYXX21U4zR5kR1BOl
 9IAztmXBHkd6TxTb+5XFGd9TzlozLndZctSp+uf5FRIx2xkE2sUxQCe/Xu/RhR849e9a
 x2HenBm3njMxDPgkbmYXZY/+JWBLhmBVdiuGjFRglmzNkMhN3CgdJDUmsfitVvNDHWUj
 SYM5d5OPmvOz0GIX8972hjy3jRoSO0MUjJGV0U+jTD+00yFX9RxXwTsWw/0pNQpl1Zyx
 0YrDPltY7tnME9DHLkAZVF4WhRtg8dgoPw2OYcCX5ZhtbPEkmdLDPnCeutWe+SswHcJk nw== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJsdmRzLT5iYWNrbGlnaHQiIHBvaW50ZXIgY291bGQgYmUgTlVMTCBpbiBzaXR1YXRpb25z
IHdoZXJlCm9mX3BhcnNlX3BoYW5kbGUoKSByZXR1cm5zIE5VTEwuICBUaGlzIGNvZGUgaXMgY2xl
YW5lciBpZiB3ZSB1c2UgdGhlCm1hbmFnZWQgZGV2bV9vZl9maW5kX2JhY2tsaWdodCgpIHNvIHRo
ZSBjbGVhbiB1cCBpcyBhdXRvbWF0aWMuCgpGaXhlczogN2M5ZGZmNWJkNjQzICgiZHJtOiBwYW5l
bHM6IEFkZCBMVkRTIHBhbmVsIGRyaXZlciIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCnYzOiBVc2UgZGV2bV9vZl9maW5kX2JhY2ts
aWdodCgpLiAgVGhpcyB2ZXJzaW9uIGlzIHF1aXRlIGEgYml0IG1vcmUKICAgIGFtYml0aW91cywg
YW5kIEkgaGF2ZW4ndCB0ZXN0ZWQgaXQgc28gcGxlYXNlIHJldmlldyBjYXJlZnVsbHkuCnYyOiBV
c2UgYmFja2xpZ2h0X3B1dCgpCgogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyB8
IDIxICsrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWx2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKaW5kZXggYWQ0
N2NjOTU0NTllLi5iZjVmY2MzZTUzNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1sdmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwpA
QCAtMTk3LDcgKzE5Nyw2IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wYXJzZV9kdChzdHJ1Y3Qg
cGFuZWxfbHZkcyAqbHZkcykKIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBwYW5lbF9sdmRzICpsdmRzOwotCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnA7CiAJaW50IHJldDsKIAogCWx2ZHMgPSBkZXZtX2t6YWxsb2MoJnBk
ZXYtPmRldiwgc2l6ZW9mKCpsdmRzKSwgR0ZQX0tFUk5FTCk7CkBAIC0yNDMsMTQgKzI0Miw5IEBA
IHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQlyZXR1cm4gcmV0OwogCX0KIAotCW5wID0gb2ZfcGFyc2VfcGhhbmRsZShsdmRzLT5kZXYt
Pm9mX25vZGUsICJiYWNrbGlnaHQiLCAwKTsKLQlpZiAobnApIHsKLQkJbHZkcy0+YmFja2xpZ2h0
ID0gb2ZfZmluZF9iYWNrbGlnaHRfYnlfbm9kZShucCk7Ci0JCW9mX25vZGVfcHV0KG5wKTsKLQot
CQlpZiAoIWx2ZHMtPmJhY2tsaWdodCkKLQkJCXJldHVybiAtRVBST0JFX0RFRkVSOwotCX0KKwls
dmRzLT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGx2ZHMtPmRldik7CisJaWYg
KElTX0VSUihsdmRzLT5iYWNrbGlnaHQpKQorCQlyZXR1cm4gUFRSX0VSUihsdmRzLT5iYWNrbGln
aHQpOwogCiAJLyoKIAkgKiBUT0RPOiBIYW5kbGUgYWxsIHBvd2VyIHN1cHBsaWVzIHNwZWNpZmll
ZCBpbiB0aGUgRFQgbm9kZSBpbiBhIGdlbmVyaWMKQEAgLTI2NiwxNCArMjYwLDEwIEBAIHN0YXRp
YyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJ
cmV0ID0gZHJtX3BhbmVsX2FkZCgmbHZkcy0+cGFuZWwpOwogCWlmIChyZXQgPCAwKQotCQlnb3Rv
IGVycm9yOworCQlyZXR1cm4gcmV0OwogCiAJZGV2X3NldF9kcnZkYXRhKGx2ZHMtPmRldiwgbHZk
cyk7CiAJcmV0dXJuIDA7Ci0KLWVycm9yOgotCXB1dF9kZXZpY2UoJmx2ZHMtPmJhY2tsaWdodC0+
ZGV2KTsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IHBhbmVsX2x2ZHNfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC0yODQsOSArMjc0LDYgQEAgc3RhdGljIGlu
dCBwYW5lbF9sdmRzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGFu
ZWxfbHZkc19kaXNhYmxlKCZsdmRzLT5wYW5lbCk7CiAKLQlpZiAobHZkcy0+YmFja2xpZ2h0KQot
CQlwdXRfZGV2aWNlKCZsdmRzLT5iYWNrbGlnaHQtPmRldik7Ci0KIAlyZXR1cm4gMDsKIH0KIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
