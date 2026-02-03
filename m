Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AIWEBSqgWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:56:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3960D5E58
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4027410E560;
	Tue,  3 Feb 2026 07:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="J7KT9JWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5007710E568
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:55:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-480706554beso56690785e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770105358; x=1770710158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzPBZtkRvSXF5rHwCwtGaf1O5mGkAxb0gX3q0+Ld2QU=;
 b=J7KT9JWGyCO8NHCiCPG4CKvVVTR9wfZHuKPNES+UvFmQWi9elSS5Ez9bCtuqG9mmQV
 oljsV+cFqdNc/P/ps3ZDP56c0sPcamvofMmA8tGx+wzdQ/9k1FITLSagZ0BUNC6c+2Et
 kM/0sErs0h8E3NYg1xQDF9K845bmRIEpWYJqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770105358; x=1770710158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EzPBZtkRvSXF5rHwCwtGaf1O5mGkAxb0gX3q0+Ld2QU=;
 b=Lx4dRA1CUlYRTmXb6NCtCaGiLe3UpgJIveO+5HEdlaQFo26shgut6HOr96XAg3T92K
 usfxyi5X1TI3Y2HUGphnSHOwJ3UHfMrNCTqyR7j2pc979ocPMiXb8wKOZfpL5nEN3uIT
 rJ0ZsII4f59eR5/dO0q4f8akCvlUkiDAbrJg6VeqpuW3jAWNMgINBLNhR5DVc80+eWAi
 zHAYLKtPZ4mia1G4vhUCGcmReHcsIP5TlGHT7xy1U376KQzL60DLf4t4OEJlg/SYYLa5
 a2HaP/rh0yVB4amfE9ZLF8JLRrGIRZZ0ece4jgrYs/QJRtmlTAffQjOOS/AFxeLogjBV
 fBiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZyta6UMApQlakMw36BMNhYRJ7C4sIqoumiynGn/yWuXwGs0/k/rAp9wpRPDLF6h8bKbiOj1/7rWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZMlJm8wcFFBnoKxMTfH8DgCYinPWQnGLLTcILjDtquKo/2mDm
 SRPQhLPPkQZyxzR1MRoWglkzEU6PWxlYJjovNwTxeb7r1eQAWIwRi4fepbgI4xccoNM=
X-Gm-Gg: AZuq6aKtbwcR4Y0GsRIVThF9XhH6r0/OZbfQ4SQu+nDW5ePh6LgtGv4a+vJeSFuoQ/V
 VDvVMwRrRhnzgt0WsKSkuyM4TSPg4K/jZYEtky90HfZZSB6njUYBDXisG4/pFzVrUf41msRsXnH
 gODK2sxj7wLl7KVpQ1A46+wY63MKZWAPGkTkxzF5w4Lr9ZfZ+ePk/HFAa7Oh/h5enaEwdDwcZDB
 zP8kn9lUFnPr6nu89ZFGTiymt1pHhnkQFcSytQ8eLu6Hzn6IJUoyjBZO4b38T/bQvlZxqVFZqXs
 MWo6SCTbX3jIqixUcuq4s57O2e+YMlkLUEk1CIFb75XENgHRRHvh6FyJqKmSnc72ib7sg9bvjbZ
 QSDxy/4yBDVGySc7sFDMQ7m4ms4wcwAlWtMM17Xtoz07owfnkXmMwes1LOaEribIuVE0D77pkk+
 i535d/0E92MzpV4OTfpcTeD1gwyERmT0oIFBuSTq+qeyqz3kQGXCgGBM9d1oKjmP2SHraLg/goR
 zrir0oKeFRdS5TLiXHTo8Ys/FTqwUYFVqcMmJgy8I+kgElBD0JzEJ2KgvGGnG7KbASmm4JkqD1R
 fNeMtOYKx8M=
X-Received: by 2002:a05:600c:4e47:b0:477:af07:dd21 with SMTP id
 5b1f17b1804b1-482db49cdb6mr204376565e9.25.1770105357825; 
 Mon, 02 Feb 2026 23:55:57 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e267b699sm111939885e9.16.2026.02.02.23.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:55:57 -0800 (PST)
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
Subject: [PATCH v3 4/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A SPI panel
Date: Tue,  3 Feb 2026 08:54:51 +0100
Message-ID: <20260203075548.14907-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
References: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,gmail.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amarulasolutions.com:email,amarulasolutions.com:dkim,amarulasolutions.com:mid]
X-Rspamd-Queue-Id: E3960D5E58
X-Rspamd-Action: no action

Add support for the Rocktech RK050HR345-CT106A panel based on the
Ilitek ILI9806E controller using the SPI bus.

The driver is designed to be easily extensible to support other panels
with different initialization sequences and display timings by
providing a specific descriptor structure for each model.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Add Reviewed-by tag of Rob Herring

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
index b856a62666dc..6aaa32eab636 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7916,6 +7916,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 
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

