Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD5759968
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6C310E4C4;
	Wed, 19 Jul 2023 15:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88610E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:20:16 +0000 (UTC)
Received: from johnny.home (unknown
 [IPv6:2a01:e0a:212:79f0:c8e5:afad:333a:7f73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: aferraris)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E6E896607078;
 Wed, 19 Jul 2023 16:20:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689780015;
 bh=Vuz8fxxRQjyEzNJO5AifT30HVP1PpYja7Nw+e3uq5EM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RdqvU8eVbhir2m5RRjomEgdqhaDDdkd3yICGx8N0RE2FPBi6pPTU3uesyt+xzFPwS
 fF3ER6Q01KfF51CY8OaD2UeJeLY118SnTQOFu9gsK+4x/NN9Zox8mFQk6HVWLhSjig
 H29UON+odoMwFCkq2h68bYXNoveCARYcuXhMWdhEBsAljOLNW+wxbMl1WSYDU3/sv3
 nc8Q292u36GOFTutxOF8f0eCjPVAhmkmTnw1gaCj77hT0ugNnCs5hG4c3jt5IRXi/D
 /0zcnhsVBIQBo3r9mg/VhZqTPmg4By9GafFGum+MC4STsYDrJ3em/klMvArVBpFOLw
 r8/ye8B97dYKA==
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2 RESEND] drm: panel: Add novatek nt35596s panel driver
Date: Wed, 19 Jul 2023 17:20:07 +0200
Message-Id: <20230719152007.197710-3-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
References: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
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
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Molly Sophia <mollysophia379@gmail.com>

Novatek NT35596s is a generic DSI IC that drives command and video mode
panels. Add the driver for it. Currently add support for the LCD panel
from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
Changes in v5:
- Move changelog out of commit message.
- Wrap description lines around 80 chars.

Changes in v4:
- Correct numeric order of the items.

Changes in v3:
- Embed the documentation into existing one (novatek,nt36672a).

 drivers/gpu/drm/panel/Kconfig                 |   7 +-
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 251 ++++++++++++++++--
 2 files changed, 237 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1a0fd0754692..28ac4d980472 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -399,14 +399,15 @@ config DRM_PANEL_NOVATEK_NT36523
 	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
 
 config DRM_PANEL_NOVATEK_NT36672A
-	tristate "Novatek NT36672A DSI panel"
+	tristate "Novatek NT36672A/NT35596S DSI panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for the panels built
-	  around the Novatek NT36672A display controller, such as some
-	  Tianma panels used in a few Xiaomi Poco F1 mobile phones.
+	  around the Novatek NT36672A or NT35596S display controller, such
+	  as some Tianma panels used in a few Xiaomi Poco F1 mobile phones
+	  or the JDI panels used in Xiaomi Mi Mix2S mobile phones.
 
 config DRM_PANEL_NOVATEK_NT39016
 	tristate "Novatek NT39016 RGB/SPI panel"
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 73bcffa1e0c1..68600000618b 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -3,13 +3,16 @@
  * Copyright (C) 2020 Linaro Ltd
  * Author: Sumit Semwal <sumit.semwal@linaro.org>
  *
- * This driver is for the DSI interface to panels using the NT36672A display driver IC
- * from Novatek.
- * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones, including
- * some variants of the Poco F1 phone.
+ * Copyright (C) 2022 Molly Sophia <mollysophia379@gmail.com>
  *
- * Panels using the Novatek NT37762A IC should add appropriate configuration per-panel and
- * use this driver.
+ * This driver is for the DSI interface to panels using the NT36672A/NT35596S
+ * display driver IC from Novatek.
+ * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones,
+ * including some variants of the Poco F1 phone, and the JDI FHD+ panels found
+ * in Xiaomi Mi Mix2S phones.
+ *
+ * Panels using the Novatek NT37762A or NT35596S IC should add appropriate
+ * configuration per-panel and use this driver.
  */
 
 #include <linux/delay.h>
@@ -123,12 +126,14 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	if (!pinfo->prepared)
 		return 0;
 
-	/* send off cmds */
-	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
-				 pinfo->desc->num_off_cmds);
+	if (pinfo->desc->num_off_cmds != 0) {
+		/* send off cmds if present */
+		ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
+					pinfo->desc->num_off_cmds);
 
-	if (ret < 0)
-		dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
+		if (ret < 0)
+			dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
+	}
 
 	ret = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (ret < 0)
@@ -211,13 +216,15 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	/* Send rest of the init cmds */
-	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_2,
-				 pinfo->desc->num_on_cmds_2);
+	if (pinfo->desc->num_on_cmds_2 != 0) {
+		/* Send rest of the init cmds if present */
+		err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_2,
+					pinfo->desc->num_on_cmds_2);
 
-	if (err < 0) {
-		dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
-		goto poweroff;
+		if (err < 0) {
+			dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
+			goto poweroff;
+		}
 	}
 
 	msleep(120);
@@ -601,6 +608,212 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
 	.num_off_cmds = ARRAY_SIZE(tianma_fhd_video_off_cmds),
 };
 
