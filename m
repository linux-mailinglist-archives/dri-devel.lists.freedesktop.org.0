Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5762616
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F2589FED;
	Mon,  8 Jul 2019 16:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BBE6E027;
 Mon,  8 Jul 2019 16:21:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="173302396"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 08 Jul 2019 09:21:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/14] drm/i915: Fix DP-MST crtc_mask
Date: Mon,  8 Jul 2019 19:20:43 +0300
Message-Id: <20190708162048.4286-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkVh
Y2ggZmFrZSBNU1QgZW5jb2RlciBpcyB0aWVkIHRvIGEgc3BlY2lmaWMgcGlwZS4gRml4IHRoZSBl
bmNvZGVyJ3MKY3J0Y19tYXNrIHRvIHJlZmxlY3QgdGhhdCBmYWN0LgoKUmV2aWV3ZWQtYnk6IERo
aW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwppbmRleCA2MDY1MmViYmRmNjEuLmQw
OGU0YTQ3ODE2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jCkBAIC02MDIsNyArNjAyLDcgQEAgaW50ZWxfZHBfY3JlYXRlX2Zha2VfbXN0X2VuY29kZXIo
c3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsIGVudW0KIAlpbnRlbF9l
bmNvZGVyLT50eXBlID0gSU5URUxfT1VUUFVUX0RQX01TVDsKIAlpbnRlbF9lbmNvZGVyLT5wb3dl
cl9kb21haW4gPSBpbnRlbF9kaWdfcG9ydC0+YmFzZS5wb3dlcl9kb21haW47CiAJaW50ZWxfZW5j
b2Rlci0+cG9ydCA9IGludGVsX2RpZ19wb3J0LT5iYXNlLnBvcnQ7Ci0JaW50ZWxfZW5jb2Rlci0+
Y3J0Y19tYXNrID0gMHg3OworCWludGVsX2VuY29kZXItPmNydGNfbWFzayA9IEJJVChwaXBlKTsK
IAlpbnRlbF9lbmNvZGVyLT5jbG9uZWFibGUgPSAwOwogCiAJaW50ZWxfZW5jb2Rlci0+Y29tcHV0
ZV9jb25maWcgPSBpbnRlbF9kcF9tc3RfY29tcHV0ZV9jb25maWc7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
