Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F8266071
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA126EA4D;
	Fri, 11 Sep 2020 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1645E6EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:13 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-Vh; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/21] drm/imx: parallel-display: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:52 +0200
Message-Id: <20200911133855.29801-18-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move device tree parsing into probe(). Use drmm_kzalloc() to align
encoder memory lifetime with the drm device, and use
drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Changes since v1:
 - Split some changes into previous patches, rebased.
---
 drivers/gpu/drm/imx/parallel-display.c | 76 ++++++++++++++++----------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 42b44dbf45f5..2b2160387cbf 100644
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
@@ -253,17 +258,39 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
 };
 
-static int imx_pd_register(struct drm_device *drm,
-	struct imx_parallel_display *imxpd)
+static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
+{
+	struct drm_encoder *encoder = ptr;
+
+	drm_encoder_cleanup(encoder);
+}
+
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
+	imxpd_encoder = drmm_kzalloc(drm, sizeof(*imxpd_encoder), GFP_KERNEL);
+	if (!imxpd_encoder)
+		return -ENOMEM;
+
+	imxpd_encoder->pd = imxpd;
+	connector = &imxpd_encoder->connector;
+	encoder = &imxpd_encoder->encoder;
+	bridge = &imxpd_encoder->bridge;
+
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
 	if (ret)
@@ -276,18 +303,9 @@ static int imx_pd_register(struct drm_device *drm,
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
@@ -296,20 +314,17 @@ static int imx_pd_register(struct drm_device *drm,
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
