Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93D867788
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2B110F1F6;
	Mon, 26 Feb 2024 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cAorLhWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D510F1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512d19e2cb8so4630702e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956146; x=1709560946;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=;
 b=cAorLhWYBRhH8HhnOsRRangL0cgxfbKCdnNWw1xe30Vefhg7fn/XI/TwPEqPTIvW37
 gLxCUzLZHLTeWzMRcIYgDBFkxl6z2yPqk/f6XWhlgIwCxX3AR8biGScrgYSPFX9DE4hp
 haQbqfv7VcIZXO8uZ8JoAHwgKMNxLejWbT+InvLBofSJlUvygoVTFlAAzqXDIpN2tuKO
 /CFng3dnO3wNTD7i5MIi4gPlck0S/UVWQoteXzAAteDYQmZBAirppj+yVhyO5rPxLgUL
 4KDy16KmtOYqGy/bIr11jAd6k9pikSasl6kf0l6d1yo3GnqRrovBnKn4zLsWMOCSuNeK
 7ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956146; x=1709560946;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=;
 b=JdLThc0kt/rMvvC8uLqUSNdRJcJGtjCd3TLZPLy2GCQZx3tL6/4Z2WYuwIRss0ICcC
 0FccS92yzezXvtqWxtjH2CWDVj4qzUV36TqkGOntbuN67Qd0mCiR/PAYGmkthkOHNdur
 B4byydUqXKbYAbpynFl2rckjkkGqBOmP9GDuP9ak9Hr16OWOdVclf5tFVbOgr1YMlpT5
 vBixD8DNffvFE0m2ODValaT0glru9PUy0/SA6+GAZ80qN6DwwJjP1/Se4U+BxwLZjWH8
 i35T2L1zwUJqHTPeYT2Ar0EZqpze7agYGiKFN4w7O46gQTBHFU28aERayW4c+rvVR1bl
 LkKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtknC+MAzMeW6i8TDLHEKZZXrdmSI2kwXXoyPwkhSpjYikOt1bvhC6bfux4D/blFqKIHIjOoS3duHSWi4FE11N1ehcsvbT1lhe7xKqSyr2
X-Gm-Message-State: AOJu0Yw9YTL+LbC9IrXTM0k8aUi4E6hBLEUiJzS+bJDJTdjMPuVpX40w
 E/syn0PGkG+IqYXi560UB77NMFLqaftt+m890Lm5s5Fa7sd1hsNqpTRebOzt/+U=
X-Google-Smtp-Source: AGHT+IFZTYGnkejti+WCUV0bUYklgWDkRIQ3OpYZLpgocYTsWqEZ09TnWQAenfEV9LOzKDtQuB6hbw==
X-Received: by 2002:a05:6512:3da9:b0:512:aa52:5cce with SMTP id
 k41-20020a0565123da900b00512aa525ccemr5583650lfv.12.1708956146625; 
 Mon, 26 Feb 2024 06:02:26 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:26 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:52 +0100
Subject: [PATCH 14/18] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-14-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=7gKtKZ96mpebE4/UyNGtTbO/tF9O5foCSjcP2W5e+6o=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncDRU2NBAq5rld4NoSuR28KwMZlIfGU8IBQSkN
 SNQJ2tqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURfDGD/
 9m97Nzpk6hOjVqK3PFbQax0+QGFlRuqovyHNa4EU9vmGuGO8caLPUuugYcx559tE8h+O1jkQCrwNWX
 Q/XOJ1FDmQ6RI9Q+XZF3AxpJllFfCjLhgqxMDYasFUG3w/1ZZ+ENS9Nl1WonR/58W3CFvWLABh6fqV
 N3JD01coH9rYNalJvFiv512AS5tFcJFWbfHDgxPE9yPGue60swyFLkrzI5+2j3X4SrKoM6Dgzqq4wc
 eojs5yS/ONSWbcY0vq3o5QMLyQkPdZBm5BLautmVV3Jy3SHMqvwmuve/casoFCf5K/J3MBxJDDVhqs
 OxpWXaazPI1cPcWxo3B3pVoK6YuwDtZb6QH3dWTgiJlmdorv3ErELXiBUZy6Sua5s3+zvVJS8RPz8Y
 VKeco0kB7OYIYUWEs0BT0TVeGj4sUqqyV99af0vY4kP21ygqowS6nN+yioba0wVhvNidAcRHZB/qoL
 lkBf9JDhphrOQl8xUhvVGCAmMxegJ6est/k6fJZ7hCb1UE3biVtE/p7RAeYSlt8/nMBrXK+2SO58XW
 AC5zcWZnuO6QzvwI29ZugDYm0/gxJx+tHTdzK7IqfeloT5QeH3QDzvxl0JQBbP3FUXC1vKm59Or25T
 LhPQU64Udhs7slsra/bjBBFsekuxfIFzBMn9iRPU7SDoam+8QkzwtjU02C5A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 296b434caf81..671020037a99 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -314,3 +314,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for Mediatek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for Mediatek MT8365
+	  boards with the MT6357 codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 3938e7f75c2e..4b55434f2168 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
new file mode 100644
index 000000000000..52ba45a8498a
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# MTK Platform driver
+snd-soc-mt8365-pcm-objs := \
+	mt8365-afe-clk.o \
+	mt8365-afe-pcm.o \
+	mt8365-dai-adda.o \
+	mt8365-dai-dmic.o \
+	mt8365-dai-i2s.o \
+	mt8365-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8365) += snd-soc-mt8365-pcm.o
+
+# Machine driver
+obj-$(CONFIG_SND_SOC_MT8365_MT6357) += mt8365-mt6357.o

-- 
2.25.1

