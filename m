Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE0996F31
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F24710E76C;
	Wed,  9 Oct 2024 15:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLJODFvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7D510E1DC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:09:17 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53959a88668so8879136e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728486556; x=1729091356; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pQzFurxONmfMRW+4iWughlMTvY7MPZaNZ6T0HX1SFog=;
 b=cLJODFvl1TYIKqkVbzodWdmokvqq/DXkJQNIBhBOEPuhaVCMX8eUSRZxh4YVKUsoT+
 NVTRH1OKMAFEz6JvCxAX8dg9XtZ3EtJeKVbjVlc9C5XUljPFD3cstIKGEcjBJ4uwagtM
 sfFrVqMknd4FG8864Dt6PjqyfKmYKrVrXT5GS+dMrrCZ+BDxO4//WUm7Y9HDo9TdZ38N
 yWOxR5no7gD191j6Kg/KKelY7H6c9nirTf/+Bzd7KPgk7h32eR6eDZ/2VaWCd+hUs60U
 CMzLPYoUs8P02AWczyXJxAbJIcCcn1LlamHS3Ueb0OLuJGAq25V456voIUq0RwFcFj8T
 xhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728486556; x=1729091356;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQzFurxONmfMRW+4iWughlMTvY7MPZaNZ6T0HX1SFog=;
 b=BoA2R3xgVp+8m8/d1dlC33rsu1iMblb17p5ck5ZJntMtF01g6Q+yQ0nG8QjMey9X62
 iwx4r2cUYuEgOwnYXXeGguyrwtQgFyZ/nU7TPfuH0o6EiKm7as4ix/L6JXyXnqKMAStp
 nFRzsUCvx+/KwIZRaCS1B5QfMrWC9D3UPvIiI6c7gDBZwXTakZlG6ZrKIfsEFZrOKAfc
 q1cmAMb2HaVJWz1ZjVrNLgoGjivnHytg2v/KpLNP9WYlL4d4O8JpPpnbAMshT1UKfeTM
 2dUeAbv7tO2oerzC+iQ+Vx19pJKDBmxQv9i7AwnThqxyVKrGUHQeiHGJN01jDZfUUxEV
 wndA==
X-Gm-Message-State: AOJu0Yx9celrJL6d8FpMoH11t5f2cdBa0PQ+uouWFMds5t2gP1mQmP8d
 paBTXRn9MBH3p7WMcDoAF8kG23aWYPSa/JAPDLxs5wR68E5Pj0ua
X-Google-Smtp-Source: AGHT+IFUqvSE5T8FfIbpWk5yqedZ5Gh1Km+BI/K+LsRl0jVeYwTLYV5GbIBOa366X3pB+0uxwWyRYA==
X-Received: by 2002:a05:6512:3b20:b0:539:a3eb:d000 with SMTP id
 2adb3069b0e04-539c49580c0mr1813234e87.42.1728486555195; 
 Wed, 09 Oct 2024 08:09:15 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-107.telecom.by.
 [46.53.189.107]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e7b19b8sm668861766b.154.2024.10.09.08.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:09:14 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 09 Oct 2024 18:09:08 +0300
Subject: [PATCH v7 3/3] drm/panel: Add support for S6E3HA8 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-starqltechn_integration_upstream-v7-3-9967bd15c7c5@gmail.com>
References: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
In-Reply-To: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728486550; l=14601;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=pzDMf4OpE5Ssrnr/tT2AV3m8V/QhC8CvNbVtUskzjzc=;
 b=jSk/dl6eOBZg2h7dtxWB+rX1GxCOsAORZQKeZbCgw4IxctiqeQ9qJLcZo40N1TwcWh/Eqk+48
 VyPicXCKC0sAGs2UHIGmtPhjYaFlpXa/DtvYP3khCc6F+rtDCd1ed9U
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

Add support for MIPI-DSI based S6E3HA8 AMOLED panel
driver. This panel has 1440x2960 resolution, 5.8-inch physical
size, and can be found in starqltechn device.
Brightness regulation is not yet supported.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v6:
- return ctx.accum_err instead of 0 where possible
- s6e3ha8_amb577px01_wqhd_on: arrange code blocks by
  key unlock / lock actions
- more *_multi functions
- switch to devm_regulator_bulk_get_const

Changes for v5:
- return ctx.accum_err instead of 0 where possible
- switch mipi_dsi_picture_parameter_set to _multi
- replace msleep with mipi_dsi_msleep

