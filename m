Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC1A754F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD78789A34;
	Tue,  3 Sep 2019 20:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831C289A14;
 Tue,  3 Sep 2019 20:48:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1CC918C4272;
 Tue,  3 Sep 2019 20:48:14 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E252C1001B02;
 Tue,  3 Sep 2019 20:48:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/27] drm/dp_mst: Refactor drm_dp_send_enum_path_resources
Date: Tue,  3 Sep 2019 16:45:47 -0400
Message-Id: <20190903204645.25487-10-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 03 Sep 2019 20:48:15 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIG1vcmUgcG9pbnRlcnMgc28gd2UgZG9uJ3QgaGF2ZSB0byB3cml0ZSBvdXQKdHhtc2ctPnJl
cGx5LnUucGF0aF9yZXNvdXJjZXMgZWFjaCB0aW1lLiBBbHNvLCBmaXggbGluZSB3cmFwcGluZyAr
CnJlYXJyYW5nZSBsb2NhbCB2YXJpYWJsZXMuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50
ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxod2VudGxhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMjQgKysrKysr
KysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCBhZjMx
ODlkZjI4YWEuLjI0MWM2NmY3NWJlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCkBAIC0yNDM3LDEyICsyNDM3LDE0IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9zZW5kX2xpbmtf
YWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAlrZnJlZSh0eG1z
Zyk7CiB9CiAKLXN0YXRpYyBpbnQgZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhzdHJ1
Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKLQkJCQkJICAgc3RydWN0IGRybV9kcF9t
c3RfYnJhbmNoICptc3RiLAotCQkJCQkgICBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQor
c3RhdGljIGludAorZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwKKwkJCQlzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1z
dGIsCisJCQkJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKIHsKLQlpbnQgbGVuOworCXN0
cnVjdCBkcm1fZHBfZW51bV9wYXRoX3Jlc291cmNlc19hY2tfcmVwbHkgKnBhdGhfcmVzOwogCXN0
cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3R4ICp0eG1zZzsKKwlpbnQgbGVuOwogCWludCByZXQ7
CiAKIAl0eG1zZyA9IGt6YWxsb2Moc2l6ZW9mKCp0eG1zZyksIEdGUF9LRVJORUwpOwpAQCAtMjQ1
NiwxNCArMjQ1OCwyMCBAQCBzdGF0aWMgaW50IGRybV9kcF9zZW5kX2VudW1fcGF0aF9yZXNvdXJj
ZXMoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCiAKIAlyZXQgPSBkcm1fZHBf
bXN0X3dhaXRfdHhfcmVwbHkobXN0YiwgdHhtc2cpOwogCWlmIChyZXQgPiAwKSB7CisJCXBhdGhf
cmVzID0gJnR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzOworCiAJCWlmICh0eG1zZy0+cmVw
bHkucmVwbHlfdHlwZSA9PSBEUF9TSURFQkFORF9SRVBMWV9OQUspIHsKIAkJCURSTV9ERUJVR19L
TVMoImVudW0gcGF0aCByZXNvdXJjZXMgbmFrIHJlY2VpdmVkXG4iKTsKIAkJfSBlbHNlIHsKLQkJ
CWlmIChwb3J0LT5wb3J0X251bSAhPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5wb3J0
X251bWJlcikKKwkJCWlmIChwb3J0LT5wb3J0X251bSAhPSBwYXRoX3Jlcy0+cG9ydF9udW1iZXIp
CiAJCQkJRFJNX0VSUk9SKCJnb3QgaW5jb3JyZWN0IHBvcnQgaW4gcmVzcG9uc2VcbiIpOwotCQkJ
RFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQgJWRcbiIsIHR4bXNnLT5y
ZXBseS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVyLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jl
c291cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAotCQkJICAgICAgIHR4bXNnLT5yZXBseS51
LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVyKTsKLQkJCXBvcnQtPmF2YWls
YWJsZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2FkX2J3
X251bWJlcjsKKworCQkJRFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQg
JWRcbiIsCisJCQkJICAgICAgcGF0aF9yZXMtPnBvcnRfbnVtYmVyLAorCQkJCSAgICAgIHBhdGhf
cmVzLT5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAorCQkJCSAgICAgIHBhdGhfcmVzLT5hdmFpbF9w
YXlsb2FkX2J3X251bWJlcik7CisJCQlwb3J0LT5hdmFpbGFibGVfcGJuID0KKwkJCQlwYXRoX3Jl
cy0+YXZhaWxfcGF5bG9hZF9id19udW1iZXI7CiAJCX0KIAl9CiAKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
