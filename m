Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8FB4801
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAA26E9D6;
	Tue, 17 Sep 2019 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0376EAC4;
 Tue, 17 Sep 2019 03:21:41 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k5so4121689iol.5;
 Mon, 16 Sep 2019 20:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uMCwEHQvtNjk+/l7SPshcA4CM/OKg67DuvF3ouBwv+s=;
 b=sV2YLVIyXRgoKtJI9e3qk+Fa5WS9DZONALtYwiqEVWFw3CPXyReOA37+k1ygySRmyL
 sr+mhccVfXChr4tbpUyI22SYSfVx9un7NqVeqis8yJnAvocl4PDRlTCxmAjKfuncRBcr
 nENKfOk61G+uohNk8yn8zP47Q2E5kyS+upwih+sTnq3JUrrLhnX9KY+IUxColxKynXC5
 ZyDn6GQkgdcyn6AS7/lbD398cmCZ9H+FSJhTZhciycfIbcP9mrEvrfb/9M4iGXtQoR7h
 3HA9SAXwE36Rw9XACJJiO1RpU/yLY1KBMWjzGXRH11fecZOR/Ur9d0GdJOQ2iydFzV6A
 UjMw==
X-Gm-Message-State: APjAAAWA9WwxZVK7NcBqiJhX0GwgNtt97Uuyq/C11rP2WawD6NPgIYFy
 gq45x6sKrId98qS9bUTGDu8=
X-Google-Smtp-Source: APXvYqwUAbHzObmxlcKTs7Sr7rY0DuCnBsDeDL5086A+CmYlktYdRFHclzi8wQ5tlTQQ0uKm5fZfWw==
X-Received: by 2002:a6b:9109:: with SMTP id t9mr1456924iod.16.1568690500448;
 Mon, 16 Sep 2019 20:21:40 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id c25sm651242iod.47.2019.09.16.20.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 20:21:39 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/amd/display: memory leak
Date: Mon, 16 Sep 2019 22:20:44 -0500
Message-Id: <20190917032106.32342-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uMCwEHQvtNjk+/l7SPshcA4CM/OKg67DuvF3ouBwv+s=;
 b=i+yWSNJc3bZlvKnVhSjjMRCBCwtmu5ooFGKZkGLKMAjHkZ7wqLgf5B1Ge8VWsOMQ9D
 0ZMxcBL3/Bw+tbjePdVCiMNDzLZHb8OHz3KHL3rFah0+a7jG+3jHM2w1M7QldzzrKWlA
 AOuDVcblakTGqdGh8O7qeTty9pg7dh6lCZFFQ7+qa3Zfo/sMsFoOLD7/RnmqQceRlD7A
 9Js0M9EBevwVt+gWJWV4Gv3MpUwABCxFFkqCEi/S5fHiitflplxWobhvKnBCJqFJVOvj
 Rgl0PSBqUMSwjqhK+gmIrrFp1lJQJyMDWK1p9Ind6kM83mnW5SatKmWATZfrs7p5Qk2A
 Sc8w==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jun Lei <Jun.Lei@amd.com>,
 Wang Hai <wanghai26@huawei.com>, Tony Cheng <Tony.Cheng@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 emamd001@umn.edu, Eric Bernstein <Eric.Bernstein@amd.com>,
 Su Sung Chung <Su.Chung@amd.com>, smccaman@umn.edu,
 Charlene Liu <Charlene.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>, kjlu@umn.edu,
 Nikola Cornij <nikola.cornij@amd.com>, Aidan Wood <Aidan.Wood@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Ken Chalmers <ken.chalmers@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, Thomas Lim <Thomas.Lim@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZGNuKl9jbG9ja19zb3VyY2VfY3JlYXRlIHdoZW4gZGNuMjBfY2xrX3NyY19jb25zdHJ1Y3Qg
