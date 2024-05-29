Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B18D41C4
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92CB11A96B;
	Wed, 29 May 2024 23:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="im72q+yv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F284311A96C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:12:33 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so288722e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717024352; x=1717629152; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CwIIiRP34uv5IfVcvNl6bx82qs5CNtf+aHIfcxszzGU=;
 b=im72q+yv3/sVNVoT3vyXNTOO3UD9eH2VDKDlkmj9YlaBqW18/9TyaRGGzLKTVk/mlA
 Y8Dm+ln4vC3A250OCJIO1iwWDm2wefbrmUtMHWNa5wtsLpaMcRhh9qJcwmj/pU1jo1PT
 1u69wjl28PM5C1AcXKTYEczJVHPbk4XLX+MWlH2LpN4EBqtY5BSHSmqqzTsrAcCKji7V
 zfjBoWdr+9NfMPpObXbv0zU2Ou7fpQ5mNa7Br77NRIxaLpglF4pp8zoso9XesRpkr5o4
 mkln8TxpVOeLTdxWmzKUrj+eU2lW48bQ2BBHOUltoq9fG2rNg4UzGEDCPdc1gWu/tCDL
 rf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717024352; x=1717629152;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwIIiRP34uv5IfVcvNl6bx82qs5CNtf+aHIfcxszzGU=;
 b=W3/lSQ9mCx3yr3/bUJg5+xbfrJph64aL/Ab4TGdKhcYqSf1Y1acj4g5Wqn1J5VQCPj
 o7qhtA49i1VsIioxta6jpdb4yLULuNANQK7ECk80GDPH4bVbPV2NYvr32HB69n60JcW5
 Q6aVT0DAKRHvgk2r1QrRAPDLXmnKK3mf6AiuaLjTsPafWzvVGFVUjezpIurkziTMUYtv
 wUhOZet/DFtBTucel1XbHTdLvQU/xizMJCTilf7yfk7n2Z+HeDTMwuZU/WXM0w+1H7Uw
 iLZcp7m2kXqezRIOQvR328C2y1yIoBMEi/JCZvRrIcdv8o8ucy9l6rwAXwNIGINg1xWk
 c0AQ==
X-Gm-Message-State: AOJu0YzlzO3JgdbSLk1WRJAX75aJBdRLc1CY5tQo+7llj2HG7Uoq7Tr7
 Ei7AQOXQ/fS455bgftemAAE1XL4YDc4aQwIxVO5Td+OXNEQMwozaGb/So70MxYs=
X-Google-Smtp-Source: AGHT+IGkrWAOyr6Nj34noOCqxyGz5K3UWL/5cwT8jnB89IC2QsVad5GdTdVqFBERxhYST6c1VFIiQg==
X-Received: by 2002:a05:6512:3b6:b0:51d:3b87:70a4 with SMTP id
 2adb3069b0e04-52b7d43a877mr282771e87.36.1717024352007; 
 Wed, 29 May 2024 16:12:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:12:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:28 +0300
Subject: [PATCH v3 5/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-5-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19838;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5Yg0YSDKjqAR7arMVGSXgdv/Zx/VQXuYD6Q+vFXyJaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZbnNIgMdlLmSooj6PB7hZ+WDKiWLxAFtu1P
 OuKJQGBZ52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WwAKCRCLPIo+Aiko
 1UBaCACGB0Z8ZlrpPGG/cx6PFNpQ/5nWt02ee0HAeM4KhWSSiJg6t1s4sywnRhmix+bAF/O2LO9
 X3flzO257gfxt6RbIfXZbTO7JLMqUJT86+upEMpXixJNf6owRalltWs7R0T/roGH+StwPqmS4CB
 k+bGJGn56ePqwCV2/qH54NSn3c+UU/cZH14yWzbIVUqjUUQctzQ/4B5U3Mjac9aLtyckM363uOg
 d13mx1K9VnygMYUkZLOL1rIiiVgWRxB1n87qRohUmGRwvAvDU/XWcseptHF3LHUuCqNDGyWpxCE
 76LCFRbIm9M90rmgZKCi36bx7ZtS5VY/udKVDUWZONGgYWsU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Setup the HDMI connector on the MSM HDMI outputs. Make use of
atomic_check hook and of the provided Infoframe infrastructure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig            |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  44 ++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  16 +---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  74 ++++-----------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 165 +++++++++++++++++++++++++--------
 5 files changed, 160 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1931ecf73e32..b5c78c1dd744 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -164,6 +164,8 @@ config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
 	default y
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 24abcb7254cc..179da72f8f70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include <sound/hdmi-codec.h>
 #include "hdmi.h"
@@ -165,8 +166,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
-	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
-
 	ret = msm_hdmi_bridge_init(hdmi);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
@@ -254,40 +253,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
 				    struct hdmi_codec_params *params)
 {
 	struct hdmi *hdmi = dev_get_drvdata(dev);
-	unsigned int chan;
-	unsigned int channel_allocation = 0;
 	unsigned int rate;
-	unsigned int level_shift  = 0; /* 0dB */
-	bool down_mix = false;
+	int ret;
 
 	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
 		 params->sample_width, params->cea.channels);
 
