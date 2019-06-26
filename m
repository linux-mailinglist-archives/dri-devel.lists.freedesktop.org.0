Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98A57CDC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED46E5CE;
	Thu, 27 Jun 2019 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916176E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:32:25 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 56E1C1A0A02;
 Wed, 26 Jun 2019 15:32:24 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 49ED71A09EB;
 Wed, 26 Jun 2019 15:32:24 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A798205DB;
 Wed, 26 Jun 2019 15:32:23 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 03/10] drm/mxsfb: Fix the vblank events
Date: Wed, 26 Jun 2019 16:32:11 +0300
Message-Id: <1561555938-21595-4-git-send-email-robert.chiras@nxp.com>
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
di5jCmluZGV4IGQ5ZmI3MzQuLjhkMTQ5MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMK
QEAgLTM1LDYgKzM1LDkgQEAKICNpbmNsdWRlICJteHNmYl9kcnYuaCIKICNpbmNsdWRlICJteHNm
Yl9yZWdzLmgiCiAKKy8qIFRoZSBlTENESUYgbWF4IHBvc3NpYmxlIENSVENzICovCisjZGVmaW5l
IE1BWF9DUlRDUyAxCisKIGVudW0gbXhzZmJfZGV2dHlwZSB7CiAJTVhTRkJfVjMsCiAJTVhTRkJf
VjQsCkBAIC0xMzUsNiArMTM4LDggQEAgc3RhdGljIHZvaWQgbXhzZmJfcGlwZV9lbmFibGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQlteHNmYi0+Y29ubmVjdG9yID0g
Jm14c2ZiLT5wYW5lbF9jb25uZWN0b3I7CiAJfQogCisJZHJtX2NydGNfdmJsYW5rX29uKCZwaXBl
LT5jcnRjKTsKKwogCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZHJtLT5kZXYpOwogCWRybV9wYW5lbF9w
cmVwYXJlKG14c2ZiLT5wYW5lbCk7CiAJbXhzZmJfY3J0Y19lbmFibGUobXhzZmIpOwpAQCAtMTYx
LDYgKzE2Niw4IEBAIHN0YXRpYyB2b2lkIG14c2ZiX3BpcGVfZGlzYWJsZShzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpCiAJfQogCXNwaW5fdW5sb2NrX2lycSgmZHJtLT5ldmVu
dF9sb2NrKTsKIAorCWRybV9jcnRjX3ZibGFua19vZmYoJnBpcGUtPmNydGMpOworCiAJaWYgKG14
c2ZiLT5jb25uZWN0b3IgIT0gJm14c2ZiLT5wYW5lbF9jb25uZWN0b3IpCiAJCW14c2ZiLT5jb25u
ZWN0b3IgPSBOVUxMOwogfQpAQCAtMjQzLDcgKzI1MCw3IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCiAJcG1fcnVu
dGltZV9lbmFibGUoZHJtLT5kZXYpOwogCi0JcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwgZHJt
LT5tb2RlX2NvbmZpZy5udW1fY3J0Yyk7CisJcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwgTUFY
X0NSVENTKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJyKGRybS0+ZGV2LCAiRmFpbGVkIHRv
IGluaXRpYWxpc2UgdmJsYW5rXG4iKTsKIAkJZ290byBlcnJfdmJsYW5rOwpAQCAtMjY2LDYgKzI3
Myw4IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNp
Z25lZCBsb25nIGZsYWdzKQogCQlnb3RvIGVycl92Ymxhbms7CiAJfQogCisJZHJtX2NydGNfdmJs
YW5rX29mZigmbXhzZmItPnBpcGUuY3J0Yyk7CisKIAkvKgogCSAqIEF0dGFjaCBwYW5lbCBvbmx5
IGlmIHRoZXJlIGlzIG9uZS4KIAkgKiBJZiB0aGVyZSBpcyBubyBwYW5lbCBhdHRhY2gsIGl0IG11
c3QgYmUgYSBicmlkZ2UuIEluIHRoaXMgY2FzZSwgd2UKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
