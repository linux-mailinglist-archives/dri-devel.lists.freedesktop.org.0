Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA42C6495
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230076EC61;
	Fri, 27 Nov 2020 12:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610EF6EC29;
 Fri, 27 Nov 2020 12:08:24 +0000 (UTC)
IronPort-SDR: owtmKndv1geWy3V66HLae2c7vXC3Kbg3Jgq/oaXi2hxDsUhyLSR7oA+2imM8j9VCH5iCZFvE4J
 +g8Ou2WE2cNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883433"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:21 -0800
IronPort-SDR: RWtMjk+F4btUkAY+O5zwMgf519sYcF4/YjgFHBuD/jhYrAGr8ka+asWKyGaeuLG0Qi+3uYfDoQ
 FfeJmuSjBxXQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028700"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 030/162] drm/i915: Rework clflush to work correctly
 without obj->mm.lock.
Date: Fri, 27 Nov 2020 12:05:06 +0000
Message-Id: <20201127120718.454037-31-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KClBpbiBpbiB0aGUgY2FsbGVyLCBub3QgaW4gdGhlIHdvcmsgaXRzZWxmLiBUaGlzIHNob3Vs
ZCBhbHNvCndvcmsgYmV0dGVyIGZvciBkbWEtZmVuY2UgYW5ub3RhdGlvbnMuCgpTaWduZWQtb2Zm
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jbGZsdXNoLmMgfCAxNSAr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2Ns
Zmx1c2guYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jbGZsdXNoLmMKaW5k
ZXggYmMwMjIzNzE2OTA2Li5kYWY5Mjg0ZWYxZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9jbGZsdXNoLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2NsZmx1c2guYwpAQCAtMjcsMTUgKzI3LDggQEAgc3RhdGljIHZvaWQgX19k
b19jbGZsdXNoKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopCiBzdGF0aWMgaW50IGNs
Zmx1c2hfd29yayhzdHJ1Y3QgZG1hX2ZlbmNlX3dvcmsgKmJhc2UpCiB7CiAJc3RydWN0IGNsZmx1
c2ggKmNsZmx1c2ggPSBjb250YWluZXJfb2YoYmFzZSwgdHlwZW9mKCpjbGZsdXNoKSwgYmFzZSk7
Ci0Jc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IGNsZmx1c2gtPm9iajsKLQlpbnQg
ZXJyOwogCi0JZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlcyhvYmopOwotCWlmIChlcnIp
Ci0JCXJldHVybiBlcnI7Ci0KLQlfX2RvX2NsZmx1c2gob2JqKTsKLQlpOTE1X2dlbV9vYmplY3Rf
dW5waW5fcGFnZXMob2JqKTsKKwlfX2RvX2NsZmx1c2goY2xmbHVzaC0+b2JqKTsKIAogCXJldHVy
biAwOwogfQpAQCAtNDQsNiArMzcsNyBAQCBzdGF0aWMgdm9pZCBjbGZsdXNoX3JlbGVhc2Uoc3Ry
dWN0IGRtYV9mZW5jZV93b3JrICpiYXNlKQogewogCXN0cnVjdCBjbGZsdXNoICpjbGZsdXNoID0g
Y29udGFpbmVyX29mKGJhc2UsIHR5cGVvZigqY2xmbHVzaCksIGJhc2UpOwogCisJaTkxNV9nZW1f
b2JqZWN0X3VucGluX3BhZ2VzKGNsZmx1c2gtPm9iaik7CiAJaTkxNV9nZW1fb2JqZWN0X3B1dChj
bGZsdXNoLT5vYmopOwogfQogCkBAIC02Myw2ICs1NywxMSBAQCBzdGF0aWMgc3RydWN0IGNsZmx1
c2ggKmNsZmx1c2hfd29ya19jcmVhdGUoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikK
IAlpZiAoIWNsZmx1c2gpCiAJCXJldHVybiBOVUxMOwogCisJaWYgKF9faTkxNV9nZW1fb2JqZWN0
X2dldF9wYWdlcyhvYmopIDwgMCkgeworCQlrZnJlZShjbGZsdXNoKTsKKwkJcmV0dXJuIE5VTEw7
CisJfQorCiAJZG1hX2ZlbmNlX3dvcmtfaW5pdCgmY2xmbHVzaC0+YmFzZSwgJmNsZmx1c2hfb3Bz
KTsKIAljbGZsdXNoLT5vYmogPSBpOTE1X2dlbV9vYmplY3RfZ2V0KG9iaik7IC8qIG9iaiA8LT4g
Y2xmbHVzaCBjeWNsZSAqLwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
