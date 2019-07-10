Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03737642C8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E2689D7F;
	Wed, 10 Jul 2019 07:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD64899E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:08:53 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so773866pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opTBgfSTSFi3V1ce9YlYEnYQO/1kKdgFofPaGYJTBOY=;
 b=U0dYQCufKowZdJ7rh2NjA2jYUyU6hPWVlhxCf8bXHO6AmDDiHOliduAUD7FbEq0gbF
 AV2WI0cs3dSb5dCgFtq9Y/bFkpaEazmi/z+0x8rWDnPDglZyxtMpTKyhVueJM/m74zOY
 KnZcIoKW/yQPi3GHZr01pz3+Cx7jY/w0QpB1mYZ73u1RU4HpfFsRKa6ojIWBHKtO2eN2
 vj0tw/eSoWucbRz2sfQAcwj90XokEAtRGwV8EPAw2iPZzsqN6+zAj6v/+SNea+lsOO7t
 qmhyXjo2kEyvB4q/27PLAkO6EAYUIFgUjzHYQ74eh1mS0rEvDOi9tW18MDHSoBo8Rpdx
 YfXw==
X-Gm-Message-State: APjAAAV719axCos+OIRj2MHZeu0496rEBMoJlv1+N76ElIOQy0iV4DsV
 9qDx44r/MMnDf0wQQ5r2Lx6Dpg==
X-Google-Smtp-Source: APXvYqyla6Le8Sl5C5IFq+BMbhDM8PgxLabMwmqWmWurGv0zA2QcXauHAgdORrx2hOafDqZMEhT1zA==
X-Received: by 2002:a65:4045:: with SMTP id h5mr36503650pgp.247.1562742532604; 
 Wed, 10 Jul 2019 00:08:52 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id b36sm3319370pjc.16.2019.07.10.00.08.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:08:52 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: rockchip_max98090: Add HDMI jack support
Date: Wed, 10 Jul 2019 15:07:51 +0800
Message-Id: <20190710070751.260061-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190710070751.260061-1-cychiang@chromium.org>
References: <20190710070751.260061-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opTBgfSTSFi3V1ce9YlYEnYQO/1kKdgFofPaGYJTBOY=;
 b=RjICyuOquidt6LyqOASElFqobDNn4mo6EWt1hQsD6iwRx26+bMSTRwY0lCmMrVaHSG
 6a47JWfUcXiJfqoCtNQ7lq7rjKXQcz2UUkE2pHMU2JgLeyFB7HyoZ+a4e8q03awEvrPl
 4wQTV2TDpVxnBFrbqJ7OGM83LJNpTu4ZxCalU=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKaW5kZXggMzYxNzAxMjY5
MmVhLi4xNzdjOGE3ZWM4ZGUgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hp
cF9tYXg5ODA5MC5jCisrKyBiL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
CkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8c291bmQvcGNtLmg+CiAjaW5jbHVkZSA8c291
bmQvcGNtX3BhcmFtcy5oPgogI2luY2x1ZGUgPHNvdW5kL3NvYy5oPgorI2luY2x1ZGUgPHNvdW5k
L2hkbWktY29kZWMuaD4KIAogI2luY2x1ZGUgInJvY2tjaGlwX2kycy5oIgogI2luY2x1ZGUgIi4u
L2NvZGVjcy90czNhMjI3ZS5oIgpAQCAtMTMzLDYgKzEzNCwyNSBAQCBlbnVtIHsKIAlEQUlMSU5L
X0hETUksCiB9OwogCitzdGF0aWMgc3RydWN0IHNuZF9zb2NfamFjayBya19oZG1pX2phY2s7CisK
K3N0YXRpYyBpbnQgcmtfaGRtaV9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydW50
aW1lKQoreworCXN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBydW50aW1lLT5jYXJkOworCXN0
cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gcnVudGltZS0+Y29kZWNfZGFpLT5j
b21wb25lbnQ7CisJaW50IHJldDsKKworCS8qIGVuYWJsZSBqYWNrIGRldGVjdGlvbiAqLworCXJl
dCA9IHNuZF9zb2NfY2FyZF9qYWNrX25ldyhjYXJkLCAiSERNSSBKYWNrIiwgU05EX0pBQ0tfTElO
RU9VVCwKKwkJCQkgICAgJnJrX2hkbWlfamFjaywgTlVMTCwgMCk7CisJaWYgKHJldCkgeworCQlk
ZXZfZXJyKGNhcmQtPmRldiwgIkNhbid0IG5ldyBIRE1JIEphY2sgJWRcbiIsIHJldCk7CisJCXJl
dHVybiByZXQ7CisJfQorCisJcmV0dXJuIGhkbWlfY29kZWNfc2V0X2phY2tfZGV0ZWN0KGNvbXBv
bmVudCwgJnJrX2hkbWlfamFjayk7Cit9CisKIC8qIG1heDk4MDkwIGFuZCBIRE1JIGNvZGVjIGRh
aV9saW5rICovCiBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgcmtfZGFpbGlua3NbXSA9
IHsKIAlbREFJTElOS19NQVg5ODA5MF0gPSB7CkBAIC0xNTAsNiArMTcwLDcgQEAgc3RhdGljIHN0
cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmtzW10gPSB7CiAJCS5vcHMgPSAmcmtfYWlm
MV9vcHMsCiAJCS5kYWlfZm10ID0gU05EX1NPQ19EQUlGTVRfSTJTIHwgU05EX1NPQ19EQUlGTVRf
TkJfTkYgfAogCQkJU05EX1NPQ19EQUlGTVRfQ0JTX0NGUywKKwkJLmluaXQgPSBya19oZG1pX2lu
aXQsCiAJCVNORF9TT0NfREFJTElOS19SRUcoaGRtaSksCiAJfQogfTsKLS0gCjIuMjIuMC40MTAu
Z2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
