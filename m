Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAF2C64B1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD536EC67;
	Fri, 27 Nov 2020 12:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F306EC67;
 Fri, 27 Nov 2020 12:09:15 +0000 (UTC)
IronPort-SDR: vaBND6af60zTVP/QbCUDnqJCFjoYn3q25ftJHKSGKoVA0ZwyuuFTxXDzg0SlslYRLGUuivsgj5
 WY3nfAsfFCOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540636"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540636"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:10 -0800
IronPort-SDR: f0kDsLYZ6pGVygGTMmBmh6mBaP5QhEsHObtweWBwU0Cpuv8Agf623qTNUSxp7jWUTcX0EyBEWb
 eXv1nhvOKpvQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028892"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 056/162] drm/i915/selftests: Prepare mman testcases for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:32 +0000
Message-Id: <20201127120718.454037-57-matthew.auld@intel.com>
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
bT4KCkVuc3VyZSB3ZSBob2xkIHRoZSBsb2NrIGFyb3VuZCBwdXRfcGFnZXMsIGFuZCB1c2UgdGhl
IHVubG9ja2VkIHdyYXBwZXJzCmZvciBwaW5uaW5nIHBhZ2VzIGFuZCBtYXBwaW5ncy4KClNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9t
bWFuLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxm
dGVzdHMvaTkxNV9nZW1fbW1hbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0
cy9pOTE1X2dlbV9tbWFuLmMKaW5kZXggM2FjNzYyOGYzYmM0Li44NWZmZjhiZWQwOGMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fbW1hbi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fbW1hbi5j
CkBAIC0zMjEsNyArMzIxLDcgQEAgc3RhdGljIGludCBpZ3RfcGFydGlhbF90aWxpbmcodm9pZCAq
YXJnKQogCWlmIChJU19FUlIob2JqKSkKIAkJcmV0dXJuIFBUUl9FUlIob2JqKTsKIAotCWVyciA9
IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsKKwllcnIgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX3BhZ2VzX3VubG9ja2VkKG9iaik7CiAJaWYgKGVycikgewogCQlwcl9lcnIoIkZhaWxlZCB0
byBhbGxvY2F0ZSAldSBwYWdlcyAoJWx1IHRvdGFsKSwgZXJyPSVkXG4iLAogCQkgICAgICAgbnJl
YWwsIG9iai0+YmFzZS5zaXplIC8gUEFHRV9TSVpFLCBlcnIpOwpAQCAtNDU4LDcgKzQ1OCw3IEBA
IHN0YXRpYyBpbnQgaWd0X3Ntb2tlX3RpbGluZyh2b2lkICphcmcpCiAJaWYgKElTX0VSUihvYmop
KQogCQlyZXR1cm4gUFRSX0VSUihvYmopOwogCi0JZXJyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9w
YWdlcyhvYmopOworCWVyciA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXNfdW5sb2NrZWQob2Jq
KTsKIAlpZiAoZXJyKSB7CiAJCXByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlICV1IHBhZ2VzICgl
bHUgdG90YWwpLCBlcnI9JWRcbiIsCiAJCSAgICAgICBucmVhbCwgb2JqLT5iYXNlLnNpemUgLyBQ
QUdFX1NJWkUsIGVycik7CkBAIC03OTcsNyArNzk3LDcgQEAgc3RhdGljIGludCB3Y19zZXQoc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikKIHsKIAl2b2lkICp2YWRkcjsKIAotCXZhZGRy
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQyk7CisJdmFkZHIgPSBp
OTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dDKTsKIAlpZiAo
SVNfRVJSKHZhZGRyKSkKIAkJcmV0dXJuIFBUUl9FUlIodmFkZHIpOwogCkBAIC04MTMsNyArODEz
LDcgQEAgc3RhdGljIGludCB3Y19jaGVjayhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
KQogCXZvaWQgKnZhZGRyOwogCWludCBlcnIgPSAwOwogCi0JdmFkZHIgPSBpOTE1X2dlbV9vYmpl
Y3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9w
aW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0MpOwogCWlmIChJU19FUlIodmFkZHIpKQog
CQlyZXR1cm4gUFRSX0VSUih2YWRkcik7CiAKQEAgLTEzMTUsNyArMTMxNSw5IEBAIHN0YXRpYyBp
bnQgX19pZ3RfbW1hcF9yZXZva2Uoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsCiAJfQog
CiAJaWYgKHR5cGUgIT0gSTkxNV9NTUFQX1RZUEVfR1RUKSB7CisJCWk5MTVfZ2VtX29iamVjdF9s
b2NrKG9iaiwgTlVMTCk7CiAJCV9faTkxNV9nZW1fb2JqZWN0X3B1dF9wYWdlcyhvYmopOworCQlp
OTE1X2dlbV9vYmplY3RfdW5sb2NrKG9iaik7CiAJCWlmIChpOTE1X2dlbV9vYmplY3RfaGFzX3Bh
Z2VzKG9iaikpIHsKIAkJCXByX2VycigiRmFpbGVkIHRvIHB1dC1wYWdlcyBvYmplY3QhXG4iKTsK
IAkJCWVyciA9IC1FSU5WQUw7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
