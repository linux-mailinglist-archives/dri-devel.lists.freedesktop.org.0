Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA98E6B2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3806E91B;
	Thu, 15 Aug 2019 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBC6E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:58 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AE348200376;
 Wed, 14 Aug 2019 12:49:03 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AB48F2003CB;
 Wed, 14 Aug 2019 12:49:03 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id AD1482060E;
 Wed, 14 Aug 2019 12:49:02 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 07/15] drm/mxsfb: Fix the vblank events
Date: Wed, 14 Aug 2019 13:48:43 +0300
Message-Id: <1565779731-1300-8-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
cHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgMTEgKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ry
di5jCmluZGV4IDI3NDM5NzUuLjgyOWFiZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMK
QEAgLTM4LDYgKzM4LDkgQEAKICNpbmNsdWRlICJteHNmYl9kcnYuaCIKICNpbmNsdWRlICJteHNm
Yl9yZWdzLmgiCiAKKy8qIFRoZSBlTENESUYgbWF4IHBvc3NpYmxlIENSVENzICovCisjZGVmaW5l
IE1BWF9DUlRDUyAxCisKIGVudW0gbXhzZmJfZGV2dHlwZSB7CiAJTVhTRkJfVjMsCiAJTVhTRkJf
VjQsCkBAIC0xMzgsNiArMTQxLDggQEAgc3RhdGljIHZvaWQgbXhzZmJfcGlwZV9lbmFibGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQlteHNmYi0+Y29ubmVjdG9yID0g
Jm14c2ZiLT5wYW5lbF9jb25uZWN0b3I7CiAJfQogCisJZHJtX2NydGNfdmJsYW5rX29uKCZwaXBl
LT5jcnRjKTsKKwogCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZHJtLT5kZXYpOwogCWRybV9wYW5lbF9w
cmVwYXJlKG14c2ZiLT5wYW5lbCk7CiAJbXhzZmJfY3J0Y19lbmFibGUobXhzZmIpOwpAQCAtMTY0
LDYgKzE2OSw4IEBAIHN0YXRpYyB2b2lkIG14c2ZiX3BpcGVfZGlzYWJsZShzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpCiAJfQogCXNwaW5fdW5sb2NrX2lycSgmZHJtLT5ldmVu
dF9sb2NrKTsKIAorCWRybV9jcnRjX3ZibGFua19vZmYoJnBpcGUtPmNydGMpOworCiAJaWYgKG14
c2ZiLT5jb25uZWN0b3IgIT0gJm14c2ZiLT5wYW5lbF9jb25uZWN0b3IpCiAJCW14c2ZiLT5jb25u
ZWN0b3IgPSBOVUxMOwogfQpAQCAtMjQ2LDcgKzI1Myw3IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCiAJcG1fcnVu
dGltZV9lbmFibGUoZHJtLT5kZXYpOwogCi0JcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwgZHJt
LT5tb2RlX2NvbmZpZy5udW1fY3J0Yyk7CisJcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwgTUFY
X0NSVENTKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJyKGRybS0+ZGV2LCAiRmFpbGVkIHRv
IGluaXRpYWxpc2UgdmJsYW5rXG4iKTsKIAkJZ290byBlcnJfdmJsYW5rOwpAQCAtMjY5LDYgKzI3
Niw4IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNp
Z25lZCBsb25nIGZsYWdzKQogCQlnb3RvIGVycl92Ymxhbms7CiAJfQogCisJZHJtX2NydGNfdmJs
YW5rX29mZigmbXhzZmItPnBpcGUuY3J0Yyk7CisKIAkvKgogCSAqIEF0dGFjaCBwYW5lbCBvbmx5
IGlmIHRoZXJlIGlzIG9uZS4KIAkgKiBJZiB0aGVyZSBpcyBubyBwYW5lbCBhdHRhY2gsIGl0IG11
c3QgYmUgYSBicmlkZ2UuIEluIHRoaXMgY2FzZSwgd2UKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
