Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D549119EDE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC046EA0D;
	Tue, 10 Dec 2019 22:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52B76E9FD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:49 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E729B1A79;
 Tue, 10 Dec 2019 23:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018724;
 bh=sUkQywuqJkL5oHE8ibpBQitEY2wSSzXt37w7BxyFDtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CaNI8Il5a4sQifFGV5nt60CopIqK26d5PICa4aRY3TvDrPgkW3voSMGuF2G0ZErVB
 x449LUnNmpkUCEVKjvAunDIe4kw57IllBTLuitX8lbqjeR273+yGYp/pvV92Eh7CQF
 S4k8O+YicC+Er/wCom7K3RuL3zqfWv9CCmpAYee8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 47/50] drm/omap: sdi: Register a drm_bridge
Date: Wed, 11 Dec 2019 00:57:47 +0200
Message-Id: <20191210225750.15709-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to integrate with a chain of drm_bridge, the internal SDI
output has to expose its operations through the drm_bridge API.
Register a bridge at initialisation time to do so and remove the
omap_dss_device operations that are now unused.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Remove unused omapdss_device_connector_type() function
- Unregister bridge if port initialisation fails
---
 drivers/gpu/drm/omapdrm/dss/base.c       |  23 ----
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |   1 -
 drivers/gpu/drm/omapdrm/dss/sdi.c        | 168 +++++++++++++++--------
 drivers/gpu/drm/omapdrm/omap_connector.c |  31 +----
 4 files changed, 111 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 2db3bd2f19db..455b410f7401 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -286,29 +286,6 @@ void omapdss_device_post_disable(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
 
-unsigned int omapdss_device_connector_type(enum omap_display_type type)
-{
-	switch (type) {
-	case OMAP_DISPLAY_TYPE_HDMI:
-		return DRM_MODE_CONNECTOR_HDMIA;
-	case OMAP_DISPLAY_TYPE_DVI:
-		return DRM_MODE_CONNECTOR_DVID;
-	case OMAP_DISPLAY_TYPE_DSI:
-		return DRM_MODE_CONNECTOR_DSI;
-	case OMAP_DISPLAY_TYPE_DPI:
-	case OMAP_DISPLAY_TYPE_DBI:
-		return DRM_MODE_CONNECTOR_DPI;
-	case OMAP_DISPLAY_TYPE_VENC:
-		/* TODO: This could also be composite */
-		return DRM_MODE_CONNECTOR_SVIDEO;
-	case OMAP_DISPLAY_TYPE_SDI:
-		return DRM_MODE_CONNECTOR_LVDS;
-	default:
-		return DRM_MODE_CONNECTOR_Unknown;
-	}
-}
-EXPORT_SYMBOL_GPL(omapdss_device_connector_type);
-
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index cb79e05c902d..2e5453df2293 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -454,7 +454,6 @@ void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
 void omapdss_device_enable(struct omap_dss_device *dssdev);
 void omapdss_device_disable(struct omap_dss_device *dssdev);
 void omapdss_device_post_disable(struct omap_dss_device *dssdev);
-unsigned int omapdss_device_connector_type(enum omap_display_type type);
 
 int omap_dss_get_num_overlay_managers(void);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 7dedfcc86922..6ad9d1b94ec0 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -15,6 +15,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 
+#include <drm/drm_bridge.h>
+
 #include "dss.h"
 #include "omapdss.h"
 
@@ -30,9 +32,11 @@ struct sdi_device {
 	int datapairs;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 };
 
-#define dssdev_to_sdi(dssdev) container_of(dssdev, struct sdi_device, output)
+#define drm_bridge_to_sdi(bridge) \
+	container_of(bridge, struct sdi_device, bridge)
 
 struct sdi_clk_calc_ctx {
 	struct sdi_device *sdi;
@@ -118,9 +122,82 @@ static void sdi_config_lcd_manager(struct sdi_device *sdi)
 	dss_mgr_set_lcd_config(&sdi->output, &sdi->mgr_config);
 }
 
-static void sdi_display_enable(struct omap_dss_device *dssdev)
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
+static int sdi_bridge_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return drm_bridge_attach(bridge->encoder, sdi->output.next_bridge,
+				 bridge, flags);
+}
+
+static enum drm_mode_status
+sdi_bridge_mode_valid(struct drm_bridge *bridge,
+		      const struct drm_display_mode *mode)
+{
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
+	unsigned long pixelclock = mode->clock * 1000;
+	struct dispc_clock_info dispc_cinfo;
+	unsigned long fck;
+	int ret;
+
+	if (pixelclock == 0)
+		return MODE_NOCLOCK;
+
+	ret = sdi_calc_clock_div(sdi, pixelclock, &fck, &dispc_cinfo);
+	if (ret < 0)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
+static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
+				  const struct drm_display_mode *mode,
+				  struct drm_display_mode *adjusted_mode)
+{
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
+	unsigned long pixelclock = mode->clock * 1000;
+	struct dispc_clock_info dispc_cinfo;
+	unsigned long fck;
+	unsigned long pck;
+	int ret;
+
+	ret = sdi_calc_clock_div(sdi, pixelclock, &fck, &dispc_cinfo);
+	if (ret < 0)
+		return false;
+
+	pck = fck / dispc_cinfo.lck_div / dispc_cinfo.pck_div;
+
+	if (pck != pixelclock)
+		dev_dbg(&sdi->pdev->dev,
+			"pixel clock adjusted from %lu Hz to %lu Hz\n",
+			pixelclock, pck);
+
+	adjusted_mode->clock = pck / 1000;
+
+	return true;
+}
+
+static void sdi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
+
+	sdi->pixelclock = adjusted_mode->clock * 1000;
+}
+
+static void sdi_bridge_enable(struct drm_bridge *bridge,
+			      struct drm_atomic_state *state)
 {
-	struct sdi_device *sdi = dssdev_to_sdi(dssdev);
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 	struct dispc_clock_info dispc_cinfo;
 	unsigned long fck;
 	int r;
@@ -181,9 +258,10 @@ static void sdi_display_enable(struct omap_dss_device *dssdev)
 	regulator_disable(sdi->vdds_sdi_reg);
 }
 
