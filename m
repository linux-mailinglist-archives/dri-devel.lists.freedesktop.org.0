Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636063AE974
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601289FD4;
	Mon, 21 Jun 2021 12:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AB889AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:53 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8539B2C90;
 Mon, 21 Jun 2021 14:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280152;
 bh=lyS1pimRzHCdpC145ypWL5C7xIrDmypvolYeSz1zmCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XiTS2VLDCb9mWzcuNGoajcc/JSrgQBlWFw3MFvAyWnV3Ysq/91vstJ+PwmPweRLoB
 pmilJcWmwADDZN8e8dOeTg9ZXGWn5wSIvwijdASA3RtLHXfQaicniKuvgQLCuZ6HX+
 ahEJvMxjzeedMUUI3hYy6bJuOaOZGyCpjtoTnKLo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm: bridge: ti-sn65dsi83: Switch to atomic operations
Date: Mon, 21 Jun 2021 15:55:16 +0300
Message-Id: <20210621125518.13715-4-laurent.pinchart@ideasonboard.com>
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

Use the atomic version of the enable/disable operations to continue the
transition to the atomic API, started with the introduction of
.atomic_get_input_bus_fmts(). This will be needed to access the mode
from the atomic state.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 2fb2bd4e3625..8c1189a8bb4d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -291,7 +291,8 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
-static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
+static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 
@@ -366,7 +367,8 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	return dsi_div - 1;
 }
 
-static void sn65dsi83_enable(struct drm_bridge *bridge)
+static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	unsigned int pval;
@@ -475,7 +477,8 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
 	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
 }
 
-static void sn65dsi83_disable(struct drm_bridge *bridge)
+static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 
@@ -484,7 +487,8 @@ static void sn65dsi83_disable(struct drm_bridge *bridge)
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
 }
 
-static void sn65dsi83_post_disable(struct drm_bridge *bridge)
+static void sn65dsi83_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 
@@ -575,13 +579,13 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
-	.attach		= sn65dsi83_attach,
-	.pre_enable	= sn65dsi83_pre_enable,
-	.enable		= sn65dsi83_enable,
-	.disable	= sn65dsi83_disable,
-	.post_disable	= sn65dsi83_post_disable,
-	.mode_valid	= sn65dsi83_mode_valid,
-	.mode_set	= sn65dsi83_mode_set,
+	.attach			= sn65dsi83_attach,
+	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
+	.atomic_enable		= sn65dsi83_atomic_enable,
+	.atomic_disable		= sn65dsi83_atomic_disable,
+	.atomic_post_disable	= sn65dsi83_atomic_post_disable,
+	.mode_valid		= sn65dsi83_mode_valid,
+	.mode_set		= sn65dsi83_mode_set,
 
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-- 
Regards,

Laurent Pinchart

