Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33325FA0A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 14:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9B96E436;
	Mon,  7 Sep 2020 12:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6324F6E436;
 Mon,  7 Sep 2020 12:00:30 +0000 (UTC)
IronPort-SDR: s44T9RRXMemAb3193JkUdUzcm1cS0br8Z5L1a9GvuMOhwzZceImwPzvZao+LCT7gSkz2N6h56O
 ev5pbUCrxh9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="155394392"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="155394392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 05:00:29 -0700
IronPort-SDR: Q9oe8w2D1aacSqBy+0xrHEB8tlVM3zRanznLS9BHi03QWXBemgXnrtDMtEDDSgeFpYuHy2Qsi3
 h5qUR4dSu/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="343206228"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Sep 2020 05:00:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Sep 2020 15:00:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/atomic-helper: Extract
 drm_atomic_helper_calc_timestamping_constants()
Date: Mon,  7 Sep 2020 15:00:24 +0300
Message-Id: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClB1
dCB0aGUgdmJsYW5rIHRpbWVzdGFtcGluZyBjb25zdGFudHMgdXBkYXRlIGxvb3AgaW50byBpdHMg
b3duCmZ1bmN0aW9uLiBJdCBoYXMgbm8gYnVzaW5lc3MgbGl2aW5nIGluc2lkZQpkcm1fYXRvbWlj
X2hlbHBlcl91cGRhdGVfbGVnYWN5X21vZGVzZXRfc3RhdGUoKSBzbyB3ZSdsbCBiZSB3YW50aW5n
CnRvIG1vdmUgaXQgb3V0IGVudGlyZWx5LiBBcyBhIGZpcnN0IHN0ZXAgd2UnbGwgc3RpbGwgY2Fs
bCBpdApmcm9tIGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9sZWdhY3lfbW9kZXNldF9zdGF0ZSgp
LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDIyICsr
KysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9hdG9taWNfaGVscGVyLmggICAg
IHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCmluZGV4IDllMWFkNDkzZTY4OS4uNjcz
ZTNmYzI4MmQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwpAQCAtMTE4NiwxMyAr
MTE4NiwzMyBAQCBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfbGVnYWN5X21vZGVzZXRfc3RhdGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCWNydGMtPnggPSBuZXdfcGxhbmVfc3RhdGUtPnNy
Y194ID4+IDE2OwogCQkJY3J0Yy0+eSA9IG5ld19wbGFuZV9zdGF0ZS0+c3JjX3kgPj4gMTY7CiAJ
CX0KKwl9CiAKKwlkcm1fYXRvbWljX2hlbHBlcl9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMo
b2xkX3N0YXRlKTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX2xl
Z2FjeV9tb2Rlc2V0X3N0YXRlKTsKKworLyoqCisgKiBkcm1fYXRvbWljX2hlbHBlcl9jYWxjX3Rp
bWVzdGFtcGluZ19jb25zdGFudHMgLSB1cGRhdGUgdmJsYW5rIHRpbWVzdGFtcGluZyBjb25zdGFu
dHMKKyAqIEBzdGF0ZTogYXRvbWljIHN0YXRlIG9iamVjdAorICoKKyAqIFVwZGF0ZXMgdGhlIHRp
bWVzdGFtcGluZyBjb25zdGFudHMgdXNlZCBmb3IgcHJlY2lzZSB2YmxhbmsgdGltZXN0YW1wcwor
ICogYnkgY2FsbGluZyBkcm1fY2FsY190aW1lc3RhbXBpbmdfY29uc3RhbnRzKCkgZm9yIGFsbCBl
bmFibGVkIGNydGNzIGluIEBzdGF0ZS4KKyAqLwordm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jYWxj
X3RpbWVzdGFtcGluZ19jb25zdGFudHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQor
eworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7CisJc3RydWN0IGRybV9j
cnRjICpjcnRjOworCWludCBpOworCisJLyogc2V0IGxlZ2FjeSBzdGF0ZSBpbiB0aGUgY3J0YyBz
dHJ1Y3R1cmUgKi8KKwlmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0YywgbmV3
X2NydGNfc3RhdGUsIGkpIHsKIAkJaWYgKG5ld19jcnRjX3N0YXRlLT5lbmFibGUpCiAJCQlkcm1f
Y2FsY190aW1lc3RhbXBpbmdfY29uc3RhbnRzKGNydGMsCiAJCQkJCQkJJm5ld19jcnRjX3N0YXRl
LT5hZGp1c3RlZF9tb2RlKTsKIAl9CiB9Ci1FWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfaGVscGVy
X3VwZGF0ZV9sZWdhY3lfbW9kZXNldF9zdGF0ZSk7CitFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNf
aGVscGVyX2NhbGNfdGltZXN0YW1waW5nX2NvbnN0YW50cyk7CiAKIHN0YXRpYyB2b2lkCiBjcnRj
X3NldF9tb2RlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpvbGRfc3RhdGUpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBlci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaAppbmRleCBiMjY4MTgwYzk3ZWIuLjg1
ZGYwNGM4ZTYyZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBlci5oCkBAIC03NCw2ICs3NCw5IEBAIHZv
aWQKIGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9sZWdhY3lfbW9kZXNldF9zdGF0ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogCQkJCQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xk
X3N0YXRlKTsKIAordm9pZAorZHJtX2F0b21pY19oZWxwZXJfY2FsY190aW1lc3RhbXBpbmdfY29u
c3RhbnRzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7CisKIHZvaWQgZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X21vZGVzZXRfZGlzYWJsZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
IAkJCQkJICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7CiB2b2lkIGRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2VuYWJsZXMoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
