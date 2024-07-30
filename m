Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B8941270
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810B10E51B;
	Tue, 30 Jul 2024 12:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xeEDY0TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D54210E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3684bea9728so2426679f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343841; x=1722948641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mASIbGHgicNkpjEZJDVQTMm2DP0XPbvH1Sd0GVs1rHs=;
 b=xeEDY0TIWawOOlejTHDHg722XmyaM39g/pFQuYQDxyMqyUSKPtR2mPt/9Etk0QHjMY
 iCuZxvkfm8Wn0xnGakI460ZY/aQfY6gme0MKplAFlBMNgEaCidmoBQqXo+9/l5J/NbD7
 RUN4upPZgA7BIb6bmpgOUwCKH61nwNFquxNuXKBOm8ObIo0db16h/Gzn5h7bwCFrm1cv
 IZmnVqxt7yXYoXybeZZKeEdFzXYiHXpswPnIm2WOz/T2XtNZ16hT4A23MGxsYL+Tic+7
 1XL8RrYG4BbCDwXv3QrPBupgSTtZ4mgilmEdN+6DfXoPoxBl6Xl08sVDPOj9cAevSmUx
 Xg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343841; x=1722948641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mASIbGHgicNkpjEZJDVQTMm2DP0XPbvH1Sd0GVs1rHs=;
 b=dXqKaFKx8Uyg2mZsA4xYM9hdxAZjoDrxVdyG+Rm0pGNGOMwy0RVlidR89JFwEYKBYp
 FNwtDDgyTS6eGJ1FJlsB5Efd86WTaB3n/IelQSKl1tw28piBhhfZHoZw9UyicVcMYXyD
 HWPp4Mn1T6k8gr3ey0MqH4j69fvMqeNBfr8h/9TAHuRegC4PmhjJb0zITL8BGL1RaRIL
 1jvJAOCc6LsrNv5mLydjxBwx/yHIvKAaiTLl9gJG4XOgpgSsoXUSG0FqN0SvoJhw7KrC
 4iGGkA53iOejKl4au/VXmMOOurpaGxh+XIu+xROwVAjk8sFOrHM1U8u++LzoiK/qjQKt
 TheA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXir1eaDZP3rM+/3azuYZwWO/gDdrW8kSR3ws8YmxzaV54zG0Ylor/MCLcw+8X5HRVofFrWTfZDjXWanmZKiqV3JPmJrCJbiqcIqcAsa1hn
X-Gm-Message-State: AOJu0YyENOpd7oLBuPGXNJYM3qEoGO+N3qP8I+1ASlZBa4W70dLNnd36
 PyIpY45kPdERsr+0Grp3HJmhi9N5rcDQwX43gUx+9TNrVstZys8yv+Q32c4RCmA=
X-Google-Smtp-Source: AGHT+IGgAowgwPOjeaL86WpoU9wRwRtqxrk1rp/DYm6nll47JN9ogSrFK3ue1xuiQZz1zSdyf7rnBg==
X-Received: by 2002:a05:6000:11cb:b0:368:3194:8a85 with SMTP id
 ffacd0b85a97d-36b5cee9bfdmr7815247f8f.7.1722343840573; 
 Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
Date: Tue, 30 Jul 2024 14:50:17 +0200
Message-ID: <20240730125023.710237-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Using several string comparisons with if/else if/else clauses
is fairly inefficient and does not scale well.

Use matched data to tweak the driver depending on the matched
SoC instead.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 209 +++++++++++++++++---------
 1 file changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7c39e5c99043..ef059c5ef520 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -125,8 +125,17 @@
 #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
 #define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed */
 
+struct meson_dw_hdmi_speed {
+	const struct reg_sequence *regs;
+	unsigned int reg_num;
+	unsigned int limit;
+};
+
 struct meson_dw_hdmi_data {
 	int (*reg_init)(struct device *dev);
+	const struct meson_dw_hdmi_speed *speeds;
+	unsigned int speed_num;
+	bool use_drm_infoframe;
 	u32 cntl0_init;
 	u32 cntl1_init;
 };
@@ -185,78 +194,33 @@ struct meson_dw_hdmi {
 	struct regmap *top;
 };
 
-static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
-					const char *compat)
-{
-	return of_device_is_compatible(dw_hdmi->dev->of_node, compat);
-}
-
-/* Bridge */
-
 /* Setup PHY bandwidth modes */
-static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
+static int meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 				      const struct drm_display_mode *mode,
 				      bool mode_is_420)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
+	int i;
 
 	/* For 420, pixel clock is half unlike venc clock */
