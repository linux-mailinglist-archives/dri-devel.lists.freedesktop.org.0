Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD957ECE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 11:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B686E81E;
	Thu, 27 Jun 2019 09:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8A6E83F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 09:00:05 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hgQG8-0003rf-4T; Thu, 27 Jun 2019 11:00:00 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: tc358767: do a software reset if reset pin isn't
 connected
Date: Thu, 27 Jun 2019 10:59:58 +0200
Message-Id: <20190627085958.28331-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gZ2V0IHRoZSBjaGlwIGludG8gdGhlIGV4cGVjdGVkIHN0YXRlLCBldmVuIHdoZW4gdGhlIGhh
cmR3YXJlIHJlc2V0IHBpbgppc24ndCBjb25uZWN0ZWQsIGRvIGEgc29mdHdhcmUgcmVzZXQgaW4g
dGhpcyBjYXNlLiBJdCBpc24ndCBhcyB0aG9yb3VnaCBhcwp0aGUgaGFyZHdhcmUgcmVzZXQsIGFz
IHRoZSBJMkMgY29tbXVuaWNhdGlvbiBibG9jayBjYW4gbm90IGJlIHJlc2V0IGZvcgpvYnZpb3Vz
IHJlYXNvbnMsIGJ1dCBpdCdzIGdldHRpbmcgdGhlIGNoaXAgaW50byBhIGRlZmluZWQgc3RhdGUu
CgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKaW5kZXggMTNhZGUyOGEzNmE4Li4xZDViYTQ1MWUyNjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKQEAgLTcwLDYgKzcwLDEzIEBACiAjZGVmaW5lIERQMF9WSURTUkNf
RFNJX1JYCQkoMSA8PCAwKQogI2RlZmluZSBEUDBfVklEU1JDX0RQSV9SWAkJKDIgPDwgMCkKICNk
ZWZpbmUgRFAwX1ZJRFNSQ19DT0xPUl9CQVIJCSgzIDw8IDApCisjZGVmaW5lIFNZU1JTVEVOQgkJ
MHgwNTBjCisjZGVmaW5lIEVOQkkyQwkJCQkoMSA8PCAwKQorI2RlZmluZSBFTkJMQ0QwCQkJCSgx
IDw8IDIpCisjZGVmaW5lIEVOQkJNCQkJCSgxIDw8IDMpCisjZGVmaW5lIEVOQkRTSVJYCQkJKDEg
PDwgNCkKKyNkZWZpbmUgRU5CUkVHCQkJCSgxIDw8IDUpCisjZGVmaW5lIEVOQkhEQ1AJCQkJKDEg
PDwgOCkKICNkZWZpbmUgR1BJT00JCQkweDA1NDAKICNkZWZpbmUgR1BJT0MJCQkweDA1NDQKICNk
ZWZpbmUgR1BJT08JCQkweDA1NDgKQEAgLTE0OTcsNiArMTUwNCwyMiBAQCBzdGF0aWMgaW50IHRj
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkICppZCkKIAogCXRjLT5hc3NyID0gKHRjLT5yZXYgPT0gMHg2NjAxKTsgLyogRW5hYmxlIEFT
U1IgZm9yIGVEUCBwYW5lbHMgKi8KIAorCWlmICghdGMtPnJlc2V0X2dwaW8pIHsKKwkJLyoKKwkJ
ICogSWYgdGhlIHJlc2V0IHBpbiBpc24ndCBwcmVzZW50LCBkbyBhIHNvZnR3YXJlIHJlc2V0LiBJ
dCBpc24ndAorCQkgKiBhcyB0aG9yb3VnaCBhcyB0aGUgaGFyZHdhcmUgcmVzZXQsIGFzIHdlIGNh
bid0IHJlc2V0IHRoZSBJMkMKKwkJICogY29tbXVuaWNhdGlvbiBibG9jayBmb3Igb2J2aW91cyBy
ZWFzb25zLCBidXQgaXQncyBnZXR0aW5nIHRoZQorCQkgKiBjaGlwIGludG8gYSBkZWZpbmVkIHN0
YXRlLgorCQkgKi8KKwkJcmVnbWFwX3VwZGF0ZV9iaXRzKHRjLT5yZWdtYXAsIFNZU1JTVEVOQiwK
KwkJCQlFTkJMQ0QwIHwgRU5CQk0gfCBFTkJEU0lSWCB8IEVOQlJFRyB8IEVOQkhEQ1AsCisJCQkJ
MCk7CisJCXJlZ21hcF91cGRhdGVfYml0cyh0Yy0+cmVnbWFwLCBTWVNSU1RFTkIsCisJCQkJRU5C
TENEMCB8IEVOQkJNIHwgRU5CRFNJUlggfCBFTkJSRUcgfCBFTkJIRENQLAorCQkJCUVOQkxDRDAg
fCBFTkJCTSB8IEVOQkRTSVJYIHwgRU5CUkVHIHwgRU5CSERDUCk7CisJCXVzbGVlcF9yYW5nZSg1
MDAwLCAxMDAwMCk7CisJfQorCiAJaWYgKHRjLT5ocGRfcGluID49IDApIHsKIAkJdTMyIGxjbnRf
cmVnID0gdGMtPmhwZF9waW4gPT0gMCA/IElOVF9HUDBfTENOVCA6IElOVF9HUDFfTENOVDsKIAkJ
dTMyIGhfbGMgPSBJTlRfR1BJT19IKHRjLT5ocGRfcGluKSB8IElOVF9HUElPX0xDKHRjLT5ocGRf
cGluKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
