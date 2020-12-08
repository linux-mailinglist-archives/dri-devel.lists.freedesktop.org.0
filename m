Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431B2D2EB7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B657B6E96B;
	Tue,  8 Dec 2020 15:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF656E96F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:55:16 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmfKc-0007AN-Ms; Tue, 08 Dec 2020 16:55:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 17/19] drm/imx: parallel-display: use drm managed resources
Date: Tue,  8 Dec 2020 16:54:49 +0100
Message-Id: <20201208155451.8421-18-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208155451.8421-1-p.zabel@pengutronix.de>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
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

Use drmm_simple_encoder_alloc() to align encoder memory lifetime with
the drm device. drm_encoder_cleanup() is called automatically before
the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v3:
 - use drmm_simple_encoder_alloc()
---
 drivers/gpu/drm/imx/parallel-display.c | 57 +++++++++++++-------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 42b44dbf45f5..9b1ec7e73c30 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
@@ -22,10 +23,14 @@
 
 #include "imx-drm.h"
 
-struct imx_parallel_display {
+struct imx_parallel_display_encoder {
 	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
+	struct imx_parallel_display *pd;
+};
+
+struct imx_parallel_display {
 	struct device *dev;
 	void *edid;
 	u32 bus_format;
@@ -37,12 +42,12 @@ struct imx_parallel_display {
 
 static inline struct imx_parallel_display *con_to_imxpd(struct drm_connector *c)
 {
-	return container_of(c, struct imx_parallel_display, connector);
+	return container_of(c, struct imx_parallel_display_encoder, connector)->pd;
 }
 
 static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_bridge *b)
 {
-	return container_of(b, struct imx_parallel_display, bridge);
+	return container_of(b, struct imx_parallel_display_encoder, bridge)->pd;
 }
 
 static int imx_pd_connector_get_modes(struct drm_connector *connector)
@@ -253,17 +258,25 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
 };
 
-static int imx_pd_register(struct drm_device *drm,
-	struct imx_parallel_display *imxpd)
+static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_connector *connector = &imxpd->connector;
-	struct drm_encoder *encoder = &imxpd->encoder;
-	struct drm_bridge *bridge = &imxpd->bridge;
+	struct drm_device *drm = data;
+	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
+	struct imx_parallel_display_encoder *imxpd_encoder;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct drm_bridge *bridge;
 	int ret;
 
-	memset(connector, 0, sizeof(*connector));
-	memset(encoder, 0, sizeof(*encoder));
-	memset(bridge, 0, sizeof(*bridge));
+	imxpd_encoder = drmm_simple_encoder_alloc(drm, struct imx_parallel_display_encoder,
+						  encoder, DRM_MODE_ENCODER_NONE);
+	if (IS_ERR(imxpd_encoder))
+		return PTR_ERR(imxpd_encoder);
+
+	imxpd_encoder->pd = imxpd;
+	connector = &imxpd_encoder->connector;
+	encoder = &imxpd_encoder->encoder;
+	bridge = &imxpd_encoder->bridge;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
 	if (ret)
@@ -276,18 +289,9 @@ static int imx_pd_register(struct drm_device *drm,
 	 */
 	connector->dpms = DRM_MODE_DPMS_OFF;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
-
 	bridge->funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, bridge, NULL, 0);
 
-	if (!imxpd->next_bridge) {
-		drm_connector_helper_add(connector,
-					 &imx_pd_connector_helper_funcs);
-		drm_connector_init(drm, connector, &imx_pd_connector_funcs,
-				   DRM_MODE_CONNECTOR_DPI);
-	}
-
 	if (imxpd->next_bridge) {
 		ret = drm_bridge_attach(encoder, imxpd->next_bridge, bridge, 0);
 		if (ret < 0) {
@@ -296,20 +300,17 @@ static int imx_pd_register(struct drm_device *drm,
 			return ret;
 		}
 	} else {
+		drm_connector_helper_add(connector,
+					 &imx_pd_connector_helper_funcs);
+		drm_connector_init(drm, connector, &imx_pd_connector_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+
 		drm_connector_attach_encoder(connector, encoder);
 	}
 
 	return 0;
 }
 
-static int imx_pd_bind(struct device *dev, struct device *master, void *data)
-{
-	struct drm_device *drm = data;
-	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
-
-	return imx_pd_register(drm, imxpd);
-}
-
 static const struct component_ops imx_pd_ops = {
 	.bind	= imx_pd_bind,
 };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
