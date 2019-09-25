Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF9BD906
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683016EB3F;
	Wed, 25 Sep 2019 07:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB51F6EB20;
 Wed, 25 Sep 2019 04:24:19 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so10127324iod.9;
 Tue, 24 Sep 2019 21:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MS2fxSO5B4fdSwTSr588JEm97CHbkHnZPXYIa8kugGg=;
 b=ZnvgN7H5b2lthannIQHAQ6Dexcd4Unw/AwxhBQIQFKhGv2JvK6wsyV6talsMrEFkZr
 Ubudc40JqoAfblw6arbcgOMjww0GIiVA8pk32SZaHwLK7rrWG5dSbHDGgOP65oSsct4u
 mACOPUG0jwx7AcxlQLKNfEg4fgWlhLhYPKODW7dGsnl6UpO9/2oI670XA1TaNpiTxMrX
 HATk78j0lDUpTvPOaUs+tcC2DrO0UH94iodJrY6VmO5kq10hykYX96XFWPl0HJyavu6k
 34dbkmYmF6S7CWEPyK8yhzwKe3nrZrmL4eGVHYVTl960I/of4A5/je4Qy1StWogQjSjN
 9I6A==
X-Gm-Message-State: APjAAAVwhBjjZwdbjQ55eCCmu3JVV65/G4ElNLRtc5v0aHhol7wutv7o
 azOc3crxMpDT0naSQFKuGP0=
X-Google-Smtp-Source: APXvYqzndtOTM69mP51f/SoXtLy/fJyC/cIcsyLkt0PidJyn5iMPKKB+A8DdYyC3O8hIk4pqT4OWiA==
X-Received: by 2002:a6b:6110:: with SMTP id v16mr8052275iob.199.1569385458891; 
 Tue, 24 Sep 2019 21:24:18 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id r12sm33707ilq.70.2019.09.24.21.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 21:24:18 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/amd/display: prevent memory leak
Date: Tue, 24 Sep 2019 23:23:56 -0500
Message-Id: <20190925042407.31383-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MS2fxSO5B4fdSwTSr588JEm97CHbkHnZPXYIa8kugGg=;
 b=MVgKQ7C0XNYOr+wZQ7k0LZDFFkkfMarqBz67S1MUs1pNITYkcaGTG+R6ELtapPUAsH
 h8RkjQkLp5vca+bpvQGYkPVfrlMqMjrguUMBoMlhYmV+hjreJhY9Zl5kuVMICZwvka4A
 ppbdTu1xJNUpA2lZQa6N4k7h5+a+5QazXKuGx0zIPCtcLb5myxiBt2X1Fgo6Nnv2iZJ1
 hzSVi6+h2FmPUMyE+ffZNnHEJ0UtPw9wa54tygJOopMCqDy8Sf5vufMNOQ4RW2Sp1xjC
 NUlF4Tsg+Ud4bq/yim6m675DEibvGPgFjVXSUJa2q3BN2b1EnA/OtWIVNKexac2kA2s2
 6QoQ==
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
 Sam Ravnborg <sam@ravnborg.org>, Wang Hai <wanghai26@huawei.com>,
 Tony Cheng <Tony.Cheng@amd.com>, David Francis <David.Francis@amd.com>,
 amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 Eric Bernstein <Eric.Bernstein@amd.com>, Su Sung Chung <Su.Chung@amd.com>,
 smccaman@umn.edu, Leo Li <sunpeng.li@amd.com>, kjlu@umn.edu,
 Aidan Wood <Aidan.Wood@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
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

