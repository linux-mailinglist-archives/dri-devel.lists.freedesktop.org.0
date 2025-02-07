Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5938A2C893
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2F10EB69;
	Fri,  7 Feb 2025 16:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q9FCUX1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5C10EB70
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738945365;
 bh=A87DPlKacMHW0zmTMzsXiNBv39KakNdP7ELd69o4Q2g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q9FCUX1O/NP2dRg26LKyksgxZpVUx687c+0H8wTlIoLOYbJ70xXHiKhOBlKPLgomm
 y7xkPwP0xVROvXXpbLgCo4t8Giag4+hTGK3aJYKTbrECVWwNu1ksnOrh7tfFFCITnr
 pzz41kcTKUhGHEq9OmPEtJXS0LWYuOFPiEisuExip0taAsw4BmXw/BlH+7zl6i8key
 vhVn5g8kk1vORtL1W5QaW0gXWMou03FIFG6/5heoQaQTkn+jZpT18ZP9ou347QHo+2
 dQzxwPZZNHtsWHa8nVnVeY39XzEksxFBjxrLPk4mT14IN05rIEDbK2qT/FBr77WHyq
 aTzmCMA4NdELg==
Received: from jupiter.universe (dyndsl-091-248-211-114.ewe-ip-backbone.de
 [91.248.211.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C1FD417E0FCC;
 Fri,  7 Feb 2025 17:22:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 6B6FE480037; Fri, 07 Feb 2025 17:22:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 07 Feb 2025 17:21:48 +0100
Subject: [PATCH v2 2/2] drm/panel: add Raydium RM67200 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-raydium-rm67200-v2-2-1fdc927aae82@kernel.org>
References: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
In-Reply-To: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20570; i=sre@kernel.org;
 h=from:subject:message-id; bh=A87DPlKacMHW0zmTMzsXiNBv39KakNdP7ELd69o4Q2g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGemM1UcDAN55Z2+jM42kv7obruJsNO/N0GuR
 JWiOGy3pWH1Q4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJnpjNVAAoJENju1/PI
 O/qa8fgP/0yIqjKuo+BSdhmuxVnheLU38udHfLY7X3TDjiWt5a8kzMvtc32MI9rUibuUwxOsAvY
 mWqeMjdtsI0/baOcCHRyZRAGx8Ja8lXBjAUXJpTZrHCWwEKCMJGfE/Ib/ekNVZMubSeUbE9x+pl
 zjvebcxfByEba1JZNnQHyCCYJRsqbmXrSHhT6dgBK19/svAux4J1fpF7+X9elxgOZpMCJe1f681
 yDeBDO5ghrMV7xcG6rhSok6XIQgKjMGWWoaxGMVGyV0+SsZ0EFQ28DboIAQ4NGG5fio5hflkwT8
 VCy/2YdRLsNp6kMBaV/oYfhpbbMk6UJGK5JEVSeSAJIuuhaGCXzeC4lVTTt911JwyqnTM/BMzZC
 lLWKYQiJLvfDocVxDPwggOV20YnGo+GdWn427V71HCqM/DBvj+JQKuSbXQJ/mUPuBrRNYGcSt6H
 uHN/53AD66gm/g5ZhTXhufFvR/flUw3t8MQ+1DsUPM5mm9IhOkwcB90nEW8pmohiiCrGEyq6XY/
 CvDnywvt+Whs1oav64vM3Dj5ydv6/fEuDTtDXudTimURr8E7zlphh/xYqAKZ9ZmDEB8hjKl1rMZ
 03VDPciNj1Gp80QgBq2vQD+wi1gayPWcwjYLFV7aSaRUTQaVSZ59wR5iyr6D/AbSUzWIeRYh7Pu
 uldLwymDgU2DP8SoVoyMwKw==
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
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 503 ++++++++++++++++++++++++++
 3 files changed, 514 insertions(+)

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
index 0000000000000000000000000000000000000000..1a7201ce6c9825d3c91661f612723306be1c7981
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -0,0 +1,503 @@
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
+	raydium_rm67200_write(ctx, 0xFE, 0x21);
+	raydium_rm67200_write(ctx, 0x04, 0x00);
+	raydium_rm67200_write(ctx, 0x00, 0x64);
+	raydium_rm67200_write(ctx, 0x2A, 0x00);
+	raydium_rm67200_write(ctx, 0x26, 0x64);
+	raydium_rm67200_write(ctx, 0x54, 0x00);
+	raydium_rm67200_write(ctx, 0x50, 0x64);
+	raydium_rm67200_write(ctx, 0x7B, 0x00);
+	raydium_rm67200_write(ctx, 0x77, 0x64);
+	raydium_rm67200_write(ctx, 0xA2, 0x00);
+	raydium_rm67200_write(ctx, 0x9D, 0x64);
+	raydium_rm67200_write(ctx, 0xC9, 0x00);
+	raydium_rm67200_write(ctx, 0xC5, 0x64);
+	raydium_rm67200_write(ctx, 0x01, 0x71);
+	raydium_rm67200_write(ctx, 0x27, 0x71);
+	raydium_rm67200_write(ctx, 0x51, 0x71);
+	raydium_rm67200_write(ctx, 0x78, 0x71);
+	raydium_rm67200_write(ctx, 0x9E, 0x71);
+	raydium_rm67200_write(ctx, 0xC6, 0x71);
+	raydium_rm67200_write(ctx, 0x02, 0x89);
+	raydium_rm67200_write(ctx, 0x28, 0x89);
+	raydium_rm67200_write(ctx, 0x52, 0x89);
+	raydium_rm67200_write(ctx, 0x79, 0x89);
+	raydium_rm67200_write(ctx, 0x9F, 0x89);
+	raydium_rm67200_write(ctx, 0xC7, 0x89);
+	raydium_rm67200_write(ctx, 0x03, 0x9E);
+	raydium_rm67200_write(ctx, 0x29, 0x9E);
+	raydium_rm67200_write(ctx, 0x53, 0x9E);
+	raydium_rm67200_write(ctx, 0x7A, 0x9E);
+	raydium_rm67200_write(ctx, 0xA0, 0x9E);
+	raydium_rm67200_write(ctx, 0xC8, 0x9E);
+	raydium_rm67200_write(ctx, 0x09, 0x00);
+	raydium_rm67200_write(ctx, 0x05, 0xB0);
+	raydium_rm67200_write(ctx, 0x31, 0x00);
+	raydium_rm67200_write(ctx, 0x2B, 0xB0);
+	raydium_rm67200_write(ctx, 0x5A, 0x00);
+	raydium_rm67200_write(ctx, 0x55, 0xB0);
+	raydium_rm67200_write(ctx, 0x80, 0x00);
+	raydium_rm67200_write(ctx, 0x7C, 0xB0);
+	raydium_rm67200_write(ctx, 0xA7, 0x00);
+	raydium_rm67200_write(ctx, 0xA3, 0xB0);
+	raydium_rm67200_write(ctx, 0xCE, 0x00);
+	raydium_rm67200_write(ctx, 0xCA, 0xB0);
+	raydium_rm67200_write(ctx, 0x06, 0xC0);
+	raydium_rm67200_write(ctx, 0x2D, 0xC0);
+	raydium_rm67200_write(ctx, 0x56, 0xC0);
+	raydium_rm67200_write(ctx, 0x7D, 0xC0);
+	raydium_rm67200_write(ctx, 0xA4, 0xC0);
+	raydium_rm67200_write(ctx, 0xCB, 0xC0);
+	raydium_rm67200_write(ctx, 0x07, 0xCF);
+	raydium_rm67200_write(ctx, 0x2F, 0xCF);
+	raydium_rm67200_write(ctx, 0x58, 0xCF);
+	raydium_rm67200_write(ctx, 0x7E, 0xCF);
+	raydium_rm67200_write(ctx, 0xA5, 0xCF);
+	raydium_rm67200_write(ctx, 0xCC, 0xCF);
+	raydium_rm67200_write(ctx, 0x08, 0xDD);
+	raydium_rm67200_write(ctx, 0x30, 0xDD);
+	raydium_rm67200_write(ctx, 0x59, 0xDD);
+	raydium_rm67200_write(ctx, 0x7F, 0xDD);
+	raydium_rm67200_write(ctx, 0xA6, 0xDD);
+	raydium_rm67200_write(ctx, 0xCD, 0xDD);
+	raydium_rm67200_write(ctx, 0x0E, 0x15);
+	raydium_rm67200_write(ctx, 0x0A, 0xE9);
+	raydium_rm67200_write(ctx, 0x36, 0x15);
+	raydium_rm67200_write(ctx, 0x32, 0xE9);
+	raydium_rm67200_write(ctx, 0x5F, 0x15);
+	raydium_rm67200_write(ctx, 0x5B, 0xE9);
+	raydium_rm67200_write(ctx, 0x85, 0x15);
+	raydium_rm67200_write(ctx, 0x81, 0xE9);
+	raydium_rm67200_write(ctx, 0xAD, 0x15);
+	raydium_rm67200_write(ctx, 0xA9, 0xE9);
+	raydium_rm67200_write(ctx, 0xD3, 0x15);
+	raydium_rm67200_write(ctx, 0xCF, 0xE9);
+	raydium_rm67200_write(ctx, 0x0B, 0x14);
+	raydium_rm67200_write(ctx, 0x33, 0x14);
+	raydium_rm67200_write(ctx, 0x5C, 0x14);
+	raydium_rm67200_write(ctx, 0x82, 0x14);
+	raydium_rm67200_write(ctx, 0xAA, 0x14);
+	raydium_rm67200_write(ctx, 0xD0, 0x14);
+	raydium_rm67200_write(ctx, 0x0C, 0x36);
+	raydium_rm67200_write(ctx, 0x34, 0x36);
+	raydium_rm67200_write(ctx, 0x5D, 0x36);
+	raydium_rm67200_write(ctx, 0x83, 0x36);
+	raydium_rm67200_write(ctx, 0xAB, 0x36);
+	raydium_rm67200_write(ctx, 0xD1, 0x36);
+	raydium_rm67200_write(ctx, 0x0D, 0x6B);
+	raydium_rm67200_write(ctx, 0x35, 0x6B);
+	raydium_rm67200_write(ctx, 0x5E, 0x6B);
+	raydium_rm67200_write(ctx, 0x84, 0x6B);
+	raydium_rm67200_write(ctx, 0xAC, 0x6B);
+	raydium_rm67200_write(ctx, 0xD2, 0x6B);
+	raydium_rm67200_write(ctx, 0x13, 0x5A);
+	raydium_rm67200_write(ctx, 0x0F, 0x94);
+	raydium_rm67200_write(ctx, 0x3B, 0x5A);
+	raydium_rm67200_write(ctx, 0x37, 0x94);
+	raydium_rm67200_write(ctx, 0x64, 0x5A);
+	raydium_rm67200_write(ctx, 0x60, 0x94);
+	raydium_rm67200_write(ctx, 0x8A, 0x5A);
+	raydium_rm67200_write(ctx, 0x86, 0x94);
+	raydium_rm67200_write(ctx, 0xB2, 0x5A);
+	raydium_rm67200_write(ctx, 0xAE, 0x94);
+	raydium_rm67200_write(ctx, 0xD8, 0x5A);
+	raydium_rm67200_write(ctx, 0xD4, 0x94);
+	raydium_rm67200_write(ctx, 0x10, 0xD1);
+	raydium_rm67200_write(ctx, 0x38, 0xD1);
+	raydium_rm67200_write(ctx, 0x61, 0xD1);
+	raydium_rm67200_write(ctx, 0x87, 0xD1);
+	raydium_rm67200_write(ctx, 0xAF, 0xD1);
+	raydium_rm67200_write(ctx, 0xD5, 0xD1);
+	raydium_rm67200_write(ctx, 0x11, 0x04);
+	raydium_rm67200_write(ctx, 0x39, 0x04);
+	raydium_rm67200_write(ctx, 0x62, 0x04);
+	raydium_rm67200_write(ctx, 0x88, 0x04);
+	raydium_rm67200_write(ctx, 0xB0, 0x04);
+	raydium_rm67200_write(ctx, 0xD6, 0x04);
+	raydium_rm67200_write(ctx, 0x12, 0x05);
+	raydium_rm67200_write(ctx, 0x3A, 0x05);
+	raydium_rm67200_write(ctx, 0x63, 0x05);
+	raydium_rm67200_write(ctx, 0x89, 0x05);
+	raydium_rm67200_write(ctx, 0xB1, 0x05);
+	raydium_rm67200_write(ctx, 0xD7, 0x05);
+	raydium_rm67200_write(ctx, 0x18, 0xAA);
+	raydium_rm67200_write(ctx, 0x14, 0x36);
+	raydium_rm67200_write(ctx, 0x42, 0xAA);
+	raydium_rm67200_write(ctx, 0x3D, 0x36);
+	raydium_rm67200_write(ctx, 0x69, 0xAA);
+	raydium_rm67200_write(ctx, 0x65, 0x36);
+	raydium_rm67200_write(ctx, 0x8F, 0xAA);
+	raydium_rm67200_write(ctx, 0x8B, 0x36);
+	raydium_rm67200_write(ctx, 0xB7, 0xAA);
+	raydium_rm67200_write(ctx, 0xB3, 0x36);
+	raydium_rm67200_write(ctx, 0xDD, 0xAA);
+	raydium_rm67200_write(ctx, 0xD9, 0x36);
+	raydium_rm67200_write(ctx, 0x15, 0x74);
+	raydium_rm67200_write(ctx, 0x3F, 0x74);
+	raydium_rm67200_write(ctx, 0x66, 0x74);
+	raydium_rm67200_write(ctx, 0x8C, 0x74);
+	raydium_rm67200_write(ctx, 0xB4, 0x74);
+	raydium_rm67200_write(ctx, 0xDA, 0x74);
+	raydium_rm67200_write(ctx, 0x16, 0x9F);
+	raydium_rm67200_write(ctx, 0x40, 0x9F);
+	raydium_rm67200_write(ctx, 0x67, 0x9F);
+	raydium_rm67200_write(ctx, 0x8D, 0x9F);
+	raydium_rm67200_write(ctx, 0xB5, 0x9F);
+	raydium_rm67200_write(ctx, 0xDB, 0x9F);
+	raydium_rm67200_write(ctx, 0x17, 0xDC);
+	raydium_rm67200_write(ctx, 0x41, 0xDC);
+	raydium_rm67200_write(ctx, 0x68, 0xDC);
+	raydium_rm67200_write(ctx, 0x8E, 0xDC);
+	raydium_rm67200_write(ctx, 0xB6, 0xDC);
+	raydium_rm67200_write(ctx, 0xDC, 0xDC);
+	raydium_rm67200_write(ctx, 0x1D, 0xFF);
+	raydium_rm67200_write(ctx, 0x19, 0x03);
+	raydium_rm67200_write(ctx, 0x47, 0xFF);
+	raydium_rm67200_write(ctx, 0x43, 0x03);
+	raydium_rm67200_write(ctx, 0x6E, 0xFF);
+	raydium_rm67200_write(ctx, 0x6A, 0x03);
+	raydium_rm67200_write(ctx, 0x94, 0xFF);
+	raydium_rm67200_write(ctx, 0x90, 0x03);
+	raydium_rm67200_write(ctx, 0xBC, 0xFF);
+	raydium_rm67200_write(ctx, 0xB8, 0x03);
+	raydium_rm67200_write(ctx, 0xE2, 0xFF);
+	raydium_rm67200_write(ctx, 0xDE, 0x03);
+	raydium_rm67200_write(ctx, 0x1A, 0x35);
+	raydium_rm67200_write(ctx, 0x44, 0x35);
+	raydium_rm67200_write(ctx, 0x6B, 0x35);
+	raydium_rm67200_write(ctx, 0x91, 0x35);
+	raydium_rm67200_write(ctx, 0xB9, 0x35);
+	raydium_rm67200_write(ctx, 0xDF, 0x35);
+	raydium_rm67200_write(ctx, 0x1B, 0x45);
+	raydium_rm67200_write(ctx, 0x45, 0x45);
+	raydium_rm67200_write(ctx, 0x6C, 0x45);
+	raydium_rm67200_write(ctx, 0x92, 0x45);
+	raydium_rm67200_write(ctx, 0xBA, 0x45);
+	raydium_rm67200_write(ctx, 0xE0, 0x45);
+	raydium_rm67200_write(ctx, 0x1C, 0x55);
+	raydium_rm67200_write(ctx, 0x46, 0x55);
+	raydium_rm67200_write(ctx, 0x6D, 0x55);
+	raydium_rm67200_write(ctx, 0x93, 0x55);
+	raydium_rm67200_write(ctx, 0xBB, 0x55);
+	raydium_rm67200_write(ctx, 0xE1, 0x55);
+	raydium_rm67200_write(ctx, 0x22, 0xFF);
+	raydium_rm67200_write(ctx, 0x1E, 0x68);
+	raydium_rm67200_write(ctx, 0x4C, 0xFF);
+	raydium_rm67200_write(ctx, 0x48, 0x68);
+	raydium_rm67200_write(ctx, 0x73, 0xFF);
+	raydium_rm67200_write(ctx, 0x6F, 0x68);
+	raydium_rm67200_write(ctx, 0x99, 0xFF);
+	raydium_rm67200_write(ctx, 0x95, 0x68);
+	raydium_rm67200_write(ctx, 0xC1, 0xFF);
+	raydium_rm67200_write(ctx, 0xBD, 0x68);
+	raydium_rm67200_write(ctx, 0xE7, 0xFF);
+	raydium_rm67200_write(ctx, 0xE3, 0x68);
+	raydium_rm67200_write(ctx, 0x1F, 0x7E);
+	raydium_rm67200_write(ctx, 0x49, 0x7E);
+	raydium_rm67200_write(ctx, 0x70, 0x7E);
+	raydium_rm67200_write(ctx, 0x96, 0x7E);
+	raydium_rm67200_write(ctx, 0xBE, 0x7E);
+	raydium_rm67200_write(ctx, 0xE4, 0x7E);
+	raydium_rm67200_write(ctx, 0x20, 0x97);
+	raydium_rm67200_write(ctx, 0x4A, 0x97);
+	raydium_rm67200_write(ctx, 0x71, 0x97);
+	raydium_rm67200_write(ctx, 0x97, 0x97);
+	raydium_rm67200_write(ctx, 0xBF, 0x97);
+	raydium_rm67200_write(ctx, 0xE5, 0x97);
+	raydium_rm67200_write(ctx, 0x21, 0xB5);
+	raydium_rm67200_write(ctx, 0x4B, 0xB5);
+	raydium_rm67200_write(ctx, 0x72, 0xB5);
+	raydium_rm67200_write(ctx, 0x98, 0xB5);
+	raydium_rm67200_write(ctx, 0xC0, 0xB5);
+	raydium_rm67200_write(ctx, 0xE6, 0xB5);
+	raydium_rm67200_write(ctx, 0x25, 0xF0);
+	raydium_rm67200_write(ctx, 0x23, 0xE8);
+	raydium_rm67200_write(ctx, 0x4F, 0xF0);
+	raydium_rm67200_write(ctx, 0x4D, 0xE8);
+	raydium_rm67200_write(ctx, 0x76, 0xF0);
+	raydium_rm67200_write(ctx, 0x74, 0xE8);
+	raydium_rm67200_write(ctx, 0x9C, 0xF0);
+	raydium_rm67200_write(ctx, 0x9A, 0xE8);
+	raydium_rm67200_write(ctx, 0xC4, 0xF0);
+	raydium_rm67200_write(ctx, 0xC2, 0xE8);
+	raydium_rm67200_write(ctx, 0xEA, 0xF0);
+	raydium_rm67200_write(ctx, 0xE8, 0xE8);
+	raydium_rm67200_write(ctx, 0x24, 0xFF);
+	raydium_rm67200_write(ctx, 0x4E, 0xFF);
+	raydium_rm67200_write(ctx, 0x75, 0xFF);
+	raydium_rm67200_write(ctx, 0x9B, 0xFF);
+	raydium_rm67200_write(ctx, 0xC3, 0xFF);
+	raydium_rm67200_write(ctx, 0xE9, 0xFF);
+	raydium_rm67200_write(ctx, 0xFE, 0x3D);
+	raydium_rm67200_write(ctx, 0x00, 0x04);
+	raydium_rm67200_write(ctx, 0xFE, 0x23);
+	raydium_rm67200_write(ctx, 0x08, 0x82);
+	raydium_rm67200_write(ctx, 0x0A, 0x00);
+	raydium_rm67200_write(ctx, 0x0B, 0x00);
+	raydium_rm67200_write(ctx, 0x0C, 0x01);
+	raydium_rm67200_write(ctx, 0x16, 0x00);
+	raydium_rm67200_write(ctx, 0x18, 0x02);
+	raydium_rm67200_write(ctx, 0x1B, 0x04);
+	raydium_rm67200_write(ctx, 0x19, 0x04);
+	raydium_rm67200_write(ctx, 0x1C, 0x81);
+	raydium_rm67200_write(ctx, 0x1F, 0x00);
+	raydium_rm67200_write(ctx, 0x20, 0x03);
+	raydium_rm67200_write(ctx, 0x23, 0x04);
+	raydium_rm67200_write(ctx, 0x21, 0x01);
+	raydium_rm67200_write(ctx, 0x54, 0x63);
+	raydium_rm67200_write(ctx, 0x55, 0x54);
+	raydium_rm67200_write(ctx, 0x6E, 0x45);
+	raydium_rm67200_write(ctx, 0x6D, 0x36);
+	raydium_rm67200_write(ctx, 0xFE, 0x3D);
+	raydium_rm67200_write(ctx, 0x55, 0x78);
+	raydium_rm67200_write(ctx, 0xFE, 0x20);
+	raydium_rm67200_write(ctx, 0x26, 0x30);
+	raydium_rm67200_write(ctx, 0xFE, 0x3D);
+	raydium_rm67200_write(ctx, 0x20, 0x71);
+	raydium_rm67200_write(ctx, 0x50, 0x8F);
+	raydium_rm67200_write(ctx, 0x51, 0x8F);
+	raydium_rm67200_write(ctx, 0xFE, 0x00);
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
+	msleep(60);
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
+
+	msleep(60);
+
+	return ctx.accum_err;
+}
+
+static int raydium_rm67200_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+
+	drm_connector_helper_get_modes_fixed(connector, &ctx->panel_info->mode);
+	return 1;
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

