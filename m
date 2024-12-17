Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841459F4FBD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3F210E9F1;
	Tue, 17 Dec 2024 15:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MxADZx2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420F210E9EC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450250;
 bh=2KjP+ghjdXg/hvaTHLze372DpCPcrSgv1WA4yirFNjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MxADZx2B3gM/Q/9MqbZ77j5z/KYfga95za/X0iEUZU8NKUScYXCyZV/Sry+5bIIKL
 pKBYmD3DhugUwHVBxHzjqKcqsCZRF527TKwYk9jgEXCkWpOUXAWzq57OK+jW5jf3Cv
 IsOkpvInlHefySKfcyG0hFWdHyfZDJ/3Sme3bgJzjqWzUuz5Up+tFQtRRW4zxE7RDo
 0kS71ri8oT/VDuGBzlLnkJ+25B76bxAYjaRJ4xtsywVc1RRMk24VlbOQKfPw8ynYXr
 AHF1HdEVbMetXu7mv0xxv76ue69cwjkAgpIlL/ckWQPcsM9eTjOAbZHqqIBeyM3Ohz
 Qt5e9/XJs1/vw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 95DA617E3786;
 Tue, 17 Dec 2024 16:44:09 +0100 (CET)
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
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 14/33] drm/mediatek: mtk_hdmi: Move audio params selection
 to new function
Date: Tue, 17 Dec 2024 16:43:26 +0100
Message-ID: <20241217154345.276919-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index d2f1d6286fbc..8f5ab97a0261 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1479,12 +1479,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
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
 
 	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
@@ -1495,16 +1494,16 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
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
@@ -1528,26 +1527,35 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
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
+	memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
+
+	return 0;
+}
 
-	memcpy(&hdmi_params.codec_params, params,
-	       sizeof(hdmi_params.codec_params));
+static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
+				    struct hdmi_codec_daifmt *daifmt,
+				    struct hdmi_codec_params *params)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param hdmi_params;
 
+	mtk_hdmi_audio_params(hdmi, daifmt, params);
 	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
 
 	return 0;
-- 
2.47.0

