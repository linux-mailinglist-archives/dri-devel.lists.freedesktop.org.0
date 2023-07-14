Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3AF752EC1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE14710E7AE;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61BD10E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DF8B61BA2;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581D1C433CB;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=pHG+mTF3Sqq4Dyhp7e3fM2xvT8KCo3Hc4liBMTVZVOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jcobtyHoeNyuILr2XEO5I4hFwKoTCvji/RQFFN4rJXcJn8ldgZrRtumRdxsmLzDAl
 TF3fWQFpUhlCtRfrI8NSYv7VHedxNEz6gAHWN5o7A2XFWwrckHcIctWvEhXjDGHfhR
 P/l1czEkG1foF2ESTVmjPtnLrbetDqZ1d3fmBPgb2w6ZUTbS4UqibPz25ye8E/27rj
 87CAO8XzMhJUo/yciroYpWw3s16fQO+VRNlBe7CHLDtedEciSv+Xx9Lbmb0pD3z9Yg
 sj4+cTkOpOcbQAHgsms06lQ4praeRHvGBVCPWXDc6+JyhyWi2bMslRc7Aisrm5YQhF
 8Rnho0zq6hUlg==
Received: by mercury (Postfix, from userid 1000)
 id E249B10676F2; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 10/19] drm/panel: sitronix-st7789v: add media bus format
Date: Fri, 14 Jul 2023 03:37:47 +0200
Message-Id: <20230714013756.1546769-11-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for describing the media bus format in the
panel configuration and expose that to userspace. Since
both supported formats (RGB565 and RGB666) are using 6
bits per color also hardcode that information.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index aa11a1dc0752..d05d7a9caefc 100644
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
 
 static const struct st7789_panel_info default_panel = {
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
2.40.1