ZmFpbHMgYWxsb2NhdGVkCmNsa19zcmMgbmVlZHMgcmVsZWFzZS4KClNpZ25lZC1vZmYtYnk6IE5h
dmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jIHwgMyArKy0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMgfCAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNl
LmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jl
c291cmNlLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4
MF9yZXNvdXJjZS5jICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9yZXNvdXJjZS5jICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jICAgfCAxICsKIDcgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKaW5kZXggNjI0OGM4NDU1MzE0
Li4yMWRlMjMwYjMwM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYwpAQCAtNjY3LDcgKzY2Nyw4IEBAIHN0cnVj
dCBjbG9ja19zb3VyY2UgKmRjZTEwMF9jbG9ja19zb3VyY2VfY3JlYXRlKAogCQljbGtfc3JjLT5i
YXNlLmRwX2Nsa19zcmMgPSBkcF9jbGtfc3JjOwogCQlyZXR1cm4gJmNsa19zcmMtPmJhc2U7CiAJ
fQotCisKKwlrZnJlZShjbGtfc3JjKTsKIAlCUkVBS19UT19ERUJVR0dFUigpOwogCXJldHVybiBO
VUxMOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEx
MC9kY2UxMTBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Ux
MTAvZGNlMTEwX3Jlc291cmNlLmMKaW5kZXggNzY0MzI5MjY0YzNiLi4wY2I4M2IwZTBlMWUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jl
c291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2Ux
MTBfcmVzb3VyY2UuYwpAQCAtNzE0LDYgKzcxNCw3IEBAIHN0cnVjdCBjbG9ja19zb3VyY2UgKmRj
ZTExMF9jbG9ja19zb3VyY2VfY3JlYXRlKAogCQlyZXR1cm4gJmNsa19zcmMtPmJhc2U7CiAJfQog
CisJa2ZyZWUoY2xrX3NyYyk7CiAJQlJFQUtfVE9fREVCVUdHRVIoKTsKIAlyZXR1cm4gTlVMTDsK
IH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNl
MTEyX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2Rj
ZTExMl9yZXNvdXJjZS5jCmluZGV4IGM2MTM2ZTBlZDFhNC4uMTQ3ZDc3MTczZTJiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jl
c291cmNlLmMKQEAgLTY4Nyw2ICs2ODcsNyBAQCBzdHJ1Y3QgY2xvY2tfc291cmNlICpkY2UxMTJf
Y2xvY2tfc291cmNlX2NyZWF0ZSgKIAkJcmV0dXJuICZjbGtfc3JjLT5iYXNlOwogCX0KIAorCWtm
cmVlKGNsa19zcmMpOwogCUJSRUFLX1RPX0RFQlVHR0VSKCk7CiAJcmV0dXJuIE5VTEw7CiB9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9y
ZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBf
cmVzb3VyY2UuYwppbmRleCA0YTZiYTMxNzNhNWEuLjBiNWVlZmYxN2QwMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJj
ZS5jCkBAIC01MDAsNiArNTAwLDcgQEAgc3RhdGljIHN0cnVjdCBjbG9ja19zb3VyY2UgKmRjZTEy
MF9jbG9ja19zb3VyY2VfY3JlYXRlKAogCQlyZXR1cm4gJmNsa19zcmMtPmJhc2U7CiAJfQogCisJ
a2ZyZWUoY2xrX3NyYyk7CiAJQlJFQUtfVE9fREVCVUdHRVIoKTsKIAlyZXR1cm4gTlVMTDsKIH0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9y
ZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jl
c291cmNlLmMKaW5kZXggODYwYTUyNGViY2ZhLi45NTI0NDA4OTNmYmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCkBA
IC03MDEsNiArNzAxLDcgQEAgc3RydWN0IGNsb2NrX3NvdXJjZSAqZGNlODBfY2xvY2tfc291cmNl
X2NyZWF0ZSgKIAkJcmV0dXJuICZjbGtfc3JjLT5iYXNlOwogCX0KIAorCWtmcmVlKGNsa19zcmMp
OwogCUJSRUFLX1RPX0RFQlVHR0VSKCk7CiAJcmV0dXJuIE5VTEw7CiB9CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jCmluZGV4
IGExMjUzMGEzYWI5Yy4uM2YyNWU4ZGE1Mzk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYwpAQCAtNzg2LDYgKzc4Niw3
IEBAIHN0cnVjdCBjbG9ja19zb3VyY2UgKmRjbjEwX2Nsb2NrX3NvdXJjZV9jcmVhdGUoCiAJCXJl
dHVybiAmY2xrX3NyYy0+YmFzZTsKIAl9CiAKKwlrZnJlZShjbGtfc3JjKTsKIAlCUkVBS19UT19E
RUJVR0dFUigpOwogCXJldHVybiBOVUxMOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBiOTQ5ZTIwMmQ2Y2Iu
LjQxOGZkY2YxZjQ5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTk1NSw2ICs5NTUsNyBAQCBzdHJ1Y3QgY2xv
Y2tfc291cmNlICpkY24yMF9jbG9ja19zb3VyY2VfY3JlYXRlKAogCQlyZXR1cm4gJmNsa19zcmMt
PmJhc2U7CiAJfQogCisJa2ZyZWUoY2xrX3NyYykKIAlCUkVBS19UT19ERUJVR0dFUigpOwogCXJl
dHVybiBOVUxMOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
