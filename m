Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EBCA7698
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACC68968D;
	Tue,  3 Sep 2019 21:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFFF8968D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:57:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 023A73082133;
 Tue,  3 Sep 2019 21:57:16 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00C161001947;
 Tue,  3 Sep 2019 21:57:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/dp_mst: Combine redundant cases in
 drm_dp_encode_sideband_req()
Date: Tue,  3 Sep 2019 17:57:02 -0400
Message-Id: <20190903215702.16984-1-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-7-lyude@redhat.com>
References: <20190903204645.25487-7-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 03 Sep 2019 21:57:16 +0000 (UTC)
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
 Dave Airlie <airlied@redhat.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWNlZCB0aGlzIHdoaWxlIHdvcmtpbmcgb24gYWRkaW5nIGEgZHJtX2RwX2RlY29kZV9zaWRl
YmFuZF9yZXEoKS4KRFBfUE9XRVJfRE9XTl9QSFkvRFBfUE9XRVJfVVBfUEhZIGJvdGggdXNlIHRo
ZSBzYW1lIHN0cnVjdCBhcwpEUF9FTlVNX1BBVEhfUkVTT1VSQ0VTLCBzbyB3ZSBjYW4ganVzdCBj
b21iaW5lIHRoZWlyIGNhc2VzLgoKQ2hhbmdlcyBzaW5jZSB2MjoKKiBGaXggY29tbWl0IG1lc3Nh
Z2UKClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNv
bT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aHdl
bnRsYW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA2ZjdmNDQ5Y2Ex
MmIuLjFjODYyNzQ5Y2I2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBA
IC0yNzEsNiArMjcxLDggQEAgc3RhdGljIHZvaWQgZHJtX2RwX2VuY29kZV9zaWRlYmFuZF9yZXEo
c3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgKnJlcSwKIAogCXN3aXRjaCAocmVx
LT5yZXFfdHlwZSkgewogCWNhc2UgRFBfRU5VTV9QQVRIX1JFU09VUkNFUzoKKwljYXNlIERQX1BP
V0VSX0RPV05fUEhZOgorCWNhc2UgRFBfUE9XRVJfVVBfUEhZOgogCQlidWZbaWR4XSA9IChyZXEt
PnUucG9ydF9udW0ucG9ydF9udW1iZXIgJiAweGYpIDw8IDQ7CiAJCWlkeCsrOwogCQlicmVhazsK
QEAgLTM1OCwxMiArMzYwLDYgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2VuY29kZV9zaWRlYmFuZF9y
ZXEoc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgKnJlcSwKIAkJbWVtY3B5KCZi
dWZbaWR4XSwgcmVxLT51LmkyY193cml0ZS5ieXRlcywgcmVxLT51LmkyY193cml0ZS5udW1fYnl0
ZXMpOwogCQlpZHggKz0gcmVxLT51LmkyY193cml0ZS5udW1fYnl0ZXM7CiAJCWJyZWFrOwotCi0J
Y2FzZSBEUF9QT1dFUl9ET1dOX1BIWToKLQljYXNlIERQX1BPV0VSX1VQX1BIWToKLQkJYnVmW2lk
eF0gPSAocmVxLT51LnBvcnRfbnVtLnBvcnRfbnVtYmVyICYgMHhmKSA8PCA0OwotCQlpZHgrKzsK
LQkJYnJlYWs7CiAJfQogCXJhdy0+Y3VyX2xlbiA9IGlkeDsKIH0KLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
