Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B42D8DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBFC6E09F;
	Wed, 29 May 2019 09:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30DE6E0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:18:40 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 679FD2849FA;
 Wed, 29 May 2019 10:18:39 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH] drm/panfrost: Make sure a BO is only unmapped when appropriate
Date: Wed, 29 May 2019 11:18:36 +0200
Message-Id: <20190529091836.22060-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bW11X29wcy0+dW5tYXAoKSB3aWxsIGZhaWwgd2hlbiBjYWxsZWQgb24gYSBCTyB0aGF0IGhhcyBu
b3QgYmVlbgpwcmV2aW91c2x5IG1hcHBlZCwgYW5kIHRoZSBlcnJvciBwYXRoIGluIHBhbmZyb3N0
X2lvY3RsX2NyZWF0ZV9ibygpCmNhbiBjYWxsIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgp
ICh3aGljaCBpbiB0dXJuIGNhbGxzCnBhbmZyb3N0X21tdV91bm1hcCgpKSBvbiBhIEJPIHRoYXQg
aGFzIG5vdCBiZWVuIG1hcHBlZCB5ZXQuCgpLZWVwIHRyYWNrIG9mIHRoZSBtYXBwZWQvdW5tYXBw
ZWQgc3RhdGUgdG8gYXZvaWQgc3VjaCBpc3N1ZXMuCgpGaXhlczogZjNiYTkxMjI4ZThlICgiZHJt
L3BhbmZyb3N0OiBBZGQgaW5pdGlhbCBwYW5mcm9zdCBkcml2ZXIiKQpDYzogPHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2dlbS5oIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA4
ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaAppbmRleCAwNDUwMDBlYjVmY2YuLjZkYmNhYmEwMjBm
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaApAQCAtMTEsNiArMTEs
NyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCB7CiAJc3RydWN0IGRybV9nZW1fc2htZW1f
b2JqZWN0IGJhc2U7CiAKIAlzdHJ1Y3QgZHJtX21tX25vZGUgbm9kZTsKKwlib29sIGlzX21hcHBl
ZDsKIH07CiAKIHN0YXRpYyBpbmxpbmUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYwppbmRleCA3NjJiMWJkMmE4YzIuLmZiNTU2YWE4OTIwMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMTU2LDYgKzE1Niw5IEBAIGludCBwYW5mcm9zdF9t
bXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKIAlzdHJ1Y3Qgc2dfdGFibGUg
KnNndDsKIAlpbnQgcmV0OwogCisJaWYgKGJvLT5pc19tYXBwZWQpCisJCXJldHVybiAwOworCiAJ
c2d0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KG9iaik7CiAJaWYgKFdBUk5fT04oSVNf
RVJSKHNndCkpKQogCQlyZXR1cm4gUFRSX0VSUihzZ3QpOwpAQCAtMTg5LDYgKzE5Miw3IEBAIGlu
dCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKIAogCXBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQocGZkZXYtPmRldik7CisJYm8tPmlzX21hcHBlZCA9IHRydWU7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTIwMyw2ICsyMDcsOSBAQCB2b2lkIHBhbmZyb3N0X21tdV91bm1hcChzdHJ1Y3Qg
cGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCiAJc2l6ZV90IHVubWFwcGVkX2xlbiA9IDA7CiAJaW50
IHJldDsKIAorCWlmICghYm8tPmlzX21hcHBlZCkKKwkJcmV0dXJuOworCiAJZGV2X2RiZyhwZmRl
di0+ZGV2LCAidW5tYXA6IGlvdmE9JWxseCwgbGVuPSV6eCIsIGlvdmEsIGxlbik7CiAKIAlyZXQg
PSBwbV9ydW50aW1lX2dldF9zeW5jKHBmZGV2LT5kZXYpOwpAQCAtMjMwLDYgKzIzNyw3IEBAIHZv
aWQgcGFuZnJvc3RfbW11X3VubWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKIAog
CXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQocGZkZXYtPmRldik7CisJYm8tPmlzX21hcHBlZCA9IGZhbHNlOwogfQogCiBz
dGF0aWMgdm9pZCBtbXVfdGxiX2ludl9jb250ZXh0X3MxKHZvaWQgKmNvb2tpZSkKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
