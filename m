Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81FE6E04
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BA16E454;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88956E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:21:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id c8so6306668pgb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 00:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUhk5jTAsWRL5Pgp1XZmlvQGKoI7BAgOCvrW+D56pp8=;
 b=toG5mZUcOFjt62FipDTRPHhuL8p/V/bm/E+wA61NgLYa06VywK8QRtrxp4YXhNHFJW
 aRf43miID8TLz9gIw+1+GrtDIecWhyeZqcJfWZsvhHp39p0BfiEDTEIWoyd8jhBNytc4
 HGy5iN2yu7wNixFlBM883ueAg0qaR54cb+lvEM03Em28h/+3U3BmYZY93QD9Ph7cS/SG
 mdYaaGvl8qRlgohIyKuEnWnSnz1U6eWdMPxLwLwiEPnETGjzwYjUQPTP1H4Ca3ewYTVU
 k8PoT0m8NSRwOujuWUDg9AgNz6+BUFqHMIsE8ZvKyWe8IrOkfg8xJPlHUYRnyS4MY8pD
 TEcA==
X-Gm-Message-State: APjAAAW/tPAW5gq7NKx11UEd/A09PM8Q8+RpXH+Ftv4Nx1e2ru3sGPX6
 iG4wl+uIX6ER6TYl23+nRMeGuQ==
X-Google-Smtp-Source: APXvYqy6ZYQwqRKjHWv8HOFkIQORoUhla1Awdt24VrWxKo9d5Y3WupcjPEJUg0uuNFjLJP2Twq29Cw==
X-Received: by 2002:a63:734e:: with SMTP id d14mr12627496pgn.357.1572247275466; 
 Mon, 28 Oct 2019 00:21:15 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id r28sm9256164pfl.37.2019.10.28.00.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:21:14 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] ASoC: rockchip_max98090: Add HDMI jack support
