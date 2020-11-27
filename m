Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242872C6595
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD50F6ECAE;
	Fri, 27 Nov 2020 12:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E566ED99;
 Fri, 27 Nov 2020 12:12:25 +0000 (UTC)
IronPort-SDR: DuzcFp8k7GM9jVQjeO02Ta2yYk1FMdbUVPrt18fy3Ko+KyYfJMrtaOUppjqKQn5cPNRZL2KUTl
 EDZnaRSReUJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883877"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883877"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:25 -0800
IronPort-SDR: QkKIiaPbz6hTJPFRQRPjnpvhk7d7TBBTsSnIQYWct0jX0lQwJHwxn4pI4FIzNIOvGck0aZUteJ
 37iGZRTFmBow==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030052"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 155/162] drm/i915: Use a ww transaction in the fault
 handler
Date: Fri, 27 Nov 2020 12:07:11 +0000
Message-Id: <20201127120718.454037-156-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKUHJl
ZmVyIGEgd3cgdHJhbnNhY3Rpb24gcmF0aGVyIHRoYW4gYSBzaW5nbGUgb2JqZWN0IGxvY2sgdG8K
ZW5hYmxlIHNsZWVwaW5nIGxvY2sgZXZpY3Rpb24gaWYgcmVhY2hlZCBieSB0aGUgZmF1bHQKaGFu
ZGxlci4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9t
QGludGVsLmNvbT4KQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jIHwgNDUgKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X21tYW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMKaW5kZXgg
MzNjY2Q0ZDY2NWQ0Li5hOTUyNmNjMzA5ZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX21tYW4uYwpAQCAtMjM4LDYgKzIzOCw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHZtX2Zh
dWx0X2NwdShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFy
ZWEgPSB2bWYtPnZtYTsKIAlzdHJ1Y3QgaTkxNV9tbWFwX29mZnNldCAqbW1vID0gYXJlYS0+dm1f
cHJpdmF0ZV9kYXRhOwogCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBtbW8tPm9i
ajsKKwlzdHJ1Y3QgaTkxNV9nZW1fd3dfY3R4IHd3OwogCXJlc291cmNlX3NpemVfdCBpb21hcDsK
IAlpbnQgZXJyOwogCkBAIC0yNDYsMzMgKzI0NywzNSBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2bV9m
YXVsdF9jcHUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJCSAgICAgYXJlYS0+dm1fZmxhZ3MgJiBW
TV9XUklURSkpCiAJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7CiAKLQlpZiAoaTkxNV9nZW1fb2Jq
ZWN0X2xvY2tfaW50ZXJydXB0aWJsZShvYmosIE5VTEwpKQotCQlyZXR1cm4gVk1fRkFVTFRfTk9Q
QUdFOworCWZvcl9pOTE1X2dlbV93dygmd3csIGVyciwgdHJ1ZSkgeworCQllcnIgPSBpOTE1X2dl
bV9vYmplY3RfbG9jayhvYmosICZ3dyk7CisJCWlmIChlcnIpCisJCQljb250aW51ZTsKIAotCWVy
ciA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsKLQlpZiAoZXJyKQotCQlnb3RvIG91
dDsKKwkJZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlcyhvYmopOworCQlpZiAoZXJyKQor
CQkJY29udGludWU7CiAKLQlpb21hcCA9IC0xOwotCWlmICghaTkxNV9nZW1fb2JqZWN0X2hhc19z
dHJ1Y3RfcGFnZShvYmopKSB7Ci0JCWlvbWFwID0gb2JqLT5tbS5yZWdpb24tPmlvbWFwLmJhc2U7
Ci0JCWlvbWFwIC09IG9iai0+bW0ucmVnaW9uLT5yZWdpb24uc3RhcnQ7Ci0JfQorCQlpb21hcCA9
IC0xOworCQlpZiAoIWk5MTVfZ2VtX29iamVjdF9oYXNfc3RydWN0X3BhZ2Uob2JqKSkgeworCQkJ
aW9tYXAgPSBvYmotPm1tLnJlZ2lvbi0+aW9tYXAuYmFzZTsKKwkJCWlvbWFwIC09IG9iai0+bW0u
cmVnaW9uLT5yZWdpb24uc3RhcnQ7CisJCX0KIAotCS8qIFBURXMgYXJlIHJldm9rZWQgaW4gb2Jq
LT5vcHMtPnB1dF9wYWdlcygpICovCi0JZXJyID0gcmVtYXBfaW9fc2coYXJlYSwKLQkJCSAgYXJl
YS0+dm1fc3RhcnQsIGFyZWEtPnZtX2VuZCAtIGFyZWEtPnZtX3N0YXJ0LAotCQkJICBvYmotPm1t
LnBhZ2VzLT5zZ2wsIGlvbWFwKTsKKwkJLyogUFRFcyBhcmUgcmV2b2tlZCBpbiBvYmotPm9wcy0+
cHV0X3BhZ2VzKCkgKi8KKwkJZXJyID0gcmVtYXBfaW9fc2coYXJlYSwKKwkJCQkgIGFyZWEtPnZt
X3N0YXJ0LCBhcmVhLT52bV9lbmQgLSBhcmVhLT52bV9zdGFydCwKKwkJCQkgIG9iai0+bW0ucGFn
ZXMtPnNnbCwgaW9tYXApOwogCi0JaWYgKGFyZWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpIHsKLQkJ
R0VNX0JVR19PTighaTkxNV9nZW1fb2JqZWN0X2hhc19waW5uZWRfcGFnZXMob2JqKSk7Ci0JCW9i
ai0+bW0uZGlydHkgPSB0cnVlOwotCX0KKwkJaWYgKGFyZWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUp
IHsKKwkJCUdFTV9CVUdfT04oIWk5MTVfZ2VtX29iamVjdF9oYXNfcGlubmVkX3BhZ2VzKG9iaikp
OworCQkJb2JqLT5tbS5kaXJ0eSA9IHRydWU7CisJCX0KIAotCWk5MTVfZ2VtX29iamVjdF91bnBp
bl9wYWdlcyhvYmopOworCQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKKwkJLyog
SW1wbGljaXQgdW5sb2NrICovCisJfQogCi1vdXQ6Ci0JaTkxNV9nZW1fb2JqZWN0X3VubG9jayhv
YmopOwogCXJldHVybiBpOTE1X2Vycm9yX3RvX3ZtZl9mYXVsdChlcnIpOwogfQogCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
