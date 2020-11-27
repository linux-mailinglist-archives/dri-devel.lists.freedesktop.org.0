Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9C2C650A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498AF6ECBE;
	Fri, 27 Nov 2020 12:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D781A6ECBB;
 Fri, 27 Nov 2020 12:10:20 +0000 (UTC)
IronPort-SDR: 8AUnDuOmnY+XXpQnBOr1pFCATIe3M/IVzr95ulXB2qDLsRdCbVSjJh/SujrdCXC4f1wYw52yi6
 PRj/LzVuXuBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092755"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092755"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:20 -0800
IronPort-SDR: dfo2FXoahb7shSdft2YBOHfwUctCar/IgPE/JXE+iLkw2wgB2VMNE1hiDsvr3HbcKW3H6iw7nu
 RdZJ77gulaaw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029325"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 093/162] drm/i915/lmem: allocate cmd ring in lmem
Date: Fri, 27 Nov 2020 12:06:09 +0000
Message-Id: <20201127120718.454037-94-matthew.auld@intel.com>
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
Cc: Michel Thierry <michel.thierry@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIFRoaWVycnkgPG1pY2hlbC50aGllcnJ5QGludGVsLmNvbT4KClNpZ25lZC1v
ZmYtYnk6IE1pY2hlbCBUaGllcnJ5IDxtaWNoZWwudGhpZXJyeUBpbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KQ2M6IEpvb25hcyBM
YWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IEFiZGllbCBKYW51
bGd1ZSA8YWJkaWVsLmphbnVsZ3VlQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9yaW5nLmMgfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3JpbmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX3JpbmcuYwppbmRleCBkNjM2YzZlZDg4YjcuLmFhNzVlNjQ0ZjNmMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX3JpbmcuYwpAQCAtNCw2ICs0LDcgQEAKICAqIENvcHlyaWdodCDC
qSAyMDE5IEludGVsIENvcnBvcmF0aW9uCiAgKi8KIAorI2luY2x1ZGUgImdlbS9pOTE1X2dlbV9s
bWVtLmgiCiAjaW5jbHVkZSAiZ2VtL2k5MTVfZ2VtX29iamVjdC5oIgogI2luY2x1ZGUgImk5MTVf
ZHJ2LmgiCiAjaW5jbHVkZSAiaTkxNV92bWEuaCIKQEAgLTExMSwxMCArMTEyLDE2IEBAIHN0YXRp
YyBzdHJ1Y3QgaTkxNV92bWEgKmNyZWF0ZV9yaW5nX3ZtYShzdHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0
LCBpbnQgc2l6ZSkKIAlzdHJ1Y3QgaTkxNV92bWEgKnZtYTsKIAogCW9iaiA9IEVSUl9QVFIoLUVO
T0RFVik7Ci0JaWYgKGk5MTVfZ2d0dF9oYXNfYXBlcnR1cmUoZ2d0dCkpCi0JCW9iaiA9IGk5MTVf
Z2VtX29iamVjdF9jcmVhdGVfc3RvbGVuKGk5MTUsIHNpemUpOwotCWlmIChJU19FUlIob2JqKSkK
LQkJb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9pbnRlcm5hbChpOTE1LCBzaXplKTsKKwlp
ZiAoSEFTX0xNRU0oaTkxNSkpIHsKKwkJb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9sbWVt
KGk5MTUsIHNpemUsCisJCQkJCQkgIEk5MTVfQk9fQUxMT0NfQ09OVElHVU9VUyB8CisJCQkJCQkg
IEk5MTVfQk9fQUxMT0NfVk9MQVRJTEUpOworCX0gZWxzZSB7CisJCWlmIChpOTE1X2dndHRfaGFz
X2FwZXJ0dXJlKGdndHQpKQorCQkJb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4o
aTkxNSwgc2l6ZSk7CisJCWlmIChJU19FUlIob2JqKSkKKwkJCW9iaiA9IGk5MTVfZ2VtX29iamVj
dF9jcmVhdGVfaW50ZXJuYWwoaTkxNSwgc2l6ZSk7CisJfQogCWlmIChJU19FUlIob2JqKSkKIAkJ
cmV0dXJuIEVSUl9DQVNUKG9iaik7CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
