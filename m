Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC712C64C4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543936EC8B;
	Fri, 27 Nov 2020 12:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707326EC86;
 Fri, 27 Nov 2020 12:09:28 +0000 (UTC)
IronPort-SDR: nZay8ztoS1pXd6EipYQB58AxBLli6CpLfgZk7HOIj84hPzi3JEQ8TWNUWVYwJe7ZYsQ98FKCsz
 lqi7YS9HJtDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540676"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:28 -0800
IronPort-SDR: 0dSdV/ZShU8jwQbH7nVvH4BiXsdi0vbrn3lSPBJoSvFpuDeX+1G3D/4u4mUXcuU4w1fTIATM9E
 zwWp9oFPn3lg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028969"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 066/162] drm/i915/selftests: Prepare i915_request tests
 for obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:42 +0000
Message-Id: <20201127120718.454037-67-matthew.auld@intel.com>
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
bT4KClN0cmFpZ2h0Zm9yd2FyZCBjb252ZXJzaW9uIGJ5IHVzaW5nIHVubG9ja2VkIHZlcnNpb25z
LgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvaTkxNV9y
ZXF1ZXN0LmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0
ZXN0cy9pOTE1X3JlcXVlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1
X3JlcXVlc3QuYwppbmRleCBlNDI0YTZkMWE2OGMuLjUxNGZhMTA5ZTQwZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfcmVxdWVzdC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1X3JlcXVlc3QuYwpAQCAtNjE5LDcgKzYxOSw3
IEBAIHN0YXRpYyBzdHJ1Y3QgaTkxNV92bWEgKmVtcHR5X2JhdGNoKHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICppOTE1KQogCWlmIChJU19FUlIob2JqKSkKIAkJcmV0dXJuIEVSUl9DQVNUKG9iaik7
CiAKLQljbWQgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dCKTsKKwlj
bWQgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dCKTsK
IAlpZiAoSVNfRVJSKGNtZCkpIHsKIAkJZXJyID0gUFRSX0VSUihjbWQpOwogCQlnb3RvIGVycjsK
QEAgLTc4MSw3ICs3ODEsNyBAQCBzdGF0aWMgc3RydWN0IGk5MTVfdm1hICpyZWN1cnNpdmVfYmF0
Y2goc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJaWYgKGVycikKIAkJZ290byBlcnI7
CiAKLQljbWQgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsKKwlj
bWQgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dDKTsK
IAlpZiAoSVNfRVJSKGNtZCkpIHsKIAkJZXJyID0gUFRSX0VSUihjbWQpOwogCQlnb3RvIGVycjsK
QEAgLTgxNiw3ICs4MTYsNyBAQCBzdGF0aWMgaW50IHJlY3Vyc2l2ZV9iYXRjaF9yZXNvbHZlKHN0
cnVjdCBpOTE1X3ZtYSAqYmF0Y2gpCiB7CiAJdTMyICpjbWQ7CiAKLQljbWQgPSBpOTE1X2dlbV9v
YmplY3RfcGluX21hcChiYXRjaC0+b2JqLCBJOTE1X01BUF9XQyk7CisJY21kID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoYmF0Y2gtPm9iaiwgSTkxNV9NQVBfV0MpOwogCWlmIChJ
U19FUlIoY21kKSkKIAkJcmV0dXJuIFBUUl9FUlIoY21kKTsKIApAQCAtMTA2OSw4ICsxMDY5LDgg
QEAgc3RhdGljIGludCBsaXZlX3NlcXVlbnRpYWxfZW5naW5lcyh2b2lkICphcmcpCiAJCWlmICgh
cmVxdWVzdFtpZHhdKQogCQkJYnJlYWs7CiAKLQkJY21kID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9t
YXAocmVxdWVzdFtpZHhdLT5iYXRjaC0+b2JqLAotCQkJCQkgICAgICBJOTE1X01BUF9XQyk7CisJ
CWNtZCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKHJlcXVlc3RbaWR4XS0+YmF0
Y2gtPm9iaiwKKwkJCQkJCSAgICAgICBJOTE1X01BUF9XQyk7CiAJCWlmICghSVNfRVJSKGNtZCkp
IHsKIAkJCSpjbWQgPSBNSV9CQVRDSF9CVUZGRVJfRU5EOwogCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
