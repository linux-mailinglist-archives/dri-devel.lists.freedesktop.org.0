Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0DE2C87C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E6A89E69;
	Tue, 28 May 2019 14:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801F89E69
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51231FA6;
 Tue, 28 May 2019 16:13:25 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when using
 dual-link LVDS mode
Date: Tue, 28 May 2019 17:12:31 +0300
Message-Id: <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052806;
 bh=V7A4FvSE3DLgiRbObCpZHs3QCJSM7YQT38F2u3gEDho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WIkkaqd9nQCLAGBFMkQsrsxK5ZgL4p221mkDiZIFPJrHdc9oYO5JcQL5tSt/VgpkY
 vBxf1zJ+ErUwPUAcb+ODW4uQ8zgP3BzFUzjK46mOyTKyn/MJG9gxpotZT/tg1j993D
 u6P/L6JQH9S2IZqJj9szWMKwdGNztGB5bR1kI9DE=
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
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHVhbC1saW5rIExWRFMgbW9kZSwgdGhlIExWRFMxIGVuY29kZXIgaXMgdXNlZCBhcyBhIGNv
bXBhbmlvbiBmb3IKTFZEUzAsIGFuZCBib3RoIGVuY29kZXJzIHRyYW5zbWl0IGRhdGEgZnJvbSBE
VTAuIFRoZSBMVkRTMSBvdXRwdXQgb2YgRFUxCmNhbid0IGJlIHVzZWQgaW4gdGhhdCBjYXNlLCBk
b24ndCBjcmVhdGUgYW4gZW5jb2RlciBhbmQgY29ubmVjdG9yIGZvcgppdC4KClNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgpSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGku
b3JnPgpUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4K
LS0tCkNoYW5nZXNzIHNpbmNlIHYyOgoKLSBSZW1vdmUgdW5uZWVkZWQgYnJpZGdlIE5VTEwgY2hl
Y2sKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2VuY29kZXIuYyB8IDEyICsr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyAgICAgfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNvZGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2VuY29kZXIuYwppbmRleCA2YzkxNzUzYWY3
YmMuLjBmMDBiZGZlMjM2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNv
ZGVyLmMKQEAgLTE2LDYgKzE2LDcgQEAKICNpbmNsdWRlICJyY2FyX2R1X2Rydi5oIgogI2luY2x1
ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgogI2luY2x1ZGUgInJjYXJfZHVfa21zLmgiCisjaW5jbHVk
ZSAicmNhcl9sdmRzLmgiCiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgKiBFbmNvZGVyCkBA
IC05Nyw2ICs5OCwxNyBAQCBpbnQgcmNhcl9kdV9lbmNvZGVyX2luaXQoc3RydWN0IHJjYXJfZHVf
ZGV2aWNlICpyY2R1LAogCQl9CiAJfQogCisJLyoKKwkgKiBPbiBHZW4zIHNraXAgdGhlIExWRFMx
IG91dHB1dCBpZiB0aGUgTFZEUzEgZW5jb2RlciBpcyB1c2VkIGFzIGEKKwkgKiBjb21wYW5pb24g
Zm9yIExWRFMwIGluIGR1YWwtbGluayBtb2RlLgorCSAqLworCWlmIChyY2R1LT5pbmZvLT5nZW4g
Pj0gMyAmJiBvdXRwdXQgPT0gUkNBUl9EVV9PVVRQVVRfTFZEUzEpIHsKKwkJaWYgKHJjYXJfbHZk
c19kdWFsX2xpbmsoYnJpZGdlKSkgeworCQkJcmV0ID0gLUVOT0xJTks7CisJCQlnb3RvIGRvbmU7
CisJCX0KKwl9CisKIAlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KHJjZHUtPmRkZXYsIGVuY29kZXIs
ICZlbmNvZGVyX2Z1bmNzLAogCQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJfTk9ORSwgTlVMTCk7
CiAJaWYgKHJldCA8IDApCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwppbmRleCBm
OGY3ZmZmMzRkZmYuLjk1YzgxZTU5ZTJmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2ttcy5jCkBAIC0zNzgsNyArMzc4LDcgQEAgc3RhdGljIGludCByY2FyX2R1X2VuY29kZXJzX2lu
aXRfb25lKHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSwKIAl9CiAKIAlyZXQgPSByY2FyX2R1
X2VuY29kZXJfaW5pdChyY2R1LCBvdXRwdXQsIGVudGl0eSk7Ci0JaWYgKHJldCAmJiByZXQgIT0g
LUVQUk9CRV9ERUZFUikKKwlpZiAocmV0ICYmIHJldCAhPSAtRVBST0JFX0RFRkVSICYmIHJldCAh
PSAtRU5PTElOSykKIAkJZGV2X3dhcm4ocmNkdS0+ZGV2LAogCQkJICJmYWlsZWQgdG8gaW5pdGlh
bGl6ZSBlbmNvZGVyICVwT0Ygb24gb3V0cHV0ICV1ICglZCksIHNraXBwaW5nXG4iLAogCQkJIGVu
dGl0eSwgb3V0cHV0LCByZXQpOwotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
