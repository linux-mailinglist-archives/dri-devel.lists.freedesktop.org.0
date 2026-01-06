Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E59CF9234
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 16:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50B210E164;
	Tue,  6 Jan 2026 15:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lwpep+xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E87F10E50C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 15:45:09 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-65089cebdb4so501634a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767714308; x=1768319108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FeU7gz3imHY+dHoq7Rj99mMUVGw0cmk9WRNrG4/jLk=;
 b=lwpep+xqzlDSyuAdgUK0sj3IOLcpXcAK16nplBmCxpCdm9o2WEQlw3yGmXXNFiEPO7
 j2lzAi3joNxGd375//elyMGu+qvgb9mAfHcBJVM1TwhY0kUnTyzlBCgVm+TX/mJBbl4K
 Qhk0LgzCFENGjDKOnntXKbPtyJTusTt4HDe0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714308; x=1768319108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0FeU7gz3imHY+dHoq7Rj99mMUVGw0cmk9WRNrG4/jLk=;
 b=JkiMF9WZOW2pMl3/LCRSud/K8cahbGpXtSbnHGwisisFd6ZitfniMW2gqWDKB5UUP/
 Qa1/9+pJot++1NGfxTazBmbBRLpGZgT/ElhqtEqJN1TsfXmSD9RP76NQVNUSiTYN1PEs
 uWj44ArzVKwUmvuEQZgfqWO4vnvedqOvED89N/3QcSgybSbyN5Q0yGFkCJtS6dhgOMfa
 ElUVlAmT3ghP8pJgLnTUstyu1kgOpgk77le/+I2SjkFnnWvYOgoztvWzCvJS6DmcF3JU
 cMdFd39IVqdsA0y3GWjSCKv7ILwpS7JMucSaUw/BUAgwrgI7ldAAEKXjlCDm0+YdwiG9
 nnfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9mLvaSWYJcTvtD7HlatS9rb7qmxZ3Osasru8aPoWbkLt1+FKeNbjzTd72o3wMvb2csmJw/FqojU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHo2KWfts6vTqPgRnEZV4b6J38F3vi5h+BhEHBAc0GCQ897Mb3
 228wEgWBpzWcreNqU2jBpxzXF89GJZUuERpxOVWrvo+9ZKMQx2jECDvhyVNAcMQ7OCY=
X-Gm-Gg: AY/fxX49OrWs/NqOPnrUjsbRWSx7hCq0lcbEDJXqDa6Di6EEnDlnhHDLTI+RqjvzTZ3
 wQBMVcuJIDyNMIaeaWbD5oZSqpJerXJsjtnXgIwWqWTRMP4MvNm+mIpo/Nx6vSKEn973HDUPTEY
 OmlWsuj0w1Lg8wbxlU3LHsN/TGpNZIsqfe+WnpWBag3AHv4/VPDioCQWyZogIYz3TTCE5sm07E5
 1p3jPzJ3HoJzbZQt8Q1nWgXrUdNY0hlGCWR8Zwgl9E8Lm2LnW+exdfK7MwCpG2sRbeJV53pv4qW
 1C/UwuGxXLnWMJUEPt0w9w8diuw0wBksyk0yaIprZy5np6Ffh91Bf4/qyOsq0XWPUJj8yxyuXFj
 UhBNU5rijFO5hkRF2L+WSNSYOKu+8f8AVWmrs42snEgO8AFLvagQNunv+8gd/BINqizH3ylkkCA
 dXa3Uf5IARavxvsvtub7/MA/hKfiLa2qdcH46D4aAM02D8rJV0Z2qjzzER69awLC6KCYXMguw0V
 R2UpqWXRlk+fDpbMTAAWQC48WlipKjb3b0quSdQmANIxQojvRGj3F5zIER1Y7yMntJ1U1whlG+D
 o1LVw6Q3FAM=
