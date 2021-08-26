Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2093F8608
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 13:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1206E7D1;
	Thu, 26 Aug 2021 11:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E348C6E7D1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 11:03:24 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id y11so2411660pfl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCA7h/KbJYqB97JcgMsyoWM53aAuOivS3moPI/RDQDU=;
 b=ObzkOdhZ8eZJSALgR1i1iux2qX5wOsHpDHf6Be1AMcoTOIcIbK/ewHmseX/5luWy2f
 v2kf0reAuhBCPwyki+vZI6e7h9CQf7kirDTWeO4DH4W13mdTNsxGfduViz/LQd6xeB5f
 xDbxCTvyUcxe4TLSaeGz83DGRqLMU+a1eqfNaUQ1exOazQH9j5V4UyUB59+XHyvOoLYz
 3rH6RmPxP/2aRRPOQ6fArdRPpQTwrvr9ArPbD5N79OeTIn5aTdUMD7VF0I9XTtFFj08s
 qpouNfBjhZWWMw2nu2j4to+uJdUGMhcdzFoqTyU4ssUq2j9eXps4G4l2n8E2RlhUXjPt
 EvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCA7h/KbJYqB97JcgMsyoWM53aAuOivS3moPI/RDQDU=;
 b=oPQuHEPP393gebDd4qKvlwNdiChle4toRnW+T4Ez1nYDegCZLsILfe0o0zZ5izyTlJ
 EciSt1IRg+e/j9E0T1tZXbeIYtuuLzgl+dNLMCHqiGVaY4RlXHsc/l40E5P6bnSXlAP4
 NOGNM/09Er6KoE4ZigtKWVS406rDEVsEfwl1PDCQmmwpVHusigll5k5JSyqxcTzOiD+O
 aSuWnwdNWKKKtGGEHE/c5DozCllJp7Gx55EM3uB5pk9ZnkwiwskJQDp0/6NKJsDbTeOv
 8de8dDWhqwYX9qxfPVytOPAfMP/XO8UhyLupNQ3kNgSgOjPSHaU5js/ZoF1du8Rr1/I9
 OTGQ==
X-Gm-Message-State: AOAM531LXtyYDXM1tjFtBJFUp5lfhNwrVWxCepINYW2rNvxpraGEXaKQ
 ceT0iLI2K4EKHAYtIxUous2mdw==
X-Google-Smtp-Source: ABdhPJzWwGFB7mB5OEY54r5CXTWl9VvooF4bC28ewakCnDQNo6zdanHFUdIl1Dd1zjmXx+uiv2eaRg==
X-Received: by 2002:a05:6a00:23cf:b0:3e2:4622:da6d with SMTP id
 g15-20020a056a0023cf00b003e24622da6dmr3280286pfc.18.1629975804030; 
 Thu, 26 Aug 2021 04:03:24 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id z12sm2655335pfe.79.2021.08.26.04.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 04:03:23 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 1/2] drm/panel: support for BOE tv1110c9m-ll3 wuxga dsi video
 mode panel
Date: Thu, 26 Aug 2021 19:03:10 +0800
Message-Id: <20210826110311.613396-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
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

Add driver for BOE tv110c9m-ll3 panel is a 10.95" 1200x2000 panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/Kconfig              |   10 +
 drivers/gpu/drm/panel/Makefile             |    1 +
 drivers/gpu/drm/panel/panel-boe-tv110c9m.c | 1303 ++++++++++++++++++++
 3 files changed, 1314 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv110c9m.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ef87d92cdf49..ee75765ba483 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -57,6 +57,16 @@ config DRM_PANEL_BOE_TV101WUM_NL6
 	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
 	  45NA WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_BOE_TV110C9M
+	tristate "BOE TTV110C9M panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Boe TTV110C9M
+	  TFT-LCD modules. The panel has a 1200x2000 resolution and uses
+	  24 bit RGB per pixel.
+
 config DRM_PANEL_DSI_CM
 	tristate "Generic DSI command mode panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cae4d976c069..5c6a3c0730f9 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
