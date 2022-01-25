Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63849BABD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C7F10E3D8;
	Tue, 25 Jan 2022 17:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0410E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id DB27720E65;
 Tue, 25 Jan 2022 18:57:22 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Date: Tue, 25 Jan 2022 18:57:00 +0100
Message-Id: <20220125175700.37408-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220125175700.37408-1-noralf@tronnes.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f6Fm+t6M c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=e5mUnYsNAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=OmdZnWstKs0O7H47XUoA:9
 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver that will work with most MIPI DBI compatible SPI panels.
This avoids adding a driver for every new MIPI DBI compatible controller
that is to be used by Linux. The 'compatible' Device Tree property with
a '.bin' suffix will be used to load a firmware file that contains the
controller configuration.

Example (driver will load sainsmart18.bin):

display@0 {
	compatible = "sainsmart18", "panel-mipi-dbi-spi";
	reg = <0>;
	reset-gpios = <&gpio 25 0>;
	dc-gpios = <&gpio 24 0>;
};

v2:
- Drop model property and use compatible instead (Rob)
- Add wiki entry in MAINTAINERS

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 MAINTAINERS                            |   8 +
 drivers/gpu/drm/panel/Kconfig          |  11 +
 drivers/gpu/drm/panel/Makefile         |   1 +
 drivers/gpu/drm/panel/panel-mipi-dbi.c | 394 +++++++++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-mipi-dbi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..8baa98723bdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6047,6 +6047,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 F:	drivers/gpu/drm/tiny/mi0283qt.c
 
+DRM DRIVER FOR MIPI DBI compatible panels
+M:	Noralf Trønnes <noralf@tronnes.org>
+S:	Maintained
+W:	https://github.com/notro/panel-mipi-dbi/wiki
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+F:	drivers/gpu/drm/panel/panel-mipi-dbi.c
+
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
 M:	Sean Paul <sean@poorly.run>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 434c2861bb40..1851cda5f877 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -274,6 +274,17 @@ config DRM_PANEL_LG_LG4573
 	  Say Y here if you want to enable support for LG4573 RGB panel.
 	  To compile this driver as a module, choose M here.
 
+config DRM_PANEL_MIPI_DBI
+	tristate "MIPI DBI compatible panel"
+	depends on SPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for MIPI DBI compatible panels.
+	  To compile this driver as a module, choose M here.
+
 config DRM_PANEL_NEC_NL8048HL11
 	tristate "NEC NL8048HL11 RGB panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index d99fbbce49d1..a90c30459964 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
