Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC6A70850
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B286710E298;
	Tue, 25 Mar 2025 17:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMuU0F7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9410E59E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:59:01 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id
 38308e7fff4ca-30613802a04so58160431fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742918340; x=1743523140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgY2IQXgZBDgO1RkevH0srrRVMm7I6eBTl+a0P2XanY=;
 b=VMuU0F7f2dedU4ObwKj87x5DPM/boXxj/Sjr3FtvsWV9aVYnB36n1N5b+PC4HQ8Vkr
 b6w9BTfGpAE4nJ2+w7keovr9k6rV1Gp6G3vqDFSHJFGaM8aRrZ50yNmmLR4CBlKinYUJ
 3k3adwZQ+0gjPEKsllvYjXugeROsg4/VZBwCjz/uBG/kzepvAgX5oRyEo/J0V+prUp39
 cIBT7GQMGAYe7JJZzLz06VJeb65qvO3av2jabIkUd/2zNLJAyWAWy72IR9gJ2NFVfjVP
 7NxJjDJcyriwA9GgRPv4H1RvEahbUt3RJq7Aa2NSyi/rKPC7N1bhjPVsVVRbOD71Mqce
 2mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742918340; x=1743523140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgY2IQXgZBDgO1RkevH0srrRVMm7I6eBTl+a0P2XanY=;
 b=GiQxUtVpv1fLkeEFFA23ySxiflN84LsgNvS2BkmbIpTbLxDtQdG6WeLVXIfSlEkNpN
 s/q1KF8ex7ogkt8DnCc6ejYayyH2vFO4tOr6XEqG1/dLIOnroFKkzj8aVb2iM/MSavUD
 +uZTFyP0A5/zh5dAMCTIam+t3z05eEXwGXXLVnXeZFlFPOAw0EE5JVSjKOiVUWyKDM/I
 kxS8n+2R5MIIyXJ82KdtsdXdKIQgjtX1grPejsNaCiKgTqQD9rx2HJiwRTlBvO9guuIC
 VlPyVqThjuwd4299FzXwpOwX5z8F3wZufscaNw5nVwqZqtk5d7FgfL3dVO3QDD4DXf7B
 kcjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn9R9HrAIDe44H/2MGLlixHXUaIjTN5dxH+FgIW9CUs5XyKoGRkDwHSPbDI5gbCBTjsg/6Rr6nzVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlJj2duU08z/7q8s/G6fAwqN4rMmR7C/+glMt3saKwYx7jt/6m
 0RH3evKHN317w8wPoNeIHSvWOs4pIXVinUfTjmNCK8uUpfdoP+ag
X-Gm-Gg: ASbGncsdzajjs/rz3A3bMti/ENFGChrjFYPLQShbi/sl+3CNTJsrW9d/nKZehEfx0Xw
 WTLcOsmyTHiGAlKlA0PP3Lamngd15WdGocYNej1Q/S6tVYKmHGWbn0iokHQwLS4bsEl1QmIGDjN
 VUcCaaJIRjiZPWRp+OCAOc+DtpTZbN3lm3mt5RXZw3mkjnSS68Vi5CdtcrG+aZ3Hc1QRBn6wlia
 daESXxJ1NFIW/GvTEShaW0tqsj/a/RzG/UsZk5RKJLPIj4rBDwDwxcSg0dYSwlfxSguJRHFSZT+
 kSrfy27MwmYJFBy9OI2cSCk2gWRP3ieLrq8ddHKkfEaSWcilnhDLj3aM/A==
X-Google-Smtp-Source: AGHT+IFTU+LrfX26FtV6wwS07QVqW8fJrSCH9C7qWM5mmCk6TVKvRYxSvjG/rGBXb012AlX001tU1w==
X-Received: by 2002:a05:6512:1148:b0:549:9078:dd45 with SMTP id
 2adb3069b0e04-54ad648f673mr5855241e87.28.1742918339456; 
 Tue, 25 Mar 2025 08:58:59 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad646cedfsm1544573e87.2.2025.03.25.08.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 08:58:58 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: Add Visionox G2647FB105 panel driver
Date: Tue, 25 Mar 2025 18:57:49 +0300
Message-ID: <20250325155756.703907-3-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325155756.703907-1-sanyapilot496@gmail.com>
References: <20250325155756.703907-1-sanyapilot496@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Mar 2025 17:37:54 +0000
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

Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
support found in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 277 ++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1d..c4de2749260d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -977,6 +977,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_VISIONOX_G2647FB105
+	tristate "Visionox G2647FB105"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Visionox
+	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
+
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cac..31dc893e0b16 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
new file mode 100644
index 000000000000..cf80310de13c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ *   Copyright (c) 2025, Alexander Baransky <sanyapilot496@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct visionox_g2647fb105 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[4];
+};
+
+static inline
+struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_g2647fb105, panel);
+}
+
+static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_prepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	visionox_g2647fb105_reset(ctx);
+
+	ret = visionox_g2647fb105_on(ctx);
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
+static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = visionox_g2647fb105_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode visionox_g2647fb105_mode = {
+	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 4,
+	.htotal = 1080 + 28 + 4 + 36,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 8,
+	.vsync_end = 2340 + 8 + 4,
+	.vtotal = 2340 + 8 + 4 + 4,
+	.width_mm = 69,
+	.height_mm = 149,
+};
+
+static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &visionox_g2647fb105_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
+	.prepare = visionox_g2647fb105_prepare,
+	.unprepare = visionox_g2647fb105_unprepare,
+	.get_modes = visionox_g2647fb105_get_modes,
+};
+
+static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops visionox_g2647fb105_bl_ops = {
+	.update_status = visionox_g2647fb105_bl_update_status,
+};
+
+static struct backlight_device *
+visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 1023,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &visionox_g2647fb105_bl_ops, &props);
+}
+
+static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct visionox_g2647fb105 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vdd3p3";
+	ctx->supplies[1].supply = "vddio";
+	ctx->supplies[2].supply = "vsn";
+	ctx->supplies[3].supply = "vsp";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+								ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	ctx->panel.prepare_prev_first = true;
+
+	drm_panel_init(&ctx->panel, dev, &visionox_g2647fb105_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = visionox_g2647fb105_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id visionox_g2647fb105_of_match[] = {
+	{ .compatible = "visionox,g2647fb105" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
+
+static struct mipi_dsi_driver visionox_g2647fb105_driver = {
+	.probe = visionox_g2647fb105_probe,
+	.remove = visionox_g2647fb105_remove,
+	.driver = {
+		.name = "panel-visionox-g2647fb105",
+		.of_match_table = visionox_g2647fb105_of_match,
+	},
+};
+module_mipi_dsi_driver(visionox_g2647fb105_driver);
+
+MODULE_AUTHOR("Alexander Baransky <sanyapilot496@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.49.0

