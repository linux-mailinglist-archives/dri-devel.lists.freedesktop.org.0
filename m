Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A255B96234B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65DF10E4EB;
	Wed, 28 Aug 2024 09:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P8GEE/zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EB810E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:22:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-428e3129851so58268565e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724836970; x=1725441770; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a11ZNocbbz3kyRaAC7cF4Ay7yNkbi/O4t0+tfyTTdcU=;
 b=P8GEE/zqNY613Ji5Q+NzEHXfSISbNxPtw4LACnt1es49evRjRpXSc7Y5qwJ+f6xVbn
 mJJLn14ZzGFqWoNHDKtt/RPxPER00AmpRqpFh4lypcDHOGHTJPWvHOW1F3Zszpn+fWmr
 EKy+jow6Bjrc07J2IiGmLS1BP1dWAlsx4/F3PfsREpjDUs7adrfgB2Th6oVAhI8P1sHu
 DS76qc2u2uZRzIhHma8a54v010TlSgsLb6kYDWp8ii498NxQ2zhAEXRC9010TnkC30lO
 pZQvLM3+fgfAD3EqpJtljievPDzNjXSoSDt8tnnxPf3nlL8Ccaa5vpUHKDRtzm/RbRZp
 cVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724836970; x=1725441770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a11ZNocbbz3kyRaAC7cF4Ay7yNkbi/O4t0+tfyTTdcU=;
 b=SyUNV131R+rdobEX5BhSg9oXEESgcwzIZZjndihUOPSPXJz1IuzYEO+j8HUJDxY2d1
 jXU7eF6NV9YwydEhM6GmtOvvsAVzU1zuzvo0Cq+vDOgswAnZBVklzKyf+NEStb3jBwa5
 VcoNTd3gxiaWEYZJ/gh81Kv4dMFo8wXMAfpCe9SEZBF1x3PsFFOv1YOVUJZ1/vscMdBP
 iv0JJ6+Op5ATcDAjiiokGCF3vbNDRS9wIODrXEnyXNLDG8YVfrcTa29VgIgB1P1ncU2+
 7ZGGWbfokWsGiaEPT9Q8IiG2GaktXiFSS7yJLMWZlGLPZQEnUQtn+WITcTXxqylG+9wW
 452g==
X-Gm-Message-State: AOJu0YwVEC0o7hM3+pT49Gs/mxROII5NBr1fn6NxbH/9sPQ6FZbXgbMK
 KFaUwCqb7XGbioxEVnvwUduXX9tSEkVheQO4rlypxG1JX+Dh+Wz7dvQo2Q4sX0k=
X-Google-Smtp-Source: AGHT+IFV4iNoHo0SSviNsBfEP0gLR31Md7+rrQU4sWelDaC2ZHUBanCZHYdrZ95oWypoCwQRLRzhJA==
X-Received: by 2002:a05:600c:4ed2:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-42ba66c1778mr8308375e9.33.1724836969858; 
 Wed, 28 Aug 2024 02:22:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639687csm15002435e9.8.2024.08.28.02.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:22:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 11:22:41 +0200
Subject: [PATCH v2 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-2-0a039d064e13@linaro.org>
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
In-Reply-To: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9308;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JitwVuPFVb1+3AFQ2BWRFPfjDcFprji2Me8bnvq/V1A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzuxmvylHMUIXC6tpc4F/c7BJxnK3XGXZgsuNtbBh
 DbnN/BiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs7sZgAKCRB33NvayMhJ0WZvEA
 CHz8wU6zdDfrh1WFncUEUuwnfjHMXbLnZiVeyBT/DkFK6T82ggvzwSLig2uczXTAfsckLnjQEv6kbe
 TlWwK5h3044DOkVjEo+Rtt6gCdO1XNtQn6Rc8Cm6I68obJVegQMdeN1aCEKmdFmD5cjBxTqEqHHgE7
 6rkb73IMSNRWmjudQ9d7UJybdBGyawtNsPDyu4IUmdH6EUhJGaCCTlu/ZW6qyZzbZdSaU3c4xE2jEr
 f0tteLBpLW3DUXRHqTYda6AD3ff7Y7qkhei3YBR+SNPasASZTAxs/pVJ7CJHdmt/0MzP68F+H+mD7q
 ay+6vUL6q5txoCSMetlS2h/9Kj9Mqj5KZaoAMTMAVuvySLBbXDVhKGMpaY5Zss39w1/gNyflPZGmSK
 bOu/jA0EtdiySsl5jI4yZAZA1duX9IsvaMobel32InEWA5QEGUGGf6rBWUS0y89lTNt8nDzoCrB/qA
 qYTr5wkFgJ0CGo5eGjBU24OFum5Ucviog4Il1nyi9YPxQIpscPGaWKvdV44V0mmaVNcKK4+F2ZQDLC
 px2BVz2EIRkw+LczziMdOoF2W0KhNuA3LFe4jSlidRaTXlzvjRapv66z78z/Z+R6oDRYxsdn6VsXYJ
 kO+PhKF/v5wSc9VO46LFVUk4stUqGEBFXmXHuT/ss+p3Rvvi47iV7MIDxlQA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add support for the 1200x1920 BOE TV101WUM-LL2 DSI Display Panel found
in the Lenovo Smart Tab M10 tablet. The controller is unknown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                  |   9 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c | 243 +++++++++++++++++++++++++
 3 files changed, 253 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 5d83ddc06ece..d3a9a9fafe4e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -87,6 +87,15 @@ config DRM_PANEL_BOE_TV101WUM_NL6
 	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
 	  45NA WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_BOE_TV101WUM_LL2
+	tristate "BOE TV101WUM LL2 1200x1920 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to support for BOE TV101WUM-LL2
+	  WUXGA PANEL DSI Video Mode panel
+
 config DRM_PANEL_EBBG_FT8719
 	tristate "EBBG FT8719 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 5581387707c6..987a08702410 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
 obj-$(CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0) += panel-boe-bf060y8m-aj0.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) += panel-boe-th101mb31ig002-28a.o
+obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) += panel-boe-tv101wum-ll2.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
new file mode 100644
index 000000000000..ec6a177ef888
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+//   Copyright (c) 2024, Neil Armstrong <neil.armstrong@linaro.org>
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
+struct boe_tv101wum_ll2 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data boe_tv101wum_ll2_supplies[] = {
+	{ .supply = "vsp" },
+	{ .supply = "vsn" },
+};
+
+static inline struct boe_tv101wum_ll2 *to_boe_tv101wum_ll2(struct drm_panel *panel)
+{
+	return container_of(panel, struct boe_tv101wum_ll2, panel);
+}
+
+static void boe_tv101wum_ll2_reset(struct boe_tv101wum_ll2 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	msleep(120);
+}
+
+static int boe_tv101wum_ll2_on(struct boe_tv101wum_ll2 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x5a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0xff, 0x81, 0x68, 0x6c, 0x22,
+				     0x6d, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x5a, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x94, 0x2c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x5a, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa2, 0x38);
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x50, 0x5a, 0x0c);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xfd);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x50, 0x00);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int boe_tv101wum_ll2_off(struct boe_tv101wum_ll2 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 70);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5a);
+
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	return dsi_ctx.accum_err;
+}
+
+static int boe_tv101wum_ll2_prepare(struct drm_panel *panel)
+{
+	struct boe_tv101wum_ll2 *ctx = to_boe_tv101wum_ll2(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(boe_tv101wum_ll2_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	boe_tv101wum_ll2_reset(ctx);
+
+	ret = boe_tv101wum_ll2_on(ctx);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(boe_tv101wum_ll2_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int boe_tv101wum_ll2_unprepare(struct drm_panel *panel)
+{
+	struct boe_tv101wum_ll2 *ctx = to_boe_tv101wum_ll2(panel);
+
+	/* Ignore errors on failure, in any case set gpio and disable regulators */
+	boe_tv101wum_ll2_off(ctx);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(boe_tv101wum_ll2_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode boe_tv101wum_ll2_mode = {
+	.clock = (1200 + 27 + 8 + 12) * (1920 + 155 + 8 + 32) * 60 / 1000,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 27,
+	.hsync_end = 1200 + 27 + 8,
+	.htotal = 1200 + 27 + 8 + 12,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 155,
+	.vsync_end = 1920 + 155 + 8,
+	.vtotal = 1920 + 155 + 8 + 32,
+	.width_mm = 136,
+	.height_mm = 217,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int boe_tv101wum_ll2_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	/* We do not set display_info.bpc since unset value is bpc=8 by default */
+	return drm_connector_helper_get_modes_fixed(connector, &boe_tv101wum_ll2_mode);
+}
+
+static const struct drm_panel_funcs boe_tv101wum_ll2_panel_funcs = {
+	.prepare = boe_tv101wum_ll2_prepare,
+	.unprepare = boe_tv101wum_ll2_unprepare,
+	.get_modes = boe_tv101wum_ll2_get_modes,
+};
+
+static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct boe_tv101wum_ll2 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					ARRAY_SIZE(boe_tv101wum_ll2_supplies),
+					boe_tv101wum_ll2_supplies,
+					&ctx->supplies);
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
+			  MIPI_DSI_MODE_VIDEO_HSE;
+
+	drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
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
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void boe_tv101wum_ll2_remove(struct mipi_dsi_device *dsi)
+{
+	struct boe_tv101wum_ll2 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id boe_tv101wum_ll2_of_match[] = {
+	{ .compatible = "boe,tv101wum-ll2" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, boe_tv101wum_ll2_of_match);
+
+static struct mipi_dsi_driver boe_tv101wum_ll2_driver = {
+	.probe = boe_tv101wum_ll2_probe,
+	.remove = boe_tv101wum_ll2_remove,
+	.driver = {
+		.name = "panel-boe-tv101wum_ll2",
+		.of_match_table = boe_tv101wum_ll2_of_match,
+	},
+};
+module_mipi_dsi_driver(boe_tv101wum_ll2_driver);
+
+MODULE_DESCRIPTION("DRM driver for BOE TV101WUM-LL2 Panel");
+MODULE_LICENSE("GPL");

-- 
2.34.1

