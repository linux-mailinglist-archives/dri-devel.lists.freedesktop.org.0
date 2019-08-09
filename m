Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2B885E2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 00:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C406EEF0;
	Fri,  9 Aug 2019 22:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA7C6EEF7;
 Fri,  9 Aug 2019 22:27:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="176927013"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO
 mwahaha-bdw.ger.corp.intel.com) ([10.252.5.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2019 15:26:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/37] drm/i915/blt: don't assume pinned intel_context
Date: Fri,  9 Aug 2019 23:26:16 +0100
Message-Id: <20190809222643.23142-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809222643.23142-1-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIGp1c3QgcGFzcyBpbiBiY3MwLT5lbmdpbmVfY29udGV4dCBzbyBpdCBtYXR0
ZXJzIG5vdCwgYnV0IGluCnRoZSBmdXR1cmUgd2UgbWF5IHdhbnQgdG8gcGFzcyBpbiBzb21ldGhp
bmcgdGhhdCBpcyBub3QgYQprZXJuZWxfY29udGV4dCwgc28gdHJ5IHRvIGJlIGEgYml0IG1vcmUg
Z2VuZXJpYy4KClN1Z2dlc3RlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+ClNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY2xpZW50X2JsdC5jIHwg
MyArKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3RfYmx0LmMgfCAz
ICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NsaWVudF9ibHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jbGllbnRfYmx0LmMKaW5kZXgg
ZGU2NjE2YmRiM2E2Li4wOGE4NGM5NDBkOGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9jbGllbnRfYmx0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2NsaWVudF9ibHQuYwpAQCAtNCw2ICs0LDcgQEAKICAqLwogCiAjaW5jbHVk
ZSAiaTkxNV9kcnYuaCIKKyNpbmNsdWRlICJndC9pbnRlbF9jb250ZXh0LmgiCiAjaW5jbHVkZSAi
aTkxNV9nZW1fY2xpZW50X2JsdC5oIgogI2luY2x1ZGUgImk5MTVfZ2VtX29iamVjdF9ibHQuaCIK
IApAQCAtMTc1LDcgKzE3Niw3IEBAIHN0YXRpYyB2b2lkIGNsZWFyX3BhZ2VzX3dvcmtlcihzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJaWYgKHVubGlrZWx5KGVycikpCiAJCWdvdG8gb3V0X3Vu
bG9jazsKIAotCXJxID0gaTkxNV9yZXF1ZXN0X2NyZWF0ZSh3LT5jZSk7CisJcnEgPSBpbnRlbF9j
b250ZXh0X2NyZWF0ZV9yZXF1ZXN0KHctPmNlKTsKIAlpZiAoSVNfRVJSKHJxKSkgewogCQllcnIg
PSBQVFJfRVJSKHJxKTsKIAkJZ290byBvdXRfdW5waW47CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0X2JsdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX29iamVjdF9ibHQuYwppbmRleCA4MzdkZDY2MzZkZDEuLmZhOTBjMzhj
OGIwNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVj
dF9ibHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0X2Js
dC5jCkBAIC00LDYgKzQsNyBAQAogICovCiAKICNpbmNsdWRlICJpOTE1X2Rydi5oIgorI2luY2x1
ZGUgImd0L2ludGVsX2NvbnRleHQuaCIKICNpbmNsdWRlICJpOTE1X2dlbV9jbGZsdXNoLmgiCiAj
aW5jbHVkZSAiaTkxNV9nZW1fb2JqZWN0X2JsdC5oIgogCkBAIC02NCw3ICs2NSw3IEBAIGludCBp
OTE1X2dlbV9vYmplY3RfZmlsbF9ibHQoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwK
IAkJaTkxNV9nZW1fb2JqZWN0X3VubG9jayhvYmopOwogCX0KIAotCXJxID0gaTkxNV9yZXF1ZXN0
X2NyZWF0ZShjZSk7CisJcnEgPSBpbnRlbF9jb250ZXh0X2NyZWF0ZV9yZXF1ZXN0KGNlKTsKIAlp
ZiAoSVNfRVJSKHJxKSkgewogCQllcnIgPSBQVFJfRVJSKHJxKTsKIAkJZ290byBvdXRfdW5waW47
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
