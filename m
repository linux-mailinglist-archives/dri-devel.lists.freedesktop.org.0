Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8E56B3C3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09E10F6A8;
	Fri,  8 Jul 2022 07:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77F510E8AB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 02:20:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id e16so9592884pfm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iz8bT7YPyUHTObGNpxtkrlymFcuBRN0N5+wdic9C3L4=;
 b=ErDmXgWeDdEjMB2VNmjqOaa4/jUh3dGZ5HXosNEIxuhRK0oU1H3Ro90xbw7VtmUNyo
 Bw3qJ3WIWKDz4yET0Pt3QA9OqDhEFixUwvEALg/zYwrifGUxclXQm6xPqoyRlF8dWbpV
 JwvC78kTkatErLKsBb4tcCA8ncEpZNKuduZ8nVlA5au7tDOOSXFmtRMpqnnZ78jf0vJ4
 2drLOy5lguEP3FshINoAxYIW/QcKoxIgHwe2Z+XxyjYYtchdtcDZT+bgNJZJ5hkTpdD4
 1mHFHvuWU6akdPTt6fhFZsX+hrcTSWRURkB1wVKa3BBv0TIwBqHYIiyzCdngTSsCB7bB
 vQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iz8bT7YPyUHTObGNpxtkrlymFcuBRN0N5+wdic9C3L4=;
 b=ptyUsC7Rn5k2uFAFx7aM6aXoLdE2HSY14v81iJ7wz10Dmqks6grS14JkKLe02iJ0qn
 pKqKQRj+pnlj5UUIIsfGZ6GXTqPgGDrUPihCBXyR6r3RvjkDsV2mZurnMctMbE1DvBV7
 1LGRX8Gkt6V7QdsdZB8bCSOGEKLyUEzzPSnYGcWgGUtZAD9psyGSNPireaIMHAQz+vJD
 Efo/bx2VE9hAbKY/qyqP2skX0SxMnOSMoZskq95ZJF599Z2WnMDyDGT7daoZSUmXU99D
 JpJVWZ/lajr+UKkCn1ghBK4NnDbz1ILcnF4fTp8rDXLs20hk7GNxzEcUOd8OZtirnqHn
 DS9Q==
X-Gm-Message-State: AJIora8+TMk0cjYJwc7QUjc5m/uxt++Z4qwdf+RgEpByR/pXtty3zjxl
 qeQzyR4cUs0BZ2dfqEJOkG8=
X-Google-Smtp-Source: AGRyM1ubhSI5/BHz9dGe77c+348d794iAywC6TQWQo9x+N7/BgNKuoYXwi2eurd2NY73KDIwXYnvTg==
X-Received: by 2002:a63:69c3:0:b0:411:9d19:ff13 with SMTP id
 e186-20020a6369c3000000b004119d19ff13mr1137416pgc.34.1657246750285; 
 Thu, 07 Jul 2022 19:19:10 -0700 (PDT)
Received: from localhost.localdomain ([112.0.189.16])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b0015e8d4eb1dbsm12678820plg.37.2022.07.07.19.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 19:19:09 -0700 (PDT)
From: MollySophia <mollysophia379@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: Add novatek nt35596s panel driver
Date: Fri,  8 Jul 2022 10:18:23 +0800
Message-Id: <20220708021824.9167-1-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Jul 2022 07:43:02 +0000
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek NT35596s is a generic DSI IC that drives command and video mode
panels. Add the driver for it. Currently add support for the LCD panel
from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.

Signed-off-by: MollySophia <mollysophia379@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-jdi-fhd-nt35596s.c    | 464 ++++++++++++++++++
 3 files changed, 474 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d5176f75248f..a54389c107bc 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -231,6 +231,15 @@ config DRM_PANEL_JDI_R63452
 	  Say Y here if you want to enable support for the JDI R63452
 	  DSI command mode panel as found in Xiaomi Mi 5 Devices.
 
