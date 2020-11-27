Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AD2C64C0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5E26EC86;
	Fri, 27 Nov 2020 12:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA46EC34;
 Fri, 27 Nov 2020 12:09:23 +0000 (UTC)
IronPort-SDR: Ppn/KNaYfnEhtMTVBrioZE9DvSTi90JwGtJTUsxMGY1z7sphx4JBO+hBLrYTPUTjZoSDWZXC0q
 ZnjosuA8gvIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540660"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540660"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:23 -0800
IronPort-SDR: h3GaLl+Cvg3DWXRC3rFJbaHgrS9BkSo1en7ayR5HMYVUF8gP+eRXKn/BsY+N+CSj207iM+wlZ8
 RPXyIPmaHQTQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028946"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 063/162] drm/i915/selftests: Prepare mocs tests for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:39 +0000
Message-Id: <20201127120718.454037-64-matthew.auld@intel.com>
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
bT4KClVzZSBwaW5fbWFwX3VubG9ja2VkIHdoZW4gd2UncmUgbm90IGhvbGRpbmcgbG9ja3MuCgpT
aWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXgu
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X21vY3MuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X21vY3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X21vY3MuYwppbmRleCAyMWRjZDkxY2JkNjIuLmVh
ZGI0MWI3NmQzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rf
bW9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X21vY3MuYwpAQCAt
MTA1LDcgKzEwNSw3IEBAIHN0YXRpYyBpbnQgbGl2ZV9tb2NzX2luaXQoc3RydWN0IGxpdmVfbW9j
cyAqYXJnLCBzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQogCWlmIChJU19FUlIoYXJnLT5zY3JhdGNoKSkK
IAkJcmV0dXJuIFBUUl9FUlIoYXJnLT5zY3JhdGNoKTsKIAotCWFyZy0+dmFkZHIgPSBpOTE1X2dl
bV9vYmplY3RfcGluX21hcChhcmctPnNjcmF0Y2gtPm9iaiwgSTkxNV9NQVBfV0IpOworCWFyZy0+
dmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChhcmctPnNjcmF0Y2gtPm9i
aiwgSTkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIoYXJnLT52YWRkcikpIHsKIAkJZXJyID0gUFRS
X0VSUihhcmctPnZhZGRyKTsKIAkJZ290byBlcnJfc2NyYXRjaDsKLS0gCjIuMjYuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
