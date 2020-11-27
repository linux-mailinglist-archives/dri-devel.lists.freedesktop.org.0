Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF42C646B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C9F6EC22;
	Fri, 27 Nov 2020 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DEE6EC22;
 Fri, 27 Nov 2020 12:08:20 +0000 (UTC)
IronPort-SDR: Hu68fXvhCAU8Xc2oZ+UBmVIycEVRj2IrrdzEBvIio6SCI6YapEQw8vaxZTiC42AxrWHQ68NOYJ
 nqucVk+YbW4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883429"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883429"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:19 -0800
IronPort-SDR: TH0vZ/CSedh5HRWzoh5MfLZnUqT79CmHhDDM4ZHxep/2Swq75v0sIMYYB51bjjvKfrp17A6fRG
 gGU0sE5SODAA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028695"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 029/162] drm/i915: Handle ww locking in init_status_page
Date: Fri, 27 Nov 2020 12:05:05 +0000
Message-Id: <20201127120718.454037-30-matthew.auld@intel.com>
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
bT4KClRyeSB0byBwaW4gdG8gZ2d0dCBmaXJzdCwgYW5kIHVzZSBhIGZ1bGwgd3cgbG9vcCB0byBo
YW5kbGUKZXZpY3Rpb24gY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ry
w7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYyB8IDM3ICsrKysrKysrKysrKysrKy0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYwppbmRleCA5N2NlYWY3MTE2ZTgu
LjQyMGM2YTM1ZjNlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
ZW5naW5lX2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX2Nz
LmMKQEAgLTYxOCw2ICs2MTgsNyBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX3N0YXR1c19wYWdlKHN0
cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIH0KIAogc3RhdGljIGludCBwaW5fZ2d0dF9z
dGF0dXNfcGFnZShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCisJCQkJc3RydWN0IGk5
MTVfZ2VtX3d3X2N0eCAqd3csCiAJCQkJc3RydWN0IGk5MTVfdm1hICp2bWEpCiB7CiAJdW5zaWdu
ZWQgaW50IGZsYWdzOwpAQCAtNjM4LDEyICs2MzksMTMgQEAgc3RhdGljIGludCBwaW5fZ2d0dF9z
dGF0dXNfcGFnZShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCiAJZWxzZQogCQlmbGFn
cyA9IFBJTl9ISUdIOwogCi0JcmV0dXJuIGk5MTVfZ2d0dF9waW4odm1hLCBOVUxMLCAwLCBmbGFn
cyk7CisJcmV0dXJuIGk5MTVfZ2d0dF9waW4odm1hLCB3dywgMCwgZmxhZ3MpOwogfQogCiBzdGF0
aWMgaW50IGluaXRfc3RhdHVzX3BhZ2Uoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQog
ewogCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmo7CisJc3RydWN0IGk5MTVfZ2VtX3d3
X2N0eCB3dzsKIAlzdHJ1Y3QgaTkxNV92bWEgKnZtYTsKIAl2b2lkICp2YWRkcjsKIAlpbnQgcmV0
OwpAQCAtNjY3LDMwICs2NjksMzkgQEAgc3RhdGljIGludCBpbml0X3N0YXR1c19wYWdlKHN0cnVj
dCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIAl2bWEgPSBpOTE1X3ZtYV9pbnN0YW5jZShvYmos
ICZlbmdpbmUtPmd0LT5nZ3R0LT52bSwgTlVMTCk7CiAJaWYgKElTX0VSUih2bWEpKSB7CiAJCXJl
dCA9IFBUUl9FUlIodm1hKTsKLQkJZ290byBlcnI7CisJCWdvdG8gZXJyX3B1dDsKIAl9CiAKKwlp
OTE1X2dlbV93d19jdHhfaW5pdCgmd3csIHRydWUpOworcmV0cnk6CisJcmV0ID0gaTkxNV9nZW1f
b2JqZWN0X2xvY2sob2JqLCAmd3cpOworCWlmICghcmV0ICYmICFIV1NfTkVFRFNfUEhZU0lDQUwo
ZW5naW5lLT5pOTE1KSkKKwkJcmV0ID0gcGluX2dndHRfc3RhdHVzX3BhZ2UoZW5naW5lLCAmd3cs
IHZtYSk7CisJaWYgKHJldCkKKwkJZ290byBlcnI7CisKIAl2YWRkciA9IGk5MTVfZ2VtX29iamVj
dF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIodmFkZHIpKSB7CiAJCXJl
dCA9IFBUUl9FUlIodmFkZHIpOwotCQlnb3RvIGVycjsKKwkJZ290byBlcnJfdW5waW47CiAJfQog
CiAJZW5naW5lLT5zdGF0dXNfcGFnZS5hZGRyID0gbWVtc2V0KHZhZGRyLCAwLCBQQUdFX1NJWkUp
OwogCWVuZ2luZS0+c3RhdHVzX3BhZ2Uudm1hID0gdm1hOwogCi0JaWYgKCFIV1NfTkVFRFNfUEhZ
U0lDQUwoZW5naW5lLT5pOTE1KSkgewotCQlyZXQgPSBwaW5fZ2d0dF9zdGF0dXNfcGFnZShlbmdp
bmUsIHZtYSk7Ci0JCWlmIChyZXQpCi0JCQlnb3RvIGVycl91bnBpbjsKLQl9Ci0KLQlyZXR1cm4g
MDsKLQogZXJyX3VucGluOgotCWk5MTVfZ2VtX29iamVjdF91bnBpbl9tYXAob2JqKTsKKwlpZiAo
cmV0KQorCQlpOTE1X3ZtYV91bnBpbih2bWEpOwogZXJyOgotCWk5MTVfZ2VtX29iamVjdF9wdXQo
b2JqKTsKKwlpZiAocmV0ID09IC1FREVBRExLKSB7CisJCXJldCA9IGk5MTVfZ2VtX3d3X2N0eF9i
YWNrb2ZmKCZ3dyk7CisJCWlmICghcmV0KQorCQkJZ290byByZXRyeTsKKwl9CisJaTkxNV9nZW1f
d3dfY3R4X2ZpbmkoJnd3KTsKK2Vycl9wdXQ6CisJaWYgKHJldCkKKwkJaTkxNV9nZW1fb2JqZWN0
X3B1dChvYmopOwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