SW4gZGNuKl9jcmVhdGVfcmVzb3VyY2VfcG9vbCB0aGUgYWxsb2NhdGVkIG1lbW9yeSBzaG91bGQg
YmUgcmVsZWFzZWQgaWYKY29uc3RydWN0IHBvb2wgZmFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBOYXZp
ZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyB8IDEgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuYyB8IDEgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYyB8
IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3Vy
Y2UuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jl
c291cmNlLmMgICB8IDEgKwogNSBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNv
dXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVz
b3VyY2UuYwppbmRleCBhZmM2MTA1NWVjYTEuLjE3ODdiOWJmODAwYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5j
CkBAIC0xMDkxLDYgKzEwOTEsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTAwX2NyZWF0
ZV9yZXNvdXJjZV9wb29sKAogCWlmIChjb25zdHJ1Y3QobnVtX3ZpcnR1YWxfbGlua3MsIGRjLCBw
b29sKSkKIAkJcmV0dXJuICZwb29sLT5iYXNlOwogCisJa2ZyZWUocG9vbCk7CiAJQlJFQUtfVE9f
REVCVUdHRVIoKTsKIAlyZXR1cm4gTlVMTDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jCmluZGV4IGM2NmZlMTcw
ZTFlOC4uMzE4ZTljMmUyY2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMKQEAgLTE0NjIsNiArMTQ2Miw3IEBA
IHN0cnVjdCByZXNvdXJjZV9wb29sICpkY2UxMTBfY3JlYXRlX3Jlc291cmNlX3Bvb2woCiAJaWYg
KGNvbnN0cnVjdChudW1fdmlydHVhbF9saW5rcywgZGMsIHBvb2wsIGFzaWNfaWQpKQogCQlyZXR1
cm4gJnBvb2wtPmJhc2U7CiAKKwlrZnJlZShwb29sKTsKIAlCUkVBS19UT19ERUJVR0dFUigpOwog
CXJldHVybiBOVUxMOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMKaW5kZXggM2FjNGM3ZTczMDUwLi4zMTk5ZDQ5
M2QxM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIv
ZGNlMTEyX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTExMi9kY2UxMTJfcmVzb3VyY2UuYwpAQCAtMTMzOCw2ICsxMzM4LDcgQEAgc3RydWN0IHJlc291
cmNlX3Bvb2wgKmRjZTExMl9jcmVhdGVfcmVzb3VyY2VfcG9vbCgKIAlpZiAoY29uc3RydWN0KG51
bV92aXJ0dWFsX2xpbmtzLCBkYywgcG9vbCkpCiAJCXJldHVybiAmcG9vbC0+YmFzZTsKIAorCWtm
cmVlKHBvb2wpOwogCUJSRUFLX1RPX0RFQlVHR0VSKCk7CiAJcmV0dXJuIE5VTEw7CiB9CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNv
dXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVz
b3VyY2UuYwppbmRleCA3ZDA4MTU0ZTk2NjIuLmJiNDk3ZjQzZjZlYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5j
CkBAIC0xMjAzLDYgKzEyMDMsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTIwX2NyZWF0
ZV9yZXNvdXJjZV9wb29sKAogCWlmIChjb25zdHJ1Y3QobnVtX3ZpcnR1YWxfbGlua3MsIGRjLCBw
b29sKSkKIAkJcmV0dXJuICZwb29sLT5iYXNlOwogCisJa2ZyZWUocG9vbCk7CiAJQlJFQUtfVE9f
REVCVUdHRVIoKTsKIAlyZXR1cm4gTlVMTDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKaW5kZXggNWE4OWU0NjJlN2Nj
Li41OTMwNWU0MTFhNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jCkBAIC0xNTcwLDYgKzE1NzAsNyBAQCBzdHJ1Y3Qg
cmVzb3VyY2VfcG9vbCAqZGNuMTBfY3JlYXRlX3Jlc291cmNlX3Bvb2woCiAJaWYgKGNvbnN0cnVj
dChpbml0X2RhdGEtPm51bV92aXJ0dWFsX2xpbmtzLCBkYywgcG9vbCkpCiAJCXJldHVybiAmcG9v
bC0+YmFzZTsKIAorCWtmcmVlKHBvb2wpOwogCUJSRUFLX1RPX0RFQlVHR0VSKCk7CiAJcmV0dXJu
IE5VTEw7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
