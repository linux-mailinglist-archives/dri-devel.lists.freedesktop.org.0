Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D04B512
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8076E31C;
	Wed, 19 Jun 2019 09:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5446E31C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:39:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9cgqj178657;
 Wed, 19 Jun 2019 09:39:45 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t7809abh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:39:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9d9Ji090349;
 Wed, 19 Jun 2019 09:39:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2t77yn0146-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:39:44 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5J9dg6K012175;
 Wed, 19 Jun 2019 09:39:43 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 02:39:42 -0700
Date: Wed, 19 Jun 2019 12:39:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: seanpaul@chromium.org
Subject: [bug report] drm: Add helpers to kick off self refresh mode in drivers
Message-ID: <20190619093937.GA25140@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Tkh1nOu4As58xUPxgoxw1j6kcxgcm9FZ9SDWXZDAdZE=;
 b=spV63ZTCFPQEa2/legBVPKg/CqqcSQyQew0/73UsnRkg3uVmDTzyQ9POmJBxyfAyaINz
 3age7IiVWJGSVlBEWObpgpvoEpLT3Hpm26uMgzeq4eMARWN6ZcUz+xnnQQ/ghQsPkIcd
 7JiTzn8TfqKBmy8aQmW9+pZKR2jMDTYtdXX3glM4iGshyS8uF6ujy+SNegc+yiwRcSh2
 ZZwT6v6y1LXUDtXe92llRhSuoAnOX8VA9UkwRD7mpJiNybije+Zxgh0GNiAVyYxe4EQR
 0wG5texqr4HM//sTXe+4ErLjqVEVeCPoYUyvCpb9jFZ5wk9Vrp3/oV1FNqk7+6HVfJh+ PA== 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2VhbiBQYXVsLAoKVGhlIHBhdGNoIDE0NTJjMjViMGU2MDogImRybTogQWRkIGhlbHBl
