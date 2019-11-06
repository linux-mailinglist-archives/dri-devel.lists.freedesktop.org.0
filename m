Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CCF2844
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B976EEA9;
	Thu,  7 Nov 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1238 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2019 11:47:47 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEFB6ECE8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 11:47:47 +0000 (UTC)
Received: from [94.134.91.181] (helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSJSn-0004nK-1P; Wed, 06 Nov 2019 12:27:01 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: dri-devel@lists.freedesktop.org,
	a.hajda@samsung.com
Subject: [PATCH 1/3] drm/bridge/synopsys: dsi: move phy_ops callbacks around
 panel enablement
Date: Wed,  6 Nov 2019 12:26:48 +0100
Message-Id: <20191106112650.8365-1-heiko.stuebner@theobroma-systems.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgcGh5X29wcyBuZWVkIHRvIGJlIGRlZmluZWQgdGhl
eSBwcm9iYWJseQpzaG91bGQgYmUgZW5hYmxlZCBiZWZvcmUgdHJ5aW5nIHRvIHRhbGsgdG8gdGhl
IHBhbmVsIGFuZCBkaXNhYmxlZCBvbmx5CmFmdGVyIHRoZSBwYW5lbCB3YXMgZGlzYWJsZWQuCgpS
aWdodCBub3cgdGhleSBhcmUgZW5hYmxlZCBsYXN0IGFuZCBkaXNhYmxlZCBmaXJzdCwgc28gbWln
aHQgbWFrZSBpdAppbXBvc3NpYmxlIHRvIHRhbGsgdG8gc29tZSBwYW5lbHMgLSBleGFtcGxlIGZv
ciB0aGlzIGJlaW5nIHRoZSBweDMwCndpdGggYW4gZXh0ZXJuYWwgSW5ub3NpbGljb24gZHBoeSB0
aGF0IG5lZWRzIHRoZSBwaHkgdG8gYmUgZW5hYmxlZAp0byB0cmFuc2ZlciBjb21tYW5kcyB0byB0
aGUgcGFuZWwuCgpTbyBtb3ZlIHRoZSBjYWxscyBhcHByb3ByaWF0ZWx5LgoKU2lnbmVkLW9mZi1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCAxMyAr
KysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlw
aS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwpp
bmRleCA2NzU0NDJiZmMxYmQuLjQ5ZjU2MDBhMWRlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwpAQCAtNzk3LDkgKzc5Nyw2IEBAIHN0YXRpYyB2
b2lkIGR3X21pcGlfZHNpX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKIAlzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSA9IGJyaWRnZV90b19kc2koYnJpZGdlKTsK
IAljb25zdCBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wcyAqcGh5X29wcyA9IGRzaS0+cGxhdF9k
YXRhLT5waHlfb3BzOwogCi0JaWYgKHBoeV9vcHMtPnBvd2VyX29mZikKLQkJcGh5X29wcy0+cG93
ZXJfb2ZmKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEpOwotCiAJLyoKIAkgKiBTd2l0Y2ggdG8g
Y29tbWFuZCBtb2RlIGJlZm9yZSBwYW5lbC1icmlkZ2UgcG9zdF9kaXNhYmxlICYKIAkgKiBwYW5l
bCB1bnByZXBhcmUuCkBAIC04MTYsNiArODEzLDkgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lf
YnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCSAqLwogCWRz
aS0+cGFuZWxfYnJpZGdlLT5mdW5jcy0+cG9zdF9kaXNhYmxlKGRzaS0+cGFuZWxfYnJpZGdlKTsK
IAorCWlmIChwaHlfb3BzLT5wb3dlcl9vZmYpCisJCXBoeV9vcHMtPnBvd2VyX29mZihkc2ktPnBs
YXRfZGF0YS0+cHJpdl9kYXRhKTsKKwogCWlmIChkc2ktPnNsYXZlKSB7CiAJCWR3X21pcGlfZHNp
X2Rpc2FibGUoZHNpLT5zbGF2ZSk7CiAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnNsYXZl
LT5wY2xrKTsKQEAgLTg4Miw2ICs4ODIsOSBAQCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9tb2Rl
X3NldChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSwKIAogCS8qIFN3aXRjaCB0byBjbWQgbW9kZSBm
b3IgcGFuZWwtYnJpZGdlIHByZV9lbmFibGUgJiBwYW5lbCBwcmVwYXJlICovCiAJZHdfbWlwaV9k
c2lfc2V0X21vZGUoZHNpLCAwKTsKKworCWlmIChwaHlfb3BzLT5wb3dlcl9vbikKKwkJcGh5X29w
cy0+cG93ZXJfb24oZHNpLT5wbGF0X2RhdGEtPnByaXZfZGF0YSk7CiB9CiAKIHN0YXRpYyB2b2lk
IGR3X21pcGlfZHNpX2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLApA
QCAtODk4LDE1ICs5MDEsMTEgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX21vZGVf
c2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9i
cmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiB7CiAJc3RydWN0IGR3X21p
cGlfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNpKGJyaWRnZSk7Ci0JY29uc3Qgc3RydWN0IGR3X21p
cGlfZHNpX3BoeV9vcHMgKnBoeV9vcHMgPSBkc2ktPnBsYXRfZGF0YS0+cGh5X29wczsKIAogCS8q
IFN3aXRjaCB0byB2aWRlbyBtb2RlIGZvciBwYW5lbC1icmlkZ2UgZW5hYmxlICYgcGFuZWwgZW5h
YmxlICovCiAJZHdfbWlwaV9kc2lfc2V0X21vZGUoZHNpLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsK
IAlpZiAoZHNpLT5zbGF2ZSkKIAkJZHdfbWlwaV9kc2lfc2V0X21vZGUoZHNpLT5zbGF2ZSwgTUlQ
SV9EU0lfTU9ERV9WSURFTyk7Ci0KLQlpZiAocGh5X29wcy0+cG93ZXJfb24pCi0JCXBoeV9vcHMt
PnBvd2VyX29uKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEpOwogfQogCiBzdGF0aWMgZW51bSBk
cm1fbW9kZV9zdGF0dXMKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
