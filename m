Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E0786778E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FBE10F1FA;
	Mon, 26 Feb 2024 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hbAqigDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2159410F1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:23 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-412a3ebad2aso8389105e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956141; x=1709560941;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7rk/tSJl5kLzfsbNzKXk0J46mO1xUX9mq9pT6k284dM=;
 b=hbAqigDg3emakO58Lhqhf9/SCv89Mcfg1PljDxRUdGFRMzPKcrt4ZyYaTrzTobREG5
 TqfNJf/zS3gds1zhAujuulhyqGY6tNbcqKJUwilW8jWOeDZ0CNfE7wuf8QOXOyjlFVg1
 nyh6kflqc6S5tirzu7Th7AUr5Wk6oxhUbOHGUPQwKzQfSLhmWH0NaXESwO+MshfO00j4
 7O3mo21YA/WDsM0WtR9G8XoYNNPKbjMA67rWLx+E6QN5rhO4toOdBoDDuHl+b2F9xaqr
 aADrKLIzlN3k8xt1r5II6634/0PTjmMCqiTDSVJdYJ4badEocAlUiOw2KwajuWr5J6FV
 DWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956141; x=1709560941;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rk/tSJl5kLzfsbNzKXk0J46mO1xUX9mq9pT6k284dM=;
 b=GDzd7TtIDoYwbSFWYYf0i+tAFvwbIS+my/LzdcBP5qWjLDZ3VDmO9X3u3ixJaPA9sX
 1cy2bJKq9wntforSH+nnfzKrZePQd1LnfLTuZE1quUcp0XH8QQDlUs+CL6bsBwcE7bLS
 +Hd97RcNZgTwWBLvb3kZVwO7j1xzUm8b8MGkMxvFerKsNe2DujAHhf/phK21jvQ+ouWK
 hiNiY1g7bAbwhtW2MzAwMO99GSH+h1lMyzrmRfxbcE+Q1dhYCSNM1rRnR03XMlRRs2uW
 5+O9tscGpzR41RqesnmJSnuPdSZvmICPlKlYsxlrfkkW85EVNQeoIpuYSxhmBjKzBML4
 qmXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA8fhVIRU9/uWRNSSNs3N8iZcntQCxNJqSvsJ7DY3rHSfQAwnRN0scTVuoDMwy1rrRhbtiHsfN222BvRF6nLk2H9FU2cOENzNdxKmYKqB7
X-Gm-Message-State: AOJu0YzeuXLq559QZ1Fi9DVFbrYHwiSESz0HTgE047WEdsnAtuxR/x1D
 +cTgAGBapPhtzaSAlVNDavGQrrEMDJlT2nkJucZ95Oz39218g6vEvONO+RuoVr4=
X-Google-Smtp-Source: AGHT+IH5GQoT6M+RJiV3VuRpIKlT4Tt2IfyYzZ7kuzYARaCi5A89a5llh+LVXN8Sa2iJNPcuyc/N4A==
X-Received: by 2002:a05:600c:1c94:b0:412:a7d0:6205 with SMTP id
 k20-20020a05600c1c9400b00412a7d06205mr1336284wms.11.1708956141193; 
 Mon, 26 Feb 2024 06:02:21 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:20 -0800 (PST)
From: amergnat@baylibre.com
Date: Mon, 26 Feb 2024 15:01:48 +0100
Subject: [PATCH 10/18] ASoc: mediatek: mt8365: Add a specific soundcard for EVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-10-4fa1cea1667f@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10979;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=uBK7Yymo2RSrOcLwG3FQocwjl9A/GkudWfrF/KTinSk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncPH4l5IUg+l31d/JAjVl6JDVLmtD7tebTfEj5
 Hh7Iv06JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURZkdEA
 CqpOUUsGSTW+nZFIzg3gkQuWQFWxpzgMGSx/HIu6xu4Gsciub3B+V4uM8WqTfaCt1CpOwJj2QgjkVh
 DJzxSTXKnrAyA3ohevTA4bDKWo1x2No1lTHWrd9t0xDntRG2FK6Hj9mUDBKNZPV/Gb2owvcvUqqdKa
 R+uDMko6pI7knqfN58ZTX3fdkbI8uHITfI2nMvYJQDjoD7m/HoVeP4vmhkgHX4nmoDpqmxfQX2zlkm
 /uEBOQYAGzJD9SiCwRjXrIQFZ5+TPswDiEIjFb0E+L2Pq67Dz2B1APM1xzo0E9T4GMAt7iNSeCjls+
 fQhNFbhPWuFGHP7276LLng1lMFYeyqmSOOsyXUTKTQmNC6aPYyEeUDzmd2roRQz9RxBJHhNSi2/zxc
 UZZtu+2xxpzMI/i+UgYmIRJtrlwOFZieFoDY+fg66DwgFGCgcbGZSwvaDQxw1f2R+x7Yh7Hmsm79kH
 zVQP7BScQA5UP//7hq4DkBP0EODB/g6jKvwT13zEXmkX1YASTHBM6+1JCPUHP5Lj6yMMxOyyGXk21y
 R9WjzurfLF43OlU1JeCpU6NYslCgUOxkSGqsgAWxlOqjpg78X0i8sReRxN5sIhVr/GQOtv40kel0Zf
 H1jxf4/xK1+HET59UK7e0AWAXZpZ8PgklFzEnznhbgvSkYGtGP+g7R2i1RJw==
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

