Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D489D676
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D84112C64;
	Tue,  9 Apr 2024 10:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gZthUMd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629E112C67
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:14:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4165805e158so17698205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657642; x=1713262442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=gZthUMd8b1UeeStHC/JEHuV6j5+NO/aifnXv+cCcZs2YW77iqlXDYXNmVsVh3hIKwP
 ry9NICWa6/C47kbd54mJMyF29JACKQbeewqvatAsojnABoHnNe2a6IBQofVCj9GZXLpn
 Ue8TXlIyu4H8VN5gS/cc4S9BerOJcgg+TCEZbXvj6gPQMmCo9g6Y92aaZtfU+zA4ow/A
 Bj032TKvL6IIZfgVqO7EN30UaFNb6zbZAbthmiXGykB1wrvHv7vJEEM6gJOwDQBzrzbM
 vuJDvTBNqm4V91bpXOz37XVa6MBTCrx3mlgNif2RcHu4aFF22EeWpXQzYe1TLMyvPtCj
 /Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657642; x=1713262442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=Kk2Ux/yGUs6eMxDzm7qnNRv11ojcLGctrK48FHp+W1OFP5ptH7OsenwsDlQnAf+kqd
 jN6y4oI9+NHWsFBfXBsnWlloRJM/CqGTiT3lBW1Tu9h+vQICkCHAGbSZqsZHJEUDsfmN
 u6+0+5qbiWHSwGFry8dXhVUHNJIw5IbCfVp84IAed9VyAPOniXoojk3ME4wXenX6rRwa
 8kwuaygGvoyYQ7IHtYf0nOXun7j48lWmfaFJXJM6Mm9HtmQsjlTKycDZYLdweEwzuaTS
 sGBaSz1DG5Q95XYyM4HuXlDIdnxZOZYvmb10rkDqd2KDBaGScnBPl3Lmak43CTwQDokG
 sG4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQil3olh2WCIra4/EBiNQLiUc3UOla1+wbreRgTmYVjGnVphXVsoRSgm48kZk4Ipj1ZYMakyEWoCRmgFlEgHztbB1czyKe1Pfd51d4h8Ax
X-Gm-Message-State: AOJu0Yxbfp8S6EN2i3uJzAMjzSUjQn3tg9nWC7ZFJHGlE+oYie14crXQ
 ejEOo+JQtmPck5I8tqyCJ4AZRArPrVFku98Cx8HhRdKsjVVvIOLkrScCj2jlUFU=
X-Google-Smtp-Source: AGHT+IGg+qyK2mz9YWd/JqH50CwAtlrGTRYl+InjvJ2xy4FgfQZKzqEtNGNqbRovXDbYKqTzZPbMLw==
X-Received: by 2002:a05:600c:3108:b0:416:4923:1f2d with SMTP id
 g8-20020a05600c310800b0041649231f2dmr6513861wmo.30.1712657642630; 
 Tue, 09 Apr 2024 03:14:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:14:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:35 +0200
Subject: [PATCH v2 14/18] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-14-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT2q1kS4mzy/NybWoAbX8cukntMOY4p5dixke5
 /AoCuiWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURctOD/
 4mrGmtiYDjbfFa+U1HcWmqlwWqpw5YBSVzqMwm0HuwtcYbgBYCvy7BsPTIKM9b/Eb0dPNPuvQUEXo+
 +PwIkV1XZOqs+akViaabJZpjcym9VBidjgxZ8HiRJNOD6WnJ3zwAbqkLlb4LJGovQk85OeAGyJRnJo
 VxO4UgINR9o+b5qo1a878IOXYPjgsXw2rQUknZtFUW2SVtDM734Aij/VLxPzHobadPjSqhEGStU1vb
 D0j0KIFFdfdptvwGji4fPqvcA+MzJAmpbQiANyGpdlz7ZK15Lr1Z/QB5bsk5k5jOvNpePCnU8tvUlx
 5mRjbtLL/qf0oMSsz+hAG5KtwJglafv/7bbsA7nBmEYejG9JNX34SrIO9yeRbQ9Br4UZknPO2592Ho
 oilZDSgVzk4yHg9hcqV+YdcY+WyvnHtjasvI9lHyMuuqox6fWkn/zwFrgY/fn+62T4Qe9e4QcPfR6A
 8kBnD2UItlMldFJ9+YMFjzhIPv2KByIxNy7n6Ip0oLZzd3hmkjESst8P5AMocRMdcu7HjmaeodaCZE
 BD12RuC4m5ZXo7RNAo3UoaD5KatuyibL8h/PZT2t6zbc4/2YTLVvfJBz7+XLB23LQqNJoAm3enhBt2
 YyI1mYbn/6r4TCxea0jX4kKyXJpl4p0/TSaUa4PlzBCJ4j1GZTQmnhgoWsow==
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
index 5a8476e1ecca..c1c86ecc0601 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
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

