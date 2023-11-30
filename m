Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE77FF185
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6142910E708;
	Thu, 30 Nov 2023 14:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4768010E708
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c109ed07aso960938a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701353844; x=1701958644;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6qwsW/DQEq0A6OXLcfcgsxgL5/NA79mBjop/NNYrlM=;
 b=np6AsKdbQDbVpqVdCDDL2hvdAkgLfTU4Mkt+2MnvyrSdG5RbzBfOOZ8Gq4v91WK8YJ
 yv+aELZGMmkE6MH5tR96s7U45Q7VDrBotSe4MS80I8uRIuwLnGZAKiuy7ijKZb0PAHfd
 dOEKXiUIW1u6sF2CzEVOaHoV+a3QhHMvc42Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353844; x=1701958644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6qwsW/DQEq0A6OXLcfcgsxgL5/NA79mBjop/NNYrlM=;
 b=Tx8I7XguImTv5PHCSmJvTusJXsEQ8PUPONQbp1A+2d7o94hJZkc9Az7/SI6EQh8ACE
 ML1uF2wt1GZMXvSs0FQVHEOxw+zC7U9jwgU3aJrmkxw7lzDKjRwP0wxd0FgW5YxVK2RD
 EJ4tH0PCjstdbcML34xpBG7rRRtRjcVPY0YYR1szA6ZHgBRjYgCvqH6075Icarr5WOPK
 xtsf0WMCPNIGwUA9Clzdd6+YNDNVPjq9cNMHr2Oyu3oHEWgwDOX4b9ii15e2kO7BkE8I
 2yB+FtgVyRWwQVO6PANvLZBp8vZS+2VAC5kPZWYGuPQIv1Z7aJJAFwrdGAzfQ5/wQUxF
 EOlA==
X-Gm-Message-State: AOJu0YyMOeXPU0LLFLMbk9E+d0gipJcsGqB7vj9odepI/pnE8npnIkHC
 KmThsYaeA3bHy5k75jL71IFzsQ==
X-Google-Smtp-Source: AGHT+IENk/6chXEzUVKWUhktf6sCJPN7dhR3qR9d3cqxh0sYz4rr2RyHV3mPNX0O5EdRH4u680/YMA==
X-Received: by 2002:a17:906:1006:b0:a18:7350:82d with SMTP id
 6-20020a170906100600b00a187350082dmr1674188ejm.16.1701353843643; 
 Thu, 30 Nov 2023 06:17:23 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009f28db2b702sm716064ejc.209.2023.11.30.06.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:17:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] drm/panel: Add Ilitek ILI9805 panel driver
Date: Thu, 30 Nov 2023 15:16:25 +0100
Message-ID: <20231130141705.1796672-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
References: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

The GPM1790A0 panel is based on the Ilitek ILI9805 Controller.
Add a driver for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 MAINTAINERS                                  |   6 +
 drivers/gpu/drm/panel/Kconfig                |   9 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 365 +++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c373764b6e64..a89fbc811dc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6647,6 +6647,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
+DRM DRIVER FOR ILITEK ILI9805 PANELS
+M:	Michael Trimarchi <michael@amarulasolutions.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d018702be3dc..dad938cf6dec 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -194,6 +194,15 @@ config DRM_PANEL_ILITEK_ILI9341
 	  QVGA (240x320) RGB panels. support serial & parallel rgb
 	  interface.
 
