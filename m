Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70FE950102
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AC210E2CC;
	Tue, 13 Aug 2024 09:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXs2v11u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65F010E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723540390; x=1755076390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aGvqIoXoggMy1201TQt+pLxsPlqGZEth0kDPzckpUwQ=;
 b=YXs2v11uCWucGzhOA3x1ZugisUev+xmVOq0H76gIxYu2mSKEt+FXW1Of
 ZkfwtIUHpZ0AUU/kdQaTKldwPjHsqsR+/3ajLL9PWa33s0RT62UrQBKN0
 5kc/t3sACQyEanoQyChiFeE02sF73gUmhzRqEYp692Yc57ZMJbfaX3ZS2
 ECS79p3xMYKv+ymxMmE6ybGmqpnEHifpS72GPe2W4qyQWc2rF55REEI1e
 NNok1cgNOnw3nRvg2J4vTIgNlucQKhZLErY5vyfuBllfpcRKN3spguD3j
 SzISyKiPAZzgQOD5GsSsmSHfQqh4LP4DWMgbZO/9jIR/0btRkZk+aH1q8 w==;
X-CSE-ConnectionGUID: 1tb5pBAYQ9SIdQN2ZDemYw==
X-CSE-MsgGUID: m/dlGCFNQfmZ8RK+gqfsng==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25555180"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25555180"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:13:09 -0700
X-CSE-ConnectionGUID: oitavjEVQQyvVznpoH6E6g==
X-CSE-MsgGUID: JJu4iHE+SUORa3eqt/B3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96144764"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP; 13 Aug 2024 02:13:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id F2FF53B5; Tue, 13 Aug 2024 12:13:01 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/1] drm/panel: ili9341: Remove duplicate code
Date: Tue, 13 Aug 2024 12:12:58 +0300
Message-ID: <20240813091258.1625646-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Remove duplicate code that is handled by tinyDRM,
i.e. drivers/gpu/drm/tiny/ili9341.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 210 +------------------
 1 file changed, 3 insertions(+), 207 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..ae4062bb3249 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -13,9 +13,6 @@
  * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
  * the reuse of DBI abstraction part referred from Linus's patch
  * "drm/panel: s6e63m0: Switch to DBI abstraction for SPI"
- *
- * For only-dbi part, copy from David's code (drm/tiny/ili9341.c)
- * Copyright 2018 David Lechner <david@lechnology.com>
  */
 
 #include <linux/backlight.h>
@@ -486,176 +483,6 @@ static const struct drm_panel_funcs ili9341_dpi_funcs = {
 	.get_modes = ili9341_dpi_get_modes,
 };
 
