Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0D929283
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 12:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B04A10E162;
	Sat,  6 Jul 2024 10:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RK3tvtJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65310E162
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 10:24:21 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70b0ebd1ef9so927710b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2024 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720261461; x=1720866261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCLSW0HbBwbaS3nL0I53zWuMSMpYt360azX1zUWdd0k=;
 b=RK3tvtJnSSikfo+kL4Gx8Ca5xuiUhv82AO5sSUo4PAvuDfgPQPmvLdu3s+JO2HcZFI
 9xQDNWvLF78/8Sj1QLyBGsd5C4GG2DNfDIjSxsxbfweSO2QuneLQ/f6NAl3kj+zicjy4
 Ax2PHDqsomwzpbWqu6iZDIJbttZYRR+Aw0WAhBfs8358sYO94eLLuCDmVoj4jEnw8st3
 b7IjDd7Pjlja4+bzcuh2EyzxVAdl10TuK4YvSMmU/EMulzIGnr+3oSJbsn2W9z1QWTgK
 jnMF7DJc5lvSn1oXXR/gfJZggquwJADTkuKwLR4aMDTxN0admQquybnuu23wn32KBoFm
 IMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720261461; x=1720866261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCLSW0HbBwbaS3nL0I53zWuMSMpYt360azX1zUWdd0k=;
 b=obw6sdEgfhXds+6A92kqegN+d6S8PuY0QKulWegIqlxe5yByVlm5xiHBiUSw3wV8Gz
 y22HTVzY7Cgic7bsuUxw02eRgRdY3bFeokcbGre7PuAT3vCz/Gge5J0krIiRemuw+m/A
 cWm+SOgZrtjLLaeQBUqXHCrwMbI2EMPRk9doN6s9zKElA2MW8CGH3FlQfeFAylb0pcHn
 0dHZKQX3WLtQrKHIaclMvIaHC/magW6I8fpF9aRb+5ilQJMyiXnULOjpLN84VveuAOwA
 w1gVFqJfPE47fDLTmqRY90dOIDL0HYFg42+nb8WYEgPT6jSG+o04i208MtBZJLBtkevD
 9f6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI6M6ZHv9u83LN+k39ytPHIZQejuJl6CPlgmfjUm7P2ctheMliFiM6yWD3c90LbMCFisauHVbsIpTGvzbOoMHH77l8+lPC+939xlX4InwT
X-Gm-Message-State: AOJu0YwjCNLaIAnSpDvDSta2jo52Kazg5E9Kt4VIJOeIwmUQXdLR4QAw
 zbRusUwuTbyGUIVY80aeQkLb/f2ar68uYQndwPgknZ5z4gAz3twt
X-Google-Smtp-Source: AGHT+IHPbJwaX0rSPG0rISm/Df/RDW03hjsjQ/2SDn1k/nrgezWcnqmdHbuXDXRDt+tCIxIVRS4ucg==
X-Received: by 2002:a05:6a21:6b0c:b0:1bd:29f2:c7df with SMTP id
 adf61e73a8af0-1c0cc8b3ac9mr6769970637.43.1720261460815; 
 Sat, 06 Jul 2024 03:24:20 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb67e04f64sm9126625ad.214.2024.07.06.03.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 03:24:20 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/5] drm/panel: st7701: Decouple DSI and DRM parts
Date: Sat,  6 Jul 2024 19:23:33 +0900
Message-ID: <20240706102338.99231-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240706102338.99231-1-kikuchan98@gmail.com>
References: <20240706102338.99231-1-kikuchan98@gmail.com>
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

Split into a DSI-specific part and a DRM-specific part.

Additionally, use devm_add_action_or_reset() to simplify the flow,
and disable and unprepare the panel on cleanup.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 72 ++++++++++++-------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index a9a8fd85057..a0644f7a4c8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -539,7 +539,7 @@ static int st7701_get_modes(struct drm_panel *panel,
 
 	mode = drm_mode_duplicate(connector->dev, desc_mode);
 	if (!mode) {
-		dev_err(&st7701->dsi->dev, "failed to add mode %ux%u@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			desc_mode->hdisplay, desc_mode->vdisplay,
 			drm_mode_vrefresh(desc_mode));
 		return -ENOMEM;
@@ -974,42 +974,48 @@ static const struct st7701_panel_desc rg_arc_desc = {
 	.gip_sequence = rg_arc_gip_sequence,
 };
 
-static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
+static void st7701_cleanup(void *data)
+{
+	struct st7701 *st7701 = (struct st7701 *)data;
+
+	drm_panel_remove(&st7701->panel);
+	drm_panel_disable(&st7701->panel);
+	drm_panel_unprepare(&st7701->panel);
+}
+
+static int st7701_probe(struct device *dev, int connector_type)
 {
 	const struct st7701_panel_desc *desc;
 	struct st7701 *st7701;
 	int ret;
 
-	st7701 = devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
+	st7701 = devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
 	if (!st7701)
 		return -ENOMEM;
 
-	desc = of_device_get_match_data(&dsi->dev);
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
-	dsi->format = desc->format;
-	dsi->lanes = desc->lanes;
+	desc = of_device_get_match_data(dev);
+	if (!desc)
+		return -ENODEV;
 
 	st7701->supplies[0].supply = "VCC";
 	st7701->supplies[1].supply = "IOVCC";
 
-	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->supplies),
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(st7701->supplies),
 				      st7701->supplies);
 	if (ret < 0)
 		return ret;
 
-	st7701->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	st7701->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(st7701->reset)) {
-		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
+		dev_err(dev, "Couldn't get our reset GPIO\n");
 		return PTR_ERR(st7701->reset);
 	}
 
-	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->orientation);
+	ret = of_drm_get_panel_orientation(dev->of_node, &st7701->orientation);
 	if (ret < 0)
-		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
+		return dev_err_probe(dev, ret, "Failed to get orientation\n");
 
-	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
+	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
 
 	/**
 	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
@@ -1028,27 +1034,39 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&st7701->panel);
 
-	mipi_dsi_set_drvdata(dsi, st7701);
-	st7701->dsi = dsi;
+	dev_set_drvdata(dev, st7701);
 	st7701->desc = desc;
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret)
-		goto err_attach;
+	return devm_add_action_or_reset(dev, st7701_cleanup, st7701);
+}
+
+static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct st7701 *st7701;
+	int err;
+
+	err = st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
+	if (err)
+		return err;
+
+	st7701 = dev_get_drvdata(&dsi->dev);
+	st7701->dsi = dsi;
+
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->format = st7701->desc->format;
+	dsi->lanes = st7701->desc->lanes;
+
+	err = mipi_dsi_attach(dsi);
+	if (err)
+		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
 
 	return 0;
-
-err_attach:
-	drm_panel_remove(&st7701->panel);
-	return ret;
 }
 
 static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	struct st7701 *st7701 = mipi_dsi_get_drvdata(dsi);
-
 	mipi_dsi_detach(dsi);
-	drm_panel_remove(&st7701->panel);
 }
 
 static const struct of_device_id st7701_of_match[] = {
-- 
2.45.2

