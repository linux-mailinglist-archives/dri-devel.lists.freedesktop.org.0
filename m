Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B35615CC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057289449;
	Sun,  7 Jul 2019 18:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05D89449
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:10:29 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BF84334;
 Sun,  7 Jul 2019 20:10:07 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/60] drm/edid: Add flag to drm_display_info to identify HDMI
 sinks
Date: Sun,  7 Jul 2019 21:07:53 +0300
Message-Id: <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523028;
 bh=bQpAiCv3ccvvR4hUprgoCPkBnwopOabies8escOGHKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yl/sQc0gwMNCYDpEmd01KGHnG8IRPf13nYXVIhTxb7bcqtRWI2WVrwyLyz6UmzRzF
 gdQvTMcWjRCqiVaaI2dQNZpJEyBrbl6acmO3SnR235GLmfZz78kxg4E6C6b2uB5I+x
 cNv7dMvG8IVens2UQ6i+mJ5Bg8pG8wJT6LxqF9Fg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9kaXNwbGF5X2luZm8gc3RydWN0dXJlIGNvbnRhaW5zIG1hbnkgZmllbGRzIHJlbGF0
ZWQgdG8gSERNSQpzaW5rcywgYnV0IG5vbmUgdGhhdCBpZGVudGlmaWVzIGlmIGEgc2luayBjb21w
bGlhbnQgd2l0aCBDRUEtODYxIChFRElEKQpzaGFsbCBiZSB0cmVhdGVkIGFzIGFuIEhETUkgc2lu
ayBvciBhIERWSSBzaW5rLiBBZGQgc3VjaCBhIGZsYWcsIGFuZApwb3B1bGF0ZSBpdCBhY2NvcmRp
bmcgdG8gc2VjdGlvbiA4LjMuMyAoIkRWSS9IRE1JIERldmljZQpEaXNjcmltaW5hdGlvbiIpIG9m
IHRoZSBIRE1JIHYxLjMgc3BlY2lmaWNhdGlvbi4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyAgfCAzICsrKwogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwg
NSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmlu
ZGV4IDgyYTRjZWVkM2ZjZi4uZDJlN2E1MzM0YzNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtNDU1OSw2
ICs0NTU5LDggQEAgZHJtX3BhcnNlX2hkbWlfdnNkYl92aWRlbyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBjb25zdCB1OCAqZGIpCiAJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmlu
Zm8gPSAmY29ubmVjdG9yLT5kaXNwbGF5X2luZm87CiAJdTggbGVuID0gY2VhX2RiX3BheWxvYWRf
bGVuKGRiKTsKIAorCWluZm8tPmlzX2hkbWkgPSB0cnVlOworCiAJaWYgKGxlbiA+PSA2KQogCQlp
bmZvLT5kdmlfZHVhbCA9IGRiWzZdICYgMTsKIAlpZiAobGVuID49IDcpCkBAIC00NjI3LDYgKzQ2
MjksNyBAQCBkcm1fcmVzZXRfZGlzcGxheV9pbmZvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJaW5mby0+Y2VhX3JldiA9IDA7CiAJaW5mby0+bWF4X3RtZHNfY2xvY2sgPSAwOwog
CWluZm8tPmR2aV9kdWFsID0gZmFsc2U7CisJaW5mby0+aXNfaGRtaSA9IGZhbHNlOwogCWluZm8t
Pmhhc19oZG1pX2luZm9mcmFtZSA9IGZhbHNlOwogCWluZm8tPnJnYl9xdWFudF9yYW5nZV9zZWxl
Y3RhYmxlID0gZmFsc2U7CiAJbWVtc2V0KCZpbmZvLT5oZG1pLCAwLCBzaXplb2YoaW5mby0+aGRt
aSkpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oCmluZGV4IGNhNzQ1ZDlmZWFmNS4uZTgwY2EwZDE0OWU1IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2Nvbm5lY3Rvci5oCkBAIC00MjYsNiArNDI2LDExIEBAIHN0cnVjdCBkcm1fZGlzcGxheV9pbmZv
IHsKIAkgKi8KIAlib29sIGR2aV9kdWFsOwogCisJLyoqCisJICogQGlzX2hkbWk6IFRydWUgaWYg
dGhlIHNpbmsgaXMgYW4gSERNSSBkZXZpY2UuCisJICovCisJYm9vbCBpc19oZG1pOworCiAJLyoq
CiAJICogQGhhc19oZG1pX2luZm9mcmFtZTogRG9lcyB0aGUgc2luayBzdXBwb3J0IHRoZSBIRE1J
IGluZm9mcmFtZT8KIAkgKi8KLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
