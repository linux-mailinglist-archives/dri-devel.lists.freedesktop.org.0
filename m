Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8990F110
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE6A10ECF1;
	Wed, 19 Jun 2024 14:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kLJ6bhp8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA45110ECEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:47:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so1584390a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808428; x=1719413228;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
 b=kLJ6bhp8mTwHNvbJ+k8I26pONcyC0JA8AmNM6J+46Jn/X18Ld8+E2mklVb0Ij17aKW
 XoYZXSa+gyJsoDL5ycDUrLnCzbwFyoHPwt8Imme4ZrbaZSxZV4WxhuEM+6rjxIqff5PM
 DCTHyrHZjatBUgpz3oNPz98zXvJhUXrTkNmGunymFwpTWRDFlBdLfV94+kMqx7X0hZOD
 16ISn8GfrwZQ5lMgTTkKMQVdPxCLYzZcCe2zsdcrSc/0Toy55dmmRGGqGk+uLqBa33FL
 GyUWTOFyn5i8pHboxkXhySnAwW50FORZte26MhO/v7DPmoQOEMqhQL7wuZLcjYt/eKuq
 3KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808428; x=1719413228;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
 b=o+rrT8cmaBHYeHuNkP539k0Uk7RTwtbAJ2cWceFpYZsQBBFhrwqrRQ+jCk8r5WRSR7
 nFDdV1aYw7lemwA4q10XJdWXpkOCNIpP8eAncRkVFXiz6fYZNQ/7E527aooJD8ecxAq+
 OwkZIDugo6GxZOf7Gdhl3W9cF/zthu0xUYY37isG3oQldNEXjSwlHNFO/EFjHgw9GoX8
 3v7ryDYuWOo8YHZ99l4Ae3xLoP29L1frD2ZMw2mRkiLG9pG9088wkAN8gPI/T1WoLM+p
 ckf8sxErwhGaLKKPfUolNTm9DwzR1V7O73LSGdZCloupmMtXCkjL3tF2/nhcouKlCDuQ
 vwsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGr+fCmnaOwf/h/7izJdzdvm5HP/BuEUDFOuCuFgqlOqKPoW6ibdrI7vlkCsXy4F8g9z2A5Aj9qqxy6ytkFXCH2e7PH0O2X6kOYs7UXFPD
X-Gm-Message-State: AOJu0YyxAEo3gBjfdFRzq51lveKw/vbM7zCIScWw18dh7fKm1RmkDSRx
 n9EYFFkWIwFKm2464VnjfUvOg3hoppQpA+jIRO8I7ZmtlzfAkZJNgnjglj/t/5Y=
X-Google-Smtp-Source: AGHT+IFv39hM7/l8g49ZpE5FDQEiJIiaQKcf6Hu3dgwo3RGzqjnnsleD/QS3ueaABfQwUjrDhVVxVg==
X-Received: by 2002:a17:907:c24a:b0:a6f:5609:954f with SMTP id
 a640c23a62f3a-a6fa4109c82mr170872266b.12.1718808428102; 
 Wed, 19 Jun 2024 07:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:47:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:49 +0200
Subject: [PATCH v6 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-13-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RBTFZeOuKXLXrXwZoDyc1QzgOCCMR27WWisOY
 1YDIi8+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURYhIEA
 CeXVUCni9rqNKd2DLi8IUlc5fKgW6IWa3fAQtP/LfODJVCGNrNVaCeHEsKaySSSiZ51dV7Uq2gjT+E
 a2JVk5eBflZh5FLqax8aVo4XB5BLdfoBmXx76vYPkjKj+eUOgSvkJrqt130CayO7pLPqJ3adUcqJWY
 LFuskW96CnzZsU6RBHianwApzN8MgBLGth5bJfkhxJug1Fq/L8UtN99sLrhBNw99OiKT7IpeE18LPv
 PEr1dyv/Y4jrVnjaLCvTl7Chlzs9iT4GsCyPvA1hhTKiipSGOLl9bvL3LatVpP/tA1a4HLBEclPylf
 7Poi5Hz1XgOw7AlBWqPavi0xu3DWXyEDJrzIT55eOSidGmuzhIhmu6YP1uzxNg0TAuRxeiJihcpsu9
 aLIiJPQEjlnbpHGTJhSWBmaXIfRJuWXpkOTIzGVX20xa0LKYatEjl1ExK8FFt+bPkLq6Je7Dr/Mt3L
 FHv/OVi42in/ARSAcVCuG53Ahp1V6DnqpfCqFknDwQQy0mb4UlZ+VBjSTHN7rzskOP8LBoejaU4JaT
 HXIz1AS9YEynRGgj+7VlYRasTcwS8iZ/j69SP97pCOFZ8ooWMp0DqbAwlN/xDx5/y0au4+I0L1U7Kf
 mXvttQiAEWseJQNaSwkaM+ANg6kj2tr4XbjWjTZL8OnPnRNs0E6j8ZbOGIrQ==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..e6f7a5a49794 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for MediaTek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for MediaTek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8365
+	  boards with the MT6357 PMIC codec.
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

