Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21B98D56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5782A6EAB8;
	Thu, 22 Aug 2019 08:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BF56E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:22 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 481221A00CC;
 Wed, 21 Aug 2019 12:16:21 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B53E1A0045;
 Wed, 21 Aug 2019 12:16:21 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C2D7205D3;
 Wed, 21 Aug 2019 12:16:20 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 07/15] drm/mxsfb: Fix the vblank events
Date: Wed, 21 Aug 2019 13:15:47 +0300
Message-Id: <1566382555-12102-8-git-send-email-robert.chiras@nxp.com>
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

Q3VycmVudGx5LCB0aGUgdmJsYW5rIHN1cHBvcnQgaXMgbm90IGNvcnJlY3RseSBpbXBsZW1lbnRl
ZCBpbiBNWFNGQl9EUk0KZHJpdmVyLiBUaGUgY2FsbCB0byBkcm1fdmJsYW5rX2luaXQgaXMgbWFk
ZSB3aXRoIG1vZGVfY29uZmlnLm51bV9jcnRjCndoaWNoIGF0IHRoYXQgdGltZSBpcyAwLiBCZWNh
dXNlIG9mIHRoaXMsIHZibGFuayBpcyBub3QgYWN0aXZhdGVkLCBzbwp0aGVyZSB3b24ndCBiZSBh
bnkgdmJsYW5rIGV2ZW50IHN1Ym1pdHRlZC4KRm9yIGV4YW1wbGUsIHdoZW4gcnVubmluZyBtb2Rl
dGVzdCB3aXRoIHRoZSAnLXYnIHBhcmFtZXRlciB3aWxsIHJlc3VsdAppbiBhbiBhc3Ryb25vbWlj
YWwgcmVmcmVzaCByYXRlICgxMDAwMCsgSHopLCBiZWNhdXNlIG9mIHRoYXQuCgpTaWduZWQtb2Zm
LWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXhzZmIvbXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMK
aW5kZXggMjc0Mzk3NS4uNzhhMjM4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwpAQCAt
MzgsNiArMzgsOSBAQAogI2luY2x1ZGUgIm14c2ZiX2Rydi5oIgogI2luY2x1ZGUgIm14c2ZiX3Jl
Z3MuaCIKIAorLyogVGhlIGVMQ0RJRiBtYXggcG9zc2libGUgQ1JUQ3MgKi8KKyNkZWZpbmUgTUFY
X0NSVENTIDEKKwogZW51bSBteHNmYl9kZXZ0eXBlIHsKIAlNWFNGQl9WMywKIAlNWFNGQl9WNCwK
QEAgLTEzOCw2ICsxNDEsOCBAQCBzdGF0aWMgdm9pZCBteHNmYl9waXBlX2VuYWJsZShzdHJ1Y3Qg
ZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCW14c2ZiLT5jb25uZWN0b3IgPSAmbXhz
ZmItPnBhbmVsX2Nvbm5lY3RvcjsKIAl9CiAKKwlkcm1fY3J0Y192Ymxhbmtfb24oJnBpcGUtPmNy
dGMpOworCiAJcG1fcnVudGltZV9nZXRfc3luYyhkcm0tPmRldik7CiAJZHJtX3BhbmVsX3ByZXBh
cmUobXhzZmItPnBhbmVsKTsKIAlteHNmYl9jcnRjX2VuYWJsZShteHNmYik7CkBAIC0xNjQsNiAr
MTY5LDggQEAgc3RhdGljIHZvaWQgbXhzZmJfcGlwZV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZSAqcGlwZSkKIAl9CiAJc3Bpbl91bmxvY2tfaXJxKCZkcm0tPmV2ZW50X2xv
Y2spOwogCisJZHJtX2NydGNfdmJsYW5rX29mZigmcGlwZS0+Y3J0Yyk7CisKIAlpZiAobXhzZmIt
PmNvbm5lY3RvciAhPSAmbXhzZmItPnBhbmVsX2Nvbm5lY3RvcikKIAkJbXhzZmItPmNvbm5lY3Rv
ciA9IE5VTEw7CiB9CkBAIC0yNDYsNyArMjUzLDcgQEAgc3RhdGljIGludCBteHNmYl9sb2FkKHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCiAKIAlwbV9ydW50aW1l
X2VuYWJsZShkcm0tPmRldik7CiAKLQlyZXQgPSBkcm1fdmJsYW5rX2luaXQoZHJtLCBkcm0tPm1v
ZGVfY29uZmlnLm51bV9jcnRjKTsKKwlyZXQgPSBkcm1fdmJsYW5rX2luaXQoZHJtLCBNQVhfQ1JU
Q1MpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIoZHJtLT5kZXYsICJGYWlsZWQgdG8gaW5p
dGlhbGlzZSB2YmxhbmtcbiIpOwogCQlnb3RvIGVycl92Ymxhbms7Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
