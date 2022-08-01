Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38B586B97
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7907AB9F0;
	Mon,  1 Aug 2022 13:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58DDAC6FF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:11:21 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 26F688215A;
 Mon,  1 Aug 2022 15:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659359480;
 bh=KYWYAfQmDZa78aY8e+7BI+ZaBLKAX3dGfY2WEXE5nGQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ZOWDwA9momE/aqPRgALu86zw4ALkpOjdvDX5QRYc8/xtsZkNla+zfS8uW+m2axaNC
 nF3CL0NCvqG1vIKG7v9TuSvp3AXg1tu4tGrellfQMoGY9blui6bEQRvkGUwdVnSQqT
 U+Z1aZ24F6RjXw2x9wr13BWd3pB7uxgKxr11IIX+pZjOdq1UoM4sfTum798h7z64Mt
 aJkT/m/XiDYhdWd8tqqC+jsSn06pI5issR22GTFBC68Kly13uxRWyE8Q7B27HLhl8H
 jcbEO5IMxF8tOkqQA8ozc2agnucKowGtDm93IDna4akEOHpX/6XoQkmu5bM0j90+0x
 W+ps8T/vRFHVQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Date: Mon,  1 Aug 2022 15:11:13 +0200
Message-Id: <20220801131113.182487-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
adjust DSI input frequency calculations such that they expect the DSI host
to configure HS clock according to hs_rate.

This is an optimization for the DSI burst mode case. In case the DSI device
supports DSI burst mode, it is recommended to operate the DSI interface at
the highest possible HS clock frequency which the DSI device supports. This
permits the DSI host to send as short as possible bursts of data on the DSI
link and keep the DSI data lanes in LP mode otherwise, which reduces power
consumption.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 14e7aa77e7584..b161f25c3a2f5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
 	return (mode_clock - 12500) / 25000;
 }
 
-static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
-				  const struct drm_display_mode *mode)
+static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
 {
 	/*
 	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
@@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
 	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
 	 * the 2 is there because the bus is DDR.
 	 */
-	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
-			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
-			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
+	return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
 }
 
-static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
+static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
+				const struct drm_display_mode *mode)
 {
 	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
-	unsigned int dsi_div = mipi_dsi_pixel_format_to_bpp(ctx->dsi->format);
+	unsigned int dsi_div;
+	int mode_clock = mode->clock;
 
-	dsi_div /= ctx->dsi->lanes;
+	if (ctx->lvds_dual_link)
+		mode_clock /= 2;
 
-	if (!ctx->lvds_dual_link)
-		dsi_div /= 2;
+	dsi_div = (ctx->dsi->hs_rate / mode_clock) / 1000;
 
 	return dsi_div - 1;
 }
@@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, mode)) |
 		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
 	regmap_write(ctx->regmap, REG_DSI_CLK,
-		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode)));
+		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
 	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
-		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
+		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, mode)));
 
 	/* Set number of DSI lanes and LVDS link config. */
 	regmap_write(ctx->regmap, REG_DSI_LANE,
@@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+	dsi->hs_rate = 500000000;
+	dsi->lp_rate = 16000000;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.35.1

