Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D86261C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8B6E02C;
	Mon,  8 Jul 2019 16:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2416E027;
 Mon,  8 Jul 2019 16:21:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="176206692"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 08 Jul 2019 09:21:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/14] drm/i915: Simplfy LVDS crtc_mask setup
Date: Mon,  8 Jul 2019 19:20:45 +0300
Message-Id: <20190708162048.4286-12-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRvbid0IG5lZWQgdG8gc3BlY2lhbCBjYXNlIFBDSCB2cy4gZ2VuNCB3aGVuIHNldHRpbmcgdXAg
dGhlIExWRFMKY3J0Y19tYXNrLiBKdXN0IGNsYWltIHBpcGVzIEF8QnxDIHdvcmsgYW5kIGludGVs
X2VuY29kZXJfY3J0Y3MoKSBkcm9wCm91dCBhbnkgY3J0YyB0aGF0IGRvZXNuJ3QgZXhpc3QuCgpT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHZkcy5jIHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdmRzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x2ZHMuYwppbmRleCA3NjUwOTFhOTgzNWMu
LmU3OWRjYzg5MWI4MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9sdmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdmRz
LmMKQEAgLTkwMSwxMCArOTAxLDggQEAgdm9pZCBpbnRlbF9sdmRzX2luaXQoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogCWludGVsX2VuY29kZXItPnBvd2VyX2RvbWFpbiA9IFBP
V0VSX0RPTUFJTl9QT1JUX09USEVSOwogCWludGVsX2VuY29kZXItPnBvcnQgPSBQT1JUX05PTkU7
CiAJaW50ZWxfZW5jb2Rlci0+Y2xvbmVhYmxlID0gMDsKLQlpZiAoSEFTX1BDSF9TUExJVChkZXZf
cHJpdikpCisJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gNCkKIAkJaW50ZWxfZW5jb2Rlci0+
Y3J0Y19tYXNrID0gQklUKFBJUEVfQSkgfCBCSVQoUElQRV9CKSB8IEJJVChQSVBFX0MpOwotCWVs
c2UgaWYgKElTX0dFTihkZXZfcHJpdiwgNCkpCi0JCWludGVsX2VuY29kZXItPmNydGNfbWFzayA9
IEJJVChQSVBFX0EpIHwgQklUKFBJUEVfQik7CiAJZWxzZQogCQlpbnRlbF9lbmNvZGVyLT5jcnRj
X21hc2sgPSBCSVQoUElQRV9CKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