X-Google-Smtp-Source: AGHT+IFSOE3eOIYLow5a/ID+0olibBOljWSw/byjcAX/Y4cdhEW8WExtw5kIjTQ2vxLvpwdLFzbZzQ==
X-Received: by 2002:a17:907:9614:b0:b79:f4e4:b55d with SMTP id
 a640c23a62f3a-b8426bf1334mr359247866b.51.1767714307997; 
 Tue, 06 Jan 2026 07:45:07 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be64efasm2349767a12.21.2026.01.06.07.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:45:07 -0800 (PST)
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
Subject: [PATCH 3/3] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A SPI panel
Date: Tue,  6 Jan 2026 16:43:16 +0100
Message-ID: <20260106154446.2735701-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
References: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
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

Kconfig and Makefile are updated to allow selecting the SPI variant
independently from the DSI one.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +-
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 327 ++++++++++++++++++
 4 files changed, 342 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 40a77e5fd2fd..a03fc4a97c67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7908,8 +7908,10 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
+M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9ab72f3ab32e..7651be0d8bae 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -263,7 +263,8 @@ config DRM_PANEL_ILITEK_ILI9806E
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y if you want to enable support for panels based on the
-	  Ilitek ILI9806E controller.
+	  Ilitek ILI9806E controller. This panel can be accessed using
+	  DSI or SPI.
 
 config DRM_PANEL_ILITEK_ILI9806E_DSI
 	tristate "Ilitek ILI9806E DSI panel"
@@ -274,6 +275,16 @@ config DRM_PANEL_ILITEK_ILI9806E_DSI
 	  Say Y here if you want to be able to access the Ilitek
 	  ILI9806E panel using DSI.
 
+config DRM_PANEL_ILITEK_ILI9806E_SPI
+	tristate "Ilitek ILI9806E RGB SPI panel"
+	depends on SPI
+	depends on DRM_PANEL_ILITEK_ILI9806E
+	select DRM_MIPI_DBI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to be able to access the Ilitek
+	  ILI9806E panel using SPI.
+
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 00071a983242..acc1d49983cb 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI) += panel-ilitek-ili9806e-spi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
new file mode 100644
index 000000000000..25b19dfd2924
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SPI interface to the Ilitek ILI9806E panel.
+ *
+ * Copyright (c) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct ili9806e_spi_panel {
+	struct mipi_dbi dbi;
+	struct drm_panel panel;
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
+static inline struct ili9806e_spi_panel *panel_to_ili9806e_spi(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili9806e_spi_panel, panel);
+}
+
+static int ili9806e_spi_unprepare(struct drm_panel *panel)
+{
+	struct ili9806e_spi_panel *ctx = panel_to_ili9806e_spi(panel);
+	struct mipi_dbi *dbi = &ctx->dbi;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE, 0x00);
+
+	return 0;
+}
+
+static int ili9806e_spi_prepare(struct drm_panel *panel)
+{
+	struct ili9806e_spi_panel *ctx = panel_to_ili9806e_spi(panel);
+
+	gpiod_set_value(ctx->dbi.reset, 1);
+	usleep_range(15, 50);
+	gpiod_set_value(ctx->dbi.reset, 0);
+	msleep(125);
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
+	struct ili9806e_spi_panel *ctx = panel_to_ili9806e_spi(panel);
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
+static const struct drm_panel_funcs ili9806e_spi_drm_funcs = {
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
+	ctx->desc = device_get_match_data(dev);
+
+	drm_panel_init(&ctx->panel, dev, &ili9806e_spi_drm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	spi_set_drvdata(spi, ctx);
+
+	ctx->dbi.reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->dbi.reset))
+		return dev_err_probe(dev, PTR_ERR(ctx->dbi.reset), "cannot get reset-gpios\n");
+
+	err = drm_panel_of_backlight(&ctx->panel);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to get backlight\n");
+
+	err = mipi_dbi_spi_init(spi, &ctx->dbi, NULL);
+	if (err)
+		return dev_err_probe(dev, err, "MIPI DBI init failed\n");
+
+	drm_panel_add(&ctx->panel);
+
+	return 0;
+}
+
+static void ili9806e_spi_remove(struct spi_device *spi)
+{
+	struct ili9806e_spi_panel *ctx = spi_get_drvdata(spi);
+
+	drm_panel_remove(&ctx->panel);
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
+MODULE_DEVICE_TABLE(spi, ili9806e_ids);
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

