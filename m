Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D21692326
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 17:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1560B10ED74;
	Fri, 10 Feb 2023 16:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB1210ED74
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 16:19:40 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id iz19so5606036plb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 08:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGKR1Pp4SvLE59JODRn3iHdAq5PKvdb213xv92XptKo=;
 b=LnX/oVYf2EF3d51DnAlo7lEHD8VNq+xUbAzVWKgvYKadSXUZdONKs37TVO7mzEfXsY
 uNbT5e0qkrPm3iArE/noW2nGcR+i0g+/G59EUoVOSUHHsMEZuJ2gcW//FaOv9cbAwJr9
 cpoRIKWG02b9jHYOcRNlaQ38yE76YQcbYRO9Diwgf1/Z8UQtizMzCruCDoCquZUL0ixO
 N7vTPBXii7P3KBPXWmWFntdUOinha4xQwFzFplO+XbmObquJfWvR9ecpBUuDqK3RwT9W
 KtGi7F+J0xGBkmcvH00SXGzNYmP65j3iUTP68ToMNppZ8MjON4fLMH3xe1PfGdfJvRdy
 6JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGKR1Pp4SvLE59JODRn3iHdAq5PKvdb213xv92XptKo=;
 b=oaGcnKIlQRBsVwGcrTzzRnENY3pdGW95uAp/MqcVaXJtA1O8jukM2ZfzZk0gMpckK5
 CHJQQz/sUm/Dq/iCwSZxJjShAjzKM4Tagkf1ZFfUu8i9RtE9CqnMsqPbVMmTkmN/67wD
 Apb4aMBsOE3VtAZERkrA5KvII4lp9gVtksATf4Ri6YbviaZQg3Y98WIUlQkBFIpcDk5Q
 nYrQ/Bo3mPdY8BRPHhD4h+cgvSYAbPy34jqTvfUNbk+Ki2EN3kIrgZ6XUiSp3p/x7RoY
 tNdPM2/vfIkeC0M9AUUnZPmSifdAqS+bG0uH3WhbkwiYZMe36MLnqA0UKOGKCf0pMnW0
 NrJA==
X-Gm-Message-State: AO0yUKUrQb4Qr9hGH2qm39hA4sNh1EWHcxbtpeC9iaH+nC2k+Y3/fDZT
 ZXZNX5YYUQXDkNCwCnaJngk=
X-Google-Smtp-Source: AK7set/TJwuoWumxfC8ykxq8pCYX2TYQcrjKzBROnjqZLE/X0pUbEgS+D2DDWwgNz9DRPS9Xy7Lqow==
X-Received: by 2002:a17:902:db11:b0:199:2e77:fe56 with SMTP id
 m17-20020a170902db1100b001992e77fe56mr17666000plx.52.1676045980305; 
 Fri, 10 Feb 2023 08:19:40 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902bd8900b0018099c9618esm3564425pls.231.2023.02.10.08.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:19:39 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] drm/panel: Add driver for Novatek NT36523
Date: Sat, 11 Feb 2023 00:19:25 +0800
Message-Id: <20230210161925.32343-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210161925.32343-1-lujianhua000@gmail.com>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for panels using the Novatek NT36523 Display Driver IC,
including support for the csot and boe panels right now, found in Xiaomi
Mi Pad 5 series.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 854 ++++++++++++++++++
 4 files changed, 871 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 57d1d6ecb33d..8a12d8c2809b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6517,6 +6517,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35560.c
 
+DRM DRIVER FOR NOVATEK NT36523 PANELS
+M:	Jianhua Lu <lujianhua000@gmail.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
+
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8eeee71c0000..c9d45f498422 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -377,6 +377,15 @@ config DRM_PANEL_NOVATEK_NT35950
 	  Sharp panels used in Sony Xperia Z5 Premium and XZ Premium
 	  mobile phones.
 
+config DRM_PANEL_NOVATEK_NT36523
+	tristate "Novatek NT36523 panel driver"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Novatek NT36523
+	  controller for 2560x1600 LCD panels.
+
 config DRM_PANEL_NOVATEK_NT36672A
 	tristate "Novatek NT36672A DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c05aa9e23907..570eab8bf2b2 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
