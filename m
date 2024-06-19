Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92690F10E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9973210ECEE;
	Wed, 19 Jun 2024 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e0+t07UB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243A010ECE8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:47:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a6fb696d2d8so76327466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808420; x=1719413220;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Eu9KHN6O9feOXQZIc3pnAqxv/Rly5882f3JxRtNrTzc=;
 b=e0+t07UBTbs0i8690tS+yaPDXprRrx8swrFkzGt+fwCf3ikVTK6lSDsid/AirhBYSk
 +YfSle/IXCI8nzNzpRERPXBza6fGBkysHxmE7EIKenzLVFfTH2ZkcKgDArceWXutuQFF
 2A945h8wX+pwfNlwssSDqv8TRe05RnFO+O5mKuonSGIT2sAuJ103ni+NR4lHCdI7gtgT
 Q++lEwvZfioldiIvll6+cQMtvfbWTC36FiJ7U5LFH9MZRU2W1MDALuUVLry1I4va36f6
 OuHceAKDGEuE89YE25xzxupbMGFSm2zzwbHnGYUQw3JphY7VV2G1rKBhW3sAxkFJDinr
 If3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808420; x=1719413220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eu9KHN6O9feOXQZIc3pnAqxv/Rly5882f3JxRtNrTzc=;
 b=X0S1F6SCMC6r/rcdHJsQGvcht0dC9ICSEaCEjVNE96u5a5hlJHJGXKrOzf2JkIpMep
 18bmaChfqJjImK3AGM8ObpUToBtklRg2/vj0TL435LAcEBdadgnVdokNV9Nw8mTt6zSK
 VT0NL6HymeZjPYWiVUT2YQb2+dEZY3ZKRTZwrSOsbOFnkTcRTdPOGNeA83kzbZ349aVB
 CKNxWTKBKvrnQJXWhiPc9DCcS72oukYwqZ5tF5UBKz5KGEheTLRF5Mol7T/hy5CqxpFm
 CeGJpSawSVpVbW1kXahZvGeH8O7NAilAG62dqarAx4f87WugbFeNvtkwzid/hkBNnUhY
 BQaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF98htB4Q6rrdlxslASXP9FMqO+Di0Uyvx8uOjpD2J24QiohOm/VDMIOS87SfGdgr3UTe20lsG5D4YMpGD/fImQ9UljBI5/Pz32ODpjERP
X-Gm-Message-State: AOJu0YyoKr1bUzSW1Xn/zI3vmkVwgwdQqxdcqINcUPhC2xHRKEtlbuwu
 wEe8PT48/765Ca2a1MmLXn/mhtZpxSFwbxatL6wQGOtd5tODhWQsZULHYv7zF0w=
X-Google-Smtp-Source: AGHT+IF9Xna0NCSZ71nJW/KibUniTeCho+54yjhpqq4gX+wMQWPJKjKtkuaMz82Y9ut3OcVHTEKjRA==
X-Received: by 2002:a17:906:11cb:b0:a6f:1b40:82ab with SMTP id
 a640c23a62f3a-a6fab7d6c27mr159497366b.76.1718808420293; 
 Wed, 19 Jun 2024 07:47:00 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:46:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:45 +0200
