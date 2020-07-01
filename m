Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77848211CAC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA96E50B;
	Thu,  2 Jul 2020 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C706E883
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599491; bh=OhZy2sUOGgc84GZVOn8gtKD1xJgSn3thWhMhtz17alE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SS6uwjGRbSF7cZEqVs4Vqmzjt5W2WnLEI3A1besARuuR0p6Ea+sbc+CS5USHLn5l5
 sTetzsqoWOsi1F60wGrfiSA9X+6o6X1vNiQ3z7ro44djtv4YJMcqCZTs1Z96zs8o8x
 6jMZxnQ9Ya8ecd4xoB0jmR3swb+vyE8BaT/LJTfU=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v6 06/13] drm/panel: st7703: Prepare for supporting multiple
 panels
Date: Wed,  1 Jul 2020 12:31:19 +0200
Message-Id: <20200701103126.1512615-7-megous@megous.com>
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Parametrize the driver so that it can support more panels based
on st7703 controller.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 43 +++++++++++++------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 511af659f273..08cbc316266c 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -13,6 +13,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/display_timing.h>
@@ -56,6 +57,15 @@ struct st7703 {
 	bool prepared;
 
 	struct dentry *debugfs;
+	const struct st7703_panel_desc *desc;
+};
+
+struct st7703_panel_desc {
+	const struct drm_display_mode *mode;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	int (*init_sequence)(struct st7703 *ctx);
 };
 
 static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
@@ -148,7 +158,7 @@ static int st7703_enable(struct drm_panel *panel)
 	struct st7703 *ctx = panel_to_st7703(panel);
 	int ret;
 
-	ret = jh057n_init_sequence(ctx);
+	ret = ctx->desc->init_sequence(ctx);
 	if (ret < 0) {
 		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
 			      ret);
@@ -216,7 +226,7 @@ static int st7703_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode default_mode = {
+static const struct drm_display_mode jh057n00900_mode = {
 	.hdisplay    = 720,
 	.hsync_start = 720 + 90,
 	.hsync_end   = 720 + 90 + 20,
@@ -232,17 +242,26 @@ static const struct drm_display_mode default_mode = {
 	.height_mm   = 130,
 };
 
+struct st7703_panel_desc jh057n00900_panel_desc = {
+	.mode = &jh057n00900_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = jh057n_init_sequence,
+};
+
 static int st7703_get_modes(struct drm_panel *panel,
 			    struct drm_connector *connector)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
 	if (!mode) {
 		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
-			      default_mode.hdisplay, default_mode.vdisplay,
-			      default_mode.vrefresh);
+			      ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
+			      ctx->desc->mode->vrefresh);
 		return -ENOMEM;
 	}
 
@@ -317,11 +336,11 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
+	ctx->desc = of_device_get_match_data(dev);
 
-	dsi->lanes = 4;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->mode_flags = ctx->desc->mode_flags;
+	dsi->format = ctx->desc->format;
+	dsi->lanes = ctx->desc->lanes;
 
 	ctx->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ctx->vcc)) {
@@ -361,8 +380,8 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 	}
 
 	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
-		     default_mode.hdisplay, default_mode.vdisplay,
-		     default_mode.vrefresh,
+		     ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
+		     ctx->desc->mode->vrefresh,
 		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
 
 	st7703_debugfs_init(ctx);
@@ -405,7 +424,7 @@ static int st7703_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id st7703_of_match[] = {
-	{ .compatible = "rocktech,jh057n00900" },
+	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, st7703_of_match);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
