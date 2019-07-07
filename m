Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94C615FD
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9889BB0;
	Sun,  7 Jul 2019 18:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147C989B30
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:34:46 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AB36334;
 Sun,  7 Jul 2019 20:34:29 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 40/60] drm/omap: hdmi4: Implement drm_bridge .lost_hotplug()
 operation
Date: Sun,  7 Jul 2019 21:19:17 +0300
Message-Id: <20190707181937.6250-37-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524484;
 bh=Zrsy1C2D76GzmSlCgMhQcYjW6IhBV7cPOKoBA/W2s7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ahuwxv1j0nxtcnQpv9UDaKXb8ezTXZxWWQHTXSXnxVzQ375+MgUIkc1Z6AenEvVkX
 A3tADk37nhAIQLZVG3ieJF83CMgU5VC0cED61V6hg396zVpbrE80m2kCBWXoA1RkPE
 SOhYZqt390XMs9qxd4inRH2VHJmPmZm+ezlkVgSE=
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

VGhlIEhETUk0IGVuY29kZXIgaXMgdHJhbnNpdGlvbmluZyB0byB0aGUgZHJtX2JyaWRnZSBBUEks
IGltcGxlbWVudCB0aGUKbGFzdCBtaXNzaW5nIG9wZXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYyB8IDggKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaTQuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jCmlu
ZGV4IGE4ZjU4MmMwZjM4Ny4uZGY1NmFjYjVjYjI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvaGRtaTQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
aGRtaTQuYwpAQCAtNTU5LDYgKzU1OSwxMyBAQCBzdGF0aWMgdm9pZCBoZG1pNF9icmlkZ2VfZGlz
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCW11dGV4X3VubG9jaygmaGRtaS0+bG9j
ayk7CiB9CiAKK3N0YXRpYyB2b2lkIGhkbWk0X2JyaWRnZV9sb3N0X2hvdHBsdWcoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKK3sKKwlzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHJtX2JyaWRn
ZV90b19oZG1pKGJyaWRnZSk7CisKKwloZG1pNF9jZWNfc2V0X3BoeXNfYWRkcigmaGRtaS0+Y29y
ZSwgQ0VDX1BIWVNfQUREUl9JTlZBTElEKTsKK30KKwogc3RhdGljIHN0cnVjdCBlZGlkICpoZG1p
NF9icmlkZ2VfcmVhZF9lZGlkKHN0cnVjdCBvbWFwX2hkbWkgKmhkbWksCiAJCQkJCSAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7CkBAIC01NzgsNiArNTg1LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIGhkbWk0X2JyaWRnZV9mdW5jcyA9IHsKIAku
bW9kZV9zZXQgPSBoZG1pNF9icmlkZ2VfbW9kZV9zZXQsCiAJLmF0b21pY19lbmFibGUgPSBoZG1p
NF9icmlkZ2VfZW5hYmxlLAogCS5hdG9taWNfZGlzYWJsZSA9IGhkbWk0X2JyaWRnZV9kaXNhYmxl
LAorCS5sb3N0X2hvdHBsdWcgPSBoZG1pNF9icmlkZ2VfbG9zdF9ob3RwbHVnLAogCS5nZXRfZWRp
ZCA9IGhkbWk0X2JyaWRnZV9nZXRfZWRpZCwKIH07CiAKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