-static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_plane_state *plane_state)
-{
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-	struct mipi_dbi *dbi = &dbidev->dbi;
-	u8 addr_mode;
-	int ret, idx;
-
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
-		return;
-
-	ret = mipi_dbi_poweron_conditional_reset(dbidev);
-	if (ret < 0)
-		goto out_exit;
-	if (ret == 1)
-		goto out_enable;
-
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
-
-	mipi_dbi_command(dbi, ILI9341_POWERB, 0x00, 0xc1, 0x30);
-	mipi_dbi_command(dbi, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
-	mipi_dbi_command(dbi, ILI9341_DTCA, 0x85, 0x00, 0x78);
-	mipi_dbi_command(dbi, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
-	mipi_dbi_command(dbi, ILI9341_PRC, ILI9341_DBI_PRC_NORMAL);
-	mipi_dbi_command(dbi, ILI9341_DTCB, 0x00, 0x00);
-
-	/* Power Control */
-	mipi_dbi_command(dbi, ILI9341_POWER1, ILI9341_DBI_VCOMH_4P6V);
-	mipi_dbi_command(dbi, ILI9341_POWER2, ILI9341_DBI_PWR_2_DEFAULT);
-	/* VCOM */
-	mipi_dbi_command(dbi, ILI9341_VCOM1, ILI9341_DBI_VCOM_1_VMH_4P25V,
-			 ILI9341_DBI_VCOM_1_VML_1P5V);
-	mipi_dbi_command(dbi, ILI9341_VCOM2, ILI9341_DBI_VCOM_2_DEC_58);
-
-	/* Memory Access Control */
-	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
-			 MIPI_DCS_PIXEL_FMT_16BIT);
-
-	/* Frame Rate */
-	mipi_dbi_command(dbi, ILI9341_FRC, ILI9341_DBI_FRC_DIVA & 0x03,
-			 ILI9341_DBI_FRC_RTNA & 0x1f);
-
-	/* Gamma */
-	mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
-	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, ILI9341_GAMMA_CURVE_1);
-	mipi_dbi_command(dbi, ILI9341_PGAMMA,
-			 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
-			 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
-	mipi_dbi_command(dbi, ILI9341_NGAMMA,
-			 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
-			 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
-
-	/* DDRAM */
-	mipi_dbi_command(dbi, ILI9341_ETMOD, ILI9341_DBI_EMS_GAS |
-			 ILI9341_DBI_EMS_DTS |
-			 ILI9341_DBI_EMS_GON);
-
-	/* Display */
-	mipi_dbi_command(dbi, ILI9341_DFC, 0x08, 0x82, 0x27, 0x00);
-	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
-	msleep(100);
-
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
-	msleep(100);
-
-out_enable:
-	switch (dbidev->rotation) {
-	default:
-		addr_mode = ILI9341_MADCTL_MX;
-		break;
-	case 90:
-		addr_mode = ILI9341_MADCTL_MV;
-		break;
-	case 180:
-		addr_mode = ILI9341_MADCTL_MY;
-		break;
-	case 270:
-		addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
-			    ILI9341_MADCTL_MX;
-		break;
-	}
-
-	addr_mode |= ILI9341_MADCTL_BGR;
-	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
-	drm_info(&dbidev->drm, "Initialized display serial interface\n");
-out_exit:
-	drm_dev_exit(idx);
-}
-
-static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
-	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(ili9341_dbi_enable),
-};
-
-static const struct drm_display_mode ili9341_dbi_mode = {
-	DRM_SIMPLE_MODE(240, 320, 37, 49),
-};
-
-DEFINE_DRM_GEM_DMA_FOPS(ili9341_dbi_fops);
-
-static struct drm_driver ili9341_dbi_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.fops			= &ili9341_dbi_fops,
-	DRM_GEM_DMA_DRIVER_OPS_VMAP,
-	.debugfs_init		= mipi_dbi_debugfs_init,
-	.name			= "ili9341",
-	.desc			= "Ilitek ILI9341",
-	.date			= "20210716",
-	.major			= 1,
-	.minor			= 0,
-};
-
-static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
-			     struct gpio_desc *reset)
-{
-	struct device *dev = &spi->dev;
-	struct mipi_dbi_dev *dbidev;
-	struct mipi_dbi *dbi;
-	struct drm_device *drm;
-	struct regulator *vcc;
-	u32 rotation = 0;
-	int ret;
-
-	vcc = devm_regulator_get_optional(dev, "vcc");
-	if (IS_ERR(vcc)) {
-		dev_err(dev, "get optional vcc failed\n");
-		vcc = NULL;
-	}
-
-	dbidev = devm_drm_dev_alloc(dev, &ili9341_dbi_driver,
-				    struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
-
-	dbi = &dbidev->dbi;
-	drm = &dbidev->drm;
-	dbi->reset = reset;
-	dbidev->regulator = vcc;
-
-	drm_mode_config_init(drm);
-
-	dbidev->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(dbidev->backlight))
-		return PTR_ERR(dbidev->backlight);
-
-	device_property_read_u32(dev, "rotation", &rotation);
-
-	ret = mipi_dbi_spi_init(spi, dbi, dc);
-	if (ret)
-		return ret;
-
-	ret = mipi_dbi_dev_init(dbidev, &ili9341_dbi_funcs,
-				&ili9341_dbi_mode, rotation);
-	if (ret)
-		return ret;
-
-	drm_mode_config_reset(drm);
-
-	ret = drm_dev_register(drm, 0);
-	if (ret)
-		return ret;
-
-	spi_set_drvdata(spi, drm);
-
-	drm_fbdev_dma_setup(drm, 0);
-
-	return 0;
-}
-
 static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 			     struct gpio_desc *reset)
 {
@@ -711,7 +538,6 @@ static int ili9341_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct gpio_desc *dc;
 	struct gpio_desc *reset;
-	const struct spi_device_id *id = spi_get_device_id(spi);
 
 	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset))
@@ -721,36 +547,15 @@ static int ili9341_probe(struct spi_device *spi)
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get gpio 'dc'\n");
 
-	if (!strcmp(id->name, "sf-tc240t-9370-t"))
-		return ili9341_dpi_probe(spi, dc, reset);
-
-	if (!strcmp(id->name, "yx240qv29"))
-		return ili9341_dbi_probe(spi, dc, reset);
-
-	return -ENODEV;
+	return ili9341_dpi_probe(spi, dc, reset);
 }
 
 static void ili9341_remove(struct spi_device *spi)
 {
-	const struct spi_device_id *id = spi_get_device_id(spi);
 	struct ili9341 *ili = spi_get_drvdata(spi);
-	struct drm_device *drm = spi_get_drvdata(spi);
 
-	if (!strcmp(id->name, "sf-tc240t-9370-t")) {
-		ili9341_dpi_power_off(ili);
-		drm_panel_remove(&ili->panel);
-	} else if (!strcmp(id->name, "yx240qv29")) {
-		drm_dev_unplug(drm);
-		drm_atomic_helper_shutdown(drm);
-	}
-}
-
-static void ili9341_shutdown(struct spi_device *spi)
-{
-	const struct spi_device_id *id = spi_get_device_id(spi);
-
-	if (!strcmp(id->name, "yx240qv29"))
-		drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+	ili9341_dpi_power_off(ili);
+	drm_panel_remove(&ili->panel);
 }
 
 static const struct of_device_id ili9341_of_match[] = {
@@ -758,19 +563,11 @@ static const struct of_device_id ili9341_of_match[] = {
 		.compatible = "st,sf-tc240t-9370-t",
 		.data = &ili9341_stm32f429_disco_data,
 	},
-	{
-		/* porting from tiny/ili9341.c
-		 * for original mipi dbi compitable
-		 */
-		.compatible = "adafruit,yx240qv29",
-		.data = NULL,
-	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9341_of_match);
 
 static const struct spi_device_id ili9341_id[] = {
-	{ "yx240qv29", 0 },
 	{ "sf-tc240t-9370-t", 0 },
 	{ }
 };
@@ -779,7 +576,6 @@ MODULE_DEVICE_TABLE(spi, ili9341_id);
 static struct spi_driver ili9341_driver = {
 	.probe = ili9341_probe,
 	.remove = ili9341_remove,
-	.shutdown = ili9341_shutdown,
 	.id_table = ili9341_id,
 	.driver = {
 		.name = "panel-ilitek-ili9341",
-- 
2.43.0.rc1.1336.g36b5255a03ac