From: Nicolas Belin <nbelin@baylibre.com>

Add a specific soundcard for mt8365-evk. It supports audio jack
in/out, dmics, the amic and lineout.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 379 ++++++++++++++++++++++++++++++
 1 file changed, 379 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
new file mode 100644
index 000000000000..5192b35458e6
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT8365 Sound Card driver
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-common.h"
+#include <linux/pinctrl/consumer.h>
+#include "../common/mtk-soundcard-driver.h"
+
+enum PINCTRL_PIN_STATE {
+	PIN_STATE_DEFAULT = 0,
+	PIN_STATE_DMIC,
+	PIN_STATE_MISO_OFF,
+	PIN_STATE_MISO_ON,
+	PIN_STATE_MOSI_OFF,
+	PIN_STATE_MOSI_ON,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8365_mt6357_pin_str[PIN_STATE_MAX] = {
+	"aud_default",
+	"aud_dmic",
+	"aud_miso_off",
+	"aud_miso_on",
+	"aud_mosi_off",
+	"aud_mosi_on",
+};
+
+struct mt8365_mt6357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
+struct mt8365_dai_link_prop {
+	char *name;
+	unsigned int link_id;
+};
+
+enum {
+	/* FE */
+	DAI_LINK_DL1_PLAYBACK = 0,
+	DAI_LINK_DL2_PLAYBACK,
+	DAI_LINK_AWB_CAPTURE,
+	DAI_LINK_VUL_CAPTURE,
+	/* BE */
+	DAI_LINK_2ND_I2S_INTF,
+	DAI_LINK_DMIC,
+	DAI_LINK_INT_ADDA,
+	DAI_LINK_NUM
+};
+
+static const struct snd_soc_dapm_widget mt8365_mt6357_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HDMI Out"),
+};
+
+static const struct snd_soc_dapm_route mt8365_mt6357_routes[] = {
+	{"HDMI Out", NULL, "2ND I2S Playback"},
+	{"DMIC In", NULL, "MICBIAS0"},
+};
+
+static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					priv->pin_states[PIN_STATE_MOSI_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					priv->pin_states[PIN_STATE_MISO_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	return 0;
+}
+
+static void mt8365_mt6357_int_adda_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					priv->pin_states[PIN_STATE_MOSI_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					priv->pin_states[PIN_STATE_MISO_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+}
+
+static const struct snd_soc_ops mt8365_mt6357_int_adda_ops = {
+	.startup = mt8365_mt6357_int_adda_startup,
+	.shutdown = mt8365_mt6357_int_adda_shutdown,
+};
+
+SND_SOC_DAILINK_DEFS(playback1,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback2,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(awb_capture,
+	DAILINK_COMP_ARRAY(COMP_CPU("AWB")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(vul,
+	DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+	DAILINK_COMP_ARRAY(COMP_CPU("2ND I2S")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(dmic,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(primary_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("INT ADDA")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("mt6357-sound", "mt6357-snd-codec-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* Digital audio interface glue - connects codec <---> CPU */
+static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
+	/* Front End DAI links */
+	[DAI_LINK_DL1_PLAYBACK] = {
+		.name = "DL1_FE",
+		.stream_name = "MultiMedia1_PLayback",
+		.id = DAI_LINK_DL1_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	[DAI_LINK_DL2_PLAYBACK] = {
+		.name = "DL2_FE",
+		.stream_name = "MultiMedia2_PLayback",
+		.id = DAI_LINK_DL2_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	[DAI_LINK_AWB_CAPTURE] = {
+		.name = "AWB_FE",
+		.stream_name = "DL1_AWB_Record",
+		.id = DAI_LINK_AWB_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(awb_capture),
+	},
+	[DAI_LINK_VUL_CAPTURE] = {
+		.name = "VUL_FE",
+		.stream_name = "MultiMedia1_Capture",
+		.id = DAI_LINK_VUL_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(vul),
+	},
+	/* Back End DAI links */
+	[DAI_LINK_2ND_I2S_INTF] = {
+		.name = "2ND I2S BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_2ND_I2S_INTF,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(i2s3),
+	},
+	[DAI_LINK_DMIC] = {
+		.name = "DMIC BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_DMIC,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dmic),
+	},
+	[DAI_LINK_INT_ADDA] = {
+		.name = "MTK Codec",
+		.no_pcm = 1,
+		.id = DAI_LINK_INT_ADDA,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8365_mt6357_int_adda_ops,
+		SND_SOC_DAILINK_REG(primary_codec),
+	},
+};
+
+static int pinctrl_setup(struct snd_soc_card *card,
+			 struct mt8365_mt6357_priv *priv,
+			 unsigned int pin_id)
+{
+	int ret = 0;
+	/* if pin exist */
+	if (!IS_ERR(priv->pin_states[pin_id])) {
+		ret = pinctrl_select_state(priv->pinctrl,
+				priv->pin_states[pin_id]);
+		if (ret)
+			dev_err(card->dev,
+				"%s failed to select state %d\n",
+				__func__, ret);
+	}
+	return ret;
+}
+
+static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
+{
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+	int i;
+
+	priv->pinctrl = devm_pinctrl_get(card->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		ret = PTR_ERR(priv->pinctrl);
+		dev_err(card->dev, "%s devm_pinctrl_get failed %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	for (i = 0 ; i < PIN_STATE_MAX ; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+			mt8365_mt6357_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_err(card->dev, "%s Can't find pin state %s %d\n",
+				 __func__, mt8365_mt6357_pin_str[i], ret);
+		}
+	}
+
+	/* Setup pins */
+	ret |= pinctrl_setup(card, priv, PIN_STATE_DEFAULT);
+	ret |= pinctrl_setup(card, priv, PIN_STATE_DMIC);
+	ret |= pinctrl_setup(card, priv, PIN_STATE_MISO_OFF);
+	ret |= pinctrl_setup(card, priv, PIN_STATE_MOSI_OFF);
+
+	return ret;
+}
+
+static struct snd_soc_card mt8365_mt6357_card = {
+	.name = "mt8365-evk",
+	.owner = THIS_MODULE,
+	.dai_link = mt8365_mt6357_dais,
+	.num_links = ARRAY_SIZE(mt8365_mt6357_dais),
+	.dapm_widgets = mt8365_mt6357_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8365_mt6357_widgets),
+	.dapm_routes = mt8365_mt6357_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8365_mt6357_routes),
+};
+
+static int mt8365_mt6357_dev_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt8365_mt6357_card;
+	struct device *dev = &pdev->dev;
+	struct device_node *platform_node;
+	struct mt8365_mt6357_priv *priv;
+	int i, ret;
+
+	card->dev = dev;
+	ret = parse_dai_link_info(card);
+	if (ret)
+		goto err;
+
+	platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
+	if (!platform_node) {
+		dev_err(dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < card->num_links; i++) {
+		if (mt8365_mt6357_dais[i].platforms->name)
+			continue;
+		mt8365_mt6357_dais[i].platforms->of_node = platform_node;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(struct mt8365_mt6357_priv),
+			    GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		dev_err(dev, "%s allocate card private data fail %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	mt8365_mt6357_gpio_probe(card);
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret)
+		dev_err(dev, "%s snd_soc_register_card fail %d\n",
+			__func__, ret);
+err:
+	of_node_put(platform_node);
+	clean_card_reference(card);
+	return ret;
+}
+
+static const struct of_device_id mt8365_mt6357_dt_match[] = {
+	{ .compatible = "mediatek,mt8365-mt6357", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt8365_mt6357_dt_match);
+
+static struct platform_driver mt8365_mt6357_driver = {
+	.driver = {
+		   .name = "mt8365_mt6357",
+		   .of_match_table = mt8365_mt6357_dt_match,
+		   .pm = &snd_soc_pm_ops,
+	},
+	.probe = mt8365_mt6357_dev_probe,
+};
+
+module_platform_driver(mt8365_mt6357_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8365 EVK SoC machine driver");
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("mt8365 mt6357 soc card");

-- 
2.25.1

