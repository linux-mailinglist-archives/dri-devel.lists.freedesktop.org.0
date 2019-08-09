Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A48794E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FC86EDEE;
	Fri,  9 Aug 2019 12:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8278B89565
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:04:28 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3dA-00055N-Cl; Fri, 09 Aug 2019 14:04:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 6/8] drm/etnaviv: split out starting of FE idle loop
Date: Fri,  9 Aug 2019 14:04:22 +0200
Message-Id: <20190809120424.32679-6-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809120424.32679-1-l.stach@pengutronix.de>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
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
LW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCAyNiArKysrKysrKysrKysrKysrLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCmluZGV4IDg4NWNhOGY5MjMzOC4uM2FmNzJh
NDEyN2IwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKQEAgLTYwMCw2ICs2
MDAsMjAgQEAgdm9pZCBldG5hdml2X2dwdV9zdGFydF9mZShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdw
dSwgdTMyIGFkZHJlc3MsIHUxNiBwcmVmZXRjaCkKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGV0bmF2
aXZfZ3B1X3N0YXJ0X2ZlX2lkbGVsb29wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQoreworCXUz
MiBhZGRyZXNzID0gZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKCZncHUtPmJ1ZmZlciwgJmdwdS0+Y21k
YnVmX21hcHBpbmcpOworCXUxNiBwcmVmZXRjaDsKKworCS8qIHNldHVwIHRoZSBNTVUgKi8KKwll
dG5hdml2X2lvbW11X3Jlc3RvcmUoZ3B1LCBncHUtPm1tdV9jb250ZXh0KTsKKworCS8qIFN0YXJ0
IGNvbW1hbmQgcHJvY2Vzc29yICovCisJcHJlZmV0Y2ggPSBldG5hdml2X2J1ZmZlcl9pbml0KGdw
dSk7CisKKwlldG5hdml2X2dwdV9zdGFydF9mZShncHUsIGFkZHJlc3MsIHByZWZldGNoKTsKK30K
Kwogc3RhdGljIHZvaWQgZXRuYXZpdl9ncHVfc2V0dXBfcHVsc2VfZWF0ZXIoc3RydWN0IGV0bmF2
aXZfZ3B1ICpncHUpCiB7CiAJLyoKQEAgLTYzMyw4ICs2NDcsNiBAQCBzdGF0aWMgdm9pZCBldG5h
dml2X2dwdV9zZXR1cF9wdWxzZV9lYXRlcihzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIAogc3Rh
dGljIHZvaWQgZXRuYXZpdl9ncHVfaHdfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIHsK
LQl1MTYgcHJlZmV0Y2g7Ci0KIAlpZiAoKGV0bmF2aXZfaXNfbW9kZWxfcmV2KGdwdSwgR0MzMjAs
IDB4NTAwNykgfHwKIAkgICAgIGV0bmF2aXZfaXNfbW9kZWxfcmV2KGdwdSwgR0MzMjAsIDB4NTIy
MCkpICYmCiAJICAgIGdwdV9yZWFkKGdwdSwgVklWU19ISV9DSElQX1RJTUUpICE9IDB4MjA2MjQw
MCkgewpAQCAtNjgwLDE1ICs2OTIsOSBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV9od19pbml0
KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQogCS8qIHNldHVwIHRoZSBwdWxzZSBlYXRlciAqLwog
CWV0bmF2aXZfZ3B1X3NldHVwX3B1bHNlX2VhdGVyKGdwdSk7CiAKLQkvKiBzZXR1cCB0aGUgTU1V
ICovCi0JZXRuYXZpdl9pb21tdV9yZXN0b3JlKGdwdSwgZ3B1LT5tbXVfY29udGV4dCk7Ci0KLQkv
KiBTdGFydCBjb21tYW5kIHByb2Nlc3NvciAqLwotCXByZWZldGNoID0gZXRuYXZpdl9idWZmZXJf
aW5pdChncHUpOwotCiAJZ3B1X3dyaXRlKGdwdSwgVklWU19ISV9JTlRSX0VOQkwsIH4wVSk7Ci0J
ZXRuYXZpdl9ncHVfc3RhcnRfZmUoZ3B1LCBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVm
ZmVyLAotCQkJICAgICAmZ3B1LT5jbWRidWZfbWFwcGluZyksIHByZWZldGNoKTsKKworCWV0bmF2
aXZfZ3B1X3N0YXJ0X2ZlX2lkbGVsb29wKGdwdSk7CiB9CiAKIGludCBldG5hdml2X2dwdV9pbml0
KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
