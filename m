Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47432CF86
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 10:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D9D6EA11;
	Thu,  4 Mar 2021 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD206EA11
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 09:22:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id c16so6319233ply.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ISniL6yTBWi042ZNWJ1+Npn/xauAJIi/V3jYqtdwgms=;
 b=cgwTfJm9mK52+v0gcGE8Xs437llkEf9MFtokm6YnBtw6Evlqnqw9e4f4IDRbEaXlyd
 zim5wb/g84h8Og81CtnZgCOihwk6y+NVf28Edq5HR6/J0Ir602CCzOw2CrSpkp70emrz
 FPRTGwlnmcdSqweyV+vjvzQ+1dLBbfin4e2b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISniL6yTBWi042ZNWJ1+Npn/xauAJIi/V3jYqtdwgms=;
 b=TEOBaXRMLTASsvY9glOOBEMvGT3Z62Sse8hUqNWqtkMqyFyQy84LnaJCMrAybg0u0K
 u58A2Nonon3OKDt0lMUZXZZup3TK3hzo9fl+wTt2KAkmnt+4WTq2NVN6jM4ptUnCuaOm
 F0xau+RGWed+GM1xRlpCLa66mBXD+7yQ6VxinFDxoMIb1oj/0XxyD2erwae0Zi7VyVp3
 m0i0EqyLp9+koYR3iQsDz41VFPjYPcvlqD88bbEmAfrJqwODx9Wj22zFD7g2tF4YNp/9
 wJ02vit10u1d+Q2enZIKaI4R8mDeZAf8VqjGcoMxCHsOl0omoH0sb/faTzgEIudCOEnI
 Yq3g==
X-Gm-Message-State: AOAM5322bWRi8G2T66ed+O3NLlh0JXwNWrAsg3Uv0rvqN79tHXHSfhHl
 zTjIb/5ZjRIKtJS5Sv+alcegBg==
X-Google-Smtp-Source: ABdhPJyJBalHeavw3BbvHVG493DvF9pJ0VvI6iMPTmD46Kq0rh7QMJwgRwKw91RPoFDVgT9K9LtOzA==
X-Received: by 2002:a17:90a:71c3:: with SMTP id
 m3mr3590706pjs.186.1614849724321; 
 Thu, 04 Mar 2021 01:22:04 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.228])
 by smtp.gmail.com with ESMTPSA id 14sm27326981pfy.55.2021.03.04.01.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 01:22:03 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 2/2] drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge
Date: Thu,  4 Mar 2021 14:51:33 +0530
Message-Id: <20210304092133.21717-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304092133.21717-1-jagan@amarulasolutions.com>
References: <20210304092133.21717-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICN6211 is MIPI-DSI to RGB Converter bridge from Chipone.

It has a flexible configuration of MIPI DSI signal input and
produce RGB565, RGB666, RGB888 output format.

Add bridge driver for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- added regulators
- replace reset with EN
- fixed warnings pointed by Robert
Changes for v3:
- updated the driver to inline with new drm bridge style

 MAINTAINERS                              |   1 +
 drivers/gpu/drm/bridge/Kconfig           |  13 +
 drivers/gpu/drm/bridge/Makefile          |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c | 293 +++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/chipone-icn6211.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 065cbdc889d3..9c59402e51bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5533,6 +5533,7 @@ DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+F:	drivers/gpu/drm/bridge/chipone-icn6211.c
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6ca7b3..330ee70ed746 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -27,6 +27,19 @@ config DRM_CDNS_DSI
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 
+config DRM_CHIPONE_ICN6211
+	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
+	depends on OF
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
+	help
+	  ICN6211 is MIPI-DSI/RGB Converter bridge from chipone.
+
+	  It has a flexible configuration of MIPI DSI signal input
+	  and produce RGB565, RGB666, RGB888 output format.
+
+	  If in doubt, say "N".
+
 config DRM_CHRONTEL_CH7033
 	tristate "Chrontel CH7033 Video Encoder"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 86e7acc76f8d..3eb84b638988 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
+obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
new file mode 100644
index 000000000000..a6151db95586
--- /dev/null
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#define HACTIVE_LI		0x20
+#define VACTIVE_LI		0x21
+#define VACTIVE_HACTIVE_HI	0x22
+#define HFP_LI			0x23
+#define HSYNC_LI		0x24
+#define HBP_LI			0x25
+#define HFP_HSW_HBP_HI		0x26
+#define VFP			0x27
+#define VSYNC			0x28
+#define VBP			0x29
+
+struct chipone {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *panel_bridge;
+	struct gpio_desc *enable_gpio;
+	struct regulator *vdd1;
+	struct regulator *vdd2;
+	struct regulator *vdd3;
+};
+
+static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct chipone, bridge);
+}
+
+static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
+{
+	return &bridge->encoder->crtc->state->adjusted_mode;
+}
+
+static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
+				    size_t len)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(icn->dev);
+
+	return mipi_dsi_generic_write(dsi, seq, len);
+}
+
+#define ICN6211_DSI(icn, seq...)				\
+	{							\
+		const u8 d[] = { seq };				\
+		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
+	}
+
+static void chipone_enable(struct drm_bridge *bridge)
+{
+	struct chipone *icn = bridge_to_chipone(bridge);
+	struct drm_display_mode *mode = bridge_to_mode(bridge);
+
+	ICN6211_DSI(icn, 0x7a, 0xc1);
+
+	ICN6211_DSI(icn, HACTIVE_LI, mode->hdisplay & 0xff);
+
+	ICN6211_DSI(icn, VACTIVE_LI, mode->vdisplay & 0xff);
+
+	/**
+	 * lsb nibble: 2nd nibble of hdisplay
+	 * msb nibble: 2nd nibble of vdisplay
+	 */
+	ICN6211_DSI(icn, VACTIVE_HACTIVE_HI,
+		    ((mode->hdisplay >> 8) & 0xf) |
+		    (((mode->vdisplay >> 8) & 0xf) << 4));
+
+	ICN6211_DSI(icn, HFP_LI, mode->hsync_start - mode->hdisplay);
+
+	ICN6211_DSI(icn, HSYNC_LI, mode->hsync_end - mode->hsync_start);
+
+	ICN6211_DSI(icn, HBP_LI, mode->htotal - mode->hsync_end);
+
+	ICN6211_DSI(icn, HFP_HSW_HBP_HI, 0x00);
+
+	ICN6211_DSI(icn, VFP, mode->vsync_start - mode->vdisplay);
+
+	ICN6211_DSI(icn, VSYNC, mode->vsync_end - mode->vsync_start);
+
+	ICN6211_DSI(icn, VBP, mode->vtotal - mode->vsync_end);
+
+	/* dsi specific sequence */
+	ICN6211_DSI(icn, MIPI_DCS_SET_TEAR_OFF, 0x80);
+	ICN6211_DSI(icn, MIPI_DCS_SET_ADDRESS_MODE, 0x28);
+	ICN6211_DSI(icn, 0xb5, 0xa0);
+	ICN6211_DSI(icn, 0x5c, 0xff);
+	ICN6211_DSI(icn, MIPI_DCS_SET_COLUMN_ADDRESS, 0x01);
+	ICN6211_DSI(icn, MIPI_DCS_GET_POWER_SAVE, 0x92);
+	ICN6211_DSI(icn, 0x6b, 0x71);
+	ICN6211_DSI(icn, 0x69, 0x2b);
+	ICN6211_DSI(icn, MIPI_DCS_ENTER_SLEEP_MODE, 0x40);
+	ICN6211_DSI(icn, MIPI_DCS_EXIT_SLEEP_MODE, 0x98);
+
+	/* icn6211 specific sequence */
+	ICN6211_DSI(icn, 0xb6, 0x20);
+	ICN6211_DSI(icn, 0x51, 0x20);
+	ICN6211_DSI(icn, 0x09, 0x10);
+
+	usleep_range(10000, 11000);
+}
+
+static void chipone_pre_enable(struct drm_bridge *bridge)
+{
+	struct chipone *icn = bridge_to_chipone(bridge);
+	int ret;
+
+	if (icn->vdd1) {
+		ret = regulator_enable(icn->vdd1);
+		if (ret)
+			DRM_DEV_ERROR(icn->dev,
+				      "failed to enable VDD1 regulator: %d\n", ret);
+	}
+
+	if (icn->vdd2) {
+		ret = regulator_enable(icn->vdd2);
+		if (ret)
+			DRM_DEV_ERROR(icn->dev,
+				      "failed to enable VDD2 regulator: %d\n", ret);
+	}
+
+	if (icn->vdd3) {
+		ret = regulator_enable(icn->vdd3);
+		if (ret)
+			DRM_DEV_ERROR(icn->dev,
+				      "failed to enable VDD3 regulator: %d\n", ret);
+	}
+
+	gpiod_set_value(icn->enable_gpio, 1);
+
+	usleep_range(10000, 11000);
+}
+
+static void chipone_post_disable(struct drm_bridge *bridge)
+{
+	struct chipone *icn = bridge_to_chipone(bridge);
+
+	if (icn->vdd1)
+		regulator_disable(icn->vdd1);
+
+	if (icn->vdd2)
+		regulator_disable(icn->vdd2);
+
+	if (icn->vdd3)
+		regulator_disable(icn->vdd3);
+
+	gpiod_set_value(icn->enable_gpio, 0);
+}
+
+static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+{
+	struct chipone *icn = bridge_to_chipone(bridge);
+
+	return drm_bridge_attach(bridge->encoder, icn->panel_bridge, bridge, flags);
+}
+
+static const struct drm_bridge_funcs chipone_bridge_funcs = {
+	.attach = chipone_attach,
+	.post_disable = chipone_post_disable,
+	.pre_enable = chipone_pre_enable,
+	.enable = chipone_enable,
+};
+
+static int chipone_parse_dt(struct chipone *icn)
+{
+	struct device *dev = icn->dev;
+	struct drm_panel *panel;
+	int ret;
+
+	icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
+	if (IS_ERR(icn->vdd1)) {
+		ret = PTR_ERR(icn->vdd1);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		icn->vdd1 = NULL;
+		DRM_DEV_DEBUG(dev, "failed to get VDD1 regulator: %d\n", ret);
+	}
+
+	icn->vdd2 = devm_regulator_get_optional(dev, "vdd2");
+	if (IS_ERR(icn->vdd2)) {
+		ret = PTR_ERR(icn->vdd2);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		icn->vdd2 = NULL;
+		DRM_DEV_DEBUG(dev, "failed to get VDD2 regulator: %d\n", ret);
+	}
+
+	icn->vdd3 = devm_regulator_get_optional(dev, "vdd3");
+	if (IS_ERR(icn->vdd3)) {
+		ret = PTR_ERR(icn->vdd3);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		icn->vdd3 = NULL;
+		DRM_DEV_DEBUG(dev, "failed to get VDD3 regulator: %d\n", ret);
+	}
+
+	icn->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(icn->enable_gpio)) {
+		DRM_DEV_ERROR(dev, "failed to get enable GPIO\n");
+		return PTR_ERR(icn->enable_gpio);
+	}
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret)
+		return ret;
+
+	icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(icn->panel_bridge))
+		return PTR_ERR(icn->panel_bridge);
+
+	return 0;
+}
+
+static int chipone_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct chipone *icn;
+	int ret;
+
+	icn = devm_kzalloc(dev, sizeof(struct chipone), GFP_KERNEL);
+	if (!icn)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, icn);
+	icn->dev = dev;
+
+	ret = chipone_parse_dt(icn);
+	if (ret)
+		return ret;
+
+	icn->bridge.funcs = &chipone_bridge_funcs;
+	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	icn->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&icn->bridge);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_bridge_remove(&icn->bridge);
+		dev_err(dev, "failed to attach dsi\n");
+	}
+
+	return ret;
+}
+
+static int chipone_remove(struct mipi_dsi_device *dsi)
+{
+	struct chipone *icn = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_bridge_remove(&icn->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id chipone_of_match[] = {
+	{ .compatible = "chipone,icn6211", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, chipone_of_match);
+
+static struct mipi_dsi_driver chipone_driver = {
+	.probe = chipone_probe,
+	.remove = chipone_remove,
+	.driver = {
+		.name = "chipone-icn6211",
+		.owner = THIS_MODULE,
+		.of_match_table = chipone_of_match,
+	},
+};
+module_mipi_dsi_driver(chipone_driver);
+
+MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_DESCRIPTION("Chipone ICN6211 MIPI-DSI to RGB Converter Bridge");
+MODULE_LICENSE("GPL");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
