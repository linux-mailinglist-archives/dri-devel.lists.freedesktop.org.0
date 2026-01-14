Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EED20221
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8E010E60B;
	Wed, 14 Jan 2026 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rhaAp7VZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A63710E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8010b8f078so4603366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768407404; x=1769012204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jObGM6uTHAsqYMn8EnUpzjFhVdbTLdpJ/rOYX6vi+YM=;
 b=rhaAp7VZXAHXBoxSmDDXWbj6K3+ZfeAPAZOG/MzQGKpzAoCtDhjlHu2vGOJYkXQx2p
 0FDj+zRBNd4buFq7lv1kPRj1kZJHRl4GHXvD+gBFykx3dDpEwFa1Kx3iC+xmDJOHS+ku
 U4Zy8twhwt/21u27TO0uQbp/dddGcjCexI03o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407404; x=1769012204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jObGM6uTHAsqYMn8EnUpzjFhVdbTLdpJ/rOYX6vi+YM=;
 b=tup0hs/eHiMCDIv+pIeuV9dVGrToPLnSSONVyBjiwsfZRVhKXdGBk45qlCARsCYASw
 01HhzRAJ8a9BfI5Xh3g8kWYmoONBE9MYZ4o6g/EOwBFEXXgi80S1av3eP81F1/I4DBXw
 0iHZwjimI1bIRMB3qckYP4TlMW3q26yQvHnf9cuw2s93N0R2+pPUTJnRjk8hEZ5RKpb6
 PdZZAoiUdukq2CTiEEyL/evOnG59whi4IzFfqTMUPZZW/G3CeDmmV2O3akPl1UIT8KSU
 /zmoCHXCfEA5hVvDxTQjxSYYqGTLCL4/9UE1lNLLtA5iuqiWPlC8Q2TyaEu0TGVBEoT9
 Fpxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+P9TFc+p1hqqFAn3CXwCV5dPcOUX5EobP4Wi1w6cQIjGka5+0DOSV5B3piv3nesydmqXzaEMZkck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZuG5uhb1xdliNcwuEJr7nDNOB2RCPzrjgM8u+ziNGxcGgwiqa
 sQ48fJAxZEfzCy5exC1k/PeohOkLw3tYbLoD7AksuKrYmtRuv4osVP6s0o0GeuNormQvNHuRfjT
 2z1Tm
X-Gm-Gg: AY/fxX4dp7f9cwR0Ua/WE07+qoKWLmNQea51pBaARGQTQ5vvWRA5/OCWR0LCF0vmC1+
 e2VNhl+fIPC4R0GusFrwwNyQ3vE6RK04zMLiVRrU7OoTouuyXMn65K/zui7FvAHeOTOfxloLYSo
 GES9FBS7MI/FleIE/ZztwoV/BK3nEutW2lNwJ/O5A/Lc/tySSr6+yHiM+8caKnryyLd/eFd1H3a
 0+wov4RGAXtoDW6EwEU/SqpeUjKebd28UlBJEebQWhQWHTsQlV+c6JiB+tgLocsSJKz2F0FZUhX
 8kk1toLZZqd/AVAt1d2sDiJKhfDN9arfb2H604M8bkfV0hBTR1NBr2HbDZLHqtsbB0P4GAENgID
 6RM7r4+iuWbEZG9CC4YTRh63svbGsjgtVi1rr2+E+dOLYg7TGQ9FP5oVFxaPUnD04NEffa9y+ry
 A1dLU+4yuzvQybNlaWwRm71i1HNGz4Ihw/BzQlDGhKqei0mFNhRIvPshV3ZNNwEgIchF4SH3/Dt
 SwPCdRcoMpot705LXaU33+Vn+144UMnpG4pElDefOVBQ/Srtok9O9Tq5ec0oC1oueA4Rg==