cnMgdG8ga2ljayBvZmYgc2VsZiByZWZyZXNoCm1vZGUgaW4gZHJpdmVycyIgZnJvbSBKdW4gMTIs
IDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljCmNoZWNrZXIgd2FybmluZzoKCglk
cml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYzoxMTggZHJtX3NlbGZfcmVm
cmVzaF9oZWxwZXJfZW50cnlfd29yaygpCgllcnJvcjogd2UgcHJldmlvdXNseSBhc3N1bWVkICdz
dGF0ZScgY291bGQgYmUgbnVsbCAoc2VlIGxpbmUgNzcpCgpkcml2ZXJzL2dwdS9kcm0vZHJtX3Nl
bGZfcmVmcmVzaF9oZWxwZXIuYwogICAgNjAgIHN0YXRpYyB2b2lkIGRybV9zZWxmX3JlZnJlc2hf
aGVscGVyX2VudHJ5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogICAgNjEgIHsKICAg
IDYyICAgICAgICAgIHN0cnVjdCBkcm1fc2VsZl9yZWZyZXNoX2RhdGEgKnNyX2RhdGEgPSBjb250
YWluZXJfb2YoCiAgICA2MyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0b19kZWxh
eWVkX3dvcmsod29yayksCiAgICA2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZHJtX3NlbGZfcmVmcmVzaF9kYXRhLCBlbnRyeV93b3JrKTsKICAgIDY1ICAgICAgICAg
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IHNyX2RhdGEtPmNydGM7CiAgICA2NiAgICAgICAgICBz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2OwogICAgNjcgICAgICAgICAgc3RydWN0
IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKICAgIDY4ICAgICAgICAgIHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZTsKICAgIDY5ICAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uOwogICAgNzAgICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5f
c3RhdGU7CiAgICA3MSAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7
CiAgICA3MiAgICAgICAgICBpbnQgaSwgcmV0OwogICAgNzMgIAogICAgNzQgICAgICAgICAgZHJt
X21vZGVzZXRfYWNxdWlyZV9pbml0KCZjdHgsIDApOwogICAgNzUgIAogICAgNzYgICAgICAgICAg
c3RhdGUgPSBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKGRldik7CiAgICA3NyAgICAgICAgICBpZiAo
IXN0YXRlKSB7CiAgICA3OCAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07CiAgICA3OSAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
XgpUaGUgYWxsb2NhdGlvbiBmYWlsZWQuCgogICAgODAgICAgICAgICAgfQogICAgODEgIAogICAg
ODIgIHJldHJ5OgogICAgODMgICAgICAgICAgc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsKICAg
IDg0ICAKICAgIDg1ICAgICAgICAgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jcnRjX3N0
YXRlKHN0YXRlLCBjcnRjKTsKICAgIDg2ICAgICAgICAgIGlmIChJU19FUlIoY3J0Y19zdGF0ZSkp
IHsKICAgIDg3ICAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihjcnRjX3N0YXRlKTsKICAg
IDg4ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICA4OSAgICAgICAgICB9CiAgICA5MCAg
CiAgICA5MSAgICAgICAgICBpZiAoIWNydGNfc3RhdGUtPmVuYWJsZSkKICAgIDkyICAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7CiAgICA5MyAgCiAgICA5NCAgICAgICAgICByZXQgPSBkcm1fYXRv
bWljX2FkZF9hZmZlY3RlZF9jb25uZWN0b3JzKHN0YXRlLCBjcnRjKTsKICAgIDk1ICAgICAgICAg
IGlmIChyZXQpCiAgICA5NiAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgOTcgIAogICAg
OTggICAgICAgICAgZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubiwg
Y29ubl9zdGF0ZSwgaSkgewogICAgOTkgICAgICAgICAgICAgICAgICBpZiAoIWNvbm5fc3RhdGUt
PnNlbGZfcmVmcmVzaF9hd2FyZSkKICAgMTAwICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKICAgMTAxICAgICAgICAgIH0KICAgMTAyICAKICAgMTAzICAgICAgICAgIGNydGNfc3Rh
dGUtPmFjdGl2ZSA9IGZhbHNlOwogICAxMDQgICAgICAgICAgY3J0Y19zdGF0ZS0+c2VsZl9yZWZy
ZXNoX2FjdGl2ZSA9IHRydWU7CiAgIDEwNSAgCiAgIDEwNiAgICAgICAgICByZXQgPSBkcm1fYXRv
bWljX2NvbW1pdChzdGF0ZSk7CiAgIDEwNyAgICAgICAgICBpZiAocmV0KQogICAxMDggICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsKICAgMTA5ICAKICAgMTEwICBvdXQ6CiAgIDExMSAgICAgICAg
ICBpZiAocmV0ID09IC1FREVBRExLKSB7CiAgIDExMiAgICAgICAgICAgICAgICAgIGRybV9hdG9t
aWNfc3RhdGVfY2xlYXIoc3RhdGUpOwogICAxMTMgICAgICAgICAgICAgICAgICByZXQgPSBkcm1f
bW9kZXNldF9iYWNrb2ZmKCZjdHgpOwogICAxMTQgICAgICAgICAgICAgICAgICBpZiAoIXJldCkK
ICAgMTE1ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJldHJ5OwogICAxMTYgICAgICAg
ICAgfQogICAxMTcgIAogICAxMTggICAgICAgICAgZHJtX2F0b21pY19zdGF0ZV9wdXQoc3RhdGUp
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl4KTlVMTCBkZXJlZmVy
ZW5jZS4KCiAgIDExOSAgICAgICAgICBkcm1fbW9kZXNldF9kcm9wX2xvY2tzKCZjdHgpOwogICAx
MjAgICAgICAgICAgZHJtX21vZGVzZXRfYWNxdWlyZV9maW5pKCZjdHgpOwogICAxMjEgIH0KCnJl
Z2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