+config DRM_PANEL_JDI_NT35596S
+	tristate "JDI NT35596S Full HD DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the JDI NT35596S
+	  DSI video mode panel as found in Xiaomi Mi Mix2s Devices.
+
 config DRM_PANEL_KHADAS_TS050
 	tristate "Khadas TS050 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index ef89dada021d..40db5e6dcbf5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_TD4328) += panel-innolux-td4328.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
 obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
+obj-$(CONFIG_DRM_PANEL_JDI_NT35596S) += panel-jdi-fhd-nt35596s.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c b/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c
new file mode 100644
index 000000000000..0793bcd872e2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Molly Sophia <mollysophia379@gmail.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/swab.h>
+#include <linux/backlight.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct nt35596s_panel_cmd {
+	const char data[2];
+};
+
+static const char *const nt35596s_regulator_names[] = {
+	"vddio",
+	"vddpos",
+	"vddneg",
+};
+
+static const unsigned long nt35596s_regulator_enable_loads[] = { 62000, 100000,
+								 100000 };
+
+struct nt35596s_panel_desc {
+	const struct drm_display_mode *display_mode;
+	const char *panel_name;
+
+	unsigned int width_mm;
+	unsigned int height_mm;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+
+	unsigned int num_on_cmds;
+	const struct nt35596s_panel_cmd *on_cmds;
+};
+
+struct nt35596s_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	const struct nt35596s_panel_desc *desc;
+
+	struct regulator_bulk_data
+		supplies[ARRAY_SIZE(nt35596s_regulator_names)];
+
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct nt35596s_panel *to_nt35596s_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt35596s_panel, panel);
+}
+
+static int nt35596s_send_cmds(struct drm_panel *panel,
+			      const struct nt35596s_panel_cmd *cmds, int num)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < num; i++) {
+		const struct nt35596s_panel_cmd *cmd = &cmds[i];
+
+		err = mipi_dsi_dcs_write(pinfo->dsi, cmd->data[0],
+					 cmd->data + 1, 1);
+
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int nt35596s_panel_power_off(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int ret = 0;
+
+	gpiod_set_value(pinfo->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies),
+				     pinfo->supplies);
+	if (ret)
+		dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
+
+	return ret;
+}
+
+static int nt35596s_panel_unprepare(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int ret;
+
+	if (!pinfo->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(pinfo->dsi);
+	if (ret < 0)
+		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n",
+			ret);
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi);
+	if (ret < 0)
+		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+
+	/* 0x46 = 70ms delay */
+	msleep(70);
+
+	ret = nt35596s_panel_power_off(panel);
+	if (ret < 0)
+		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
+
+	pinfo->prepared = false;
+
+	return ret;
+}
+
+static int nt35596s_panel_power_on(struct nt35596s_panel *pinfo)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies),
+				    pinfo->supplies);
+	if (ret < 0)
+		return ret;
+
+	gpiod_set_value(pinfo->reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value(pinfo->reset_gpio, 0);
+	msleep(200);
+
+	return 0;
+}
+
+static int nt35596s_panel_prepare(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int err;
+
+	if (pinfo->prepared)
+		return 0;
+
+	err = nt35596s_panel_power_on(pinfo);
+	if (err < 0)
+		goto poweroff;
+
+	err = nt35596s_send_cmds(panel, pinfo->desc->on_cmds,
+				 pinfo->desc->num_on_cmds);
+
+	if (err < 0) {
+		dev_err(panel->dev, "failed to send DCS Init Code: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->dsi);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+		goto poweroff;
+	}
+
+	/* 0x46 = 70 ms delay */
+	msleep(70);
+
+	err = mipi_dsi_dcs_set_display_on(pinfo->dsi);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to Set Display ON: %d\n", err);
+		goto poweroff;
+	}
+
+	msleep(120);
+
+	pinfo->prepared = true;
+
+	return 0;
+
+poweroff:
+	gpiod_set_value(pinfo->reset_gpio, 0);
+	return err;
+}
+
+static int nt35596s_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	const struct drm_display_mode *m = pinfo->desc->display_mode;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_funcs = {
+	.prepare = nt35596s_panel_prepare,
+	.unprepare = nt35596s_panel_unprepare,
+	.get_modes = nt35596s_panel_get_modes,
+};
+
+static const struct nt35596s_panel_cmd jdi_fhd_video_on_cmds[] = {
+	{ .data = { 0xff, 0x24 } }, { .data = { 0x9d, 0x34 } },
+	{ .data = { 0xfb, 0x01 } }, { .data = { 0xc4, 0x25 } },
+	{ .data = { 0xd1, 0x08 } }, { .data = { 0xd2, 0x84 } },
+	{ .data = { 0xff, 0x26 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0x03, 0x1c } }, { .data = { 0x3b, 0x08 } },
+	{ .data = { 0x6b, 0x08 } }, { .data = { 0x97, 0x08 } },
+	{ .data = { 0xc5, 0x08 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x23 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0x01, 0x84 } }, { .data = { 0x05, 0x2d } },
+	{ .data = { 0x06, 0x00 } }, { .data = { 0x33, 0x07 } },
+	{ .data = { 0x21, 0xee } }, { .data = { 0x22, 0xed } },
+	{ .data = { 0x23, 0xea } }, { .data = { 0x24, 0xe8 } },
+	{ .data = { 0x25, 0xe5 } }, { .data = { 0x26, 0xe2 } },
+	{ .data = { 0x27, 0xde } }, { .data = { 0x28, 0xbb } },
+	{ .data = { 0x29, 0x87 } }, { .data = { 0x2a, 0x77 } },
+	{ .data = { 0x32, 0x0c } }, { .data = { 0x13, 0x3f } },
+	{ .data = { 0x14, 0x34 } }, { .data = { 0x15, 0x2a } },
+	{ .data = { 0x16, 0x25 } }, { .data = { 0x17, 0x9d } },
+	{ .data = { 0x18, 0x9a } }, { .data = { 0x19, 0x97 } },
+	{ .data = { 0x1a, 0x94 } }, { .data = { 0x1b, 0x91 } },
+	{ .data = { 0x1c, 0x8e } }, { .data = { 0x1d, 0x8b } },
+	{ .data = { 0x1e, 0x89 } }, { .data = { 0x1f, 0x86 } },
+	{ .data = { 0x20, 0x83 } }, { .data = { 0xff, 0x22 } },
+	{ .data = { 0x00, 0x0a } }, { .data = { 0x01, 0x43 } },
+	{ .data = { 0x02, 0x5b } }, { .data = { 0x03, 0x6a } },
+	{ .data = { 0x04, 0x7a } }, { .data = { 0x05, 0x82 } },
+	{ .data = { 0x06, 0x85 } }, { .data = { 0x07, 0x80 } },
+	{ .data = { 0x08, 0x7c } }, { .data = { 0x09, 0x7c } },
+	{ .data = { 0x0a, 0x74 } }, { .data = { 0x0b, 0x71 } },
+	{ .data = { 0x0c, 0x6e } }, { .data = { 0x0d, 0x68 } },
+	{ .data = { 0x0e, 0x65 } }, { .data = { 0x0f, 0x5c } },
+	{ .data = { 0x10, 0x32 } }, { .data = { 0x11, 0x18 } },
+	{ .data = { 0x12, 0x00 } }, { .data = { 0x13, 0x00 } },
+	{ .data = { 0x1a, 0x00 } }, { .data = { 0x1b, 0x00 } },
+	{ .data = { 0x1c, 0x00 } }, { .data = { 0x1d, 0x00 } },
+	{ .data = { 0x1e, 0x00 } }, { .data = { 0x1f, 0x00 } },
+	{ .data = { 0x20, 0x00 } }, { .data = { 0x21, 0x00 } },
+	{ .data = { 0x22, 0x00 } }, { .data = { 0x23, 0x00 } },
+	{ .data = { 0x24, 0x00 } }, { .data = { 0x25, 0x00 } },
+	{ .data = { 0x26, 0x00 } }, { .data = { 0x27, 0x00 } },
+	{ .data = { 0x28, 0x00 } }, { .data = { 0x29, 0x00 } },
+	{ .data = { 0x2a, 0x00 } }, { .data = { 0x2b, 0x00 } },
+	{ .data = { 0x2f, 0x00 } }, { .data = { 0x30, 0x00 } },
+	{ .data = { 0x31, 0x00 } }, { .data = { 0x32, 0x0c } },
+	{ .data = { 0x33, 0x0c } }, { .data = { 0x34, 0x0c } },
+	{ .data = { 0x35, 0x0b } }, { .data = { 0x36, 0x09 } },
+	{ .data = { 0x37, 0x09 } }, { .data = { 0x38, 0x08 } },
+	{ .data = { 0x39, 0x05 } }, { .data = { 0x3a, 0x03 } },
+	{ .data = { 0x3b, 0x00 } }, { .data = { 0x3f, 0x00 } },
+	{ .data = { 0x40, 0x00 } }, { .data = { 0x41, 0x00 } },
+	{ .data = { 0x42, 0x00 } }, { .data = { 0x43, 0x00 } },
+	{ .data = { 0x44, 0x00 } }, { .data = { 0x45, 0x00 } },
+	{ .data = { 0x46, 0x00 } }, { .data = { 0x47, 0x00 } },
+	{ .data = { 0x48, 0x00 } }, { .data = { 0x49, 0x03 } },
+	{ .data = { 0x4a, 0x06 } }, { .data = { 0x4b, 0x07 } },
+	{ .data = { 0x4c, 0x07 } }, { .data = { 0x53, 0x01 } },
+	{ .data = { 0x54, 0x01 } }, { .data = { 0x55, 0x89 } },
+	{ .data = { 0x56, 0x00 } }, { .data = { 0x58, 0x00 } },
+	{ .data = { 0x68, 0x00 } }, { .data = { 0x84, 0xff } },
+	{ .data = { 0x85, 0xff } }, { .data = { 0x86, 0x03 } },
+	{ .data = { 0x87, 0x00 } }, { .data = { 0x88, 0x00 } },
+	{ .data = { 0xa2, 0x20 } }, { .data = { 0xa9, 0x01 } },
+	{ .data = { 0xaa, 0x12 } }, { .data = { 0xab, 0x13 } },
+	{ .data = { 0xac, 0x0a } }, { .data = { 0xad, 0x74 } },
+	{ .data = { 0xaf, 0x33 } }, { .data = { 0xb0, 0x03 } },
+	{ .data = { 0xb1, 0x14 } }, { .data = { 0xb2, 0x42 } },
+	{ .data = { 0xb3, 0x40 } }, { .data = { 0xb4, 0xa5 } },
+	{ .data = { 0xb6, 0x44 } }, { .data = { 0xb7, 0x04 } },
+	{ .data = { 0xb8, 0x14 } }, { .data = { 0xb9, 0x42 } },
+	{ .data = { 0xba, 0x40 } }, { .data = { 0xbb, 0xa5 } },
+	{ .data = { 0xbd, 0x44 } }, { .data = { 0xbe, 0x04 } },
+	{ .data = { 0xbf, 0x00 } }, { .data = { 0xc0, 0x75 } },
+	{ .data = { 0xc1, 0x6a } }, { .data = { 0xc2, 0xa5 } },
+	{ .data = { 0xc4, 0x22 } }, { .data = { 0xc5, 0x02 } },
+	{ .data = { 0xc6, 0x00 } }, { .data = { 0xc7, 0x95 } },
+	{ .data = { 0xc8, 0x8a } }, { .data = { 0xc9, 0xa5 } },
+	{ .data = { 0xcb, 0x22 } }, { .data = { 0xcc, 0x02 } },
+	{ .data = { 0xcd, 0x00 } }, { .data = { 0xce, 0xb5 } },
+	{ .data = { 0xcf, 0xaa } }, { .data = { 0xd0, 0xa5 } },
+	{ .data = { 0xd2, 0x22 } }, { .data = { 0xd3, 0x02 } },
+	{ .data = { 0xfb, 0x01 } }, { .data = { 0xff, 0x10 } },
+	{ .data = { 0x26, 0x02 } }, { .data = { 0x35, 0x00 } },
+	{ .data = { 0x51, 0xff } }, { .data = { 0x53, 0x24 } },
+	{ .data = { 0x55, 0x00 } }, { .data = { 0xb0, 0x00 } },
+};
+
+static const struct drm_display_mode jdi_fhd_video_panel_mode = {
+	.clock = (1080 + 16 + 28 + 40) * (2160 + 7 + 4 + 24) * 60 / 1000,
+
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 16,
+	.hsync_end = 1080 + 16 + 28,
+	.htotal = 1080 + 16 + 28 + 40,
+
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 7,
+	.vsync_end = 2160 + 7 + 4,
+	.vtotal = 2160 + 7 + 4 + 24,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt35596s_panel_desc jdi_fhd_video_panel_desc = {
+	.display_mode = &jdi_fhd_video_panel_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.on_cmds = jdi_fhd_video_on_cmds,
+	.num_on_cmds = ARRAY_SIZE(jdi_fhd_video_on_cmds),
+};
+
+static int nt35596s_panel_add(struct nt35596s_panel *pinfo)
+{
+	struct device *dev = &pinfo->dsi->dev;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
+		pinfo->supplies[i].supply = nt35596s_regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
+				      pinfo->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
+		ret = regulator_set_load(pinfo->supplies[i].consumer,
+					 nt35596s_regulator_enable_loads[i]);
+		if (ret)
+			return dev_err_probe(
+				dev, ret,
+				"failed to set regulator enable loads\n");
+	}
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(pinfo->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
+				     "failed to get reset gpio from DT\n");
+
+	drm_panel_init(&pinfo->panel, dev, &panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&pinfo->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&pinfo->panel);
+
+	return 0;
+}
+
+static int nt35596s_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo;
+	const struct nt35596s_panel_desc *desc;
+	int err;
+
+	pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->mode_flags = desc->mode_flags;
+	dsi->format = desc->format;
+	dsi->lanes = desc->lanes;
+	pinfo->desc = desc;
+	pinfo->dsi = dsi;
+
+	mipi_dsi_set_drvdata(dsi, pinfo);
+
+	err = nt35596s_panel_add(pinfo);
+	if (err < 0)
+		return err;
+
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		drm_panel_remove(&pinfo->panel);
+		return err;
+	}
+
+	return 0;
+}
+
+static int nt35596s_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = drm_panel_unprepare(&pinfo->panel);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
+
+	err = drm_panel_disable(&pinfo->panel);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_remove(&pinfo->panel);
+
+	return 0;
+}
+
+static void nt35596s_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&pinfo->panel);
+	drm_panel_unprepare(&pinfo->panel);
+}
+
+static const struct of_device_id nt35596s_panel_of_match[] = {
+	{ .compatible = "jdi,fhd-nt35596s", .data = &jdi_fhd_video_panel_desc },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nt35596s_panel_of_match);
+
+static struct mipi_dsi_driver nt35596s_panel_driver = {
+	.driver = {
+		.name = "panel-jdi-fhd-nt35596s",
+		.of_match_table = nt35596s_panel_of_match,
+	},
+	.probe = nt35596s_panel_probe,
+	.remove = nt35596s_panel_remove,
+	.shutdown = nt35596s_panel_shutdown,
+};
+module_mipi_dsi_driver(nt35596s_panel_driver);
+
+MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for JDI FHD nt35596s DSI panel, video mode");
+MODULE_LICENSE("GPL");
-- 
2.37.0