X-Received: by 2002:a17:907:6e94:b0:b87:2471:def3 with SMTP id
 a640c23a62f3a-b87612c049amr281323766b.55.1768407403679; 
 Wed, 14 Jan 2026 08:16:43 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876dd0e9ffsm152281566b.37.2026.01.14.08.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:16:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/panel: ilitek-ili9806e: split core and DSI logic
Date: Wed, 14 Jan 2026 17:16:17 +0100
Message-ID: <20260114161636.1076706-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
References: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
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

Split the driver to support multiple transport buses. The core logic
(power, GPIO, backlight) is moved to a dedicated core module, while
DSI-specific code is restricted to the DSI module.

Introduce DRM_PANEL_ILITEK_ILI9806E_CORE as a hidden Kconfig symbol
selected by the bus-specific configuration.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 MAINTAINERS                                   |   2 +-
 drivers/gpu/drm/panel/Kconfig                 |   8 +-
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 129 +++++++++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 ++
 .../gpu/drm/panel/panel-ilitek-ili9806e-dsi.c | 151 +++++-------------
 6 files changed, 195 insertions(+), 111 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 317e76cc99e5..67117d8cf483 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7913,7 +7913,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-*
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 692cd474910d..333e981eda96 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -257,11 +257,15 @@ config DRM_PANEL_ILITEK_ILI9805
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9805 controller.
 
+config DRM_PANEL_ILITEK_ILI9806E_CORE
+       tristate
+       depends on OF
+       depends on BACKLIGHT_CLASS_DEVICE
+
 config DRM_PANEL_ILITEK_ILI9806E_DSI
 	tristate "Ilitek ILI9806E-based DSI panels"
