Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA1FF92C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9F46E46B;
	Sun, 17 Nov 2019 11:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5A6E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 53B9D28FCA8
Received: by earth.universe (Postfix, from userid 1000)
 id 5DA953C0CB2; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 38/42] drm/omap: panel-dsi-cm: do not power on/off twice
Date: Sun, 17 Nov 2019 03:40:24 +0100
Message-Id: <20191117024028.2233-39-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBzdXJlLCB0aGF0IHdlIG9ubHkgcG93ZXIgb24vb2ZmIHRoZSBkZXZpY2Ugb25jZS4KClNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJv
cmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1j
bS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4IDkwMTMy
ZDFkMWY1ZC4uN2Y2YjExMjk4NjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
aXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtMjkwLDYgKzI5MCw5IEBAIHN0YXRpYyBpbnQgZHNp
Y21fcG93ZXJfb24oc3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSkKIAl1OCBpZDEsIGlkMiwg
aWQzOwogCWludCByOwogCisJaWYgKGRkYXRhLT5lbmFibGVkKQorCQlyZXR1cm4gMDsKKwogCXIg
PSByZWd1bGF0b3JfYnVsa19lbmFibGUoRENTX1JFR1VMQVRPUl9TVVBQTFlfTlVNLCBkZGF0YS0+
c3VwcGxpZXMpOwogCWlmIChyKSB7CiAJCWRldl9lcnIoJmRkYXRhLT5kc2ktPmRldiwgImZhaWxl
ZCB0byBlbmFibGUgc3VwcGxpZXM6ICVkXG4iLCByKTsKQEAgLTM1NCw2ICszNTcsOSBAQCBzdGF0
aWMgaW50IGRzaWNtX3Bvd2VyX29mZihzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEgKmRkYXRhKQogewog
CWludCByOwogCisJaWYgKCFkZGF0YS0+ZW5hYmxlZCkKKwkJcmV0dXJuIDA7CisKIAlkZGF0YS0+
ZW5hYmxlZCA9IDA7CiAKIAlyID0gbWlwaV9kc2lfZGNzX3NldF9kaXNwbGF5X29mZihkZGF0YS0+
ZHNpKTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
