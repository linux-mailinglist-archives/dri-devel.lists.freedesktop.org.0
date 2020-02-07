Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678401558EB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30996FCB4;
	Fri,  7 Feb 2020 14:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FEE6FCB4;
 Fri,  7 Feb 2020 14:00:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="226485973"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 07 Feb 2020 06:00:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:00:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm: Validate encoder->possible_clones
Date: Fri,  7 Feb 2020 15:59:49 +0200
Message-Id: <20200207135950.6655-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
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
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZW5j
b2Rlci5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5j
b2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMKaW5kZXggZjc2MWQ5MzA2MDI4
Li5iYzIyNDZmMjdlMGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rlci5jCkBAIC03OSw2ICs3OSwzNCBAQCBz
dGF0aWMgdm9pZCBmaXh1cF9wb3NzaWJsZV9jbG9uZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikK
IAkJZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzIHw9IGRybV9lbmNvZGVyX21hc2soZW5jb2Rlcik7
CiB9CiAKK3N0YXRpYyB2b2lkIHZhbGlkYXRlX3Bvc3NpYmxlX2Nsb25lcyhzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCit7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRl
djsKKwlzdHJ1Y3QgZHJtX2VuY29kZXIgKm90aGVyOworCXUzMiBlbmNvZGVyX21hc2sgPSAwOwor
CisJZHJtX2Zvcl9lYWNoX2VuY29kZXIob3RoZXIsIGRldikgeworCQllbmNvZGVyX21hc2sgfD0g
ZHJtX2VuY29kZXJfbWFzayhvdGhlcik7CisKKwkJV0FSTighKGVuY29kZXItPnBvc3NpYmxlX2Ns
b25lcyAmIGRybV9lbmNvZGVyX21hc2sob3RoZXIpKSAhPQorCQkgICAgICEob3RoZXItPnBvc3Np
YmxlX2Nsb25lcyAmIGRybV9lbmNvZGVyX21hc2soZW5jb2RlcikpLAorCQkgICAgICJwb3NzaWJs
ZV9jbG9uZXMgbWlzbWF0Y2g6ICIKKwkJICAgICAiW0VOQ09ERVI6JWQ6JXNdIG1hc2s9MHgleCBw
b3NzaWJsZV9jbG9uZXM9MHgleCB2cy4gIgorCQkgICAgICJbRU5DT0RFUjolZDolc10gbWFzaz0w
eCV4IHBvc3NpYmxlX2Nsb25lcz0weCV4XG4iLAorCQkgICAgIGVuY29kZXItPmJhc2UuaWQsIGVu
Y29kZXItPm5hbWUsCisJCSAgICAgZHJtX2VuY29kZXJfbWFzayhlbmNvZGVyKSwgZW5jb2Rlci0+
cG9zc2libGVfY2xvbmVzLAorCQkgICAgIG90aGVyLT5iYXNlLmlkLCBvdGhlci0+bmFtZSwKKwkJ
ICAgICBkcm1fZW5jb2Rlcl9tYXNrKG90aGVyKSwgb3RoZXItPnBvc3NpYmxlX2Nsb25lcyk7CisJ
fQorCisJV0FSTigoZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzICYgZHJtX2VuY29kZXJfbWFzayhl
bmNvZGVyKSkgPT0gMCB8fAorCSAgICAgKGVuY29kZXItPnBvc3NpYmxlX2Nsb25lcyAmIH5lbmNv
ZGVyX21hc2spICE9IDAsCisJICAgICAiQm9ndXMgcG9zc2libGVfY2xvbmVzOiAiCisJICAgICAi
W0VOQ09ERVI6JWQ6JXNdIHBvc3NpYmxlX2Nsb25lcz0weCV4IChmdWxsIGVuY29kZXIgbWFzaz0w
eCV4KVxuIiwKKwkgICAgIGVuY29kZXItPmJhc2UuaWQsIGVuY29kZXItPm5hbWUsCisJICAgICBl
bmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMsIGVuY29kZXJfbWFzayk7Cit9CisKIGludCBkcm1fZW5j
b2Rlcl9yZWdpc3Rlcl9hbGwoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXI7CkBAIC04Nyw2ICsxMTUsOCBAQCBpbnQgZHJtX2VuY29kZXJfcmVn
aXN0ZXJfYWxsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJZml4dXBfcG9zc2libGVfY2xvbmVz
KGRldik7CiAKIAlkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBkZXYpIHsKKwkJdmFsaWRh
dGVfcG9zc2libGVfY2xvbmVzKGVuY29kZXIpOworCiAJCWlmIChlbmNvZGVyLT5mdW5jcy0+bGF0
ZV9yZWdpc3RlcikKIAkJCXJldCA9IGVuY29kZXItPmZ1bmNzLT5sYXRlX3JlZ2lzdGVyKGVuY29k
ZXIpOwogCQlpZiAocmV0KQotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
