Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237141CB2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F12C89226;
	Wed, 12 Jun 2019 06:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B2989179
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:09:45 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:35984 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1haeY3-0004mh-Ka; Tue, 11 Jun 2019 12:02:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXy-0001yu-1V; Tue, 11 Jun 2019 12:02:34 +0100
In-Reply-To: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 12/13] drm/i2c: tda998x: add bridge timing information
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1haeXy-0001yu-1V@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Jun 2019 12:02:34 +0100
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CfNXdSuIkdXsuIrW90ZPJ+/ATdREVGJBeI+ZXAfbtak=; b=lrX9u+TOW4I1t4yLjyrDTCO0sx
 jE/C8e5uaVKrGw0A+E20JPPodx3QpYmIEu5Q4pXOcmMoJEGbLJdpg4QbOS691ItG+K7nk9f6vrqw3
 etf/8ScQDYN+nOswJ9bIpUhBnULY2FsurxuLeZdYOq6tINF0Ve96fbIHWAA6j7TYw5ZdZRjtna4Hq
 1prID8VgNc4yTl4g0t8TLREBjc7uDTgh0RIq3ZELNFJcM8D1CgKgINKhm7j9JW9FQtxRZeSzNE/v7
 ghVL5grEJHHZmbwNMIjJbITj3g9KO3Y8rgiuh2bT3U6AbNsRcjGKQSTXFvaRgs/NksbHtcpPLScYV
 o1M1fkCw==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJyaWRnZSB0aW1pbmcgaW5mb3JtYXRpb24gc28gdGhhdCBicmlkZ2UgdXNlcnMgY2FuIGZp
Z3VyZSBvdXQgdGhlCnRpbWluZyBwYXJhbWV0ZXJzIHRoYXQgYXJlIG5lY2Vzc2FyeSBmb3IgVERB
OTk4eC4KClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jIHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2kyYy90ZGE5OTh4X2Rydi5jCmluZGV4IDQxNzk0OWZjNjlkMS4uMzcyYzQ2MjMyM2NmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCkBAIC0xNjQzLDYgKzE2NDMsMTggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHRkYTk5OHhfYnJpZGdlX2Z1bmNzID0gewog
CS5lbmFibGUgPSB0ZGE5OTh4X2JyaWRnZV9lbmFibGUsCiB9OwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9icmlkZ2VfdGltaW5ncyB0ZGE5OTg5X3RpbWluZ3MgPSB7CisJLnNhbXBsaW5nX2Vk
Z2UgPSBEUk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAorCS5zZXR1cF90aW1lX3BzID0gMTUw
MCwKKwkuaG9sZF90aW1lX3BzID0gMTAwMCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2JyaWRnZV90aW1pbmdzIHRkYTE5OTg4X3RpbWluZ3MgPSB7CisJLnNhbXBsaW5nX2VkZ2UgPSBE
Uk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAorCS5zZXR1cF90aW1lX3BzID0gMTYwMCwKKwku
aG9sZF90aW1lX3BzID0gMTIwMCwKK307CisKIC8qIEkyQyBkcml2ZXIgZnVuY3Rpb25zICovCiAK
IHN0YXRpYyBpbnQgdGRhOTk4eF9nZXRfYXVkaW9fcG9ydHMoc3RydWN0IHRkYTk5OHhfcHJpdiAq
cHJpdiwKQEAgLTE5NDgsNiArMTk2MCwxNyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfY3JlYXRlKHN0
cnVjdCBkZXZpY2UgKmRldikKIAlwcml2LT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsK
ICNlbmRpZgogCisJc3dpdGNoIChwcml2LT5yZXYpIHsKKwljYXNlIFREQTk5ODlOMjoKKwljYXNl
IFREQTE5OTg5OgorCWNhc2UgVERBMTk5ODlOMjoKKwkJcHJpdi0+YnJpZGdlLnRpbWluZ3MgPSAm
dGRhOTk4OV90aW1pbmdzOworCQlicmVhazsKKwljYXNlIFREQTE5OTg4OgorCQlwcml2LT5icmlk
Z2UudGltaW5ncyA9ICZ0ZGExOTk4OF90aW1pbmdzOworCQlicmVhazsKKwl9CisKIAlkcm1fYnJp
ZGdlX2FkZCgmcHJpdi0+YnJpZGdlKTsKIAogCXJldHVybiAwOwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
