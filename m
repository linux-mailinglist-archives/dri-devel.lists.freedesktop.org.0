Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74060ACF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 19:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618ED6E512;
	Fri,  5 Jul 2019 17:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5874E6E512
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 17:15:40 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hjRo8-0006rI-ML; Fri, 05 Jul 2019 19:15:36 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: fix etnaviv_cmdbuf_suballoc_new return value
Date: Fri,  5 Jul 2019 19:15:35 +0200
Message-Id: <20190705171536.26727-1-l.stach@pengutronix.de>
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

VGhlIGNhbGwgc2l0ZSBleHBlY3RzIHRvIGdldCBlaXRoZXIgYSB2YWxpZCBzdWJhbGxvYyBvciBh
biBlcnJvcgpwb2ludGVyLCBzbyBhIE5VTEwgcmV0dXJuIHdpbGwgbm90IGJlIHRyZWF0ZWQgYXMg
YW4gZXJyb3IuIE1ha2UKc3VyZSB0byBhbHdheXMgcmV0dXJuIGEgcHJvcGVyIGVycm9yIHBvaW50
ZXIgaW4gY2FzZSBzb21ldGhpbmcgZ29lcwp3cm9uZy4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0
YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfY21kYnVmLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2NtZGJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRi
dWYuYwppbmRleCBiYjQ5MDBiYzFjNGMuLjdiNzc5OTJmMzFjNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2NtZGJ1Zi5jCkBAIC00OCw4ICs0OCwxMCBAQCBldG5hdml2X2NtZGJ1
Zl9zdWJhbGxvY19uZXcoc3RydWN0IGV0bmF2aXZfZ3B1ICogZ3B1KQogCiAJc3ViYWxsb2MtPnZh
ZGRyID0gZG1hX2FsbG9jX3djKGdwdS0+ZGV2LCBTVUJBTExPQ19TSVpFLAogCQkJCSAgICAgICAm
c3ViYWxsb2MtPnBhZGRyLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXN1YmFsbG9jLT52YWRkcikKKwlp
ZiAoIXN1YmFsbG9jLT52YWRkcikgeworCQlyZXQgPSAtRU5PTUVNOwogCQlnb3RvIGZyZWVfc3Vi
YWxsb2M7CisJfQogCiAJcmV0ID0gZXRuYXZpdl9pb21tdV9nZXRfc3ViYWxsb2NfdmEoZ3B1LCBz
dWJhbGxvYy0+cGFkZHIsCiAJCQkJCSAgICAmc3ViYWxsb2MtPnZyYW1fbm9kZSwgU1VCQUxMT0Nf
U0laRSwKQEAgLTY0LDcgKzY2LDcgQEAgZXRuYXZpdl9jbWRidWZfc3ViYWxsb2NfbmV3KHN0cnVj
dCBldG5hdml2X2dwdSAqIGdwdSkKIGZyZWVfc3ViYWxsb2M6CiAJa2ZyZWUoc3ViYWxsb2MpOwog
Ci0JcmV0dXJuIE5VTEw7CisJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0KIAogdm9pZCBldG5hdml2
X2NtZGJ1Zl9zdWJhbGxvY19kZXN0cm95KHN0cnVjdCBldG5hdml2X2NtZGJ1Zl9zdWJhbGxvYyAq
c3ViYWxsb2MpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