-	switch (params->cea.channels) {
-	case 2:
-		/* FR and FL speakers */
-		channel_allocation  = 0;
-		chan = MSM_HDMI_AUDIO_CHANNEL_2;
-		break;
-	case 4:
-		/* FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x3;
-		chan = MSM_HDMI_AUDIO_CHANNEL_4;
-		break;
-	case 6:
-		/* RR, RL, FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x0B;
-		chan = MSM_HDMI_AUDIO_CHANNEL_6;
-		break;
-	case 8:
-		/* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
-		channel_allocation  = 0x1F;
-		chan = MSM_HDMI_AUDIO_CHANNEL_8;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	switch (params->sample_rate) {
 	case 32000:
 		rate = HDMI_SAMPLE_RATE_32KHZ;
@@ -316,9 +287,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
-	msm_hdmi_audio_set_sample_rate(hdmi, rate);
-	msm_hdmi_audio_info_setup(hdmi, 1, chan, channel_allocation,
-			      level_shift, down_mix);
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
+								      &params->cea);
+	if (ret)
+		return ret;
+
+	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
 
 	return 0;
 }
@@ -327,7 +301,7 @@ static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 
-	msm_hdmi_audio_info_setup(hdmi, 0, 0, 0, 0, 0);
+	msm_hdmi_audio_disable(hdmi);
 }
 
 static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 4586baf36415..0ac034eaaf0f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -24,8 +24,8 @@ struct hdmi_platform_config;
 
 struct hdmi_audio {
 	bool enabled;
-	struct hdmi_audio_infoframe infoframe;
 	int rate;
+	int channels;
 };
 
 struct hdmi_hdcp_ctrl;
@@ -199,12 +199,6 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 /*
  * audio:
  */
-/* Supported HDMI Audio channels and rates */
-#define	MSM_HDMI_AUDIO_CHANNEL_2	0
-#define	MSM_HDMI_AUDIO_CHANNEL_4	1
-#define	MSM_HDMI_AUDIO_CHANNEL_6	2
-#define	MSM_HDMI_AUDIO_CHANNEL_8	3
-
 #define	HDMI_SAMPLE_RATE_32KHZ		0
 #define	HDMI_SAMPLE_RATE_44_1KHZ	1
 #define	HDMI_SAMPLE_RATE_48KHZ		2
@@ -213,12 +207,8 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 #define	HDMI_SAMPLE_RATE_176_4KHZ	5
 #define	HDMI_SAMPLE_RATE_192KHZ		6
 
-int msm_hdmi_audio_update(struct hdmi *hdmi);
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
-	uint32_t num_of_channels, uint32_t channel_allocation,
-	uint32_t level_shift, bool down_mix);
-void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
-
+int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
+int msm_hdmi_audio_disable(struct hdmi *hdmi);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 4c2058c4adc1..b10d43f8c621 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -7,9 +7,6 @@
 #include <linux/hdmi.h>
 #include "hdmi.h"
 
-/* maps MSM_HDMI_AUDIO_CHANNEL_n consts used by audio driver to # of channels: */
-static int nchannels[] = { 2, 4, 6, 8 };
-
 /* Supported HDMI Audio sample rates */
 #define MSM_HDMI_SAMPLE_RATE_32KHZ		0
 #define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
