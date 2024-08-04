Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C0946C99
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 08:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AA110E068;
	Sun,  4 Aug 2024 06:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+S1JBKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B14B10E068
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 06:16:08 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2cb55418470so6283340a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 23:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722752168; x=1723356968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QCBHipd9ju2B6kDRIPqyXO7nCYrctm5/4ZaKFrTgHo=;
 b=Y+S1JBKwJ4p9Smet90IrRkVpgpv+jN5fGnPopYosRuLhr9SCQw6quhCy5rulZfXXof
 EtBa3EyH2WsCLpPh+FMF2cxGK9YHhtKB5rwnFKK5BbZvld4mBd3d5hX4zOLMVP1oljhj
 ue/U/JFr2yy0dssIcrvbzkYCKEE0KVBat0Y45dt8K7oYgQhVHUXwutHxOzVfXNiI36Pm
 o5LXTxmYvR4Ier1sRkEYXGrvrijfMVU/nUChzHLR+2vfCtS0lrL2jnkVt4Y+Qt0EYOBt
 TkEY17jxY/ciw9W50svcS0BD3iwQ382w1oqCTrMGqPHp/ZHqtD5phezY/7wXMm8Vx1im
 F+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722752168; x=1723356968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QCBHipd9ju2B6kDRIPqyXO7nCYrctm5/4ZaKFrTgHo=;
 b=po4wb/B3S+Klah/jzh5p86g1fBVhuAUBzvx+YRw64DOcwoqHBz/fcFq5Th5InMCQ6w
 scbbpikfAMP9+fw1HodcDjUKXk3aCB5oTFQR5oo9Gt4PSPownyUd11Yfe98sDYCY+zTQ
 XfAhAvgKlto98XusE5tGM9mx1NSqib5ioVYKe0xI+/XhdPL0gW5EjjcJGenrzPn3a++W
 ccuqRqt2pE3Ud1h2GnavMT+R6UslUHjXEUEKbaCBNXbvIb1xUWrLLrv34WQJD4D3YnB2
 wcsyb83c7lDFSueyhJgR3APeBvlxnO8F1ROhcDp2XW6qo5txGeuW0YMNId9SIoNmY8fR
 RKSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLMv6dpTmw++C+qzq1rLr0EJhp9sH9rnP47QbVW4nNq3KgQFme/LJSTlbiFCjglclzntqGCxAZ2CkU5lSHPWxK5+K4xFRSZsxBP4/FpgRa
X-Gm-Message-State: AOJu0Yztg1n0AXrt8eqHSjy34b0SnpvujmPGOD5MPUk6APKuQLl/9YTV
 ghslO/ntmQpG4Se5dSKyqQeFxV7KWzLshlbXXB6fuCeaRkk0uXQp
X-Google-Smtp-Source: AGHT+IF2nVOyQC7h9YelKyVOaAywKnE46vjSEtLS5cAVyCk6ig+Yg/Q6vLleff/wH5lSdJpCHHoUng==
X-Received: by 2002:a17:902:f54b:b0:1fb:74b3:53d5 with SMTP id
 d9443c01a7336-1ff572d43dcmr93610485ad.35.1722752167823; 
 Sat, 03 Aug 2024 23:16:07 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29ef4sm44194195ad.14.2024.08.03.23.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 23:16:07 -0700 (PDT)
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
Subject: [PATCH v4 2/5] drm/panel: st7701: Decouple DSI and DRM parts
Date: Sun,  4 Aug 2024 15:14:46 +0900
Message-ID: <20240804061503.881283-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804061503.881283-1-kikuchan98@gmail.com>
References: <20240804061503.881283-1-kikuchan98@gmail.com>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

