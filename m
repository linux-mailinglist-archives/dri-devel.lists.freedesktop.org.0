Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47197B32E1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB1810E70D;
	Fri, 29 Sep 2023 12:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23AC10E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:54:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso144476166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695992070; x=1696596870; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PnHhSoBdf7XuQiadJVYaGHP6YZcGwM+gG+XCBzaF3W0=;
 b=cEgFgCwfnt+I9jbul0L/b9F5JJb3PFMfpCRi2ytb6q+D6cKgceWOIjvwvWH33gAlXi
 BPhoo1kWTjvB+I2OJZKquf5XRWVD+a4dUZ6f6am655aEyt2+Z5cGVi5AcBBTZp4jLp2n
 vtqjbywTCdDw6B6N5qDUk/atHZIcEuHzMVrlx+wlOfYIqBC9ogCI4kvixbEyAnFmtmXb
 4OfZX8jr/df/cISGjqxXp/jfCc5+5FWTL5urpRvwrrM00vdQFSL55cjZWN4+a6S4R4Qk
 SNlwxKQXMYoBNTqDErSEStPEZD5iW3TFHYM/lg2mGkM+GHFCFzb3/XPre0b4k3TUTI3n
 XP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695992070; x=1696596870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PnHhSoBdf7XuQiadJVYaGHP6YZcGwM+gG+XCBzaF3W0=;
 b=DgVPjy1QlMMKNsOhgwMLWEuXBkmaOeGiOJmGAn62BzehOMDR4O0r3yfswJVaZKOShM
 6rAx7NfqXVOxg8FRAOZ6NHLA8M7zXViWMUjXW+bt1jsQGMpERN1t3/tyF/eWMpMNOAKw
 m3EK82uZ0ZaYRklppppEImEjFh8SuyVe+301Ggp+cq4qITL/RhlFvsDexZOcRA+UYhoL
 NcERWRLJ6RiMvb8ngJYrxuIpEJTE73lZ2tvf/bbTQDy3hhwtxnM1g/aZEfANa9lF1xpO
 9/0MdMhfAOqi9YSz5U/u7XIsnqoqd2aKnssFyhZrsqZmZl67DRg0U5rS/j1L1J9COG9B
 B/vw==
X-Gm-Message-State: AOJu0YxPCtp3+00ZSmWOARQBJnTahNNv6pA0qQuBRqc3Yny85XU38e8l
 YOHOw1Yr1VcA6SuWxEYsHbG3fA==
X-Google-Smtp-Source: AGHT+IHPqOFR7o9dTYNV7ZOsPQegA0zGRMMQCpbPU3Univ//7uXfmWkJKIxafh33zPfdu8gfnSmssA==
X-Received: by 2002:a17:906:c146:b0:9a5:dc2b:6a5 with SMTP id
 dp6-20020a170906c14600b009a5dc2b06a5mr3573969ejc.35.1695992069876; 
 Fri, 29 Sep 2023 05:54:29 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906831a00b0099bc8bd9066sm12380376ejx.150.2023.09.29.05.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 05:54:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 29 Sep 2023 14:54:21 +0200
Subject: [PATCH v2 2/2] drm/panel: Add driver for BOE RM692E5 AMOLED panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-topic-fp5_disp-v2-2-7b5e1d1662a6@linaro.org>
References: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
In-Reply-To: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695992063; l=14734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xhFvMSRAktnscJ5HdAaQV6f8eDAQMl/fLhoJOm2JFY0=;
 b=P0OtNCnlOcjpKrMFtZ/4orkPU0gtxo0GZ+OAdarleml5Jr+zlipWHu0LFirM8GFKjvk9eH/Q6
 y4RD0jRt0R6B1mX+DCjYqq3o47E1hHwrT83edZ4jn5Ls/+B+Am67mWa
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 2700x1224 AMOLED BOE panel bundled with a RM692E5
driver IC, as found on the Fairphone 5 smartphone.

Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 423 ++++++++++++++++++++++++++
 3 files changed, 433 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2d6d96ee3547..ecb22ea326cb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -516,6 +516,15 @@ config DRM_PANEL_RAYDIUM_RM68200
 	  Say Y here if you want to enable support for Raydium RM68200
 	  720x1280 DSI video mode panel.
 
+config DRM_PANEL_RAYDIUM_RM692E5
+	tristate "Raydium RM692E5-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Raydium RM692E5-based
+	  display panels, such as the one found in the Fairphone 5 smartphone.
+
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 157c77ff157f..e14ce55a0875 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
 obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
+obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
new file mode 100644
index 000000000000..a613ba5b816c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2023 Linaro Limited
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct rm692e5_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct regulator_bulk_data supplies[3];
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct rm692e5_panel *to_rm692e5_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct rm692e5_panel, panel);
+}
+
+static void rm692e5_reset(struct rm692e5_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int rm692e5_on(struct rm692e5_panel *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x41);
+	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x16);
+	mipi_dsi_generic_write_seq(dsi, 0x8a, 0x87);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x71);
+	mipi_dsi_generic_write_seq(dsi, 0x82, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x2c);
+	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x64);
+	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x3c);
+	mipi_dsi_generic_write_seq(dsi, 0xca, 0x80);
+	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x02);
+	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x02);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq(dsi, 0x00, 0xff);
+	mipi_dsi_generic_write_seq(dsi, 0x01, 0xff);
+	mipi_dsi_generic_write_seq(dsi, 0x02, 0xcf);
+	mipi_dsi_generic_write_seq(dsi, 0x03, 0xbc);
+	mipi_dsi_generic_write_seq(dsi, 0x04, 0xb9);
+	mipi_dsi_generic_write_seq(dsi, 0x05, 0x99);
+	mipi_dsi_generic_write_seq(dsi, 0x06, 0x02);
+	mipi_dsi_generic_write_seq(dsi, 0x07, 0x0a);
+	mipi_dsi_generic_write_seq(dsi, 0x08, 0xe0);
+	mipi_dsi_generic_write_seq(dsi, 0x09, 0x4c);
+	mipi_dsi_generic_write_seq(dsi, 0x0a, 0xeb);
+	mipi_dsi_generic_write_seq(dsi, 0x0b, 0xe8);
+	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x32);
+	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x07);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq(dsi, 0x0d, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x0e, 0xff);
+	mipi_dsi_generic_write_seq(dsi, 0x0f, 0xff);
+	mipi_dsi_generic_write_seq(dsi, 0x10, 0x33);
+	mipi_dsi_generic_write_seq(dsi, 0x11, 0x6f);
+	mipi_dsi_generic_write_seq(dsi, 0x12, 0x6e);
+	mipi_dsi_generic_write_seq(dsi, 0x13, 0xa6);
+	mipi_dsi_generic_write_seq(dsi, 0x14, 0x80);
+	mipi_dsi_generic_write_seq(dsi, 0x15, 0x02);
+	mipi_dsi_generic_write_seq(dsi, 0x16, 0x38);
+	mipi_dsi_generic_write_seq(dsi, 0x17, 0xd3);
+	mipi_dsi_generic_write_seq(dsi, 0x18, 0x3a);
+	mipi_dsi_generic_write_seq(dsi, 0x19, 0xba);
+	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xcc);
+	mipi_dsi_generic_write_seq(dsi, 0x1b, 0x01);
+
+	ret = mipi_dsi_dcs_nop(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to nop: %d\n", ret);
+		return ret;
+	}
+	msleep(32);
+
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xd1);
+	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf9);
+	mipi_dsi_generic_write_seq(dsi, 0x00, 0xaf);
+	mipi_dsi_generic_write_seq(dsi, 0x1d, 0x37);
+	mipi_dsi_generic_write_seq(dsi, 0x44, 0x0a, 0x7b);
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xfa, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x08);
+	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0x51, 0x05, 0x42);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(100);
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
+static int rm692e5_disable(struct drm_panel *panel)
+{
+	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(100);
+
+	return 0;
+}
+
+static int rm692e5_prepare(struct drm_panel *panel)
+{
+	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
+	struct drm_dsc_picture_parameter_set pps;
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	rm692e5_reset(ctx);
+
+	ret = rm692e5_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		return ret;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_compression_mode(ctx->dsi, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable compression mode: %d\n", ret);
+		return ret;
+	}
+
+	msleep(28);
+
+	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x40);
+
+	/* 0x05 -> 90Hz, 0x00 -> 60Hz */
+	mipi_dsi_generic_write_seq(ctx->dsi, 0xbd, 0x05);
+
+	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x00);
+
+	ctx->prepared = true;
+
+	return 0;
+}
+
+static int rm692e5_unprepare(struct drm_panel *panel)
+{
+	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
+
+	if (!ctx->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode rm692e5_mode = {
+	.clock = (1224 + 32 + 8 + 8) * (2700 + 8 + 2 + 8) * 90 / 1000,
+	.hdisplay = 1224,
+	.hsync_start = 1224 + 32,
+	.hsync_end = 1224 + 32 + 8,
+	.htotal = 1224 + 32 + 8 + 8,
+	.vdisplay = 2700,
+	.vsync_start = 2700 + 8,
+	.vsync_end = 2700 + 8 + 2,
+	.vtotal = 2700 + 8 + 2 + 8,
+	.width_mm = 68,
+	.height_mm = 150,
+};
+
+static int rm692e5_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &rm692e5_mode);
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
+static const struct drm_panel_funcs rm692e5_panel_funcs = {
+	.prepare = rm692e5_prepare,
+	.unprepare = rm692e5_unprepare,
+	.disable = rm692e5_disable,
+	.get_modes = rm692e5_get_modes,
+};
+
+static int rm692e5_bl_update_status(struct backlight_device *bl)
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
+static int rm692e5_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops rm692e5_bl_ops = {
+	.update_status = rm692e5_bl_update_status,
+	.get_brightness = rm692e5_bl_get_brightness,
+};
+
+static struct backlight_device *
+rm692e5_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &rm692e5_bl_ops, &props);
+}
+
+static int rm692e5_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct rm692e5_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vddio";
+	ctx->supplies[1].supply = "dvdd";
+	ctx->supplies[2].supply = "vci";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
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
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &rm692e5_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = rm692e5_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	/* TODO: Pass slice_per_pkt = 2 */
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+	ctx->dsc.slice_height = 60;
+	ctx->dsc.slice_width = 1224;
+
+	ctx->dsc.slice_count = 1224 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rm692e5_remove(struct mipi_dsi_device *dsi)
+{
+	struct rm692e5_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id rm692e5_of_match[] = {
+	{ .compatible = "fairphone,fp5-rm692e5-boe" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rm692e5_of_match);
+
+static struct mipi_dsi_driver rm692e5_driver = {
+	.probe = rm692e5_probe,
+	.remove = rm692e5_remove,
+	.driver = {
+		.name = "panel-rm692e5-boe-amoled",
+		.of_match_table = rm692e5_of_match,
+	},
+};
+module_mipi_dsi_driver(rm692e5_driver);
+
+MODULE_DESCRIPTION("DRM driver for rm692e5-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.42.0