Subject: [PATCH v6 09/16] ASoC: mediatek: mt8365: Add PCM DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-9-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8324; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=JRfz/kV+DRSeGgY1Z9RwX0i9Jk3fWwDrXob0FOGSr3A=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Qdb9rCDB+fISnfxW07vfuMZO+M1HH6d8VOyUg
 Zct+Ql+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURS/tD/
 9HoeBttS82gIGlSeCIhwVOzULgBokyemgdpoyR8rjq4WwpybV2W/qXeQl6MhlspmK4Cp6VF5lWI1Xd
 1zO2uVwBjoFSY4CtSps4sub7O3d31TLhMHU8GPMlcmnw9P8+BOdg3YVxB1RdId6pWahSB/llFihNgg
 40kGGXMy//mIcoajudt0kFCO3MRGxV+S80BYBIqNaRlPcBK4QEJyUXxImg9MTGYLBaGrlNnjKinasz
 dCL2NXQYmzlo2TxbdbNTWBvyzmt2gh+2OSnMs3uRBxfuzy3d/IgXKbx7UswqubGPFqWGUd8SCnOu0y
 oD5quYeuM58iEZuj7CHt4uDSmK36WGoyVOPPv6W2Yo3YH4yu/zfLT1C77xCavniRyFHADxZf3SnXPR
 wRdxea8S01ZQzi5vVHexX70soJ6CFc0X1i2oD6LjVJaRD5sVwfEnzHCVuwoOOB22MGLMwTdRnTlv9F
 RtRQNuh5r9TidCHWMpPd7Qwl1/hGKyO/2WKrOuWboQgzfuP7kRBW0zovmAb55JitpFY0KK/THSMQy3
 ou+PRH1ssdfOOFulOxjJaNHS93hLIlOt1oDeh7CPQ1mq5WiTS0GayuIt+EX4lR5qUvAm32rTlLNCBs
 yZBInpGXzYcZJzCJcqimwsoDKet9w53AQEhOh6JmZAoWDiP/ZJhuEXJmk3SQ==
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

Add Pulse Code Modulation Device Audio Interface support for MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c | 293 +++++++++++++++++++++++++++++
 1 file changed, 293 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
