Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738F769989
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A0E10E1AF;
	Mon, 31 Jul 2023 14:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD5B10E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:31:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-314417861b9so3845727f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690813915; x=1691418715; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YxpXkYaIGzW41hant1uhDW37umD82oGFuc0Z2kbuN2g=;
 b=yoGy8HAZ8YkvvGYpl1Zy2qRRfPuU8pBYdkPf2AhI1ZDZGxTZM+oD0bB9ASvEWKqjAP
 u2paIPaFD6n7Y5dUaHH4uCZHXFFHrLvNTWY935Lwof1pkPeMawo5TjBLuW3fYr8+6G0k
 wU+HHAob0Gi5dKoTcULRn5Ld+lmt4Nzo4VGDN/jsXF9akoq1WvADX0SAGEEx1+D2ZdWr
 kE4Hc7BwC38Q6LCK4NUeyPzZ6f1N+GYUEH3ugILbIue8mElh/8B0gHpityT6CK4dayjV
 3B6FXj9XvDOt4BewRTfvg9t9eHphDXD0AyAZA1AEVaDIujtwrCSmjk14hHN6yAAuaL+9
 0NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690813915; x=1691418715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxpXkYaIGzW41hant1uhDW37umD82oGFuc0Z2kbuN2g=;
 b=NcmZe1f7iq1vwmJRfscdvBc8UmEAy4fRpsx23v4KAIqVojJrg9o/9HXiffIlIuApMu
 F0Kdp7cPtrNji5oldkE4eM1+VxjabH1OoBlq35kfZmVhftcj2ySKN3085cPeYCvm1r4o
 OYOWyZSfvc9+5Pp6rSR9K+gANSRxxXTuD7AJDsiBZWhnWq0Fq1iTu2ozxmoIlAp4QcKq
 KP7FCwTnrBHZFeYgMFj+3/lEMcpRbqLNCz7KieltNgkLvu+JdrCUaLbl5NJ7LrwzK2Ph
 I8ITnPdd8+MDoUh527VLJgtCiKLXsGGajtZcZHV/jU9nmvHYD10gRqSTpk5MA0mahRLL
 Lrmg==
X-Gm-Message-State: ABy/qLYiZ0dkXkSUnh7zN8W6ypEdEnSe2X4rNqjxZJCFD7+DwbI5Ivjq
 xo1t9kIGIaOlLmhRwnRBIS8wYQ==
X-Google-Smtp-Source: APBJJlF71IgLFTZ0FRC8sq65FDqjFQmxhxGRioig6iebT2gy63PFVVfMASf7Vsp6SObmIrg9ncJ2Ew==
X-Received: by 2002:adf:edcd:0:b0:314:8d:7eb5 with SMTP id
 v13-20020adfedcd000000b00314008d7eb5mr8901wro.29.1690813915666; 
 Mon, 31 Jul 2023 07:31:55 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020adfefc8000000b0030ada01ca78sm13301675wrp.10.2023.07.31.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:31:55 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 31 Jul 2023 16:31:46 +0200
Subject: [PATCH v3 2/3] drm/panel: Support for startek-kd070fhfid015
 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v3-2-dc847e6b359b@baylibre.com>
References: <20230711-startek_display-v3-0-dc847e6b359b@baylibre.com>
In-Reply-To: <20230711-startek_display-v3-0-dc847e6b359b@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12977;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=oyKSogIgtFI+FXdejaJbM0UC9Km/nJHsUg1q0asfWDI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx8XX07Cp5h7VaRK6yvHJd97T8K0QDxTLe1kHdk6s
 Pmeg8OSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfF1wAKCRArRkmdfjHURWjQD/
 92YExgkVbr03f1d4by5WdIdig6vFThSB3PjrckRYG6xiKQxC8MPpbpRa5LL84aKOhSdTHdNFHGcc0z
 v4UoBBhk7G8WweeLeBlr34M39mbAKUykRPqQDtznbb4AaUI5OP09WLVIaTGQgMNkQFO/fFNKYQAU3z
 O8+dnrTO2rqPi3QZNMCUjGdOoJwsjLVmKu95c3yX41AFzke1RDTAVySioD2DkKOowyINFrbfPz6vyS
 IkteI40WZzS7eBjb1enQRtUxkAaMjIRw5jtgIocBZ7PFcOnFcMdClqIu+cCDpRbge0/KcNIGIBg8qe
 2VY/Coh1gfV7hMUbhvmBmCb8WfqmluPAmiXZM8ZLpE+6XDUDi0qPPa5d7G5KA0GjAYDJnJ+mf1Y9Zr
 joFGaKk0vs/t/q9NtSRaWgwbc+X5tAi2QfB54AH7G/BzuyjiWfqKbHn8oJLYQmxL+OQ2WZGwuuFIlx
 KcJRGybLBaZWPL37L6Ldvbnrz9+0Wk1gzWi1C837DqSjd8Nlc+axzg7pG5cNokrBZtnl1ef6eBiNSs
 bMC0n0ZR10/WeGnCdJT7hZIOhj33vLQIrvtG2H+zg9TrNvHB9VNuM0OsrZgH5U94+c7+2n6Kk47CAg
 CctMg4xwOixKM/aO0nxzFCfmn8+Hfataod/VT+/MjRUx43xxa4bvGwvSmhvQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guillaume La Roque <glaroque@baylibre.com>

