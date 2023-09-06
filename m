Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290907942E9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD210E6EB;
	Wed,  6 Sep 2023 18:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98BE10E055
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1694017834;
 x=1725553834;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aUAwXvtXGHutTByOh+hjaBOyIhjW4Rjz+jAnGbHGoFs=;
 b=obpmWHyycMXfxTvDInFgqrbN1/sigewgU1fwsOaSLB5Uy5lhxcxjswUR
 n7Qf17t2B4lVmh7fvojwqGEfV+kn7oaYv2toZ8Yj3hX4xBPFPJ/W0KrYP
 kFF8Xw/H+0WFZQrMqx4Fkc5S0fmxWW2KCIr46al/orawlMpW0H2APvLPW
 1RjCTaJ8RTdHh4udGfchQOFp1iP/8o7MABGPe2j1Hyz/koTYSA4hnwCTi
 n6RhnvxCqszgyGp9loJ5Llxdl8b/aojM8iW6MF9tGi3oSLfQT6bqByX64
 HclSMLYHfPBQpvXTqwlQIUE61psgTV7PeXAqoDn2tF/VV+BIaB/bJUFAm A==;
From: Stefan x Nilsson <stefan.x.nilsson@axis.com>
Date: Wed, 6 Sep 2023 18:22:17 +0200
Subject: [PATCH 2/2] drm: tiny: Add st7735s driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230906-st7735s-v1-2-add92677c190@axis.com>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
In-Reply-To: <20230906-st7735s-v1-0-add92677c190@axis.com>
To: David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:15:36 +0000
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
Cc: Stefan x Nilsson <stefan.x.nilsson@axis.com>, devicetree@vger.kernel.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for Sitronix st7735s display controller, as well as a
Winstar wf0096atyaa3dnn0 0.96" 80x160 TFT panel.

The driver code is very similar to st7735r, but with adaptations for
the pipe_enable function. There is also optional support to specify
a power regulator for the display.

Signed-off-by: Stefan x Nilsson <stefan.x.nilsson@axis.com>
---
 MAINTAINERS                    |   1 +
 drivers/gpu/drm/tiny/Kconfig   |  14 +++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/st7735s.c | 264 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 280 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c00b2b9086f2..f24295d691e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6733,6 +6733,7 @@ M:	Stefan x Nilsson <stefan.x.nilsson@axis.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
+F:	drivers/gpu/drm/tiny/st7735s.c
 
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..2917f5412ddd 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -212,3 +212,17 @@ config TINYDRM_ST7735R
 	  * Okaya RH128128T 1.44" 128x128 TFT
 
 	  If M is selected the module will be called st7735r.