new file mode 100644
index 000000000000..f85ec07249c3
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek 8365 ALSA SoC Audio DAI PCM Control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+
+struct mt8365_pcm_intf_data {
+	bool slave_mode;
+	bool lrck_inv;
+	bool bck_inv;
+	unsigned int format;
+};
+
+/* DAI Drivers */
+
+static void mt8365_dai_enable_pcm1(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+			   PCM_INTF_CON1_EN, PCM_INTF_CON1_EN);
+}
+
+static void mt8365_dai_disable_pcm1(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+			   PCM_INTF_CON1_EN, 0x0);
+}
+
+static int mt8365_dai_configure_pcm1(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_pcm_intf_data *pcm_priv = afe_priv->dai_priv[MT8365_AFE_IO_PCM1];
+	bool slave_mode = pcm_priv->slave_mode;
+	bool lrck_inv = pcm_priv->lrck_inv;
+	bool bck_inv = pcm_priv->bck_inv;
+	unsigned int fmt = pcm_priv->format;
+	unsigned int bit_width = dai->sample_bits;
+	unsigned int val = 0;
+
+	if (!slave_mode) {
+		val |= PCM_INTF_CON1_MASTER_MODE |
+		       PCM_INTF_CON1_BYPASS_ASRC;
+
+		if (lrck_inv)
+			val |= PCM_INTF_CON1_SYNC_OUT_INV;
+		if (bck_inv)
+			val |= PCM_INTF_CON1_BCLK_OUT_INV;
+	} else {
+		val |= PCM_INTF_CON1_SLAVE_MODE;
+
+		if (lrck_inv)
+			val |= PCM_INTF_CON1_SYNC_IN_INV;
+		if (bck_inv)
+			val |= PCM_INTF_CON1_BCLK_IN_INV;
+
+		/* TODO: add asrc setting */
+	}
+
+	val |= FIELD_PREP(PCM_INTF_CON1_FORMAT_MASK, fmt);
+
+	if (fmt == MT8365_PCM_FORMAT_PCMA ||
+	    fmt == MT8365_PCM_FORMAT_PCMB)
+		val |= PCM_INTF_CON1_SYNC_LEN(1);
+	else
+		val |= PCM_INTF_CON1_SYNC_LEN(bit_width);
+
+	switch (substream->runtime->rate) {
+	case 48000:
+		val |= PCM_INTF_CON1_FS_48K;
+		break;
+	case 32000:
+		val |= PCM_INTF_CON1_FS_32K;
+		break;
+	case 16000:
+		val |= PCM_INTF_CON1_FS_16K;
+		break;
+	case 8000:
+		val |= PCM_INTF_CON1_FS_8K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (bit_width > 16)
+		val |= PCM_INTF_CON1_24BIT | PCM_INTF_CON1_64BCK;
+	else
+		val |= PCM_INTF_CON1_16BIT | PCM_INTF_CON1_32BCK;
+
+	val |= PCM_INTF_CON1_EXT_MODEM;
+
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+			   PCM_INTF_CON1_CONFIG_MASK, val);
+
+	return 0;
+}
+
+static int mt8365_dai_pcm1_startup(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	if (snd_soc_dai_active(dai))
+		return 0;
+
+	mt8365_afe_enable_main_clk(afe);
+
+	return 0;
+}
+
+static void mt8365_dai_pcm1_shutdown(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	if (snd_soc_dai_active(dai))
+		return;
+
+	mt8365_dai_disable_pcm1(afe);
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_pcm1_prepare(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	if ((snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK) +
+	    snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE)) > 1) {
+		dev_info(afe->dev, "%s '%s' active(%u-%u) already\n",
+			 __func__, snd_pcm_stream_str(substream),
+			 snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK),
+			 snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE));
+		return 0;
+	}
+
+	ret = mt8365_dai_configure_pcm1(substream, dai);
+	if (ret)
+		return ret;
+
+	mt8365_dai_enable_pcm1(afe);
+
+	return 0;
+}
+
+static int mt8365_dai_pcm1_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_pcm_intf_data *pcm_priv = afe_priv->dai_priv[MT8365_AFE_IO_PCM1];
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		pcm_priv->format = MT8365_PCM_FORMAT_I2S;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		pcm_priv->bck_inv = false;
+		pcm_priv->lrck_inv = false;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		pcm_priv->bck_inv = false;
+		pcm_priv->lrck_inv = true;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		pcm_priv->bck_inv = true;
+		pcm_priv->lrck_inv = false;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		pcm_priv->bck_inv = true;
+		pcm_priv->lrck_inv = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		pcm_priv->slave_mode = true;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		pcm_priv->slave_mode = false;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_dai_pcm1_ops = {
+	.startup	= mt8365_dai_pcm1_startup,
+	.shutdown	= mt8365_dai_pcm1_shutdown,
+	.prepare	= mt8365_dai_pcm1_prepare,
+	.set_fmt	= mt8365_dai_pcm1_set_fmt,
+};
+
+static struct snd_soc_dai_driver mtk_dai_pcm_driver[] = {
+	{
+		.name = "PCM1",
+		.id = MT8365_AFE_IO_PCM1,
+		.playback = {
+			.stream_name = "PCM1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "PCM1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_dai_pcm1_ops,
+		.symmetric_rate = 1,
+		.symmetric_sample_bits = 1,
+	}
+};
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_pcm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("PCM1 Out"),
+	SND_SOC_DAPM_INPUT("PCM1 In"),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_pcm_routes[] = {
+	{"PCM1 Playback", NULL, "O07"},
+	{"PCM1 Playback", NULL, "O08"},
+	{"PCM1 Out", NULL, "PCM1 Playback"},
+
+	{"I09", NULL, "PCM1 Capture"},
+	{"I22", NULL, "PCM1 Capture"},
+	{"PCM1 Capture", NULL, "PCM1 In"},
+};
+
+static int init_pcmif_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_pcm_intf_data *pcmif_priv;
+
+	pcmif_priv = devm_kzalloc(afe->dev, sizeof(struct mt8365_pcm_intf_data),
+				  GFP_KERNEL);
+	if (!pcmif_priv)
+		return -ENOMEM;
+
+	afe_priv->dai_priv[MT8365_AFE_IO_PCM1] = pcmif_priv;
+	return 0;
+}
+
+int mt8365_dai_pcm_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_pcm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_pcm_driver);
+	dai->dapm_widgets = mtk_dai_pcm_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_pcm_widgets);
+	dai->dapm_routes = mtk_dai_pcm_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_pcm_routes);
+	return init_pcmif_priv_data(afe);
+}

-- 
2.25.1

