Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF6A7530
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7B898BC;
	Tue,  3 Sep 2019 20:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D8A898B7;
 Tue,  3 Sep 2019 20:47:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2F2510F09;
 Tue,  3 Sep 2019 20:47:39 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13E81001B02;
 Tue,  3 Sep 2019 20:47:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/27] drm/dp_mst: Move link address dumping into a function
Date: Tue,  3 Sep 2019 16:45:39 -0400
Message-Id: <20190903204645.25487-2-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 03 Sep 2019 20:47:40 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZXMgdGhpbmdzIGVhc2llciB0byByZWFkLgoKQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGlu
dGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBXZW50bGFu
ZCA8aHdlbnRsYW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMzUgKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggODJhZGQ3
MzZlMTdkLi4zNmRiNjZhMGRkYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YwpAQCAtMjEwMyw2ICsyMTAzLDI4IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9xdWV1ZV9kb3duX3R4
KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCW11dGV4X3VubG9jaygmbWdy
LT5xbG9jayk7CiB9CiAKK3N0YXRpYyB2b2lkCitkcm1fZHBfZHVtcF9saW5rX2FkZHJlc3Moc3Ry
dWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNrX3JlcGx5ICpyZXBseSkKK3sKKwlzdHJ1Y3QgZHJt
X2RwX2xpbmtfYWRkcl9yZXBseV9wb3J0ICpwb3J0X3JlcGx5OworCWludCBpOworCisJZm9yIChp
ID0gMDsgaSA8IHJlcGx5LT5ucG9ydHM7IGkrKykgeworCQlwb3J0X3JlcGx5ID0gJnJlcGx5LT5w
b3J0c1tpXTsKKwkJRFJNX0RFQlVHX0tNUygicG9ydCAlZDogaW5wdXQgJWQsIHBkdDogJWQsIHBu
OiAlZCwgZHBjZF9yZXY6ICUwMngsIG1jczogJWQsIGRkcHM6ICVkLCBsZHBzICVkLCBzZHAgJWQv
JWRcbiIsCisJCQkgICAgICBpLAorCQkJICAgICAgcG9ydF9yZXBseS0+aW5wdXRfcG9ydCwKKwkJ
CSAgICAgIHBvcnRfcmVwbHktPnBlZXJfZGV2aWNlX3R5cGUsCisJCQkgICAgICBwb3J0X3JlcGx5
LT5wb3J0X251bWJlciwKKwkJCSAgICAgIHBvcnRfcmVwbHktPmRwY2RfcmV2aXNpb24sCisJCQkg
ICAgICBwb3J0X3JlcGx5LT5tY3MsCisJCQkgICAgICBwb3J0X3JlcGx5LT5kZHBzLAorCQkJICAg
ICAgcG9ydF9yZXBseS0+bGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKKwkJCSAgICAgIHBvcnRf
cmVwbHktPm51bV9zZHBfc3RyZWFtcywKKwkJCSAgICAgIHBvcnRfcmVwbHktPm51bV9zZHBfc3Ry
ZWFtX3NpbmtzKTsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVz
cyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCQkgICAgIHN0cnVjdCBk
cm1fZHBfbXN0X2JyYW5jaCAqbXN0YikKIHsKQEAgLTIxMjgsMTggKzIxNTAsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCiAJCQlEUk1fREVCVUdfS01TKCJsaW5rIGFkZHJlc3MgbmFrIHJlY2VpdmVkXG4i
KTsKIAkJfSBlbHNlIHsKIAkJCURSTV9ERUJVR19LTVMoImxpbmsgYWRkcmVzcyByZXBseTogJWRc
biIsIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5ucG9ydHMpOwotCQkJZm9yIChpID0gMDsgaSA8
IHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5ucG9ydHM7IGkrKykgewotCQkJCURSTV9ERUJVR19L
TVMoInBvcnQgJWQ6IGlucHV0ICVkLCBwZHQ6ICVkLCBwbjogJWQsIGRwY2RfcmV2OiAlMDJ4LCBt
Y3M6ICVkLCBkZHBzOiAlZCwgbGRwcyAlZCwgc2RwICVkLyVkXG4iLCBpLAotCQkJCSAgICAgICB0
eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0uaW5wdXRfcG9ydCwKLQkJCQkgICAgICAg
dHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLnBlZXJfZGV2aWNlX3R5cGUsCi0JCQkJ
ICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5wb3J0X251bWJlciwKLQkJ
CQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLmRwY2RfcmV2aXNpb24s
Ci0JCQkJICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5tY3MsCi0JCQkJ
ICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5kZHBzLAotCQkJCSAgICAg
ICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0ubGVnYWN5X2RldmljZV9wbHVnX3N0
YXR1cywKLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLm51bV9z
ZHBfc3RyZWFtcywKLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ld
Lm51bV9zZHBfc3RyZWFtX3NpbmtzKTsKLQkJCX0KKwkJCWRybV9kcF9kdW1wX2xpbmtfYWRkcmVz
cygmdHhtc2ctPnJlcGx5LnUubGlua19hZGRyKTsKIAogCQkJZHJtX2RwX2NoZWNrX21zdGJfZ3Vp
ZChtc3RiLCB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIuZ3VpZCk7CiAKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
