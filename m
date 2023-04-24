Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EC6EBB48
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492610E1DE;
	Sat, 22 Apr 2023 20:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0253010E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F1256154E;
 Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48601C4339C;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=frBJetfUTJQ9t9MCTXEIjpCIg2Rlk2lsxz9rtmvkfDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=engI0zZoV4o/Oo47xVRlDL5cyd+XfMUBscHRs9wH817eu7N/7P0mO9BiNgFMUqnrM
 5JHryNGg6ZCETV5l9Lxp3BfXYV+J/uGsHfGfv5ktZ27M9SuvWvhWWVs09U0s0MO+95
 TPgmYGqRb/1Qpm1QP41KsvSCyaQv/c2jlXn0YkNi/Q2WtjKgUAzz+plKpK+7Slyf/Y
 cBUNYD4K+E4I/b/BeecFLUYyaiU7K5fnDVeJtY0kJlLjrli6NdQZ9VyKvXJNGh6Zne
 qYcIBZ1eCmo0viCMQ50zDFuVuX3+tShYMGzzViNHQ99Xk9f75ttEgfdo2ElDI9SmcY
 Q8bgCTl6dXN3w==
Received: by mercury (Postfix, from userid 1000)
 id 1E25B1066CCD; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 10/13] drm/panel: sitronix-st7789v: add media bus format
Date: Sat, 22 Apr 2023 22:50:09 +0200
Message-Id: <20230422205012.2464933-11-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for describing the media bus format in the
panel configuration and expose that to userspace. Since
both supported formats (RGB565 and RGB666) are using 6
bits per color also hardcode that information.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 0e1839e6da73..6d155c6262f3 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -10,6 +10,7 @@
 #include <linux/spi/spi.h>
 
 #include <video/mipi_display.h>
+#include <linux/media-bus-format.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
@@ -110,6 +111,7 @@
 
 struct st7789_panel_info {
 	const struct drm_display_mode *mode;
+	u32 bus_format;
 };
 
 struct st7789v {
@@ -169,6 +171,7 @@ static const struct drm_display_mode default_mode = {
 
 struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
 static int st7789v_get_modes(struct drm_panel *panel,
@@ -190,8 +193,11 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
+	connector->display_info.bpc = 6;
 	connector->display_info.width_mm = ctx->info->mode->width_mm;
 	connector->display_info.height_mm = ctx->info->mode->height_mm;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &ctx->info->bus_format, 1);
 
 	return 1;
 }
@@ -199,8 +205,24 @@ static int st7789v_get_modes(struct drm_panel *panel,
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
+	u8 pixel_fmt;
 	int ret;
 
+	switch (ctx->info->bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		pixel_fmt = MIPI_DCS_PIXEL_FMT_18BIT;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		pixel_fmt = MIPI_DCS_PIXEL_FMT_16BIT;
+		break;
+	default:
+		dev_err(panel->dev, "unsupported bus format: %d\n",
+			ctx->info->bus_format);
+		return -EINVAL;
+	}
+
+	pixel_fmt = (pixel_fmt << 4) | pixel_fmt;
+
 	ret = regulator_enable(ctx->power);
 	if (ret)
 		return ret;
@@ -221,9 +243,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx,
 						MIPI_DCS_SET_PIXEL_FORMAT));
-	ST7789V_TEST(ret, st7789v_write_data(ctx,
-					     (MIPI_DCS_PIXEL_FMT_18BIT << 4) |
-					     (MIPI_DCS_PIXEL_FMT_18BIT)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, pixel_fmt));
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PORCTRL_CMD));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
-- 
2.39.2

