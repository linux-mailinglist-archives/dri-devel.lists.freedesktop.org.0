Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB2F556A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB896E1BD;
	Tue, 25 Jun 2019 18:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662E6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 8D2A6286276
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/vblank: estimate vblank while disabling vblank if
 interrupt disabled
Date: Tue, 25 Jun 2019 18:59:14 +0100
Message-Id: <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1561483965.git.bob.beckett@collabora.com>
References: <cover.1561483965.git.bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgKGUuZy4gdmlhIHZibGFua19kaXNhYmxlX2ZuKSBh
bmQgd2UgY29tZSB0bwpkaXNhYmxlIHZibGFuaywgdXBkYXRlIHRoZSB2YmxhbmsgY291bnQgdG8g
YmVzdCBndWVzcyBhcyB0byB3aGF0IGl0CndvdWxkIGJlIGhhZCB0aGUgaW50ZXJydXB0cyByZW1h
aW5lZCBlbmFibGVkLCBhbmQgdXBkYXRlIHRoZSB0aW1lc2FtcCB0bwpub3cuCgpUaGlzIGF2b2lk
cyBhIHN0YWxlIHZibGFuayBldmVudCBiZWluZyBzZW50IHdoaWxlIGRpc2FibGluZyBjcnRjcyBk
dXJpbmcKYXRvbWljIG1vZGVzZXQuCgpGaXhlczogNjgwMzZiMDhiOTFiYyAoImRybS92Ymxhbms6
IERvIG5vdCB1cGRhdGUgdmJsYW5rIGNvdW50IGlmIGludGVycnVwdHMKYXJlIGFscmVhZHkgZGlz
YWJsZWQuIikKClNpZ25lZC1vZmYtYnk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVja2V0dEBjb2xs
YWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAxNiArKysrKysr
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ZibGFuay5jCmluZGV4IDdkYWJiMmJkYjczMy4uZGI2OGI4Y2JmNzk3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKQEAgLTM3NSw5ICszNzUsMjMgQEAgdm9pZCBkcm1fdmJsYW5rX2Rpc2Fi
bGVfYW5kX3NhdmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCiAJ
ICogaW50ZXJydXB0cyB3ZXJlIGVuYWJsZWQuIFRoaXMgYXZvaWRzIGNhbGxpbmcgdGhlIC0+ZGlz
YWJsZV92YmxhbmsoKQogCSAqIG9wZXJhdGlvbiBpbiBhdG9taWMgY29udGV4dCB3aXRoIHRoZSBo
YXJkd2FyZSBwb3RlbnRpYWxseSBydW50aW1lCiAJICogc3VzcGVuZGVkLgorCSAqIElmIGludGVy
cnVwdHMgYXJlIGRpc2FibGVkIChlLmcuIHZpYSBibGFua19kaXNhYmxlX2ZuKSB0aGVuIG1ha2UK
KwkgKiBiZXN0IGd1ZXNzIGFzIHRvIHdoYXQgaXQgd291bGQgYmUgbm93IGFuZCBtYWtlIHN1cmUg
d2UgaGF2ZSBhbiB1cAorCSAqIHRvIGRhdGUgdGltZXN0YW1wLgogCSAqLwotCWlmICghdmJsYW5r
LT5lbmFibGVkKQorCWlmICghdmJsYW5rLT5lbmFibGVkKSB7CisJCWt0aW1lX3Qgbm93ID0ga3Rp
bWVfZ2V0KCk7CisJCXUzMiBkaWZmID0gMDsKKwkJaWYgKHZibGFuay0+ZnJhbWVkdXJfbnMpIHsK
KwkJCXU2NCBkaWZmX25zID0ga3RpbWVfdG9fbnMoa3RpbWVfc3ViKG5vdywgdmJsYW5rLT50aW1l
KSk7CisJCQlkaWZmID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKGRpZmZfbnMsCisJCQkJCQkgICAg
IHZibGFuay0+ZnJhbWVkdXJfbnMpOworCQl9CisKKwkJc3RvcmVfdmJsYW5rKGRldiwgcGlwZSwg
ZGlmZiwgbm93LCB2YmxhbmstPmNvdW50KTsKKwogCQlnb3RvIG91dDsKKwl9CiAKIAkvKgogCSAq
IFVwZGF0ZSB0aGUgY291bnQgYW5kIHRpbWVzdGFtcCB0byBtYWludGFpbiB0aGUKLS0gCjIuMTgu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
