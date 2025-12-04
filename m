Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E802CCA2735
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341CE10E1BB;
	Thu,  4 Dec 2025 06:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fxkyYRKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D0510E1BA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so827460a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828414; x=1765433214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
 b=fxkyYRKVbHivmhIVg2WLWcYJO0wOLVqNrPLmrCMN0iwhtSTmeUyINskpqApIAXbnjB
 E+bnMCuYKJ6htAF6oby7CMVMgHVcXgbifd5ChMIHEqs7l8IY45HWwsRqH6leorKvUaZQ
 DF5hWm1ldtx/+JahGSW0V+RtEtaq3aBvkX5TK4cRDoAMAOKFnRh1sE0N2lLpmlSopr2n
 hQcVHxN3fvBabKIINDam2ISoVyqZwAQpJm9y2EloZDZGlIy8Bc14i+5VcK44u/U8JNsL
 ufVNFM/5GHrVTx647p64kRzPP+iUNUqfT8TJ3h7QH9MhFZwftbySLP1gkhOFF19RJDww
 vkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828414; x=1765433214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
 b=GSNBZd9pEORx06BjHxBV88bKd3TnK94z/Txmz/Zd2r6jxynFcIVduY37LFe2cbJA8N
 pe6QiyrcJugYAmQiClu8Ygk+aFyjR4f3v11bxg1KU0uzpJmKuUQ+1aj9EP6n1yoPwQPo
 iciDHC1VpTKAL0d+PAoWSpqUmNfpUT5pNWbW/JfPctLl7ORJDtwIrjvpgqjv/OWjnVqt
 PxHn0jgm00uryvoo+1X5Vk12AEPuEVOjNpKgsKQXnFShh8PHTM1jxiSoUUyO86l5WqfQ
 qGpL6c4RCJeZhpuKPO69BjwBmekjKjxHLdNZ/dmuNCYyNfUuHbw5oEqzsUHeQW06lElj
 QyTQ==
X-Gm-Message-State: AOJu0Yy5j6ejJo/i/QOBbo9Povnp+1i0VTdMMu6tSsfsYv33/V+6uh04
 RyVdFfkVGx3cYiP5XNhN70pYsUEaGc+IP4yb0MGeeAKpZHDLWuBJtppK
X-Gm-Gg: ASbGncsW47yZH2mmUHX/YsJ8a614rPl9eotZsHiDh2PiGLXB0bQE+ryrjwK/lDPR0wq
 mNk+kmyPfwQgB+9Fc9iO0abRwodEu8lHb5LPtoz/68/+Hdo2KrRy5D0t4OG0iW4XEHyn30gnlM5
 pV+ayzfNYeOdgnLKWjNRcmOCQIgBqspotMDFewRw9FYNbQC4sBYXGnXkSFBB/2G+0keduZQwGqv
 hVpK3ufUmsE3s0x0jAz6yaaRLMe5Bm1NlN6QU6mawHvLTz+s4d0AluKtlNgTClZ+YC4B3pdMTP2
 YZdK0JIjujvLBBZH1cSxangx9UDarw72j9T6wpMcga3qO4szlzlmV+ldDwaF19BS3bt98pzfRKr
 wAQ20hT+IUHSNGrHsotZiGbHlURXr7OW6eoIXW1DaIjyF/A38gW1ChEvP7xd0uWeSP0PB3IdS0Z
 A=
X-Google-Smtp-Source: AGHT+IGIY456nDKAquJYqhqJz5aNWSg1c8AIQiMpWzN3vSnECpyPWlD0YcfkKel4ArG/Oznrht9jIQ==
X-Received: by 2002:a05:6402:42c9:b0:645:dc9d:83bc with SMTP id
 4fb4d7f45d1cf-6479c41fc11mr4336412a12.14.1764828413739; 
 Wed, 03 Dec 2025 22:06:53 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 2/7 RESEND] gpu/drm: panel: add support for LG
 LD070WX3-SL01 MIPI DSI panel
Date: Thu,  4 Dec 2025 08:06:18 +0200
Message-ID: <20251204060627.4727-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LD070WX3 is a Color Active Matrix Liquid Crystal Display with an
integral Light Emitting Diode (LED) backlight system. The matrix employs
a-Si Thin Film Transistor as the active element. It is a transmissive type
display operating in the normally Black mode. This TFT-LCD has 7.0 inches
diagonally measured active display area with WXGA resolution (800 by 1280
pixel array).

LG LD070WX3-SL01 MIPI DSI panel was treated as simple DSI panel when it is
actually not and requires proper setup for correct work. Simple panel work
relied on preliminary configuration done by bootloader.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 184 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c      |  31 ----
 4 files changed, 198 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 045ffb2ccd0f..1f660ba065a1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -408,6 +408,19 @@ config DRM_PANEL_LG_LB035Q02
 	  (found on the Gumstix Overo Palo35 board). To compile this driver as
 	  a module, choose M here.
 