+config DRM_PANEL_ILITEK_ILI9805
+	tristate "Ilitek ILI9805-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Ilitek ILI9805 controller.
+
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f267d932c2b5..d94a644d0a6c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
new file mode 100644
index 000000000000..749959e10d92
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 BSH Hausgerate GmbH
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/fb.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+#define ILI9805_EXTCMD_CMD_SET_ENABLE_REG	(0xff)
+#define ILI9805_SETEXTC_PARAMETER1		(0xff)
+#define ILI9805_SETEXTC_PARAMETER2		(0x98)
+#define ILI9805_SETEXTC_PARAMETER3		(0x05)
+
+#define ILI9805_INSTR(_delay, ...) { \
+		.delay = (_delay), \
+		.len = sizeof((u8[]) {__VA_ARGS__}), \
+		.data = (u8[]){__VA_ARGS__} \
+	}
+
+struct ili9805_instr {
+	size_t len;
+	const u8 *data;
+	u32 delay;
+};
+
+struct ili9805_desc {
+	const char *name;
+	const struct ili9805_instr *init;
+	const size_t init_length;
+	const struct drm_display_mode *mode;
+	u32 width_mm;
+	u32 height_mm;
+};
+
+struct ili9805 {
+	struct drm_panel	panel;
+	struct mipi_dsi_device	*dsi;
+	const struct ili9805_desc	*desc;
+
+	struct regulator	*dvdd;
+	struct regulator	*avdd;
+	struct gpio_desc	*reset_gpio;
+
+	bool			prepared;
+};
+
+static const struct ili9805_instr gpm1780a0_init[] = {
+	ILI9805_INSTR(100, ILI9805_EXTCMD_CMD_SET_ENABLE_REG, ILI9805_SETEXTC_PARAMETER1,
+		      ILI9805_SETEXTC_PARAMETER2, ILI9805_SETEXTC_PARAMETER3),
+	ILI9805_INSTR(100, 0xFD, 0x0F, 0x10, 0x44, 0x00),
+	ILI9805_INSTR(0, 0xf8, 0x18, 0x02, 0x02, 0x18, 0x02, 0x02, 0x30, 0x00,
+		      0x00, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00),
+	ILI9805_INSTR(0, 0xB8, 0x62),
+	ILI9805_INSTR(0, 0xF1, 0x00),
+	ILI9805_INSTR(0, 0xF2, 0x00, 0x58, 0x40),
+	ILI9805_INSTR(0, 0xF3, 0x60, 0x83, 0x04),
+	ILI9805_INSTR(0, 0xFC, 0x04, 0x0F, 0x01),
+	ILI9805_INSTR(0, 0xEB, 0x08, 0x0F),
+	ILI9805_INSTR(0, 0xe0, 0x00, 0x08, 0x0d, 0x0e, 0x0e, 0x0d, 0x0a, 0x08, 0x04,
+		      0x08, 0x0d, 0x0f, 0x0b, 0x1c, 0x14, 0x0a),
+	ILI9805_INSTR(0, 0xe1, 0x00, 0x08, 0x0d, 0x0e, 0x0e, 0x0d, 0x0a, 0x08, 0x04,
+		      0x08, 0x0d, 0x0f, 0x0b, 0x1c, 0x14, 0x0a),
+	ILI9805_INSTR(10, 0xc1, 0x13, 0x39, 0x19, 0x06),
+	ILI9805_INSTR(10, 0xc7, 0xe5),
+	ILI9805_INSTR(10, 0xB1, 0x00, 0x12, 0x14),
+	ILI9805_INSTR(10, 0xB4, 0x02),
+	ILI9805_INSTR(0, 0xBB, 0x14, 0x55),
+	ILI9805_INSTR(0, MIPI_DCS_SET_ADDRESS_MODE, 0x08),
+	ILI9805_INSTR(0, MIPI_DCS_SET_PIXEL_FORMAT, 0x77),
+	ILI9805_INSTR(0, 0x20),
+	ILI9805_INSTR(0, 0xB0, 0x01),
+	ILI9805_INSTR(0, 0xB6, 0x31, 0x00, 0xef),
+	ILI9805_INSTR(0, 0xDF, 0x23),
+	ILI9805_INSTR(0, 0xB9, 0x02, 0x00),
+};
+
+static inline struct ili9805 *panel_to_ili9805(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili9805, panel);
+}
+
+static int ili9805_power_on(struct ili9805 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = regulator_enable(ctx->avdd);
+	if (ret) {
+		dev_err(dev, "Failed to enable avdd regulator (%d)\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ctx->dvdd);
+	if (ret) {
+		dev_err(dev, "Failed to enable dvdd regulator (%d)\n", ret);
+		regulator_disable(ctx->avdd);
+		return ret;
+	}
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(5000, 10000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	msleep(120);
+
+	return 0;
+}
+
+static int ili9805_power_off(struct ili9805 *ctx)
+{
+	gpiod_set_value(ctx->reset_gpio, 0);
+	regulator_disable(ctx->dvdd);
+	regulator_disable(ctx->avdd);
+
+	return 0;
+}
+
+static int ili9805_activate(struct ili9805 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int i, ret;
+
+	for (i = 0; i < ctx->desc->init_length; i++) {
+		const struct ili9805_instr *instr = &ctx->desc->init[i];
+
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, instr->data, instr->len);
+		if (ret < 0)
+			return ret;
+
+		if (instr->delay > 0)
+			msleep(instr->delay);
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
+	if (ret) {
+		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(5000, 6000);
+
+	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
+	if (ret) {
+		dev_err(dev, "Failed to set display ON (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ili9805_prepare(struct drm_panel *panel)
+{
+	struct ili9805 *ctx = panel_to_ili9805(panel);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = ili9805_power_on(ctx);
+	if (ret)
+		return ret;
+
+	ret = ili9805_activate(ctx);
+	if (ret) {
+		ili9805_power_off(ctx);
+		return ret;
+	}
+
+	ctx->prepared = true;
+
+	return 0;
+}
+
+static int ili9805_deactivate(struct ili9805 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ili9805_unprepare(struct drm_panel *panel)
+{
+	struct ili9805 *ctx = panel_to_ili9805(panel);
+
+	if (!ctx->prepared)
+		return 0;
+
+	ili9805_deactivate(ctx);
+	ili9805_power_off(ctx);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static const struct drm_display_mode gpm1780a0_timing = {
+	.clock = 26227,
+
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 2,
+	.htotal = 480 + 10 + 2 + 36,
+
+	.vdisplay = 480,
+	.vsync_start = 480 + 2,
+	.vsync_end = 480 + 10 + 4,
+	.vtotal = 480 + 2 + 4 + 10,
+};
+
+static int ili9805_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct ili9805 *ctx = panel_to_ili9805(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	if (!mode) {
+		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
+			ctx->desc->mode->hdisplay,
+			ctx->desc->mode->vdisplay,
+			drm_mode_vrefresh(ctx->desc->mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs ili9805_funcs = {
+	.prepare	= ili9805_prepare,
+	.unprepare	= ili9805_unprepare,
+	.get_modes	= ili9805_get_modes,
+};
+
+static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct ili9805 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	mipi_dsi_set_drvdata(dsi, ctx);
+	ctx->dsi = dsi;
+	ctx->desc = of_device_get_match_data(&dsi->dev);
+
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM |
+		MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->lanes = 2;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &ili9805_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
+	if (IS_ERR(ctx->dvdd))
+		return PTR_ERR(ctx->dvdd);
+	ctx->avdd = devm_regulator_get(&dsi->dev, "avdd");
+	if (IS_ERR(ctx->avdd))
+		return PTR_ERR(ctx->avdd);
+
+	ctx->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->panel.prepare_prev_first = true;
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(&dsi->dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ili9805_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct ili9805 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
+			ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct ili9805_desc gpm1780a0_desc = {
+	.init = gpm1780a0_init,
+	.init_length = ARRAY_SIZE(gpm1780a0_init),
+	.mode = &gpm1780a0_timing,
+	.width_mm = 65,
+	.height_mm = 65,
+};
+
+static const struct of_device_id ili9805_of_match[] = {
+	{ .compatible = "giantplus,gpm1790a0", .data = &gpm1780a0_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ili9805_of_match);
+
+static struct mipi_dsi_driver ili9805_dsi_driver = {
+	.probe		= ili9805_dsi_probe,
+	.remove		= ili9805_dsi_remove,
+	.driver = {
+		.name		= "ili9805-dsi",
+		.of_match_table	= ili9805_of_match,
+	},
+};
+module_mipi_dsi_driver(ili9805_dsi_driver);
+
+MODULE_AUTHOR("Matthias Proske <Matthias.Proske@bshg.com>");
+MODULE_AUTHOR("Michael Trimarchi <michael@amarulasolutions.com>");
+MODULE_DESCRIPTION("Ilitek ILI9805 Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

