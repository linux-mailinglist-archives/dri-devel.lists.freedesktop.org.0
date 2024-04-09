Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E989DAB5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34BC10E764;
	Tue,  9 Apr 2024 13:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2xzZPtfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0764112519
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:26 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-343e096965bso2906214f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670145; x=1713274945;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
 b=2xzZPtfjt5bt9SQl+QiZN19No633CJ8GykppcTF5yuWNPXAEkgBmz4PWJaBOfHHHWh
 pu2Bc0RZvh6L7FUDW83sEWracJ4HK89zMMUsY4+mghNzZMPXUR2+uD1mCevQBoreTUlb
 ebvuYTG29vlCddOEGUVfJFD+dTar0YnASO+xJj1rf96ZxB+MZQ/1lYs8bC+vh8W/glOL
 pkSuwnAMLr4WalOyl9sP6rUICcS6lNlilOcSN+CVCT/Wsaj84Ilp6YqSiUxwDtxistAl
 krYpDbCd7GUhxqs3MrdiDiZaz7IsG085zkyujoD6xgg/3S+4+nUSlXlqRpp3cy6K3hRq
 02jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670145; x=1713274945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
 b=ZJzmqGShQK3TPN7+cuZ6E7UbuulvqmWpYsQU5m6vsCUeqDwUYPASvihLpfmRkETw4/
 a5Du6WLZHPywBWqm5XhE0cfrSPsAwuQMpZO001JxR8tQZpmlLpyVswFdtQI6jOO3u0BP
 4cgEvzRE6toNbpmvkzEsaXSkZQoqN5INzObxzsruDxKT7lE5hj5vtabzLg/+Z9XvlkCZ
 6tZgwy38okqLaHfsg08pFsYTPrbfLqBSy7CfA4cXtqAXa3xbhn5h6xPxo5+FC+cgz2B5
 sAwz17jI9I3PGTDO0QvnKM8U5MOc/qyVe9p8pJ7+jTERkZwckZTg8GSoiS2fNkGaS21h
 btzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgruM2XZk36urV6LFzu1eXHwc56X+g6dZ7ZufZrVrWVRezykXkx1UfU7nX48QdnrdiRFyb0gsEF6fl96ko4vRot8bxmGnob0F+If+q4hwG
X-Gm-Message-State: AOJu0YyDTS9QIlfVUyPgaUQnWc1OgG8os1Oxz5lNO2J3uId7x8dYsdmB
 XZiNoHCoKHeE+bAMHrMfWEiLFfXPYfnQfLxvRxW9GfCE/Z5PTHk0Npb3CcIKkxQ=
X-Google-Smtp-Source: AGHT+IEqTXuQ9vUhLAGUJddJlynr3Hgv8g1A9SL9yf+aGDwibGHFcaB9hafvGzYGFH6ippvirWYDUA==
X-Received: by 2002:a5d:6d81:0:b0:345:e3e9:f063 with SMTP id
 l1-20020a5d6d81000000b00345e3e9f063mr4281547wrs.59.1712670145020; 
 Tue, 09 Apr 2024 06:42:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:06 +0200
Subject: [PATCH v3 08/18] ASoC: mediatek: mt8365: Add ADDA DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-8-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10092;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=rupMHCo4ov9trVUAGySMN2xWWd+DYicdRaX3eev6dnk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsOUxDkfb5Y6lEXLcqiv/Q4r3YM0QpDXUzDn10
 19y3N96JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURectD/
 9s0QdsZOWYWPWRTbuAWsfsKjlECL2HPlJkV0BC33MQ6nzp49VKIfcVeDSsP7AXEo/p5/+YZu+PGlc6
 Av4NyWFNyj+xgpn9hVrwPViIoD5XmF2opMUKfgpiYuhahZx2b2zVWOtCZEhfP66nS9pIaHxQRrrYph
 PMBEklKT3PZVF0HwXEPDH7NWRUfcrjsW8QTp3ooP+Nnv0etcz3qnAv9kGSUczTv5uUT4jp6dXZnOFn
 /aJKweOIkR64gAo9e4ldIhPVFNklZPZWfSIxwKY79m3Zy5FauGRK5uVhV8UH/111cnSaTEf2NLBrqE
 PvAjnQxTv5nfh2qXXF+9p4kjji5DyPhPqRMPZDuR+HoPGcs8X2D7P7oQZeQz3zRZBVv7Fywf2eqTHy
 fgr3ZxyMPd6cVdrNqHStauwRbKwadgLUMWm44pSyFEYqMZx2MWRlDvht8xWarmwjBe7svrc7ZQu47F
 FiTZTENiWfevkdVAhav0yRPz8tg2/ELu2kT2y0CtzuBYlPKvX+Wf1yLc06fk9gtpgwbuFy27t6V+M8
 nlaf/ICE1mZBgiFjgDlBNbOuyergt2DjpL4lVu6nttjhwDk9Fl5EDtsPXRIlCKfu9FzMplEBSexMl7
 78Upemv9Hyn7fcnoGq14wIa8AfeSxbxUP2lpQ9+ftMf7Gqos8U3xzsLfBbHg==
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

