Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F83260D1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 11:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A38989E;
	Wed, 22 May 2019 09:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37008989E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:55:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hTNxr-0000Mu-5T; Wed, 22 May 2019 11:55:15 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: lock MMU while dumping core
Date: Wed, 22 May 2019 11:55:14 +0200
Message-Id: <20190522095514.7000-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRldmNvcmVkdW1wIG5lZWRzIHRvIG9wZXJhdGUgb24gYSBzdGFibGUgc3RhdGUgb2YgdGhl
IE1NVSB3aGlsZQppdCBpcyB3cml0aW5nIHRoZSBNTVUgc3RhdGUgdG8gdGhlIGNvcmVkdW1wLiBU
aGUgbWlzc2luZyBsb2NrCmFsbG93ZWQgYm90aCB0aGUgdXNlcnNwYWNlIHN1Ym1pdCwgYXMgd2Vs
bCBhcyB0aGUgR1BVIGpvYiBmaW5pc2gKcGF0aHMgdG8gbXV0YXRlIHRoZSBNTVUgc3RhdGUgd2hp
bGUgYSBjb3JlZHVtcCBpcyB1bmRlciB3YXkuCgpGaXhlczogYThjMjFhNTQ1MWQ4IChkcm0vZXRu
YXZpdjogYWRkIGluaXRpYWwgZXRuYXZpdiBEUk0gZHJpdmVyKQpSZXBvcnRlZC1ieTogRGF2aWQg
SmFuZGVyIDxkYXZpZEBwcm90b25pYy5ubD4KU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+ClRlc3RlZC1ieTogRGF2aWQgSmFuZGVyIDxkYXZpZEBwcm90
b25pYy5ubD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZHVtcC5jCmluZGV4IDMzODU0Yzk0Y2I4NS4uNTE1NTE1ZWYyNGY5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwpAQCAtMTI1LDYgKzEyNSw4IEBAIHZv
aWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiAJCXJldHVybjsK
IAlldG5hdml2X2R1bXBfY29yZSA9IGZhbHNlOwogCisJbXV0ZXhfbG9jaygmZ3B1LT5tbXUtPmxv
Y2spOworCiAJbW11X3NpemUgPSBldG5hdml2X2lvbW11X2R1bXBfc2l6ZShncHUtPm1tdSk7CiAK
IAkvKiBXZSBhbHdheXMgZHVtcCByZWdpc3RlcnMsIG1tdSwgcmluZyBhbmQgZW5kIG1hcmtlciAq
LwpAQCAtMTY3LDYgKzE2OSw3IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0IGV0bmF2
aXZfZ3B1ICpncHUpCiAJaXRlci5zdGFydCA9IF9fdm1hbGxvYyhmaWxlX3NpemUsIEdGUF9LRVJO
RUwgfCBfX0dGUF9OT1dBUk4gfCBfX0dGUF9OT1JFVFJZLAogCQkJICAgICAgIFBBR0VfS0VSTkVM
KTsKIAlpZiAoIWl0ZXIuc3RhcnQpIHsKKwkJbXV0ZXhfdW5sb2NrKCZncHUtPm1tdS0+bG9jayk7
CiAJCWRldl93YXJuKGdwdS0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGRldmNvcmVkdW1wIGZp
bGVcbiIpOwogCQlyZXR1cm47CiAJfQpAQCAtMjM0LDYgKzIzNyw4IEBAIHZvaWQgZXRuYXZpdl9j
b3JlX2R1bXAoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiAJCQkJCSBvYmotPmJhc2Uuc2l6ZSk7
CiAJfQogCisJbXV0ZXhfdW5sb2NrKCZncHUtPm1tdS0+bG9jayk7CisKIAlldG5hdml2X2NvcmVf
ZHVtcF9oZWFkZXIoJml0ZXIsIEVURFVNUF9CVUZfRU5ELCBpdGVyLmRhdGEpOwogCiAJZGV2X2Nv
cmVkdW1wdihncHUtPmRldiwgaXRlci5zdGFydCwgaXRlci5kYXRhIC0gaXRlci5zdGFydCwgR0ZQ
X0tFUk5FTCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
