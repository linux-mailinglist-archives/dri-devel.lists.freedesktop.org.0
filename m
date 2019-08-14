Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC88D28F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE338991C;
	Wed, 14 Aug 2019 11:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6DB8991C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:54:57 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hxrrj-00036w-Dx; Wed, 14 Aug 2019 13:54:55 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] gpu: ipu-v3: image-convert: fix output seam valid interval
Date: Wed, 14 Aug 2019 13:54:38 +0200
Message-Id: <20190814115444.13024-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyBhIGZhaWx1cmUgdG8gZGV0ZXJtaW5lIGFueSBzZWFtIGlmIHRoZSBvdXRwdXQg
c2l6ZSBpcwpleGFjdGx5IDEwMjQgbXVsdGlwbGllZCBieSB0aGUgbnVtYmVyIG9mIHRpbGVzIGlu
IGEgZ2l2ZW4gZGlyZWN0aW9uLgpJbiB0aGF0IGNhc2UgYW4gZW1wdHkgaW50ZXJ2YWwgb3V0X3N0
YXJ0ID09IG91dF9lbmQgaXMgYmVpbmcgcGFzc2VkCnRvIGZpbmRfYmVzdF9zZWFtLCB3aGljaCBs
b29rcyBmb3IgYSBzZWFtIG91dF9zdGFydCA8PSB4IDwgb3V0X2VuZC4KCkFsc28gcmVkdWNlIHRo
ZSBpbnRlcnZhbCBhbGwgYnV0IHRoZSBsZWZ0IGNvbHVtbiAvIHRvcCByb3csIHRvCmF2b2lkIHJl
dHVybmluZyBwb3NpdGlvbiAwIGFzIGJlc3QgZml0LgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1
LWltYWdlLWNvbnZlcnQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL2lw
dS1pbWFnZS1jb252ZXJ0LmMgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQu
YwppbmRleCA5ZDI1ZGI2OTI0YjMuLmM5OTA5ZjFjOWZmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMKKysrIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lw
dS1pbWFnZS1jb252ZXJ0LmMKQEAgLTcyMyw5ICs3MjMsOSBAQCBzdGF0aWMgdm9pZCBmaW5kX3Nl
YW1zKHN0cnVjdCBpcHVfaW1hZ2VfY29udmVydF9jdHggKmN0eCwKIAkJICovCiAKIAkJLyogU3Rh
cnQgd2l0aGluIDEwMjQgcGl4ZWxzIG9mIHRoZSByaWdodCBlZGdlICovCi0JCW91dF9zdGFydCA9
IG1heF90KGludCwgMCwgb3V0X3JpZ2h0IC0gMTAyNCk7CisJCW91dF9zdGFydCA9IG1heF90KGlu
dCwgY29sICogb3V0X2xlZnRfYWxpZ24sIG91dF9yaWdodCAtIDEwMjQpOwogCQkvKiBFbmQgYmVm
b3JlIGhhdmluZyB0byBhZGQgbW9yZSBjb2x1bW5zIHRvIHRoZSBsZWZ0ICovCi0JCW91dF9lbmQg
PSBtaW5fdCh1bnNpZ25lZCBpbnQsIG91dF9yaWdodCwgY29sICogMTAyNCk7CisJCW91dF9lbmQg
PSBtaW5fdCh1bnNpZ25lZCBpbnQsIG91dF9yaWdodCwgY29sICogMTAyNCArIDEpOwogCiAJCWZp
bmRfYmVzdF9zZWFtKGN0eCwgb3V0X3N0YXJ0LCBvdXRfZW5kLAogCQkJICAgICAgIGluX3JpZ2h0
LCBvdXRfcmlnaHQsCkBAIC03NjgsOSArNzY4LDkgQEAgc3RhdGljIHZvaWQgZmluZF9zZWFtcyhz
dHJ1Y3QgaXB1X2ltYWdlX2NvbnZlcnRfY3R4ICpjdHgsCiAJCXVuc2lnbmVkIGludCBvdXRfdG9w
OwogCiAJCS8qIFN0YXJ0IHdpdGhpbiAxMDI0IGxpbmVzIG9mIHRoZSBib3R0b20gZWRnZSAqLwot
CQlvdXRfc3RhcnQgPSBtYXhfdChpbnQsIDAsIG91dF9ib3R0b20gLSAxMDI0KTsKKwkJb3V0X3N0
YXJ0ID0gbWF4X3QoaW50LCByb3cgKiBvdXRfdG9wX2FsaWduLCBvdXRfYm90dG9tIC0gMTAyNCk7
CiAJCS8qIEVuZCBiZWZvcmUgaGF2aW5nIHRvIGFkZCBtb3JlIHJvd3MgYWJvdmUgKi8KLQkJb3V0
X2VuZCA9IG1pbl90KHVuc2lnbmVkIGludCwgb3V0X2JvdHRvbSwgcm93ICogMTAyNCk7CisJCW91
dF9lbmQgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIG91dF9ib3R0b20sIHJvdyAqIDEwMjQgKyAxKTsK
IAogCQlmaW5kX2Jlc3Rfc2VhbShjdHgsIG91dF9zdGFydCwgb3V0X2VuZCwKIAkJCSAgICAgICBp
bl9ib3R0b20sIG91dF9ib3R0b20sCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
