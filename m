Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710838538
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2903889A14;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D298967F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:21 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B6B5120014;
 Thu,  6 Jun 2019 14:22:17 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 17/20] drm: rcar-du: crtc: Enable and disable CMMs
Date: Thu,  6 Jun 2019 16:22:17 +0200
Message-Id: <20190606142220.1392-18-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlL2Rpc2FibGUgdGhlIENNTSBhc3NvY2lhdGVkIHdpdGggYSBDUlRDIGF0CmF0b21pY19l
bmFibGUoKS9hdG9taWNfZGlzYWJsZSgpIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9u
ZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9jcnRjLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwppbmRleCA5ZjI3MGE1
NGIxNjQuLmU2ZDNkZjM3YzgyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRj
LmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKKyNpbmNsdWRlICJyY2FyX2NtbS5oIgogI2lu
Y2x1ZGUgInJjYXJfZHVfY3J0Yy5oIgogI2luY2x1ZGUgInJjYXJfZHVfZHJ2LmgiCiAjaW5jbHVk
ZSAicmNhcl9kdV9lbmNvZGVyLmgiCkBAIC01MjMsNiArNTI0LDcgQEAgc3RhdGljIGludCByY2Fy
X2R1X2NydGNfZ2V0KHN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjKQogCQlnb3RvIGVycm9yX2dy
b3VwOwogCiAJcmNhcl9kdV9jcnRjX3NldHVwKHJjcnRjKTsKKwogCXJjcnRjLT5pbml0aWFsaXpl
ZCA9IHRydWU7CiAKIAlyZXR1cm4gMDsKQEAgLTYxOSw2ICs2MjEsOSBAQCBzdGF0aWMgdm9pZCBy
Y2FyX2R1X2NydGNfc3RvcChzdHJ1Y3QgcmNhcl9kdV9jcnRjICpyY3J0YykKIAlpZiAocmNhcl9k
dV9oYXMocmNydGMtPmRldiwgUkNBUl9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFKSkKIAkJcmNhcl9k
dV92c3BfZGlzYWJsZShyY3J0Yyk7CiAKKwlpZiAocmNhcl9kdV9oYXMocmNydGMtPmRldiwgUkNB
Ul9EVV9GRUFUVVJFX0NNTSkgJiYgcmNydGMtPmNtbSkKKwkJcmNhcl9jbW1fZGlzYWJsZShyY3J0
Yy0+Y21tKTsKKwogCS8qCiAJICogU2VsZWN0IHN3aXRjaCBzeW5jIG1vZGUuIFRoaXMgc3RvcHMg
ZGlzcGxheSBvcGVyYXRpb24gYW5kIGNvbmZpZ3VyZXMKIAkgKiB0aGUgSFNZTkMgYW5kIFZTWU5D
IHNpZ25hbHMgYXMgaW5wdXRzLgpAQCAtNjg2LDYgKzY5MSw5IEBAIHN0YXRpYyB2b2lkIHJjYXJf
ZHVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAl9CiAKIAlyY2Fy
X2R1X2NydGNfc3RhcnQocmNydGMpOworCisJaWYgKHJjYXJfZHVfaGFzKHJjcnRjLT5kZXYsIFJD
QVJfRFVfRkVBVFVSRV9DTU0pICYmIHJjcnRjLT5jbW0pCisJCXJjYXJfY21tX2VuYWJsZShyY3J0
Yy0+Y21tKTsKIH0KIAogc3RhdGljIHZvaWQgcmNhcl9kdV9jcnRjX2F0b21pY19kaXNhYmxlKHN0
cnVjdCBkcm1fY3J0YyAqY3J0YywKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
