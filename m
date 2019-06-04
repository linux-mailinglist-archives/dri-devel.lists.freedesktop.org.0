Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556834A55
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1144899DE;
	Tue,  4 Jun 2019 14:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61F897E3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:23:24 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 664D468BFE; Tue,  4 Jun 2019 14:22:58 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 4/7] drm/bridge: Prepare Analogix anx6345 support
References: <20190604122150.29D6468B05@newverein.lst.de>
Message-Id: <20190604122258.664D468BFE@newverein.lst.de>
Date: Tue,  4 Jun 2019 14:22:58 +0200 (CEST)
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpdCBkZWZpbml0aW9ucyByZXF1aXJlZCBmb3IgdGhlIGFueDYzNDUgYW5kIGFkZCBhCnNh
bml0eSBjaGVjayBpbiBhbnhfZHBfYXV4X3RyYW5zZmVyLgoKU2lnbmVkLW9mZi1ieTogSWNlbm93
eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgpTaWduZWQtb2ZmLWJ5OiBWYXNpbHkgS2hvcnV6aGlj
ayA8YW5hcnNvdWxAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1d2UgPGR1d2VA
c3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWky
Yy1kcHR4LmMgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1pMmMtZHB0eC5oICAgICB8IDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW5hbG9naXgtaTJjLXR4Y29tbW9uLmggfCAzICsrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5jCmluZGV4IGQ2MDE2Zjc4OWQ4
MC4uZTlkMmVkNGQ0MTBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5jCkBAIC0xMjQsNyArMTI0LDcgQEAgc3NpemVfdCBhbnhf
ZHBfYXV4X3RyYW5zZmVyKHN0cnVjdCByZWdtYXAgKm1hcF9kcHR4LAogCWVsc2UJLyogRm9yIG5v
bi16ZXJvLXNpemVkIHNldCB0aGUgbGVuZ3RoIGZpZWxkLiAqLwogCQljdHJsMSB8PSAobXNnLT5z
aXplIC0gMSkgPDwgU1BfQVVYX0xFTkdUSF9TSElGVDsKIAotCWlmICgobXNnLT5yZXF1ZXN0ICYg
RFBfQVVYX0kyQ19SRUFEKSA9PSAwKSB7CisJaWYgKChtc2ctPnNpemUgPiAwKSAmJiAoKG1zZy0+
cmVxdWVzdCAmIERQX0FVWF9JMkNfUkVBRCkgPT0gMCkpIHsKIAkJLyogV2hlbiBXUklURSB8IE1P
VCB3cml0ZSB2YWx1ZXMgdG8gZGF0YSBidWZmZXIgKi8KIAkJZXJyID0gcmVnbWFwX2J1bGtfd3Jp
dGUobWFwX2RwdHgsCiAJCQkJCVNQX0RQX0JVRl9EQVRBMF9SRUcsIGJ1ZmZlciwKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguaCBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguaAppbmRl
eCAzMDQzNmM4OGYxODEuLjk1YWI4OWVlY2M2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguaApAQCAtODMsNyArODMsMTEgQEAK
ICNkZWZpbmUgU1BfQ0hBX1NUQQkJCUJJVCgyKQogLyogQml0cyBmb3IgRFAgU3lzdGVtIENvbnRy
b2wgUmVnaXN0ZXIgMyAqLwogI2RlZmluZSBTUF9IUERfU1RBVFVTCQkJQklUKDYpCisjZGVmaW5l
IFNQX0hQRF9GT1JDRQkJCUJJVCg1KQorI2RlZmluZSBTUF9IUERfQ1RSTAkJCUJJVCg0KQogI2Rl
ZmluZSBTUF9TVFJNX1ZBTElECQkJQklUKDIpCisjZGVmaW5lIFNQX1NUUk1fRk9SQ0UJCQlCSVQo
MSkKKyNkZWZpbmUgU1BfU1RSTV9DVFJMCQkJQklUKDApCiAvKiBCaXRzIGZvciBEUCBTeXN0ZW0g
Q29udHJvbCBSZWdpc3RlciA0ICovCiAjZGVmaW5lIFNQX0VOSEFOQ0VEX01PREUJCUJJVCgzKQog
CkBAIC0xMjgsNiArMTMyLDkgQEAKICNkZWZpbmUgU1BfTElOS19CV19TRVRfTUFTSwkJMHgxZgog
I2RlZmluZSBTUF9JTklUSUFMX1NMSU1fTV9BVURfU0VMCUJJVCg1KQogCisvKiBEUCBMYW5lIENv
dW50IFNldHRpbmcgUmVnaXN0ZXIgKi8KKyNkZWZpbmUgU1BfRFBfTEFORV9DT1VOVF9TRVRfUkVH
CTB4YTEKKwogLyogRFAgVHJhaW5pbmcgUGF0dGVybiBTZXQgUmVnaXN0ZXIgKi8KICNkZWZpbmUg
U1BfRFBfVFJBSU5JTkdfUEFUVEVSTl9TRVRfUkVHCTB4YTIKIApAQCAtMTQxLDYgKzE0OCw3IEBA
CiAKIC8qIERQIExpbmsgVHJhaW5pbmcgQ29udHJvbCBSZWdpc3RlciAqLwogI2RlZmluZSBTUF9E
UF9MVF9DVFJMX1JFRwkJMHhhOAorI2RlZmluZSBTUF9EUF9MVF9JTlBST0dSRVNTCQkweDgwCiAj
ZGVmaW5lIFNQX0xUX0VSUk9SX1RZUEVfTUFTSwkJMHg3MAogIyAgZGVmaW5lIFNQX0xUX05PX0VS
Uk9SCQkweDAwCiAjICBkZWZpbmUgU1BfTFRfQVVYX1dSSVRFX0VSUk9SCQkweDAxCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy10eGNvbW1v
bi5oIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtdHhjb21t
b24uaAppbmRleCBmNDgyOTNmODZmOWQuLmUzMzkxYTUwYjVkMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtdHhjb21tb24uaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy10eGNvbW1vbi5oCkBA
IC0xODgsNiArMTg4LDkgQEAKICNkZWZpbmUgU1BfVkJJVAkJCQlCSVQoMSkKICNkZWZpbmUgU1Bf
QVVESU9fTEFZT1VUCQkJQklUKDApCiAKKy8qIEFuYWxvZyBEZWJ1ZyBSZWdpc3RlciAxICovCisj
ZGVmaW5lIFNQX0FOQUxPR19ERUJVRzFfUkVHCQkweGRjCisKIC8qIEFuYWxvZyBEZWJ1ZyBSZWdp
c3RlciAyICovCiAjZGVmaW5lIFNQX0FOQUxPR19ERUJVRzJfUkVHCQkweGRkCiAjZGVmaW5lIFNQ
X0ZPUkNFX1NXX09GRl9CWVBBU1MJCTB4MjAKLS0gCjIuMTYuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
