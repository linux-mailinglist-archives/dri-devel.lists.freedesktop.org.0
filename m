Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F42946C9D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 08:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCF710E071;
	Sun,  4 Aug 2024 06:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cMCvlCuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320BA10E071
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 06:16:16 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3db14339fb0so6527526b6e.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722752175; x=1723356975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fnql3FbykIepF8kn8jYdsbjwm/J1dth3YluSeiLe3RM=;
 b=cMCvlCuBV7HILmcTxb3i+o8Cl+y8wdqVwBeNIirPzDP1yvCO/DSoaLj6uKNcrMssfH
 35+vaHaCMdoSsa3wCM7QiVG96hzPWbF4tVv0nGN3Y9z7vwFj+BnfbxDT5X/9uojt9Jt1
 3/rL9YDCO/EV5/rJYsUkr6G2eg1PEtBp86NltrfbtlV+V1nuPjb+1tLxm/QtfvSGiWmZ
 hi6uZqP/JyqWMUDgRg7/gl9X2atM1BtjmbxPOt1FN5EwZ3h9o/JUAK+b5fDRJz7s2fuY
 CuwlD/chBDweuzCRrEYO+FtPpcryl3266b/5Ofwl7FYms+k8NrBb1Tsrac04/K76Qory
 YYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722752175; x=1723356975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fnql3FbykIepF8kn8jYdsbjwm/J1dth3YluSeiLe3RM=;
 b=a4WPXwzVoFi2Xx7ibfHdFQwILys+2abBiQK93MGF3Rl5+FXNfBYQ6g1JhEvaBubAfm
 RB67nTwot87C7oCIEi93h12KYh7ncy2LDB83v6K4yK607Z3zGwZx2pnzM2NyxE6DdgXp
 +uN96yztgc2hn/G6p5eMgIZVem6L3K5RQg7cscrlRl+rcsYq0CVaBF7hwVnCoyAs1xbs
 Rs1E6Xc6Y/N5FKW/Inel5MOHGiF01+9Lp6i+oRoX4taelgflcpKVZP+mrBV/kxCiK2SA
 0XbXgRkmR7DEd/T72D1xpLGm1znlpsdBPUfZDwr3xKPV15VZ+gl2B5e6zHLdqslkF5N4
 31pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY2WaXWHP1xPPZjEJLVpY7G61zwhuwDSZes9FNZu3tS0EhFwycpRDRVHs+d+KMe6ZgGJz2h6U/e4s81keuJcX+OIvR1Yquan80Xwmcghym
X-Gm-Message-State: AOJu0YwLQ679cQG/j5zepLMyDesdeeUAQZ2OvjWqHbS1gxPGE0wg4UCG
 SD8VnALKXxPg4cLRfCqmfiPOQSmJbPPT76AFgv2NJtL47Z7+fu8Y
X-Google-Smtp-Source: AGHT+IEJzz1gHaqM2q/OdiVr5f66AvMuo9n4CECuHPcEhxtVPnmU2yXtswZqOsJRNmBEGBzil0HePw==
X-Received: by 2002:a05:6808:1a01:b0:3da:c428:1c51 with SMTP id
 5614622812f47-3db557fc32dmr12228412b6e.8.1722752175351; 
 Sat, 03 Aug 2024 23:16:15 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29ef4sm44194195ad.14.2024.08.03.23.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 23:16:15 -0700 (PDT)
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
Subject: [PATCH v4 4/5] drm/panel: st7701: Add support for SPI for
 configuration
Date: Sun,  4 Aug 2024 15:14:48 +0900
Message-ID: <20240804061503.881283-5-kikuchan98@gmail.com>
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

The ST7701 supports not only MIPI DSI, but also SPI as an interface
for configuration. To support a panel connected via SPI with an RGB
parallel interface, add support for SPI using MIPI DBI helpers.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 |   3 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 123 +++++++++++++++---
 2 files changed, 110 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9f49b0189d3..5d83ddc06ec 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -784,7 +784,8 @@ config DRM_PANEL_SHARP_LS060T1SX01
 config DRM_PANEL_SITRONIX_ST7701
 	tristate "Sitronix ST7701 panel driver"
 	depends on OF
-	depends on DRM_MIPI_DSI
+	depends on SPI || DRM_MIPI_DSI
+	select DRM_MIPI_DBI if SPI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for the Sitronix
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index a0644f7a4c8..9e83a760a8a 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -4,6 +4,7 @@
  * Author: Jagan Teki <jagan@amarulasolutions.com>
  */
 
+#include <drm/drm_mipi_dbi.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
@@ -14,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
 
 #include <video/mipi_display.h>
 
@@ -130,12 +132,16 @@ struct st7701_panel_desc {
 struct st7701 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
+	struct mipi_dbi dbi;
 	const struct st7701_panel_desc *desc;
 
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset;
 	unsigned int sleep_delay;
 	enum drm_panel_orientation orientation;
+
+	int (*write_command)(struct st7701 *st7701, u8 cmd, const u8 *seq,
+			     size_t len);
 };
 
 static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
@@ -143,16 +149,22 @@ static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
 	return container_of(panel, struct st7701, panel);
 }
 
