Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D8CDC0E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76396E466;
	Mon,  7 Oct 2019 07:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2368C6E400
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 16:04:42 +0000 (UTC)
Received: from [199.195.250.187] (port=38244 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iH91S-0004Pf-KI; Sun, 06 Oct 2019 17:04:38 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 44C978289D;
 Sun,  6 Oct 2019 16:04:33 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/sun4i: dsi: fix the overhead of the horizontal
 front porch
Date: Mon,  7 Oct 2019 00:03:01 +0800
Message-Id: <20191006160303.24413-3-icenowy@aosc.io>
In-Reply-To: <20191006160303.24413-1-icenowy@aosc.io>
References: <20191006160303.24413-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvcm11bGEgaW4gdGhlIEJTUCBrZXJuZWwgaW5kaWNhdGVzIHRoYXQgYSAxNi1ieXRlIG92
ZXJoZWFkIGlzIHVzZWQKd2hlbiBzZW5kaW5nIHRoZSBIRlAuIEhvd2V2ZXIsIHRoaXMgdmFsdWUg
aXMgY3VycmVudGx5IHNldCB0byA2IGluIHRoZQpzdW42aV9taXBpX2RzaSBkcml2ZXIsIHdoaWNo
IG1ha2VzIHNvbWUgcGFuZWxzIGZsYXNoaW5nLgoKRml4IHRoaXMgb3ZlcmhlYWQgdmFsdWUuCgpT
aWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW42aV9taXBpX2RzaS5jCmluZGV4IGI4YTBkMDUwMWNhNy4uOGZlODA1MWMzNGU2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwpAQCAtNTY5LDExICs1NjksMTIgQEAg
c3RhdGljIHZvaWQgc3VuNmlfZHNpX3NldHVwX3RpbWluZ3Moc3RydWN0IHN1bjZpX2RzaSAqZHNp
LAogCQkJICAobW9kZS0+aHRvdGFsIC0gbW9kZS0+aHN5bmNfZW5kKSAqIEJwcCAtIEhCUF9QQUNL
RVRfT1ZFUkhFQUQpOwogCiAJCS8qCi0JCSAqIFRoZSBmcm9udHBvcmNoIGlzIHNldCB1c2luZyBh
IGJsYW5raW5nIHBhY2tldCAoNAotCQkgKiBieXRlcyArIHBheWxvYWQgKyAyIGJ5dGVzKS4gSXRz
IG1pbmltYWwgc2l6ZSBpcwotCQkgKiB0aGVyZWZvcmUgNiBieXRlcworCQkgKiBUaGUgZnJvbnRw
b3JjaCBpcyBzZXQgdXNpbmcgYSBzeW5jIGV2ZW50ICg0IGJ5dGVzKQorCQkgKiBhbmQgdHdvIGJs
YW5raW5nIHBhY2tldHMgKGVhY2ggb25lIGlzIDQgYnl0ZXMgKworCQkgKiBwYXlsb2FkICsgMiBi
eXRlcykuIEl0cyBtaW5pbWFsIHNpemUgaXMgdGhlcmVmb3JlCisJCSAqIDE2IGJ5dGVzCiAJCSAq
LwotI2RlZmluZSBIRlBfUEFDS0VUX09WRVJIRUFECTYKKyNkZWZpbmUgSEZQX1BBQ0tFVF9PVkVS
SEVBRAkxNgogCQloZnAgPSBtYXgoKHVuc2lnbmVkIGludClIRlBfUEFDS0VUX09WRVJIRUFELAog
CQkJICAobW9kZS0+aHN5bmNfc3RhcnQgLSBtb2RlLT5oZGlzcGxheSkgKiBCcHAgLSBIRlBfUEFD
S0VUX09WRVJIRUFEKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
