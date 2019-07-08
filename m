Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FC6261E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B408989F92;
	Mon,  8 Jul 2019 16:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1358F89F92;
 Mon,  8 Jul 2019 16:21:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="248865893"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 08 Jul 2019 09:21:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:37 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/14] drm: Validate encoder->possible_clones
Date: Mon,  8 Jul 2019 19:20:47 +0300
Message-Id: <20190708162048.4286-14-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1h
bnkgZHJpdmVycyBhcmUgcG9wdWxhdGluZyBlbmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMgd3Jvbmcu
IExldCdzCnBlcnN1YWRlIHRoZW0gdG8gZ2V0IGl0IHJpZ2h0IGJ5IGFkZGluZyBzb21lIGxvdWQg
V0FSTnMuCgpXZSdsbCBjcm9zcyBjaGVjayB0aGUgYml0cyBiZXR3ZWVuIGFueSB0d28gZW5jb2Rl
cnMuIFNvIGVpdGhlcgpib3RoIGVuY29kZXJzIGNhbiBjbG9uZSB3aXRoIHRoZSBvdGhlciwgb3Ig
bmVpdGhlciBjYW4uCgpXZSdsbCBhbHNvIGNvbXBsYWluIGFib3V0IGVmZmVjdGl2ZWx5IGVtcHR5
IHBvc3NpYmxlX2Nsb25lcywgYW5kCnBvc3NpYmxlX2Nsb25lcyBjb250YWluaW5nIGJpdHMgZm9y
IGVuY29kZXJzIHRoYXQgZG9uJ3QgZXhpc3QuCgpUT0RPOiBPciBzaG91bGQgd2UganVzdCBzaWxl
bnRseSBmaWx0ZXIgb3V0IGFueSBiaXRzIGZvciBub24tZXhpc3RpbmcKZW5jb2RlcnM/Cgp2Mjog
ZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzIG5vdyBpbmNsdWRlcyB0aGUgZW5jb2RlciBpdGVsZgoK
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyB8IDMwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZW5jb2Rlci5jCmluZGV4IGU4N2U2ZmVjYzFmYi4uM2VjZTk3YTlkMDI5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VuY29kZXIuYwpAQCAtNzgsNiArNzgsMzQgQEAgc3RhdGljIHZvaWQgZml4dXBfcG9zc2li
bGVfY2xvbmVzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCWVuY29kZXItPnBvc3NpYmxlX2Ns
b25lcyB8PSBkcm1fZW5jb2Rlcl9tYXNrKGVuY29kZXIpOwogfQogCitzdGF0aWMgdm9pZCB2YWxp
ZGF0ZV9wb3NzaWJsZV9jbG9uZXMoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQoreworCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBlbmNvZGVyLT5kZXY7CisJc3RydWN0IGRybV9lbmNvZGVy
ICpvdGhlcjsKKwl1MzIgZW5jb2Rlcl9tYXNrID0gMDsKKworCWRybV9mb3JfZWFjaF9lbmNvZGVy
KG90aGVyLCBkZXYpIHsKKwkJZW5jb2Rlcl9tYXNrIHw9IGRybV9lbmNvZGVyX21hc2sob3RoZXIp
OworCisJCVdBUk4oIShlbmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMgJiBkcm1fZW5jb2Rlcl9tYXNr
KG90aGVyKSkgIT0KKwkJICAgICAhKG90aGVyLT5wb3NzaWJsZV9jbG9uZXMgJiBkcm1fZW5jb2Rl
cl9tYXNrKGVuY29kZXIpKSwKKwkJICAgICAicG9zc2libGVfY2xvbmVzIG1pc21hdGNoOiAiCisJ
CSAgICAgIltFTkNPREVSOiVkOiVzXSBtYXNrPTB4JXggcG9zc2libGVfY2xvbmVzPTB4JXggdnMu
ICIKKwkJICAgICAiW0VOQ09ERVI6JWQ6JXNdIG1hc2s9MHgleCBwb3NzaWJsZV9jbG9uZXM9MHgl
eFxuIiwKKwkJICAgICBlbmNvZGVyLT5iYXNlLmlkLCBlbmNvZGVyLT5uYW1lLAorCQkgICAgIGRy
bV9lbmNvZGVyX21hc2soZW5jb2RlciksIGVuY29kZXItPnBvc3NpYmxlX2Nsb25lcywKKwkJICAg
ICBvdGhlci0+YmFzZS5pZCwgb3RoZXItPm5hbWUsCisJCSAgICAgZHJtX2VuY29kZXJfbWFzayhv
dGhlciksIG90aGVyLT5wb3NzaWJsZV9jbG9uZXMpOworCX0KKworCVdBUk4oKGVuY29kZXItPnBv
c3NpYmxlX2Nsb25lcyAmIGRybV9lbmNvZGVyX21hc2soZW5jb2RlcikpID09IDAgfHwKKwkgICAg
IChlbmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMgJiB+ZW5jb2Rlcl9tYXNrKSAhPSAwLAorCSAgICAg
IkJvZ3VzIHBvc3NpYmxlX2Nsb25lczogIgorCSAgICAgIltFTkNPREVSOiVkOiVzXSBwb3NzaWJs
ZV9jbG9uZXM9MHgleCAoZnVsbCBlbmNvZGVyIG1hc2s9MHgleClcbiIsCisJICAgICBlbmNvZGVy
LT5iYXNlLmlkLCBlbmNvZGVyLT5uYW1lLAorCSAgICAgZW5jb2Rlci0+cG9zc2libGVfY2xvbmVz
LCBlbmNvZGVyX21hc2spOworfQorCiBpbnQgZHJtX2VuY29kZXJfcmVnaXN0ZXJfYWxsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwpAQCAt
ODYsNiArMTE0LDggQEAgaW50IGRybV9lbmNvZGVyX3JlZ2lzdGVyX2FsbChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQogCWZpeHVwX3Bvc3NpYmxlX2Nsb25lcyhkZXYpOwogCiAJZHJtX2Zvcl9lYWNo
X2VuY29kZXIoZW5jb2RlciwgZGV2KSB7CisJCXZhbGlkYXRlX3Bvc3NpYmxlX2Nsb25lcyhlbmNv
ZGVyKTsKKwogCQlpZiAoZW5jb2Rlci0+ZnVuY3MtPmxhdGVfcmVnaXN0ZXIpCiAJCQlyZXQgPSBl
bmNvZGVyLT5mdW5jcy0+bGF0ZV9yZWdpc3RlcihlbmNvZGVyKTsKIAkJaWYgKHJldCkKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