new file mode 100644
index 000000000000..0963e92454c0
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -0,0 +1,854 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT36523 DriverIC panels driver
+ * This driver based on panel-boe-tv101wum-nl6.c and panel-novatek-nt35950.c
+ *
+ * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct panel_desc {
+	unsigned int width_mm;
+	unsigned int height_mm;
+	unsigned int bpc;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	const struct drm_display_mode *modes;
+	const struct mipi_dsi_device_info dsi_info;
+	const struct panel_init_cmd *init_cmds;
+	bool is_dual_dsi;
+};
+
+struct panel_info {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_desc *desc;
+	struct gpio_desc *reset_gpio;
+	struct backlight_device *backlight;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(nt36523_regulator_names)];
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
+static const char * const nt36523_regulator_names[] = {
+	"vddio",
+	"vddpos",
+	"vddneg",
+};
+
+static const unsigned long nt36523_regulator_enable_loads[] = {
+	62000,
+	100000,
+	100000
+};
+
+static const struct panel_init_cmd elish_csot_init_cmds[] = {
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x05),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x18, 0x40),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x02),
+	_INIT_DCS_CMD(0xFF, 0xD0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x02, 0xAF),
+	_INIT_DCS_CMD(0x00, 0x30),
+	_INIT_DCS_CMD(0x09, 0xEE),
+	_INIT_DCS_CMD(0x1C, 0x99),
+	_INIT_DCS_CMD(0x1D, 0x09),
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x3A, 0x08),
+	_INIT_DCS_CMD(0xFF, 0xE0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x4F, 0x02),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x58, 0x40),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x35, 0x00),
+	/* CABC SETTING CFG Start*/
+	_INIT_DCS_CMD(0xFF, 0x23),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x80),
+	_INIT_DCS_CMD(0x01, 0x84),
+	_INIT_DCS_CMD(0x05, 0x2D),
+	_INIT_DCS_CMD(0x06, 0x00),
+	_INIT_DCS_CMD(0x07, 0x00),
+	_INIT_DCS_CMD(0x08, 0x01),
+	_INIT_DCS_CMD(0x09, 0x45),
+	_INIT_DCS_CMD(0x11, 0x02),
+	_INIT_DCS_CMD(0x12, 0x80),
+	_INIT_DCS_CMD(0x15, 0x83),
+	_INIT_DCS_CMD(0x16, 0x0C),
+	_INIT_DCS_CMD(0x29, 0x0A),
+	_INIT_DCS_CMD(0x30, 0xFF),
+	_INIT_DCS_CMD(0x31, 0xFE),
+	_INIT_DCS_CMD(0x32, 0xFD),
+	_INIT_DCS_CMD(0x33, 0xFB),
+	_INIT_DCS_CMD(0x34, 0xF8),
+	_INIT_DCS_CMD(0x35, 0xF5),
+	_INIT_DCS_CMD(0x36, 0xF3),
+	_INIT_DCS_CMD(0x37, 0xF2),
+	_INIT_DCS_CMD(0x38, 0xF2),
+	_INIT_DCS_CMD(0x39, 0xF2),
+	_INIT_DCS_CMD(0x3A, 0xEF),
+	_INIT_DCS_CMD(0x3B, 0xEC),
+	_INIT_DCS_CMD(0x3D, 0xE9),
+	_INIT_DCS_CMD(0x3F, 0xE5),
+	_INIT_DCS_CMD(0x40, 0xE5),
+	_INIT_DCS_CMD(0x41, 0xE5),
+	_INIT_DCS_CMD(0x2A, 0x13),
+	_INIT_DCS_CMD(0x45, 0xFF),
+	_INIT_DCS_CMD(0x46, 0xF4),
+	_INIT_DCS_CMD(0x47, 0xE7),
+	_INIT_DCS_CMD(0x48, 0xDA),
+	_INIT_DCS_CMD(0x49, 0xCD),
+	_INIT_DCS_CMD(0x4A, 0xC0),
+	_INIT_DCS_CMD(0x4B, 0xB3),
+	_INIT_DCS_CMD(0x4C, 0xB2),
+	_INIT_DCS_CMD(0x4D, 0xB2),
+	_INIT_DCS_CMD(0x4E, 0xB2),
+	_INIT_DCS_CMD(0x4F, 0x99),
+	_INIT_DCS_CMD(0x50, 0x80),
+	_INIT_DCS_CMD(0x51, 0x68),
+	_INIT_DCS_CMD(0x52, 0x66),
+	_INIT_DCS_CMD(0x53, 0x66),
+	_INIT_DCS_CMD(0x54, 0x66),
+	_INIT_DCS_CMD(0x2B, 0x0E),
+	_INIT_DCS_CMD(0x58, 0xFF),
+	_INIT_DCS_CMD(0x59, 0xFB),
+	_INIT_DCS_CMD(0x5A, 0xF7),
+	_INIT_DCS_CMD(0x5B, 0xF3),
+	_INIT_DCS_CMD(0x5C, 0xEF),
+	_INIT_DCS_CMD(0x5D, 0xE3),
+	_INIT_DCS_CMD(0x5E, 0xDA),
+	_INIT_DCS_CMD(0x5F, 0xD8),
+	_INIT_DCS_CMD(0x60, 0xD8),
+	_INIT_DCS_CMD(0x61, 0xD8),
+	_INIT_DCS_CMD(0x62, 0xCB),
+	_INIT_DCS_CMD(0x63, 0xBF),
+	_INIT_DCS_CMD(0x64, 0xB3),
+	_INIT_DCS_CMD(0x65, 0xB2),
+	_INIT_DCS_CMD(0x66, 0xB2),
+	_INIT_DCS_CMD(0x67, 0xB2),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x51, 0x0F, 0xFF),
+	_INIT_DCS_CMD(0x53, 0x2C),
+	/* CABC SETTING CFG END */
+	_INIT_DCS_CMD(0x55, 0x00),
+	_INIT_DCS_CMD(0xBB, 0x13),
+	_INIT_DCS_CMD(0x3B, 0x03, 0xAC, 0x1A, 0x04, 0x04),
+	/* 30HZ pen code Start*/
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x25, 0x46),
+	_INIT_DCS_CMD(0x30, 0x46),
+	_INIT_DCS_CMD(0x39, 0x46),
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x01, 0xB0),
+	_INIT_DCS_CMD(0x19, 0x10),
+	_INIT_DCS_CMD(0x1A, 0xE0),
+	_INIT_DCS_CMD(0x1B, 0x10),
+	_INIT_DCS_CMD(0x1C, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x10),
+	_INIT_DCS_CMD(0x2B, 0xE0),
+	/* 30HZ pen code END*/
+	/* ESD code Start*/
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x84, 0x08),
+	_INIT_DCS_CMD(0x85, 0x0C),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x51, 0x00),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x91, 0x1F),
+	_INIT_DCS_CMD(0x92, 0x0F),
+	_INIT_DCS_CMD(0x93, 0x01),
+	_INIT_DCS_CMD(0x94, 0x18),
+	_INIT_DCS_CMD(0x95, 0x03),
+	_INIT_DCS_CMD(0x96, 0x01),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x19, 0x1F),
+	_INIT_DCS_CMD(0x1B, 0x1B),
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB8, 0x28),
+	_INIT_DCS_CMD(0xFF, 0x27),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xD0, 0x31),
+	_INIT_DCS_CMD(0xD1, 0x20),
+	_INIT_DCS_CMD(0xD4, 0x08),
+	_INIT_DCS_CMD(0xDE, 0x80),
+	_INIT_DCS_CMD(0xDF, 0x02),
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x81),
+	_INIT_DCS_CMD(0x01, 0xB0),
+	_INIT_DCS_CMD(0xFF, 0x22),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x6F, 0x01),
+	_INIT_DCS_CMD(0x70, 0x11),
+	_INIT_DCS_CMD(0x73, 0x01),
+	_INIT_DCS_CMD(0x74, 0x4D),
+	_INIT_DCS_CMD(0xA0, 0x3F),
+	_INIT_DCS_CMD(0xA9, 0x50),
+	_INIT_DCS_CMD(0xAA, 0x28),
+	_INIT_DCS_CMD(0xAB, 0x28),
+	_INIT_DCS_CMD(0xAD, 0x10),
+	_INIT_DCS_CMD(0xB8, 0x00),
+	_INIT_DCS_CMD(0xB9, 0x4B),
+	_INIT_DCS_CMD(0xBA, 0x96),
+	_INIT_DCS_CMD(0xBB, 0x4B),
+	_INIT_DCS_CMD(0xBE, 0x07),
+	_INIT_DCS_CMD(0xBF, 0x4B),
+	_INIT_DCS_CMD(0xC0, 0x07),
+	_INIT_DCS_CMD(0xC1, 0x5C),
+	_INIT_DCS_CMD(0xC2, 0x00),
+	_INIT_DCS_CMD(0xC5, 0x00),
+	_INIT_DCS_CMD(0xC6, 0x3F),
+	_INIT_DCS_CMD(0xC7, 0x00),
+	_INIT_DCS_CMD(0xCA, 0x08),
+	_INIT_DCS_CMD(0xCB, 0x40),
+	_INIT_DCS_CMD(0xCE, 0x00),
+	_INIT_DCS_CMD(0xCF, 0x08),
+	_INIT_DCS_CMD(0xD0, 0x40),
+	_INIT_DCS_CMD(0xD3, 0x08),
+	_INIT_DCS_CMD(0xD4, 0x40),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xBC, 0x01),
+	_INIT_DCS_CMD(0xBD, 0x1C),
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x9A, 0x03),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(70),
+	_INIT_DCS_CMD(0x29),
+	{},
+};
+
+static const struct panel_init_cmd elish_boe_init_cmds[] = {
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x05),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x18, 0x40),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB9, 0x02),
+	/*CABC start*/
+	_INIT_DCS_CMD(0xFF, 0x23),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x80),
+	_INIT_DCS_CMD(0x01, 0x84),
+	_INIT_DCS_CMD(0x05, 0x2D),
+	_INIT_DCS_CMD(0x06, 0x00),
+	_INIT_DCS_CMD(0x07, 0x00),
+	_INIT_DCS_CMD(0x08, 0x01),
+	_INIT_DCS_CMD(0x09, 0x45),
+	_INIT_DCS_CMD(0x11, 0x02),
+	_INIT_DCS_CMD(0x12, 0x80),
+	_INIT_DCS_CMD(0x15, 0x83),
+	_INIT_DCS_CMD(0x16, 0x0C),
+	_INIT_DCS_CMD(0x29, 0x0A),
+	_INIT_DCS_CMD(0x30, 0xFF),
+	_INIT_DCS_CMD(0x31, 0xFE),
+	_INIT_DCS_CMD(0x32, 0xFD),
+	_INIT_DCS_CMD(0x33, 0xFB),
+	_INIT_DCS_CMD(0x34, 0xF8),
+	_INIT_DCS_CMD(0x35, 0xF5),
+	_INIT_DCS_CMD(0x36, 0xF3),
+	_INIT_DCS_CMD(0x37, 0xF2),
+	_INIT_DCS_CMD(0x38, 0xF2),
+	_INIT_DCS_CMD(0x39, 0xF2),
+	_INIT_DCS_CMD(0x3A, 0xEF),
+	_INIT_DCS_CMD(0x3B, 0xEC),
+	_INIT_DCS_CMD(0x3D, 0xE9),
+	_INIT_DCS_CMD(0x3F, 0xE5),
+	_INIT_DCS_CMD(0x40, 0xE5),
+	_INIT_DCS_CMD(0x41, 0xE5),
+	_INIT_DCS_CMD(0x2A, 0x13),
+	_INIT_DCS_CMD(0x45, 0xFF),
+	_INIT_DCS_CMD(0x46, 0xF4),
+	_INIT_DCS_CMD(0x47, 0xE7),
+	_INIT_DCS_CMD(0x48, 0xDA),
+	_INIT_DCS_CMD(0x49, 0xCD),
+	_INIT_DCS_CMD(0x4A, 0xC0),
+	_INIT_DCS_CMD(0x4B, 0xB3),
+	_INIT_DCS_CMD(0x4C, 0xB2),
+	_INIT_DCS_CMD(0x4D, 0xB2),
+	_INIT_DCS_CMD(0x4E, 0xB2),
+	_INIT_DCS_CMD(0x4F, 0x99),
+	_INIT_DCS_CMD(0x50, 0x80),
+	_INIT_DCS_CMD(0x51, 0x68),
+	_INIT_DCS_CMD(0x52, 0x66),
+	_INIT_DCS_CMD(0x53, 0x66),
+	_INIT_DCS_CMD(0x54, 0x66),
+	_INIT_DCS_CMD(0x2B, 0x0E),
+	_INIT_DCS_CMD(0x58, 0xFF),
+	_INIT_DCS_CMD(0x59, 0xFB),
+	_INIT_DCS_CMD(0x5A, 0xF7),
+	_INIT_DCS_CMD(0x5B, 0xF3),
+	_INIT_DCS_CMD(0x5C, 0xEF),
+	_INIT_DCS_CMD(0x5D, 0xE3),
+	_INIT_DCS_CMD(0x5E, 0xDA),
+	_INIT_DCS_CMD(0x5F, 0xD8),
+	_INIT_DCS_CMD(0x60, 0xD8),
+	_INIT_DCS_CMD(0x61, 0xD8),
+	_INIT_DCS_CMD(0x62, 0xCB),
+	_INIT_DCS_CMD(0x63, 0xBF),
+	_INIT_DCS_CMD(0x64, 0xB3),
+	_INIT_DCS_CMD(0x65, 0xB2),
+	_INIT_DCS_CMD(0x66, 0xB2),
+	_INIT_DCS_CMD(0x67, 0xB2),
+	/*CABC end*/
+	/* 30HZ pen code Start*/
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x25, 0x47),
+	_INIT_DCS_CMD(0x30, 0x47),
+	_INIT_DCS_CMD(0x39, 0x47),
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x19, 0x10),
+	_INIT_DCS_CMD(0x1A, 0xE0),
+	_INIT_DCS_CMD(0x1B, 0x10),
+	_INIT_DCS_CMD(0x1C, 0x00),
+	_INIT_DCS_CMD(0x2A, 0x10),
+	_INIT_DCS_CMD(0x2B, 0xE0),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	/* 30HZ pen code END*/
+	/*ESD start*/
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x84, 0x08),
+	_INIT_DCS_CMD(0x85, 0x0C),
+	_INIT_DCS_CMD(0xFF, 0x20),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x51, 0x00),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x91, 0x1F),
+	_INIT_DCS_CMD(0x92, 0x0F),
+	_INIT_DCS_CMD(0x93, 0x01),
+	_INIT_DCS_CMD(0x94, 0x18),
+	_INIT_DCS_CMD(0x95, 0x03),
+	_INIT_DCS_CMD(0x96, 0x01),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x19, 0x1F),
+	_INIT_DCS_CMD(0x1B, 0x1B),
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xB8, 0x28),
+	_INIT_DCS_CMD(0xFF, 0x27),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xD0, 0x31),
+	_INIT_DCS_CMD(0xD1, 0x20),
+	_INIT_DCS_CMD(0xD2, 0x30),
+	_INIT_DCS_CMD(0xD4, 0x08),
+	_INIT_DCS_CMD(0xDE, 0x80),
+	_INIT_DCS_CMD(0xDF, 0x02),
+	/* ESD end */
+	/*OSC setting start*/
+	_INIT_DCS_CMD(0xFF, 0x26),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x81),
+	_INIT_DCS_CMD(0x01, 0xB0),
+	_INIT_DCS_CMD(0xFF, 0x22),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x9F, 0x50),
+	_INIT_DCS_CMD(0x6F, 0x01),
+	_INIT_DCS_CMD(0x70, 0x11),
+	_INIT_DCS_CMD(0x73, 0x01),
+	_INIT_DCS_CMD(0x74, 0x49),
+	_INIT_DCS_CMD(0x76, 0x01),
+	_INIT_DCS_CMD(0x77, 0x49),
+	_INIT_DCS_CMD(0xA0, 0x3F),
+	_INIT_DCS_CMD(0xA9, 0x50),
+	_INIT_DCS_CMD(0xAA, 0x28),
+	_INIT_DCS_CMD(0xAB, 0x28),
+	_INIT_DCS_CMD(0xAD, 0x10),
+	_INIT_DCS_CMD(0xB8, 0x00),
+	_INIT_DCS_CMD(0xB9, 0x49),
+	_INIT_DCS_CMD(0xBA, 0x49),
+	_INIT_DCS_CMD(0xBB, 0x49),
+	_INIT_DCS_CMD(0xBE, 0x04),
+	_INIT_DCS_CMD(0xBF, 0x49),
+	_INIT_DCS_CMD(0xC0, 0x04),
+	_INIT_DCS_CMD(0xC1, 0x59),
+	_INIT_DCS_CMD(0xC2, 0x00),
+	_INIT_DCS_CMD(0xC5, 0x00),
+	_INIT_DCS_CMD(0xC6, 0x01),
+	_INIT_DCS_CMD(0xC7, 0x48),
+	_INIT_DCS_CMD(0xCA, 0x43),
+	_INIT_DCS_CMD(0xCB, 0x3C),
+	_INIT_DCS_CMD(0xCE, 0x00),
+	_INIT_DCS_CMD(0xCF, 0x43),
+	_INIT_DCS_CMD(0xD0, 0x3C),
+	_INIT_DCS_CMD(0xD3, 0x43),
+	_INIT_DCS_CMD(0xD4, 0x3C),
+	_INIT_DCS_CMD(0xD7, 0x00),
+	_INIT_DCS_CMD(0xDC, 0x43),
+	_INIT_DCS_CMD(0xDD, 0x3C),
+	_INIT_DCS_CMD(0xE1, 0x43),
+	_INIT_DCS_CMD(0xE2, 0x3C),
+	_INIT_DCS_CMD(0xF2, 0x00),
+	_INIT_DCS_CMD(0xF3, 0x01),
+	_INIT_DCS_CMD(0xF4, 0x48),
+	_INIT_DCS_CMD(0xFF, 0x25),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x13, 0x01),
+	_INIT_DCS_CMD(0x14, 0x23),
+	_INIT_DCS_CMD(0xBC, 0x01),
+	_INIT_DCS_CMD(0xBD, 0x23),
+	_INIT_DCS_CMD(0xFF, 0x2A),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x97, 0x3C),
+	_INIT_DCS_CMD(0x98, 0x02),
+	_INIT_DCS_CMD(0x99, 0x95),
+	_INIT_DCS_CMD(0x9A, 0x03),
+	_INIT_DCS_CMD(0x9B, 0x00),
+	_INIT_DCS_CMD(0x9C, 0x0B),
+	_INIT_DCS_CMD(0x9D, 0x0A),
+	_INIT_DCS_CMD(0x9E, 0x90),
+	/*OSC setting end*/
+	_INIT_DCS_CMD(0xFF, 0x22),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x9F, 0x50),
+	_INIT_DCS_CMD(0xFF, 0x23),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0xA3, 0x50),
+	_INIT_DCS_CMD(0xFF, 0xE0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x14, 0x60),
+	_INIT_DCS_CMD(0x16, 0xC0),
+	_INIT_DCS_CMD(0x4F, 0x02),
+	_INIT_DCS_CMD(0xFF, 0xF0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x3A, 0x08),
+	_INIT_DCS_CMD(0xFF, 0xD0),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x02, 0xAF),
+	_INIT_DCS_CMD(0x09, 0xEE),
+	_INIT_DCS_CMD(0x1C, 0x99),
+	_INIT_DCS_CMD(0x1D, 0x09),
+	_INIT_DCS_CMD(0xFF, 0x10),
+	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x51, 0x0F, 0xFF),
+	_INIT_DCS_CMD(0x53, 0x2C),
+	_INIT_DCS_CMD(0x35, 0x00),
+	_INIT_DCS_CMD(0xBB, 0x13),
+	_INIT_DCS_CMD(0x3B, 0x03, 0xAC, 0x1A, 0x04, 0x04),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(70),
+	_INIT_DCS_CMD(0x29),
+	{},
+};
+
+static const struct drm_display_mode elish_csot_mode = {
+	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 200,
+	.hsync_end = 1600 + 200 + 40,
+	.htotal = 1600 + 200 + 40 + 52,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 26,
+	.vsync_end = 2560 + 26 + 4,
+	.vtotal = 2560 + 26 + 4 + 168,
+};
+
+static const struct drm_display_mode elish_boe_mode = {
+	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 60,
+	.hsync_end = 1600 + 60 + 8,
+	.htotal = 1600 + 60 + 8 + 60,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 26,
+	.vsync_end = 2560 + 26 + 4,
+	.vtotal = 2560 + 26 + 4 + 168,
+};
+
+static const struct panel_desc elish_csot_desc = {
+	.modes = &elish_csot_mode,
+	.dsi_info = {
+		.type = "NT36523",
+		.channel = 0,
+		.node = NULL,
+	},
+	.width_mm = 127,
+	.height_mm = 203,
+	.bpc = 8,
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_cmds = elish_csot_init_cmds,
+	.is_dual_dsi = true,
+};
+
+static const struct panel_desc elish_boe_desc = {
+	.modes = &elish_boe_mode,
+	.dsi_info = {
+		.type = "NT36523",
+		.channel = 0,
+		.node = NULL,
+	},
+	.width_mm = 127,
+	.height_mm = 203,
+	.bpc = 8,
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_cmds = elish_csot_init_cmds,
+	.is_dual_dsi = true,
+};
+
+static inline struct panel_info *to_panel_info(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_info, panel);
+}
+
+static void nt36523_reset(struct panel_info *pinfo)
+{
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	usleep_range(12000, 13000);
+}
+
+static int send_panel_init_cmds(struct drm_panel *panel, const struct panel_init_cmd *cmds)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	unsigned int i = 0;
+	int err;
+
+	if (!cmds)
+		return -EFAULT;
+
+	for (i = 0; cmds[i].len != 0; i++) {
+		const struct panel_init_cmd *cmd = &cmds[i];
+
+		switch (cmd->type) {
+		case DELAY_CMD:
+			msleep(cmd->data[0]);
+			err = 0;
+			break;
+		case INIT_DCS_CMD:
+			err = mipi_dsi_dcs_write(pinfo->dsi[0], cmd->data[0],
+					cmd->len <= 1 ? NULL : &cmd->data[1],
+					cmd->len - 1);
+			if (pinfo->desc->is_dual_dsi) {
+			  /* Check whether write dsi0 successfully */
+				if (err < 0) {
+					dev_err(panel->dev, "failed to write command %u\n", i);
+					return err;
+				}
+				err = mipi_dsi_dcs_write(pinfo->dsi[1], cmd->data[0],
+						cmd->len <= 1 ? NULL : &cmd->data[1],
+						cmd->len - 1);
+			}
+			break;
+		default:
+			err = -EINVAL;
+		}
+
+		if (err < 0) {
+			dev_err(panel->dev, "failed to write command %u\n", i);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int nt36523_prepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	struct device *dev = &pinfo->dsi[0]->dev;
+	int ret;
+
+	if (pinfo->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
+	if (ret < 0)
+		return ret;
+
+	nt36523_reset(pinfo);
+
+	ret = send_panel_init_cmds(&pinfo->panel, pinfo->desc->init_cmds);
+	if (ret < 0) {
+		regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		return ret;
+	}
+
+	pinfo->prepared = true;
+	return 0;
+}
+
+static int nt36523_off(struct panel_info *pinfo)
+{
+	struct device *dev = &pinfo->dsi[0]->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[0]);
+	if (ret < 0)
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+
+	if (pinfo->desc->is_dual_dsi) {
+		ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[1]);
+		if (ret < 0)
+			dev_err(dev, "Failed to set display off: %d\n", ret);
+	}
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[0]);
+	if (ret < 0)
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+
+	if (pinfo->desc->is_dual_dsi) {
+		ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[1]);
+		if (ret < 0)
+			dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+	}
+
+	msleep(70);
+	return 0;
+}
+
+static int nt36523_unprepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	struct device *dev = &pinfo->dsi[0]->dev;
+	int ret;
+
+	if (!pinfo->prepared)
+		return 0;
+
+	ret = nt36523_off(pinfo);
+	if (ret < 0)
+		dev_err(dev, "Failed to deinitialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
+
+	pinfo->prepared = false;
+	return 0;
+}
+
+static void nt36523_remove(struct mipi_dsi_device *dsi)
+{
+	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(pinfo->dsi[0]);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI0 host: %d\n", ret);
+
+	if (pinfo->desc->is_dual_dsi) {
+		ret = mipi_dsi_detach(pinfo->dsi[1]);
+		if (ret < 0)
+			dev_err(&dsi->dev, "Failed to detach from DSI1 host: %d\n", ret);
+		mipi_dsi_device_unregister(pinfo->dsi[1]);
+	}
+
+	drm_panel_remove(&pinfo->panel);
+}
+
+static int nt36523_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	const struct drm_display_mode *m = pinfo->desc->modes;
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
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+	connector->display_info.bpc = pinfo->desc->bpc;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs nt36523_panel_funcs = {
+	.prepare = nt36523_prepare,
+	.unprepare = nt36523_unprepare,
+	.get_modes = nt36523_get_modes,
+};
+
+static int nt36523_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi_r;
+	struct mipi_dsi_host *dsi_r_host;
+	struct panel_info *pinfo;
+	const struct mipi_dsi_device_info *info;
+	int i, dsi_num = 1, ret;
+
+	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
+		pinfo->supplies[i].supply = nt36523_regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
+				      pinfo->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
+		ret = regulator_set_load(pinfo->supplies[i].consumer,
+					 nt36523_regulator_enable_loads[i]);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set regulator enable loads\n");
+	}
+
+	pinfo->desc = of_device_get_match_data(dev);
+	if (!pinfo->desc)
+		return -ENODEV;
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pinfo->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
+				     "Failed to get reset gpio\n");
+	}
+
+	/* If the panel is connected on two DSIs then DSI0 left, DSI1 right */
+	if (pinfo->desc->is_dual_dsi) {
+		info = &pinfo->desc->dsi_info;
+
+		dsi_r = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+		if (!dsi_r) {
+			dev_err(dev, "Cannot get secondary DSI node.\n");
+			return -ENODEV;
+		}
+		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
+		of_node_put(dsi_r);
+		if (!dsi_r_host) {
+			dev_err(dev, "Cannot get secondary DSI host\n");
+			return -EPROBE_DEFER;
+		}
+
+		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
+		if (!pinfo->dsi[1]) {
+			dev_err(dev, "Cannot get secondary DSI node\n");
+			return -ENODEV;
+		}
+		dsi_num++;
+	}
+
+	pinfo->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, pinfo);
+	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&pinfo->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&pinfo->panel);
+
+	for (i = 0; i < dsi_num; i++) {
+		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
+		pinfo->dsi[i]->format = pinfo->desc->format;
+		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
+
+		ret = mipi_dsi_attach(pinfo->dsi[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot attach to DSI%d host.\n", i);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nt36523_of_match[] = {
+	{
+		.compatible = "xiaomi,elish-csot-nt36523",
+		.data = &elish_csot_desc
+	},
+	{
+		.compatible = "xiaomi,elish-boe-nt36523",
+		.data = &elish_boe_desc
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, nt36523_of_match);
+
+static struct mipi_dsi_driver nt36523_driver = {
+	.probe = nt36523_probe,
+	.remove = nt36523_remove,
+	.driver = {
+		.name = "panel-novatek-nt36523",
+		.of_match_table = nt36523_of_match,
+	},
+};
+module_mipi_dsi_driver(nt36523_driver);
+
+MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
+MODULE_DESCRIPTION("Novatek NT36523 DriverIC panels driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1