+obj-$(CONFIG_DRM_PANEL_BOE_TV110C9M) += panel-boe-tv110c9m.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
diff --git a/drivers/gpu/drm/panel/panel-boe-tv110c9m.c b/drivers/gpu/drm/panel/panel-boe-tv110c9m.c
new file mode 100644
index 000000000000..8a5a43a4815f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-boe-tv110c9m.c
@@ -0,0 +1,1303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+* Copyright 2021 Google Inc.
+*
+* Panel driver for the Boe tv110c9m panel.
+*/
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned int bpc;
+
+	/**
+	 * @width_mm: width of the panel's active display area
+	 * @height_mm: height of the panel's active display area
+	 */
+	struct {
+		unsigned int width_mm;
+		unsigned int height_mm;
+	} size;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	const struct panel_init_cmd *init_cmds;
+	unsigned int lanes;
+	bool discharge_on_disable;
+};
+
+struct boe_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	const struct panel_desc *desc;
+
+	enum drm_panel_orientation orientation;
+	struct regulator *pp3300;
+	struct regulator *pp1800;
+	struct regulator *avee;
+	struct regulator *avdd;
+	struct gpio_desc *enable_gpio;
+
+	bool prepared;
+};
+
+enum dsi_cmd_type {
+	INIT_DCS_CMD,
+	DELAY_CMD,
+};
+
+struct panel_init_cmd {
+	enum dsi_cmd_type type;
+	size_t len;
+	const char *data;
+};
+
+#define _INIT_DCS_CMD(...) { \
+	.type = INIT_DCS_CMD, \
+	.len = sizeof((char[]){__VA_ARGS__}), \
+	.data = (char[]){__VA_ARGS__} }
+
+#define _INIT_DELAY_CMD(...) { \
+	.type = DELAY_CMD,\
+	.len = sizeof((char[]){__VA_ARGS__}), \
+	.data = (char[]){__VA_ARGS__} }
+
+static const struct panel_init_cmd boe_init_cmd[] = {
+
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x05, 0xD9),
+	_INIT_DCS_CMD(0x07, 0x78),
+	_INIT_DCS_CMD(0x08, 0x5A),
+	_INIT_DCS_CMD(0x0D, 0x63),
+	_INIT_DCS_CMD(0x95, 0xEB),
+	_INIT_DCS_CMD(0x96, 0xEB),
+	_INIT_DCS_CMD(0x30, 0x11),
+	_INIT_DCS_CMD(0x6D, 0x66),
+	_INIT_DCS_CMD(0x75, 0xA2),
+	_INIT_DCS_CMD(0x77, 0x3B),
+
+	_INIT_DCS_CMD(0xB0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9),
+	_INIT_DCS_CMD(0xB1, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31),
+	_INIT_DCS_CMD(0xB2, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B),
+	_INIT_DCS_CMD(0xB3, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF),
+
+	_INIT_DCS_CMD(0xB4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9),
+	_INIT_DCS_CMD(0xB5, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31),
+	_INIT_DCS_CMD(0xB6, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B),
+	_INIT_DCS_CMD(0xB7, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF),
+	_INIT_DCS_CMD(0xB8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9),
+	_INIT_DCS_CMD(0xB9, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31),
+	_INIT_DCS_CMD(0xBA, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B),
+	_INIT_DCS_CMD(0xBB, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF),
+
+	_INIT_DCS_CMD(0xFF, 0x21),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0xB0, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
+	_INIT_DCS_CMD(0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
+	_INIT_DCS_CMD(0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
+	_INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
+
+	_INIT_DCS_CMD(0xB4, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
+	_INIT_DCS_CMD(0xB5, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
+	_INIT_DCS_CMD(0xB6, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
+	_INIT_DCS_CMD(0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
+
+	_INIT_DCS_CMD(0xB8, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
+	_INIT_DCS_CMD(0xB9, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
+	_INIT_DCS_CMD(0xBA, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
+	_INIT_DCS_CMD(0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
+
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x00, 0x00),
+	_INIT_DCS_CMD(0x01, 0x00),
+
+	_INIT_DCS_CMD(0x02, 0x1C),
+	_INIT_DCS_CMD(0x03, 0x1C),
+
+	_INIT_DCS_CMD(0x04, 0x1D),
+	_INIT_DCS_CMD(0x05, 0x1D),
+
+	_INIT_DCS_CMD(0x06, 0x04),
+	_INIT_DCS_CMD(0x07, 0x04),
+
+	_INIT_DCS_CMD(0x08, 0x0F),
+	_INIT_DCS_CMD(0x09, 0x0F),
+
+	_INIT_DCS_CMD(0x0A, 0x0E),
+	_INIT_DCS_CMD(0x0B, 0x0E),
+
+	_INIT_DCS_CMD(0x0C, 0x0D),
+	_INIT_DCS_CMD(0x0D, 0x0D),
+
+	_INIT_DCS_CMD(0x0E, 0x0C),
+	_INIT_DCS_CMD(0x0F, 0x0C),
+
+	_INIT_DCS_CMD(0x10, 0x08),
+	_INIT_DCS_CMD(0x11, 0x08),
+
+	_INIT_DCS_CMD(0x12, 0x00),
+	_INIT_DCS_CMD(0x13, 0x00),
+	_INIT_DCS_CMD(0x14, 0x00),
+	_INIT_DCS_CMD(0x15, 0x00),
+
+	_INIT_DCS_CMD(0x16, 0x00),
+	_INIT_DCS_CMD(0x17, 0x00),
+
+	_INIT_DCS_CMD(0x18, 0x1C),
+	_INIT_DCS_CMD(0x19, 0x1C),
+
+	_INIT_DCS_CMD(0x1A, 0x1D),
+	_INIT_DCS_CMD(0x1B, 0x1D),
+
+	_INIT_DCS_CMD(0x1C, 0x04),
+	_INIT_DCS_CMD(0x1D, 0x04),
+
+	_INIT_DCS_CMD(0x1E, 0x0F),
+	_INIT_DCS_CMD(0x1F, 0x0F),
+
+	_INIT_DCS_CMD(0x20, 0x0E),
+	_INIT_DCS_CMD(0x21, 0x0E),
+
+	_INIT_DCS_CMD(0x22, 0x0D),
+	_INIT_DCS_CMD(0x23, 0x0D),
+
+	_INIT_DCS_CMD(0x24, 0x0C),
+	_INIT_DCS_CMD(0x25, 0x0C),
+
+	_INIT_DCS_CMD(0x26, 0x08),
+	_INIT_DCS_CMD(0x27, 0x08),
+
+	_INIT_DCS_CMD(0x28, 0x00),
+	_INIT_DCS_CMD(0x29, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x00),
+	_INIT_DCS_CMD(0x2B, 0x00),
+
+	_INIT_DCS_CMD(0x2D, 0x20),
+	_INIT_DCS_CMD(0x2F, 0x0A),
+	_INIT_DCS_CMD(0x30, 0x44),
+	_INIT_DCS_CMD(0x33, 0x0C),
+	_INIT_DCS_CMD(0x34, 0x32),
+
+	_INIT_DCS_CMD(0x37, 0x44),
+	_INIT_DCS_CMD(0x38, 0x40),
+	_INIT_DCS_CMD(0x39, 0x00),
+	_INIT_DCS_CMD(0x3A, 0x9A),
+	_INIT_DCS_CMD(0x3B, 0xA0),
+	_INIT_DCS_CMD(0x3D, 0x42),
+
+	_INIT_DCS_CMD(0x3F, 0x06),
+	_INIT_DCS_CMD(0x43, 0x06),
+
+	_INIT_DCS_CMD(0x47, 0x66),
+	_INIT_DCS_CMD(0x4A, 0x9A),
+	_INIT_DCS_CMD(0x4B, 0xA0),
+	_INIT_DCS_CMD(0x4C, 0x91),
+
+	_INIT_DCS_CMD(0x4D, 0x21),
+	_INIT_DCS_CMD(0x4E, 0x43),
+	_INIT_DCS_CMD(0x51, 0x12),
+	_INIT_DCS_CMD(0x52, 0x34),
+	_INIT_DCS_CMD(0x55, 0x82, 0x02),
+	_INIT_DCS_CMD(0x56, 0x04),
+	_INIT_DCS_CMD(0x58, 0x21),
+	_INIT_DCS_CMD(0x59, 0x30),
+	_INIT_DCS_CMD(0x5A, 0xBA),	//9A
+	_INIT_DCS_CMD(0x5B, 0xA0),
+	_INIT_DCS_CMD(0x5E, 0x00, 0x06),
+	_INIT_DCS_CMD(0x5F, 0x00),
+
+	_INIT_DCS_CMD(0x65, 0x82),
+
+	_INIT_DCS_CMD(0x7E, 0x20),
+	_INIT_DCS_CMD(0x7F, 0x3C),
+	_INIT_DCS_CMD(0x82, 0x04),
+	_INIT_DCS_CMD(0x97, 0xC0),
+
+	_INIT_DCS_CMD(0xB6, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00),
+
+	_INIT_DCS_CMD(0x92, 0xC4),
+	_INIT_DCS_CMD(0x93, 0x1A),
+	_INIT_DCS_CMD(0x94, 0x5F),
+
+	_INIT_DCS_CMD(0xD7, 0x55),
+	_INIT_DCS_CMD(0xDA, 0x0A),
+	_INIT_DCS_CMD(0xDE, 0x08),
+
+	_INIT_DCS_CMD(0xDB, 0x05),
+	_INIT_DCS_CMD(0xDC, 0xC4),
+	_INIT_DCS_CMD(0xDD, 0x22),
+
+	_INIT_DCS_CMD(0xDF, 0x05),
+	_INIT_DCS_CMD(0xE0, 0xC4),
+
+	_INIT_DCS_CMD(0xE1, 0x05),
+	_INIT_DCS_CMD(0xE2, 0xC4),
+
+	_INIT_DCS_CMD(0xE3, 0x05),
+	_INIT_DCS_CMD(0xE4, 0xC4),
+	_INIT_DCS_CMD(0xE5, 0x05),
+	_INIT_DCS_CMD(0xE6, 0xC4),
+	_INIT_DCS_CMD(0x5C, 0x88),
+	_INIT_DCS_CMD(0x5D, 0x08),
+	_INIT_DCS_CMD(0x8D, 0x88),
+	_INIT_DCS_CMD(0x8E, 0x08),
+	_INIT_DCS_CMD(0xB5, 0x90),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x05, 0x00),
+
+	_INIT_DCS_CMD(0x19, 0x07),
+
+	_INIT_DCS_CMD(0x1F, 0xBA),//9A
+	_INIT_DCS_CMD(0x20, 0xA0),
+
+	_INIT_DCS_CMD(0x26, 0xBA),//9A
+	_INIT_DCS_CMD(0x27, 0xA0),
+
+	_INIT_DCS_CMD(0x33, 0xBA),//9A
+	_INIT_DCS_CMD(0x34, 0xA0),
+
+	_INIT_DCS_CMD(0x3F, 0xE0),
+
+	_INIT_DCS_CMD(0x40, 0x00),
+
+	_INIT_DCS_CMD(0x44, 0x00),
+	_INIT_DCS_CMD(0x45, 0x40),
+
+	_INIT_DCS_CMD(0x48, 0xBA),//9A
+	_INIT_DCS_CMD(0x49, 0xA0),
+
+	_INIT_DCS_CMD(0x5B, 0x00),
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x00),
+	_INIT_DCS_CMD(0x5E, 0xD0),
+
+	_INIT_DCS_CMD(0x61, 0xBA),//9A
+	_INIT_DCS_CMD(0x62, 0xA0),
+
+	_INIT_DCS_CMD(0xF1, 0x10),
+
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x64, 0x16),
+
+	_INIT_DCS_CMD(0x67, 0x16),
+
+	_INIT_DCS_CMD(0x6A, 0x16),
+
+	_INIT_DCS_CMD(0x70, 0x30),
+
+	_INIT_DCS_CMD(0xA2, 0xF3),
+	_INIT_DCS_CMD(0xA3, 0xFF),
+	_INIT_DCS_CMD(0xA4, 0xFF),
+	_INIT_DCS_CMD(0xA5, 0xFF),
+
+	_INIT_DCS_CMD(0xD6, 0x08),
+
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x00, 0xA1),
+
+	_INIT_DCS_CMD(0x0A, 0xF2),
+
+	_INIT_DCS_CMD(0x04, 0x28),
+	_INIT_DCS_CMD(0x06, 0x30),
+	_INIT_DCS_CMD(0x0C, 0x13),
+	_INIT_DCS_CMD(0x0D, 0x0A),
+	_INIT_DCS_CMD(0x0F, 0x0A),
+	_INIT_DCS_CMD(0x11, 0x00),
+	_INIT_DCS_CMD(0x12, 0x50),
+	_INIT_DCS_CMD(0x13, 0x51),
+	_INIT_DCS_CMD(0x14, 0x65),
+	_INIT_DCS_CMD(0x15, 0x00),
+	_INIT_DCS_CMD(0x16, 0x10),
+	_INIT_DCS_CMD(0x17, 0xA0),
+	_INIT_DCS_CMD(0x18, 0x86),
+	_INIT_DCS_CMD(0x19, 0x11),
+	_INIT_DCS_CMD(0x1A, 0x7B),
+	_INIT_DCS_CMD(0x1B, 0x10),
+	_INIT_DCS_CMD(0x1C, 0xBB),
+	_INIT_DCS_CMD(0x22, 0x00),
+	_INIT_DCS_CMD(0x23, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x11),
+	_INIT_DCS_CMD(0x2B, 0x7B),
+
+	_INIT_DCS_CMD(0x1D, 0x00),
+	_INIT_DCS_CMD(0x1E, 0xC3),
+	_INIT_DCS_CMD(0x1F, 0xC3),
+	_INIT_DCS_CMD(0x24, 0x00),
+	_INIT_DCS_CMD(0x25, 0xC3),
+	_INIT_DCS_CMD(0x2F, 0x05),
+	_INIT_DCS_CMD(0x30, 0xC3),
+	_INIT_DCS_CMD(0x31, 0x00),
+	_INIT_DCS_CMD(0x32, 0xC3),
+	_INIT_DCS_CMD(0x39, 0x00),
+	_INIT_DCS_CMD(0x3A, 0xC3),
+
+	_INIT_DCS_CMD(0x20, 0x01),
+
+	_INIT_DCS_CMD(0x33, 0x11),
+	_INIT_DCS_CMD(0x34, 0x78),
+	_INIT_DCS_CMD(0x35, 0x16),
+
+	_INIT_DCS_CMD(0xC8, 0x04),
+	_INIT_DCS_CMD(0xC9, 0x82),
+	_INIT_DCS_CMD(0xCA, 0x4E),
+	_INIT_DCS_CMD(0xCB, 0x00),
+	_INIT_DCS_CMD(0xA9, 0x4C),
+	_INIT_DCS_CMD(0xAA, 0x47),
+	_INIT_DCS_CMD(0xFF, 0x27),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x56, 0x06),
+
+	_INIT_DCS_CMD(0x58, 0x80),
+	_INIT_DCS_CMD(0x59, 0x53),
+	_INIT_DCS_CMD(0x5A, 0x00),
+	_INIT_DCS_CMD(0x5B, 0x14),
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x01),
+	_INIT_DCS_CMD(0x5E, 0x20),
+	_INIT_DCS_CMD(0x5F, 0x10),
+	_INIT_DCS_CMD(0x60, 0x00),
+	_INIT_DCS_CMD(0x61, 0x1D),
+	_INIT_DCS_CMD(0x62, 0x00),
+	_INIT_DCS_CMD(0x63, 0x01),
+	_INIT_DCS_CMD(0x64, 0x24),
+	_INIT_DCS_CMD(0x65, 0x1C),
+	_INIT_DCS_CMD(0x66, 0x00),
+	_INIT_DCS_CMD(0x67, 0x01),
+	_INIT_DCS_CMD(0x68, 0x25),
+
+	_INIT_DCS_CMD(0x00, 0x00),
+	_INIT_DCS_CMD(0x78, 0x00),
+	_INIT_DCS_CMD(0xC3, 0x00),
+
+	_INIT_DCS_CMD(0xD1, 0x24),
+	_INIT_DCS_CMD(0xD2, 0x30),
+
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x22, 0x2F),
+	_INIT_DCS_CMD(0x23, 0x08),
+
+	_INIT_DCS_CMD(0x24, 0x00),
+	_INIT_DCS_CMD(0x25, 0xC3),
+	_INIT_DCS_CMD(0x26, 0xF8),
+	_INIT_DCS_CMD(0x27, 0x00),
+	_INIT_DCS_CMD(0x28, 0x1A),
+	_INIT_DCS_CMD(0x29, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x1A),
+	_INIT_DCS_CMD(0x2B, 0x00),
+	_INIT_DCS_CMD(0x2D, 0x1A),
+
+	_INIT_DCS_CMD(0xFF, 0x23),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x00, 0x80),
+
+	_INIT_DCS_CMD(0x07, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x3A, 0x5D),
+	_INIT_DCS_CMD(0x3B, 0x60),
+
+	_INIT_DCS_CMD(0x4A, 0x5D),
+	_INIT_DCS_CMD(0x4B, 0x60),
+
+	_INIT_DCS_CMD(0x5A, 0x70),
+	_INIT_DCS_CMD(0x5B, 0x60),
+
+	_INIT_DCS_CMD(0x91, 0x44),
+	_INIT_DCS_CMD(0x92, 0x75),
+
+	_INIT_DCS_CMD(0xDB, 0x05),
+	_INIT_DCS_CMD(0xDC, 0x75),
+	_INIT_DCS_CMD(0xDD, 0x22),
+
+	_INIT_DCS_CMD(0xDF, 0x05),
+	_INIT_DCS_CMD(0xE0, 0x75),
+
+	_INIT_DCS_CMD(0xE1, 0x05),
+	_INIT_DCS_CMD(0xE2, 0x75),
+
+	_INIT_DCS_CMD(0xE3, 0x05),
+	_INIT_DCS_CMD(0xE4, 0x75),
+
+	_INIT_DCS_CMD(0xE5, 0x05),
+	_INIT_DCS_CMD(0xE6, 0x75),
+
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x00),
+
+	_INIT_DCS_CMD(0x8D, 0x00),
+	_INIT_DCS_CMD(0x8E, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x1F, 0x70),
+	_INIT_DCS_CMD(0x20, 0x60),
+
+	_INIT_DCS_CMD(0x26, 0x70),
+	_INIT_DCS_CMD(0x27, 0x60),
+	_INIT_DCS_CMD(0x33, 0x70),
+	_INIT_DCS_CMD(0x34, 0x60),
+	_INIT_DCS_CMD(0x48, 0x70),
+	_INIT_DCS_CMD(0x49, 0x60),
+	_INIT_DCS_CMD(0x5B, 0x00),
+	_INIT_DCS_CMD(0x61, 0x70),
+	_INIT_DCS_CMD(0x62, 0x60),
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x02, 0x31),
+	_INIT_DCS_CMD(0x19, 0x0A),
+	_INIT_DCS_CMD(0x1A, 0x7F),
+	_INIT_DCS_CMD(0x1B, 0x0A),
+	_INIT_DCS_CMD(0x1C, 0x0C),
+	_INIT_DCS_CMD(0x2A, 0x0A),
+	_INIT_DCS_CMD(0x2B, 0x7F),
+	_INIT_DCS_CMD(0x1E, 0x75),
+	_INIT_DCS_CMD(0x1F, 0x75),
+	_INIT_DCS_CMD(0x25, 0x75),
+	_INIT_DCS_CMD(0x30, 0x75),
+	_INIT_DCS_CMD(0x31, 0x05),
+	_INIT_DCS_CMD(0x32, 0x8D),
+	_INIT_DCS_CMD(0x3A, 0x75),
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x25, 0x75),
+	_INIT_DCS_CMD(0xFF, 0xE0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x14, 0x60),
+	_INIT_DCS_CMD(0x16, 0xC0),
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x3A, 0x08),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x01),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x18, 0x40),
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xC2, 0x06),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x02),
+	_INIT_DCS_CMD(0x3B, 0x03, 0x5F, 0x1A, 0x04, 0x04),
+	_INIT_DCS_CMD(0x35, 0x00),
+	_INIT_DCS_CMD(0x51, 0x00, 0xFF),
+	_INIT_DCS_CMD(0x53, 0x24),
+	_INIT_DCS_CMD(0x55, 0x00),
+	_INIT_DCS_CMD(0xBB, 0x13),
+
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(200),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(100),
+	{},
+};
+
+static const struct panel_init_cmd inx_init_cmd[] = {
+
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xA7, 0x03),
+
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DELAY_CMD(100),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x05, 0xD1),
+	_INIT_DCS_CMD(0x0D, 0x63),
+	_INIT_DCS_CMD(0x07, 0x8C),
+	_INIT_DCS_CMD(0x08, 0x4B),
+	_INIT_DCS_CMD(0x0E, 0x91),
+	_INIT_DCS_CMD(0x0F, 0x69),
+
+	_INIT_DCS_CMD(0x95, 0xF5),
+	_INIT_DCS_CMD(0x96, 0xF5),
+
+	_INIT_DCS_CMD(0x9D, 0x14),
+	_INIT_DCS_CMD(0x9E, 0x14),
+	_INIT_DCS_CMD(0x6D, 0x33),
+	_INIT_DCS_CMD(0x69, 0x98),
+	_INIT_DCS_CMD(0x75, 0xA2),
+	_INIT_DCS_CMD(0x77, 0xB3),
+
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DELAY_CMD(100),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x91, 0x44),
+
+	_INIT_DCS_CMD(0x92, 0x7A),
+
+	_INIT_DCS_CMD(0x93, 0x1A),
+
+	_INIT_DCS_CMD(0x94, 0x40),
+	_INIT_DCS_CMD(0x9A, 0x08),
+	_INIT_DCS_CMD(0x60, 0x96),
+	_INIT_DCS_CMD(0x61, 0xD0),
+	_INIT_DCS_CMD(0x63, 0x70),
+	_INIT_DCS_CMD(0xC2, 0xC6),
+	_INIT_DCS_CMD(0x9B, 0x0F),
+	_INIT_DCS_CMD(0x9A, 0x08),
+	_INIT_DCS_CMD(0xA5, 0x00),
+	_INIT_DCS_CMD(0xA6, 0x41),
+
+	_INIT_DCS_CMD(0x00, 0x03),
+	_INIT_DCS_CMD(0x01, 0x03),
+	_INIT_DCS_CMD(0x02, 0x03),
+	_INIT_DCS_CMD(0x03, 0x03),
+	_INIT_DCS_CMD(0x04, 0x03),
+	_INIT_DCS_CMD(0x05, 0x03),
+	_INIT_DCS_CMD(0x06, 0x22),
+	_INIT_DCS_CMD(0x07, 0x06),
+	_INIT_DCS_CMD(0x08, 0x00),
+	_INIT_DCS_CMD(0x09, 0x1D),
+	_INIT_DCS_CMD(0x0A, 0x1C),
+	_INIT_DCS_CMD(0x0B, 0x13),
+	_INIT_DCS_CMD(0x0C, 0x12),
+	_INIT_DCS_CMD(0x0D, 0x11),
+	_INIT_DCS_CMD(0x0E, 0x10),
+	_INIT_DCS_CMD(0x0F, 0x0F),
+	_INIT_DCS_CMD(0x10, 0x0E),
+	_INIT_DCS_CMD(0x11, 0x0D),
+	_INIT_DCS_CMD(0x12, 0x0C),
+	_INIT_DCS_CMD(0x13, 0x04),
+	_INIT_DCS_CMD(0x14, 0x03),
+	_INIT_DCS_CMD(0x15, 0x03),
+	_INIT_DCS_CMD(0x16, 0x03),
+	_INIT_DCS_CMD(0x17, 0x03),
+	_INIT_DCS_CMD(0x18, 0x03),
+	_INIT_DCS_CMD(0x19, 0x03),
+	_INIT_DCS_CMD(0x1A, 0x03),
+	_INIT_DCS_CMD(0x1B, 0x03),
+	_INIT_DCS_CMD(0x1C, 0x22),
+	_INIT_DCS_CMD(0x1D, 0x06),
+	_INIT_DCS_CMD(0x1E, 0x00),
+	_INIT_DCS_CMD(0x1F, 0x1D),
+	_INIT_DCS_CMD(0x20, 0x1C),
+	_INIT_DCS_CMD(0x21, 0x13),
+	_INIT_DCS_CMD(0x22, 0x12),
+	_INIT_DCS_CMD(0x23, 0x11),
+	_INIT_DCS_CMD(0x24, 0x10),
+	_INIT_DCS_CMD(0x25, 0x0F),
+	_INIT_DCS_CMD(0x26, 0x0E),
+	_INIT_DCS_CMD(0x27, 0x0D),
+	_INIT_DCS_CMD(0x28, 0x0C),
+	_INIT_DCS_CMD(0x29, 0x04),
+	_INIT_DCS_CMD(0x2A, 0x03),
+	_INIT_DCS_CMD(0x2B, 0x03),
+
+	_INIT_DCS_CMD(0x2F, 0x06),
+	_INIT_DCS_CMD(0x30, 0x32),
+	_INIT_DCS_CMD(0x31, 0x43),
+	_INIT_DCS_CMD(0x33, 0x06),
+	_INIT_DCS_CMD(0x34, 0x32),
+	_INIT_DCS_CMD(0x35, 0x43),
+	_INIT_DCS_CMD(0x37, 0x44),
+	_INIT_DCS_CMD(0x38, 0x40),
+	_INIT_DCS_CMD(0x39, 0x00),
+	_INIT_DCS_CMD(0x3A, 0x01),
+	_INIT_DCS_CMD(0x3B, 0x48),
+	_INIT_DCS_CMD(0x3D, 0x93),
+	_INIT_DCS_CMD(0xAB, 0x44),
+	_INIT_DCS_CMD(0xAC, 0x40),
+
+	_INIT_DCS_CMD(0x4D, 0x21),
+	_INIT_DCS_CMD(0x4E, 0x43),
+	_INIT_DCS_CMD(0x4F, 0x65),
+	_INIT_DCS_CMD(0x50, 0x87),
+	_INIT_DCS_CMD(0x51, 0x78),
+	_INIT_DCS_CMD(0x52, 0x56),
+	_INIT_DCS_CMD(0x53, 0x34),
+	_INIT_DCS_CMD(0x54, 0x21),
+	_INIT_DCS_CMD(0x55, 0x83),
+	_INIT_DCS_CMD(0x56, 0x08),
+	_INIT_DCS_CMD(0x58, 0x21),
+	_INIT_DCS_CMD(0x59, 0x40),
+	_INIT_DCS_CMD(0x5A, 0x09),
+	_INIT_DCS_CMD(0x5B, 0x48),
+	_INIT_DCS_CMD(0x5E, 0x00, 0x10),
+	_INIT_DCS_CMD(0x5F, 0x00),
+
+	_INIT_DCS_CMD(0x7A, 0x00),
+	_INIT_DCS_CMD(0x7B, 0x00),
+	_INIT_DCS_CMD(0x7C, 0x00),
+	_INIT_DCS_CMD(0x7D, 0x00),
+	_INIT_DCS_CMD(0x7E, 0x20),
+	_INIT_DCS_CMD(0x7F, 0x3C),
+	_INIT_DCS_CMD(0x80, 0x00),
+	_INIT_DCS_CMD(0x81, 0x00),
+	_INIT_DCS_CMD(0x82, 0x08),
+	_INIT_DCS_CMD(0x97, 0x02),
+
+	_INIT_DCS_CMD(0xC5, 0x10),
+	_INIT_DCS_CMD(0xD7, 0x55),
+	_INIT_DCS_CMD(0xD8, 0x55),
+	_INIT_DCS_CMD(0xD9, 0x23),
+	_INIT_DCS_CMD(0xDA, 0x05),
+	_INIT_DCS_CMD(0xDB, 0x01),
+	_INIT_DCS_CMD(0xDC, 0x7A),
+	_INIT_DCS_CMD(0xDD, 0x55),
+	_INIT_DCS_CMD(0xDE, 0x27),
+	_INIT_DCS_CMD(0xDF, 0x01),
+	_INIT_DCS_CMD(0xE0, 0x7A),
+	_INIT_DCS_CMD(0xE1, 0x01),
+	_INIT_DCS_CMD(0xE2, 0x7A),
+	_INIT_DCS_CMD(0xE3, 0x01),
+	_INIT_DCS_CMD(0xE4, 0x7A),
+	_INIT_DCS_CMD(0xE5, 0x01),
+	_INIT_DCS_CMD(0xE6, 0x7A),
+	_INIT_DCS_CMD(0xE7, 0x00),
+	_INIT_DCS_CMD(0xE8, 0x00),
+	_INIT_DCS_CMD(0xE9, 0x01),
+	_INIT_DCS_CMD(0xEA, 0x7A),
+	_INIT_DCS_CMD(0xEB, 0x01),
+	_INIT_DCS_CMD(0xEE, 0x7A),
+	_INIT_DCS_CMD(0xEF, 0x01),
+	_INIT_DCS_CMD(0xF0, 0x7A),
+
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x05, 0x00),
+
+	_INIT_DCS_CMD(0xF1, 0x10),
+	_INIT_DCS_CMD(0x1E, 0x00),
+	_INIT_DCS_CMD(0x1F, 0x09),
+	_INIT_DCS_CMD(0x20, 0x46),
+	_INIT_DCS_CMD(0x25, 0x00),
+	_INIT_DCS_CMD(0x26, 0x09),
+	_INIT_DCS_CMD(0x27, 0x46),
+	_INIT_DCS_CMD(0x3F, 0x80),
+	_INIT_DCS_CMD(0x40, 0x00),
+	_INIT_DCS_CMD(0x43, 0x00),
+
+
+	_INIT_DCS_CMD(0x44, 0x09),
+	_INIT_DCS_CMD(0x45, 0x46),
+
+	_INIT_DCS_CMD(0x48, 0x09),
+	_INIT_DCS_CMD(0x49, 0x46),
+
+	_INIT_DCS_CMD(0x5B, 0x80),
+
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x01),
+	_INIT_DCS_CMD(0x5E, 0x46),
+
+	_INIT_DCS_CMD(0x61, 0x01),
+	_INIT_DCS_CMD(0x62, 0x46),
+	_INIT_DCS_CMD(0x68, 0x10),
+
+	_INIT_DCS_CMD(0x13, 0x02),
+	_INIT_DCS_CMD(0x14, 0xF2),
+
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x00, 0xA1),
+	_INIT_DCS_CMD(0x02, 0x31),
+	_INIT_DCS_CMD(0x0A, 0xF2),
+	_INIT_DCS_CMD(0x04, 0x28),
+	_INIT_DCS_CMD(0x06, 0x20),
+	_INIT_DCS_CMD(0x0C, 0x13),
+	_INIT_DCS_CMD(0x0D, 0x0A),
+	_INIT_DCS_CMD(0x0F, 0x0A),
+	_INIT_DCS_CMD(0x11, 0x00),
+	_INIT_DCS_CMD(0x12, 0x50),
+	_INIT_DCS_CMD(0x13, 0x51),
+	_INIT_DCS_CMD(0x14, 0x65),
+	_INIT_DCS_CMD(0x15, 0x00),
+	_INIT_DCS_CMD(0x16, 0x10),
+	_INIT_DCS_CMD(0x17, 0xA0),
+	_INIT_DCS_CMD(0x18, 0x86),
+	_INIT_DCS_CMD(0x22, 0x00),
+	_INIT_DCS_CMD(0x23, 0x00),
+
+	_INIT_DCS_CMD(0x19, 0x30),
+	_INIT_DCS_CMD(0x1A, 0x00),
+	_INIT_DCS_CMD(0x1B, 0x09),
+	_INIT_DCS_CMD(0x1C, 0xC0),
+	_INIT_DCS_CMD(0x2A, 0x30),
+	_INIT_DCS_CMD(0x2B, 0x00),
+
+	_INIT_DCS_CMD(0x20, 0x00),
+
+	_INIT_DCS_CMD(0x1D, 0x00),
+	_INIT_DCS_CMD(0x1E, 0x78),
+	_INIT_DCS_CMD(0x1F, 0x78),
+
+	_INIT_DCS_CMD(0x2F, 0x03),
+	_INIT_DCS_CMD(0x30, 0x78),
+	_INIT_DCS_CMD(0x33, 0x78),
+	_INIT_DCS_CMD(0x34, 0x66),
+	_INIT_DCS_CMD(0x35, 0x11),
+
+	_INIT_DCS_CMD(0x39, 0x10),
+	_INIT_DCS_CMD(0x3A, 0x78),
+	_INIT_DCS_CMD(0x3B, 0x06),
+
+	_INIT_DCS_CMD(0xC8, 0x04),
+	_INIT_DCS_CMD(0xC9, 0x84),
+	_INIT_DCS_CMD(0xCA, 0x4E),
+	_INIT_DCS_CMD(0xCB, 0x00),
+
+	_INIT_DCS_CMD(0xA9, 0x50),
+	_INIT_DCS_CMD(0xAA, 0x4F),
+	_INIT_DCS_CMD(0xAB, 0x4D),
+	_INIT_DCS_CMD(0xAC, 0x4A),
+	_INIT_DCS_CMD(0xAD, 0x48),
+	_INIT_DCS_CMD(0xAE, 0x46),
+
+	_INIT_DCS_CMD(0xFF, 0x27),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xC0, 0x18),
+	_INIT_DCS_CMD(0xC1, 0x00),
+	_INIT_DCS_CMD(0xC2, 0x00),
+
+	_INIT_DCS_CMD(0x56, 0x06),
+	_INIT_DCS_CMD(0x58, 0x80),
+	_INIT_DCS_CMD(0x59, 0x53),
+	_INIT_DCS_CMD(0x5A, 0x00),
+	_INIT_DCS_CMD(0x5B, 0x14),
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x00),
+	_INIT_DCS_CMD(0x5E, 0x20),
+	_INIT_DCS_CMD(0x5F, 0x10),
+	_INIT_DCS_CMD(0x60, 0x00),
+	_INIT_DCS_CMD(0x61, 0x1C),
+	_INIT_DCS_CMD(0x62, 0x00),
+	_INIT_DCS_CMD(0x63, 0x01),
+	_INIT_DCS_CMD(0x64, 0x24),
+	_INIT_DCS_CMD(0x65, 0x1B),
+	_INIT_DCS_CMD(0x66, 0x00),
+	_INIT_DCS_CMD(0x67, 0x01),
+	_INIT_DCS_CMD(0x68, 0x25),
+
+	_INIT_DCS_CMD(0x98, 0x01),
+	_INIT_DCS_CMD(0xB4, 0x03),
+	_INIT_DCS_CMD(0x9B, 0xBD),
+	_INIT_DCS_CMD(0xA0, 0x90),
+	_INIT_DCS_CMD(0xAB, 0x1B),
+	_INIT_DCS_CMD(0xBC, 0x0C),
+	_INIT_DCS_CMD(0xBD, 0x28),
+
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+
+	_INIT_DCS_CMD(0x22, 0x2F),
+	_INIT_DCS_CMD(0x23, 0x08),
+
+	_INIT_DCS_CMD(0x24, 0x00),
+	_INIT_DCS_CMD(0x25, 0x79),
+	_INIT_DCS_CMD(0x26, 0xF8),
+	_INIT_DCS_CMD(0x27, 0x00),
+	_INIT_DCS_CMD(0x28, 0x1A),
+	_INIT_DCS_CMD(0x29, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x1A),
+	_INIT_DCS_CMD(0x2B, 0x00),
+	_INIT_DCS_CMD(0x2D, 0x1A),
+
+	_INIT_DCS_CMD(0x64, 0x96),
+	_INIT_DCS_CMD(0x65, 0x00),
+	_INIT_DCS_CMD(0x66, 0x00),
+	_INIT_DCS_CMD(0x6A, 0x96),
+	_INIT_DCS_CMD(0x6B, 0x00),
+	_INIT_DCS_CMD(0x6C, 0x00),
+	_INIT_DCS_CMD(0x70, 0x92),
+	_INIT_DCS_CMD(0x71, 0x00),
+	_INIT_DCS_CMD(0x72, 0x00),
+
+	_INIT_DCS_CMD(0xA2, 0x33),
+	_INIT_DCS_CMD(0xA3, 0x30),
+	_INIT_DCS_CMD(0xA4, 0xC0),
+
+	_INIT_DCS_CMD(0xE8, 0x00),
+
+	_INIT_DCS_CMD(0x97, 0x3C),
+	_INIT_DCS_CMD(0x98, 0x02),
+	_INIT_DCS_CMD(0x99, 0x95),
+	_INIT_DCS_CMD(0x9A, 0x06),
+	_INIT_DCS_CMD(0x9B, 0x00),
+	_INIT_DCS_CMD(0x9C, 0x0B),
+	_INIT_DCS_CMD(0x9D, 0x0A),
+	_INIT_DCS_CMD(0x9E, 0x90),
+
+	_INIT_DCS_CMD(0xFF, 0x27),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xD0, 0x13),
+	_INIT_DCS_CMD(0xD1, 0x54),
+	_INIT_DCS_CMD(0xD2, 0x30),
+	_INIT_DCS_CMD(0xDE, 0x43),
+	_INIT_DCS_CMD(0xDF, 0x02),
+
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x3A, 0x08),
+
+	_INIT_DCS_CMD(0xFF, 0xD0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x02, 0x77),
+	_INIT_DCS_CMD(0x09, 0xBF),
+	_INIT_DCS_CMD(0x00, 0x22),
+	_INIT_DCS_CMD(0x2F, 0x22),
+
+	_INIT_DCS_CMD(0xFF, 0x23),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x80),
+	_INIT_DCS_CMD(0x07, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x30, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x17, 0xCF),
+	_INIT_DCS_CMD(0x19, 0x1F),
+	_INIT_DCS_CMD(0x1B, 0x5B),
+	_INIT_DCS_CMD(0x1D, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xB0, 0x01),
+
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DELAY_CMD(10),
+	_INIT_DCS_CMD(0xB9, 0x01),
+
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DELAY_CMD(10),
+	_INIT_DCS_CMD(0x18, 0x40),
+
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DELAY_CMD(10),
+	_INIT_DCS_CMD(0xB9, 0x02),
+
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DELAY_CMD(100),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xBB, 0x13),
+
+	_INIT_DCS_CMD(0x3B, 0x03, 0x5F, 0x1A, 0x04, 0x04),
+	_INIT_DCS_CMD(0x35, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xC2, 0x06),
+
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x51, 0x00, 0xFF),
+	_INIT_DCS_CMD(0x53, 0x24),
+	_INIT_DCS_CMD(0x55, 0x00),
+
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(200),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(100),
+	{},
+};
+
+static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct boe_panel, base);
+}
+
+static int boe_panel_init_dcs_cmd(struct boe_panel *boe)
+{
+	struct mipi_dsi_device *dsi = boe->dsi;
+	struct drm_panel *panel = &boe->base;
+	int i, err = 0;
+
+	if (boe->desc->init_cmds) {
+		const struct panel_init_cmd *init_cmds = boe->desc->init_cmds;
+
+		for (i = 0; init_cmds[i].len != 0; i++) {
+			const struct panel_init_cmd *cmd = &init_cmds[i];
+
+			switch (cmd->type) {
+			case DELAY_CMD:
+				msleep(cmd->data[0]);
+				err = 0;
+				break;
+
+			case INIT_DCS_CMD:
+				err = mipi_dsi_dcs_write(dsi, cmd->data[0],
+							 cmd->len <= 1 ? NULL :
+							 &cmd->data[1],
+							 cmd->len - 1);
+				break;
+
+			default:
+				err = -EINVAL;
+			}
+
+			if (err < 0) {
+				dev_err(panel->dev,
+					"failed to write command %u\n", i);
+				return err;
+			}
+		}
+	}
+	return 0;
+}
+
+static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
+{
+	struct mipi_dsi_device *dsi = boe->dsi;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int boe_panel_unprepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	if (!boe->prepared)
+		return 0;
+
+	ret = boe_panel_enter_sleep_mode(boe);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	msleep(150);
+
+	if (boe->desc->discharge_on_disable) {
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+		regulator_disable(boe->pp3300);
+	} else {
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(1000, 2000);
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+		regulator_disable(boe->pp3300);
+	}
+
+	boe->prepared = false;
+
+	return 0;
+}
+
+static int boe_panel_prepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	if (boe->prepared)
+		return 0;
+
+	gpiod_set_value(boe->enable_gpio, 0);
+	usleep_range(1000, 1500);
+
+	ret = regulator_enable(boe->pp3300);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_enable(boe->pp1800);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(3000, 5000);
+
+	ret = regulator_enable(boe->avdd);
+	if (ret < 0)
+		goto poweroff1v8;
+	ret = regulator_enable(boe->avee);
+	if (ret < 0)
+		goto poweroffavdd;
+
+	usleep_range(10000, 15000);
+
+	gpiod_set_value(boe->enable_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(boe->enable_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value(boe->enable_gpio, 1);
+	usleep_range(6000, 10000);
+
+	ret = boe_panel_init_dcs_cmd(boe);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+		goto poweroff;
+	}
+
+	boe->prepared = true;
+
+	return 0;
+
+poweroff:
+	regulator_disable(boe->avee);
+poweroffavdd:
+	regulator_disable(boe->avdd);
+poweroff1v8:
+	usleep_range(5000, 7000);
+	regulator_disable(boe->pp1800);
+	gpiod_set_value(boe->enable_gpio, 0);
+
+	return ret;
+}
+
+static int boe_panel_enable(struct drm_panel *panel)
+{
+	msleep(130);
+	return 0;
+}
+
+static const struct drm_display_mode boe_tv110c9m_default_mode = {
+	.clock = 162383,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 40,
+	.hsync_end = 1200 + 40 + 8,
+	.htotal = 1200 + 40 + 8 + 28,
+	.vdisplay = 2000,
+	.vsync_start = 2000 + 26,
+	.vsync_end = 2000 + 26 + 1,
+	.vtotal = 2000 + 26 + 1 + 94,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct drm_display_mode inx_hj110iz_default_mode = {
+	.clock = 162383,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 40,
+	.hsync_end = 1200 + 40 + 8,
+	.htotal = 1200 + 40 + 8 + 28,
+	.vdisplay = 2000,
+	.vsync_start = 2000 + 26,
+	.vsync_end = 2000 + 26 + 1,
+	.vtotal = 2000 + 26 + 1 + 94,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc boe_tv110c9m_desc = {
+	.modes = &boe_tv110c9m_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 143,
+		.height_mm = 238,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_init_cmd,
+};
+
+static const struct panel_desc inx_hj110iz_desc = {
+	.modes = &inx_hj110iz_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 143,
+		.height_mm = 238,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = inx_init_cmd,
+};
+
+static int boe_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	const struct drm_display_mode *m = boe->desc->modes;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = boe->desc->size.width_mm;
+	connector->display_info.height_mm = boe->desc->size.height_mm;
+	connector->display_info.bpc = boe->desc->bpc;
+	drm_connector_set_panel_orientation(connector, boe->orientation);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs boe_panel_funcs = {
+	.unprepare = boe_panel_unprepare,
+	.prepare = boe_panel_prepare,
+	.enable = boe_panel_enable,
+	.get_modes = boe_panel_get_modes,
+};
+
+static int boe_panel_add(struct boe_panel *boe)
+{
+	struct device *dev = &boe->dsi->dev;
+	int err;
+
+	boe->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(boe->avdd))
+		return PTR_ERR(boe->avdd);
+
+	boe->avee = devm_regulator_get(dev, "avee");
+	if (IS_ERR(boe->avee))
+		return PTR_ERR(boe->avee);
+
+	boe->pp3300 = devm_regulator_get(dev, "pp3300");
+	if (IS_ERR(boe->pp3300))
+		return PTR_ERR(boe->pp3300);
+
+	boe->pp1800 = devm_regulator_get(dev, "pp1800");
+	if (IS_ERR(boe->pp1800))
+		return PTR_ERR(boe->pp1800);
+
+	boe->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(boe->enable_gpio)) {
+		dev_err(dev, "cannot get reset-gpios %ld\n",
+			PTR_ERR(boe->enable_gpio));
+		return PTR_ERR(boe->enable_gpio);
+	}
+
+	gpiod_set_value(boe->enable_gpio, 0);
+
+	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
+	if (err < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return err;
+	}
+
+	err = drm_panel_of_backlight(&boe->base);
+	if (err)
+		return err;
+
+	boe->base.funcs = &boe_panel_funcs;
+	boe->base.dev = &boe->dsi->dev;
+
+	drm_panel_add(&boe->base);
+
+	return 0;
+}
+
+static int boe_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct boe_panel *boe;
+	int ret;
+	const struct panel_desc *desc;
+
+	boe = devm_kzalloc(&dsi->dev, sizeof(*boe), GFP_KERNEL);
+	if (!boe)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	boe->desc = desc;
+	boe->dsi = dsi;
+	ret = boe_panel_add(boe);
+	if (ret < 0)
+		return ret;
+
+	mipi_dsi_set_drvdata(dsi, boe);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&boe->base);
+
+	return ret;
+}
+
+static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&boe->base);
+	drm_panel_unprepare(&boe->base);
+}
+
+static int boe_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	boe_panel_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	if (boe->base.dev)
+		drm_panel_remove(&boe->base);
+
+	return 0;
+}
+
+static const struct of_device_id boe_of_match[] = {
+	{ .compatible = "boe,tv110c9m-ll3",
+	  .data = &boe_tv110c9m_desc
+	},
+	{ .compatible = "inx,hj110iz-01a",
+	  .data = &inx_hj110iz_desc
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, boe_of_match);
+
+static struct mipi_dsi_driver boe_panel_driver = {
+	.driver = {
+		.name = "panel-boe-tv110c9m",
+		.of_match_table = boe_of_match,
+	},
+	.probe = boe_panel_probe,
+	.remove = boe_panel_remove,
+	.shutdown = boe_panel_shutdown,
+};
+module_mipi_dsi_driver(boe_panel_driver);
+
+MODULE_DESCRIPTION("BOE tv110c9m panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

