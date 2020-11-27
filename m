Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE582C6451
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2E26EC11;
	Fri, 27 Nov 2020 12:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95CA6EBB5;
 Fri, 27 Nov 2020 12:07:52 +0000 (UTC)
IronPort-SDR: 9y1Rxpijlb+/J1tPIDI4fHZ7m+bWyeIVqJ+k7fFXA6AkKBCXG0kF8xQk8lBS4QY/Ic8B95OK/X
 nqlZSrQ0ZMAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883364"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:43 -0800
IronPort-SDR: nSKJ34ijj3mKJSmvOw8VLWYCOCyTMuJ65Kjc9hy4ND+Vu/AzlTn2i/UWDlmhqP4jsyIaHGzkUc
 SCVt1i2jThgg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028548"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:07:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 009/162] drm/i915: Introduce drm_i915_lock_isolated
Date: Fri, 27 Nov 2020 12:04:45 +0000
Message-Id: <20201127120718.454037-10-matthew.auld@intel.com>
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

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKV2hl
biBhbiBvYmplY3QgaXMganVzdCBjcmVhdGVkIGFuZCBub3QgeWV0IHB1dCBvbiBhbnkgbGlzdHMs
IHRoZXJlJ3MKYSBzaW5nbGUgb3duZXIgYW5kIHRodXMgdHJ5bG9jayB3aWxsIGFsd2F5cyBzdWNj
ZWVkLiBJbnRyb2R1Y2UKZHJtX2k5MTVfbG9ja19pc29sYXRlZCB0byBhbm5vdGF0ZSB0cnlsb2Nr
IGluIHRoaXMgc2l0dWF0aW9uLgpUaGlzIGlzIHNpbWlsYXIgdG8gVFRNJ3MgY3JlYXRlX2xvY2tl
ZCgpIGZ1bmN0aW9uYWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+CkNjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5o
IHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmgKaW5kZXggYmUxNDQ4
NmY2M2E3Li5kNjExOTRlZjQ4NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9vYmplY3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fb2JqZWN0LmgKQEAgLTEwNyw2ICsxMDcsMTMgQEAgaTkxNV9nZW1fb2JqZWN0X3B1dChzdHJ1
Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogCiAjZGVmaW5lIGFzc2VydF9vYmplY3RfaGVs
ZChvYmopIGRtYV9yZXN2X2Fzc2VydF9oZWxkKChvYmopLT5iYXNlLnJlc3YpCiAKKyNkZWZpbmUg
b2JqZWN0X2lzX2lzb2xhdGVkKG9iaikJCQkJCVwKKwkoIUlTX0VOQUJMRUQoQ09ORklHX0xPQ0tE
RVApIHx8CQkJCVwKKwkgKChrcmVmX3JlYWQoJm9iai0+YmFzZS5yZWZjb3VudCkgPT0gMCkgfHwJ
CVwKKwkgICgoa3JlZl9yZWFkKCZvYmotPmJhc2UucmVmY291bnQpID09IDEpICYmCQlcCisJICAg
bGlzdF9lbXB0eV9jYXJlZnVsKCZvYmotPm1tLmxpbmspICYmCQkJXAorCSAgIGxpc3RfZW1wdHlf
Y2FyZWZ1bCgmb2JqLT52bWEubGlzdCkpKSkKKwogc3RhdGljIGlubGluZSBpbnQgX19pOTE1X2dl
bV9vYmplY3RfbG9jayhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAogCQkJCQkgc3Ry
dWN0IGk5MTVfZ2VtX3d3X2N0eCAqd3csCiAJCQkJCSBib29sIGludHIpCkBAIC0xNDcsNiArMTU0
LDE1IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpOTE1X2dlbV9vYmplY3RfdHJ5bG9jayhzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogCXJldHVybiBkbWFfcmVzdl90cnlsb2NrKG9iai0+
YmFzZS5yZXN2KTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIGk5MTVfZ2VtX29iamVjdF9sb2Nr
X2lzb2xhdGVkKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopCit7CisJaW50IHJldDsK
KworCVdBUk5fT04oIW9iamVjdF9pc19pc29sYXRlZChvYmopKTsKKwlyZXQgPSBkbWFfcmVzdl90
cnlsb2NrKG9iai0+YmFzZS5yZXN2KTsKKwlHRU1fV0FSTl9PTighcmV0KTsKK30KKwogc3RhdGlj
IGlubGluZSB2b2lkIGk5MTVfZ2VtX29iamVjdF91bmxvY2soc3RydWN0IGRybV9pOTE1X2dlbV9v
YmplY3QgKm9iaikKIHsKIAlkbWFfcmVzdl91bmxvY2sob2JqLT5iYXNlLnJlc3YpOwotLSAKMi4y
Ni4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
