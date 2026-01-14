Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B6D2022A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC7110E613;
	Wed, 14 Jan 2026 16:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YUSsRZsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80510E610
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b8765b80a52so2016166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768407407; x=1769012207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwbdqD4esV5rFpOMyfingdbEhuuUPk8cb1Cjg4dlWpk=;
 b=YUSsRZsxXoeoyGSyPSZtPP56NOCSjY1whyg40pGUVEMu1XVdtmHeLlHzGsvmIXeHgV
 UozeQnzKpLZTD36M68pnMLFC2E8lyI4ph2B4UGg2uz65oHw6h8UmWPw76p3gZ9ni21Ip
 fzfJrVFnJWwbr48+KTo+2NATVbjZvFcp/RXAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407407; x=1769012207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OwbdqD4esV5rFpOMyfingdbEhuuUPk8cb1Cjg4dlWpk=;
 b=lYwXd6W5TMpM+gXrsTrWwDallcI1e0ds7Oqr6ocQmb/TIwD7cHdnZ76kQogQTccETo
 QH/SriqAjCdKiDxY1hHnQK3XwlP+H/KXufMNhf+LtDzZdDnXAH19/sDLwokF4Cm5XkbA
 oyf2GlkhJKHFDkZkmJBbzm5QDJ0qS0o5WATQc69SJu4u3HAe3fpf0wLSYyD+eQF2MV4Z
 QCK2lYQQhDAgyF0dNRoGsDF2bCkubxyQGdjX61Ti6cMw8lnUgn7nIE+6lJ8aR+sjVdwm
 j/Nfok1WzdOvBAv2Cw7NDQvj7HddXBov6jQV+mdkcJJHqFsABI7RWOCFyJzDoXJ0OHAX
 eYJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9jxgA5BCFWIZVYd7HrSXiQvc46mrKE86B36Uze79d4cKwaDptXM0ruGZsRV5RHjZ2A6HWwKVp0zU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa9W3dOio+Ow4+xbi+KcCvbwu4+8+nkbmcsGNYxIFxyGlvAfpf
 ldfBlY/B9tiG+jvS6vz6Hyi30PWNbkLCAaoNkSpYa7+0tgbomAeOlqIFR300WVDCB3c=
X-Gm-Gg: AY/fxX4DcxzSMgn1w36UM0GW+pmBVn2XGNnFyCALxMcx+9aKMjS01CpKLvyWJjGy21z
 uPtHfq4OjKq5Bf6CuV4aMZctbJMW5h1Thus1yGEQkHf+zZuxO9adFVZjOjmEJb1UGpKspm/+i53
 4VNm+muhzZys5BKAJ0bQYXe5KpBWBj0wYL+6jI130F+9dvZkICH501kBp8NjB1h86SlD+6j9P+K
 iSnthwdUljgVIFkUlh0ArALDBr6Y6CH9jEtEGjyY1HQciHy6cyfpork7LeZPp+Y6+rRHh7tSKSN
 Fe1I/Ik8JMDB6iDKFTMfRK63d00k3v0p+lH0l1ySc0Vm06qH8P/GvPXx5PTSqjMfUHQfqrnuxez
 +4gkr9ayu0yDpIeYrpdk32h/RwR7flCNHQ2dlley5VwfgJfl3Q946IkjJRYQ+kcZqK8k6YdvN+2
 xxqnl9qk8Wab3Vizh+DuQPpMTIDRretzct6UrGz4LHkZu+b5M+3/O83y/ijwoQ5Pv8glGs4gvUb
 xp85dpZ7/MX0GoblkIHXR5wgL55kaRnKnA6XbzeLfjeAmFyHIcu91bP13cOmyzYxAzOdQ==
