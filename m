Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A2157157
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50386EB89;
	Mon, 10 Feb 2020 08:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D369A6E854
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 18:06:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z12so2625560pgl.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2020 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HK6edd7Xmg3Ze31DS+f+AJalqKky8iLAkNTvj0Y+R9w=;
 b=Z+6NCnS15JR/dptNNzVpjukg8pTvMX/JGMH3+qSBm1YEAu4ZwA8qcp9rR6j+czNyWj
 KH7pklQmdKJVv07gJPEh2KYbhH8wWXVNchC97FEGak1ivgXdBwsEJnuRFz/Q3o07Rv4a
 BSgSv7H4/VAabsHSAhLlrFUXONB2u61eEGFP+iBHpPQHiHPdvFRE/zaO7yIiGXnxVeUx
 bj4psvGWGJQ8dMzO0JZbARfAgcj0j2Pqo7wiDy7g7xuKJCqQ3hNS8ddxGeU3GdK1A/vV
 qmnLk6INY+tWdDqFt/vMubbtNIsXCEs43CwdBTD4xUZRnWXpyKa7bYo9c/2tdkhK0cuh
 vyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HK6edd7Xmg3Ze31DS+f+AJalqKky8iLAkNTvj0Y+R9w=;
 b=jkwOnRZYm5ulALh672db0ZY6Pnih/C6SW3nCt8ZL4E7qgbtVt2EcWDLO4U/OA31mNA
 UsmX+I/etUeZMU7AGfFk7ZOVy39H1Y+r3hk12Sx4PjjOaSMZBTCzvTGqE2abVyYvkVoU
 FW2rxvx5I9R9TOmu+1lwIt/MZ2TuMVV4uMQoJwbD/YiXm2dUG7Mi2W95WYod+vq178gD
 XlAcAR7OUblUubB597D2v/+tFhQH0rzyOWOFsf96AJxc59Q32P1rh42abwmAH0u/yKGO
 vcXhHmdoE2vLFR0nuX/YHciLapjMFjc2zD0uSZJTKOlHh5Q/w+30cTGTQWMGfOij6uKH
 HEdA==
X-Gm-Message-State: APjAAAUqa5mYFucxUIjF/BwAMZmBj6ML21QFvOi+qTqSD9y2pJTsdSCv
 QBa93yTZKLpSMrPpTyD/hkw=
X-Google-Smtp-Source: APXvYqypCPq25qpWoAVyqYZshyQk4lAeARFWIhnqeEgWR2Ahl57qRBVdMoxKTU3tuPnlxlzfnBEunw==
X-Received: by 2002:a62:2a07:: with SMTP id q7mr9295718pfq.153.1581271607330; 
 Sun, 09 Feb 2020 10:06:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:508e:1313:1d5a:1ea5])
 by smtp.gmail.com with ESMTPSA id d24sm9849766pfq.75.2020.02.09.10.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 09 Feb 2020 10:06:46 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>
Subject: [PATCH v5 2/2] drm/tiny: add support for tft displays based on ilitek, ili9486
Date: Sun,  9 Feb 2020 23:36:41 +0530
Message-Id: <a9c8065c3ef7707650630b3b21a0c01d725fc5a0.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
References: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support fot ilitek,ili9486 based displays with shift register
in front of controller.
Ozzmaker,Piscreen and Waveshare,rpi-lcd-35 are such displays.

Acked-by: Sam Ravnborg <sam@ravnborg.org> (v4)
Reviewed-by: Noralf Tronnes <noralf@tronnes.org> (v4)
Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---

v2 changes:
* assignment of dbi_command before registration
* made dc and reset gpio compulsory
* typos and unwanted comments removed
* changed the name of function which were display specific
* arranged the Makefile entries in alphabetical order

v3 changes:
* no changes

v4 changes:
* no changes

v5 changes:
* replaced tinydrm with tiny in subject
* added Rb tag (Noralf) and Ab tag (Sam)
---
 MAINTAINERS                    |   7 +
 drivers/gpu/drm/tiny/Kconfig   |  14 ++
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ili9486.c | 283 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 305 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1196d07..af189ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5233,6 +5233,13 @@ S:	Maintained
 F:	drivers/gpu/drm/tiny/ili9225.c
 F:	Documentation/devicetree/bindings/display/ilitek,ili9225.txt
 
+DRM DRIVER FOR ILITEK ILI9486 PANELS
+M:	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+S:	Maintained
+F:	drivers/gpu/drm/tiny/ili9486.c
+F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
+
 DRM DRIVER FOR HX8357D PANELS
 M:	Eric Anholt <eric@anholt.net>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index a866421..4160e74 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -47,6 +47,20 @@ config TINYDRM_ILI9341
 
 	  If M is selected the module will be called ili9341.
 
+config TINYDRM_ILI9486
+	tristate "DRM support for ILI9486 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the following Ilitek ILI9486 panels:
+	  * PISCREEN 3.5" 320x480 TFT (Ozzmaker 3.5")
+	  * RPILCD 3.5" 320x480 TFT (Waveshare 3.5")
+
+	  If M is selected the module will be called ili9486.
+
 config TINYDRM_MI0283QT
 	tristate "DRM support for MI0283QT"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 896cf31..c96ceee 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
+obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
new file mode 100644
index 0000000..e960b16
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DRM driver for Ilitek ILI9486 panels
+ *
+ * Copyright 2020 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modeset_helper.h>
+
+#define ILI9486_ITFCTR1         0xb0
+#define ILI9486_PWCTRL1         0xc2
+#define ILI9486_VMCTRL1         0xc5
+#define ILI9486_PGAMCTRL        0xe0
+#define ILI9486_NGAMCTRL        0xe1
+#define ILI9486_DGAMCTRL        0xe2
+#define ILI9486_MADCTL_BGR      BIT(3)
+#define ILI9486_MADCTL_MV       BIT(5)
+#define ILI9486_MADCTL_MX       BIT(6)
+#define ILI9486_MADCTL_MY       BIT(7)
+
+/*
+ * The PiScreen/waveshare rpi-lcd-35 has a SPI to 16-bit parallel bus converter
+ * in front of the  display controller. This means that 8-bit values have to be
+ * transferred as 16-bit.
+ */
+static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par, size_t num)
+{
+	struct spi_device *spi = mipi->spi;
+	void *data = par;
+	u32 speed_hz;
+	int i, ret;
+	u16 *buf;
+
+	buf = kmalloc(32 * sizeof(u16), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/*
+	 * The displays are Raspberry Pi HATs and connected to the 8-bit only
+	 * SPI controller, so 16-bit command and parameters need byte swapping
+	 * before being transferred as 8-bit on the big endian SPI bus.
+	 * Pixel data bytes have already been swapped before this function is
+	 * called.
+	 */
+	buf[0] = cpu_to_be16(*cmd);
+	gpiod_set_value_cansleep(mipi->dc, 0);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 2);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, buf, 2);
+	if (ret || !num)
+		goto free;
+
+	/* 8-bit configuration data, not 16-bit pixel data */
+	if (num <= 32) {
+		for (i = 0; i < num; i++)
+			buf[i] = cpu_to_be16(par[i]);
+		num *= 2;
+		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+		data = buf;
+	}
+
+	gpiod_set_value_cansleep(mipi->dc, 1);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, data, num);
+ free:
+	kfree(buf);
+
+	return ret;
+}
+
+static void waveshare_enable(struct drm_simple_display_pipe *pipe,
+			   struct drm_crtc_state *crtc_state,
+			   struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, ILI9486_ITFCTR1);
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(250);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+
+	mipi_dbi_command(dbi, ILI9486_PWCTRL1, 0x44);
+
+	mipi_dbi_command(dbi, ILI9486_VMCTRL1, 0x00, 0x00, 0x00, 0x00);
+
+	mipi_dbi_command(dbi, ILI9486_PGAMCTRL,
+			 0x0F, 0x1F, 0x1C, 0x0C, 0x0F, 0x08, 0x48, 0x98,
+			 0x37, 0x0A, 0x13, 0x04, 0x11, 0x0D, 0x0);
+	mipi_dbi_command(dbi, ILI9486_NGAMCTRL,
+			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
+			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
+	mipi_dbi_command(dbi, ILI9486_DGAMCTRL,
+			 0x0F, 0x32, 0x2E, 0x0B, 0x0D, 0x05, 0x47, 0x75,
+			 0x37, 0x06, 0x10, 0x03, 0x24, 0x20, 0x00);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+
+ out_enable:
+	switch (dbidev->rotation) {
+	case 90:
+		addr_mode = ILI9486_MADCTL_MY;
+		break;
+	case 180:
+		addr_mode = ILI9486_MADCTL_MV;
+		break;
+	case 270:
+		addr_mode = ILI9486_MADCTL_MX;
+		break;
+	default:
+		addr_mode = ILI9486_MADCTL_MV | ILI9486_MADCTL_MY |
+			ILI9486_MADCTL_MX;
+		break;
+	}
+	addr_mode |= ILI9486_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+ out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
+	.enable = waveshare_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode waveshare_mode = {
+	DRM_SIMPLE_MODE(480, 320, 73, 49),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
+
+static struct drm_driver ili9486_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9486_fops,
+	.release		= mipi_dbi_release,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "ili9486",
+	.desc			= "Ilitek ILI9486",
+	.date			= "20200118",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id ili9486_of_match[] = {
+	{ .compatible = "waveshare,rpi-lcd-35" },
+	{ .compatible = "ozzmaker,piscreen" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ili9486_of_match);
+
+static const struct spi_device_id ili9486_id[] = {
+	{ "ili9486", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9486_id);
+
+static int ili9486_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	u32 rotation = 0;
+	int ret;
+
+	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
+	if (!dbidev)
+		return -ENOMEM;
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+	ret = devm_drm_dev_init(dev, drm, &ili9486_driver);
+	if (ret) {
+		kfree(dbidev);
+		return ret;
+	}
+
+	drm_mode_config_init(drm);
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
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
+	dbi->command = waveshare_command;
+	dbi->read_commands = NULL;
+
+	ret = mipi_dbi_dev_init(dbidev, &waveshare_pipe_funcs, &waveshare_mode, rotation);
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
+static int ili9486_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void ili9486_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver ili9486_spi_driver = {
+	.driver = {
+		.name = "ili9486",
+		.of_match_table = ili9486_of_match,
+	},
+	.id_table = ili9486_id,
+	.probe = ili9486_probe,
+	.remove = ili9486_remove,
+	.shutdown = ili9486_shutdown,
+};
+module_spi_driver(ili9486_spi_driver);
+
+MODULE_DESCRIPTION("Ilitek ILI9486 DRM driver");
+MODULE_AUTHOR("Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
