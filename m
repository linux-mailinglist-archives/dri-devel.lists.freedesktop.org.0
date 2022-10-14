Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8165FF11C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9AE10EB14;
	Fri, 14 Oct 2022 15:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F3910EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:20:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j7so8094942wrr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7j8J0GyRQ+3FBMQUBdmjs2oV8Oh7JyCUOZ1fdQPOAqU=;
 b=QJl0NCmUOhQL/tv/apBiUzaxf0vSXhjrpKm9bcMvxXYCEQ4fVw6C/iuH6SsUVUhwaQ
 FFq1wxgZGiTGMDGWaWlCxR1+2uTjunZeCfjDKKDBI2Sb9B8rGtV1PldskyTHdCagidm/
 k9lk1ApqcHtpCdZjPvsDi6n+ejQbLawm2HSI1eu6lZVfyUt5a32nlIJ69nQUWgaSL11l
 XAAaP+icCf60LIW+sWfzGCSumGsQy9OUSUbfZ42hIjTWxGbXtpQ06Uepp6F4/yylNLga
 DwwshMU7MYQO+EmcVPrG3X5VGGU0REvTKkk12fxSB5oVmfY4JmA7Of/jx9AkgDRgPimK
 31+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7j8J0GyRQ+3FBMQUBdmjs2oV8Oh7JyCUOZ1fdQPOAqU=;
 b=Sz3JuTx1YYpQJev7zSwLeoXKYXSuSJJc8wElhszF+xBQTst+qKHu6mqFMpWWAmL6i6
 c9DKY8f8CXc7B5sLN/QzbZI9zuDnztx2NbNSvFDv1lSEL38cWBC8a9s5hJuvbjNODY0k
 kxyGd/+PVWX07SfBHYHzKSuGihxQATs9mMo9KsvhwRG5xrGMtae3R5pHswQakCinaxUj
 qKjEjzzuFwxzAz7wv2Iy1HzOmn1qv4cApvrwvNhsjCEtSLOoiPDuOmgjI4x9TlMFKTR/
 UHBCW63KBbDjINAgZiZ7UUkEPplr+t2PRVBJmpcxmVr4f9XR+3kdln1NcvnlzRKPHPmh
 hd7w==
X-Gm-Message-State: ACrzQf0sdmyef/jRRvAyZtt4iobcitxsHsF7LpG3zRlw82+DE+jhflLK
 vxhMKMe4OWIn5UVODldO6YdYTA==
X-Google-Smtp-Source: AMsMyM4khxj2OKKXdMPzstRYAGtumpaGD7K+du/o8cPB04nD9YnulaXKypRqyemEAR4QZPPyNuAhSA==
X-Received: by 2002:adf:ed41:0:b0:225:3fde:46ea with SMTP id
 u1-20020adfed41000000b002253fde46eamr3719254wro.345.1665760816698; 
 Fri, 14 Oct 2022 08:20:16 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net.
 [2a02:8440:6241:7429:3074:96af:9642:4])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:20:16 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:01 +0200
Subject: [PATCH v2 08/12] drm/mediatek: hdmi: v2: add audio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-8-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailer: b4 0.11.0-dev
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
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDMI audio support for v2

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c |   1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 213 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.h     |   2 +
 4 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e43c938a9aa5..1ea91f8bb6c7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -386,6 +386,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_v2 = {
 	.mtk_hdmi_output_init = mtk_hdmi_output_init_v2,
 	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_v2,
 	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_v2,
+	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_v2,
 	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_v2,
 	.num_clocks = MTK_HDMIV2_CLK_COUNT,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index 61696d255e51..26456802a5c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -309,7 +309,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 	ddc->regs = device_node_to_regmap(hdmi);
 	of_node_put(hdmi);
 	if (IS_ERR(ddc->regs))
-		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get mt8195-hdmi syscon");
+		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get hdmi syscon");
 
 	ddc->clk = devm_clk_get_enabled(dev, "ddc");
 	if (IS_ERR(ddc->clk))
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index e8457429964d..b391b22fa9f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -211,6 +211,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
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
 	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0, HDMITX_SW_RSTB);
@@ -889,6 +909,7 @@ static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)
 static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 				       struct drm_display_mode *display_mode)
 {
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_aud_enable_packet(hdmi, false);
 	mtk_hdmi_audio_reset(hdmi, true);
 	mtk_hdmi_aip_ctrl_init(hdmi);
@@ -901,6 +922,7 @@ static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 	usleep_range(25, 50);
 	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
 	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_aud_unmute(hdmi);
 }
 
 void mtk_hdmi_output_init_v2(struct mtk_hdmi *hdmi)
@@ -935,6 +957,28 @@ static void mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
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
@@ -955,6 +999,7 @@ static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
 
 	usleep_range(5, 10);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_hw_send_av_unmute(hdmi);
 
 	mtk_hdmi_mask(hdmi, TOP_CFG01, NULL_PKT_VSYNC_HIGH_EN,
@@ -1285,6 +1330,7 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_send_av_mute(hdmi);
 	usleep_range(50000, 50050);
 	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
 	mtk_hdmi_disable_hdcp_encrypt(hdmi);
 	usleep_range(50000, 50050);
 
@@ -1293,6 +1339,14 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
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
@@ -1306,6 +1360,9 @@ static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
 	hdmi->powered = false;
 
 	mtk_hdmi_reset_colorspace_setting(hdmi);
+
+	/* signal the disconnect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, false);
 }
 
 static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge,
@@ -1338,6 +1395,10 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge,
 	mtk_hdmi_hw_avi_infoframe(hdmi, buffer_avi, sizeof(buffer_avi));
 
 	mtk_hdmi_hw_vid_black(hdmi, false);
+	mtk_hdmi_hw_aud_unmute(hdmi);
+
+	/* signal the connect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, true);
 
 	hdmi->enabled = true;
 }
@@ -1377,3 +1438,155 @@ const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
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
+void set_hdmi_codec_pdata_v2(struct hdmi_codec_pdata *codec_data)
+{
+	codec_data->ops = &mtk_hdmi_audio_codec_ops;
+	codec_data->max_i2s_channels = 2;
+	codec_data->i2s = 1;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
index 53cb62e4389d..8a397f2ad2c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.h
@@ -9,6 +9,7 @@
 
 #include <linux/hdmi.h>
 #include <drm/drm_bridge.h>
+#include <sound/hdmi-codec.h>
 
 struct mtk_hdmi;
 
@@ -17,6 +18,7 @@ extern const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs;
 void mtk_hdmi_output_init_v2(struct mtk_hdmi *hdmi);
 int mtk_hdmi_clk_enable_v2(struct mtk_hdmi *hdmi);
 void mtk_hdmi_clk_disable_v2(struct mtk_hdmi *hdmi);
+void set_hdmi_codec_pdata_v2(struct hdmi_codec_pdata *codec_data);
 
 enum mtk_hdmi_clk_id_v2 {
 	MTK_HDMIV2_HDCP_SEL,

-- 
b4 0.11.0-dev
