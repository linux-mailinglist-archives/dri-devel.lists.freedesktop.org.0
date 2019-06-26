Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EB57CD3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28A26E5CB;
	Thu, 27 Jun 2019 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563B6E430
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:32:30 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DEFAA2009A8;
 Wed, 26 Jun 2019 15:32:28 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D1C802009B2;
 Wed, 26 Jun 2019 15:32:28 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 24DA1205DB;
 Wed, 26 Jun 2019 15:32:28 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 09/10] drm/mxsfb: Clear OUTSTANDING_REQS bits
Date: Wed, 26 Jun 2019 16:32:17 +0300
Message-Id: <1561555938-21595-10-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
 Robert Chiras <robert.chiras@nxp.com>, linux-arm-kernel@lists.infradead.org
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
ZmIvbXhzZmJfY3J0Yy5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwppbmRleCA0
NWNhMTZiLi4wMmE1Njg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJf
Y3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKQEAgLTIyMyw3
ICsyMjMsMTQgQEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14
c2ZiX2RybV9wcml2YXRlICpteHNmYikKIAljbGtfcHJlcGFyZV9lbmFibGUobXhzZmItPmNsayk7
CiAKIAlpZiAobXhzZmItPmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KSB7Ci0JCXdyaXRlbChDVFJM
Ml9PVVRTVEFORElOR19SRVFTX19SRVFfMTYsCisJCS8qCisJCSAqIE9uIHNvbWUgcGxhdGZvcm1z
LCBiaXQgMjEgaXMgZGVmYXVsdGVkIHRvIDEsIHdoaWNoIG1heSBhbHRlcgorCQkgKiB0aGUgYmVs
b3cgc2V0dGluZy4gU28sIHRvIG1ha2Ugc3VyZSB3ZSBoYXZlIHRoZSByaWdodCBzZXR0aW5nCisJ
CSAqIGNsZWFyIGFsbCB0aGUgYml0cyBmb3IgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUy4KKwkJICov
CisJCXdyaXRlbChDVFJMMl9PVVRTVEFORElOR19SRVFTKDB4NyksCisJCSAgICAgICBteHNmYi0+
YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfQ0xSKTsKKwkJd3JpdGVsKENUUkwyX09VVFNUQU5E
SU5HX1JFUVMoUkVRXzE2KSwKIAkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiAr
IFJFR19TRVQpOwogCQkvKiBBc3NlcnQgTENEIFJlc2V0IGJpdCAqLwogCQl3cml0ZWwoQ1RSTDJf
TENEX1JFU0VULCBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfU0VUKTsKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