+obj-$(CONFIG_DRM_PANEL_MIPI_DBI) += panel-mipi-dbi.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
diff --git a/drivers/gpu/drm/panel/panel-mipi-dbi.c b/drivers/gpu/drm/panel/panel-mipi-dbi.c
new file mode 100644
index 000000000000..6e3dc2de21d2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-mipi-dbi.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DRM driver for MIPI DBI compatible display panels
+ *
+ * Copyright 2022 Noralf Trønnes
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modeset_helper.h>
+#include <video/mipi_display.h>
+
+static const u8 panel_mipi_dbi_magic[15] = { 'M', 'I', 'P', 'I', ' ', 'D', 'B', 'I',
+					     0, 0, 0, 0, 0, 0, 0 };
+
+/*
+ * The display panel configuration is stored in a firmware file. The Device Tree 'compatible'
+ * property value with a '.bin' suffix is passed to request_firmware() to fetch this file.
+ */
+struct panel_mipi_dbi_config {
+	/* Magic string: panel_mipi_dbi_magic */
+	u8 magic[15];
+
+	/* Config file format version */
+	u8 file_format_version;
+
+	/* Width in pixels */
+	__be16 width;
+	/* Height in pixels */
+	__be16 height;
+
+	/* Width in millimeters (optional) */
+	__be16 width_mm;
+	/* Height in millimeters (optional) */
+	__be16 height_mm;
+
+	/* X-axis panel offset */
+	__be16 x_offset;
+	/* Y-axis panel offset */
+	__be16 y_offset;
+
+	/* 4 pad bytes, must be zero */
+	u8 pad[4];
+
+	/*
+	 * Optional MIPI commands to execute when the display pipeline is enabled.
+	 * This can be used to configure the display controller.
+	 *
+	 * The commands are stored in a byte array with the format:
+	 *     command, num_parameters, [ parameter, ...], command, ...
+	 *
+	 * Some commands require a pause before the next command can be received.
+	 * Inserting a delay in the command sequence is done by using the NOP command with one
+	 * parameter: delay in miliseconds (the No Operation command is part of the MIPI Display
+	 * Command Set where it has no parameters).
+	 *
+	 * Example:
+	 *     command 0x11
+	 *     sleep 120ms
+	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
+	 *     command 0x29
+	 *
+	 * Byte sequence:
+	 *     0x11 0x00
+	 *     0x00 0x01 0x78
+	 *     0xb1 0x03 0x01 0x2c 0x2d
+	 *     0x29 0x00
+	 */
+	u8 commands[];
+};
+
+struct panel_mipi_dbi_commands {
+	const u8 *buf;
+	size_t len;
+};
+
+static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct panel_mipi_dbi_commands *commands = dbidev->driver_private;
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	unsigned int i = 0;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	drm_dbg(pipe->crtc.dev, "\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	if (!commands)
+		goto out_enable;
+
+	while (i < commands->len) {
+		u8 command = commands->buf[i++];
+		u8 num_parameters = commands->buf[i++];
+		const u8 *parameters = &commands->buf[i];
+
+		if (command == 0x00 && num_parameters == 1)
+			msleep(parameters[0]);
+		else if (num_parameters)
+			mipi_dbi_command_stackbuf(dbi, command, parameters, num_parameters);
+		else
+			mipi_dbi_command(dbi, command);
+
+		i += num_parameters;
+	}
+
+out_enable:
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs panel_mipi_dbi_pipe_funcs = {
+	.enable = panel_mipi_dbi_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(panel_mipi_dbi_fops);
+
+static const struct drm_driver panel_mipi_dbi_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &panel_mipi_dbi_fops,
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "panel-mipi-dbi",
+	.desc			= "MIPI DBI compatible display panel",
+	.date			= "20220103",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static int panel_mipi_dbi_parse_config(struct mipi_dbi_dev *dbidev,
+				       struct drm_display_mode *mode,
+				       const struct firmware *fw)
+{
+	const struct panel_mipi_dbi_config *config = (struct panel_mipi_dbi_config *)fw->data;
+	unsigned int width, height, x_offset, y_offset;
+	struct panel_mipi_dbi_commands *commands;
+	struct drm_device *drm = &dbidev->drm;
+	struct device *dev = dbidev->drm.dev;
+	size_t size = fw->size, commands_len;
+	unsigned int i = 0;
+
+	if (size < sizeof(*config)) {
+		dev_err(dev, "config: file size=%zu is too small\n", size);
+		return -EINVAL;
+	}
+
+	if (memcmp(config->magic, panel_mipi_dbi_magic, sizeof(config->magic))) {
+		dev_err(dev, "config: Bad magic: %15ph\n", config->magic);
+		return -EINVAL;
+	}
+
+	if (config->file_format_version != 1) {
+		dev_err(dev, "config: version=%u is not supported\n", config->file_format_version);
+		return -EINVAL;
+	}
+
+	width = be16_to_cpu(config->width);
+	height = be16_to_cpu(config->height);
+	x_offset = be16_to_cpu(config->x_offset);
+	y_offset = be16_to_cpu(config->y_offset);
+
+	drm_dbg(drm, "size=%zu version=%u\n", size, config->file_format_version);
+	drm_dbg(drm, "width=%u height=%u\n", width, height);
+	drm_dbg(drm, "x_offset=%u y_offset=%u\n", x_offset, y_offset);
+
+	if (width && height) {
+		struct drm_display_mode simple_mode = {
+			DRM_SIMPLE_MODE(width, height, be16_to_cpu(config->width_mm),
+					be16_to_cpu(config->height_mm))
+		};
+
+		*mode = simple_mode;
+	} else {
+		dev_err(dev, "config: width or height can't be zero\n");
+		return -EINVAL;
+	}
+
+	dbidev->left_offset = x_offset;
+	dbidev->top_offset = y_offset;
+
+	commands_len = size - sizeof(*config);
+	if (!commands_len)
+		return 0;
+
+	while ((i + 1) < commands_len) {
+		u8 command = config->commands[i++];
+		u8 num_parameters = config->commands[i++];
+		const u8 *parameters = &config->commands[i];
+
+		i += num_parameters;
+		if (i > commands_len) {
+			dev_err(dev, "config: command=0x%02x num_parameters=%u overflows\n",
+				command, num_parameters);
+			return -EINVAL;
+		}
+
+		if (command == 0x00 && num_parameters == 1)
+			drm_dbg(drm, "sleep %ums\n", parameters[0]);
+		else
+			drm_dbg(drm, "command %02x %*ph\n", command, num_parameters, parameters);
+	}
+
+	if (i != commands_len) {
+		dev_err(dev, "config: malformed command array\n");
+		return -EINVAL;
+	}
+
+	commands = devm_kzalloc(dev, sizeof(*commands), GFP_KERNEL);
+	if (!commands)
+		return -ENOMEM;
+
+	commands->len = commands_len;
+	commands->buf = devm_kmemdup(dev, config->commands, commands->len, GFP_KERNEL);
+	if (!commands->buf)
+		return -ENOMEM;
+
+	dbidev->driver_private = commands;
+
+	return 0;
+}
+
+static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct drm_display_mode mode;
+	struct mipi_dbi_dev *dbidev;
+	const struct firmware *fw;
+	const char *compatible;
+	struct drm_device *drm;
+	struct property *prop;
+	bool fw_found = false;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	char fw_name[40];
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	of_property_for_each_string(dev->of_node, "compatible", prop, compatible) {
+		snprintf(fw_name, sizeof(fw_name), "%s.bin", compatible);
+
+		ret = firmware_request_nowarn(&fw, fw_name, dev);
+		if (ret) {
+			drm_dbg(drm, "No config file found for compatible: '%s' (error=%d)\n",
+				compatible, ret);
+			continue;
+		}
+
+		ret = panel_mipi_dbi_parse_config(dbidev, &mode, fw);
+		release_firmware(fw);
+		if (ret)
+			return ret;
+
+		fw_found = true;
+		break;
+	}
+
+	if (!fw_found) {
+		dev_err(dev, "No config file found\n");
+		return -ENOENT;
+	}
+
+	dbidev->regulator = devm_regulator_get(dev, "power");
+	if (IS_ERR(dbidev->regulator))
+		return dev_err_probe(dev, PTR_ERR(dbidev->regulator),
+				     "Failed to get regulator 'power'\n");
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return dev_err_probe(dev, PTR_ERR(dbidev->backlight), "Failed to get backlight\n");
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	if (device_property_present(dev, "write-only"))
+		dbi->read_commands = NULL;
+
+	ret = mipi_dbi_dev_init(dbidev, &panel_mipi_dbi_pipe_funcs, &mode, 0);
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
+static int panel_mipi_dbi_spi_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static void panel_mipi_dbi_spi_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static int __maybe_unused panel_mipi_dbi_pm_suspend(struct device *dev)
+{
+	return drm_mode_config_helper_suspend(dev_get_drvdata(dev));
+}
+
+static int __maybe_unused panel_mipi_dbi_pm_resume(struct device *dev)
+{
+	drm_mode_config_helper_resume(dev_get_drvdata(dev));
+
+	return 0;
+}
+
+static const struct dev_pm_ops panel_mipi_dbi_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(panel_mipi_dbi_pm_suspend, panel_mipi_dbi_pm_resume)
+};
+
+static const struct of_device_id panel_mipi_dbi_spi_of_match[] = {
+	{ .compatible = "panel-mipi-dbi-spi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, panel_mipi_dbi_spi_of_match);
+
+static const struct spi_device_id panel_mipi_dbi_spi_id[] = {
+	{ "panel-mipi-dbi-spi", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, panel_mipi_dbi_spi_id);
+
+static struct spi_driver panel_mipi_dbi_spi_driver = {
+	.driver = {
+		.name = "panel-mipi-dbi-spi",
+		.owner = THIS_MODULE,
+		.of_match_table = panel_mipi_dbi_spi_of_match,
+		.pm = &panel_mipi_dbi_pm_ops,
+	},
+	.id_table = panel_mipi_dbi_spi_id,
+	.probe = panel_mipi_dbi_spi_probe,
+	.remove = panel_mipi_dbi_spi_remove,
+	.shutdown = panel_mipi_dbi_spi_shutdown,
+};
+module_spi_driver(panel_mipi_dbi_spi_driver);
+
+MODULE_DESCRIPTION("MIPI DBI compatible display panel driver");
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
-- 
2.33.0

