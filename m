Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B210F125FC8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D56EB30;
	Thu, 19 Dec 2019 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EAA6EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:19 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1269C1367;
 Thu, 19 Dec 2019 11:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752376;
 bh=88qToBzErM0zBnIDlesRjPyCQ2/zoLAoCrMj69A3xfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mhc/AmKEvosMDYHdjZzIGGJ3wQffGt4teInwNP0vvRZFcTzYFz5lzPV2o9K5capub
 0e7Ygae3OolPtEbq8v/5L9Uob/VODUvsShaeqMEkTMmStnyWWG1I7GJbBR/0ZMJthX
 3iMPaKgtOSqCaHhTl5qrik84gVEKA28Yaca5CK9g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 47/51] drm/omap: sdi: Register a drm_bridge
Date: Thu, 19 Dec 2019 12:45:18 +0200
Message-Id: <20191219104522.9379-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to integrate with a chain of drm_bridge, the internal SDI
output has to expose its operations through the drm_bridge API.
Register a bridge at initialisation time to do so and remove the
omap_dss_device operations that are now unused.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v3:

- Split dss/base.h and omap_connector.c cleanups to a separate patch

Changes since v2:

- Remove unused omapdss_device_connector_type() function
- Unregister bridge if port initialisation fails

wip
---
 drivers/gpu/drm/omapdrm/dss/sdi.c | 168 +++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 59 deletions(-)

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
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
