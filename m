Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BF2C64B8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92A6EC80;
	Fri, 27 Nov 2020 12:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1296EC34;
 Fri, 27 Nov 2020 12:09:19 +0000 (UTC)
IronPort-SDR: P/7Cdde28LvF+s4exxPyZmaTPH+74y9IDLQI1ZFnIlQ0ZZCc5r7fEbmOv1WgfJjs9yIUVaWcJg
 owCryEYkaHFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540653"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:19 -0800
IronPort-SDR: KlwBpzq+C086Sg4wY/DnVddXk8kNlv1lAy6mGPTXOaTfEO/kNrs/4uQAEbHa85fdflL89186Lw
 6gFXIE5DYRFg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028931"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 061/162] drm/i915/selftests: Prepare hangcheck for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:37 +0000
Message-Id: <20201127120718.454037-62-matthew.auld@intel.com>
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
bT4KCkNvbnZlcnQgYSBmZXcgY2FsbHMgdG8gdXNlIHRoZSB1bmxvY2tlZCB2ZXJzaW9ucy4KClNp
Z25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNr
LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X2hh
bmdjaGVjay5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNrLmMK
aW5kZXggZmI1ZWJmOTMwYWIyLi5lMzAyN2NlYmFiNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X2hhbmdjaGVjay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3NlbGZ0ZXN0X2hhbmdjaGVjay5jCkBAIC04MCwxNSArODAsMTUgQEAgc3RhdGljIGlu
dCBoYW5nX2luaXQoc3RydWN0IGhhbmcgKmgsIHN0cnVjdCBpbnRlbF9ndCAqZ3QpCiAJfQogCiAJ
aTkxNV9nZW1fb2JqZWN0X3NldF9jYWNoZV9jb2hlcmVuY3koaC0+aHdzLCBJOTE1X0NBQ0hFX0xM
Qyk7Ci0JdmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChoLT5od3MsIEk5MTVfTUFQX1dC
KTsKKwl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKGgtPmh3cywgSTkx
NV9NQVBfV0IpOwogCWlmIChJU19FUlIodmFkZHIpKSB7CiAJCWVyciA9IFBUUl9FUlIodmFkZHIp
OwogCQlnb3RvIGVycl9vYmo7CiAJfQogCWgtPnNlcW5vID0gbWVtc2V0KHZhZGRyLCAweGZmLCBQ
QUdFX1NJWkUpOwogCi0JdmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChoLT5vYmosCi0J
CQkJCWk5MTVfY29oZXJlbnRfbWFwX3R5cGUoZ3QtPmk5MTUpKTsKKwl2YWRkciA9IGk5MTVfZ2Vt
X29iamVjdF9waW5fbWFwX3VubG9ja2VkKGgtPm9iaiwKKwkJCQkJCSBpOTE1X2NvaGVyZW50X21h
cF90eXBlKGd0LT5pOTE1KSk7CiAJaWYgKElTX0VSUih2YWRkcikpIHsKIAkJZXJyID0gUFRSX0VS
Uih2YWRkcik7CiAJCWdvdG8gZXJyX3VucGluX2h3czsKQEAgLTE0OSw3ICsxNDksNyBAQCBoYW5n
X2NyZWF0ZV9yZXF1ZXN0KHN0cnVjdCBoYW5nICpoLCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICpl
bmdpbmUpCiAJCXJldHVybiBFUlJfQ0FTVChvYmopOwogCX0KIAotCXZhZGRyID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXAob2JqLCBpOTE1X2NvaGVyZW50X21hcF90eXBlKGd0LT5pOTE1KSk7CisJ
dmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChvYmosIGk5MTVfY29oZXJl
bnRfbWFwX3R5cGUoZ3QtPmk5MTUpKTsKIAlpZiAoSVNfRVJSKHZhZGRyKSkgewogCQlpOTE1X2dl
bV9vYmplY3RfcHV0KG9iaik7CiAJCWk5MTVfdm1fcHV0KHZtKTsKLS0gCjIuMjYuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