This driver support the Startek KD070FHFID015, which is a 7-inch TFT LCD
display using MIPI DSI interface.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 412 +++++++++++++++++++++
 3 files changed, 424 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 203c0ef0bbfd..c45e877c22c1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -733,6 +733,17 @@ config DRM_PANEL_SONY_TULIP_TRULY_NT35521
 	  NT35521 1280x720 video mode panel as found on Sony Xperia M4
 	  Aqua phone.
 
+config DRM_PANEL_STARTEK_KD070FHFID015
+	tristate "STARTEK KD070FHFID015 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for STARTEK KD070FHFID015 DSI panel
+	  based on RENESAS-R69429 controller. The pannel is a 7-inch TFT LCD display
+	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
+	  the host, a built-in LED backlight and touch controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 30cf553c8d1d..f8b362091ce7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
+obj-$(CONFIG_DRM_PANEL_STARTEK_KD070FHFID015) += panel-startek-kd070fhfid015.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
new file mode 100644
index 000000000000..1ed950195cdf
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016 InforceComputing
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2023 BayLibre, SAS
+ *
+ * Authors:
+ * - Vinay Simha BN <simhavcs@gmail.com>
+ * - Sumit Semwal <sumit.semwal@linaro.org>
+ * - Guillaume La Roque <glaroque@baylibre.com>
+ *
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define DSI_REG_MCAP	0xB0
+#define DSI_REG_IS	0xB3 /* Interface Setting */
+#define DSI_REG_IIS	0xB4 /* Interface ID Setting */
+#define DSI_REG_CTRL	0xB6
+
+enum {
+	IOVCC = 0,
+	POWER = 1
+};
+
+struct stk_panel {
+	bool prepared;
+	const struct drm_display_mode *mode;
+	struct backlight_device *backlight;
+	struct drm_panel base;
+	struct gpio_desc *enable_gpio; /* Power IC supply enable */
+	struct gpio_desc *reset_gpio; /* External reset */
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data supplies[2];
+};
+
+static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct stk_panel, base);
+}
+
+static int stk_panel_init(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_soft_reset(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
+		return ret;
+	}
+	mdelay(5);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	mipi_dsi_generic_write_seq(dsi, DSI_REG_MCAP, 0x04);
+
+	/* Interface setting, video mode */
+	mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
+	mipi_dsi_generic_write_seq(dsi, DSI_REG_IIS, 0x0C, 0x00);
+	mipi_dsi_generic_write_seq(dsi, DSI_REG_CTRL, 0x3A, 0xD3);
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
+	if (ret < 0) {
+		dev_err(dev, "failed to write display brightness: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				 MIPI_DCS_WRITE_MEMORY_START);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
+	if (ret < 0) {
+		dev_err(dev, "failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to set column address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int stk_panel_on(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to set display on: %d\n", ret);
+
+	mdelay(20);
+
+	return ret;
+}
+
+static void stk_panel_off(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+
+	msleep(100);
+}
+
+static int stk_panel_unprepare(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+
+	if (!stk->prepared)
+		return 0;
+
+	stk_panel_off(stk);
+	regulator_bulk_disable(ARRAY_SIZE(stk->supplies), stk->supplies);
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->enable_gpio, 1);
+
+	stk->prepared = false;
+
+	return 0;
+}
+
+static int stk_panel_prepare(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	if (stk->prepared)
+		return 0;
+
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->enable_gpio, 0);
+	ret = regulator_enable(stk->supplies[IOVCC].consumer);
+	if (ret < 0)
+		return ret;
+
+	mdelay(8);
+	ret = regulator_enable(stk->supplies[POWER].consumer);
+	if (ret < 0)
+		goto iovccoff;
+
+	mdelay(20);
+	gpiod_set_value(stk->enable_gpio, 1);
+	mdelay(20);
+	gpiod_set_value(stk->reset_gpio, 1);
+	mdelay(10);
+	ret = stk_panel_init(stk);
+	if (ret < 0) {
+		dev_err(dev, "failed to init panel: %d\n", ret);
+		goto poweroff;
+	}
+
+	ret = stk_panel_on(stk);
+	if (ret < 0) {
+		dev_err(dev, "failed to set panel on: %d\n", ret);
+		goto poweroff;
+	}
+
+	stk->prepared = true;
+
+	return 0;
+
+poweroff:
+	regulator_disable(stk->supplies[POWER].consumer);
+iovccoff:
+	regulator_disable(stk->supplies[IOVCC].consumer);
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->enable_gpio, 0);
+
+	return ret;
+}
+
+static const struct drm_display_mode default_mode = {
+		.clock = 163204,
+		.hdisplay = 1200,
+		.hsync_start = 1200 + 144,
+		.hsync_end = 1200 + 144 + 16,
+		.htotal = 1200 + 144 + 16 + 45,
+		.vdisplay = 1920,
+		.vsync_start = 1920 + 8,
+		.vsync_end = 1920 + 8 + 4,
+		.vtotal = 1920 + 8 + 4 + 4,
+		.width_mm = 95,
+		.height_mm = 151,
+};
+
+static int stk_panel_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			drm_mode_vrefresh(&default_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+	connector->display_info.width_mm = default_mode.width_mm;
+	connector->display_info.height_mm = default_mode.height_mm;
+	return 1;
+}
+
+static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	int ret;
+	u16 brightness;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	return brightness & 0xff;
+}
+
+static int dsi_dcs_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	if (ret < 0) {
+		dev_err(dev, "failed to set DSI control: %d\n", ret);
+		return ret;
+	}
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	return 0;
+}
+
+static const struct backlight_ops dsi_bl_ops = {
+	.update_status = dsi_dcs_bl_update_status,
+	.get_brightness = dsi_dcs_bl_get_brightness,
+};
+
+static struct backlight_device *
+drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &dsi_bl_ops, &props);
+}
+
+static const struct drm_panel_funcs stk_panel_funcs = {
+	.unprepare = stk_panel_unprepare,
+	.prepare = stk_panel_prepare,
+	.get_modes = stk_panel_get_modes,
+};
+
+static const struct of_device_id stk_of_match[] = {
+	{ .compatible = "startek,kd070fhfid015", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stk_of_match);
+
+static int stk_panel_add(struct stk_panel *stk)
+{
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	stk->mode = &default_mode;
+
+	stk->supplies[IOVCC].supply = "iovcc";
+	stk->supplies[POWER].supply = "power";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(stk->supplies), stk->supplies);
+	if (ret) {
+		dev_err(dev, "regulator_bulk failed\n");
+		return ret;
+	}
+
+	stk->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(stk->reset_gpio)) {
+		ret = PTR_ERR(stk->reset_gpio);
+		dev_err(dev, "cannot get reset-gpios %d\n", ret);
+		return ret;
+	}
+
+	stk->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(stk->enable_gpio)) {
+		ret = PTR_ERR(stk->enable_gpio);
+		dev_err(dev, "cannot get enable-gpio %d\n", ret);
+		return ret;
+	}
+
+	stk->backlight = drm_panel_create_dsi_backlight(stk->dsi);
+	if (IS_ERR(stk->backlight)) {
+		ret = PTR_ERR(stk->backlight);
+		dev_err(dev, "failed to register backlight %d\n", ret);
+		return ret;
+	}
+
+	drm_panel_init(&stk->base, &stk->dsi->dev, &stk_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&stk->base);
+
+	return 0;
+}
+
+static int stk_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk;
+	int ret;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM);
+
+	stk = devm_kzalloc(&dsi->dev, sizeof(*stk), GFP_KERNEL);
+	if (!stk)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, stk);
+
+	stk->dsi = dsi;
+
+	ret = stk_panel_add(stk);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&stk->base);
+
+	return 0;
+}
+
+static void stk_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
+			err);
+
+	drm_panel_remove(&stk->base);
+}
+
+static void stk_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
+}
+
+static struct mipi_dsi_driver stk_panel_driver = {
+	.driver = {
+		.name = "panel-startek-kd070fhfid015",
+		.of_match_table = stk_of_match,
+	},
+	.probe = stk_panel_probe,
+	.remove = stk_panel_remove,
+	.shutdown = stk_panel_shutdown,
+};
+module_mipi_dsi_driver(stk_panel_driver);
+
+MODULE_AUTHOR("Guillaume La Roque <glaroque@baylibre.com>");
+MODULE_DESCRIPTION("STARTEK KD070FHFID015");
+MODULE_LICENSE("GPL");

-- 
2.25.1

