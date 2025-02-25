Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5DA4457B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633E10E73C;
	Tue, 25 Feb 2025 16:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z14TNYDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D882E10E73A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740499701;
 bh=wQAg62rIyySH8T/hiZv4f8AN77aryU1bUBgvXu6BAXE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Z14TNYDDoMkMCmL6uCiaYba99Hq3bl0AgOMp+spQLswXn3jPsxOnZcvJvw10yaygd
 tdJKSfT3seJZTPok28BYS0F2TqOU/I2t793FPSqOWyQzdnWMMFS+yVuJ36T3Tj+ZtH
 Fbc2uLSSlLpDEMYndGxMBQmH1/NLgqGQzAUO49bPHh6ClXsGIQFDzr8ec0mrsWOqqd
 zbtTNskBTTRUvMkQ9cT3aoENj/6e44HZ5rNtpBHDZ9f4fmZOskl7zm6Jf2oD6/2lqt
 Dfzob6twn1xDCm279+OO1uAzozrs8W5d8EAEKlwBGuBpDRhu4NpbY1vky8C0+G4a4x
 Wjc/vTOCHyw9g==
Received: from jupiter.universe (dyndsl-091-248-213-055.ewe-ip-backbone.de
 [91.248.213.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E330D17E0B46;
 Tue, 25 Feb 2025 17:08:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 84A0E480034; Tue, 25 Feb 2025 17:08:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 25 Feb 2025 17:08:00 +0100
Subject: [PATCH v3 2/2] drm/panel: add Raydium RM67200 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-raydium-rm67200-v3-2-d9e1010dd8ab@kernel.org>
References: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
In-Reply-To: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20558; i=sre@kernel.org;
 h=from:subject:message-id; bh=wQAg62rIyySH8T/hiZv4f8AN77aryU1bUBgvXu6BAXE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGe96vQ/e00ml0MFD3aF/YPq+wYvjPDvPWW0L
 cZ3m/y6NhewQYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJnver0AAoJENju1/PI
 O/qaim8QAIhwZjdKpMLVTgwDnoXgxnjxE8cBuKLsm/O8mpF+tea2xwQCusDMi/5lTTUkvulv29C
 Mtxnx2yMHMd4ES0oJG0rn3M8sSTflV/znumZFRvnZjIkeEnt09jFWLkORkQHLVsdDeRZw3/cZ1/
 ehlHem0ro0JyB8feJbcFwT/Ya7K4WCEAw8PJAn0UNIkAQ6FoqLkZ0S6LXiJybe4oQIYc4hNvf9U
 N1GOS35YXTYsUg79IdHekEY3V53TrLYPJU9ohpWG6IRJyGfKoCG/1DLTCvTkph5uOIVDLQguELS
 iJvThkwY7GcH1OowxNIPTNOR88yCLizr6MJryCDRtpG1QovrY74MPuwUTiO5bAAjLu11NaXMRJL
 lvvFzEu455x6Yjdt3HY5DbflS5uhUvphfCaviifZx5hte6ZBZwdM0ThTfIFrehBZUc7i76SjrK9
 TToAvSuufHj5AoVHBt5e+Hvj1GGfdzMWFBCIQmqztjWqu86nZrDlj63H0VKFRB4/CsZvUTX4jCK
 QkSuYeWBDU/yCnVKYmgfiBqhQl5tt6EFYk1rrZeF+PySQABdg+PFSWPV/5IQAgDWpP7vbU+3M1d
 Jpi2EnK1948jo9+iduWea3XGj4cDJo7MzY0fgeBtdOm3OBtnBoMxZOpWJcxw3p0jn9h1CGGe0bc
 0POc7aFOqSf1phKU7wMYtMw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

The Rockchip W552793DBA-V10 display/touchscreen board contains a
Wanchanglong W552793BAA panel, which in turn is using a Raydium
RM67200 MIPI-DSI controller. Add a DSI panel driver for it.

The W552793BAA panel init sequence has been taken from the RK3588
EVB1 vendor kernel devicetree.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 499 ++++++++++++++++++++++++++
 3 files changed, 510 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1db8b8e974dd6c45d03d9352d99d63..ab962c7d572827774dabd2cdf329367a102c43de 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -573,6 +573,16 @@ config DRM_PANEL_RAYDIUM_RM67191
 	  Say Y here if you want to enable support for Raydium RM67191 FHD
 	  (1080x1920) DSI panel.
 
+config DRM_PANEL_RAYDIUM_RM67200
+	tristate "Raydium RM67200-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Raydium RM67200-based
+	  DSI video mode panels. This panel controller can be found in the
+	  Wanchanglong W552793BAA panel found on the Rockchip RK3588 EVB1
+	  evaluation boards.
+
 config DRM_PANEL_RAYDIUM_RM68200
 	tristate "Raydium RM68200 720x1280 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cacff11bab90c78e3b8b1f357e5f14a..f7b7cd1794927401cab1930402ef5c5df9e4c1c5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) += panel-osd-osd101t2587-53ts.o
 obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
 obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
+obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67200) += panel-raydium-rm67200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
new file mode 100644
index 0000000000000000000000000000000000000000..64b685dc11f65b0f402995e27a42df5d69ae4361
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Collabora
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct raydium_rm67200_panel_info {
+	struct drm_display_mode mode;
+	const struct regulator_bulk_data *regulators;
+	int num_regulators;
+	void (*panel_setup)(struct mipi_dsi_multi_context *ctx);
+};
+
+struct raydium_rm67200 {
+	struct drm_panel panel;
+	const struct raydium_rm67200_panel_info *panel_info;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+};
+
+static inline struct raydium_rm67200 *to_raydium_rm67200(struct drm_panel *panel)
+{
+	return container_of(panel, struct raydium_rm67200, panel);
+}
+
+static void raydium_rm67200_reset(struct raydium_rm67200 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(60);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(60);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(60);
+}
+
+static void raydium_rm67200_write(struct mipi_dsi_multi_context *ctx,
+				  u8 arg1, u8 arg2)
+{
+	u8 d[] = { arg1, arg2 };
+
+	mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d));
+}
+
+static void w552793baa_setup(struct mipi_dsi_multi_context *ctx)
+{
+	raydium_rm67200_write(ctx, 0xfe, 0x21);
+	raydium_rm67200_write(ctx, 0x04, 0x00);
+	raydium_rm67200_write(ctx, 0x00, 0x64);
+	raydium_rm67200_write(ctx, 0x2a, 0x00);
+	raydium_rm67200_write(ctx, 0x26, 0x64);
+	raydium_rm67200_write(ctx, 0x54, 0x00);
+	raydium_rm67200_write(ctx, 0x50, 0x64);
+	raydium_rm67200_write(ctx, 0x7b, 0x00);
+	raydium_rm67200_write(ctx, 0x77, 0x64);
+	raydium_rm67200_write(ctx, 0xa2, 0x00);
+	raydium_rm67200_write(ctx, 0x9d, 0x64);
+	raydium_rm67200_write(ctx, 0xc9, 0x00);
+	raydium_rm67200_write(ctx, 0xc5, 0x64);
+	raydium_rm67200_write(ctx, 0x01, 0x71);
+	raydium_rm67200_write(ctx, 0x27, 0x71);
+	raydium_rm67200_write(ctx, 0x51, 0x71);
+	raydium_rm67200_write(ctx, 0x78, 0x71);
+	raydium_rm67200_write(ctx, 0x9e, 0x71);
+	raydium_rm67200_write(ctx, 0xc6, 0x71);
+	raydium_rm67200_write(ctx, 0x02, 0x89);
+	raydium_rm67200_write(ctx, 0x28, 0x89);
+	raydium_rm67200_write(ctx, 0x52, 0x89);
+	raydium_rm67200_write(ctx, 0x79, 0x89);
+	raydium_rm67200_write(ctx, 0x9f, 0x89);
+	raydium_rm67200_write(ctx, 0xc7, 0x89);
+	raydium_rm67200_write(ctx, 0x03, 0x9e);
+	raydium_rm67200_write(ctx, 0x29, 0x9e);
+	raydium_rm67200_write(ctx, 0x53, 0x9e);
+	raydium_rm67200_write(ctx, 0x7a, 0x9e);
+	raydium_rm67200_write(ctx, 0xa0, 0x9e);
+	raydium_rm67200_write(ctx, 0xc8, 0x9e);
+	raydium_rm67200_write(ctx, 0x09, 0x00);
+	raydium_rm67200_write(ctx, 0x05, 0xb0);
+	raydium_rm67200_write(ctx, 0x31, 0x00);
+	raydium_rm67200_write(ctx, 0x2b, 0xb0);
+	raydium_rm67200_write(ctx, 0x5a, 0x00);
+	raydium_rm67200_write(ctx, 0x55, 0xb0);
+	raydium_rm67200_write(ctx, 0x80, 0x00);
+	raydium_rm67200_write(ctx, 0x7c, 0xb0);
+	raydium_rm67200_write(ctx, 0xa7, 0x00);
+	raydium_rm67200_write(ctx, 0xa3, 0xb0);
+	raydium_rm67200_write(ctx, 0xce, 0x00);
+	raydium_rm67200_write(ctx, 0xca, 0xb0);
+	raydium_rm67200_write(ctx, 0x06, 0xc0);
+	raydium_rm67200_write(ctx, 0x2d, 0xc0);
+	raydium_rm67200_write(ctx, 0x56, 0xc0);
+	raydium_rm67200_write(ctx, 0x7d, 0xc0);
+	raydium_rm67200_write(ctx, 0xa4, 0xc0);
+	raydium_rm67200_write(ctx, 0xcb, 0xc0);
+	raydium_rm67200_write(ctx, 0x07, 0xcf);
+	raydium_rm67200_write(ctx, 0x2f, 0xcf);
+	raydium_rm67200_write(ctx, 0x58, 0xcf);
+	raydium_rm67200_write(ctx, 0x7e, 0xcf);
+	raydium_rm67200_write(ctx, 0xa5, 0xcf);
+	raydium_rm67200_write(ctx, 0xcc, 0xcf);
+	raydium_rm67200_write(ctx, 0x08, 0xdd);
+	raydium_rm67200_write(ctx, 0x30, 0xdd);
+	raydium_rm67200_write(ctx, 0x59, 0xdd);
+	raydium_rm67200_write(ctx, 0x7f, 0xdd);
+	raydium_rm67200_write(ctx, 0xa6, 0xdd);
+	raydium_rm67200_write(ctx, 0xcd, 0xdd);
+	raydium_rm67200_write(ctx, 0x0e, 0x15);
+	raydium_rm67200_write(ctx, 0x0a, 0xe9);
+	raydium_rm67200_write(ctx, 0x36, 0x15);
+	raydium_rm67200_write(ctx, 0x32, 0xe9);
+	raydium_rm67200_write(ctx, 0x5f, 0x15);
+	raydium_rm67200_write(ctx, 0x5b, 0xe9);
+	raydium_rm67200_write(ctx, 0x85, 0x15);
+	raydium_rm67200_write(ctx, 0x81, 0xe9);
+	raydium_rm67200_write(ctx, 0xad, 0x15);
+	raydium_rm67200_write(ctx, 0xa9, 0xe9);
+	raydium_rm67200_write(ctx, 0xd3, 0x15);
+	raydium_rm67200_write(ctx, 0xcf, 0xe9);
+	raydium_rm67200_write(ctx, 0x0b, 0x14);
+	raydium_rm67200_write(ctx, 0x33, 0x14);
+	raydium_rm67200_write(ctx, 0x5c, 0x14);
+	raydium_rm67200_write(ctx, 0x82, 0x14);
+	raydium_rm67200_write(ctx, 0xaa, 0x14);
+	raydium_rm67200_write(ctx, 0xd0, 0x14);
+	raydium_rm67200_write(ctx, 0x0c, 0x36);
+	raydium_rm67200_write(ctx, 0x34, 0x36);
+	raydium_rm67200_write(ctx, 0x5d, 0x36);
+	raydium_rm67200_write(ctx, 0x83, 0x36);
+	raydium_rm67200_write(ctx, 0xab, 0x36);
+	raydium_rm67200_write(ctx, 0xd1, 0x36);
+	raydium_rm67200_write(ctx, 0x0d, 0x6b);
+	raydium_rm67200_write(ctx, 0x35, 0x6b);
+	raydium_rm67200_write(ctx, 0x5e, 0x6b);
+	raydium_rm67200_write(ctx, 0x84, 0x6b);
+	raydium_rm67200_write(ctx, 0xac, 0x6b);
+	raydium_rm67200_write(ctx, 0xd2, 0x6b);
+	raydium_rm67200_write(ctx, 0x13, 0x5a);
+	raydium_rm67200_write(ctx, 0x0f, 0x94);
+	raydium_rm67200_write(ctx, 0x3b, 0x5a);
+	raydium_rm67200_write(ctx, 0x37, 0x94);
+	raydium_rm67200_write(ctx, 0x64, 0x5a);
+	raydium_rm67200_write(ctx, 0x60, 0x94);
+	raydium_rm67200_write(ctx, 0x8a, 0x5a);
+	raydium_rm67200_write(ctx, 0x86, 0x94);
+	raydium_rm67200_write(ctx, 0xb2, 0x5a);
+	raydium_rm67200_write(ctx, 0xae, 0x94);
+	raydium_rm67200_write(ctx, 0xd8, 0x5a);
+	raydium_rm67200_write(ctx, 0xd4, 0x94);
+	raydium_rm67200_write(ctx, 0x10, 0xd1);
+	raydium_rm67200_write(ctx, 0x38, 0xd1);
+	raydium_rm67200_write(ctx, 0x61, 0xd1);
+	raydium_rm67200_write(ctx, 0x87, 0xd1);
+	raydium_rm67200_write(ctx, 0xaf, 0xd1);
+	raydium_rm67200_write(ctx, 0xd5, 0xd1);
+	raydium_rm67200_write(ctx, 0x11, 0x04);
+	raydium_rm67200_write(ctx, 0x39, 0x04);
+	raydium_rm67200_write(ctx, 0x62, 0x04);
+	raydium_rm67200_write(ctx, 0x88, 0x04);
+	raydium_rm67200_write(ctx, 0xb0, 0x04);
+	raydium_rm67200_write(ctx, 0xd6, 0x04);
+	raydium_rm67200_write(ctx, 0x12, 0x05);
+	raydium_rm67200_write(ctx, 0x3a, 0x05);
+	raydium_rm67200_write(ctx, 0x63, 0x05);
+	raydium_rm67200_write(ctx, 0x89, 0x05);
+	raydium_rm67200_write(ctx, 0xb1, 0x05);
+	raydium_rm67200_write(ctx, 0xd7, 0x05);
+	raydium_rm67200_write(ctx, 0x18, 0xaa);
+	raydium_rm67200_write(ctx, 0x14, 0x36);
+	raydium_rm67200_write(ctx, 0x42, 0xaa);
+	raydium_rm67200_write(ctx, 0x3d, 0x36);
+	raydium_rm67200_write(ctx, 0x69, 0xaa);
+	raydium_rm67200_write(ctx, 0x65, 0x36);
+	raydium_rm67200_write(ctx, 0x8f, 0xaa);
+	raydium_rm67200_write(ctx, 0x8b, 0x36);
+	raydium_rm67200_write(ctx, 0xb7, 0xaa);
+	raydium_rm67200_write(ctx, 0xb3, 0x36);
+	raydium_rm67200_write(ctx, 0xdd, 0xaa);
+	raydium_rm67200_write(ctx, 0xd9, 0x36);
+	raydium_rm67200_write(ctx, 0x15, 0x74);
+	raydium_rm67200_write(ctx, 0x3f, 0x74);
+	raydium_rm67200_write(ctx, 0x66, 0x74);
+	raydium_rm67200_write(ctx, 0x8c, 0x74);
+	raydium_rm67200_write(ctx, 0xb4, 0x74);
+	raydium_rm67200_write(ctx, 0xda, 0x74);
+	raydium_rm67200_write(ctx, 0x16, 0x9f);
+	raydium_rm67200_write(ctx, 0x40, 0x9f);
+	raydium_rm67200_write(ctx, 0x67, 0x9f);
+	raydium_rm67200_write(ctx, 0x8d, 0x9f);
+	raydium_rm67200_write(ctx, 0xb5, 0x9f);
+	raydium_rm67200_write(ctx, 0xdb, 0x9f);
+	raydium_rm67200_write(ctx, 0x17, 0xdc);
+	raydium_rm67200_write(ctx, 0x41, 0xdc);
+	raydium_rm67200_write(ctx, 0x68, 0xdc);
+	raydium_rm67200_write(ctx, 0x8e, 0xdc);
+	raydium_rm67200_write(ctx, 0xb6, 0xdc);
+	raydium_rm67200_write(ctx, 0xdc, 0xdc);
+	raydium_rm67200_write(ctx, 0x1d, 0xff);
+	raydium_rm67200_write(ctx, 0x19, 0x03);
+	raydium_rm67200_write(ctx, 0x47, 0xff);
+	raydium_rm67200_write(ctx, 0x43, 0x03);
+	raydium_rm67200_write(ctx, 0x6e, 0xff);
+	raydium_rm67200_write(ctx, 0x6a, 0x03);
+	raydium_rm67200_write(ctx, 0x94, 0xff);
+	raydium_rm67200_write(ctx, 0x90, 0x03);
+	raydium_rm67200_write(ctx, 0xbc, 0xff);
+	raydium_rm67200_write(ctx, 0xb8, 0x03);
+	raydium_rm67200_write(ctx, 0xe2, 0xff);
+	raydium_rm67200_write(ctx, 0xde, 0x03);
+	raydium_rm67200_write(ctx, 0x1a, 0x35);
+	raydium_rm67200_write(ctx, 0x44, 0x35);
+	raydium_rm67200_write(ctx, 0x6b, 0x35);
+	raydium_rm67200_write(ctx, 0x91, 0x35);
+	raydium_rm67200_write(ctx, 0xb9, 0x35);
+	raydium_rm67200_write(ctx, 0xdf, 0x35);
+	raydium_rm67200_write(ctx, 0x1b, 0x45);
+	raydium_rm67200_write(ctx, 0x45, 0x45);
+	raydium_rm67200_write(ctx, 0x6c, 0x45);
+	raydium_rm67200_write(ctx, 0x92, 0x45);
+	raydium_rm67200_write(ctx, 0xba, 0x45);
+	raydium_rm67200_write(ctx, 0xe0, 0x45);
+	raydium_rm67200_write(ctx, 0x1c, 0x55);
+	raydium_rm67200_write(ctx, 0x46, 0x55);
+	raydium_rm67200_write(ctx, 0x6d, 0x55);
+	raydium_rm67200_write(ctx, 0x93, 0x55);
+	raydium_rm67200_write(ctx, 0xbb, 0x55);
+	raydium_rm67200_write(ctx, 0xe1, 0x55);
+	raydium_rm67200_write(ctx, 0x22, 0xff);
+	raydium_rm67200_write(ctx, 0x1e, 0x68);
+	raydium_rm67200_write(ctx, 0x4c, 0xff);
+	raydium_rm67200_write(ctx, 0x48, 0x68);
+	raydium_rm67200_write(ctx, 0x73, 0xff);
+	raydium_rm67200_write(ctx, 0x6f, 0x68);
+	raydium_rm67200_write(ctx, 0x99, 0xff);
+	raydium_rm67200_write(ctx, 0x95, 0x68);
+	raydium_rm67200_write(ctx, 0xc1, 0xff);
+	raydium_rm67200_write(ctx, 0xbd, 0x68);
+	raydium_rm67200_write(ctx, 0xe7, 0xff);
+	raydium_rm67200_write(ctx, 0xe3, 0x68);
+	raydium_rm67200_write(ctx, 0x1f, 0x7e);
+	raydium_rm67200_write(ctx, 0x49, 0x7e);
+	raydium_rm67200_write(ctx, 0x70, 0x7e);
+	raydium_rm67200_write(ctx, 0x96, 0x7e);
+	raydium_rm67200_write(ctx, 0xbe, 0x7e);
+	raydium_rm67200_write(ctx, 0xe4, 0x7e);
+	raydium_rm67200_write(ctx, 0x20, 0x97);
+	raydium_rm67200_write(ctx, 0x4a, 0x97);
+	raydium_rm67200_write(ctx, 0x71, 0x97);
+	raydium_rm67200_write(ctx, 0x97, 0x97);
+	raydium_rm67200_write(ctx, 0xbf, 0x97);
+	raydium_rm67200_write(ctx, 0xe5, 0x97);
+	raydium_rm67200_write(ctx, 0x21, 0xb5);
+	raydium_rm67200_write(ctx, 0x4b, 0xb5);
+	raydium_rm67200_write(ctx, 0x72, 0xb5);
+	raydium_rm67200_write(ctx, 0x98, 0xb5);
+	raydium_rm67200_write(ctx, 0xc0, 0xb5);
+	raydium_rm67200_write(ctx, 0xe6, 0xb5);
+	raydium_rm67200_write(ctx, 0x25, 0xf0);
+	raydium_rm67200_write(ctx, 0x23, 0xe8);
+	raydium_rm67200_write(ctx, 0x4f, 0xf0);
+	raydium_rm67200_write(ctx, 0x4d, 0xe8);
+	raydium_rm67200_write(ctx, 0x76, 0xf0);
+	raydium_rm67200_write(ctx, 0x74, 0xe8);
+	raydium_rm67200_write(ctx, 0x9c, 0xf0);
+	raydium_rm67200_write(ctx, 0x9a, 0xe8);
+	raydium_rm67200_write(ctx, 0xc4, 0xf0);
+	raydium_rm67200_write(ctx, 0xc2, 0xe8);
+	raydium_rm67200_write(ctx, 0xea, 0xf0);
+	raydium_rm67200_write(ctx, 0xe8, 0xe8);
+	raydium_rm67200_write(ctx, 0x24, 0xff);
+	raydium_rm67200_write(ctx, 0x4e, 0xff);
+	raydium_rm67200_write(ctx, 0x75, 0xff);
+	raydium_rm67200_write(ctx, 0x9b, 0xff);
+	raydium_rm67200_write(ctx, 0xc3, 0xff);
+	raydium_rm67200_write(ctx, 0xe9, 0xff);
+	raydium_rm67200_write(ctx, 0xfe, 0x3d);
+	raydium_rm67200_write(ctx, 0x00, 0x04);
+	raydium_rm67200_write(ctx, 0xfe, 0x23);
+	raydium_rm67200_write(ctx, 0x08, 0x82);
+	raydium_rm67200_write(ctx, 0x0a, 0x00);
+	raydium_rm67200_write(ctx, 0x0b, 0x00);
+	raydium_rm67200_write(ctx, 0x0c, 0x01);
+	raydium_rm67200_write(ctx, 0x16, 0x00);
+	raydium_rm67200_write(ctx, 0x18, 0x02);
+	raydium_rm67200_write(ctx, 0x1b, 0x04);
+	raydium_rm67200_write(ctx, 0x19, 0x04);
+	raydium_rm67200_write(ctx, 0x1c, 0x81);
+	raydium_rm67200_write(ctx, 0x1f, 0x00);
+	raydium_rm67200_write(ctx, 0x20, 0x03);
+	raydium_rm67200_write(ctx, 0x23, 0x04);
+	raydium_rm67200_write(ctx, 0x21, 0x01);
+	raydium_rm67200_write(ctx, 0x54, 0x63);
+	raydium_rm67200_write(ctx, 0x55, 0x54);
+	raydium_rm67200_write(ctx, 0x6e, 0x45);
+	raydium_rm67200_write(ctx, 0x6d, 0x36);
+	raydium_rm67200_write(ctx, 0xfe, 0x3d);
+	raydium_rm67200_write(ctx, 0x55, 0x78);
+	raydium_rm67200_write(ctx, 0xfe, 0x20);
+	raydium_rm67200_write(ctx, 0x26, 0x30);
+	raydium_rm67200_write(ctx, 0xfe, 0x3d);
+	raydium_rm67200_write(ctx, 0x20, 0x71);
+	raydium_rm67200_write(ctx, 0x50, 0x8f);
+	raydium_rm67200_write(ctx, 0x51, 0x8f);
+	raydium_rm67200_write(ctx, 0xfe, 0x00);
+	raydium_rm67200_write(ctx, 0x35, 0x00);
+}
+
+static int raydium_rm67200_prepare(struct drm_panel *panel)
+{
+	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	raydium_rm67200_reset(ctx);
+
+	msleep(60);
+
+	return 0;
+}
+
+static int raydium_rm67200_unprepare(struct drm_panel *panel)
+{
+	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ctx->num_supplies, ctx->supplies);
+
+	msleep(60);
+
+	return 0;
+}
+
+static int raydium_rm67200_enable(struct drm_panel *panel)
+{
+	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
+
+	rm67200->panel_info->panel_setup(&ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 30);
+
+	return ctx.accum_err;
+}
+
+static int raydium_rm67200_disable(struct drm_panel *panel)
+{
+	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
+
+	return ctx.accum_err;
+}
+
+static int raydium_rm67200_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+
+	return drm_connector_helper_get_modes_fixed(connector, &ctx->panel_info->mode);
+}
+
+static const struct drm_panel_funcs raydium_rm67200_funcs = {
+	.prepare = raydium_rm67200_prepare,
+	.unprepare = raydium_rm67200_unprepare,
+	.get_modes = raydium_rm67200_get_modes,
+	.enable = raydium_rm67200_enable,
+	.disable = raydium_rm67200_disable,
+};
+
+static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct raydium_rm67200 *ctx;
+	int ret = 0;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->panel_info = device_get_match_data(dev);
+	if (!ctx->panel_info)
+		return -EINVAL;
+
+	ctx->num_supplies = ctx->panel_info->num_regulators;
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ctx->panel_info->num_regulators,
+					    ctx->panel_info->regulators,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
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
+			  MIPI_DSI_MODE_LPM;
+	ctx->panel.prepare_prev_first = true;
+
+	drm_panel_init(&ctx->panel, dev, &raydium_rm67200_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+	}
+
+	return ret;
+}
+
+static void raydium_rm67200_remove(struct mipi_dsi_device *dsi)
+{
+	struct raydium_rm67200 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct regulator_bulk_data w552793baa_regulators[] = {
+	{ .supply = "vdd", },		/*  2.8V */
+	{ .supply = "iovcc", },		/*  1.8V */
+	{ .supply = "vsp", },		/* +5.5V */
+	{ .supply = "vsn", },		/* -5.5V */
+};
+
+static const struct raydium_rm67200_panel_info w552793baa_info = {
+	.mode = {
+		.clock = 132000,
+		.hdisplay = 1080,
+		.hsync_start = 1095,
+		.hsync_end = 1125,
+		.htotal = 1129,
+		.vdisplay = 1920,
+		.vsync_start = 1935,
+		.vsync_end = 1950,
+		.vtotal = 1952,
+		.width_mm = 68, /* 68.04mm */
+		.height_mm = 121, /* 120.96mm */
+		.type = DRM_MODE_TYPE_DRIVER,
+	},
+	.regulators = w552793baa_regulators,
+	.num_regulators = ARRAY_SIZE(w552793baa_regulators),
+	.panel_setup = w552793baa_setup,
+};
+
+static const struct of_device_id raydium_rm67200_of_match[] = {
+	{ .compatible = "wanchanglong,w552793baa", .data = &w552793baa_info },
+	{ /*sentinel*/ }
+};
+MODULE_DEVICE_TABLE(of, raydium_rm67200_of_match);
+
+static struct mipi_dsi_driver raydium_rm67200_driver = {
+	.probe = raydium_rm67200_probe,
+	.remove = raydium_rm67200_remove,
+	.driver = {
+		.name = "panel-raydium-rm67200",
+		.of_match_table = raydium_rm67200_of_match,
+	},
+};
+module_mipi_dsi_driver(raydium_rm67200_driver);
+
+MODULE_AUTHOR("Sebastian Reichel <sebastian.reichel@collabora.com>");
+MODULE_DESCRIPTION("DRM driver for RM67200-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.47.2

