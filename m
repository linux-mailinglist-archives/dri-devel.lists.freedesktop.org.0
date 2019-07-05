Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32260AE6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 19:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077866E524;
	Fri,  5 Jul 2019 17:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B2E6E525
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 17:17:32 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hjRpw-0007A3-7t; Fri, 05 Jul 2019 19:17:28 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/etnaviv: split out starting of FE idle loop
Date: Fri,  5 Jul 2019 19:17:25 +0200
Message-Id: <20190705171727.27501-6-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705171727.27501-1-l.stach@pengutronix.de>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBidWZmZXIgc2V0dXAgYW5kIHN0YXJ0aW5nIG9mIHRoZSBGRSBsb29wIGluIHRoZSBrZXJu
ZWwgcmluZ2J1ZmZlcgppbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24uIFRoaXMgaXMgYSBwcmVwYXJh
dGlvbiB0byBzdGFydCB0aGUgRkUgbGF0ZXIKaW4gdGhlIHN1Ym1pdCBwcm9jZXNzLgoKU2lnbmVk
LW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDI2ICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggYTUzZmVjZDE3ZmE5Li5i
NDZkODIwN2Y2ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAtNjAw
LDYgKzYwMCwyMCBAQCB2b2lkIGV0bmF2aXZfZ3B1X3N0YXJ0X2ZlKHN0cnVjdCBldG5hdml2X2dw
dSAqZ3B1LCB1MzIgYWRkcmVzcywgdTE2IHByZWZldGNoKQogCX0KIH0KIAorc3RhdGljIHZvaWQg
ZXRuYXZpdl9ncHVfc3RhcnRfZmVfaWRsZWxvb3Aoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCit7
CisJdTMyIGFkZHJlc3MgPSBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVyLCAmZ3B1
LT5jbWRidWZfbWFwcGluZyk7CisJdTE2IHByZWZldGNoOworCisJLyogc2V0dXAgdGhlIE1NVSAq
LworCWV0bmF2aXZfaW9tbXVfcmVzdG9yZShncHUsIGdwdS0+bW11KTsKKworCS8qIFN0YXJ0IGNv
bW1hbmQgcHJvY2Vzc29yICovCisJcHJlZmV0Y2ggPSBldG5hdml2X2J1ZmZlcl9pbml0KGdwdSk7
CisKKwlldG5hdml2X2dwdV9zdGFydF9mZShncHUsIGFkZHJlc3MsIHByZWZldGNoKTsKK30KKwog
c3RhdGljIHZvaWQgZXRuYXZpdl9ncHVfc2V0dXBfcHVsc2VfZWF0ZXIoc3RydWN0IGV0bmF2aXZf
Z3B1ICpncHUpCiB7CiAJLyoKQEAgLTYzMyw4ICs2NDcsNiBAQCBzdGF0aWMgdm9pZCBldG5hdml2
X2dwdV9zZXR1cF9wdWxzZV9lYXRlcihzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIAogc3RhdGlj
IHZvaWQgZXRuYXZpdl9ncHVfaHdfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIHsKLQl1
MTYgcHJlZmV0Y2g7Ci0KIAlpZiAoKGV0bmF2aXZfaXNfbW9kZWxfcmV2KGdwdSwgR0MzMjAsIDB4
NTAwNykgfHwKIAkgICAgIGV0bmF2aXZfaXNfbW9kZWxfcmV2KGdwdSwgR0MzMjAsIDB4NTIyMCkp
ICYmCiAJICAgIGdwdV9yZWFkKGdwdSwgVklWU19ISV9DSElQX1RJTUUpICE9IDB4MjA2MjQwMCkg
ewpAQCAtNjgwLDE1ICs2OTIsOSBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV9od19pbml0KHN0
cnVjdCBldG5hdml2X2dwdSAqZ3B1KQogCS8qIHNldHVwIHRoZSBwdWxzZSBlYXRlciAqLwogCWV0
bmF2aXZfZ3B1X3NldHVwX3B1bHNlX2VhdGVyKGdwdSk7CiAKLQkvKiBzZXR1cCB0aGUgTU1VICov
Ci0JZXRuYXZpdl9pb21tdV9yZXN0b3JlKGdwdSwgZ3B1LT5tbXUpOwotCi0JLyogU3RhcnQgY29t
bWFuZCBwcm9jZXNzb3IgKi8KLQlwcmVmZXRjaCA9IGV0bmF2aXZfYnVmZmVyX2luaXQoZ3B1KTsK
LQogCWdwdV93cml0ZShncHUsIFZJVlNfSElfSU5UUl9FTkJMLCB+MFUpOwotCWV0bmF2aXZfZ3B1
X3N0YXJ0X2ZlKGdwdSwgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKCZncHUtPmJ1ZmZlciwKLQkJCSAg
ICAgJmdwdS0+Y21kYnVmX21hcHBpbmcpLCBwcmVmZXRjaCk7CisKKwlldG5hdml2X2dwdV9zdGFy
dF9mZV9pZGxlbG9vcChncHUpOwogfQogCiBpbnQgZXRuYXZpdl9ncHVfaW5pdChzdHJ1Y3QgZXRu
YXZpdl9ncHUgKmdwdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
