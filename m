Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF74E6E15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09EF6E45D;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C233C6EA3B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:31:08 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x127so1590816pfb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkuQyVXMMyDZQEt3+CjrZIj+e3tZqkaRw9M9fK6dE0A=;
 b=Rb1MLtA5xvyQacCYLFsBsDKhA1qPlQKM86pTInMZH7vKDNBH547+OxFANzskni3oQB
 roz265c2AZnub9fKoHTKukOyRhANITC651z6Ng/QjhDedBfkVf4d8b0E5qEHoLuxuOue
 Z1RNHyp9J83Ea5r/otbQIax6d5wVTITBnnc8Kpnon6zzEEjq7rEQ2A4tJe4ZaphU9UTu
 9VT5JwUSOZjHUDDseh3jg/dHeBMtwEMtIgT354nsgOkRkl6GYzf09JrEX0JHqUeth6xW
 db9aZBS6YJ01SgSzUOlrTI0edZcDga/XNRF1LaGyV34GwNmSg7NGEnuV3y6OChZ28WSj
 EcJg==
X-Gm-Message-State: APjAAAWhmHDv6wMwkgzo1g+LITbwkgOyNZM/FdTnCDyOOqwuLsBQm5rb
 ZLEIhkBE1k0NPbVfziAeFlJsNA==
X-Google-Smtp-Source: APXvYqypx1iOOLXyzbMO61gMPyKWIWC+7EwZjaBPtphFD0tkNUyB/PtgGJIIMnLo6epNgm/8d1yPOA==
X-Received: by 2002:a63:4304:: with SMTP id q4mr4294927pga.218.1572010268293; 
 Fri, 25 Oct 2019 06:31:08 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q33sm2430940pgm.50.2019.10.25.06.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:31:07 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] ASoC: rockchip_max98090: Add HDMI jack support
Date: Fri, 25 Oct 2019 21:30:05 +0800
Message-Id: <20191025133007.11190-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025133007.11190-1-cychiang@chromium.org>
References: <20191025133007.11190-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkuQyVXMMyDZQEt3+CjrZIj+e3tZqkaRw9M9fK6dE0A=;
 b=FkUSFr19U5KiA2qhu5pPmrV/ZY3HrBv7vjJg0Wwe8AaE8M1PUpa9xnHOTXOUZE4xB1
 HFKCiPCrF+GU4ZFfCgL9nza4rfRQc8wRxfNAKRq7jSnbcsfLqlwk2aohnXe3wMuvrCGz
 ldWZJPNk0j6Qc0UMX62VQjJeC6YjNt7KNPLbQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAg
IHwgIDMgKystCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcgYi9z
b3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZwppbmRleCBiNDM2NTdlNmU2NTUuLmQ2MTBiNTUzZWEz
YiAxMDA2NDQKLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcKKysrIGIvc291bmQvc29j
L3JvY2tjaGlwL0tjb25maWcKQEAgLTQwLDkgKzQwLDEwIEBAIGNvbmZpZyBTTkRfU09DX1JPQ0tD
SElQX01BWDk4MDkwCiAJc2VsZWN0IFNORF9TT0NfUk9DS0NISVBfSTJTCiAJc2VsZWN0IFNORF9T
T0NfTUFYOTgwOTAKIAlzZWxlY3QgU05EX1NPQ19UUzNBMjI3RQorCXNlbGVjdCBTTkRfU09DX0hE
TUlfQ09ERUMKIAloZWxwCiAJICBTYXkgWSBvciBNIGhlcmUgaWYgeW91IHdhbnQgdG8gYWRkIHN1
cHBvcnQgZm9yIFNvQyBhdWRpbyBvbiBSb2NrY2hpcAotCSAgYm9hcmRzIHVzaW5nIHRoZSBNQVg5
ODA5MCBjb2RlYywgc3VjaCBhcyBWZXlyb24uCisJICBib2FyZHMgdXNpbmcgdGhlIE1BWDk4MDkw
IGNvZGVjIGFuZCBIRE1JIGNvZGVjLCBzdWNoIGFzIFZleXJvbi4KIAogY29uZmlnIFNORF9TT0Nf
Uk9DS0NISVBfUlQ1NjQ1CiAJdHJpc3RhdGUgIkFTb0Mgc3VwcG9ydCBmb3IgUm9ja2NoaXAgYm9h
cmRzIHVzaW5nIGEgUlQ1NjQ1L1JUNTY1MCBjb2RlYyIKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9y
b2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlw
X21heDk4MDkwLmMKaW5kZXggNTUwZTU3Nzg5NzE5Li5mZGQxZDk5MjFhNGUgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jCisrKyBiL3NvdW5kL3NvYy9y
b2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jCkBAIC0yMzAsNiArMjMwLDI1IEBAIGVudW0gewog
CURBSUxJTktfSERNSSwKIH07CiAKK3N0YXRpYyBzdHJ1Y3Qgc25kX3NvY19qYWNrIHJrX2hkbWlf
amFjazsKKworc3RhdGljIGludCBya19oZG1pX2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRp
bWUgKnJ1bnRpbWUpCit7CisJc3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCA9IHJ1bnRpbWUtPmNh
cmQ7CisJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPSBydW50aW1lLT5jb2Rl
Y19kYWktPmNvbXBvbmVudDsKKwlpbnQgcmV0OworCisJLyogZW5hYmxlIGphY2sgZGV0ZWN0aW9u
ICovCisJcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNhcmQsICJIRE1JIEphY2siLCBTTkRf
SkFDS19MSU5FT1VULAorCQkJCSAgICAmcmtfaGRtaV9qYWNrLCBOVUxMLCAwKTsKKwlpZiAocmV0
KSB7CisJCWRldl9lcnIoY2FyZC0+ZGV2LCAiQ2FuJ3QgbmV3IEhETUkgSmFjayAlZFxuIiwgcmV0
KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4gaGRtaV9jb2RlY19zZXRfamFja19kZXRl
Y3QoY29tcG9uZW50LCAmcmtfaGRtaV9qYWNrKTsKK30KKwogLyogbWF4OTgwOTAgZGFpX2xpbmsg
Ki8KIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayBya19tYXg5ODA5MF9kYWlsaW5rc1td
ID0gewogCXsKQEAgLTI0OSw2ICsyNjgsNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xp
bmsgcmtfaGRtaV9kYWlsaW5rc1tdID0gewogCXsKIAkJLm5hbWUgPSAiSERNSSIsCiAJCS5zdHJl
YW1fbmFtZSA9ICJIRE1JIiwKKwkJLmluaXQgPSBya19oZG1pX2luaXQsCiAJCS5vcHMgPSAmcmtf
YWlmMV9vcHMsCiAJCS5kYWlfZm10ID0gU05EX1NPQ19EQUlGTVRfSTJTIHwgU05EX1NPQ19EQUlG
TVRfTkJfTkYgfAogCQkJU05EX1NPQ19EQUlGTVRfQ0JTX0NGUywKQEAgLTI3MSw2ICsyOTEsNyBA
QCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfbWF4OTgwOTBfaGRtaV9kYWlsaW5r
c1tdID0gewogCVtEQUlMSU5LX0hETUldID0gewogCQkubmFtZSA9ICJIRE1JIiwKIAkJLnN0cmVh
bV9uYW1lID0gIkhETUkiLAorCQkuaW5pdCA9IHJrX2hkbWlfaW5pdCwKIAkJLm9wcyA9ICZya19h
aWYxX29wcywKIAkJLmRhaV9mbXQgPSBTTkRfU09DX0RBSUZNVF9JMlMgfCBTTkRfU09DX0RBSUZN
VF9OQl9ORiB8CiAJCQlTTkRfU09DX0RBSUZNVF9DQlNfQ0ZTLAotLSAKMi4yNC4wLnJjMC4zMDMu
Zzk1NGE4NjI2NjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
