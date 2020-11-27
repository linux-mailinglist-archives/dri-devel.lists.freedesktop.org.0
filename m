Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFA2C64A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8716EC72;
	Fri, 27 Nov 2020 12:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215766EC68;
 Fri, 27 Nov 2020 12:09:00 +0000 (UTC)
IronPort-SDR: oR5YfxLaVjOtFl6qG12L31PZBc4gTYAhzNC8CHG3LfUWK9oVprq+5wcPF+PsfQSkDf29GcY9Es
 QK21WLzz2xqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540609"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:59 -0800
IronPort-SDR: WHOPyRqQYUhy6HW2HiLnK041BX/fH4u3gGI03gg7XDDcaIShU3hr+CBzsWAlGMCj+RxjvjHuFG
 VOFv6GtZXUhw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028833"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:57 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 051/162] drm/i915/selftests: Prepare client blit for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:27 +0000
Message-Id: <20201127120718.454037-52-matthew.auld@intel.com>
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
bT4KClN0cmFpZ2h0Zm9yd2FyZCBjb252ZXJzaW9uLCBqdXN0IGNvbnZlcnQgYSBidW5jaCBvZiBj
YWxscyB0bwp1bmxvY2tlZCB2ZXJzaW9ucy4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jbGllbnRfYmx0LmMgfCA4ICsrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY2xpZW50
X2JsdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jbGll
bnRfYmx0LmMKaW5kZXggNGUzNmQ0ODk3ZWE2Li5jYzc4MjU2OTc2NWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY2xpZW50X2JsdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY2xpZW50X2Js
dC5jCkBAIC00Nyw3ICs0Nyw3IEBAIHN0YXRpYyBpbnQgX19pZ3RfY2xpZW50X2ZpbGwoc3RydWN0
IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQogCQkJZ290byBlcnJfZmx1c2g7CiAJCX0KIAotCQl2
YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0IpOworCQl2YWRk
ciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0IpOwog
CQlpZiAoSVNfRVJSKHZhZGRyKSkgewogCQkJZXJyID0gUFRSX0VSUih2YWRkcik7CiAJCQlnb3Rv
IGVycl9wdXQ7CkBAIC0xNTksNyArMTU5LDcgQEAgc3RhdGljIGludCBwcmVwYXJlX2JsaXQoY29u
c3Qgc3RydWN0IHRpbGVkX2JsaXRzICp0LAogCXUzMiBzcmNfcGl0Y2gsIGRzdF9waXRjaDsKIAl1
MzIgY21kLCAqY3M7CiAKLQljcyA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKGJhdGNoLCBJOTE1
X01BUF9XQyk7CisJY3MgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChiYXRjaCwg
STkxNV9NQVBfV0MpOwogCWlmIChJU19FUlIoY3MpKQogCQlyZXR1cm4gUFRSX0VSUihjcyk7CiAK
QEAgLTM3OSw3ICszNzksNyBAQCBzdGF0aWMgaW50IHZlcmlmeV9idWZmZXIoY29uc3Qgc3RydWN0
IHRpbGVkX2JsaXRzICp0LAogCXkgPSBpOTE1X3ByYW5kb21fdTMyX21heF9zdGF0ZSh0LT5oZWln
aHQsIHBybmcpOwogCXAgPSB5ICogdC0+d2lkdGggKyB4OwogCi0JdmFkZHIgPSBpOTE1X2dlbV9v
YmplY3RfcGluX21hcChidWYtPnZtYS0+b2JqLCBJOTE1X01BUF9XQyk7CisJdmFkZHIgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChidWYtPnZtYS0+b2JqLCBJOTE1X01BUF9XQyk7
CiAJaWYgKElTX0VSUih2YWRkcikpCiAJCXJldHVybiBQVFJfRVJSKHZhZGRyKTsKIApAQCAtNTY2
LDcgKzU2Niw3IEBAIHN0YXRpYyBpbnQgdGlsZWRfYmxpdHNfcHJlcGFyZShzdHJ1Y3QgdGlsZWRf
YmxpdHMgKnQsCiAJaW50IGVycjsKIAlpbnQgaTsKIAotCW1hcCA9IGk5MTVfZ2VtX29iamVjdF9w
aW5fbWFwKHQtPnNjcmF0Y2gudm1hLT5vYmosIEk5MTVfTUFQX1dDKTsKKwltYXAgPSBpOTE1X2dl
bV9vYmplY3RfcGluX21hcF91bmxvY2tlZCh0LT5zY3JhdGNoLnZtYS0+b2JqLCBJOTE1X01BUF9X
Qyk7CiAJaWYgKElTX0VSUihtYXApKQogCQlyZXR1cm4gUFRSX0VSUihtYXApOwogCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
