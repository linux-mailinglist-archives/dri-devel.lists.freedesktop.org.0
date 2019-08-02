Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10BE7FF98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 19:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404996EF16;
	Fri,  2 Aug 2019 17:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAFC6EF1F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 17:29:55 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1htbNJ-0005sQ-Sy; Fri, 02 Aug 2019 19:29:53 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/3] drm/etnaviv: skip command stream validation on PPAS
 capable GPUs
Date: Fri,  2 Aug 2019 19:29:51 +0200
Message-Id: <20190802172953.4586-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802172953.4586-1-l.stach@pengutronix.de>
References: <20190802172953.4586-1-l.stach@pengutronix.de>
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

V2l0aCBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBpbiBwbGFjZSwgYSByb2d1ZSBwcm9jZXNz
IHN1Ym1pdHRpbmcKYm9ndXMgY29tbWFuZCBzdHJlYW1zIGNhbiBvbmx5IGh1cnQgaXRzZWxmLiBU
aGVyZSBpcyBubyBuZWVkIHRvCnZhbGlkYXRlIHRoZSBjb21tYW5kIHN0cmVhbSBiZWZvcmUgZXhl
Y3V0aW9uIGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJt
aXQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3Vi
bWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwppbmRl
eCAyN2ExNGEyNzBhNTUuLjYyN2M4MGVkNjNkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMKQEAgLTUxNyw3ICs1MTcsOCBAQCBpbnQgZXRuYXZpdl9p
b2N0bF9nZW1fc3VibWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYg
KHJldCkKIAkJZ290byBlcnJfc3VibWl0X29iamVjdHM7CiAKLQlpZiAoIWV0bmF2aXZfY21kX3Zh
bGlkYXRlX29uZShncHUsIHN0cmVhbSwgYXJncy0+c3RyZWFtX3NpemUgLyA0LAorCWlmICgocHJp
di0+bW11X2dsb2JhbC0+dmVyc2lvbiAhPSBFVE5BVklWX0lPTU1VX1YyKSAmJgorCSAgICAhZXRu
YXZpdl9jbWRfdmFsaWRhdGVfb25lKGdwdSwgc3RyZWFtLCBhcmdzLT5zdHJlYW1fc2l6ZSAvIDQs
CiAJCQkJICAgICAgcmVsb2NzLCBhcmdzLT5ucl9yZWxvY3MpKSB7CiAJCXJldCA9IC1FSU5WQUw7
CiAJCWdvdG8gZXJyX3N1Ym1pdF9vYmplY3RzOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
