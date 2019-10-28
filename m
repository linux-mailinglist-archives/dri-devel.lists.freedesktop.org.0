Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DEE97C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152586E8B9;
	Wed, 30 Oct 2019 08:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08DA6EAA6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 21:43:18 +0000 (UTC)
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com
Subject: [PATCH] drm: sun4i: Add support for suspending the display driver
Date: Mon, 28 Oct 2019 22:43:13 +0100
Message-Id: <20191028214313.3463732-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1572298996; bh=fyyQI3ItgxBYKXPEf2uaXYMvRSi0utH9LPQLNQj2NLA=;
 h=From:To:Cc:Subject:Date:From;
 b=KbPLKdZFai12AyFY45X80z5E+QhMa46RXM0QVHLZUZlaNqwF63nvs1lAM2jvRpNcn
 QVxdtaUXAgGe2Q1k6XKnqdq2KMbsbwd+oyh3MfMCrTl5ykVgM8svGUdAeX8LFecO37
 8Vuq2LIvNlMXEGP8iQMDW16fZgDZ1tMyBIfPHZyw=
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
Ynk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV9kcnYuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jCmluZGV4
IGE1NzU3YjExYjczMC4uYzUxOWQ3Y2ZjZjQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5j
CkBAIC0zNDYsNiArMzQ2LDI3IEBAIHN0YXRpYyBpbnQgc3VuNGlfZHJ2X2FkZF9lbmRwb2ludHMo
c3RydWN0IGRldmljZSAqZGV2LAogCXJldHVybiBjb3VudDsKIH0KIAorI2lmZGVmIENPTkZJR19Q
TV9TTEVFUAorc3RhdGljIGludCBzdW40aV9kcnZfZHJtX3N5c19zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKK3sKKyAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOworCisgICAgICAgIHJldHVybiBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3Bl
bmQoZHJtKTsKK30KKworc3RhdGljIGludCBzdW40aV9kcnZfZHJtX3N5c19yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQoreworICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7CisKKyAgICAgICAgcmV0dXJuIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJf
cmVzdW1lKGRybSk7Cit9CisjZW5kaWYKKworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
IHN1bjRpX2Rydl9kcm1fcG1fb3BzID0geworICAgICAgICBTRVRfU1lTVEVNX1NMRUVQX1BNX09Q
UyhzdW40aV9kcnZfZHJtX3N5c19zdXNwZW5kLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdW40aV9kcnZfZHJtX3N5c19yZXN1bWUpCit9OworCiBzdGF0aWMgaW50IHN1bjRpX2Ry
dl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBjb21wb25l
bnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsKQEAgLTQxOCw2ICs0MzksNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBzdW40aV9kcnZfcGxhdGZvcm1fZHJpdmVyID0gewogCS5kcml2ZXIJ
CT0gewogCQkubmFtZQkJPSAic3VuNGktZHJtIiwKIAkJLm9mX21hdGNoX3RhYmxlCT0gc3VuNGlf
ZHJ2X29mX3RhYmxlLAorCQkucG0gPSAmc3VuNGlfZHJ2X2RybV9wbV9vcHMsCiAJfSwKIH07CiBt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN1bjRpX2Rydl9wbGF0Zm9ybV9kcml2ZXIpOwotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