X-Received: by 2002:a17:907:97cc:b0:b79:fe73:3b18 with SMTP id
 a640c23a62f3a-b87676a0ec8mr194194266b.22.1768407406765; 
 Wed, 14 Jan 2026 08:16:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876dd0e9ffsm152281566b.37.2026.01.14.08.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:16:46 -0800 (PST)
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
Subject: [PATCH v2 4/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A SPI panel
Date: Wed, 14 Jan 2026 17:16:19 +0100
Message-ID: <20260114161636.1076706-5-dario.binacchi@amarulasolutions.com>
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

Add support for the Rocktech RK050HR345-CT106A panel based on the
Ilitek ILI9806E controller using the SPI bus.

The driver is designed to be easily extensible to support other panels
with different initialization sequences and display timings by
providing a specific descriptor structure for each model.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
- Split core and DSI logic.
- Restore vdd-supply as required for both DSI and SPI types in the
  dt-bindings.
- Dop useless settings in case of rocktech,rk050hr345-ct106a in the
  dt-bindings.

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-ilitek-ili9806e-core.c    |  31 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
 5 files changed, 353 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 67117d8cf483..5d2000f10643 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7912,6 +7912,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
+M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-*
 
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 333e981eda96..d1cb04e838c5 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -270,6 +270,16 @@ config DRM_PANEL_ILITEK_ILI9806E_DSI
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9806E controller using DSI.
 
+config DRM_PANEL_ILITEK_ILI9806E_SPI
+	tristate "Ilitek ILI9806E-based RGB SPI panel"
+	depends on SPI
+	select DRM_PANEL_ILITEK_ILI9806E_CORE
+	select DRM_MIPI_DBI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Ilitek ILI9806E controller using SPI.
+
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 13034cadb8d8..3697687651fe 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE) += panel-ilitek-ili9806e-core.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI) += panel-ilitek-ili9806e-spi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
index c088685d9d85..be2cf1440155 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
@@ -20,15 +21,11 @@ struct ili9806e {
 	void *transport;
 	struct drm_panel panel;
 
+	unsigned int num_supplies;
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
 };
 
