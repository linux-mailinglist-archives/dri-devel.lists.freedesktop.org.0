Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E92C6592
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0406EDC3;
	Fri, 27 Nov 2020 12:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605306EDA3;
 Fri, 27 Nov 2020 12:12:27 +0000 (UTC)
IronPort-SDR: CwA9oD86XBYAlEFhmf0q5ogZC1xe9TKRRwnkbeGbkHFRPjxyyOXA6QwN4kwBoG1A6Y2vhp3w7+
 HEDa0eptJ/YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883879"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883879"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:27 -0800
IronPort-SDR: IhFkjbhVvGdQBd9le1jEpIpG0dfKhSKhP4RZdYEocNA1sSzA1cM4wQ1MrFSF1tDjG61S8RP2Cm
 pTG7AECRcmNw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030060"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 156/162] drm/i915: Use a ww transaction in
 i915_gem_object_pin_map_unlocked()
Date: Fri, 27 Nov 2020 12:07:12 +0000
Message-Id: <20201127120718.454037-157-matthew.auld@intel.com>
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

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKQnkg
dXNpbmcgYSB3dyB0cmFuc2FjdGlvbiwgYW55Ym9keSB1c2luZyB0aGlzIGZ1bmN0aW9uIGFuZCBl
bmRpbmcgdXAKZXZpY3Rpbmcgb2JqZWN0cyBjYW4gdXNlIHNsZWVwaW5nIHdhaXRzIHdoZW4gbG9j
a2luZyBvYmplY3RzIHRvIGV2aWN0LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0g
PHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgpDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1
bGRAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9wYWdl
cy5jIHwgMTcgKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9wYWdlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3Bh
Z2VzLmMKaW5kZXggZDBmM2RhMDkyNWY1Li4wYzIwZjliMTg5NTYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9wYWdlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9wYWdlcy5jCkBAIC00MjUsMTEgKzQyNSwyMiBAQCB2b2lkICpp
OTE1X2dlbV9vYmplY3RfcGluX21hcChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAog
dm9pZCAqaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoc3RydWN0IGRybV9pOTE1X2dl
bV9vYmplY3QgKm9iaiwKIAkJCQkgICAgICAgZW51bSBpOTE1X21hcF90eXBlIHR5cGUpCiB7CisJ
c3RydWN0IGk5MTVfZ2VtX3d3X2N0eCB3dzsKIAl2b2lkICpyZXQ7CisJaW50IGVycjsKIAotCWk5
MTVfZ2VtX29iamVjdF9sb2NrKG9iaiwgTlVMTCk7Ci0JcmV0ID0gaTkxNV9nZW1fb2JqZWN0X3Bp
bl9tYXAob2JqLCB0eXBlKTsKLQlpOTE1X2dlbV9vYmplY3RfdW5sb2NrKG9iaik7CisJZm9yX2k5
MTVfZ2VtX3d3KCZ3dywgZXJyLCBmYWxzZSkgeworCQllcnIgPSBpOTE1X2dlbV9vYmplY3RfbG9j
ayhvYmosICZ3dyk7CisJCWlmIChlcnIpCisJCQljb250aW51ZTsKKworCQlyZXQgPSBpOTE1X2dl
bV9vYmplY3RfcGluX21hcChvYmosIHR5cGUpOworCQlpZiAoSVNfRVJSKHJldCkpCisJCQllcnIg
PSBQVFJfRVJSKHJldCk7CisJCS8qIEltcGxpY2l0IHVubG9jayAqLworCX0KKwlpZiAoZXJyKQor
CQlyZXR1cm4gRVJSX1BUUihlcnIpOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMjYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
