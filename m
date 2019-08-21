Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E798D3C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013DC6EA8B;
	Thu, 22 Aug 2019 08:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286806E949
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:27 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D296E1A01D9;
 Wed, 21 Aug 2019 12:16:25 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C5B5F1A007D;
 Wed, 21 Aug 2019 12:16:25 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 1574F205D3;
 Wed, 21 Aug 2019 12:16:25 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 13/15] drm/mxsfb: Clear OUTSTANDING_REQS bits
Date: Wed, 21 Aug 2019 13:15:53 +0300
Message-Id: <1566382555-12102-14-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qml0IDIxIGNhbiBhbHRlciB0aGUgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUyB2YWx1ZSByaWdodCBh
ZnRlciB0aGUgZUxDRElGCmlzIGVuYWJsZWQsIHNpbmNlIGl0IGNvbWVzIHVwIHdpdGggZGVmYXVs
dCB2YWx1ZSBvZiAxICh0aGlzIGJlaGF2aW91cgpoYXMgYmVlbiBzZWVuIG9uIHNvbWUgaW14OCBw
bGF0Zm9ybXMpLgpJbiBvcmRlciB0byBmaXggdGhpcywgY2xlYXIgQ1RSTDJfT1VUU1RBTkRJTkdf
UkVRUyBiaXRzIGJlZm9yZSBzZXR0aW5nCml0cyB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFJvYmVy
dCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhz
ZmIvbXhzZmJfY3J0Yy5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKaW5kZXggZTcyN2Y1ZS4uYTEyZjUzZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCkBAIC0yMjUsNiArMjI1LDEzIEBAIHN0YXRp
YyB2b2lkIG14c2ZiX2VuYWJsZV9jb250cm9sbGVyKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAq
bXhzZmIpCiAJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGspOwogCiAJaWYgKG14c2ZiLT5k
ZXZkYXRhLT5pcHZlcnNpb24gPj0gNCkgeworCQkvKgorCQkgKiBPbiBzb21lIHBsYXRmb3Jtcywg
Yml0IDIxIGlzIGRlZmF1bHRlZCB0byAxLCB3aGljaCBtYXkgYWx0ZXIKKwkJICogdGhlIGJlbG93
IHNldHRpbmcuIFNvLCB0byBtYWtlIHN1cmUgd2UgaGF2ZSB0aGUgcmlnaHQgc2V0dGluZworCQkg
KiBjbGVhciBhbGwgdGhlIGJpdHMgZm9yIENUUkwyX09VVFNUQU5ESU5HX1JFUVMuCisJCSAqLwor
CQl3cml0ZWwoQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUygweDcpLAorCQkgICAgICAgbXhzZmItPmJh
c2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX0NMUik7CiAJCXdyaXRlbChDVFJMMl9PVVRTVEFORElO
R19SRVFTKFJFUV8xNiksCiAJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBS
RUdfU0VUKTsKIAkJLyogQXNzZXJ0IExDRCBSZXNldCBiaXQgKi8KLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
