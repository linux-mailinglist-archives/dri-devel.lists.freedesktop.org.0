Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325B9D9B88
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1D10E943;
	Tue, 26 Nov 2024 16:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dsj7SLoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFAF10E941
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 868E7A40F2C;
 Tue, 26 Nov 2024 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9600C4CED2;
 Tue, 26 Nov 2024 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732638866;
 bh=sUSc56MZ6GGd9Dy3LCU1d+9JVt2n1csAlpdyoy5NKMI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=dsj7SLoMz6NXLtLKyK9FSCHEBCfQrsdtiisWe3BoYnqyqtDcGo6+Phaamj6V0n2ON
 iAWelk794iT70u1YLmSRz734M6MbHL/S53gR06xt2byvOeW6iNZg44MlraWb1MOdGq
 T/lI6Odrn0UcDYBqytvJPS0QPgpo5+ZFS0XYfsCUxnmBEFhTyAZN/5ugTTnNysRdfM
 MDaPNbjqj9DpfKUUHAcqusGdALopEQ8VXxQmgxD7MR1A0hmWdaTtBZx3Tv5DCSoVTi
 urJXBhxg/5vzktlbxOwf71WMn2rQwFya2ORvmfihbUiNSjL0OYkrMdWLJaJiIGTaEi
 /+OHoPbHOQV/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DAF37D3B9BE;
 Tue, 26 Nov 2024 16:34:25 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 17:34:22 +0100
Subject: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
In-Reply-To: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732638864; l=6332;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=yS3wMDhwYxNd88DcL6/ejDY14iFml6WLH9Iqb+QwyXY=;
 b=iwS9x3NRGK4j37HlLDzzLTfPWfsOWzumTWYe/9uuYBdhj+ItexkAH6WSssrKpO96bsRBRsyK3
 1hsPUYsN+a9CNAvSVjfoKVH2Bb876YnxpDcvQxdyxV4hY83JeKg9SGU
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
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig        |   9 +++
 drivers/gpu/drm/panel/Makefile       |   1 +
 drivers/gpu/drm/panel/panel-summit.c | 143 +++++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)

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
index 0000000000000000000000000000000000000000..16bd9fa1213d7bc3f022b878ea5cfeadbd468995
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/backlight.h>
+#include <drm/drm_device.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
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
+static int summit_bl_get_brightness(struct backlight_device *dev)
+{
+	return backlight_get_brightness(dev);
+}
+
+static const struct backlight_ops summit_bl_ops = {
+	.get_brightness = summit_bl_get_brightness,
+	.update_status	= summit_bl_update_status,
+};
+
+static int summit_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode = drm_mode_create(connector->dev);
+
+	connector->display_info.non_desktop = true;
+	drm_object_property_set_value(&connector->base,
+				      connector->dev->mode_config.non_desktop_property,
+				      connector->display_info.non_desktop);
+
+	mode->vdisplay = 2008;
+	mode->hdisplay = 60;
+	mode->hsync_start = mode->hdisplay + 8;
+	mode->hsync_end = mode->hsync_start + 80;
+	mode->htotal = mode->hsync_end + 40;
+	mode->vsync_start = mode->vdisplay + 1;
+	mode->vsync_end = mode->vsync_start + 15;
+	mode->vtotal = mode->vsync_end + 6;
+	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+	return 1;
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
+						   dev, s_data, &summit_bl_ops, &props);
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
+static int summit_resume(struct device *dev)
+{
+	return summit_set_brightness(dev);
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
+				summit_resume);
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
2.47.1