-static void sdi_display_disable(struct omap_dss_device *dssdev)
+static void sdi_bridge_disable(struct drm_bridge *bridge,
+			       struct drm_atomic_state *state)
 {
-	struct sdi_device *sdi = dssdev_to_sdi(dssdev);
+	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 
 	dss_mgr_disable(&sdi->output);
 
@@ -194,71 +272,40 @@ static void sdi_display_disable(struct omap_dss_device *dssdev)
 	regulator_disable(sdi->vdds_sdi_reg);
 }
 
-static void sdi_set_timings(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode)
-{
-	struct sdi_device *sdi = dssdev_to_sdi(dssdev);
-
-	sdi->pixelclock = mode->clock * 1000;
-}
+static const struct drm_bridge_funcs sdi_bridge_funcs = {
+	.attach = sdi_bridge_attach,
+	.mode_valid = sdi_bridge_mode_valid,
+	.mode_fixup = sdi_bridge_mode_fixup,
+	.mode_set = sdi_bridge_mode_set,
+	.atomic_enable = sdi_bridge_enable,
+	.atomic_disable = sdi_bridge_disable,
+};
 
-static int sdi_check_timings(struct omap_dss_device *dssdev,
-			     struct drm_display_mode *mode)
+static void sdi_bridge_init(struct sdi_device *sdi)
 {
-	struct sdi_device *sdi = dssdev_to_sdi(dssdev);
-	struct dispc_clock_info dispc_cinfo;
-	unsigned long pixelclock = mode->clock * 1000;
-	unsigned long fck;
-	unsigned long pck;
-	int r;
-
-	if (pixelclock == 0)
-		return -EINVAL;
-
-	r = sdi_calc_clock_div(sdi, pixelclock, &fck, &dispc_cinfo);
-	if (r)
-		return r;
+	sdi->bridge.funcs = &sdi_bridge_funcs;
+	sdi->bridge.of_node = sdi->pdev->dev.of_node;
+	sdi->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 
-	pck = fck / dispc_cinfo.lck_div / dispc_cinfo.pck_div;
-
-	if (pck != pixelclock) {
-		DSSWARN("Pixel clock adjusted from %lu Hz to %lu Hz\n",
-			pixelclock, pck);
-
-		mode->clock = pck / 1000;
-	}
-
-	return 0;
+	drm_bridge_add(&sdi->bridge);
 }
 