-	depends on OF
 	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_PANEL_ILITEK_ILI9806E_CORE
 	help
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9806E controller using DSI.
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 00071a983242..13034cadb8d8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE) += panel-ilitek-ili9806e-core.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
new file mode 100644
index 000000000000..c088685d9d85
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ilitek ILI9806E core driver.
+ *
+ * Copyright (c) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <drm/drm_panel.h>
+
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include "panel-ilitek-ili9806e-core.h"
+
+struct ili9806e {
+	void *transport;
+	struct drm_panel panel;
+
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
+};
+
+static const char * const regulator_names[] = {
+	"vdd",
+	"vccio",
+};
+
+void *ili9806e_get_transport(struct drm_panel *panel)
+{
+	struct ili9806e *ctx = container_of(panel, struct ili9806e, panel);
+
+	return ctx->transport;
+}
+EXPORT_SYMBOL_GPL(ili9806e_get_transport);
+
+int ili9806e_power_on(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret) {
+		dev_err(dev, "regulator bulk enable failed: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ili9806e_power_on);
+
+int ili9806e_power_off(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		dev_err(dev, "regulator bulk disable failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ili9806e_power_off);
+
+int ili9806e_probe(struct device *dev, void *transport,
+		  const struct drm_panel_funcs *funcs,
+		  int connector_type)
+{
+	struct ili9806e *ctx;
+	int i, ret;
+
+	ctx = devm_kzalloc(dev, sizeof(struct ili9806e), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ctx);
+	ctx->transport = transport;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
+		ctx->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	drm_panel_init(&ctx->panel, dev, funcs, connector_type);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ctx->panel.prepare_prev_first = true;
+	drm_panel_add(&ctx->panel);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(ili9806e_probe);
+
+void ili9806e_remove(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+
+	drm_panel_remove(&ctx->panel);
+}
+EXPORT_SYMBOL_GPL(ili9806e_remove);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
+MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
+MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
new file mode 100644
index 000000000000..dddece62cf42
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _PANEL_ILITEK_ILI9806E_CORE_H
+#define _PANEL_ILITEK_ILI9806E_CORE_H
+
+void *ili9806e_get_transport(struct drm_panel *panel);
+int ili9806e_power_off(struct device *dev);
+int ili9806e_power_on(struct device *dev);
+
+int ili9806e_probe(struct device *dev, void *transport,
+		   const struct drm_panel_funcs *funcs,
+		   int connector_type);
+void ili9806e_remove(struct device *dev);
+
+#endif /* _PANEL_ILITEK_ILI9806E_CORE_H */
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index c337c4f1a1c7..ecdbed8d4a3a 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -1,15 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/property.h>
-#include <linux/regulator/consumer.h>
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
@@ -18,7 +15,9 @@
 
 #include <video/mipi_display.h>
 
-struct panel_desc {
+#include "panel-ilitek-ili9806e-core.h"
+
+struct ili9806e_dsi_panel_desc {
 	const struct drm_display_mode *display_mode;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -26,60 +25,13 @@ struct panel_desc {
 	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
 };
 
-struct ili9806e_panel {
-	struct drm_panel panel;
+struct ili9806e_dsi_panel {
 	struct mipi_dsi_device *dsi;
-	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[2];
-	const struct panel_desc *desc;
+	const struct ili9806e_dsi_panel_desc *desc;
 	enum drm_panel_orientation orientation;
 };
 
-static const char * const regulator_names[] = {
-	"vdd",
-	"vccio",
-};
-
-static inline struct ili9806e_panel *to_ili9806e_panel(struct drm_panel *panel)
-{
-	return container_of(panel, struct ili9806e_panel, panel);
-}
-
-static int ili9806e_power_on(struct ili9806e_panel *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret;
-
-	gpiod_set_value(ctx->reset_gpio, 1);
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
-		return ret;
-	}
-
-	usleep_range(10000, 20000);
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(10000, 20000);
-
-	return 0;
-}
-
-static int ili9806e_power_off(struct ili9806e_panel *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret;
-
-	gpiod_set_value(ctx->reset_gpio, 1);
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret)
-		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
-
-	return ret;
-}
-
-static int ili9806e_on(struct ili9806e_panel *ili9806e)
+static int ili9806e_dsi_on(struct ili9806e_dsi_panel *ili9806e)
 {
 	struct mipi_dsi_multi_context ctx = { .dsi = ili9806e->dsi };
 
@@ -93,7 +45,7 @@ static int ili9806e_on(struct ili9806e_panel *ili9806e)
 	return ctx.accum_err;
 }
 
-static int ili9806e_off(struct ili9806e_panel *panel)
+static int ili9806e_dsi_off(struct ili9806e_dsi_panel *panel)
 {
 	struct mipi_dsi_multi_context ctx = { .dsi = panel->dsi };
 
@@ -104,88 +56,75 @@ static int ili9806e_off(struct ili9806e_panel *panel)
 	return ctx.accum_err;
 }
 
-static int ili9806e_prepare(struct drm_panel *panel)
+static int ili9806e_dsi_prepare(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ret = ili9806e_power_on(ctx);
+	ret = ili9806e_power_on(dev);
 	if (ret < 0)
 		return ret;
 
-	ret = ili9806e_on(ctx);
+	ret = ili9806e_dsi_on(ctx);
 	if (ret < 0) {
-		ili9806e_power_off(ctx);
+		ili9806e_power_off(dev);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int ili9806e_unprepare(struct drm_panel *panel)
+static int ili9806e_dsi_unprepare(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ili9806e_off(ctx);
+	ili9806e_dsi_off(ctx);
 
-	ret = ili9806e_power_off(ctx);
+	ret = ili9806e_power_off(dev);
 	if (ret < 0)
-		dev_err(&dsi->dev, "power off failed: %d\n", ret);
+		dev_err(dev, "power off failed: %d\n", ret);
 
 	return ret;
 }
 
-static int ili9806e_get_modes(struct drm_panel *panel,
+static int ili9806e_dsi_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
 	const struct drm_display_mode *mode = ctx->desc->display_mode;
 
 	return drm_connector_helper_get_modes_fixed(connector, mode);
 }
 
-static enum drm_panel_orientation ili9806e_get_orientation(struct drm_panel *panel)
+static enum drm_panel_orientation ili9806e_dsi_get_orientation(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
 
 	return ctx->orientation;
 }
 
-static const struct drm_panel_funcs ili9806e_funcs = {
-	.prepare = ili9806e_prepare,
-	.unprepare = ili9806e_unprepare,
-	.get_modes = ili9806e_get_modes,
-	.get_orientation = ili9806e_get_orientation,
+static const struct drm_panel_funcs ili9806e_dsi_funcs = {
+	.prepare = ili9806e_dsi_prepare,
+	.unprepare = ili9806e_dsi_unprepare,
+	.get_modes = ili9806e_dsi_get_modes,
+	.get_orientation = ili9806e_dsi_get_orientation,
 };
 
 static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
-	struct ili9806e_panel *ctx;
-	int i, ret;
+	struct ili9806e_dsi_panel *ctx;
+	int ret;
 
-	ctx = devm_drm_panel_alloc(dev, struct ili9806e_panel, panel, &ili9806e_funcs,
-				   DRM_MODE_CONNECTOR_DSI);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	ctx = devm_kzalloc(dev, sizeof(struct ili9806e_dsi_panel), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
 
 	ctx->desc = device_get_match_data(dev);
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
-		ctx->supplies[i].supply = regulator_names[i];
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
-	if (ret < 0)
-		return ret;
-
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
-				     "Failed to get reset-gpios\n");
-
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
@@ -197,17 +136,15 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get orientation\n");
 
-	ret = drm_panel_of_backlight(&ctx->panel);
+	ret = ili9806e_probe(dev, ctx, &ili9806e_dsi_funcs,
+			     DRM_MODE_CONNECTOR_DSI);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get backlight\n");
-
-	ctx->panel.prepare_prev_first = true;
-	drm_panel_add(&ctx->panel);
+		return ret;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
-		drm_panel_remove(&ctx->panel);
+		ili9806e_remove(dev);
 		return ret;
 	}
 
@@ -216,10 +153,8 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 
 static void ili9806e_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	struct ili9806e_panel *ctx = mipi_dsi_get_drvdata(dsi);
-
 	mipi_dsi_detach(dsi);
-	drm_panel_remove(&ctx->panel);
+	ili9806e_remove(&dsi->dev);
 }
 
 static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
@@ -369,7 +304,7 @@ static const struct drm_display_mode com35h3p70ulc_default_mode = {
 	.height_mm = 71,
 };
 
-static const struct panel_desc com35h3p70ulc_desc = {
+static const struct ili9806e_dsi_panel_desc com35h3p70ulc_desc = {
 	.init_sequence = com35h3p70ulc_init,
 	.display_mode = &com35h3p70ulc_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -533,7 +468,7 @@ static const struct drm_display_mode dmt028vghmcmi_1d_default_mode = {
 	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
-static const struct panel_desc dmt028vghmcmi_1d_desc = {
+static const struct ili9806e_dsi_panel_desc dmt028vghmcmi_1d_desc = {
 	.init_sequence = dmt028vghmcmi_1d_init,
 	.display_mode = &dmt028vghmcmi_1d_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -542,17 +477,17 @@ static const struct panel_desc dmt028vghmcmi_1d_desc = {
 	.lanes = 2,
 };
 
-static const struct of_device_id ili9806e_of_match[] = {
+static const struct of_device_id ili9806e_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, ili9806e_of_match);
+MODULE_DEVICE_TABLE(of, ili9806e_dsi_of_match);
 
 static struct mipi_dsi_driver ili9806e_dsi_driver = {
 	.driver = {
 		.name = "ili9806e-dsi",
-		.of_match_table = ili9806e_of_match,
+		.of_match_table = ili9806e_dsi_of_match,
 	},
 	.probe = ili9806e_dsi_probe,
 	.remove = ili9806e_dsi_remove,
-- 
2.43.0

