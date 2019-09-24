Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D1BCD4C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCBC6EA8C;
	Tue, 24 Sep 2019 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F846EA8A;
 Tue, 24 Sep 2019 16:46:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B81A21841;
 Tue, 24 Sep 2019 16:46:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 13/70] drm/amdgpu: Fix hard hang for S/G display
 BOs.
Date: Tue, 24 Sep 2019 12:44:52 -0400
Message-Id: <20190924164549.27058-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343580;
 bh=NjzupDenoqLLyLpB0bUoEgIBSgtmb3n0NUd2iv3HQdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vNqLWHKwUVy5qsepykVr9XvG+AEP2spIhvKfnBOvUumtBZHVRkSLtGbR+no6QacK1
 Z+QlhC28oCcJMYLGxy9hLJ92xrzD/VFQkljb+w3/rYel3L7iB41zG8G7ciSYnBHruB
 chqh8Shv7a098AekGU4C3eVQD9noR6zf5wAsbx20=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Shirish S <shirish.s@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpbIFVw
c3RyZWFtIGNvbW1pdCBlNGM0MDczYjAxMzlkMDU1ZDQzYTk1Njg2OTBmYzU2MGFhYjRmYTVjIF0K
CkhXIHJlcXVpcmVzIGZvciBjYWNoaW5nIHRvIGJlIHVuc2V0IGZvciBzY2Fub3V0IEJPCm1hcHBp
bmdzIHdoZW4gdGhlIEJPIHBsYWNlbWVudCBpcyBpbiBHVFQgbWVtb3J5LgpVc3VhbGx5IHRoZSBm
bGFnIHRvIHVuc2V0IGlzIHBhc3NlZCBmcm9tIHVzZXIgbW9kZQpidXQgZm9yIEZCIG1vZGUgdGhp
cyB3YXMgbWlzc2luZy4KCnYyOgpLZWVwIGFsbCBCTyBwbGFjZW1lbnQgbG9naWMgaW4gYW1kZ3B1
X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMKClN1Z2dlc3RlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KVGVzdGVkLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2gu
c0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyAgfCA3ICsrKy0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDMgKystCiAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9mYi5jCmluZGV4IGU0NzYwOTIxODgzOTIuLmJmMGM2MWJhYTA1Yzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCkBAIC0xMzcsMTQgKzEzNywx
NCBAQCBzdGF0aWMgaW50IGFtZGdwdWZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0KHN0cnVjdCBhbWRn
cHVfZmJkZXYgKnJmYmRldiwKIAltb2RlX2NtZC0+cGl0Y2hlc1swXSA9IGFtZGdwdV9hbGlnbl9w
aXRjaChhZGV2LCBtb2RlX2NtZC0+d2lkdGgsIGNwcCwKIAkJCQkJCSAgZmJfdGlsZWQpOwogCWRv
bWFpbiA9IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zKGFkZXYpOwotCiAJaGVpZ2h0
ID0gQUxJR04obW9kZV9jbWQtPmhlaWdodCwgOCk7CiAJc2l6ZSA9IG1vZGVfY21kLT5waXRjaGVz
WzBdICogaGVpZ2h0OwogCWFsaWduZWRfc2l6ZSA9IEFMSUdOKHNpemUsIFBBR0VfU0laRSk7CiAJ
cmV0ID0gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKGFkZXYsIGFsaWduZWRfc2l6ZSwgMCwgZG9t
YWluLAogCQkJCSAgICAgICBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIHwK
LQkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdVT1VTIHwKLQkJCQkgICAg
ICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVELAorCQkJCSAgICAgICBBTURHUFVfR0VN
X0NSRUFURV9WUkFNX0NPTlRJR1VPVVMgICAgIHwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVB
VEVfVlJBTV9DTEVBUkVEIAkgICAgIHwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BV
X0dUVF9VU1dDLAogCQkJCSAgICAgICB0dG1fYm9fdHlwZV9rZXJuZWwsIE5VTEwsICZnb2JqKTsK
IAlpZiAocmV0KSB7CiAJCXByX2VycigiZmFpbGVkIHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVyICgl
ZClcbiIsIGFsaWduZWRfc2l6ZSk7CkBAIC0xNjYsNyArMTY2LDYgQEAgc3RhdGljIGludCBhbWRn
cHVmYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgYW1kZ3B1X2ZiZGV2ICpyZmJkZXYsCiAJ
CQlkZXZfZXJyKGFkZXYtPmRldiwgIkZCIGZhaWxlZCB0byBzZXQgdGlsaW5nIGZsYWdzXG4iKTsK
IAl9CiAKLQogCXJldCA9IGFtZGdwdV9ib19waW4oYWJvLCBkb21haW4pOwogCWlmIChyZXQpIHsK
IAkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhYm8pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dlbS5jCmluZGV4IGQ0ZmNmNTQ3NTQ2NDYuLjZmYzc3YWM4MTRkOGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTc0Niw3ICs3NDYsOCBAQCBpbnQgYW1k
Z3B1X21vZGVfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqZ29iajsKIAl1aW50MzJfdCBoYW5kbGU7Ci0JdTY0IGZsYWdzID0gQU1ER1BVX0dF
TV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRDsKKwl1NjQgZmxhZ3MgPSBBTURHUFVfR0VNX0NS
RUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIHwKKwkJICAgIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9H
VFRfVVNXQzsKIAl1MzIgZG9tYWluOwogCWludCByOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