Changes in v4:
- inline power related functions
- rework driver using new mipi_dsi_dcs_write_seq_multi macro
- use drm_connector_helper_get_modes_fixed for modes
- remove excessive compression setting
---
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +++
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 342 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 351 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc3cf5114c6..0f3f767afa4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7393,6 +7393,7 @@ DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1077fd2307d4..7d3c9cbfe835 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -689,6 +689,13 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_S6E3HA8
+	tristate "Samsung S6E3HA8 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+
 config DRM_PANEL_SAMSUNG_S6E63J0X03
 	tristate "Samsung S6E63J0X03 DSI command mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 987a08702410..8ee28f5a2213 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
new file mode 100644
index 000000000000..76b5a6ea610d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//	Copyright (c) 2013, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_panel.h>
+
+struct s6e3ha8 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+const struct regulator_bulk_data s6e3ha8_supplies[] = {
+	{ .supply = "vdd3" },
+	{ .supply = "vci" },
+	{ .supply = "vddr" },
+};
+
+static inline
+struct s6e3ha8 *to_s6e3ha8_amb577px01_wqhd(struct drm_panel *panel)
+{
+	return container_of(panel, struct s6e3ha8, panel);
+}
+
+#define s6e3ha8_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define s6e3ha8_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+#define s6e3ha8_test_key_on_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
+#define s6e3ha8_test_key_off_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
+#define s6e3ha8_test_key_on_lvl1(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0xa5, 0xa5)
+#define s6e3ha8_test_key_off_lvl1(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0x5a, 0x5a)
+#define s6e3ha8_afc_off(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xe2, 0x00, 0x00)
+
+static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(5000, 6000);
+}
+
+static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *priv)
+{
+	struct mipi_dsi_device *dsi = priv->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	s6e3ha8_test_key_on_lvl1(&ctx);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_compression_mode_multi(&ctx, true);
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	usleep_range(5000, 6000);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x13);
+	s6e3ha8_test_key_off_lvl2(&ctx);
+	usleep_range(10000, 11000);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x13);
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	/* OMOK setting 1 (Initial setting) - Scaler Latch Setting Guide */
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x07);
+	/* latch setting 1 : Scaler on/off & address setting & PPS setting -> Image update latch */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x3c, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x0b);
+	/* latch setting 2 : Ratio change mode -> Image update latch */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x30);
+	/* OMOK setting 2 - Seamless setting guide : WQHD */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x00, 0x00, 0x05, 0x9f); /* CASET */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x00, 0x00, 0x0b, 0x8f); /* PASET */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x01); /* scaler setup : scaler off */
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00); /* TE Vsync ON */
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xed, 0x4c); /* ERR_FG */
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	s6e3ha8_test_key_on_lvl3(&ctx);
+	/* FFC Setting 897.6Mbps */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc5, 0x0d, 0x10, 0xb4, 0x3e, 0x01);
+	s6e3ha8_test_key_off_lvl3(&ctx);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9,
+				   0x00, 0xb0, 0x81, 0x09, 0x00, 0x00, 0x00,
+				   0x11, 0x03); /* TSP HSYNC Setting */
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf6, 0x43);
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	/* Brightness condition set */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xca,
+				   0x07, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
+				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				   0x80, 0x80, 0x80, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0x0c); /* AID Set : 0% */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5,
+				   0x19, 0xdc, 0x16, 0x01, 0x34, 0x67, 0x9a,
+				   0xcd, 0x01, 0x22, 0x33, 0x44, 0x00, 0x00,
+				   0x05, 0x55, 0xcc, 0x0c, 0x01, 0x11, 0x11,
+				   0x10); /* MPS/ELVSS Setting */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf4, 0xeb, 0x28); /* VINT */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf7, 0x03); /* Gamma, LTPS(AID) update */
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	s6e3ha8_test_key_off_lvl1(&ctx);
+
+	return ctx.accum_err;
+}
+
+static int s6e3ha8_enable(struct drm_panel *panel)
+{
+	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
+	struct mipi_dsi_device *dsi = priv->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	s6e3ha8_test_key_on_lvl1(&ctx);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	s6e3ha8_test_key_off_lvl1(&ctx);
+
+	return ctx.accum_err;
+}
+
+static int s6e3ha8_disable(struct drm_panel *panel)
+{
+	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
+	struct mipi_dsi_device *dsi = priv->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	s6e3ha8_test_key_on_lvl1(&ctx);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	s6e3ha8_test_key_off_lvl1(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	s6e3ha8_test_key_on_lvl2(&ctx);
+	s6e3ha8_afc_off(&ctx);
+	s6e3ha8_test_key_off_lvl2(&ctx);
+
+	mipi_dsi_msleep(&ctx, 160);
+
+	return ctx.accum_err;
+}
+
+static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
+{
+	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
+	struct mipi_dsi_device *dsi = priv->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
+	if (ret < 0)
+		return ret;
+	mipi_dsi_msleep(&ctx, 120);
+	s6e3ha8_amb577px01_wqhd_reset(priv);
+
+	ret = s6e3ha8_amb577px01_wqhd_on(priv);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(priv->reset_gpio, 1);
+		goto err;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
+
+	s6e3ha8_test_key_on_lvl1(&ctx);
+	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+	s6e3ha8_test_key_off_lvl1(&ctx);
+
+	mipi_dsi_msleep(&ctx, 28);
+
+	return ctx.accum_err;
+err:
+	regulator_bulk_disable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
+	return ret;
+}
+
+static int s6e3ha8_amb577px01_wqhd_unprepare(struct drm_panel *panel)
+{
+	struct s6e3ha8 *priv = to_s6e3ha8_amb577px01_wqhd(panel);
+
+	return regulator_bulk_disable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
+}
+
+static const struct drm_display_mode s6e3ha8_amb577px01_wqhd_mode = {
+	.clock = (1440 + 116 + 44 + 120) * (2960 + 120 + 80 + 124) * 60 / 1000,
+	.hdisplay = 1440,
+	.hsync_start = 1440 + 116,
+	.hsync_end = 1440 + 116 + 44,
+	.htotal = 1440 + 116 + 44 + 120,
+	.vdisplay = 2960,
+	.vsync_start = 2960 + 120,
+	.vsync_end = 2960 + 120 + 80,
+	.vtotal = 2960 + 120 + 80 + 124,
+	.width_mm = 64,
+	.height_mm = 132,
+};
+
+static int s6e3ha8_amb577px01_wqhd_get_modes(struct drm_panel *panel,
+					     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &s6e3ha8_amb577px01_wqhd_mode);
+}
+
+static const struct drm_panel_funcs s6e3ha8_amb577px01_wqhd_panel_funcs = {
+	.prepare = s6e3ha8_amb577px01_wqhd_prepare,
+	.unprepare = s6e3ha8_amb577px01_wqhd_unprepare,
+	.get_modes = s6e3ha8_amb577px01_wqhd_get_modes,
+	.enable = s6e3ha8_enable,
+	.disable = s6e3ha8_disable,
+};
+
+static int s6e3ha8_amb577px01_wqhd_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e3ha8 *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(s6e3ha8_supplies),
+				      s6e3ha8_supplies,
+				      &priv->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to get regulators: %d\n", ret);
+		return ret;
+	}
+
+	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
+		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&priv->panel, dev, &s6e3ha8_amb577px01_wqhd_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	priv->panel.prepare_prev_first = true;
+
+	drm_panel_add(&priv->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &priv->dsc;
+
+	priv->dsc.dsc_version_major = 1;
+	priv->dsc.dsc_version_minor = 1;
+
+	priv->dsc.slice_height = 40;
+	priv->dsc.slice_width = 720;
+	WARN_ON(1440 % priv->dsc.slice_width);
+	priv->dsc.slice_count = 1440 / priv->dsc.slice_width;
+	priv->dsc.bits_per_component = 8;
+	priv->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	priv->dsc.block_pred_enable = true;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&priv->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void s6e3ha8_amb577px01_wqhd_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e3ha8 *priv = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
+	{ .compatible = "samsung,s6e3ha8" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s6e3ha8_amb577px01_wqhd_of_match);
+
+static struct mipi_dsi_driver s6e3ha8_amb577px01_wqhd_driver = {
+	.probe = s6e3ha8_amb577px01_wqhd_probe,
+	.remove = s6e3ha8_amb577px01_wqhd_remove,
+	.driver = {
+		.name = "panel-s6e3ha8",
+		.of_match_table = s6e3ha8_amb577px01_wqhd_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e3ha8_amb577px01_wqhd_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for S6E3HA8 panel");
+MODULE_LICENSE("GPL");

-- 
2.39.2

