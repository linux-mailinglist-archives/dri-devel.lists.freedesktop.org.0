Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D52B8D73
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144916E58E;
	Thu, 19 Nov 2020 08:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFD26E425
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:36 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id k27so2847765ejs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jDdCyYk85e4nFDoG9hYrnYaCi7h3imfc8c1jrmLH+Nc=;
 b=m/vaoytihvHVS8vFjbR0E2TbxDwUbH6HRcZ0zBg1HRteK41ZTGmEcrejCk8/4AF216
 ziDz5nCdT9Lo8Pe7hNVGi/uRRyKc87J3xh6fRwajpruA4eEaYwu7jvSrmXhygchGrKoo
 8468qu0yUFr1sqYGOOTYe7IDxH9XTlfrhni4LjshndI7svUrY76QWBjlkaeOXC9H/9DO
 +nGj2su4wo+XLiBUm8F0TEu1gX6QUFlToCWty0SRaKi4aa7SaghWrW4HXVf7t2PxOeyt
 oeBuVKsioaqkviVDfV8HSpqMZbM2j+2epCwllDoR3uKyZ2+cxtW3/F6OibQqLJmst4fj
 L7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jDdCyYk85e4nFDoG9hYrnYaCi7h3imfc8c1jrmLH+Nc=;
 b=ZuVjBdj1E43LXa7Cofox5Dhs8o1B+PJxQ9QekE9eltMmcErM+wjP3btk/LTUH9UGNz
 9bmafE4nEiD9trd9rUNyaYBfROTmf5EHMlbtu4FMeOR9PZPDh4DoJP9ijy23NucwAS+w
 2AmQVMWeXb7Ng9OFdeJODM6BbyC+ZhiD2t6BZiI18GTOrYSg++o6hMTTlPrOp+9SNvUb
 f/jNS+Q1Yu6+ji5zB6KAMY/HhP0J55XD6hmDiFC+gyvBD0og0ZZ7mWi8OnJT5l6dWPxC
 oZFhuXSIn74vA9EX2Ai5Jfy41Vnz/saGmi9vBMqRPYsqQ0oY3Bib60gHUORC7w9c0Sd5
 NR8g==
X-Gm-Message-State: AOAM533nnyAzYx2kIKyCnIJCtS0Lq2Fc7r1tPHLOMdSqLVsrJn3lZws1
 BTp+/8HyEyPvuq5bK1CcZ84=
X-Google-Smtp-Source: ABdhPJzW1wcDeohwLqpoOxIVKWWca8Kvw+/7sqrMOIVuJ0+R+bKOfR44aYcdEqkzL/vaLeJJP1KRkQ==
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr23712089ejc.526.1605707914895; 
 Wed, 18 Nov 2020 05:58:34 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:34 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 4/7] drm: rockchip: add sound support to rk3066 hdmi driver
Date: Wed, 18 Nov 2020 14:58:19 +0100
Message-Id: <20201118135822.9582-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zheng Yang <zhengyang@rock-chips.com>

Add sound support to the rk3066 HDMI driver.

The I2S input of the HDMI TX allows transmission of
DVD-Audio and decoded Dolby Digital
to A/V Receivers and high-end displays.
The interface supports 2 to 8 channels audio up to 192 kHz.
The HDMI TX supports variable word length of
16bits to 32bits for I2S audio inputs.(This driver 24bit max)
There are three I2S input modes supported.(This driver HDMI_I2S only)
On RK3066/PX2 the HDMI TX audio source is connected to I2S_8CH.

Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/Kconfig       |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 275 ++++++++++++++++++++++++++++++++-
 2 files changed, 276 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 310aa1546..4c20445dc 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -11,6 +11,8 @@ config DRM_ROCKCHIP
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
 	select DRM_RGB if ROCKCHIP_RGB
 	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
+	select SND_SOC_HDMI_CODEC if ROCKCHIP_RK3066_HDMI && SND_SOC
+	select SND_SOC_ROCKCHIP_I2S if ROCKCHIP_RK3066_HDMI && SND_SOC
 	help
 	  Choose this option if you have a Rockchip soc chipset.
 	  This driver provides kernel mode setting and buffer
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1c546c3a8..243e4077f 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -13,6 +13,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <sound/hdmi-codec.h>
+
 #include "rk3066_hdmi.h"
 
 #include "rockchip_drm_drv.h"
@@ -20,9 +22,16 @@
 
 #define DEFAULT_PLLA_RATE 30000000
 
+struct audio_info {
+	int sample_rate;
+	int channels;
+	int sample_width;
+};
+
 struct hdmi_data_info {
 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
 	bool sink_is_hdmi;
+	bool sink_has_audio;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
 };
@@ -54,12 +63,19 @@ struct rk3066_hdmi {
 
 	unsigned int tmdsclk;
 
+	struct platform_device *audio_pdev;
+	bool audio_enable;
+
 	struct hdmi_data_info hdmi_data;
+	struct audio_info audio;
 	struct drm_display_mode previous_mode;
 };
 
 #define to_rk3066_hdmi(x) container_of(x, struct rk3066_hdmi, x)
 