@@ -71,19 +68,20 @@ static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
 	return NULL;
 }
 
-int msm_hdmi_audio_update(struct hdmi *hdmi)
+static int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	struct hdmi_audio_infoframe *info = &audio->infoframe;
 	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
-	uint32_t infofrm_ctrl, audio_config;
+	uint32_t audio_config;
+
+	if (!hdmi->hdmi_mode)
+		return -EINVAL;
+
+	DBG("audio: enabled=%d, channels=%d, rate=%d",
+	    audio->enabled, audio->channels, audio->rate);
 
-	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
-		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
-		audio->enabled, info->channels,  info->channel_allocation,
-		info->level_shift_value, info->downmix_inhibit, audio->rate);
 	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
 
 	if (enabled && !(hdmi->power_on && hdmi->pixclock)) {
@@ -104,7 +102,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
 	aud_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_AUDIO_PKT_CTRL1);
-	infofrm_ctrl = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
 	audio_config = hdmi_read(hdmi, REG_HDMI_AUDIO_CFG);
 
 	/* Clear N/CTS selection bits */
@@ -113,7 +110,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	if (enabled) {
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
-		uint8_t buf[14];
 
 		n   = arcs->lut[audio->rate].n;
 		cts = arcs->lut[audio->rate].cts;
@@ -155,20 +151,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 				HDMI_ACR_1_N(n));
 
 		hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL2,
-				COND(info->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
+				COND(audio->channels != 2, HDMI_AUDIO_PKT_CTRL2_LAYOUT) |
 				HDMI_AUDIO_PKT_CTRL2_OVERRIDE);
 
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_CONT;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_SEND;
 
-		/* configure infoframe: */
-		hdmi_audio_infoframe_pack(info, buf, sizeof(buf));
-		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
-				(buf[3] <<  0) | (buf[4] <<  8) |
-				(buf[5] << 16) | (buf[6] << 24));
-		hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
-				(buf[7] <<  0) | (buf[8] << 8));
-
 		hdmi_write(hdmi, REG_HDMI_GC, 0);
 
 		vbi_pkt_ctrl |= HDMI_VBI_PKT_CTRL_GC_ENABLE;
@@ -176,11 +164,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 
 		aud_pkt_ctrl |= HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
 
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
-		infofrm_ctrl |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
-
 		audio_config &= ~HDMI_AUDIO_CFG_FIFO_WATERMARK__MASK;
 		audio_config |= HDMI_AUDIO_CFG_FIFO_WATERMARK(4);
 		audio_config |= HDMI_AUDIO_CFG_ENGINE_ENABLE;
@@ -190,17 +173,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_ENABLE;
 		vbi_pkt_ctrl &= ~HDMI_VBI_PKT_CTRL_GC_EVERY_FRAME;
 		aud_pkt_ctrl &= ~HDMI_AUDIO_PKT_CTRL1_AUDIO_SAMPLE_SEND;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE;
-		infofrm_ctrl &= ~HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
 		audio_config &= ~HDMI_AUDIO_CFG_ENGINE_ENABLE;
 	}
 
 	hdmi_write(hdmi, REG_HDMI_ACR_PKT_CTRL, acr_pkt_ctrl);
 	hdmi_write(hdmi, REG_HDMI_VBI_PKT_CTRL, vbi_pkt_ctrl);
 	hdmi_write(hdmi, REG_HDMI_AUDIO_PKT_CTRL1, aud_pkt_ctrl);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, infofrm_ctrl);
 
 	hdmi_write(hdmi, REG_HDMI_AUD_INT,
 			COND(enabled, HDMI_AUD_INT_AUD_FIFO_URUN_INT) |
@@ -214,41 +192,29 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, bool enabled,
-	uint32_t num_of_channels, uint32_t channel_allocation,
-	uint32_t level_shift, bool down_mix)
+int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
 {
-	struct hdmi_audio *audio;
-
 	if (!hdmi)
 		return -ENXIO;
 
-	audio = &hdmi->audio;
-
-	if (num_of_channels >= ARRAY_SIZE(nchannels))
+	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
 		return -EINVAL;
 
-	audio->enabled = enabled;
-	audio->infoframe.channels = nchannels[num_of_channels];
-	audio->infoframe.channel_allocation = channel_allocation;
-	audio->infoframe.level_shift_value = level_shift;
-	audio->infoframe.downmix_inhibit = down_mix;
+	hdmi->audio.rate = rate;
+	hdmi->audio.channels = channels;
+	hdmi->audio.enabled = true;
 
 	return msm_hdmi_audio_update(hdmi);
 }
 
