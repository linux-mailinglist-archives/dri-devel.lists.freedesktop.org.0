Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBD65BD30E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674510E217;
	Mon, 19 Sep 2022 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F1010E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:13 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 29so161602edv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=Kre50nfb+6BEGbTGtWkvwNMQoegOcYtOYC9/SwSm6f8=;
 b=0Th6xkomiw7RRU4eV8xKvzeVuqv9igT4YUIiF+fz9FtJl6AQJr6cUylRl97Sa49hBh
 6l17/VtOS1JfGRYEA9ktohgZP64v55BdSEHVABve9fHkykAZU7T0QxxsGnZKMhdp/+rP
 v2BIL/btnIss2j44wG1sjgY2Y969e8rwzpXg3FjadU0AS/8z1pp0AijmMhnAP2C5G2t6
 MJFHd1fTbnKVlWzfY10KM8HgfGVkki+TxxSPD1qv+sBLCJqtGEHiXOqMNJpYs47emDAN
 tKYx3XuJh1oUxEr1ULu0S+pcqTNSNu73nq54FfIv8re10yOtZGZDHaHUiGHmxSIMa9em
 DHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Kre50nfb+6BEGbTGtWkvwNMQoegOcYtOYC9/SwSm6f8=;
 b=o5L4fRiodyXJ6kQiOu+Z67eEyr6xh6+iyBBuF6yGta8kwM4S4AIJdWMHz2wMSmrxHL
 Ppk3I9pQ2OS2FKcsXYZhyHNZvPncIJrYoj11msObFYTkp9brnIYtSE1AclOpvBbutFP5
 HqhLPj7+5zlMsiLMxVLEZKeiEeS+z6kyf9SZPvqdCmgc9Et9gpkWp9KzMJPSpwK0PyZG
 4s0ZNJBjOaO74hrLTXoJ399yQKy1rUcKhd1DXbGjpuBWS67Tl2n+mVFLs0rcECDC2pNz
 SaMHwYR/4xSiPJoClhGF/1xQuAnrq4n1yDmiTD+xUPTuJltCE4Wl0KfWNFohn5bP0PNp
 RTpQ==
X-Gm-Message-State: ACrzQf2S+NWoi6itdWxJcZ0goLtlmNdaMXpnrdurmg9mm7NwQwT5oD6K
 +7BjRU2EGA9pYVq6fT9TyCyq3A==
X-Google-Smtp-Source: AMsMyM7TDj1djPWF1WAySIx2Qr5YHYlG3ALhTric6pPD6CiuqCk+rwvCWWl/Ki8GCY4roCAi+n60uQ==
X-Received: by 2002:a05:6402:40d1:b0:44f:e974:f981 with SMTP id
 z17-20020a05640240d100b0044fe974f981mr16903554edb.222.1663606812334; 
 Mon, 19 Sep 2022 10:00:12 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:11 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:10 +0200
Subject: [PATCH v1 12/17] drm/mediatek: hdmi: mt8195: add audio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-12-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDMI audio support for mt8195

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
index 39e07a6dd490..bb7593ea4c86 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
@@ -215,6 +215,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
 }
 
+static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
+{
+	u32 val;
+
+	val = mtk_hdmi_read(hdmi, AIP_CTRL, &val);
+
+	if (val & DSD_EN)
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
+			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,
+			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
+	else
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
+			      AUD_MUTE_FIFO_EN);
+}
+
+static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_DIS, AUD_MUTE_FIFO_EN);
+}
+
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_RSTB_SHIFT,
@@ -899,6 +919,7 @@ static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)
 static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 				       struct drm_display_mode *display_mode)
 {
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_aud_enable_packet(hdmi, false);
 	mtk_hdmi_audio_reset(hdmi, true);
 	mtk_hdmi_aip_ctrl_init(hdmi);
@@ -911,6 +932,7 @@ static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 	usleep_range(25, 50);
 	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
 	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_aud_unmute(hdmi);
 }
 
 void mtk_hdmi_output_init_mt8195(struct mtk_hdmi *hdmi)
@@ -945,6 +967,28 @@ static void mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
 	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
 }
 
+static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_aud_enable_packet(hdmi, true);
+	hdmi->audio_enable = true;
+}
+
+static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_aud_enable_packet(hdmi, false);
+	hdmi->audio_enable = false;
+}
+
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
 	bool is_over_340M = false;
@@ -965,6 +1009,7 @@ static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
 
 	usleep_range(5, 10);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_hw_send_av_unmute(hdmi);
 
 	mtk_hdmi_mask(hdmi, TOP_CFG01, NULL_PKT_VSYNC_HIGH_EN,
@@ -1295,12 +1340,21 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_send_av_mute(hdmi);
 	usleep_range(50000, 50050);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_disable_hdcp_encrypt(hdmi);
 	usleep_range(50000, 50050);
 
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
@@ -1314,6 +1368,9 @@ static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
 	hdmi->powered = false;
 
 	mtk_hdmi_reset_colorspace_setting(hdmi);
+
+	/* signal the disconnect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, false);
 }
 
 static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge,
@@ -1346,6 +1403,10 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_avi_infoframe(hdmi, buffer_avi, sizeof(buffer_avi));
 
 	mtk_hdmi_hw_vid_black(hdmi, false);
+	mtk_hdmi_hw_aud_unmute(hdmi);
+
+	/* signal the connect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, true);
 
 	hdmi->enabled = true;
 }
@@ -1385,3 +1446,155 @@ const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs = {
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
+	plugged = (hdmi->hpd == HDMI_PLUG_IN_AND_SINK_POWER_ON) ? true : false;
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
+	mtk_hdmi_audio_enable(hdmi);
+
+	return 0;
+}
+
+static void mtk_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_audio_disable(hdmi);
+}
+
+static int mtk_hdmi_audio_mute(struct device *dev, void *data, bool enable,
+			       int direction)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (direction != SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
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
+		memcpy(buf, hdmi->conn.eld, min(sizeof(hdmi->conn.eld), len));
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
+void set_hdmi_codec_pdata_mt8195(struct hdmi_codec_pdata *codec_data)
+{
+	codec_data->ops = &mtk_hdmi_audio_codec_ops;
+	codec_data->max_i2s_channels = 2;
+	codec_data->i2s = 1;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
index f59aea51dc74..22af64916219 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
@@ -9,6 +9,7 @@
 
 #include <linux/hdmi.h>
 #include <drm/drm_bridge.h>
+#include <sound/hdmi-codec.h>
 
 struct mtk_hdmi;
 
@@ -17,6 +18,7 @@ extern const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs;
 void mtk_hdmi_output_init_mt8195(struct mtk_hdmi *hdmi);
 int mtk_hdmi_clk_enable_mt8195(struct mtk_hdmi *hdmi);
 void mtk_hdmi_clk_disable_mt8195(struct mtk_hdmi *hdmi);
+void set_hdmi_codec_pdata_mt8195(struct hdmi_codec_pdata *codec_data);
 
 enum mtk_hdmi_clk_id_mt8195 {
 	MTK_MT8195_HDIM_HDCP_SEL,

-- 
b4 0.10.0-dev
