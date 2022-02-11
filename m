Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D844B26AC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A910EB63;
	Fri, 11 Feb 2022 13:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682710EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 02C38800C9;
 Fri, 11 Feb 2022 14:05:02 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v3 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Date: Fri, 11 Feb 2022 14:04:34 +0100
Message-Id: <20220211130434.20732-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220211130434.20732-1-noralf@tronnes.org>
References: <20220211130434.20732-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Adef4UfG c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=e5mUnYsNAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=7KxegTkcCtkjIeqLvncA:9
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
...
};

v3:
- Move properties to DT (Maxime)
- The MIPI DPI spec has optional support for DPI where the controller is
  configured over DBI. Rework the command functions so they can be moved
  to drm_mipi_dbi and shared with a future panel-mipi-dpi-spi driver

v2:
- Drop model property and use compatible instead (Rob)
- Add wiki entry in MAINTAINERS

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 MAINTAINERS                            |   8 +
 drivers/gpu/drm/panel/Kconfig          |  13 +
 drivers/gpu/drm/panel/Makefile         |   1 +
 drivers/gpu/drm/panel/panel-mipi-dbi.c | 413 +++++++++++++++++++++++++
 4 files changed, 435 insertions(+)
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
index 434c2861bb40..a83349e91cb6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -274,6 +274,19 @@ config DRM_PANEL_LG_LG4573
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
+	  Say Y here if you want to enable support for MIPI DBI compatible
+	  panels. The controller command setup can be provided using a
+	  firmware file.
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
index 000000000000..9240fdec38d6
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-mipi-dbi.c
@@ -0,0 +1,413 @@
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
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+static const u8 panel_mipi_dbi_magic[15] = { 'M', 'I', 'P', 'I', ' ', 'D', 'B', 'I',
+					     0, 0, 0, 0, 0, 0, 0 };
+
+/*
+ * The optional display controller configuration is stored in a firmware file.
+ * The Device Tree 'compatible' property value with a '.bin' suffix is passed
+ * to request_firmware() to fetch this file.
+ */
+struct panel_mipi_dbi_config {
+	/* Magic string: panel_mipi_dbi_magic */
+	u8 magic[15];
+
+	/* Config file format version */
+	u8 file_format_version;
+
+	/*
+	 * MIPI commands to execute when the display pipeline is enabled.
+	 * This is used to configure the display controller.
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
+static struct panel_mipi_dbi_commands *
+panel_mipi_dbi_check_commands(struct device *dev, const struct firmware *fw)
+{
+	const struct panel_mipi_dbi_config *config = (struct panel_mipi_dbi_config *)fw->data;
+	struct panel_mipi_dbi_commands *commands;
+	size_t size = fw->size, commands_len;
+	unsigned int i = 0;
+
+	if (size < sizeof(*config) + 2) { /* At least 1 command */
+		dev_err(dev, "config: file size=%zu is too small\n", size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (memcmp(config->magic, panel_mipi_dbi_magic, sizeof(config->magic))) {
+		dev_err(dev, "config: Bad magic: %15ph\n", config->magic);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (config->file_format_version != 1) {
+		dev_err(dev, "config: version=%u is not supported\n", config->file_format_version);
+		return ERR_PTR(-EINVAL);
+	}
+
+	drm_dev_dbg(dev, DRM_UT_DRIVER, "size=%zu version=%u\n", size, config->file_format_version);
+
+	commands_len = size - sizeof(*config);
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
+			return ERR_PTR(-EINVAL);
+		}
+
+		if (command == 0x00 && num_parameters == 1)
+			drm_dev_dbg(dev, DRM_UT_DRIVER, "sleep %ums\n", parameters[0]);
+		else
+			drm_dev_dbg(dev, DRM_UT_DRIVER, "command %02x %*ph\n",
+				    command, num_parameters, parameters);
+	}
+
+	if (i != commands_len) {
+		dev_err(dev, "config: malformed command array\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	commands = devm_kzalloc(dev, sizeof(*commands), GFP_KERNEL);
+	if (!commands)
+		return ERR_PTR(-ENOMEM);
+
+	commands->len = commands_len;
+	commands->buf = devm_kmemdup(dev, config->commands, commands->len, GFP_KERNEL);
+	if (!commands->buf)
+		return ERR_PTR(-ENOMEM);
+
+	return commands;
+}
+
+static struct panel_mipi_dbi_commands *panel_mipi_dbi_commands_from_fw(struct device *dev)
+{
+	struct panel_mipi_dbi_commands *commands;
+	const struct firmware *fw;
+	const char *compatible;
+	struct property *prop;
+	char fw_name[40];
+	int ret;
+
+	of_property_for_each_string(dev->of_node, "compatible", prop, compatible) {
+		snprintf(fw_name, sizeof(fw_name), "%s.bin", compatible);
+		ret = firmware_request_nowarn(&fw, fw_name, dev);
+		if (ret) {
+			drm_dev_dbg(dev, DRM_UT_DRIVER,
+				    "No config file found for compatible: '%s' (error=%d)\n",
+				    compatible, ret);
+			continue;
+		}
+
+		commands = panel_mipi_dbi_check_commands(dev, fw);
+		release_firmware(fw);
+		return commands;
+	}
+
+	return NULL;
+}
+
+static void panel_mipi_dbi_commands_execute(struct mipi_dbi *dbi,
+					    struct panel_mipi_dbi_commands *commands)
+{
+	unsigned int i = 0;
+
+	if (!commands)
+		return;
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
+}
+
+static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
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
+	if (!ret)
+		panel_mipi_dbi_commands_execute(dbi, dbidev->driver_private);
+
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
+static int panel_mipi_dbi_get_mode(struct mipi_dbi_dev *dbidev, struct drm_display_mode *mode)
+{
+	struct device *dev = dbidev->drm.dev;
+	u32 width_mm = 0, height_mm = 0;
+	struct display_timing timing;
+	struct videomode vm;
+	int ret;
+
+	ret = of_get_display_timing(dev->of_node, "panel-timing", &timing);
+	if (ret) {
+		dev_err(dev, "%pOF: failed to get panel-timing (error=%d)\n", dev->of_node, ret);
+		return ret;
+	}
+
+	videomode_from_timing(&timing, &vm);
+
+	if (!vm.hactive || vm.hfront_porch || vm.hsync_len ||
+	    (vm.hback_porch + vm.hactive) > 0xffff ||
+	    !vm.vactive || vm.vfront_porch || vm.vsync_len ||
+	    (vm.vback_porch + vm.vactive) > 0xffff ||
+	    vm.flags) {
+		dev_err(dev, "%pOF: panel-timing out of bounds\n", dev->of_node);
+		return -EINVAL;
+	}
+
+	/* The driver doesn't use the pixel clock but it is mandatory so fake one if not set */
+	if (!vm.pixelclock)
+		vm.pixelclock = (vm.hback_porch + vm.hactive) * (vm.vback_porch + vm.vactive) * 60;
+
+	dbidev->top_offset = vm.vback_porch;
+	dbidev->left_offset = vm.hback_porch;
+
+	memset(mode, 0, sizeof(*mode));
+	drm_display_mode_from_videomode(&vm, mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+
+	ret = device_property_read_u32(dev, "width-mm", &width_mm);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = device_property_read_u32(dev, "height-mm", &height_mm);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	mode->width_mm = width_mm;
+	mode->height_mm = height_mm;
+
+	drm_mode_debug_printmodeline(mode);
+
+	return 0;
+}
+
+static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct drm_display_mode mode;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	ret = panel_mipi_dbi_get_mode(dbidev, &mode);
+	if (ret)
+		return ret;
+
+	dbidev->regulator = devm_regulator_get(dev, "power");
+	if (IS_ERR(dbidev->regulator))
+		return dev_err_probe(dev, PTR_ERR(dbidev->regulator),
+				     "Failed to get regulator 'power'\n");
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return dev_err_probe(dev, PTR_ERR(dbidev->backlight), "Failed to get backlight\n");
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	if (device_property_present(dev, "write-only"))
+		dbi->read_commands = NULL;
+
+	dbidev->driver_private = panel_mipi_dbi_commands_from_fw(dev);
+	if (IS_ERR(dbidev->driver_private))
+		return PTR_ERR(dbidev->driver_private);
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

