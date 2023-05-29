Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0364714C2F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFB910E2C4;
	Mon, 29 May 2023 14:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF33010E05E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:36:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-970056276acso522522766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685371007; x=1687963007; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4Hg6vOJoPW8zpUD2u/XK34qVTid08A4C83SJzFRpwQ=;
 b=BcV/WNL2KjNRE3wehRbfjoSLyK1iGIHZWjKGa2M2/36fXqOioYuZudjwten0cg/3D6
 vo5Gm25HDz1jpUZ0da5rWtQQLNbbEgrUUKKE380/rX4ukPx+Ck/VEVgsloa9aSM+mHpr
 XdQbFj8AADwS+nJs3jJ+gHVe+LgBNAJUQxItcWaOloF7AlLaZvKzkS3WhxhUa5ZEa/EF
 LqesKFZdNMOVcyI4v+tUa2uCoYgMEUp8hrr2QhNF9ewVm+RaGqArMLhgElvI9jpeKnbA
 JXe6ZB/cTEpTBteRYTOXeEXNkCtFU/un8XJ6gXXNhSsrEXO5UKPJYnM7KBE8uj9aGJkR
 RDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685371007; x=1687963007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4Hg6vOJoPW8zpUD2u/XK34qVTid08A4C83SJzFRpwQ=;
 b=IcE+r4SrnD5sJIPHNb6W80g3h6pVHlaHLximBOvLVq1zs7jGASrWWijxWq5i7vF7y/
 FTFFUwb46MszM5Zmx+WZajQjeAeODMZ/b2Ot5QSdSdDgTuti7mzYvQnYTeuNNuP8Mfk5
 3BDHyK3YOMoWeS+FrcnkXbzIYrOGP+t0jx3gvYg2GlvFeVmS+Y3T+kr5hvyK2RockB4Q
 FwWG3UlkiAppBULrFvGp30tJVHWauyXvzXwPKp9jDJDckXpumxvzKD5BW1fC3BLEc5EV
 nMr5UK8B0le7Lw5tBGpmNpbU803wv8Yt0+5mG3QUz5pdSrdtuIEadCCOxqzEIVPiCWtS
 cyEQ==
X-Gm-Message-State: AC+VfDwhIIfTZxg6IUyoVDQ+btXa6B6CtCMqAIQm79MhQUFibiuLyCvu
 Y7v2fwDfJhuwwMRfTrSC5VXlDg==
X-Google-Smtp-Source: ACHHUZ6GMwLwJZl/5hLoTYz4EyOEyKto+m7fsJGEyNBrdLSncOznqGbSpe3xwIsU4LQ+a2XSx8ArPA==
X-Received: by 2002:a17:907:7244:b0:973:cc48:f19d with SMTP id
 ds4-20020a170907724400b00973cc48f19dmr11762300ejc.52.1685371006780; 
 Mon, 29 May 2023 07:36:46 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 07:36:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:31:03 +0200
Subject: [PATCH v4 6/8] drm/mediatek: hdmi: v2: add audio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-6-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDMI audio support for v2

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c |   1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 198 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.h     |   4 +-
 3 files changed, 202 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 97a00102a970..9ed86834ca85 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -346,6 +346,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_v2 = {
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_v2,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_v2,
 	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_v2,
+	.mtk_hdmi_set_codec_pdata = mtk_hdmi_set_codec_pdata_v2,
 	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_v2,
 	.num_clocks = MTK_HDMIV2_CLK_COUNT,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 98b1d50ecd72..0e41dfb36db4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -150,6 +150,24 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 	regmap_update_bits(hdmi->regs, TOP_VMUTE_CFG1, REG_VMUTE_EN, val);
 }
 
+static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
+{
+	u32 aip, val;
+
+	regmap_read(hdmi->regs, AIP_CTRL, &aip);
+
+	val = FIELD_PREP(AUD_MUTE_FIFO_EN, 1);
+	if (aip & DSD_EN)
+		val |= FIELD_PREP(DSD_MUTE_DATA, 1);
+
+	regmap_update_bits(hdmi->regs, AIP_TXCTRL, val, val);
+}
+
+static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
+{
+	regmap_update_bits(hdmi->regs, AIP_TXCTRL, AUD_MUTE_FIFO_EN, AUD_MUTE_DIS);
+}
+
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 {
 	regmap_update_bits(hdmi->regs, HDMITX_CONFIG, HDMITX_SW_RSTB, 0);
@@ -766,6 +784,7 @@ static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)
 static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 				       struct drm_display_mode *display_mode)
 {
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_aud_enable_packet(hdmi, false);
 	mtk_hdmi_audio_reset(hdmi, true);
 	mtk_hdmi_aip_ctrl_init(hdmi);
@@ -778,6 +797,7 @@ static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 	usleep_range(25, 50);
 	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
 	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_aud_unmute(hdmi);
 }
 
 void mtk_hdmi_output_init_v2(struct mtk_hdmi *hdmi)
@@ -794,6 +814,16 @@ void mtk_hdmi_output_init_v2(struct mtk_hdmi *hdmi)
 	hdmi->hpd = HDMI_PLUG_OUT;
 }
 
+static void mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
+				     struct hdmi_audio_param *param)
+{
+	if (!hdmi->audio_enable)
+		return;
+
+	memcpy(&hdmi->aud_param, param, sizeof(*param));
+	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
+}
+
 static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_hw_reset(hdmi);