+config DRM_PANEL_LG_LD070WX3
+	tristate "LG LD070WX3 MIPI DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the LD070WX3 MIPI DSI
+	  panel found in the NVIDIA Tegra Note 7 tablet.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called panel-lg-ld070wx3.
+
 config DRM_PANEL_LG_LG4573
 	tristate "LG4573 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 0356775a443a..9281221183ac 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
+obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
diff --git a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
new file mode 100644
index 000000000000..00cbfc5518a5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data lg_ld070wx3_supplies[] = {
+	{ .supply = "vdd" }, { .supply = "vcc" },
+};
+
+struct lg_ld070wx3 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator_bulk_data *supplies;
+};
+
+static inline struct lg_ld070wx3 *to_lg_ld070wx3(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg_ld070wx3, panel);
+}
+
+static int lg_ld070wx3_prepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+	struct device *dev = panel->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * According to spec delay between enabling supply is 0,
+	 * for regulators to reach required voltage ~5ms needed.
+	 * MIPI interface signal for setup requires additional
+	 * 110ms which in total results in 115ms.
+	 */
+	mdelay(115);
+
+	mipi_dsi_dcs_soft_reset_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	/* Differential input impedance selection */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
+
+	/* Enter test mode 1 and 2*/
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
+
+	/* Increased MIPI CLK driving ability */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
+
+	/* Exit test mode 1 and 2 */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
+
+	return ctx.accum_err;
+}
+
+static int lg_ld070wx3_unprepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	msleep(50);
+
+	regulator_bulk_disable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
+
+	/* power supply must be off for at least 1s after panel disable */
+	msleep(1000);
+
+	return 0;
+}
+
+static const struct drm_display_mode lg_ld070wx3_mode = {
+	.clock = (800 + 32 + 48 + 8) * (1280 + 5 + 3 + 1) * 60 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 32,
+	.hsync_end = 800 + 32 + 48,
+	.htotal = 800 + 32 + 48 + 8,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 5,
+	.vsync_end = 1280 + 5 + 3,
+	.vtotal = 1280 + 5 + 3 + 1,
+	.width_mm = 94,
+	.height_mm = 151,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int lg_ld070wx3_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &lg_ld070wx3_mode);
+}
+
+static const struct drm_panel_funcs lg_ld070wx3_panel_funcs = {
+	.prepare = lg_ld070wx3_prepare,
+	.unprepare = lg_ld070wx3_unprepare,
+	.get_modes = lg_ld070wx3_get_modes,
+};
+
+static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct lg_ld070wx3 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
+				    &lg_ld070wx3_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(lg_ld070wx3_supplies),
+					    lg_ld070wx3_supplies, &priv->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get supplies\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void lg_ld070wx3_remove(struct mipi_dsi_device *dsi)
+{
+	struct lg_ld070wx3 *priv = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id lg_ld070wx3_of_match[] = {
+	{ .compatible = "lg,ld070wx3-sl01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lg_ld070wx3_of_match);
+
+static struct mipi_dsi_driver lg_ld070wx3_driver = {
+	.driver = {
+		.name = "panel-lg-ld070wx3",
+		.of_match_table = lg_ld070wx3_of_match,
+	},
+	.probe = lg_ld070wx3_probe,
+	.remove = lg_ld070wx3_remove,
+};
+module_mipi_dsi_driver(lg_ld070wx3_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("LG LD070WX3-SL01 DSI panel driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index da6b71b70a46..6369e5828189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5600,34 +5600,6 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode lg_ld070wx3_sl01_mode = {
-	.clock = 71000,
-	.hdisplay = 800,
-	.hsync_start = 800 + 32,
-	.hsync_end = 800 + 32 + 1,
-	.htotal = 800 + 32 + 1 + 57,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 28,
-	.vsync_end = 1280 + 28 + 1,
-	.vtotal = 1280 + 28 + 1 + 14,
-};
-
-static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
-	.desc = {
-		.modes = &lg_ld070wx3_sl01_mode,
-		.num_modes = 1,
-		.bpc = 8,
-		.size = {
-			.width = 94,
-			.height = 151,
-		},
-		.connector_type = DRM_MODE_CONNECTOR_DSI,
-	},
-	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
-	.format = MIPI_DSI_FMT_RGB888,
-	.lanes = 4,
-};
-
 static const struct drm_display_mode lg_lh500wx1_sd03_mode = {
 	.clock = 67000,
 	.hdisplay = 720,
@@ -5751,9 +5723,6 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "boe,tv080wum-nl0",
 		.data = &boe_tv080wum_nl0
-	}, {
-		.compatible = "lg,ld070wx3-sl01",
-		.data = &lg_ld070wx3_sl01
 	}, {
 		.compatible = "lg,lh500wx1-sd03",
 		.data = &lg_lh500wx1_sd03
-- 
2.48.1

