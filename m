Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E79A3298
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E088F6E336;
	Fri, 30 Aug 2019 08:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A436E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:31 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4960020033A;
 Thu, 29 Aug 2019 13:30:30 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3CAAF200336;
 Thu, 29 Aug 2019 13:30:30 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 506AA20613;
 Thu, 29 Aug 2019 13:30:29 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 14/14] drm/mxsfb: Add support for live pixel format change
Date: Thu, 29 Aug 2019 14:30:15 +0300
Message-Id: <1567078215-31601-15-git-send-email-robert.chiras@nxp.com>
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

VGhpcyBJUCByZXF1aXJlcyBmdWxsIHN0b3AgYW5kIHJlLXN0YXJ0IHdoZW4gY2hhbmdpbmcgZGlz
cGxheSB0aW1pbmdzLApidXQgd2UgY2FuIGNoYW5nZSB0aGUgcGl4ZWwgZm9ybWF0IHdoaWxlIHJ1
bm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5j
b20+ClRlc3RlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIHwgMTYgKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214
c2ZiL214c2ZiX2NydGMuYwppbmRleCAzMTc1NzVlLi41NjA3ZmMwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9jcnRjLmMKQEAgLTQ5NCw2ICs0OTQsNyBAQCB2b2lkIG14c2ZiX3BsYW5lX2F0b21p
Y191cGRhdGUoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYiwKIAlzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpuZXdfc3Rh
dGUgPSBwaXBlLT5wbGFuZS5zdGF0ZTsKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBp
cGUtPnBsYW5lLnN0YXRlLT5mYjsKKwlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpvbGRfZmIgPSBz
dGF0ZS0+ZmI7CiAJc3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZXZlbnQ7CiAJdTMy
IGZiX2FkZHIsIHNyY19vZmYsIHNyY193LCBzdHJpZGUsIGNwcCA9IDA7CiAKQEAgLTUxMCw3ICs1
MTEsNyBAQCB2b2lkIG14c2ZiX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IG14c2ZiX2RybV9w
cml2YXRlICpteHNmYiwKIAl9CiAJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xv
Y2spOwogCi0JaWYgKCFmYikKKwlpZiAoIWZiIHx8ICFvbGRfZmIpCiAJCXJldHVybjsKIAogCWZi
X2FkZHIgPSBteHNmYl9nZXRfZmJfcGFkZHIobXhzZmIpOwpAQCAtNTMzLDQgKzUzNCwxNyBAQCB2
b2lkIG14c2ZiX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpt
eHNmYiwKIAkJc3JjX3cgPSBuZXdfc3RhdGUtPnNyY193ID4+IDE2OwogCQlteHNmYl9zZXRfZmJf
aGNyb3AobXhzZmIsIHNyY193LCBzdHJpZGUpOwogCX0KKworCWlmIChvbGRfZmItPmZvcm1hdC0+
Zm9ybWF0ICE9IGZiLT5mb3JtYXQtPmZvcm1hdCkgeworCQlzdHJ1Y3QgZHJtX2Zvcm1hdF9uYW1l
X2J1ZiBvbGRfZm10X2J1ZjsKKwkJc3RydWN0IGRybV9mb3JtYXRfbmFtZV9idWYgbmV3X2ZtdF9i
dWY7CisKKwkJRFJNX0RFVl9ERUJVR19EUklWRVIoY3J0Yy0+ZGV2LT5kZXYsCisJCQkJIlN3aXRj
aGluZyBwaXhlbCBmb3JtYXQ6ICVzIC0+ICVzXG4iLAorCQkJCWRybV9nZXRfZm9ybWF0X25hbWUo
b2xkX2ZiLT5mb3JtYXQtPmZvcm1hdCwKKwkJCQkJCSAgICAmb2xkX2ZtdF9idWYpLAorCQkJCWRy
bV9nZXRfZm9ybWF0X25hbWUoZmItPmZvcm1hdC0+Zm9ybWF0LAorCQkJCQkJICAgICZuZXdfZm10
X2J1ZikpOworCQlteHNmYl9zZXRfcGl4ZWxfZm10KG14c2ZiLCB0cnVlKTsKKwl9CiB9Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
