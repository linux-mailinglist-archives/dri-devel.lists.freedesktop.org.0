Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B322C64A9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2C16EC68;
	Fri, 27 Nov 2020 12:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00316EC6F;
 Fri, 27 Nov 2020 12:09:02 +0000 (UTC)
IronPort-SDR: 9ZsP3sYY+XvffMyCQgjExrouCIartu8+kt9QrRQikiSBNzPVK/C9BaNtJkI4l/heftWlO2B4uw
 BErAD1VuB+/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540621"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:02 -0800
IronPort-SDR: QURbEUOS3uI/SOH6w1FRIOgSwMxJhBhQjFAMhgsuAVXoij0fug1kwQu4NyK/JjVcZQIJZhM75X
 lSLUxpG0Y5OA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028848"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 053/162] drm/i915/selftests: Prepare context tests for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:29 +0000
Message-Id: <20201127120718.454037-54-matthew.auld@intel.com>
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
ZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb250ZXh0LmMgfCAxMCArKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY29udGV4
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb250ZXh0
LmMKaW5kZXggZDNmODdkYzRlZGEzLi41ZmVmNTkyMzkwY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY29udGV4dC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY29udGV4dC5jCkBAIC0xMDk0
LDcgKzEwOTQsNyBAQCBfX3JlYWRfc2xpY2VfY291bnQoc3RydWN0IGludGVsX2NvbnRleHQgKmNl
LAogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0JYnVmID0gaTkxNV9nZW1fb2JqZWN0
X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJYnVmID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9t
YXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VSUihidWYpKSB7CiAJCXJl
dCA9IFBUUl9FUlIoYnVmKTsKIAkJcmV0dXJuIHJldDsKQEAgLTE1MTEsNyArMTUxMSw3IEBAIHN0
YXRpYyBpbnQgd3JpdGVfdG9fc2NyYXRjaChzdHJ1Y3QgaTkxNV9nZW1fY29udGV4dCAqY3R4LAog
CWlmIChJU19FUlIob2JqKSkKIAkJcmV0dXJuIFBUUl9FUlIob2JqKTsKIAotCWNtZCA9IGk5MTVf
Z2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0IpOworCWNtZCA9IGk5MTVfZ2VtX29i
amVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIoY21k
KSkgewogCQllcnIgPSBQVFJfRVJSKGNtZCk7CiAJCWdvdG8gb3V0OwpAQCAtMTYyMiw3ICsxNjIy
LDcgQEAgc3RhdGljIGludCByZWFkX2Zyb21fc2NyYXRjaChzdHJ1Y3QgaTkxNV9nZW1fY29udGV4
dCAqY3R4LAogCQlpZiAoZXJyKQogCQkJZ290byBvdXRfdm07CiAKLQkJY21kID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJCWNtZCA9IGk5MTVfZ2VtX29iamVj
dF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0IpOwogCQlpZiAoSVNfRVJSKGNtZCkp
IHsKIAkJCWVyciA9IFBUUl9FUlIoY21kKTsKIAkJCWdvdG8gb3V0OwpAQCAtMTY1OCw3ICsxNjU4
LDcgQEAgc3RhdGljIGludCByZWFkX2Zyb21fc2NyYXRjaChzdHJ1Y3QgaTkxNV9nZW1fY29udGV4
dCAqY3R4LAogCQlpZiAoZXJyKQogCQkJZ290byBvdXRfdm07CiAKLQkJY21kID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJCWNtZCA9IGk5MTVfZ2VtX29iamVj
dF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0IpOwogCQlpZiAoSVNfRVJSKGNtZCkp
IHsKIAkJCWVyciA9IFBUUl9FUlIoY21kKTsKIAkJCWdvdG8gb3V0OwpAQCAtMTcxNSw3ICsxNzE1
LDcgQEAgc3RhdGljIGludCByZWFkX2Zyb21fc2NyYXRjaChzdHJ1Y3QgaTkxNV9nZW1fY29udGV4
dCAqY3R4LAogCWlmIChlcnIpCiAJCWdvdG8gb3V0X3ZtOwogCi0JY21kID0gaTkxNV9nZW1fb2Jq
ZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJY21kID0gaTkxNV9nZW1fb2JqZWN0X3Bp
bl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VSUihjbWQpKSB7CiAJ
CWVyciA9IFBUUl9FUlIoY21kKTsKIAkJZ290byBvdXRfdm07Ci0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