-void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate)
+int msm_hdmi_audio_disable(struct hdmi *hdmi)
 {
-	struct hdmi_audio *audio;
-
 	if (!hdmi)
-		return;
-
-	audio = &hdmi->audio;
+		return -ENXIO;
 
-	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
-		return;
+	hdmi->audio.rate = 0;
+	hdmi->audio.channels = 2;
+	hdmi->audio.enabled = false;
 
-	audio->rate = rate;
-	msm_hdmi_audio_update(hdmi);
+	return msm_hdmi_audio_update(hdmi);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..3ac63edbf5bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include "msm_kms.h"
 #include "hdmi.h"
@@ -68,23 +69,17 @@ static void power_off(struct drm_bridge *bridge)
 
 #define AVI_IFRAME_LINE_NUMBER 1
 
-static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
+static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
 {
-	struct drm_crtc *crtc = hdmi->encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	u32 buf[4] = {};
 	u32 val;
-	int len;
+	int i;
 
-	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						 hdmi->connector, mode);
-
-	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (len < 0) {
+	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev,
 			"failed to configure avi infoframe\n");
-		return;
+		return -EINVAL;
 	}
 
 	/*
@@ -93,37 +88,126 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	 * written to the LSB byte of AVI_INFO0 and the version is written to
 	 * the third byte from the LSB of AVI_INFO3
 	 */
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(0),
+	memcpy(buf, &buffer[3], len - 3);
+
+	buf[3] |= buffer[1] << 24;
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
+		HDMI_INFOFRAME_CTRL0_AVI_CONT;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
+					   const u8 *buffer, size_t len)
+{
+	u32 val;
+
+	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure audio infoframe\n");
+		return -EINVAL;
+	}
+
+	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
 		   buffer[3] |
 		   buffer[4] << 8 |
 		   buffer[5] << 16 |
 		   buffer[6] << 24);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(1),
+	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO1,
 		   buffer[7] |
 		   buffer[8] << 8 |
 		   buffer[9] << 16 |
 		   buffer[10] << 24);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(2),
-		   buffer[11] |
-		   buffer[12] << 8 |
-		   buffer[13] << 16 |
-		   buffer[14] << 24);
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
 
-	hdmi_write(hdmi, REG_HDMI_AVI_INFO(3),
-		   buffer[15] |
-		   buffer[16] << 8 |
-		   buffer[1] << 24);
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0,
-		   HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		   HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		break;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
+		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+		break;
+
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+	}
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type,
+					   const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	msm_hdmi_bridge_clear_infoframe(bridge, type);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return 0;
+	}
+}
+
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+			    struct drm_bridge_state *bridge_state,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_connector_state *conn_state)
+{
+	return drm_atomic_helper_connector_hdmi_check(conn_state->connector, conn_state->state);
 }
 
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -132,6 +216,10 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, encoder);
 
 	DBG("power up");
 
@@ -139,12 +227,10 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
 	}
 
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
 
 	msm_hdmi_set_mode(hdmi, true);
@@ -171,8 +257,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
-			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
 }
@@ -233,9 +317,6 @@ static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
-
-	if (hdmi->hdmi_mode)
-		msm_hdmi_audio_update(hdmi);
 }
 
 static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,
@@ -304,12 +385,15 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.clear_infoframe = msm_hdmi_bridge_clear_infoframe,
+	.write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
 
 static void
@@ -341,8 +425,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 	bridge->ddc = hdmi->i2c;
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->vendor = "Qualcomm";
+	bridge->product = "Snapdragon";
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);

-- 
2.39.2