Add ADDA Device Audio Interface support for MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 315 ++++++++++++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
new file mode 100644
index 000000000000..65d45010ac90
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 ALSA SoC Audio DAI ADDA Control
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
+#include "../common/mtk-dai-adda-common.h"
+
+static int adda_afe_on_ref_cnt;
+
+/* DAI Drivers */
+
+static int mt8365_dai_set_adda_out(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	switch (rate) {
+	case 8000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	case 16000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	default:
+		val = 0;
+	}
+
+	val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
+		mtk_adda_dl_rate_transform(afe, rate));
+	val |= AFE_ADDA_DL_8X_UPSAMPLE |
+	       AFE_ADDA_DL_MUTE_OFF_CH1 |
+	       AFE_ADDA_DL_MUTE_OFF_CH2 |
+	       AFE_ADDA_DL_DEGRADE_GAIN;
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON0, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON1, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0xffffffff, val);
+	/* SA suggest apply -0.3db to audio/speech path */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON1,
+			   0xffffffff, 0xf74f0000);
+	/* SA suggest use default value for sdm */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON,
+			   0xffffffff, 0x0700701e);
+
+	return 0;
+}
+
+static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	val = FIELD_PREP(AFE_ADDA_UL_SAMPLING_RATE,
+			 mtk_adda_ul_rate_transform(afe, rate));
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
+			   AFE_ADDA_UL_SAMPLING_RATE, val);
+	/* Using Internal ADC */
+	regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x0);
+
+	return 0;
+}
+
+int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt++;
+	if (adda_afe_on_ref_cnt == 1)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt--;
+	if (adda_afe_on_ref_cnt == 0)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
+	else if (adda_afe_on_ref_cnt < 0)
+		adda_afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+static void mt8365_dai_set_adda_out_enable(struct mtk_base_afe *afe,
+					   bool enable)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0x1, enable);
+
+	if (enable)
+		mt8365_dai_enable_adda_on(afe);
+	else
+		mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_set_adda_in_enable(struct mtk_base_afe *afe, bool enable)
+{
+	if (enable) {
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x1);
+		mt8365_dai_enable_adda_on(afe);
+		/* enable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x31);
+	} else {
+		/* disable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x30);
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x0);
+		/* de suggest disable ADDA_UL_SRC at least wait 125us */
+		usleep_range(150, 300);
+		mt8365_dai_disable_adda_on(afe);
+	}
+}
+
+static int mt8365_dai_int_adda_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int stream = substream->stream;
+
+	mt8365_afe_enable_main_clk(afe);
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC);
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	return 0;
+}
+
+static void mt8365_dai_int_adda_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int stream = substream->stream;
+
+	if (be->prepared[stream]) {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mt8365_dai_set_adda_out_enable(afe, false);
+			mt8365_afe_set_i2s_out_enable(afe, false);
+		} else {
+			mt8365_dai_set_adda_in_enable(afe, false);
+		}
+		be->prepared[stream] = false;
+	}
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_int_adda_prepare(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int rate = substream->runtime->rate;
+	int bit_width = snd_pcm_format_width(substream->runtime->format);
+	int ret;
+
+	dev_info(afe->dev, "%s '%s' rate = %u\n", __func__,
+		 snd_pcm_stream_str(substream), rate);
+
+	if (be->prepared[substream->stream]) {
+		dev_info(afe->dev, "%s '%s' prepared already\n",
+			 __func__, snd_pcm_stream_str(substream));
+		return 0;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = mt8365_dai_set_adda_out(afe, rate);
+		if (ret)
+			return ret;
+
+		ret = mt8365_afe_set_i2s_out(afe, rate, bit_width);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_out_enable(afe, true);
+		mt8365_afe_set_i2s_out_enable(afe, true);
+	} else {
+		ret = mt8365_dai_set_adda_in(afe, rate);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_in_enable(afe, true);
+	}
+	be->prepared[substream->stream] = true;
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_int_adda_ops = {
+	.startup	= mt8365_dai_int_adda_startup,
+	.shutdown	= mt8365_dai_int_adda_shutdown,
+	.prepare	= mt8365_dai_int_adda_prepare,
+};
+
+static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
+	{
+		.name = "INT ADDA",
+		.id = MT8365_AFE_IO_INT_ADDA,
+		.playback = {
+			.stream_name = "INT ADDA Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.stream_name = "INT ADDA Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_int_adda_ops,
+	}
+};
+
+/* DAI Controls */
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1 Switch", AFE_CONN3,
+				    10, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2 Switch", AFE_CONN4,
+				    11, 1, 0),
+};
+
+static const struct snd_kcontrol_new int_adda_o03_o04_enable_ctl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
+	SND_SOC_DAPM_SWITCH("INT ADDA O03_O04", SND_SOC_NOPM, 0, 0,
+			    &int_adda_o03_o04_enable_ctl),
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch1_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch1_mix)),
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch2_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch2_mix)),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
+	{"INT ADDA O03_O04", "Switch", "O03"},
+	{"INT ADDA O03_O04", "Switch", "O04"},
+	{"INT ADDA Playback", NULL, "INT ADDA O03_O04"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH1"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH2"},
+	{"AIN Mux", "INT ADC", "INT ADDA Capture"},
+	{"ADDA_DL_CH1", "GAIN1_OUT_CH1", "Hostless FM DL"},
+	{"ADDA_DL_CH2", "GAIN1_OUT_CH2", "Hostless FM DL"},
+};
+
+int mt8365_dai_adda_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_adda_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_adda_driver);
+	dai->dapm_widgets = mtk_dai_adda_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_adda_widgets);
+	dai->dapm_routes = mtk_dai_adda_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_adda_routes);
+	return 0;
+}

-- 
2.25.1