-	if (mode_is_420) pixel_clock /= 2;
-
-	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x333d3282);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2136315b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303382);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2036315b);
-		} else if (pixel_clock >= 148500) {
-			/* 1.485Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303362);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2016315b);
-		} else {
-			/* 742.5Mbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33604142);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x0016315b);
-		}
-	} else if (dw_hdmi_is_compatible(dw_hdmi,
-					 "amlogic,meson-gxbb-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33353245);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2100115b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33634283);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0xb000115b);
-		} else {
-			/* 1.485Gbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33632122);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2000115b);
-		}
-	} else if (dw_hdmi_is_compatible(dw_hdmi,
-					 "amlogic,meson-g12a-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x37eb65c4);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x0000080b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb6262);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
-		} else {
-			/* 1.485Gbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb4242);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
-		}
+	if (mode_is_420)
+		pixel_clock /= 2;
+
+	for (i = 0; i < dw_hdmi->data->speed_num; i++) {
+		if (pixel_clock >= dw_hdmi->data->speeds[i].limit)
+			break;
 	}
+
+	/* No match found - Last entry should have a 0 limit */
+	if (WARN_ON(i == dw_hdmi->data->speed_num))
+		return -EINVAL;
+
+	regmap_multi_reg_write(priv->hhi,
+			       dw_hdmi->data->speeds[i].regs,
+			       dw_hdmi->data->speeds[i].reg_num);
+
+	return 0;
 }
 
 static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
@@ -543,22 +507,133 @@ static int meson_dw_init_regmap_g12(struct device *dev)
 	return 0;
 }
 
+static const struct reg_sequence gxbb_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33353245 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2100115b },
+};
+
+static const struct reg_sequence gxbb_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33634283 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0xb000115b },
+};
+
+static const struct reg_sequence gxbb_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33632122 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2000115b },
+};
+
+static const struct meson_dw_hdmi_speed gxbb_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = gxbb_3g7_regs,
+		.reg_num = ARRAY_SIZE(gxbb_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = gxbb_3g_regs,
+		.reg_num = ARRAY_SIZE(gxbb_3g_regs)
+	}, {
+		.regs = gxbb_def_regs,
+		.reg_num = ARRAY_SIZE(gxbb_def_regs)
+	}
+};
+
 static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
 	.reg_init = meson_dw_init_regmap_gx,
 	.cntl0_init = 0x0,
 	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
+	.use_drm_infoframe = false,
+	.speeds = gxbb_speeds,
+	.speed_num = ARRAY_SIZE(gxbb_speeds),
+};
+
+static const struct reg_sequence gxl_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x333d3282 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2136315b },
+};
+
+static const struct reg_sequence gxl_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303382 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2036315b },
+};
+
+static const struct reg_sequence gxl_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303362 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2016315b },
+};
+
+static const struct reg_sequence gxl_270m_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33604142 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x0016315b },
+};
+
+static const struct meson_dw_hdmi_speed gxl_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = gxl_3g7_regs,
+		.reg_num = ARRAY_SIZE(gxl_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = gxl_3g_regs,
+		.reg_num = ARRAY_SIZE(gxl_3g_regs)
+	}, {
+		.limit = 148500,
+		.regs = gxl_def_regs,
+		.reg_num = ARRAY_SIZE(gxl_def_regs)
+	}, {
+		.regs = gxl_270m_regs,
+		.reg_num = ARRAY_SIZE(gxl_270m_regs)
+	}
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
 	.reg_init = meson_dw_init_regmap_gx,
 	.cntl0_init = 0x0,
 	.cntl1_init = PHY_CNTL1_INIT,
+	.use_drm_infoframe = true,
+	.speeds = gxl_speeds,
+	.speed_num = ARRAY_SIZE(gxl_speeds),
+};
+
+static const struct reg_sequence g12a_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x37eb65c4 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x0000080b },
+};
+
+static const struct reg_sequence g12a_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb6262 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
+};
+
+static const struct reg_sequence g12a_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb4242 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
+};
+
+static const struct meson_dw_hdmi_speed g12a_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = g12a_3g7_regs,
+		.reg_num = ARRAY_SIZE(g12a_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = g12a_3g_regs,
+		.reg_num = ARRAY_SIZE(g12a_3g_regs)
+	}, {
+		.regs = g12a_def_regs,
+		.reg_num = ARRAY_SIZE(g12a_def_regs)
+	}
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.reg_init = meson_dw_init_regmap_g12,
 	.cntl0_init = 0x000b4242, /* Bandgap */
 	.cntl1_init = PHY_CNTL1_INIT,
+	.use_drm_infoframe = true,
+	.speeds = g12a_speeds,
+	.speed_num = ARRAY_SIZE(g12a_speeds),
 };
 
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
@@ -590,7 +665,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	platform_set_drvdata(pdev, meson_dw_hdmi);
 
 	meson_dw_hdmi->priv = priv;
-	meson_dw_hdmi->dev = dev;
 	meson_dw_hdmi->data = match;
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
@@ -650,7 +724,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	meson_dw_hdmi_init(meson_dw_hdmi);
 
 	/* Bridge / Connector */
-
 	dw_plat_data->priv_data = meson_dw_hdmi;
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
@@ -659,11 +732,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->ycbcr_420_allowed = true;
 	dw_plat_data->disable_cec = true;
 	dw_plat_data->output_port = 1;
-
-	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
-		dw_plat_data->use_drm_infoframe = true;
+	dw_plat_data->use_drm_infoframe = meson_dw_hdmi->data->use_drm_infoframe;
 
 	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
 	if (IS_ERR(meson_dw_hdmi->hdmi))
-- 
2.43.0