@@ -812,6 +842,7 @@ static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
 
 	usleep_range(5, 10);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_hw_send_av_unmute(hdmi);
 
 	regmap_update_bits(hdmi->regs, TOP_CFG01, NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN, NULL_PKT_VSYNC_HIGH_EN);
@@ -1022,6 +1053,7 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_send_av_mute(hdmi);
 	usleep_range(50000, 50050);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_disable_hdcp_encrypt(hdmi);
 	usleep_range(50000, 50050);
 
@@ -1030,6 +1062,14 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
 	hdmi->enabled = false;
 }
 
+static void mtk_hdmi_handle_plugged_change(struct mtk_hdmi *hdmi, bool plugged)
+{
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, plugged);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+}
+
 static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *old_state)
 {
@@ -1041,6 +1081,9 @@ static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
 	phy_power_off(hdmi->phy);
 
 	hdmi->powered = false;
+
+	/* signal the disconnect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, false);
 }
 
 static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge,
@@ -1077,6 +1120,10 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_avi_infoframe(hdmi, buffer_avi, sizeof(buffer_avi));
 
 	mtk_hdmi_hw_vid_black(hdmi, false);
+	mtk_hdmi_hw_aud_unmute(hdmi);
+
+	/* signal the connect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, true);
 
 	hdmi->enabled = true;
 }
@@ -1103,3 +1150,154 @@ const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.get_edid = mtk_hdmi_bridge_get_edid,
 	.detect = mtk_hdmi_bridge_detect,
 };
+
+static void mtk_hdmi_set_plugged_cb(struct mtk_hdmi *hdmi,
+				    hdmi_codec_plugged_cb fn,
+				    struct device *codec_dev)
+{
+	bool plugged;
+
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	plugged = (hdmi->hpd == HDMI_PLUG_IN_AND_SINK_POWER_ON);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+
+	mtk_hdmi_handle_plugged_change(hdmi, plugged);
+}
+
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (!hdmi)
+		return -ENODEV;
+
+	mtk_hdmi_set_plugged_cb(hdmi, fn, codec_dev);
+	return 0;
+}
+
+static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
+				    struct hdmi_codec_daifmt *daifmt,
+				    struct hdmi_codec_params *params)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param hdmi_params;
+	unsigned int chan = params->cea.channels;
+
+	if (!hdmi->bridge.encoder)
+		return -ENODEV;
+
+	switch (chan) {
+	case 2:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+		break;
+	case 4:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
+		break;
+	case 6:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
+		break;
+	case 8:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (params->sample_rate) {
+	case 32000:
+	case 44100:
+	case 48000:
+	case 88200:
+	case 96000:
+	case 176400:
+	case 192000:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		hdmi_params.aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		hdmi_params.aud_input_type = HDMI_AUD_INPUT_I2S;
+		hdmi_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+		hdmi_params.aud_mclk = HDMI_AUD_MCLK_128FS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	memcpy(&hdmi_params.codec_params, params,
+	       sizeof(hdmi_params.codec_params));
+
+	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
+
+	return 0;
+}
+
+static int mtk_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_aud_enable_packet(hdmi, true);
+	hdmi->audio_enable = true;
+
+	return 0;
+}
+
+static void mtk_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_aud_enable_packet(hdmi, false);
+	hdmi->audio_enable = false;
+}
+
+static int mtk_hdmi_audio_mute(struct device *dev, void *data, bool enable,
+			       int direction)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (enable)
+		mtk_hdmi_hw_aud_mute(hdmi);
+	else
+		mtk_hdmi_hw_aud_unmute(hdmi);
+
+	return 0;
+}
+
+static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				  size_t len)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (hdmi->enabled)
+		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
+	else
+		memset(buf, 0, len);
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
+	.hw_params = mtk_hdmi_audio_hw_params,
+	.audio_startup = mtk_hdmi_audio_startup,
+	.audio_shutdown = mtk_hdmi_audio_shutdown,
+	.mute_stream = mtk_hdmi_audio_mute,
+	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
+};
+
+void mtk_hdmi_set_codec_pdata_v2(struct hdmi_codec_pdata *codec_data)
+{
+	codec_data->ops = &mtk_hdmi_audio_codec_ops;
+	codec_data->max_i2s_channels = 2;
+	codec_data->i2s = 1;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
index 15d06d82eb8e..6b195a9c6cc8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
@@ -7,8 +7,9 @@
 #ifndef _MTK_HDMI_V2_CTRL_H
 #define _MTK_HDMI_V2_CTRL_H
 
-#include <linux/hdmi.h>
 #include <drm/drm_bridge.h>
+#include <linux/hdmi.h>
+#include <sound/hdmi-codec.h>
 
 struct mtk_hdmi;
 
@@ -17,6 +18,7 @@ extern const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs;
 void mtk_hdmi_output_init_v2(struct mtk_hdmi *hdmi);
 int mtk_hdmi_clk_enable_v2(struct mtk_hdmi *hdmi);
 void mtk_hdmi_clk_disable_v2(struct mtk_hdmi *hdmi);
+void mtk_hdmi_set_codec_pdata_v2(struct hdmi_codec_pdata *codec_data);
 
 enum mtk_hdmi_clk_id_v2 {
 	MTK_HDMIV2_HDCP_SEL,

-- 
2.40.0