-static inline int st7701_dsi_write(struct st7701 *st7701, const void *seq,
-				   size_t len)
+static int st7701_dsi_write(struct st7701 *st7701, u8 cmd, const u8 *seq,
+			    size_t len)
 {
-	return mipi_dsi_dcs_write_buffer(st7701->dsi, seq, len);
+	return mipi_dsi_dcs_write(st7701->dsi, cmd, seq, len);
 }
 
-#define ST7701_WRITE(st7701, seq...)				\
-	{							\
-		const u8 d[] = { seq };				\
-		st7701_dsi_write(st7701, d, ARRAY_SIZE(d));	\
+static int st7701_dbi_write(struct st7701 *st7701, u8 cmd, const u8 *seq,
+			    size_t len)
+{
+	return mipi_dbi_command_stackbuf(&st7701->dbi, cmd, seq, len);
+}
+
+#define ST7701_WRITE(st7701, cmd, seq...)				\
+	{								\
+		const u8 d[] = { seq };					\
+		st7701->write_command(st7701, cmd, d, ARRAY_SIZE(d));	\
 	}
 
 static u8 st7701_vgls_map(struct st7701 *st7701)
@@ -211,10 +223,10 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	/* Command2, BK0 */
 	st7701_switch_cmd_bkx(st7701, true, 0);
 
-	mipi_dsi_dcs_write(st7701->dsi, ST7701_CMD2_BK0_PVGAMCTRL,
-			   desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
-	mipi_dsi_dcs_write(st7701->dsi, ST7701_CMD2_BK0_NVGAMCTRL,
-			   desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
+	st7701->write_command(st7701, ST7701_CMD2_BK0_PVGAMCTRL, desc->pv_gamma,
+			      ARRAY_SIZE(desc->pv_gamma));
+	st7701->write_command(st7701, ST7701_CMD2_BK0_NVGAMCTRL, desc->nv_gamma,
+			      ARRAY_SIZE(desc->nv_gamma));
 	/*
 	 * Vertical line count configuration:
 	 * Line[6:0]: select number of vertical lines of the TFT matrix in
@@ -1051,6 +1063,10 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 
 	st7701 = dev_get_drvdata(&dsi->dev);
 	st7701->dsi = dsi;
+	st7701->write_command = st7701_dsi_write;
+
+	if (!st7701->desc->lanes)
+		return dev_err_probe(&dsi->dev, -EINVAL, "This panel is not for MIPI DSI\n");
 
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
@@ -1064,30 +1080,107 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
+static int st7701_spi_probe(struct spi_device *spi)
+{
+	struct st7701 *st7701;
+	struct gpio_desc *dc;
+	int err;
+
+	err = st7701_probe(&spi->dev, DRM_MODE_CONNECTOR_DPI);
+	if (err)
+		return err;
+
+	st7701 = dev_get_drvdata(&spi->dev);
+	st7701->write_command = st7701_dbi_write;
+
+	dc = devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(&spi->dev, PTR_ERR(dc), "Failed to get GPIO for D/CX\n");
+
+	err = mipi_dbi_spi_init(spi, &st7701->dbi, dc);
+	if (err)
+		return dev_err_probe(&spi->dev, err, "Failed to init MIPI DBI\n");
+	st7701->dbi.read_commands = NULL;
+
+	return 0;
+}
+
 static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	mipi_dsi_detach(dsi);
 }
 
-static const struct of_device_id st7701_of_match[] = {
+static const struct of_device_id st7701_dsi_of_match[] = {
 	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, st7701_of_match);
+MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
+
+static const struct of_device_id st7701_spi_of_match[] = {
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
+
+static const struct spi_device_id st7701_spi_ids[] = {
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, st7701_spi_ids);
 
 static struct mipi_dsi_driver st7701_dsi_driver = {
 	.probe		= st7701_dsi_probe,
 	.remove		= st7701_dsi_remove,
 	.driver = {
 		.name		= "st7701",
-		.of_match_table	= st7701_of_match,
+		.of_match_table	= st7701_dsi_of_match,
 	},
 };
-module_mipi_dsi_driver(st7701_dsi_driver);
+
+static struct spi_driver st7701_spi_driver = {
+	.probe		= st7701_spi_probe,
+	.id_table	= st7701_spi_ids,
+	.driver = {
+		.name		= "st7701",
+		.of_match_table	= st7701_spi_of_match,
+	},
+};
+
+static int __init st7701_driver_init(void)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_SPI)) {
+		err = spi_register_driver(&st7701_spi_driver);
+		if (err)
+			return err;
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
+		err = mipi_dsi_driver_register(&st7701_dsi_driver);
+		if (err) {
+			if (IS_ENABLED(CONFIG_SPI))
+				spi_unregister_driver(&st7701_spi_driver);
+			return err;
+		}
+	}
+
+	return 0;
+}
+module_init(st7701_driver_init);
+
+static void __exit st7701_driver_exit(void)
+{
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
+		mipi_dsi_driver_unregister(&st7701_dsi_driver);
+
+	if (IS_ENABLED(CONFIG_SPI))
+		spi_unregister_driver(&st7701_spi_driver);
+}
+module_exit(st7701_driver_exit);
 
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
 MODULE_DESCRIPTION("Sitronix ST7701 LCD Panel Driver");
 MODULE_LICENSE("GPL");
-- 
2.45.2

