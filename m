Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEC27227A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACFB6E27A;
	Mon, 21 Sep 2020 11:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A806E27A;
 Mon, 21 Sep 2020 11:28:43 +0000 (UTC)
IronPort-SDR: MlSl6xzQ6idi491btU+lZCZRbVqToHBF+05nGwBYaOahYKb/S4vwITIuYZI+jRIH7gde4IDmFa
 wpqQ4SWGTNWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157738328"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="157738328"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:28:40 -0700
IronPort-SDR: CHCJa41bd0hiBAFVVl6kV2J7/1PF4gTNh8YKIFPCfKWW0YRb8+2VWi+R/LD94T+ISl08nK3L2P
 WCVyYpDaxE1g==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="454009234"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2020 04:28:36 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 4/8] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
Date: Mon, 21 Sep 2020 16:32:06 +0530
Message-Id: <20200921110210.21182-5-karthik.b.s@intel.com>
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

U2luY2UgdGhlIGZsaXAgZG9uZSBldmVudCB3aWxsIGJlIHNlbnQgaW4gdGhlIGZsaXBfZG9uZV9o
YW5kbGVyLApubyBuZWVkIHRvIGFkZCB0aGUgZXZlbnQgdG8gdGhlIGxpc3QgYW5kIGRlbGF5IGl0
IGZvciBsYXRlci4KCnYyOiAtTW92ZWQgdGhlIGFzeW5jIGNoZWNrIGFib3ZlIHZibGFua19nZXQg
YXMgaXQKICAgICB3YXMgY2F1c2luZyBpc3N1ZXMgZm9yIFBTUi4KCnYzOiAtTm8gbmVlZCB0byB3
YWl0IGZvciB2YmxhbmsgdG8gcGFzcywgYXMgdGhpcyB3YWl0IHdhcyBjYXVzaW5nIGEKICAgICAx
Nm1zIGRlbGF5IG9uY2UgZXZlcnkgZmV3IGZsaXBzLgoKdjQ6IC1SZWJhc2VkLgoKdjU6IC1SZWJh
c2VkLgoKdjY6IC1SZWJhc2VkLgoKdjc6IC1ObyBuZWVkIG9mIGlycSBkaXNhYmxlIGlmIHdlIGFy
ZSBub3QgZG9pbmcgdmJsYW5rIGV2YWRlLiAoVmlsbGUpCgp2ODogLVJlYmFzZWQuCgp2OTogLU1v
dmUgdGhlIHJldHVybiBpbiBpbnRlbF9waXBlX3VwZGF0ZV9lbmQgYmVmb3JlIHRyYWNlcG9pbnQu
IChWaWxsZSkKCnYxMDogUmViYXNlZC4KClNpZ25lZC1vZmYtYnk6IEthcnRoaWsgQiBTIDxrYXJ0
aGlrLmIuc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRp
dGEua3Vsa2FybmlAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Nwcml0ZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nw
cml0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwppbmRl
eCA2MzA0MGNiMGQ0ZTEuLjc2YTNkOWJmZTBkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Nwcml0ZS5jCkBAIC05Myw2ICs5Myw5IEBAIHZvaWQgaW50ZWxfcGlwZV91
cGRhdGVfc3RhcnQoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRl
KQogCURFRklORV9XQUlUKHdhaXQpOwogCXUzMiBwc3Jfc3RhdHVzOwogCisJaWYgKG5ld19jcnRj
X3N0YXRlLT51YXBpLmFzeW5jX2ZsaXApCisJCXJldHVybjsKKwogCXZibGFua19zdGFydCA9IGFk
anVzdGVkX21vZGUtPmNydGNfdmJsYW5rX3N0YXJ0OwogCWlmIChhZGp1c3RlZF9tb2RlLT5mbGFn
cyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQogCQl2Ymxhbmtfc3RhcnQgPSBESVZfUk9VTkRf
VVAodmJsYW5rX3N0YXJ0LCAyKTsKQEAgLTIwMCw2ICsyMDMsOSBAQCB2b2lkIGludGVsX3BpcGVf
dXBkYXRlX2VuZChzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUpCiAJa3Rp
bWVfdCBlbmRfdmJsX3RpbWUgPSBrdGltZV9nZXQoKTsKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGMtPmJhc2UuZGV2KTsKIAorCWlmIChuZXdfY3J0Y19z
dGF0ZS0+dWFwaS5hc3luY19mbGlwKQorCQlyZXR1cm47CisKIAl0cmFjZV9pbnRlbF9waXBlX3Vw
ZGF0ZV9lbmQoY3J0YywgZW5kX3ZibF9jb3VudCwgc2NhbmxpbmVfZW5kKTsKIAogCS8qIFdlJ3Jl
IHN0aWxsIGluIHRoZSB2YmxhbmstZXZhZGUgY3JpdGljYWwgc2VjdGlvbiwgdGhpcyBjYW4ndCBy
YWNlLgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
