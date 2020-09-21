Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5327226D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918EC6E266;
	Mon, 21 Sep 2020 11:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34966E26C;
 Mon, 21 Sep 2020 11:28:28 +0000 (UTC)
IronPort-SDR: f2F1YTlBGDvix0PRbeHlnJnD7Fr9UP0fQcFDHchTQ/UN0jm1qSkpRMlH2ZuFaDOvFqMXzP2HUz
 dV4dFAmGfevQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148107511"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148107511"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:28:28 -0700
IronPort-SDR: RyLwb35ErvFaZClXM7+Ha9qw1uiUBzy3Co1qBzzQLAAYd6lX6r3vWwhfPsyzKRb8X/SfHkoPvd
 viadxsDpN8/Q==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="454009064"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2020 04:28:25 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 2/8] drm/i915: Add support for async flips in I915
Date: Mon, 21 Sep 2020 16:32:04 +0530
Message-Id: <20200921110210.21182-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200921110210.21182-1-karthik.b.s@intel.com>
References: <20200921110210.21182-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSBBc3luYyBBZGRyZXNzIFVwZGF0ZSBFbmFibGUgYml0IGluIHBsYW5lIGN0bAp3aGVu
IGFzeW5jIGZsaXAgaXMgcmVxdWVzdGVkLgoKdjI6IC1Nb3ZlIHRoZSBBc3luYyBmbGlwIGVuYWJs
ZW1lbnQgdG8gaW5kaXZpZHVhbCBwYXRjaCAoUGF1bG8pCgp2MzogLVJlYmFzZWQuCgp2NDogLUFk
ZCBzZXBhcmF0ZSBwbGFuZSBob29rIGZvciBhc3luYyBmbGlwIGNhc2UgKFZpbGxlKQoKdjU6IC1S
ZWJhc2VkLgoKdjY6IC1Nb3ZlIHRoZSBwbGFuZSBob29rIHRvIHNlcGFyYXRlIHBhdGNoLiAoUGF1
bG8pCiAgICAtUmVtb3ZlIHRoZSBlYXJseSByZXR1cm4gaW4gc2tsX3BsYW5lX2N0bC4gKFBhdWxv
KQoKdjc6IC1Nb3ZlIGFzeW5jIGFkZHJlc3MgdXBkYXRlIGVuYWJsZSB0byBza2xfcGxhbmVfY3Rs
X2NydGMoKSAoVmlsbGUpCgp2ODogLVJlYmFzZWQuCgp2OTogLVJlYmFzZWQuCgp2MTA6IC1SZWJh
c2VkLgoKU2lnbmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4K
U2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5j
IHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggMTcxZDI5M2EwZDg4Li4zMGU4OTA4
ZWUyNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5j
CkBAIC00Nzg1LDYgKzQ3ODUsOSBAQCB1MzIgc2tsX3BsYW5lX2N0bF9jcnRjKGNvbnN0IHN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQogCXN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICpkZXZfcHJpdiA9IHRvX2k5MTUoY3J0Y19zdGF0ZS0+dWFwaS5jcnRjLT5kZXYpOwogCXUzMiBw
bGFuZV9jdGwgPSAwOwogCisJaWYgKGNydGNfc3RhdGUtPnVhcGkuYXN5bmNfZmxpcCkKKwkJcGxh
bmVfY3RsIHw9IFBMQU5FX0NUTF9BU1lOQ19GTElQOworCiAJaWYgKElOVEVMX0dFTihkZXZfcHJp
dikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCiAJCXJldHVybiBwbGFuZV9jdGw7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCmluZGV4IGQ4MDVkNGRhNjE4MS4uZTk0Y2ExZjhmNmIy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKQEAgLTY5MjMsNiArNjkyMyw3IEBAIGVudW0gewog
I2RlZmluZSAgIFBMQU5FX0NUTF9USUxFRF9YCQkJKDEgPDwgMTApCiAjZGVmaW5lICAgUExBTkVf
Q1RMX1RJTEVEX1kJCQkoNCA8PCAxMCkKICNkZWZpbmUgICBQTEFORV9DVExfVElMRURfWUYJCQko
NSA8PCAxMCkKKyNkZWZpbmUgICBQTEFORV9DVExfQVNZTkNfRkxJUAkJCSgxIDw8IDkpCiAjZGVm
aW5lICAgUExBTkVfQ1RMX0ZMSVBfSE9SSVpPTlRBTAkJKDEgPDwgOCkKICNkZWZpbmUgICBQTEFO
RV9DVExfTUVESUFfREVDT01QUkVTU0lPTl9FTkFCTEUJKDEgPDwgNCkgLyogVEdMKyAqLwogI2Rl
ZmluZSAgIFBMQU5FX0NUTF9BTFBIQV9NQVNLCQkJKDB4MyA8PCA0KSAvKiBQcmUtR0xLICovCi0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