+static int
+rk3066_hdmi_config_audio(struct rk3066_hdmi *hdmi, struct audio_info *audio);
+
 static inline u8 hdmi_readb(struct rk3066_hdmi *hdmi, u16 offset)
 {
 	return readl_relaxed(hdmi->regs + offset);
@@ -205,6 +221,23 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
 					HDMI_INFOFRAME_AVI, 0, 0, 0);
 }
 
+static int rk3066_hdmi_config_aai(struct rk3066_hdmi *hdmi,
+				  struct audio_info *audio)
+{
+	union hdmi_infoframe frame;
+	int rc;
+
+	rc = hdmi_audio_infoframe_init(&frame.audio);
+
+	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	frame.audio.channels = hdmi->audio.channels;
+
+	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
+					HDMI_INFOFRAME_AAI, 0, 0, 0);
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -353,6 +386,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
 		rk3066_hdmi_config_avi(hdmi, mode);
+		rk3066_hdmi_config_audio(hdmi, &hdmi->audio);
 	} else {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK, 0);
 	}
@@ -369,9 +403,20 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	 */
 	rk3066_hdmi_i2c_init(hdmi);
 
-	/* Unmute video output. */
+	/* Unmute video and audio output. */
 	hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
 		  HDMI_VIDEO_AUDIO_DISABLE_MASK, HDMI_AUDIO_DISABLE);
+	if (hdmi->audio_enable) {
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
+		/* Reset audio capture logic. */
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
+			  HDMI_AUDIO_CP_LOGIC_RESET);
+		usleep_range(900, 1000);
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
+	}
+
 	return 0;
 }
 
@@ -473,9 +518,13 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
 		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
+		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
+	} else {
+		hdmi->hdmi_data.sink_is_hdmi = true;
+		hdmi->hdmi_data.sink_has_audio = true;
 	}
 
 	return ret;
@@ -536,6 +585,228 @@ struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
 };
 
 static int