+static const struct nt36672a_panel_cmd jdi_nt35596s_video_on_cmds[] = {
+	{ .data = { 0xff, 0x24 } },
+	{ .data = { 0x9d, 0x34 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xc4, 0x25 } },
+	{ .data = { 0xd1, 0x08 } },
+	{ .data = { 0xd2, 0x84 } },
+	{ .data = { 0xff, 0x26 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0x03, 0x1c } },
+	{ .data = { 0x3b, 0x08 } },
+	{ .data = { 0x6b, 0x08 } },
+	{ .data = { 0x97, 0x08 } },
+	{ .data = { 0xc5, 0x08 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x23 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0x01, 0x84 } },
+	{ .data = { 0x05, 0x2d } },
+	{ .data = { 0x06, 0x00 } },
+	{ .data = { 0x33, 0x07 } },
+	{ .data = { 0x21, 0xee } },
+	{ .data = { 0x22, 0xed } },
+	{ .data = { 0x23, 0xea } },
+	{ .data = { 0x24, 0xe8 } },
+	{ .data = { 0x25, 0xe5 } },
+	{ .data = { 0x26, 0xe2 } },
+	{ .data = { 0x27, 0xde } },
+	{ .data = { 0x28, 0xbb } },
+	{ .data = { 0x29, 0x87 } },
+	{ .data = { 0x2a, 0x77 } },
+	{ .data = { 0x32, 0x0c } },
+	{ .data = { 0x13, 0x3f } },
+	{ .data = { 0x14, 0x34 } },
+	{ .data = { 0x15, 0x2a } },
+	{ .data = { 0x16, 0x25 } },
+	{ .data = { 0x17, 0x9d } },
+	{ .data = { 0x18, 0x9a } },
+	{ .data = { 0x19, 0x97 } },
+	{ .data = { 0x1a, 0x94 } },
+	{ .data = { 0x1b, 0x91 } },
+	{ .data = { 0x1c, 0x8e } },
+	{ .data = { 0x1d, 0x8b } },
+	{ .data = { 0x1e, 0x89 } },
+	{ .data = { 0x1f, 0x86 } },
+	{ .data = { 0x20, 0x83 } },
+	{ .data = { 0xff, 0x22 } },
+	{ .data = { 0x00, 0x0a } },
+	{ .data = { 0x01, 0x43 } },
+	{ .data = { 0x02, 0x5b } },
+	{ .data = { 0x03, 0x6a } },
+	{ .data = { 0x04, 0x7a } },
+	{ .data = { 0x05, 0x82 } },
+	{ .data = { 0x06, 0x85 } },
+	{ .data = { 0x07, 0x80 } },
+	{ .data = { 0x08, 0x7c } },
+	{ .data = { 0x09, 0x7c } },
+	{ .data = { 0x0a, 0x74 } },
+	{ .data = { 0x0b, 0x71 } },
+	{ .data = { 0x0c, 0x6e } },
+	{ .data = { 0x0d, 0x68 } },
+	{ .data = { 0x0e, 0x65 } },
+	{ .data = { 0x0f, 0x5c } },
+	{ .data = { 0x10, 0x32 } },
+	{ .data = { 0x11, 0x18 } },
+	{ .data = { 0x12, 0x00 } },
+	{ .data = { 0x13, 0x00 } },
+	{ .data = { 0x1a, 0x00 } },
+	{ .data = { 0x1b, 0x00 } },
+	{ .data = { 0x1c, 0x00 } },
+	{ .data = { 0x1d, 0x00 } },
+	{ .data = { 0x1e, 0x00 } },
+	{ .data = { 0x1f, 0x00 } },
+	{ .data = { 0x20, 0x00 } },
+	{ .data = { 0x21, 0x00 } },
+	{ .data = { 0x22, 0x00 } },
+	{ .data = { 0x23, 0x00 } },
+	{ .data = { 0x24, 0x00 } },
+	{ .data = { 0x25, 0x00 } },
+	{ .data = { 0x26, 0x00 } },
+	{ .data = { 0x27, 0x00 } },
+	{ .data = { 0x28, 0x00 } },
+	{ .data = { 0x29, 0x00 } },
+	{ .data = { 0x2a, 0x00 } },
+	{ .data = { 0x2b, 0x00 } },
+	{ .data = { 0x2f, 0x00 } },
+	{ .data = { 0x30, 0x00 } },
+	{ .data = { 0x31, 0x00 } },
+	{ .data = { 0x32, 0x0c } },
+	{ .data = { 0x33, 0x0c } },
+	{ .data = { 0x34, 0x0c } },
+	{ .data = { 0x35, 0x0b } },
+	{ .data = { 0x36, 0x09 } },
+	{ .data = { 0x37, 0x09 } },
+	{ .data = { 0x38, 0x08 } },
+	{ .data = { 0x39, 0x05 } },
+	{ .data = { 0x3a, 0x03 } },
+	{ .data = { 0x3b, 0x00 } },
+	{ .data = { 0x3f, 0x00 } },
+	{ .data = { 0x40, 0x00 } },
+	{ .data = { 0x41, 0x00 } },
+	{ .data = { 0x42, 0x00 } },
+	{ .data = { 0x43, 0x00 } },
+	{ .data = { 0x44, 0x00 } },
+	{ .data = { 0x45, 0x00 } },
+	{ .data = { 0x46, 0x00 } },
+	{ .data = { 0x47, 0x00 } },
+	{ .data = { 0x48, 0x00 } },
+	{ .data = { 0x49, 0x03 } },
+	{ .data = { 0x4a, 0x06 } },
+	{ .data = { 0x4b, 0x07 } },
+	{ .data = { 0x4c, 0x07 } },
+	{ .data = { 0x53, 0x01 } },
+	{ .data = { 0x54, 0x01 } },
+	{ .data = { 0x55, 0x89 } },
+	{ .data = { 0x56, 0x00 } },
+	{ .data = { 0x58, 0x00 } },
+	{ .data = { 0x68, 0x00 } },
+	{ .data = { 0x84, 0xff } },
+	{ .data = { 0x85, 0xff } },
+	{ .data = { 0x86, 0x03 } },
+	{ .data = { 0x87, 0x00 } },
+	{ .data = { 0x88, 0x00 } },
+	{ .data = { 0xa2, 0x20 } },
+	{ .data = { 0xa9, 0x01 } },
+	{ .data = { 0xaa, 0x12 } },
+	{ .data = { 0xab, 0x13 } },
+	{ .data = { 0xac, 0x0a } },
+	{ .data = { 0xad, 0x74 } },
+	{ .data = { 0xaf, 0x33 } },
+	{ .data = { 0xb0, 0x03 } },
+	{ .data = { 0xb1, 0x14 } },
+	{ .data = { 0xb2, 0x42 } },
+	{ .data = { 0xb3, 0x40 } },
+	{ .data = { 0xb4, 0xa5 } },
+	{ .data = { 0xb6, 0x44 } },
+	{ .data = { 0xb7, 0x04 } },
+	{ .data = { 0xb8, 0x14 } },
+	{ .data = { 0xb9, 0x42 } },
+	{ .data = { 0xba, 0x40 } },
+	{ .data = { 0xbb, 0xa5 } },
+	{ .data = { 0xbd, 0x44 } },
+	{ .data = { 0xbe, 0x04 } },
+	{ .data = { 0xbf, 0x00 } },
+	{ .data = { 0xc0, 0x75 } },
+	{ .data = { 0xc1, 0x6a } },
+	{ .data = { 0xc2, 0xa5 } },
+	{ .data = { 0xc4, 0x22 } },
+	{ .data = { 0xc5, 0x02 } },
+	{ .data = { 0xc6, 0x00 } },
+	{ .data = { 0xc7, 0x95 } },
+	{ .data = { 0xc8, 0x8a } },
+	{ .data = { 0xc9, 0xa5 } },
+	{ .data = { 0xcb, 0x22 } },
+	{ .data = { 0xcc, 0x02 } },
+	{ .data = { 0xcd, 0x00 } },
+	{ .data = { 0xce, 0xb5 } },
+	{ .data = { 0xcf, 0xaa } },
+	{ .data = { 0xd0, 0xa5 } },
+	{ .data = { 0xd2, 0x22 } },
+	{ .data = { 0xd3, 0x02 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x10 } },
+	{ .data = { 0x26, 0x02 } },
+	{ .data = { 0x35, 0x00 } },
+	{ .data = { 0x51, 0xff } },
+	{ .data = { 0x53, 0x24 } },
+	{ .data = { 0x55, 0x00 } },
+	{ .data = { 0xb0, 0x00 } },
+};
+
+static const struct drm_display_mode jdi_nt35596s_video_panel_mode = {
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
+static const struct nt36672a_panel_desc jdi_nt35596s_video_panel_desc = {
+	.display_mode = &jdi_nt35596s_video_panel_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.on_cmds_1 = jdi_nt35596s_video_on_cmds,
+	.num_on_cmds_1 = ARRAY_SIZE(jdi_nt35596s_video_on_cmds),
+	.on_cmds_2 = NULL,
+	.num_on_cmds_2 = 0,
+	.off_cmds = NULL,
+	.num_off_cmds = 0,
+};
+
 static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 {
 	struct device *dev = &pinfo->link->dev;
@@ -699,6 +912,7 @@ static void nt36672a_panel_shutdown(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id tianma_fhd_video_of_match[] = {
 	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
+	{ .compatible = "jdi,fhd-nt35596s", .data = &jdi_nt35596s_video_panel_desc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
@@ -715,5 +929,6 @@ static struct mipi_dsi_driver nt36672a_panel_driver = {
 module_mipi_dsi_driver(nt36672a_panel_driver);
 
 MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
-MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
+MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
+MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
 MODULE_LICENSE("GPL");
-- 
2.40.1
