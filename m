Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A48654D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05676E868;
	Thu,  8 Aug 2019 15:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06F6E85C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9320D28CA9E;
 Thu,  8 Aug 2019 16:12:00 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 07/19] drm/msm: Use drm_attach_bridge() to attach a bridge
 to an encoder
Date: Thu,  8 Aug 2019 17:11:38 +0200
Message-Id: <20190808151150.16336-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBwYXJ0IG9mIG91ciBhdHRlbXB0IHRvIG1ha2UgdGhlIGJyaWRnZSBjaGFpbiBhIGRv
dWJsZS1saW5rZWQKbGlzdCBiYXNlZCBvbiB0aGUgZ2VuZXJpYyBsaXN0IGhlbHBlcnMuIEluIG9y
ZGVyIHRvIGRvIHRoYXQsIHdlIG11c3QKcGF0Y2ggYWxsIGRyaXZlcnMgbWFuaXB1bGF0aW5nIHRo
ZSBlbmNvZGVyLT5icmlkZ2UgZmllbGQgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vZWRwL2VkcC5jICAgfCA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9o
ZG1pLmMgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKaW5kZXggMGYzMTJhYzViNjI0Li5hZDRlOTYzY2Nk
OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jCkBAIC0xNzgsNyArMTc4LDkgQEAgaW50IG1zbV9lZHBf
bW9kZXNldF9pbml0KHN0cnVjdCBtc21fZWRwICplZHAsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCWdvdG8gZmFpbDsKIAl9CiAKLQllbmNvZGVyLT5icmlkZ2UgPSBlZHAtPmJyaWRnZTsKKwly
ZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBlZHAtPmJyaWRnZSwgTlVMTCk7CisJaWYg
KHJldCkKKwkJZ290byBmYWlsOwogCiAJcHJpdi0+YnJpZGdlc1twcml2LT5udW1fYnJpZGdlcysr
XSAgICAgICA9IGVkcC0+YnJpZGdlOwogCXByaXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5l
Y3RvcnMrK10gPSBlZHAtPmNvbm5lY3RvcjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vaGRtaS9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jCmluZGV4IDBl
NDIxN2JlM2YwMC4uNTViOWE4YzgzMTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2hkbWkvaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKQEAgLTMy
Nyw3ICszMjcsOSBAQCBpbnQgbXNtX2hkbWlfbW9kZXNldF9pbml0KHN0cnVjdCBoZG1pICpoZG1p
LAogCQlnb3RvIGZhaWw7CiAJfQogCi0JZW5jb2Rlci0+YnJpZGdlID0gaGRtaS0+YnJpZGdlOwor
CXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGhkbWktPmJyaWRnZSwgTlVMTCk7CisJ
aWYgKHJldCkKKwkJZ290byBmYWlsOwogCiAJcHJpdi0+YnJpZGdlc1twcml2LT5udW1fYnJpZGdl
cysrXSAgICAgICA9IGhkbWktPmJyaWRnZTsKIAlwcml2LT5jb25uZWN0b3JzW3ByaXYtPm51bV9j
b25uZWN0b3JzKytdID0gaGRtaS0+Y29ubmVjdG9yOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
