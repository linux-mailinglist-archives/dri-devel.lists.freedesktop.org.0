Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD9E97EB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD16C6ECB7;
	Wed, 30 Oct 2019 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F836E1F3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 11:28:52 +0000 (UTC)
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com
Subject: [PATCH v2] drm: sun4i: Add support for suspending the display driver
Date: Tue, 29 Oct 2019 12:28:46 +0100
Message-Id: <20191029112846.3604925-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1572348530; bh=7CvZFllA5Lo3ke7W4E4r8AmPqCtcdtZ72Xnw6OysY14=;
 h=From:To:Cc:Subject:Date:From;
 b=rCaxpPR2UhHDsQQ7Z4TX360K5iP0YBo4qKopDd7yNu0zAFiRBG39FmQ9J+Htaednr
 +MeXaB5cGXQf1+HuM+Q9pUW0qPMz1zRzTeXAWk/vQpOEVEh39u8M7s7xZvekDuPRK7
 JItx9M4N6QwfjCvlpk8RdiZC3Ybj8/1oWHZE2rkc=
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2h1dCBkb3duIHRoZSBkaXNwbGF5IGVuZ2luZSBkdXJpbmcgc3VzcGVuZC4KClNpZ25lZC1vZmYt
Ynk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoK
LSBzcGFjZXMgLT4gdGFicwoKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYyB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jCmluZGV4IGE1NzU3YjExYjczMC4uYzUxOWQ3Y2Zj
ZjQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jCkBAIC0zNDYsNiArMzQ2LDI3IEBAIHN0
YXRpYyBpbnQgc3VuNGlfZHJ2X2FkZF9lbmRwb2ludHMoc3RydWN0IGRldmljZSAqZGV2LAogCXJl
dHVybiBjb3VudDsKIH0KIAorI2lmZGVmIENPTkZJR19QTV9TTEVFUAorc3RhdGljIGludCBzdW40
aV9kcnZfZHJtX3N5c19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlyZXR1cm4gZHJtX21vZGVf
Y29uZmlnX2hlbHBlcl9zdXNwZW5kKGRybSk7Cit9CisKK3N0YXRpYyBpbnQgc3VuNGlfZHJ2X2Ry
bV9zeXNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hl
bHBlcl9yZXN1bWUoZHJtKTsKK30KKyNlbmRpZgorCitzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgc3VuNGlfZHJ2X2RybV9wbV9vcHMgPSB7CisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMo
c3VuNGlfZHJ2X2RybV9zeXNfc3VzcGVuZCwKKwkJCQlzdW40aV9kcnZfZHJtX3N5c19yZXN1bWUp
Cit9OworCiBzdGF0aWMgaW50IHN1bjRpX2Rydl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogewogCXN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsKQEAgLTQx
OCw2ICs0MzksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdW40aV9kcnZfcGxh
dGZvcm1fZHJpdmVyID0gewogCS5kcml2ZXIJCT0gewogCQkubmFtZQkJPSAic3VuNGktZHJtIiwK
IAkJLm9mX21hdGNoX3RhYmxlCT0gc3VuNGlfZHJ2X29mX3RhYmxlLAorCQkucG0gPSAmc3VuNGlf
ZHJ2X2RybV9wbV9vcHMsCiAJfSwKIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN1bjRpX2Ry
dl9wbGF0Zm9ybV9kcml2ZXIpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
