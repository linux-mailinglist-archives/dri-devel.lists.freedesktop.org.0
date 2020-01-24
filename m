Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBE148F00
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C540372B9C;
	Fri, 24 Jan 2020 20:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65F972B9A;
 Fri, 24 Jan 2020 20:02:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="221981823"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 24 Jan 2020 12:02:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2020 22:02:37 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/edid: Introduce is_detailed_timing_descritor()
Date: Fri, 24 Jan 2020 22:02:26 +0200
Message-Id: <20200124200231.10517-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIGludHJvZHVjZSBpc19kZXRhaWxlZF90aW1pbmdfZGVzY3JpdG9yKCkgYXMgdGhlIG9wcG9z
aXRlCmNvdW50ZXJwYXJ0IG9mIGlzX2Rpc3BsYXlfZGVzY3JpcHRvcigpLgoKQ2M6IEFsbGVuIENo
ZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YwppbmRleCA5NmFlMWZkZTRjZTIuLmQ2YmNlNThiMjdhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTIy
MDIsNiArMjIwMiwxMSBAQCBzdGF0aWMgYm9vbCBpc19kaXNwbGF5X2Rlc2NyaXB0b3IoY29uc3Qg
dTggZFsxOF0sIHU4IHRhZykKIAkJZFsyXSA9PSAweDAwICYmIGRbM10gPT0gdGFnOwogfQogCitz
dGF0aWMgYm9vbCBpc19kZXRhaWxlZF90aW1pbmdfZGVzY3JpcHRvcihjb25zdCB1OCBkWzE4XSkK
K3sKKwlyZXR1cm4gZFswXSAhPSAweDAwIHx8IGRbMV0gIT0gMHgwMDsKK30KKwogdHlwZWRlZiB2
b2lkIGRldGFpbGVkX2NiKHN0cnVjdCBkZXRhaWxlZF90aW1pbmcgKnRpbWluZywgdm9pZCAqY2xv
c3VyZSk7CiAKIHN0YXRpYyB2b2lkCkBAIC0zMTAxLDI3ICszMTA2LDI4IEBAIGRvX2RldGFpbGVk
X21vZGUoc3RydWN0IGRldGFpbGVkX3RpbWluZyAqdGltaW5nLCB2b2lkICpjKQogCXN0cnVjdCBk
ZXRhaWxlZF9tb2RlX2Nsb3N1cmUgKmNsb3N1cmUgPSBjOwogCXN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICpuZXdtb2RlOwogCi0JaWYgKHRpbWluZy0+cGl4ZWxfY2xvY2spIHsKLQkJbmV3bW9kZSA9
IGRybV9tb2RlX2RldGFpbGVkKGNsb3N1cmUtPmNvbm5lY3Rvci0+ZGV2LAotCQkJCQkgICAgY2xv
c3VyZS0+ZWRpZCwgdGltaW5nLAotCQkJCQkgICAgY2xvc3VyZS0+cXVpcmtzKTsKLQkJaWYgKCFu
ZXdtb2RlKQotCQkJcmV0dXJuOworCWlmICghaXNfZGV0YWlsZWRfdGltaW5nX2Rlc2NyaXB0b3Io
KGNvbnN0IHU4ICopdGltaW5nKSkKKwkJcmV0dXJuOworCisJbmV3bW9kZSA9IGRybV9tb2RlX2Rl
dGFpbGVkKGNsb3N1cmUtPmNvbm5lY3Rvci0+ZGV2LAorCQkJCSAgICBjbG9zdXJlLT5lZGlkLCB0
aW1pbmcsCisJCQkJICAgIGNsb3N1cmUtPnF1aXJrcyk7CisJaWYgKCFuZXdtb2RlKQorCQlyZXR1
cm47CiAKLQkJaWYgKGNsb3N1cmUtPnByZWZlcnJlZCkKLQkJCW5ld21vZGUtPnR5cGUgfD0gRFJN
X01PREVfVFlQRV9QUkVGRVJSRUQ7CisJaWYgKGNsb3N1cmUtPnByZWZlcnJlZCkKKwkJbmV3bW9k
ZS0+dHlwZSB8PSBEUk1fTU9ERV9UWVBFX1BSRUZFUlJFRDsKIAotCQkvKgotCQkgKiBEZXRhaWxl
ZCBtb2RlcyBhcmUgbGltaXRlZCB0byAxMGtIeiBwaXhlbCBjbG9jayByZXNvbHV0aW9uLAotCQkg
KiBzbyBmaXggdXAgYW55dGhpbmcgdGhhdCBsb29rcyBsaWtlIENFQS9IRE1JIG1vZGUsIGJ1dCB0
aGUgY2xvY2sKLQkJICogaXMganVzdCBzbGlnaHRseSBvZmYuCi0JCSAqLwotCQlmaXh1cF9kZXRh
aWxlZF9jZWFfbW9kZV9jbG9jayhuZXdtb2RlKTsKKwkvKgorCSAqIERldGFpbGVkIG1vZGVzIGFy
ZSBsaW1pdGVkIHRvIDEwa0h6IHBpeGVsIGNsb2NrIHJlc29sdXRpb24sCisJICogc28gZml4IHVw
IGFueXRoaW5nIHRoYXQgbG9va3MgbGlrZSBDRUEvSERNSSBtb2RlLCBidXQgdGhlIGNsb2NrCisJ
ICogaXMganVzdCBzbGlnaHRseSBvZmYuCisJICovCisJZml4dXBfZGV0YWlsZWRfY2VhX21vZGVf
Y2xvY2sobmV3bW9kZSk7CiAKLQkJZHJtX21vZGVfcHJvYmVkX2FkZChjbG9zdXJlLT5jb25uZWN0
b3IsIG5ld21vZGUpOwotCQljbG9zdXJlLT5tb2RlcysrOwotCQljbG9zdXJlLT5wcmVmZXJyZWQg
PSBmYWxzZTsKLQl9CisJZHJtX21vZGVfcHJvYmVkX2FkZChjbG9zdXJlLT5jb25uZWN0b3IsIG5l
d21vZGUpOworCWNsb3N1cmUtPm1vZGVzKys7CisJY2xvc3VyZS0+cHJlZmVycmVkID0gZmFsc2U7
CiB9CiAKIC8qCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
