Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C42C2637
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB736E3EC;
	Tue, 24 Nov 2020 12:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2E6E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClUdU123659;
 Tue, 24 Nov 2020 06:47:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222050;
 bh=/yj3mpisOBXVlAVRnyB3bxbdOrEFePNxgk4+Uynd+Jg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vbLqvVpxVUnXyUFn4ckMdvyDnWZhO8tzlxJTziWMpA1BBUjnyVu+Vu2HjMTZV9lvR
 4wKRaXdiOUiupfUfdYj8ajFFNM5I4zU4wqUy6Rl/DRgAepcqN1Ls9qlDhYXxVk8SUl
 KKqBSuVIQfuejP8YnC/jo10d1UIOTbAdtByP2JrM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClUGn043562
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:47:30 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:30 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpT040922;
 Tue, 24 Nov 2020 06:47:28 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 40/80] drm/omap: dsi: Register a drm_bridge
Date: Tue, 24 Nov 2020 14:44:58 +0200
Message-ID: <20201124124538.660710-41-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

In order to integrate with a chain of drm_bridge, the internal DSI
output has to expose its operations through the drm_bridge API.
Register a bridge at initialisation time to do so and remove the
omap_dss_device operations that are now unused.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 134 ++++++++++++++++++++----------
 1 file changed, 89 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 549386f3897b..fcb51aedf847 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -35,6 +35,7 @@
 #include <linux/component.h>
 #include <linux/sys_soc.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <video/mipi_display.h>
@@ -438,6 +439,7 @@ struct dsi_data {
 	struct omap_dss_dsi_videomode_timings vm_timings;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 };
 
 struct dsi_packet_sent_handler_data {
@@ -450,6 +452,9 @@ static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
 #endif
 
+#define drm_bridge_to_dsi(bridge) \
+	container_of(bridge, struct dsi_data, bridge)
+
 static inline struct dsi_data *to_dsi_data(struct omap_dss_device *dssdev)
 {
 	return dev_get_drvdata(dssdev->dev);
@@ -5009,50 +5014,7 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static void dsi_set_timings(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode)
-{
-	DSSDBG("dsi_set_timings\n");
-	dsi_set_config(dssdev, mode);
-}
-
-static int dsi_check_timings(struct omap_dss_device *dssdev,
-			     struct drm_display_mode *mode)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct dsi_clk_calc_ctx ctx;
-	int r;
-
-	DSSDBG("dsi_check_timings\n");
-
-	mutex_lock(&dsi->lock);
-	r = __dsi_calc_config(dsi, mode, &ctx);
-	mutex_unlock(&dsi->lock);
-
-	return r;
-}
-
-static int dsi_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void dsi_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
 static const struct omap_dss_device_ops dsi_ops = {
-	.connect = dsi_connect,
-	.disconnect = dsi_disconnect,
-	.enable = dsi_enable_video_outputs,
-	.disable = dsi_disable_video_outputs,
-
-	.check_timings = dsi_check_timings,
-	.set_timings = dsi_set_timings,
-
 	.dsi = {
 		.update = dsi_update_all,
 		.is_video_mode = dsi_is_video_mode,
@@ -5392,6 +5354,83 @@ static const struct component_ops dsi_component_ops = {
 	.unbind	= dsi_unbind,
 };
 
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
+static int dsi_bridge_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return drm_bridge_attach(bridge->encoder, dsi->output.next_bridge,
+				 bridge, flags);
+}
+
+static enum drm_mode_status
+dsi_bridge_mode_valid(struct drm_bridge *bridge,
+		      const struct drm_display_info *info,
+		      const struct drm_display_mode *mode)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
+	mutex_lock(&dsi->lock);
+	r = __dsi_calc_config(dsi, mode, &ctx);
+	mutex_unlock(&dsi->lock);
+
+	return r ? MODE_CLOCK_RANGE : MODE_OK;
+}
+
+static void dsi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+
+	dsi_set_config(&dsi->output, adjusted_mode);
+}
+
+static void dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+
+	dsi_enable_video_outputs(&dsi->output);
+}
+
+static void dsi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+
+	dsi_disable_video_outputs(&dsi->output);
+}
+
+static const struct drm_bridge_funcs dsi_bridge_funcs = {
+	.attach = dsi_bridge_attach,
+	.mode_valid = dsi_bridge_mode_valid,
+	.mode_set = dsi_bridge_mode_set,
+	.enable = dsi_bridge_enable,
+	.disable = dsi_bridge_disable,
+};
+
+static void dsi_bridge_init(struct dsi_data *dsi)
+{
+	dsi->bridge.funcs = &dsi_bridge_funcs;
+	dsi->bridge.of_node = dsi->host.dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&dsi->bridge);
+}
+
+static void dsi_bridge_cleanup(struct dsi_data *dsi)
+{
+	drm_bridge_remove(&dsi->bridge);
+}
+
 /* -----------------------------------------------------------------------------
  * Probe & Remove, Suspend & Resume
  */
@@ -5401,6 +5440,8 @@ static int dsi_init_output(struct dsi_data *dsi)
 	struct omap_dss_device *out = &dsi->output;
 	int r;
 
+	dsi_bridge_init(dsi);
+
 	out->dev = dsi->dev;
 	out->id = dsi->module_id == 0 ?
 			OMAP_DSS_OUTPUT_DSI1 : OMAP_DSS_OUTPUT_DSI2;
@@ -5415,9 +5456,11 @@ static int dsi_init_output(struct dsi_data *dsi)
 		       | DRM_BUS_FLAG_DE_HIGH
 		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &dsi->bridge);
+	if (r < 0) {
+		dsi_bridge_cleanup(dsi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -5430,6 +5473,7 @@ static void dsi_uninit_output(struct dsi_data *dsi)
 
 	omapdss_device_unregister(out);
 	omapdss_device_cleanup_output(out);
+	dsi_bridge_cleanup(dsi);
 }
 
 static int dsi_probe_of(struct dsi_data *dsi)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
