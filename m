Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DF81CDDD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FAD10E86D;
	Fri, 22 Dec 2023 17:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A85E10E82B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33697caf9a6so423048f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266958; x=1703871758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuPa/UCZ+S+tpMXY2+ZSGIMlsWF9xT2DWjDbU4B7UZI=;
 b=aN81pmmZrz/j1maAzK9szMY60/KQy+ac69voXEqTAiElB/0WKPEon9qhLmBQAuQXOe
 YEgqaLzon4KFksrn9d9aECuZlmx2G6mtgTYezgXKY/aXHVKA+0OOdieeoCABj+SBjPwH
 bcunubaE3FGPCQe8UdperBJV4D6frsXhJAIa8ZjATZkYxYE41UbXfDKn60foOMcJB4+A
 WSnPqXh4BtCP1xlf+j/kEVvDqnfoZtrU5CeRt3Yo6hwquKZvtT7Xx2fAfq876H0tQQsL
 TJMmqhkUxTxLRNkzZo4M1B24O26I32uwpyUUXrzwLYYLK9CSTnF5Ljc+KySTEHmQlRnf
 cPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266958; x=1703871758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuPa/UCZ+S+tpMXY2+ZSGIMlsWF9xT2DWjDbU4B7UZI=;
 b=iNhwcRSpqftHOEbvxoFaTlAcuUQOzk2Wtw9u5ajq8HExdLA/DyVhdH5wCj1ecZHa5A
 ga13BRYTZiQWeOdAFaW9uBJr+kp0qQPPOCqnNhV+G+X8nnxfz4rm7GHziKXZM/IVvCWn
 y1Sn8OTZxtFdwL09ZcDg+UnZkxba+9f7B1i4RNUpSEy98vZBwC+zD737CRHTASPNO3X1
 bnhMhe6o+7UBsxslQSFIKu/P6KwPzBSUDDaBnEBcHsmGxExZiYybIoon5X461+7hKQRp
 C5lrmnDjSk8qF6gWVX9VcXSbyjlEtyN4MPu7/40SzDTeGDN7wd42WcDNXgKZsI5edvss
 KLsw==
X-Gm-Message-State: AOJu0YzvZDnfHYoFQpKQ/weC6/+ol9AlPMr+fkFsnIe1dk+F9QkwyxGf
 Ia2v4U77R0GaXOdiL5KDHQ==
X-Google-Smtp-Source: AGHT+IEjk2JX3cryTNZLnr1na63oKaFCjP2+oPseqP9/67kTJYx/j+qLJatXCAdYf2yZBPppd7BLkQ==
X-Received: by 2002:a05:6000:1c9:b0:336:6dd3:bfd3 with SMTP id
 t9-20020a05600001c900b003366dd3bfd3mr1061282wrx.37.1703266958541; 
 Fri, 22 Dec 2023 09:42:38 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:38 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 23/29] drm/rockchip: inno_hdmi: Add variant support
Date: Fri, 22 Dec 2023 18:42:14 +0100
Message-ID: <20231222174220.55249-24-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to support RK3128's integration of the controller, this
patch adds a simple variant implementation. They mainly differ in the phy
configuration required, so those are part of the match_data. The values
have been taken from downstream. The pixelclocks in there are meant to be
max-inclusive.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - no changes

changes in v3:
 - adapt to the newly introduced inno_hdmi_power_up / inno_hdmi_standby functions

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 74 ++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 44c311e7e2d3..34f0358e8d7b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -26,6 +26,17 @@
 
 #include "inno_hdmi.h"
 
+struct inno_hdmi_phy_config {
+	unsigned long pixelclock;
+	u8 pre_emphasis;
+	u8 voltage_level_control;
+};
+
+struct inno_hdmi_variant {
+	struct inno_hdmi_phy_config *phy_configs;
+	struct inno_hdmi_phy_config *default_phy_config;
+};
+
 struct inno_hdmi_i2c {
 	struct i2c_adapter adap;
 
@@ -47,6 +58,8 @@ struct inno_hdmi {
 
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
+
+	const struct inno_hdmi_variant *variant;
 };
 
 struct inno_hdmi_connector_state {
@@ -113,6 +126,30 @@ static const char coeff_csc[][24] = {
 	},
 };
 
+static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xbb },
+	{ 165000000, 0x6f, 0xbb },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
+				     unsigned long pixelclk)
+{
+	const struct inno_hdmi_phy_config *phy_configs =
+						hdmi->variant->phy_configs;
+	int i;
+
+	for (i = 0; phy_configs[i].pixelclock != ~0UL; i++) {
+		if (pixelclk <= phy_configs[i].pixelclock)
+			return i;
+	}
+
+	DRM_DEV_DEBUG(hdmi->dev, "No phy configuration for pixelclock %lu\n",
+		      pixelclk);
+
+	return -EINVAL;
+}
+
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
 	return readl_relaxed(hdmi->regs + (offset) * 0x04);
@@ -164,12 +201,25 @@ static void inno_hdmi_standby(struct inno_hdmi *hdmi)
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
 };
 
-static void inno_hdmi_power_up(struct inno_hdmi *hdmi)
+static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
+			       unsigned long mpixelclock)
 {
+	struct inno_hdmi_phy_config *phy_config;
+	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+
+	if (ret < 0) {
+		phy_config = hdmi->variant->default_phy_config;
+		DRM_DEV_ERROR(hdmi->dev,
+			      "Using default phy configuration for TMDS rate %lu",
+			      mpixelclock);
+	} else {
+		phy_config = &hdmi->variant->phy_configs[ret];
+	}
+
 	inno_hdmi_sys_power(hdmi, false);
 
-	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x6f);
-	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0xbb);
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
+	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
@@ -406,6 +456,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_display_mode *mode)
 {
 	struct drm_display_info *display = &hdmi->connector.display_info;
+	unsigned long mpixelclock = mode->clock * 1000;
 
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -428,13 +479,13 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	inno_hdmi_i2c_init(hdmi, mode->clock * 1000);
+	inno_hdmi_i2c_init(hdmi, mpixelclock);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
 
-	inno_hdmi_power_up(hdmi);
+	inno_hdmi_power_up(hdmi, mpixelclock);
 
 	return 0;
 }
@@ -827,6 +878,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = data;
 	struct inno_hdmi *hdmi;
+	const struct inno_hdmi_variant *variant;
 	int irq;
 	int ret;
 
@@ -836,6 +888,12 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 
 	hdmi->dev = dev;
 
+	variant = of_device_get_match_data(hdmi->dev);
+	if (!variant)
+		return -EINVAL;
+
+	hdmi->variant = variant;
+
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
@@ -929,8 +987,14 @@ static void inno_hdmi_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &inno_hdmi_ops);
 }
 
+static const struct inno_hdmi_variant rk3036_inno_hdmi_variant = {
+	.phy_configs = rk3036_hdmi_phy_configs,
+	.default_phy_config = &rk3036_hdmi_phy_configs[1],
+};
+
 static const struct of_device_id inno_hdmi_dt_ids[] = {
 	{ .compatible = "rockchip,rk3036-inno-hdmi",
+	  .data = &rk3036_inno_hdmi_variant,
 	},
 	{},
 };
-- 
2.43.0

