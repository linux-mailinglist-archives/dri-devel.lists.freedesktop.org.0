Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB62C645C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B396EC17;
	Fri, 27 Nov 2020 12:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97916EC14;
 Fri, 27 Nov 2020 12:07:53 +0000 (UTC)
IronPort-SDR: LpbMKyXzHMrrzNxZDWXaBuTvAR0ubpbotXDW1/xtL+6rC9MSPTleVVdrDFfc8CuXpSzr131V72
 hmDrQ537bU+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883376"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:50 -0800
IronPort-SDR: 3/UVE5ezsuwuD5y+Zcmd7xUGff23LYrqaNAJhk/hFGkOle1wzLe3QIrZTiEIkcxhyYh+i6g+zq
 wRXXQtkoEumw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028587"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:48 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 013/162] drm/i915: Add missing -EDEADLK handling to
 execbuf pinning, v2.
Date: Fri, 27 Nov 2020 12:04:49 +0000
Message-Id: <20201127120718.454037-14-matthew.auld@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCmk5MTVfdm1hX3BpbiBtYXkgZmFpbCB3aXRoIC1FREVBRExLIHdoZW4gd2Ugc3RhcnQgbG9j
a2luZyBwYWdlIHRhYmxlcywKc28gZW5zdXJlIHdlIGhhbmRsZSB0aGlzIGNvcnJlY3RseS4KCkNj
OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6
IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0t
CiAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgICAgfCAzNSArKysr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2V4ZWNidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVm
ZmVyLmMKaW5kZXggNjBhZmE2ZjgyNmQ2Li41NjhjODMyMWRjM2QgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwpAQCAtNDE5LDEzICs0MTksMTQg
QEAgc3RhdGljIHU2NCBlYl9waW5fZmxhZ3MoY29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9leGVj
X29iamVjdDIgKmVudHJ5LAogCXJldHVybiBwaW5fZmxhZ3M7CiB9CiAKLXN0YXRpYyBpbmxpbmUg
Ym9vbAorc3RhdGljIGlubGluZSBpbnQKIGViX3Bpbl92bWEoc3RydWN0IGk5MTVfZXhlY2J1ZmZl
ciAqZWIsCiAJICAgY29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjX29iamVjdDIgKmVudHJ5
LAogCSAgIHN0cnVjdCBlYl92bWEgKmV2KQogewogCXN0cnVjdCBpOTE1X3ZtYSAqdm1hID0gZXYt
PnZtYTsKIAl1NjQgcGluX2ZsYWdzOworCWludCBlcnI7CiAKIAlpZiAodm1hLT5ub2RlLnNpemUp
CiAJCXBpbl9mbGFncyA9IHZtYS0+bm9kZS5zdGFydDsKQEAgLTQzNywyNCArNDM4LDI5IEBAIGVi
X3Bpbl92bWEoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIsCiAJCXBpbl9mbGFncyB8PSBQSU5f
R0xPQkFMOwogCiAJLyogQXR0ZW1wdCB0byByZXVzZSB0aGUgY3VycmVudCBsb2NhdGlvbiBpZiBh
dmFpbGFibGUgKi8KLQkvKiBUT0RPOiBBZGQgLUVERUFETEsgaGFuZGxpbmcgaGVyZSAqLwotCWlm
ICh1bmxpa2VseShpOTE1X3ZtYV9waW5fd3codm1hLCAmZWItPnd3LCAwLCAwLCBwaW5fZmxhZ3Mp
KSkgeworCWVyciA9IGk5MTVfdm1hX3Bpbl93dyh2bWEsICZlYi0+d3csIDAsIDAsIHBpbl9mbGFn
cyk7CisJaWYgKGVyciA9PSAtRURFQURMSykKKwkJcmV0dXJuIGVycjsKKworCWlmICh1bmxpa2Vs
eShlcnIpKSB7CiAJCWlmIChlbnRyeS0+ZmxhZ3MgJiBFWEVDX09CSkVDVF9QSU5ORUQpCi0JCQly
ZXR1cm4gZmFsc2U7CisJCQlyZXR1cm4gZXJyOwogCiAJCS8qIEZhaWxpbmcgdGhhdCBwaWNrIGFu
eSBfZnJlZV8gc3BhY2UgaWYgc3VpdGFibGUgKi8KLQkJaWYgKHVubGlrZWx5KGk5MTVfdm1hX3Bp
bl93dyh2bWEsICZlYi0+d3csCisJCWVyciA9IGk5MTVfdm1hX3Bpbl93dyh2bWEsICZlYi0+d3cs
CiAJCQkJCSAgICAgZW50cnktPnBhZF90b19zaXplLAogCQkJCQkgICAgIGVudHJ5LT5hbGlnbm1l
bnQsCiAJCQkJCSAgICAgZWJfcGluX2ZsYWdzKGVudHJ5LCBldi0+ZmxhZ3MpIHwKLQkJCQkJICAg
ICBQSU5fVVNFUiB8IFBJTl9OT0VWSUNUKSkpCi0JCQlyZXR1cm4gZmFsc2U7CisJCQkJCSAgICAg
UElOX1VTRVIgfCBQSU5fTk9FVklDVCk7CisJCWlmICh1bmxpa2VseShlcnIpKQorCQkJcmV0dXJu
IGVycjsKIAl9CiAKIAlpZiAodW5saWtlbHkoZXYtPmZsYWdzICYgRVhFQ19PQkpFQ1RfTkVFRFNf
RkVOQ0UpKSB7Ci0JCWlmICh1bmxpa2VseShpOTE1X3ZtYV9waW5fZmVuY2Uodm1hKSkpIHsKKwkJ
ZXJyID0gaTkxNV92bWFfcGluX2ZlbmNlKHZtYSk7CisJCWlmICh1bmxpa2VseShlcnIpKSB7CiAJ
CQlpOTE1X3ZtYV91bnBpbih2bWEpOwotCQkJcmV0dXJuIGZhbHNlOworCQkJcmV0dXJuIGVycjsK
IAkJfQogCiAJCWlmICh2bWEtPmZlbmNlKQpAQCAtNDYyLDcgKzQ2OCwxMCBAQCBlYl9waW5fdm1h
KHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIgKmViLAogCX0KIAogCWV2LT5mbGFncyB8PSBfX0VYRUNf
T0JKRUNUX0hBU19QSU47Ci0JcmV0dXJuICFlYl92bWFfbWlzcGxhY2VkKGVudHJ5LCB2bWEsIGV2
LT5mbGFncyk7CisJaWYgKGViX3ZtYV9taXNwbGFjZWQoZW50cnksIHZtYSwgZXYtPmZsYWdzKSkK
KwkJcmV0dXJuIC1FQkFEU0xUOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9p
ZApAQCAtOTAwLDcgKzkwOSwxMSBAQCBzdGF0aWMgaW50IGViX3ZhbGlkYXRlX3ZtYXMoc3RydWN0
IGk5MTVfZXhlY2J1ZmZlciAqZWIpCiAJCWlmIChlcnIpCiAJCQlyZXR1cm4gZXJyOwogCi0JCWlm
IChlYl9waW5fdm1hKGViLCBlbnRyeSwgZXYpKSB7CisJCWVyciA9IGViX3Bpbl92bWEoZWIsIGVu
dHJ5LCBldik7CisJCWlmIChlcnIgPT0gLUVERUFETEspCisJCQlyZXR1cm4gZXJyOworCisJCWlm
ICghZXJyKSB7CiAJCQlpZiAoZW50cnktPm9mZnNldCAhPSB2bWEtPm5vZGUuc3RhcnQpIHsKIAkJ
CQllbnRyeS0+b2Zmc2V0ID0gdm1hLT5ub2RlLnN0YXJ0IHwgVVBEQVRFOwogCQkJCWViLT5hcmdz
LT5mbGFncyB8PSBfX0VYRUNfSEFTX1JFTE9DOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
