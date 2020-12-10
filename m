Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D42D5FF0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65046EAB9;
	Thu, 10 Dec 2020 15:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4A06EA90
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:39:06 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knO24-00020b-O8; Thu, 10 Dec 2020 16:39:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 12/19] drm/imx: parallel-display: use local bridge and
 connector variables
Date: Thu, 10 Dec 2020 16:38:38 +0100
Message-Id: <20201210153845.12176-13-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210153845.12176-1-p.zabel@pengutronix.de>
References: <20201210153845.12176-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use local variables for bridge and connector.
This simplifies the following commits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/parallel-display.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 2eb8df4697df..16e576f8ee83 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -256,7 +256,9 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 static int imx_pd_register(struct drm_device *drm,
 	struct imx_parallel_display *imxpd)
 {
+	struct drm_connector *connector = &imxpd->connector;
 	struct drm_encoder *encoder = &imxpd->encoder;
+	struct drm_bridge *bridge = &imxpd->bridge;
 	int ret;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
@@ -268,31 +270,29 @@ static int imx_pd_register(struct drm_device *drm,
 	 * immediately since the current state is ON
 	 * at this point.
 	 */
-	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
+	connector->dpms = DRM_MODE_DPMS_OFF;
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
 
-	imxpd->bridge.funcs = &imx_pd_bridge_funcs;
-	drm_bridge_attach(encoder, &imxpd->bridge, NULL, 0);
+	bridge->funcs = &imx_pd_bridge_funcs;
+	drm_bridge_attach(encoder, bridge, NULL, 0);
 
 	if (!imxpd->next_bridge) {
-		drm_connector_helper_add(&imxpd->connector,
-				&imx_pd_connector_helper_funcs);
-		drm_connector_init(drm, &imxpd->connector,
-				   &imx_pd_connector_funcs,
+		drm_connector_helper_add(connector,
+					 &imx_pd_connector_helper_funcs);
+		drm_connector_init(drm, connector, &imx_pd_connector_funcs,
 				   DRM_MODE_CONNECTOR_DPI);
 	}
 
 	if (imxpd->next_bridge) {
-		ret = drm_bridge_attach(encoder, imxpd->next_bridge,
-					&imxpd->bridge, 0);
+		ret = drm_bridge_attach(encoder, imxpd->next_bridge, bridge, 0);
 		if (ret < 0) {
 			dev_err(imxpd->dev, "failed to attach bridge: %d\n",
 				ret);
 			return ret;
 		}
 	} else {
-		drm_connector_attach_encoder(&imxpd->connector, encoder);
+		drm_connector_attach_encoder(connector, encoder);
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
