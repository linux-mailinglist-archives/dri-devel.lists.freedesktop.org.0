Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE4A381F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6900A10E41D;
	Mon, 17 Feb 2025 11:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMJ0FiGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941E710E427
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:39:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 347BB5C5530;
 Mon, 17 Feb 2025 11:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A4C7C4CEEF;
 Mon, 17 Feb 2025 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739792377;
 bh=NyQODyQ8uWj89RAb9qkVk3Y8Kgaz3t5HvTOO1C1MGyk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NMJ0FiGZ2mcw/yUNudqx0kTcAis7IvjngoJJBzlOdp56o7plXfdPWt97F9+X5igjs
 oaPQnNbxR5fUACIWzJQVYe6+izPfrr2RwUMk0oKXcYPjG565f1VETEdeqmaLZkJ9Zv
 R9VrtOKqXSrFcCEqdRNFYgGz6eqaHwWvNxykNjbLvva1LznTWdZcdSt8L8l7bVeFPx
 urojwCmu5jMSKg3jZqno+7xwPCwi7w2Agd8K++ZoE2NVgwCbz66Nu+YvINW/1IcQ/J
 v1NAE8hV6+aiThI18RKVq5PooUEi+Zmz5zx9LRGoyABNZXBc+bZaPZ43ixnHGWMlrO
 eKWSutvOQDW/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F3F59C021A9;
 Mon, 17 Feb 2025 11:39:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 12:39:33 +0100
Subject: [PATCH v7 3/5] drm: panel: Add a panel driver for the Summit display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-adpdrm-v7-3-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792375; l=6135;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=mrq63iLVH9ppuvIWH/dsq2AVK1CS/dEIvxQfxlEoXcc=;
 b=vKHPp7mU1FX257nFZXtsQv/keSlDcNozK30KxLx/ZaHUBM5t9BzSosRz0zz/viJjvAvkfx/pd
 vb0+L0fZecEC6lVe9H3xilswkUERpRQ9Bov0jje+YyMLiDEd1ObW3PJ
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

This is the display panel used for the touchbar on laptops that have it.

Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig        |   9 +++
 drivers/gpu/drm/panel/Makefile       |   1 +
 drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1db8b8e974dd6c45d03d9352d99d63..5085a82e4bc695e85cabbc3200859bbe10cb0f91 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -925,6 +925,15 @@ config DRM_PANEL_SIMPLE
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_SUMMIT
+	tristate "Apple Summit display panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for the "Summit" display panel
+	  used as a touchbar on certain Apple laptops.
+
 config DRM_PANEL_SYNAPTICS_R63353
 	tristate "Synaptics R63353-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cacff11bab90c78e3b8b1f357e5f14a..10ac2e850f5cd6d6546439de75483466e4015d1a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
+obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
new file mode 100644
index 0000000000000000000000000000000000000000..e780faee18570c9970d381b3f7c65b95665469cd
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/backlight.h>
+#include <drm/drm_device.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <video/mipi_display.h>
+
+struct summit_data {
+	struct mipi_dsi_device *dsi;
+	struct backlight_device *bl;
+	struct drm_panel panel;
+};
+
+static int summit_set_brightness(struct device *dev)
+{
+	struct summit_data *s_data = dev_get_drvdata(dev);
+	int level = backlight_get_brightness(s_data->bl);
+
+	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, level);
+}
+
+static int summit_bl_update_status(struct backlight_device *dev)
+{
+	return summit_set_brightness(&dev->dev);
+}
+
+static const struct backlight_ops summit_bl_ops = {
+	.update_status	= summit_bl_update_status,
+};
+
+static struct drm_display_mode summit_mode = {
+	.vdisplay = 2008,
+	.hdisplay = 60,
+	.hsync_start = 60 + 8,
+	.hsync_end = 60 + 8 + 80,
+	.htotal = 60 + 8 + 80 + 40,
+	.vsync_start = 2008 + 1,
+	.vsync_end = 2008 + 1 + 15,
+	.vtotal = 2008 + 1 + 15 + 6,
+	.clock = ((60 + 8 + 80 + 40) * (2008 + 1 + 15 + 6) * 60) / 1000,
+	.type = DRM_MODE_TYPE_DRIVER,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static int summit_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	connector->display_info.non_desktop = true;
+	drm_object_property_set_value(&connector->base,
+				      connector->dev->mode_config.non_desktop_property,
+				      connector->display_info.non_desktop);
+
+	return drm_connector_helper_get_modes_fixed(connector, &summit_mode);
+}
+
+static const struct drm_panel_funcs summit_panel_funcs = {
+	.get_modes = summit_get_modes,
+};
+
+static int summit_probe(struct mipi_dsi_device *dsi)
+{
+	struct backlight_properties props = { 0 };
+	struct device *dev = &dsi->dev;
+	struct summit_data *s_data;
+	int ret;
+
+	s_data = devm_kzalloc(dev, sizeof(*s_data), GFP_KERNEL);
+	if (!s_data)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, s_data);
+	s_data->dsi = dsi;
+
+	ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
+	if (ret)
+		return ret;
+	props.type = BACKLIGHT_RAW;
+
+	s_data->bl = devm_backlight_device_register(dev, dev_name(dev),
+						    dev, s_data, &summit_bl_ops, &props);
+	if (IS_ERR(s_data->bl))
+		return PTR_ERR(s_data->bl);
+
+	drm_panel_init(&s_data->panel, dev, &summit_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	drm_panel_add(&s_data->panel);
+
+	return mipi_dsi_attach(dsi);
+}
+
+static void summit_remove(struct mipi_dsi_device *dsi)
+{
+	struct summit_data *s_data = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&s_data->panel);
+}
+
+static int summit_suspend(struct device *dev)
+{
+	struct summit_data *s_data = dev_get_drvdata(dev);
+
+	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, 0);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(summit_pm_ops, summit_suspend,
+				summit_set_brightness);
+
+static const struct of_device_id summit_of_match[] = {
+	{ .compatible = "apple,summit" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, summit_of_match);
+
+static struct mipi_dsi_driver summit_driver = {
+	.probe = summit_probe,
+	.remove = summit_remove,
+	.driver = {
+		.name = "panel-summit",
+		.of_match_table = summit_of_match,
+		.pm = pm_sleep_ptr(&summit_pm_ops),
+	},
+};
+module_mipi_dsi_driver(summit_driver);
+
+MODULE_DESCRIPTION("Summit Display Panel Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


