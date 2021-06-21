Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088773AE973
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8950889AC9;
	Mon, 21 Jun 2021 12:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFE189A20
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:51 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 608302C51;
 Mon, 21 Jun 2021 14:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280150;
 bh=TVXwXB+Zz4NoD4aUIScYRxCiOEPJOEhR90Y3XuY+Jj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gf2rW9S6VbTKf3tr+BIJBqny3IZaMgMp57z28phfnQOuVc3ofpJ5mzT27xmxBCC5D
 YA4hhxhjzEzwnT6UsMm4ikz85AszDsQ3bQ3MMUsfNb6uAUpcsiKrSWE+m9qEeuQUqZ
 PRSvEOCXRfCN1ZZj01qvjjsrsFPLR/Ja7jg8Qsxs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm: bridge: ti-sn65dsi83: Move LVDS format selection to
 .mode_set()
Date: Mon, 21 Jun 2021 15:55:14 +0300
Message-Id: <20210621125518.13715-2-laurent.pinchart@ideasonboard.com>
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

The LVDS format is selected based on the bus format reported by the
connector. This is currently done in .mode_fixup(), but that's not the
right place, as the format should be selected when setting the mode.
Move it to .mode_set().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index b4e8e61da76e..db2e7aa90667 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -509,19 +509,12 @@ static void sn65dsi83_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *adj)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-
-	ctx->mode = *adj;
-}
-
-static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adj)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_device *ddev = encoder->dev;
 	struct drm_connector *connector;
 
+	ctx->mode = *adj;
+
 	/* The DSI format is always RGB888_1X24 */
 	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
 		switch (connector->display_info.bus_formats[0]) {
@@ -551,8 +544,6 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
 			break;
 		}
 	}
-
-	return true;
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
@@ -589,7 +580,6 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.post_disable	= sn65dsi83_post_disable,
 	.mode_valid	= sn65dsi83_mode_valid,
 	.mode_set	= sn65dsi83_mode_set,
-	.mode_fixup	= sn65dsi83_mode_fixup,
 
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-- 
Regards,

Laurent Pinchart

