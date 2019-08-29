Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDDA326C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367666E2AC;
	Fri, 30 Aug 2019 08:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7796E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:21 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 32D20200335;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24E73200073;
 Thu, 29 Aug 2019 13:30:20 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CE6F20613;
 Thu, 29 Aug 2019 13:30:19 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 02/14] drm/mxsfb: Read bus flags from bridge if present
Date: Thu, 29 Aug 2019 14:30:03 +0300
Message-Id: <1567078215-31601-3-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KClRoZSBicmlkZ2UgbWlnaHQg
aGF2ZSBzcGVjaWFsIHJlcXVpcm1lbnRlcyBvbiB0aGUgaW5wdXQgYnVzLiBUaGlzCmlzIGUuZy4g
dXNlZCBieSB0aGUgaW14LW53bCBicmlkZ2UuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgpSZXZpZXdlZC1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWdu
ZXIuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyB8IDUgKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2NydGMuYwppbmRleCBkZTA5YjkzLi5iNjlhY2U4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9jcnRjLmMKQEAgLTIwOSw3ICsyMDksNyBAQCBzdGF0aWMgdm9pZCBteHNmYl9j
cnRjX21vZGVfc2V0X25vZmIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIHsKIAlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gbXhzZmItPnBpcGUuY3J0Yy5kZXY7CiAJc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm0gPSAmbXhzZmItPnBpcGUuY3J0Yy5zdGF0ZS0+YWRqdXN0ZWRfbW9k
ZTsKLQljb25zdCB1MzIgYnVzX2ZsYWdzID0gbXhzZmItPmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmJ1c19mbGFnczsKKwl1MzIgYnVzX2ZsYWdzID0gbXhzZmItPmNvbm5lY3Rvci0+ZGlzcGxheV9p
bmZvLmJ1c19mbGFnczsKIAl1MzIgdmRjdHJsMCwgdnN5bmNfcHVsc2VfbGVuLCBoc3luY19wdWxz
ZV9sZW47CiAJaW50IGVycjsKIApAQCAtMjMzLDYgKzIzMyw5IEBAIHN0YXRpYyB2b2lkIG14c2Zi
X2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQogCiAJ
Y2xrX3NldF9yYXRlKG14c2ZiLT5jbGssIG0tPmNydGNfY2xvY2sgKiAxMDAwKTsKIAorCWlmICht
eHNmYi0+YnJpZGdlICYmIG14c2ZiLT5icmlkZ2UtPnRpbWluZ3MpCisJCWJ1c19mbGFncyA9IG14
c2ZiLT5icmlkZ2UtPnRpbWluZ3MtPmlucHV0X2J1c19mbGFnczsKKwogCURSTV9ERVZfREVCVUdf
RFJJVkVSKGRybS0+ZGV2LCAiUGl4ZWwgY2xvY2s6ICVka0h6IChhY3R1YWw6ICVka0h6KVxuIiwK
IAkJCSAgICAgbS0+Y3J0Y19jbG9jaywKIAkJCSAgICAgKGludCkoY2xrX2dldF9yYXRlKG14c2Zi
LT5jbGspIC8gMTAwMCkpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
