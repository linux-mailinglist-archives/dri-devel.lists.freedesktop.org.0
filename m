Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F53BD5C3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 02:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9089A6EB13;
	Wed, 25 Sep 2019 00:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1556EB13;
 Wed, 25 Sep 2019 00:41:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 17:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,546,1559545200"; d="scan'208";a="390043853"
Received: from unknown (HELO chromeserver.iind.intel.com) ([10.223.246.82])
 by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2019 17:41:14 -0700
From: srinivasan.s@intel.com
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 manasi.d.navare@intel.com, ville.syrjala@linux.intel.com,
 lakshminarayana.vudum@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Date: Wed, 25 Sep 2019 06:05:42 +0530
Message-Id: <1569371742-109402-1-git-send-email-srinivasan.s@intel.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Srinivasan S <srinivasan.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgoKVGhpcyBwYXRjaCBh
dm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgdHJ5
aW5nCnRvIHVwZGF0ZSB0aGUgcGF5bG9hZCB0byB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZp
Y2UuIEFmdGVyIERQIE1TVApkZXZpY2UgaXMgZGlzY29ubmVjdGVkIHdlIHNob3VsZCBub3QgYmUg
dXBkYXRpbmcgdGhlIHBheWxvYWQgYW5kCmhlbmNlIHJlbW92ZSB0aGUgZXJyb3IuCgp2MjogUmVt
b3ZlZCB0aGUgY29ubmVjdG9yIHN0YXR1cyBjaGVjayBhbmQgY29udmVydGVkIGZyb20gZXJyb3Ig
dG8gZGVidWcuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTExNjMyClNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzYW4gUyA8c3Jpbml2YXNhbi5z
QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKaW5kZXggZWVl
YjNmOTMzYWE0Li40OTdhNmFlMGQyYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcF9tc3QuYwpAQCAtMjE1LDcgKzIxNSw3IEBAIHN0YXRpYyB2b2lkIGludGVsX21z
dF9kaXNhYmxlX2RwKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCiAJcmV0ID0gZHJt
X2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21ncik7CiAJaWYgKHJldCkg
ewotCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsKKwkJ
RFJNX0RFQlVHX0tNUygiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOwogCX0K
IAlpZiAob2xkX2NydGNfc3RhdGUtPmhhc19hdWRpbykKIAkJaW50ZWxfYXVkaW9fY29kZWNfZGlz
YWJsZShlbmNvZGVyLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
