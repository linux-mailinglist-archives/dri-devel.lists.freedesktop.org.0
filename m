Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CAA2C64DD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9A16EC9B;
	Fri, 27 Nov 2020 12:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400AE6EC8C;
 Fri, 27 Nov 2020 12:09:44 +0000 (UTC)
IronPort-SDR: yZb+a4+Or8nw76saO+vzz6elY2oXgs+OQr99+EMgfR4kaC10KyniyvlHc4nw7sVVoe8V9VypYf
 3oEF2eEy/OhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540704"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540704"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:44 -0800
IronPort-SDR: eAaaO6e99vJzB6yTL0ltAoFSmFW7+TinyWLwH5ihoByaN9UeV2SM4v+OLWkibnlZ69pCd0oFPr
 084yCR9IEaXg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029061"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 075/162] drm/i915: Introduce a for_i915_gem_ww(){}
Date: Fri, 27 Nov 2020 12:05:51 +0000
Message-Id: <20201127120718.454037-76-matthew.auld@intel.com>
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

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKSW50
cm9kdWNlIGEgZm9yX2k5MTVfZ2VtX3d3KCl7fSB1dGlsaXR5IHRvIGhlbHAgbWFrZSB0aGUgY29k
ZQphcm91bmQgYSB3dyB0cmFuc2FjdGlvbiBtb3JlIHJlYWRhYmxlLgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgpDYzogTWF0dGhl
dyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZ2VtX3d3LmggfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fd3cuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZ2VtX3d3LmgKaW5kZXggZjJkODc2OWU0MTE4Li5mNmIxYTc5NjY2N2IgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3d3LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9nZW1fd3cuaApAQCAtMTEsMTEgKzExLDQwIEBAIHN0cnVjdCBpOTE1X2dl
bV93d19jdHggewogCXN0cnVjdCB3d19hY3F1aXJlX2N0eCBjdHg7CiAJc3RydWN0IGxpc3RfaGVh
ZCBvYmpfbGlzdDsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqY29udGVuZGVkOwotCWJv
b2wgaW50cjsKKwl1bnNpZ25lZCBzaG9ydCBpbnRyOworCXVuc2lnbmVkIHNob3J0IGxvb3A7CiB9
OwogCiB2b2lkIGk5MTVfZ2VtX3d3X2N0eF9pbml0KHN0cnVjdCBpOTE1X2dlbV93d19jdHggKmN0
eCwgYm9vbCBpbnRyKTsKIHZvaWQgaTkxNV9nZW1fd3dfY3R4X2Zpbmkoc3RydWN0IGk5MTVfZ2Vt
X3d3X2N0eCAqY3R4KTsKIGludCBfX211c3RfY2hlY2sgaTkxNV9nZW1fd3dfY3R4X2JhY2tvZmYo
c3RydWN0IGk5MTVfZ2VtX3d3X2N0eCAqY3R4KTsKIHZvaWQgaTkxNV9nZW1fd3dfdW5sb2NrX3Np
bmdsZShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKTsKKworLyogSW50ZXJuYWwgZnVu
Y3Rpb25zIHVzZWQgYnkgdGhlIGlubGluZXMhIERvbid0IHVzZS4gKi8KK3N0YXRpYyBpbmxpbmUg
aW50IF9faTkxNV9nZW1fd3dfZmluaShzdHJ1Y3QgaTkxNV9nZW1fd3dfY3R4ICp3dywgaW50IGVy
cikKK3sKKwl3dy0+bG9vcCA9IDA7CisJaWYgKGVyciA9PSAtRURFQURMSykgeworCQllcnIgPSBp
OTE1X2dlbV93d19jdHhfYmFja29mZih3dyk7CisJCWlmICghZXJyKQorCQkJd3ctPmxvb3AgPSAx
OworCX0KKworCWlmICghd3ctPmxvb3ApCisJCWk5MTVfZ2VtX3d3X2N0eF9maW5pKHd3KTsKKwor
CXJldHVybiBlcnI7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZAorX19pOTE1X2dlbV93d19pbml0
KHN0cnVjdCBpOTE1X2dlbV93d19jdHggKnd3LCBib29sIGludHIpCit7CisJaTkxNV9nZW1fd3df
Y3R4X2luaXQod3csIGludHIpOworCXd3LT5sb29wID0gMTsKK30KKworI2RlZmluZSBmb3JfaTkx
NV9nZW1fd3coX3d3LCBfZXJyLCBfaW50cikJCQlcCisJZm9yIChfX2k5MTVfZ2VtX3d3X2luaXQo
X3d3LCBfaW50cik7IChfd3cpLT5sb29wOwlcCisJICAgICBfZXJyID0gX19pOTE1X2dlbV93d19m
aW5pKF93dywgX2VycikpCisKICNlbmRpZgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
