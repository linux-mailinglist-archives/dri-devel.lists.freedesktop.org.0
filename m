Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A81A825B3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1FB10E89C;
	Wed,  9 Apr 2025 13:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bssYgBV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8205E10E89E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204415;
 bh=xcRz9FTK5nMCdCLd08SfBjuyP0hGNRmD9QcK6Mw/3hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bssYgBV8l87ZqL5iMRoExsvoNHEomukjuQYNXoZ0ugnXqfCbUibCJsxy1YGlrvozb
 TVLJSdTph/YJL9ohBlh0OfSeBp+dQV/zZ538P1ePQdDuiUpsb4Z125hfVwbBmMCo7X
 ZwSqcXEzY77SDwlpvo513WNc+xljQtMW3yG+o6qw7Dc+az+exDqZlWHGYo8YTuSESe
 EwcoKjqJoxI8eI7Bq921hQfRKLRQqcopVEvKIqVNtWx7YmwyeJ5nLrciLZjzPhH7A0
 JI2qRh/UJyA7k7ATVBmJqYjvxevumuCB0SoLuNW0GKzOOXx+ZNRVijBpCcnyA78SyP
 NgzpLfzWrOblQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EB3817E1583;
 Wed,  9 Apr 2025 15:13:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v8 08/23] drm/mediatek: mtk_hdmi: Move audio params selection
 to new function
Date: Wed,  9 Apr 2025 15:13:03 +0200
Message-ID: <20250409131318.108690-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In preparation for splitting common bits of this driver, move the
audio params (codec, sample rate/size, input type, i2s format, etc)
selection to a new function called mtk_hdmi_audio_params().

While at it, also rename "hdmi_params" to "aud_params" both to match
the mtk_hdmi struct member name and to clarify that those parameters
are for HDMI Audio and not for HDMI Video configuration.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 63 ++++++++++++++++-------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a707d101b33c..2cfab3419415 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1454,19 +1454,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
  * HDMI audio codec callbacks
  */
 
-static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *daifmt,
-				    struct hdmi_codec_params *params)
+static int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi,
+				 struct hdmi_codec_daifmt *daifmt,
+				 struct hdmi_codec_params *params)
 {
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	struct hdmi_audio_param hdmi_params;
+	struct hdmi_audio_param aud_params = { 0 };
 	unsigned int chan = params->cea.channels;
 
-	if (!hdmi->audio_enable) {
-		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
-		return -EINVAL;
-	}
-
 	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		params->sample_rate, params->sample_width, chan);
 
@@ -1475,16 +1469,16 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
 	switch (chan) {
 	case 2:
-		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
 		break;
 	case 4:
-		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
 		break;
 	case 6:
-		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
 		break;
 	case 8:
-		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
 		break;
 	default:
 		dev_err(hdmi->dev, "channel[%d] not supported!\n", chan);
@@ -1508,31 +1502,44 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
 	switch (daifmt->fmt) {
 	case HDMI_I2S:
-		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-		hdmi_params.aud_input_type = HDMI_AUD_INPUT_I2S;
-		hdmi_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-		hdmi_params.aud_mclk = HDMI_AUD_MCLK_128FS;
+		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		aud_params.aud_input_type = HDMI_AUD_INPUT_I2S;
+		aud_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+		aud_params.aud_mclk = HDMI_AUD_MCLK_128FS;
 		break;
 	case HDMI_SPDIF:
-		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-		hdmi_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
+		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		aud_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
 		break;
 	default:
 		dev_err(hdmi->dev, "%s: Invalid DAI format %d\n", __func__,
 			daifmt->fmt);
 		return -EINVAL;
 	}
-
-	memcpy(&hdmi_params.codec_params, params,
-	       sizeof(hdmi_params.codec_params));
-	memcpy(&hdmi->aud_param, &hdmi_params, sizeof(hdmi_params));
+	memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
+	memcpy(&hdmi->aud_param, &aud_params, sizeof(aud_params));
 
 	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
-		hdmi_params.aud_codec, hdmi_params.aud_input_type,
-		hdmi_params.aud_input_chan_type, hdmi_params.codec_params.sample_rate);
+		aud_params.aud_codec, aud_params.aud_input_type,
+		aud_params.aud_input_chan_type, aud_params.codec_params.sample_rate);
+
+	return 0;
+}
+
+static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
+				    struct hdmi_codec_daifmt *daifmt,
+				    struct hdmi_codec_params *params)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (!hdmi->audio_enable) {
+		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
+		return -EINVAL;
+	}
 
+	mtk_hdmi_audio_params(hdmi, daifmt, params);
 	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
 
 	return 0;
-- 
2.49.0