+
+config TINYDRM_ST7735S
+	tristate "DRM support for Sitronix ST7735S display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for Sitronix ST7735S with one of the following
+	  LCDs:
+	  * Winstar WF0096ATYAA3DNN0 0.96" 80x160 Color TFT
+
+	  If M is selected the module will be called st7735s.
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b..2e805c5b6f16 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_TINYDRM_ST7735S)		+= st7735s.o
diff --git a/drivers/gpu/drm/tiny/st7735s.c b/drivers/gpu/drm/tiny/st7735s.c
new file mode 100644
index 000000000000..42290f4128db
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7735s.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for display panels connected to a Sitronix ST7735S
+ * display controller in SPI mode.
+ *
+ * Copyright (C) 2023 Axis Communications AB
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+
+#define ST7735S_FRMCTR1		0xb1
+#define ST7735S_FRMCTR2		0xb2
+#define ST7735S_FRMCTR3		0xb3
+#define ST7735S_INVCTR		0xb4
+#define ST7735S_PWCTR1		0xc0
+#define ST7735S_PWCTR2		0xc1
+#define ST7735S_PWCTR3		0xc2
+#define ST7735S_PWCTR4		0xc3
+#define ST7735S_PWCTR5		0xc4
+#define ST7735S_VMCTR1		0xc5
+#define ST7735S_GAMCTRP1	0xe0
+#define ST7735S_GAMCTRN1	0xe1
+
+#define ST7735S_MY	BIT(7)
+#define ST7735S_MX	BIT(6)
+#define ST7735S_MV	BIT(5)
+#define ST7735S_RGB	BIT(3)
+
+struct st7735s_cfg {
+	const struct drm_display_mode mode;
+	unsigned int left_offset;
+	unsigned int top_offset;
+	unsigned int write_only:1;
+	unsigned int rgb:1;		/* RGB (vs. BGR) */
+};
+
+struct st7735s_priv {
+	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
+	const struct st7735s_cfg *cfg;
+};
+
+static void st7735s_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct st7735s_priv *priv = container_of(dbidev, struct st7735s_priv,
+						 dbidev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	int ret, idx;
+	u8 addr_mode;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_reset(dbidev);
+	if (ret)
+		goto out_exit;
+
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(120);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+
+	mipi_dbi_command(dbi, ST7735S_FRMCTR1, 0x05, 0x3c, 0x3c);
+	mipi_dbi_command(dbi, ST7735S_FRMCTR2, 0x05, 0x3c, 0x3c);
+	mipi_dbi_command(dbi, ST7735S_FRMCTR3, 0x05, 0x3c, 0x3c, 0x05, 0x3c, 0x3c);
+	mipi_dbi_command(dbi, ST7735S_INVCTR, 0x07);
+	mipi_dbi_command(dbi, ST7735S_PWCTR1, 0xe9, 0x09, 0x04);
+	mipi_dbi_command(dbi, ST7735S_PWCTR2, 0xc5);
+	mipi_dbi_command(dbi, ST7735S_PWCTR3, 0x0d, 0x00);
+	mipi_dbi_command(dbi, ST7735S_PWCTR4, 0x8d, 0x6a);
+	mipi_dbi_command(dbi, ST7735S_PWCTR5, 0x8a, 0xee);
+	mipi_dbi_command(dbi, ST7735S_VMCTR1, 0x15);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
+	/* Enable gate power save mode */
+	mipi_dbi_command(dbi, 0xFC, 0xC0);
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = ST7735S_MX | ST7735S_MY;
+		break;
+	case 90:
+		addr_mode = ST7735S_MX | ST7735S_MV;
+		break;
+	case 180:
+		addr_mode = 0;
+		break;
+	case 270:
+		addr_mode = ST7735S_MY | ST7735S_MV;
+		break;
+	}
+
+	if (priv->cfg->rgb)
+		addr_mode |= ST7735S_RGB;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
+			 MIPI_DCS_PIXEL_FMT_16BIT);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x01, 0x00, 0xa0);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x1a, 0x00, 0x69);
+	mipi_dbi_command(dbi, ST7735S_GAMCTRP1, 0x07, 0x0e, 0x08, 0x07, 0x10,
+			 0x07, 0x02, 0x07, 0x09, 0x0f, 0x25, 0x36, 0x00, 0x08,
+			 0x04, 0x10);
+	mipi_dbi_command(dbi, ST7735S_GAMCTRN1, 0x0a, 0x0d, 0x08, 0x07, 0x0f,
+			 0x07, 0x02, 0x07, 0x09, 0x0f, 0x25, 0x35, 0x00, 0x09,
+			 0x04, 0x10);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7735s_pipe_funcs = {
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7735s_pipe_enable),
+};
+
+static const struct st7735s_cfg wf0096atyaa3dnn0_cfg = {
+	.mode		= { DRM_SIMPLE_MODE(80, 160, 11, 22) },
+	.left_offset	= 1,
+	.top_offset	= 26,
+	.write_only	= true,
+	.rgb		= true,
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7735s_fops);
+
+static const struct drm_driver st7735s_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &st7735s_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "st7735s",
+	.desc			= "Sitronix ST7735S",
+	.date			= "20230825",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id st7735s_of_match[] = {
+	{ .compatible = "winstar,wf0096atyaa3dnn0", .data = &wf0096atyaa3dnn0_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, st7735s_of_match);
+
+static const struct spi_device_id st7735s_id[] = {
+	{ "wf0096atyaa3dnn0", (uintptr_t)&wf0096atyaa3dnn0_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, st7735s_id);
+
+static int st7735s_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	const struct st7735s_cfg *cfg;
+	struct mipi_dbi_dev *dbidev;
+	struct st7735s_priv *priv;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	int ret;
+
+	cfg = device_get_match_data(&spi->dev);
+	if (!cfg)
+		cfg = (void *)spi_get_device_id(spi)->driver_data;
+
+	priv = devm_drm_dev_alloc(dev, &st7735s_driver,
+				  struct st7735s_priv, dbidev.drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	dbidev = &priv->dbidev;
+	priv->cfg = cfg;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	dbidev->regulator = devm_regulator_get(dev, "power");
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	if (cfg->write_only)
+		dbi->read_commands = NULL;
+
+	dbidev->left_offset = cfg->left_offset;
+	dbidev->top_offset = cfg->top_offset;
+
+	ret = mipi_dbi_dev_init(dbidev, &st7735s_pipe_funcs, &cfg->mode,
+				rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static void st7735s_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void st7735s_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver st7735s_spi_driver = {
+	.driver = {
+		.name = "st7735s",
+		.of_match_table = st7735s_of_match,
+	},
+	.id_table = st7735s_id,
+	.probe = st7735s_probe,
+	.remove = st7735s_remove,
+	.shutdown = st7735s_shutdown,
+};
+module_spi_driver(st7735s_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7735S DRM driver");
+MODULE_LICENSE("GPL");

-- 
2.30.2

