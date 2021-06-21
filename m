Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878F3AE976
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953189FF9;
	Mon, 21 Jun 2021 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40789FD4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:52 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70A7B2C60;
 Mon, 21 Jun 2021 14:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280151;
 bh=pdp40AiH2KsvvVy7QPQFmaS9B235/IQrutnYQw63mco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O/4Mu+LTDFgzD+2eiDrlpOUPaUzkSWXXbxaVy9/0nDdlnQrT5b5wi3C7lfpuBy4hi
 fyX5rI33P54+eG+oaIKYBVIJjPZOW1qFuIEyrM2xTndbcjLuYXimEdZbfGcTAN2lox
 8ZjEQ1eaTmlk/WQOabDktXyu3EX1XnmgSoPfjnhQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper
 functions
Date: Mon, 21 Jun 2021 15:55:15 +0300
Message-Id: <20210621125518.13715-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass the display mode explicitly to the sn65dsi83_get_lvds_range() and
sn65dsi83_get_dsi_range() functions to prepare for its removal from the
sn65dsi83 structure. This is not meant to bring any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index db2e7aa90667..2fb2bd4e3625 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -306,7 +306,8 @@ static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
 	usleep_range(1000, 1100);
 }
 
-static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
+static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
+				   const struct drm_display_mode *mode)
 {
 	/*
 	 * The encoding of the LVDS_CLK_RANGE is as follows:
@@ -322,7 +323,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
 	 * the clock to 25..154 MHz, the range calculation can be simplified
 	 * as follows:
 	 */
-	int mode_clock = ctx->mode.clock;
+	int mode_clock = mode->clock;
 
 	if (ctx->lvds_dual_link)
 		mode_clock /= 2;
@@ -330,7 +331,8 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
 	return (mode_clock - 12500) / 25000;
 }
 
-static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
+static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
+				  const struct drm_display_mode *mode)
 {
 	/*
 	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
@@ -346,7 +348,7 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
 	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
 	 * the 2 is there because the bus is DDR.
 	 */
-	return DIV_ROUND_UP(clamp((unsigned int)ctx->mode.clock *
+	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
 			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
 			    ctx->dsi_lanes / 2, 40000U, 500000U), 5000U);
 }
@@ -378,10 +380,10 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
 
 	/* Reference clock derived from DSI link clock. */
 	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
-		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
+		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, &ctx->mode)) |
 		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
 	regmap_write(ctx->regmap, REG_DSI_CLK,
-		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
+		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, &ctx->mode)));
 	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
 		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
 
-- 
Regards,

Laurent Pinchart

