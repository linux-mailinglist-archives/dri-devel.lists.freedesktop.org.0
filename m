Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D362621
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492F66E02B;
	Mon,  8 Jul 2019 16:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D46E02B;
 Mon,  8 Jul 2019 16:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="170326804"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Jul 2019 09:21:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/14] drm: Validate encoder->possible_crtcs
Date: Mon,  8 Jul 2019 19:20:48 +0300
Message-Id: <20190708162048.4286-15-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldB
Uk4gaWYgdGhlIGVuY29kZXIgcG9zc2libGVfY3J0Y3MgaXMgZWZmZWN0aXZlbHkgZW1wdHkgb3Ig
Y29udGFpbnMKYml0cyBmb3Igbm9uLWV4aXN0aW5nIGNydGNzLgoKVE9ETzogT3Igc2hvdWxkIHdl
IHBlcmhhcHN0IGp1c3QgZmlsdGVyIG91dCBhbnkgYml0IGZvciBhCm5vbi1leGlzaXRpbmcgY3J0
Yz8KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgfCAxOCArKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vu
Y29kZXIuYwppbmRleCAzZWNlOTdhOWQwMjkuLjA3MTkxZTJkYjY0YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lbmNv
ZGVyLmMKQEAgLTEwNiw2ICsxMDYsMjMgQEAgc3RhdGljIHZvaWQgdmFsaWRhdGVfcG9zc2libGVf
Y2xvbmVzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAkgICAgIGVuY29kZXItPnBvc3Np
YmxlX2Nsb25lcywgZW5jb2Rlcl9tYXNrKTsKIH0KIAorc3RhdGljIHZvaWQgdmFsaWRhdGVfcG9z
c2libGVfY3J0Y3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQoreworCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBlbmNvZGVyLT5kZXY7CisJc3RydWN0IGRybV9jcnRjICpjcnRjOworCXUz
MiBjcnRjX21hc2sgPSAwOworCisJZHJtX2Zvcl9lYWNoX2NydGMoY3J0YywgZGV2KQorCQljcnRj
X21hc2sgfD0gZHJtX2NydGNfbWFzayhjcnRjKTsKKworCVdBUk4oKGVuY29kZXItPnBvc3NpYmxl
X2NydGNzICYgY3J0Y19tYXNrKSA9PSAwIHx8CisJICAgICAoZW5jb2Rlci0+cG9zc2libGVfY3J0
Y3MgJiB+Y3J0Y19tYXNrKSAhPSAwLAorCSAgICAgIkJvZ3VzIHBvc3NpYmxlX2NydGNzOiAiCisJ
ICAgICAiW0VOQ09ERVI6JWQ6JXNdIHBvc3NpYmxlX2NydGNzPTB4JXggKGZ1bGwgY3J0YyBtYXNr
PTB4JXgpXG4iLAorCSAgICAgZW5jb2Rlci0+YmFzZS5pZCwgZW5jb2Rlci0+bmFtZSwKKwkgICAg
IGVuY29kZXItPnBvc3NpYmxlX2NydGNzLCBjcnRjX21hc2spOworfQorCiBpbnQgZHJtX2VuY29k
ZXJfcmVnaXN0ZXJfYWxsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyOwpAQCAtMTE0LDYgKzEzMSw3IEBAIGludCBkcm1fZW5jb2Rlcl9yZWdp
c3Rlcl9hbGwoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlmaXh1cF9wb3NzaWJsZV9jbG9uZXMo
ZGV2KTsKIAogCWRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29kZXIsIGRldikgeworCQl2YWxpZGF0
ZV9wb3NzaWJsZV9jcnRjcyhlbmNvZGVyKTsKIAkJdmFsaWRhdGVfcG9zc2libGVfY2xvbmVzKGVu
Y29kZXIpOwogCiAJCWlmIChlbmNvZGVyLT5mdW5jcy0+bGF0ZV9yZWdpc3RlcikKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
