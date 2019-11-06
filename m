Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B84F1354
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370B76ECA4;
	Wed,  6 Nov 2019 10:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE42F89FA9;
 Wed,  6 Nov 2019 10:07:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 19099361-1500050 
 for multiple; Wed, 06 Nov 2019 10:07:18 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/prime: Use anon_drm_getfile() for an internal drm
 struct file
Date: Wed,  6 Nov 2019 10:07:16 +0000
Message-Id: <20191106100716.18181-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191106100716.18181-1-chris@chris-wilson.co.uk>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHRoZSBkcm1fcHJpbWUgbW1hcCBmYWxsYmFjayB1c2VzIGEgbW9jayBzdHJ1Y3Qg
ZmlsZSB0byBwcm92aWRlCnRoZSBmaWxlIHBvaW50ZXIgaW50byB0aGUgYmFja2VuZCBtbWFwIHJv
dXRpbmUuIE5vdyB0aGF0IHdlIGNhbiBjcmVhdGUKZnVsbHkgZmxlZGdlZCBhbm9ueW1vdXMgc3Ry
dWN0IGZpbGUgYXJvdW5kIHRoZSBkcm0gZGV2aWNlLCBwdXQgaXQgdG8KdXNlLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMjYgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bWUuYwppbmRleCAwODE0MjExYjBmM2YuLjVmYWE2MzcxM2VjOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpA
QCAtNzA5LDggKzcwOSw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9kbWFidWZfdnVubWFwKTsK
ICAqLwogaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7Ci0Jc3RydWN0IGRybV9maWxlICpwcml2Owot
CXN0cnVjdCBmaWxlICpmaWw7CisJc3RydWN0IGZpbGUgKmZpbGU7CiAJaW50IHJldDsKIAogCWlm
IChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsKQEAgLTcyMiwzMCArNzIxLDIxIEBA
IGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCQlyZXR1cm4gMDsKIAl9CiAKLQlwcml2ID0ga3phbGxv
YyhzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKLQlmaWwgPSBremFsbG9jKHNpemVvZigqZmls
KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFwcml2IHx8ICFmaWwpIHsKLQkJcmV0ID0gLUVOT01FTTsK
LQkJZ290byBvdXQ7Ci0JfQorCWZpbGUgPSBhbm9uX2RybV9nZXRmaWxlKG9iai0+ZGV2LT5wcmlt
YXJ5LCBPX1JEV1IpOworCWlmIChJU19FUlIoZmlsZSkpCisJCXJldHVybiBQVFJfRVJSKGZpbGUp
OwogCi0JLyogVXNlZCBieSBkcm1fZ2VtX21tYXAoKSB0byBsb29rdXAgdGhlIEdFTSBvYmplY3Qg
Ki8KLQlwcml2LT5taW5vciA9IG9iai0+ZGV2LT5wcmltYXJ5OwotCWZpbC0+cHJpdmF0ZV9kYXRh
ID0gcHJpdjsKLQotCXJldCA9IGRybV92bWFfbm9kZV9hbGxvdygmb2JqLT52bWFfbm9kZSwgcHJp
dik7CisJcmV0ID0gZHJtX3ZtYV9ub2RlX2FsbG93KCZvYmotPnZtYV9ub2RlLCBmaWxlLT5wcml2
YXRlX2RhdGEpOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwogCiAJdm1hLT52bV9wZ29mZiArPSBk
cm1fdm1hX25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOwogCi0JcmV0ID0gb2JqLT5kZXYtPmRy
aXZlci0+Zm9wcy0+bW1hcChmaWwsIHZtYSk7CisJcmV0ID0gZmlsZS0+Zl9vcC0+bW1hcChmaWxl
LCB2bWEpOwogCi0JZHJtX3ZtYV9ub2RlX3Jldm9rZSgmb2JqLT52bWFfbm9kZSwgcHJpdik7CisJ
ZHJtX3ZtYV9ub2RlX3Jldm9rZSgmb2JqLT52bWFfbm9kZSwgZmlsZS0+cHJpdmF0ZV9kYXRhKTsK
IG91dDoKLQlrZnJlZShwcml2KTsKLQlrZnJlZShmaWwpOwotCisJZnB1dChmaWxlKTsKIAlyZXR1
cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaW1lX21tYXApOwotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