Date: Mon, 28 Oct 2019 15:19:28 +0800
Message-Id: <20191028071930.145899-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUhk5jTAsWRL5Pgp1XZmlvQGKoI7BAgOCvrW+D56pp8=;
 b=Yo43dKTsLFI2tpCk/GgsHgDLpV+n2oMVkqjTgO+WYW98xLPnu23m035x0k0FFAwWD/
 gczA73kwm3uhx7jLU5FLzQZw/Ubg0uP8yeTUVnnyhEvFgMAEQNKsSnuElq/670f6y+Ku
 z3qyMCqSVAu4461D9BPtH/1Axex3l9sm48Zgw=
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
IHwgIDMgKystCiBzb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyB8IDIyICsr
KysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnIGIv
c291bmQvc29jL3JvY2tjaGlwL0tjb25maWcKaW5kZXggYjQzNjU3ZTZlNjU1Li5kNjEwYjU1M2Vh
M2IgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnCisrKyBiL3NvdW5kL3Nv
Yy9yb2NrY2hpcC9LY29uZmlnCkBAIC00MCw5ICs0MCwxMCBAQCBjb25maWcgU05EX1NPQ19ST0NL
Q0hJUF9NQVg5ODA5MAogCXNlbGVjdCBTTkRfU09DX1JPQ0tDSElQX0kyUwogCXNlbGVjdCBTTkRf
U09DX01BWDk4MDkwCiAJc2VsZWN0IFNORF9TT0NfVFMzQTIyN0UKKwlzZWxlY3QgU05EX1NPQ19I
RE1JX0NPREVDCiAJaGVscAogCSAgU2F5IFkgb3IgTSBoZXJlIGlmIHlvdSB3YW50IHRvIGFkZCBz
dXBwb3J0IGZvciBTb0MgYXVkaW8gb24gUm9ja2NoaXAKLQkgIGJvYXJkcyB1c2luZyB0aGUgTUFY
OTgwOTAgY29kZWMsIHN1Y2ggYXMgVmV5cm9uLgorCSAgYm9hcmRzIHVzaW5nIHRoZSBNQVg5ODA5
MCBjb2RlYyBhbmQgSERNSSBjb2RlYywgc3VjaCBhcyBWZXlyb24uCiAKIGNvbmZpZyBTTkRfU09D
X1JPQ0tDSElQX1JUNTY0NQogCXRyaXN0YXRlICJBU29DIHN1cHBvcnQgZm9yIFJvY2tjaGlwIGJv
YXJkcyB1c2luZyBhIFJUNTY0NS9SVDU2NTAgY29kZWMiCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
cm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyBiL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hp
cF9tYXg5ODA5MC5jCmluZGV4IDUwZWY5YjhlN2NlNC4uNWMyNTA0YTQ2NWY0IDEwMDY0NAotLS0g
YS9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYworKysgYi9zb3VuZC9zb2Mv
cm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwpAQCAtMTIsNiArMTIsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8c291
bmQvY29yZS5oPgorI2luY2x1ZGUgPHNvdW5kL2hkbWktY29kZWMuaD4KICNpbmNsdWRlIDxzb3Vu
ZC9qYWNrLmg+CiAjaW5jbHVkZSA8c291bmQvcGNtLmg+CiAjaW5jbHVkZSA8c291bmQvcGNtX3Bh
cmFtcy5oPgpAQCAtMjE4LDYgKzIxOSwyNSBAQCBlbnVtIHsKIAlEQUlMSU5LX0hETUksCiB9Owog
CitzdGF0aWMgc3RydWN0IHNuZF9zb2NfamFjayBya19oZG1pX2phY2s7CisKK3N0YXRpYyBpbnQg
cmtfaGRtaV9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydW50aW1lKQoreworCXN0
cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBydW50aW1lLT5jYXJkOworCXN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50ID0gcnVudGltZS0+Y29kZWNfZGFpLT5jb21wb25lbnQ7CisJ
aW50IHJldDsKKworCS8qIGVuYWJsZSBqYWNrIGRldGVjdGlvbiAqLworCXJldCA9IHNuZF9zb2Nf
Y2FyZF9qYWNrX25ldyhjYXJkLCAiSERNSSBKYWNrIiwgU05EX0pBQ0tfTElORU9VVCwKKwkJCQkg
ICAgJnJrX2hkbWlfamFjaywgTlVMTCwgMCk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKGNhcmQt
PmRldiwgIkNhbid0IG5ldyBIRE1JIEphY2sgJWRcbiIsIHJldCk7CisJCXJldHVybiByZXQ7CisJ
fQorCisJcmV0dXJuIGhkbWlfY29kZWNfc2V0X2phY2tfZGV0ZWN0KGNvbXBvbmVudCwgJnJrX2hk
bWlfamFjayk7Cit9CisKIC8qIG1heDk4MDkwIGRhaV9saW5rICovCiBzdGF0aWMgc3RydWN0IHNu
ZF9zb2NfZGFpX2xpbmsgcmtfbWF4OTgwOTBfZGFpbGlua3NbXSA9IHsKIAl7CkBAIC0yMzcsNiAr
MjU3LDcgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2hkbWlfZGFpbGlua3Nb
XSA9IHsKIAl7CiAJCS5uYW1lID0gIkhETUkiLAogCQkuc3RyZWFtX25hbWUgPSAiSERNSSIsCisJ
CS5pbml0ID0gcmtfaGRtaV9pbml0LAogCQkub3BzID0gJnJrX2FpZjFfb3BzLAogCQkuZGFpX2Zt
dCA9IFNORF9TT0NfREFJRk1UX0kyUyB8IFNORF9TT0NfREFJRk1UX05CX05GIHwKIAkJCVNORF9T
T0NfREFJRk1UX0NCU19DRlMsCkBAIC0yNTksNiArMjgwLDcgQEAgc3RhdGljIHN0cnVjdCBzbmRf
c29jX2RhaV9saW5rIHJrX21heDk4MDkwX2hkbWlfZGFpbGlua3NbXSA9IHsKIAlbREFJTElOS19I
RE1JXSA9IHsKIAkJLm5hbWUgPSAiSERNSSIsCiAJCS5zdHJlYW1fbmFtZSA9ICJIRE1JIiwKKwkJ
LmluaXQgPSBya19oZG1pX2luaXQsCiAJCS5vcHMgPSAmcmtfYWlmMV9vcHMsCiAJCS5kYWlfZm10
ID0gU05EX1NPQ19EQUlGTVRfSTJTIHwgU05EX1NPQ19EQUlGTVRfTkJfTkYgfAogCQkJU05EX1NP
Q19EQUlGTVRfQ0JTX0NGUywKLS0gCjIuMjQuMC5yYzAuMzAzLmc5NTRhODYyNjY1LWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
