Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DC344F10
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 19:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869C26E536;
	Mon, 22 Mar 2021 18:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D6B76E536
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 18:50:46 +0000 (UTC)
Received: from hq-00021.fritz.box (p57bc9f6a.dip0.t-ipconnect.de
 [87.188.159.106])
 by mail.bugwerft.de (Postfix) with ESMTPSA id D80BE4C35D3;
 Mon, 22 Mar 2021 18:50:44 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v4 2/2] drm/tiny: add driver for newhaven,1.8-128160EF
Date: Mon, 22 Mar 2021 19:50:32 +0100
Message-Id: <20210322185032.762277-3-daniel@zonque.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322185032.762277-1-daniel@zonque.org>
References: <20210322185032.762277-1-daniel@zonque.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for Newhaven's NHD-1.8-128160EF display, featuring
an Ilitek ILI9163 controller.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/tiny/Kconfig   |  13 ++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ili9163.c | 224 +++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ili9163.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 2b6414f0fa759..9de0c0eeea6f5 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -41,6 +41,19 @@ config TINYDRM_HX8357D
 
 	  If M is selected the module will be called hx8357d.
 
+config TINYDRM_ILI9163
+	tristate "DRM support for ILI9163 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the following Ilitek ILI9163 panels:
+	  * NHD-1.8-128160EF 128x160 TFT
+
+	  If M is selected the module will be called ili9163.
+
 config TINYDRM_ILI9225
 	tristate "DRM support for ILI9225 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 6ae4e9e5a35fb..78016b2ed11b5 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
+obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
new file mode 100644
index 0000000000000..6fa9e59b69321
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modeset_helper.h>
+#include <video/mipi_display.h>
+
+#define ILI9163_FRMCTR1		0xb1
+
+#define ILI9163_PWCTRL1		0xc0
+#define ILI9163_PWCTRL2		0xc1
+#define ILI9163_VMCTRL1		0xc5
+#define ILI9163_VMCTRL2		0xc7
+#define ILI9163_PWCTRLA		0xcb
+#define ILI9163_PWCTRLB		0xcf
+
+#define ILI9163_EN3GAM		0xf2
+
+#define ILI9163_MADCTL_BGR	BIT(3)
+#define ILI9163_MADCTL_MV	BIT(5)
+#define ILI9163_MADCTL_MX	BIT(6)
+#define ILI9163_MADCTL_MY	BIT(7)
+
+static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	drm_dbg_kms(&dbidev->drm, "\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	/* Gamma */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x04);
+	mipi_dbi_command(dbi, ILI9163_EN3GAM, 0x00);
+
+	/* Frame Rate */
+	mipi_dbi_command(dbi, ILI9163_FRMCTR1, 0x0a, 0x14);
+
+	/* Power Control */
+	mipi_dbi_command(dbi, ILI9163_PWCTRL1, 0x0a, 0x00);
+	mipi_dbi_command(dbi, ILI9163_PWCTRL2, 0x02);
+
+	/* VCOM */
+	mipi_dbi_command(dbi, ILI9163_VMCTRL1, 0x2f, 0x3e);
+	mipi_dbi_command(dbi, ILI9163_VMCTRL2, 0x40);
+
+	/* Memory Access Control */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
+
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(100);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+
+out_enable:
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = 0;
+		break;
+	case 90:
+		addr_mode = ILI9163_MADCTL_MV | ILI9163_MADCTL_MX;
+		break;
+	case 180:
+		addr_mode = ILI9163_MADCTL_MX | ILI9163_MADCTL_MY;
+		break;
+	case 270:
+		addr_mode = ILI9163_MADCTL_MV | ILI9163_MADCTL_MY;
+		break;
+	}
+	addr_mode |= ILI9163_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs = {
+	.enable = yx240qv29_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode yx240qv29_mode = {
+	DRM_SIMPLE_MODE(128, 160, 28, 35),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9163_fops);
+
+static struct drm_driver ili9163_driver = {
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.date			= "20210208",
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.desc			= "Ilitek ILI9163",
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9163_fops,
+	.major			= 1,
+	.minor			= 0,
+	.name			= "ili9163",
+};
+
+static const struct of_device_id ili9163_of_match[] = {
+	{ .compatible = "newhaven,1.8-128160EF" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ili9163_of_match);
+
+static const struct spi_device_id ili9163_id[] = {
+	{ "nhd-1.8-128160EF", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9163_id);
+
+static int ili9163_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &ili9163_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		drm_err(drm, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		drm_err(drm, "Failed to get gpio 'dc'\n");
+		return PTR_ERR(dc);
+	}
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_dev_init(dbidev, &ili9163_pipe_funcs, &yx240qv29_mode, rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	spi_set_drvdata(spi, drm);
+
+	return 0;
+}
+
+static int ili9163_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void ili9163_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver ili9163_spi_driver = {
+	.driver = {
+		.name = "ili9163",
+		.of_match_table = ili9163_of_match,
+	},
+	.id_table = ili9163_id,
+	.probe = ili9163_probe,
+	.remove = ili9163_remove,
+	.shutdown = ili9163_shutdown,
+};
+module_spi_driver(ili9163_spi_driver);
+
+MODULE_DESCRIPTION("Ilitek ILI9163 DRM driver");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
+MODULE_LICENSE("GPL");
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