-static int sdi_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
+static void sdi_bridge_cleanup(struct sdi_device *sdi)
 {
-	return omapdss_device_connect(dst->dss, dst, dst->next);
+	drm_bridge_remove(&sdi->bridge);
 }
 
-static void sdi_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
-static const struct omap_dss_device_ops sdi_ops = {
-	.connect = sdi_connect,
-	.disconnect = sdi_disconnect,
-
-	.enable = sdi_display_enable,
-	.disable = sdi_display_disable,
-
-	.check_timings = sdi_check_timings,
-	.set_timings = sdi_set_timings,
-};
+/* -----------------------------------------------------------------------------
+ * Initialisation and Cleanup
+ */
 
 static int sdi_init_output(struct sdi_device *sdi)
 {
 	struct omap_dss_device *out = &sdi->output;
 	int r;
 
+	sdi_bridge_init(sdi);
+
 	out->dev = &sdi->pdev->dev;
 	out->id = OMAP_DSS_OUTPUT_SDI;
 	out->type = OMAP_DISPLAY_TYPE_SDI;
@@ -266,14 +313,15 @@ static int sdi_init_output(struct sdi_device *sdi)
 	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
 	/* We have SDI only on OMAP3, where it's on port 1 */
 	out->of_port = 1;
-	out->ops = &sdi_ops;
 	out->owner = THIS_MODULE;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
 		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &sdi->bridge);
+	if (r < 0) {
+		sdi_bridge_cleanup(sdi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -284,6 +332,8 @@ static void sdi_uninit_output(struct sdi_device *sdi)
 {
 	omapdss_device_unregister(&sdi->output);
 	omapdss_device_cleanup_output(&sdi->output);
+
+	sdi_bridge_cleanup(sdi);
 }
 
 int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index baa31ed1f993..528764566b17 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -24,22 +24,7 @@ struct omap_connector {
 static enum drm_connector_status omap_connector_detect(
 		struct drm_connector *connector, bool force)
 {
-	enum drm_connector_status status;
-
-	switch (connector->connector_type) {
-	case DRM_MODE_CONNECTOR_DPI:
-	case DRM_MODE_CONNECTOR_LVDS:
-	case DRM_MODE_CONNECTOR_DSI:
-		status = connector_status_connected;
-		break;
-	default:
-		status = connector_status_unknown;
-		break;
-	}
-
-	VERB("%s: %d (force=%d)", connector->name, status, force);
-
-	return status;
+	return connector_status_connected;
 }
 
 static void omap_connector_destroy(struct drm_connector *connector)
@@ -138,18 +123,6 @@ static const struct drm_connector_helper_funcs omap_connector_helper_funcs = {
 	.mode_valid = omap_connector_mode_valid,
 };
 
-static int omap_connector_get_type(struct omap_dss_device *output)
-{
-	struct omap_dss_device *display;
-	enum omap_display_type type;
-
-	display = omapdss_display_get(output);
-	type = display->type;
-	omapdss_device_put(display);
-
-	return omapdss_device_connector_type(type);
-}
-
 /* initialize connector */
 struct drm_connector *omap_connector_init(struct drm_device *dev,
 					  struct omap_dss_device *output,
@@ -171,7 +144,7 @@ struct drm_connector *omap_connector_init(struct drm_device *dev,
 	connector->doublescan_allowed = 0;
 
 	drm_connector_init(dev, connector, &omap_connector_funcs,
-			   omap_connector_get_type(output));
+			   DRM_MODE_CONNECTOR_DSI);
 	drm_connector_helper_add(connector, &omap_connector_helper_funcs);
 
 	return connector;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