-static const char * const regulator_names[] = {
-	"vdd",
-	"vccio",
-};
-
 void *ili9806e_get_transport(struct drm_panel *panel)
 {
 	struct ili9806e *ctx = container_of(panel, struct ili9806e, panel);
@@ -44,7 +41,7 @@ int ili9806e_power_on(struct device *dev)
 
 	gpiod_set_value(ctx->reset_gpio, 1);
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
 	if (ret) {
 		dev_err(dev, "regulator bulk enable failed: %d\n", ret);
 		return ret;
@@ -65,7 +62,7 @@ int ili9806e_power_off(struct device *dev)
 
 	gpiod_set_value(ctx->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_disable(ctx->num_supplies, ctx->supplies);
 	if (ret)
 		dev_err(dev, "regulator bulk disable failed: %d\n", ret);
 
@@ -78,7 +75,8 @@ int ili9806e_probe(struct device *dev, void *transport,
 		  int connector_type)
 {
 	struct ili9806e *ctx;
-	int i, ret;
+	bool set_prepare_prev_first = false;
+	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(struct ili9806e), GFP_KERNEL);
 	if (!ctx)
@@ -87,11 +85,16 @@ int ili9806e_probe(struct device *dev, void *transport,
 	dev_set_drvdata(dev, ctx);
 	ctx->transport = transport;
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
-		ctx->supplies[i].supply = regulator_names[i];
+	ctx->supplies[ctx->num_supplies++].supply = "vdd";
+	if (of_device_is_compatible(dev->of_node,
+				    "densitron,dmt028vghmcmi-1d") ||
+	    of_device_is_compatible(dev->of_node,
+				    "ortustech,com35h3p70ulc")) {
+		ctx->supplies[ctx->num_supplies++].supply = "vccio";
+		set_prepare_prev_first = true;
+	}
 
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
+	ret = devm_regulator_bulk_get(dev, ctx->num_supplies, ctx->supplies);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
@@ -106,7 +109,9 @@ int ili9806e_probe(struct device *dev, void *transport,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
-	ctx->panel.prepare_prev_first = true;
+	if (set_prepare_prev_first)
+		ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
new file mode 100644
index 000000000000..9d10b0d28f52
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SPI interface to the Ilitek ILI9806E panel.
+ *
+ * Copyright (c) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#include <video/mipi_display.h>
+
+#include "panel-ilitek-ili9806e-core.h"
+
+struct ili9806e_spi_panel {
+	struct spi_device *spi;
+	struct mipi_dbi dbi;
+	const struct ili9806e_spi_panel_desc *desc;
+};
+
+struct ili9806e_spi_panel_desc {
+	const struct drm_display_mode *display_mode;
+	u32 bus_format;
+	u32 bus_flags;
+	void (*init_sequence)(struct ili9806e_spi_panel *ctx);
+};
+
+static int ili9806e_spi_off(struct ili9806e_spi_panel *ctx)
+{
+	struct mipi_dbi *dbi = &ctx->dbi;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE, 0x00);
+
+	return 0;
+}
+
+static int ili9806e_spi_unprepare(struct drm_panel *panel)
+{
+	struct ili9806e_spi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->spi->dev;
+	int ret;
+
+	ili9806e_spi_off(ctx);
+
+	ret = ili9806e_power_off(dev);
+	if (ret)
+		dev_err(dev, "power off failed: %d\n", ret);
+
+	return 0;
+}
+
+static int ili9806e_spi_prepare(struct drm_panel *panel)
+{
+	struct ili9806e_spi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->spi->dev;
+	int ret;
+
+	ret = ili9806e_power_on(dev);
+	if (ret)
+		return ret;
+
+	if (ctx->desc->init_sequence)
+		ctx->desc->init_sequence(ctx);
+
+	return 0;
+}
+
+static int ili9806e_spi_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct ili9806e_spi_panel *ctx = ili9806e_get_transport(panel);
+	const struct ili9806e_spi_panel_desc *desc = ctx->desc;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, desc->display_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags = desc->bus_flags;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &desc->bus_format, 1);
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs ili9806e_spi_funcs = {
+	.unprepare = ili9806e_spi_unprepare,
+	.prepare   = ili9806e_spi_prepare,
+	.get_modes = ili9806e_spi_get_modes,
+};
+
+static int ili9806e_spi_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct ili9806e_spi_panel *ctx;
+	int err;
+
+	ctx = devm_kzalloc(dev, sizeof(struct ili9806e_spi_panel), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->spi = spi;
+	ctx->desc = device_get_match_data(dev);
+
+	err = mipi_dbi_spi_init(spi, &ctx->dbi, NULL);
+	if (err)
+		return dev_err_probe(dev, err, "MIPI DBI init failed\n");
+
+	return ili9806e_probe(dev, ctx, &ili9806e_spi_funcs,
+			      DRM_MODE_CONNECTOR_DPI);
+}
+
+static void ili9806e_spi_remove(struct spi_device *spi)
+{
+	ili9806e_remove(&spi->dev);
+}
+
+static void rk050hr345_ct106a_init(struct ili9806e_spi_panel *ctx)
+{
+	struct mipi_dbi *dbi = &ctx->dbi;
+
+	/* Switch to page 1 */
+	mipi_dbi_command(dbi, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
+	/* Interface Settings */
+	mipi_dbi_command(dbi, 0x08, 0x10);
+	mipi_dbi_command(dbi, 0x21, 0x01);
+	/* Panel Settings */
+	mipi_dbi_command(dbi, 0x30, 0x01);
+	mipi_dbi_command(dbi, 0x31, 0x00);
+	/* Power Control */
+	mipi_dbi_command(dbi, 0x40, 0x15);
+	mipi_dbi_command(dbi, 0x41, 0x44);
+	mipi_dbi_command(dbi, 0x42, 0x03);
+	mipi_dbi_command(dbi, 0x43, 0x09);
+	mipi_dbi_command(dbi, 0x44, 0x09);
+	mipi_dbi_command(dbi, 0x50, 0x78);
+	mipi_dbi_command(dbi, 0x51, 0x78);
+	mipi_dbi_command(dbi, 0x52, 0x00);
+	mipi_dbi_command(dbi, 0x53, 0x3a);
+	mipi_dbi_command(dbi, 0x57, 0x50);
+	/* Timing Control */
+	mipi_dbi_command(dbi, 0x60, 0x07);
+	mipi_dbi_command(dbi, 0x61, 0x00);
+	mipi_dbi_command(dbi, 0x62, 0x08);
+	mipi_dbi_command(dbi, 0x63, 0x00);
+	/* Gamma Settings */
+	mipi_dbi_command(dbi, 0xa0, 0x00);
+	mipi_dbi_command(dbi, 0xa1, 0x03);
+	mipi_dbi_command(dbi, 0xa2, 0x0b);
+	mipi_dbi_command(dbi, 0xa3, 0x0f);
+	mipi_dbi_command(dbi, 0xa4, 0x0b);
+	mipi_dbi_command(dbi, 0xa5, 0x1b);
+	mipi_dbi_command(dbi, 0xa6, 0x0a);
+	mipi_dbi_command(dbi, 0xa7, 0x0a);
+	mipi_dbi_command(dbi, 0xa8, 0x02);
+	mipi_dbi_command(dbi, 0xa9, 0x07);
+	mipi_dbi_command(dbi, 0xaa, 0x05);
+	mipi_dbi_command(dbi, 0xab, 0x03);
+	mipi_dbi_command(dbi, 0xac, 0x0e);
+	mipi_dbi_command(dbi, 0xad, 0x32);
+	mipi_dbi_command(dbi, 0xae, 0x2d);
+	mipi_dbi_command(dbi, 0xaf, 0x00);
+	mipi_dbi_command(dbi, 0xc0, 0x00);
+	mipi_dbi_command(dbi, 0xc1, 0x03);
+	mipi_dbi_command(dbi, 0xc2, 0x0e);
+	mipi_dbi_command(dbi, 0xc3, 0x10);
+	mipi_dbi_command(dbi, 0xc4, 0x09);
+	mipi_dbi_command(dbi, 0xc5, 0x17);
+	mipi_dbi_command(dbi, 0xc6, 0x09);
+	mipi_dbi_command(dbi, 0xc7, 0x07);
+	mipi_dbi_command(dbi, 0xc8, 0x04);
+	mipi_dbi_command(dbi, 0xc9, 0x09);
+	mipi_dbi_command(dbi, 0xca, 0x06);
+	mipi_dbi_command(dbi, 0xcb, 0x06);
+	mipi_dbi_command(dbi, 0xcc, 0x0c);
+	mipi_dbi_command(dbi, 0xcd, 0x25);
+	mipi_dbi_command(dbi, 0xce, 0x20);
+	mipi_dbi_command(dbi, 0xcf, 0x00);
+
+	/* Switch to page 6 */
+	mipi_dbi_command(dbi, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
+	/* GIP settings */
+	mipi_dbi_command(dbi, 0x00, 0x21);
+	mipi_dbi_command(dbi, 0x01, 0x09);
+	mipi_dbi_command(dbi, 0x02, 0x00);
+	mipi_dbi_command(dbi, 0x03, 0x00);
+	mipi_dbi_command(dbi, 0x04, 0x01);
+	mipi_dbi_command(dbi, 0x05, 0x01);
+	mipi_dbi_command(dbi, 0x06, 0x80);
+	mipi_dbi_command(dbi, 0x07, 0x05);
+	mipi_dbi_command(dbi, 0x08, 0x02);
+	mipi_dbi_command(dbi, 0x09, 0x80);
+	mipi_dbi_command(dbi, 0x0a, 0x00);
+	mipi_dbi_command(dbi, 0x0b, 0x00);
+	mipi_dbi_command(dbi, 0x0c, 0x0a);
+	mipi_dbi_command(dbi, 0x0d, 0x0a);
+	mipi_dbi_command(dbi, 0x0e, 0x00);
+	mipi_dbi_command(dbi, 0x0f, 0x00);
+	mipi_dbi_command(dbi, 0x10, 0xe0);
+	mipi_dbi_command(dbi, 0x11, 0xe4);
+	mipi_dbi_command(dbi, 0x12, 0x04);
+	mipi_dbi_command(dbi, 0x13, 0x00);
+	mipi_dbi_command(dbi, 0x14, 0x00);
+	mipi_dbi_command(dbi, 0x15, 0xc0);
+	mipi_dbi_command(dbi, 0x16, 0x08);
+	mipi_dbi_command(dbi, 0x17, 0x00);
+	mipi_dbi_command(dbi, 0x18, 0x00);
+	mipi_dbi_command(dbi, 0x19, 0x00);
+	mipi_dbi_command(dbi, 0x1a, 0x00);
+	mipi_dbi_command(dbi, 0x1b, 0x00);
+	mipi_dbi_command(dbi, 0x1c, 0x00);
+	mipi_dbi_command(dbi, 0x1d, 0x00);
+	mipi_dbi_command(dbi, 0x20, 0x01);
+	mipi_dbi_command(dbi, 0x21, 0x23);
+	mipi_dbi_command(dbi, 0x22, 0x45);
+	mipi_dbi_command(dbi, 0x23, 0x67);
+	mipi_dbi_command(dbi, 0x24, 0x01);
+	mipi_dbi_command(dbi, 0x25, 0x23);
+	mipi_dbi_command(dbi, 0x26, 0x45);
+	mipi_dbi_command(dbi, 0x27, 0x67);
+	mipi_dbi_command(dbi, 0x30, 0x01);
+	mipi_dbi_command(dbi, 0x31, 0x11);
+	mipi_dbi_command(dbi, 0x32, 0x00);
+	mipi_dbi_command(dbi, 0x33, 0xee);
+	mipi_dbi_command(dbi, 0x34, 0xff);
+	mipi_dbi_command(dbi, 0x35, 0xbb);
+	mipi_dbi_command(dbi, 0x36, 0xca);
+	mipi_dbi_command(dbi, 0x37, 0xdd);
+	mipi_dbi_command(dbi, 0x38, 0xac);
+	mipi_dbi_command(dbi, 0x39, 0x76);
+	mipi_dbi_command(dbi, 0x3a, 0x67);
+	mipi_dbi_command(dbi, 0x3b, 0x22);
+	mipi_dbi_command(dbi, 0x3c, 0x22);
+	mipi_dbi_command(dbi, 0x3d, 0x22);
+	mipi_dbi_command(dbi, 0x3e, 0x22);
+	mipi_dbi_command(dbi, 0x3f, 0x22);
+	mipi_dbi_command(dbi, 0x40, 0x22);
+	mipi_dbi_command(dbi, 0x52, 0x10);
+	mipi_dbi_command(dbi, 0x53, 0x10);
+
+	/* Switch to page 7 */
+	mipi_dbi_command(dbi, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
+	mipi_dbi_command(dbi, 0x17, 0x22);
+	mipi_dbi_command(dbi, 0x02, 0x77);
+	mipi_dbi_command(dbi, 0xe1, 0x79);
+	mipi_dbi_command(dbi, 0xb3, 0x10);
+
+	/* Switch to page 0 */
+	mipi_dbi_command(dbi, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x00); // 0x36
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE); // 0x11
+
+	msleep(120);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	msleep(120);
+}
+
+static const struct drm_display_mode rk050hr345_ct106a_mode = {
+	.width_mm    = 62,
+	.height_mm   = 110,
+	.clock       = 27000,
+	.hdisplay    = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end   = 480 + 10 + 10,
+	.htotal      = 480 + 10 + 10 + 10,
+	.vdisplay    = 854,
+	.vsync_start = 854 + 10,
+	.vsync_end   = 854 + 10 + 10,
+	.vtotal      = 854 + 10 + 10 + 10,
+	.flags       = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type        = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER,
+};
+
+static const struct ili9806e_spi_panel_desc rk050hr345_ct106a_desc = {
+	.init_sequence = rk050hr345_ct106a_init,
+	.display_mode = &rk050hr345_ct106a_mode,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+};
+
+static const struct of_device_id ili9806e_spi_of_match[] = {
+	{ .compatible = "rocktech,rk050hr345-ct106a", .data = &rk050hr345_ct106a_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ili9806e_spi_of_match);
+
+static const struct spi_device_id ili9806e_spi_ids[] = {
+	{ "rk050hr345-ct106a", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, ili9806e_spi_ids);
+
+static struct spi_driver ili9806e_spi_driver = {
+	.driver = {
+		.name = "ili9806e-spi",
+		.of_match_table = ili9806e_spi_of_match,
+	},
+	.probe = ili9806e_spi_probe,
+	.remove = ili9806e_spi_remove,
+	.id_table = ili9806e_spi_ids,
+};
+module_spi_driver(ili9806e_spi_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("Ilitek ILI9806E LCD SPI Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

