Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70EC8B0E26
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD7511219C;
	Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C9Boxbgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367E113C11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9964E61BE3;
 Wed, 24 Apr 2024 15:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 577A9C4AF0D;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=fzrFerkpzhDZhGsP9p026V+dl71U1nmBV+JF/Q7xeqA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=C9BoxbgnJwNMbfUczAm5ya/8F+HAGmMFXtCXFYxNY/OV8ZyEZz76wcmLEULOqITi5
 Laff9hjH72l5yTinwWclmNdPx2DIqs7UNY596NdpMfrjAqyvcUXFN+ZiOpToVPvF2D
 AtOq8Qvny6wli/OL9QQrnraSxSgdyMBo5LJQL2EPapnYCRTNXvSO6nLUGbtJz843tx
 HBYnzdgi8/Yk8bbTGeGjtP7zDq4Os3KFnORLvUVX6Yy4lboT4yJydnh8mmmLXOaRqg
 DH/7iBEBfztqtGN5P/7F9eekVxEnmiRvYR8yKMzyEln2owlYuo8vDWWQ4/c3If6bGY
 A24ghkEUnHFSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2D0C4345F;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Wed, 24 Apr 2024 23:29:09 +0800
Subject: [PATCH 04/10] drm/panel: Add driver for Synaptics TD4328 LCD panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-ayn-odin2-initial-v1-4-e0aa05c991fd@gmail.com>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=8690;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=vBXmgfQvNHQkw/pZY8cGKOKpfT0S0Vam5IlRm/dfwZ8=;
 b=KevvcObJWYXSjlHkLwa5nIIOnFi5HxPCK+S8y/IACiIfJ1U+0qtSKMS+8MN3mQrJU47+bOxRf
 YvVNIvdfH96BbExx/xTSjScjjPDj+wxFIoxPaWnCeOy0LhE6rGnRm85
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xilin Wu <wuxilin123@gmail.com>

Add support for the 1920x1080 LCD panel driven by the Synaptics
TD4328 IC, as found on AYN Odin 2.

Co-developed-by: Junhao Xie <bigfoot@classfun.cn>
Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                  |  10 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-synaptics-td4328.c | 246 +++++++++++++++++++++++++
 3 files changed, 257 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ab67789e59a2..69852a35eccd 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -845,6 +845,16 @@ config DRM_PANEL_SYNAPTICS_R63353
 	  Say Y if you want to enable support for panels based on the
 	  Synaptics R63353 controller.
 
+config DRM_PANEL_SYNAPTICS_TD4328
+	tristate "Synaptics TD4328-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Synaptics TD4328 controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 0b40b010e8e7..927013e3eb11 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
+obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TD4328) += panel-synaptics-td4328.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
diff --git a/drivers/gpu/drm/panel/panel-synaptics-td4328.c b/drivers/gpu/drm/panel/panel-synaptics-td4328.c
new file mode 100644
index 000000000000..0fb0ddd9373d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-synaptics-td4328.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2024 Xilin Wu <wuxilin123@gmail.com>
+ * Copyright (c) 2024 Junhao Xie <bigfoot@classfun.cn>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct td4328 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct td4328 *to_td4328(struct drm_panel *panel)
+{
+	return container_of(panel, struct td4328, panel);
+}
+
+static void td4328_reset(struct td4328 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int td4328_on(struct td4328 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x31);
+	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x00);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(70);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int td4328_off(struct td4328 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	return 0;
+}
+
+static int td4328_prepare(struct drm_panel *panel)
+{
+	struct td4328 *ctx = to_td4328(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	td4328_reset(ctx);
+
+	ret = td4328_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int td4328_unprepare(struct drm_panel *panel)
+{
+	struct td4328 *ctx = to_td4328(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = td4328_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode td4328_mode = {
+	.clock = (1080 + 93 + 1 + 47) * (1920 + 40 + 2 + 60) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 93,
+	.hsync_end = 1080 + 93 + 1,
+	.htotal = 1080 + 93 + 1 + 47,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 40,
+	.vsync_end = 1920 + 40 + 2,
+	.vtotal = 1920 + 40 + 2 + 60,
+	.width_mm = 75,
+	.height_mm = 133,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int td4328_get_modes(struct drm_panel *panel,
+			 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &td4328_mode);
+}
+
+static enum drm_panel_orientation td4328_get_orientation(struct drm_panel *panel)
+{
+	return DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+}
+
+static const struct drm_panel_funcs td4328_panel_funcs = {
+	.prepare = td4328_prepare,
+	.disable = td4328_unprepare,
+	.get_modes = td4328_get_modes,
+	.get_orientation = td4328_get_orientation,
+};
+
+static int td4328_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct td4328 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vddio";
+	ctx->supplies[1].supply = "vdd";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &td4328_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void td4328_remove(struct mipi_dsi_device *dsi)
+{
+	struct td4328 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id td4328_of_match[] = {
+	{ .compatible = "syna,td4328" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, td4328_of_match);
+
+static struct mipi_dsi_driver td4328_driver = {
+	.probe = td4328_probe,
+	.remove = td4328_remove,
+	.driver = {
+		.name = "panel-td4328",
+		.of_match_table = td4328_of_match,
+	},
+};
+module_mipi_dsi_driver(td4328_driver);
+
+MODULE_DESCRIPTION("DRM driver for td4328-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.44.0