+rk3066_hdmi_config_audio(struct rk3066_hdmi *hdmi, struct audio_info *audio)
+{
+	u32 rate, channel, word_length, N, CTS;
+	u64 tmp;
+
+	if (audio->channels < 3)
+		channel = HDMI_AUDIO_I2S_CHANNEL_1_2;
+	else if (audio->channels < 5)
+		channel = HDMI_AUDIO_I2S_CHANNEL_3_4;
+	else if (audio->channels < 7)
+		channel = HDMI_AUDIO_I2S_CHANNEL_5_6;
+	else
+		channel = HDMI_AUDIO_I2S_CHANNEL_7_8;
+
+	switch (audio->sample_rate) {
+	case 32000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_32000;
+		N = N_32K;
+		break;
+	case 44100:
+		rate = HDMI_AUDIO_SAMPLE_FRE_44100;
+		N = N_441K;
+		break;
+	case 48000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_48000;
+		N = N_48K;
+		break;
+	case 88200:
+		rate = HDMI_AUDIO_SAMPLE_FRE_88200;
+		N = N_882K;
+		break;
+	case 96000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_96000;
+		N = N_96K;
+		break;
+	case 176400:
+		rate = HDMI_AUDIO_SAMPLE_FRE_176400;
+		N = N_1764K;
+		break;
+	case 192000:
+		rate = HDMI_AUDIO_SAMPLE_FRE_192000;
+		N = N_192K;
+		break;
+	default:
+		DRM_DEV_ERROR(hdmi->dev, "no support for sample rate %d\n",
+			      audio->sample_rate);
+		return -ENOENT;
+	}
+
+	switch (audio->sample_width) {
+	case 16:
+		word_length = 0x02;
+		break;
+	case 20:
+		word_length = 0x0a;
+		break;
+	case 24:
+		word_length = 0x0b;
+		break;
+	default:
+		DRM_DEV_ERROR(hdmi->dev, "no support for word length %d\n",
+			      audio->sample_width);
+		return -ENOENT;
+	}
+
+	tmp = (u64)hdmi->tmdsclk * N;
+	do_div(tmp, 128 * audio->sample_rate);
+	CTS = tmp;
+
+	/* Set_audio source I2S. */
+	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL1, 0x00);
+	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL2, 0x40);
+	hdmi_writeb(hdmi, HDMI_I2S_AUDIO_CTRL,
+		    HDMI_AUDIO_I2S_FORMAT_STANDARD | channel);
+	hdmi_writeb(hdmi, HDMI_I2S_SWAP, 0x00);
+	hdmi_modb(hdmi, HDMI_AV_CTRL1, HDMI_AUDIO_SAMPLE_FRE_MASK, rate);
+	hdmi_writeb(hdmi, HDMI_AUDIO_SRC_NUM_AND_LENGTH, word_length);
+
+	/* Set N value. */
+	hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
+		  HDMI_AUDIO_N_19_16_MASK, (N >> 16) & 0x0F);
+	hdmi_writeb(hdmi, HDMI_N2, (N >> 8) & 0xFF);
+	hdmi_writeb(hdmi, HDMI_N1, N & 0xFF);
+
+	/* Set CTS value. */
+	hdmi_writeb(hdmi, HDMI_CTS_EXT1, CTS & 0xff);
+	hdmi_writeb(hdmi, HDMI_CTS_EXT2, (CTS >> 8) & 0xff);
+	hdmi_writeb(hdmi, HDMI_CTS_EXT3, (CTS >> 16) & 0xff);
+
+	if (audio->channels > 2)
+		hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
+			  HDMI_AUDIO_LR_SWAP_MASK,
+			  HDMI_AUDIO_LR_SWAP_SUBPACKET1);
+	rate = (~(rate >> 4)) & 0x0f;
+	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL1, rate);
+	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL2, 0);
+
+	return rk3066_hdmi_config_aai(hdmi, audio);
+}
+
+static int rk3066_hdmi_audio_hw_params(struct device *dev, void *d,
+				       struct hdmi_codec_daifmt *daifmt,
+				       struct hdmi_codec_params *params)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (!hdmi->hdmi_data.sink_has_audio) {
+		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
+		return -ENODEV;
+	}
+
+	if (!hdmi->encoder.crtc)
+		return -ENODEV;
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		break;
+	default:
+		DRM_DEV_ERROR(dev, "invalid format %d\n", daifmt->fmt);
+		return -EINVAL;
+	}
+
+	hdmi->audio.sample_width = params->sample_width;
+	hdmi->audio.sample_rate = params->sample_rate;
+	hdmi->audio.channels = params->channels;
+
+	return rk3066_hdmi_config_audio(hdmi, &hdmi->audio);
+}
+
+static void rk3066_hdmi_audio_shutdown(struct device *dev, void *d)
+{
+	/* do nothing */
+}
+
+static int
+rk3066_hdmi_audio_mute_stream(struct device *dev, void *d,
+			      bool mute, int direction)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (!hdmi->hdmi_data.sink_has_audio) {
+		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
+		return -ENODEV;
+	}
+
+	hdmi->audio_enable = !mute;
+
+	if (mute)
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_DISABLE, HDMI_AUDIO_DISABLE);
+	else
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
+
+	/*
+	 * Under power mode E we need to reset the audio capture logic to
+	 * make the audio setting update.
+	 */
+	if (rk3066_hdmi_get_power_mode(hdmi) == HDMI_SYS_POWER_MODE_E) {
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
+			  HDMI_AUDIO_CP_LOGIC_RESET);
+		usleep_range(900, 1000);
+		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
+			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
+	}
+
+	return 0;
+}
+
+static int rk3066_hdmi_audio_get_eld(struct device *dev, void *d,
+				     u8 *buf, size_t len)
+{
+	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
+	struct drm_mode_config *config = &hdmi->encoder.dev->mode_config;
+	struct drm_connector *connector;
+	int ret = -ENODEV;
+
+	mutex_lock(&config->mutex);
+	list_for_each_entry(connector, &config->connector_list, head) {
+		if (&hdmi->encoder == connector->encoder) {
+			memcpy(buf, connector->eld,
+			       min(sizeof(connector->eld), len));
+			ret = 0;
+		}
+	}
+	mutex_unlock(&config->mutex);
+
+	return ret;
+}
+
+static const struct hdmi_codec_ops audio_codec_ops = {
+	.hw_params = rk3066_hdmi_audio_hw_params,
+	.audio_shutdown = rk3066_hdmi_audio_shutdown,
+	.mute_stream = rk3066_hdmi_audio_mute_stream,
+	.get_eld = rk3066_hdmi_audio_get_eld,
+	.no_capture_mute = 1,
+};
+
+static int rk3066_hdmi_audio_codec_init(struct rk3066_hdmi *hdmi,
+					struct device *dev)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.i2s = 1,
+		.ops = &audio_codec_ops,
+		.max_i2s_channels = 8,
+	};
+
+	hdmi->audio.channels = 2;
+	hdmi->audio.sample_rate = 48000;
+	hdmi->audio.sample_width = 16;
+	hdmi->audio_enable = false;
+	hdmi->audio_pdev =
+		platform_device_register_data(dev,
+					      HDMI_CODEC_DRV_NAME,
+					      PLATFORM_DEVID_NONE,
+					      &codec_data,
+					      sizeof(codec_data));
+
+	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
+}
+
+static int
 rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 {
 	struct drm_encoder *encoder = &hdmi->encoder;
@@ -567,6 +838,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 
 	drm_connector_attach_encoder(&hdmi->connector, encoder);
 
+	rk3066_hdmi_audio_codec_init(hdmi, dev);
+
 	return 0;
 }
 
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
