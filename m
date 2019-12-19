Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D49F125FCB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF436EB52;
	Thu, 19 Dec 2019 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA5B6EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:17 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 461F61864;
 Thu, 19 Dec 2019 11:46:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752374;
 bh=o5iTP8dErF0h9u3GdIrzPltjvNzim995sQ3YoavWugI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NvXtSMHMzjdb4FbBHxaAv1iI/NxedewikgmVQd+EHNdUHV75g4S30FkAw7G9DNA+N
 Mv5yYDx7DmHdEiKzRdDQ3B5XVe2SHPZqpttv8+/bZok0qhgEHoVWaBB4iJq/1q1IuQ
 Q53SISyZpxsM4MC23sCgXiYUjb3PVdDJGFLxHjN8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 45/51] drm/omap: dpi: Register a drm_bridge
Date: Thu, 19 Dec 2019 12:45:16 +0200
Message-Id: <20191219104522.9379-46-laurent.pinchart@ideasonboard.com>
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

In order to integrate with a chain of drm_bridge, the internal DPI
output has to expose its operations through the drm_bridge API.
Register a bridge at initialisation time to do so and remove the
omap_dss_device operations that are now unused.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Drop unneeded lock

Changes since v2:

- Unregister bridge if port initialisation fails
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 211 +++++++++++++++++-------------
 1 file changed, 118 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index c167bd1116ec..f1b2d1c5bfa6 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -21,6 +21,8 @@
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
+#include <drm/drm_bridge.h>
+
 #include "dss.h"
 #include "omapdss.h"
 
@@ -34,19 +36,15 @@ struct dpi_data {
 	enum dss_clk_source clk_src;
 	struct dss_pll *pll;
 
-	struct mutex lock;
-
 	struct dss_lcd_mgr_config mgr_config;
 	unsigned long pixelclock;
 	int data_lines;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 };
 
-static struct dpi_data *dpi_get_data_from_dssdev(struct omap_dss_device *dssdev)
-{
-	return container_of(dssdev, struct dpi_data, output);
-}
+#define drm_bridge_to_dpi(bridge) container_of(bridge, struct dpi_data, bridge)
 
 /* -----------------------------------------------------------------------------
  * Clock Handling and PLL
@@ -354,6 +352,32 @@ static void dpi_config_lcd_manager(struct dpi_data *dpi)
 	dss_mgr_set_lcd_config(&dpi->output, &dpi->mgr_config);
 }
 
+static int dpi_clock_update(struct dpi_data *dpi, unsigned long *clock)
+{
+	int lck_div, pck_div;
+	unsigned long fck;
+	struct dpi_clk_calc_ctx ctx;
+
+	if (dpi->pll) {
+		if (!dpi_pll_clk_calc(dpi, *clock, &ctx))
+			return -EINVAL;
+
+		fck = ctx.pll_cinfo.clkout[ctx.clkout_idx];
+	} else {
+		if (!dpi_dss_clk_calc(dpi, *clock, &ctx))
+			return -EINVAL;
+
+		fck = ctx.fck;
+	}
+
+	lck_div = ctx.dispc_cinfo.lck_div;
+	pck_div = ctx.dispc_cinfo.pck_div;
+
+	*clock = fck / lck_div / pck_div;
+
+	return 0;
+}
+
 static int dpi_verify_pll(struct dss_pll *pll)
 {
 	int r;
@@ -391,44 +415,87 @@ static void dpi_init_pll(struct dpi_data *dpi)
 }
 
 /* -----------------------------------------------------------------------------
- * omap_dss_device Operations
+ * DRM Bridge Operations
  */
 
-static int dpi_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
+static int dpi_bridge_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
 {
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dst);
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
 
 	dpi_init_pll(dpi);
 
-	return omapdss_device_connect(dst->dss, dst, dst->next);
+	return drm_bridge_attach(bridge->encoder, dpi->output.next_bridge,
+				 bridge, flags);
 }
 
-static void dpi_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
+static enum drm_mode_status
+dpi_bridge_mode_valid(struct drm_bridge *bridge,
+		       const struct drm_display_mode *mode)
 {
-	omapdss_device_disconnect(dst, dst->next);
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
+	unsigned long clock = mode->clock * 1000;
+	int ret;
+
+	if (mode->hdisplay % 8 != 0)
+		return MODE_BAD_WIDTH;
+
+	if (mode->clock == 0)
+		return MODE_NOCLOCK;
+
+	ret = dpi_clock_update(dpi, &clock);
+	if (ret < 0)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
 }
 
-static void dpi_display_enable(struct omap_dss_device *dssdev)
+static bool dpi_bridge_mode_fixup(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   struct drm_display_mode *adjusted_mode)
 {
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
-	struct omap_dss_device *out = &dpi->output;
-	int r;
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
+	unsigned long clock = mode->clock * 1000;
+	int ret;
+
+	ret = dpi_clock_update(dpi, &clock);
+	if (ret < 0)
+		return false;
+
+	adjusted_mode->clock = clock / 1000;
+
+	return true;
+}
 
-	mutex_lock(&dpi->lock);
+static void dpi_bridge_mode_set(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 const struct drm_display_mode *adjusted_mode)
+{
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
+
+	dpi->pixelclock = adjusted_mode->clock * 1000;
+}
+
+static void dpi_bridge_enable(struct drm_bridge *bridge,
+			       struct drm_atomic_state *state)
+{
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
+	int r;
 
 	if (dpi->vdds_dsi_reg) {
 		r = regulator_enable(dpi->vdds_dsi_reg);
 		if (r)
-			goto err_reg_enable;
+			return;
 	}
 
 	r = dispc_runtime_get(dpi->dss->dispc);
 	if (r)
 		goto err_get_dispc;
 
-	r = dss_dpi_select_source(dpi->dss, dpi->id, out->dispc_channel);
+	r = dss_dpi_select_source(dpi->dss, dpi->id, dpi->output.dispc_channel);
 	if (r)
 		goto err_src_sel;
 
@@ -450,8 +517,6 @@ static void dpi_display_enable(struct omap_dss_device *dssdev)
 	if (r)
 		goto err_mgr_enable;
 
-	mutex_unlock(&dpi->lock);
-
 	return;
 
 err_mgr_enable:
@@ -464,15 +529,12 @@ static void dpi_display_enable(struct omap_dss_device *dssdev)
 err_get_dispc:
 	if (dpi->vdds_dsi_reg)
 		regulator_disable(dpi->vdds_dsi_reg);
-err_reg_enable:
-	mutex_unlock(&dpi->lock);
 }
 
-static void dpi_display_disable(struct omap_dss_device *dssdev)
+static void dpi_bridge_disable(struct drm_bridge *bridge,
+				struct drm_atomic_state *state)
 {
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
-
-	mutex_lock(&dpi->lock);
+	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
 
 	dss_mgr_disable(&dpi->output);
 
@@ -486,74 +548,34 @@ static void dpi_display_disable(struct omap_dss_device *dssdev)
 
 	if (dpi->vdds_dsi_reg)
 		regulator_disable(dpi->vdds_dsi_reg);
-
-	mutex_unlock(&dpi->lock);
 }
 
-static int dpi_check_timings(struct omap_dss_device *dssdev,
-			     struct drm_display_mode *mode)
-{
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
-	int lck_div, pck_div;
-	unsigned long fck;
-	unsigned long pck;
-	struct dpi_clk_calc_ctx ctx;
-	bool ok;
-
-	if (mode->hdisplay % 8 != 0)
-		return -EINVAL;
-
-	if (mode->clock == 0)
-		return -EINVAL;
-
-	if (dpi->pll) {
-		ok = dpi_pll_clk_calc(dpi, mode->clock * 1000, &ctx);
-		if (!ok)
-			return -EINVAL;
-
-		fck = ctx.pll_cinfo.clkout[ctx.clkout_idx];
-	} else {
-		ok = dpi_dss_clk_calc(dpi, mode->clock * 1000, &ctx);
-		if (!ok)
-			return -EINVAL;
-
-		fck = ctx.fck;
-	}
-
-	lck_div = ctx.dispc_cinfo.lck_div;
-	pck_div = ctx.dispc_cinfo.pck_div;
-
-	pck = fck / lck_div / pck_div;
+static const struct drm_bridge_funcs dpi_bridge_funcs = {
+	.attach = dpi_bridge_attach,
+	.mode_valid = dpi_bridge_mode_valid,
+	.mode_fixup = dpi_bridge_mode_fixup,
+	.mode_set = dpi_bridge_mode_set,
+	.atomic_enable = dpi_bridge_enable,
+	.atomic_disable = dpi_bridge_disable,
+};
 
-	mode->clock = pck / 1000;
+static void dpi_bridge_init(struct dpi_data *dpi)
+{
+	dpi->bridge.funcs = &dpi_bridge_funcs;
+	dpi->bridge.of_node = dpi->pdev->dev.of_node;
+	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	return 0;
+	drm_bridge_add(&dpi->bridge);
 }
 
-static void dpi_set_timings(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode)
+static void dpi_bridge_cleanup(struct dpi_data *dpi)
 {
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
-
-	DSSDBG("dpi_set_timings\n");
-
-	mutex_lock(&dpi->lock);
-
-	dpi->pixelclock = mode->clock * 1000;
-
-	mutex_unlock(&dpi->lock);
+	drm_bridge_remove(&dpi->bridge);
 }
 
-static const struct omap_dss_device_ops dpi_ops = {
-	.connect = dpi_connect,
-	.disconnect = dpi_disconnect,
-
-	.enable = dpi_display_enable,
-	.disable = dpi_display_disable,
-
-	.check_timings = dpi_check_timings,
-	.set_timings = dpi_set_timings,
-};
+/* -----------------------------------------------------------------------------
+ * Initialisation and Cleanup
+ */
 
 /*
  * Return a hardcoded channel for the DPI output. This should work for
@@ -597,6 +619,8 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	u32 port_num = 0;
 	int r;
 
+	dpi_bridge_init(dpi);
+
 	of_property_read_u32(port, "reg", &port_num);
 	dpi->id = port_num <= 2 ? port_num : 0;
 
@@ -618,12 +642,13 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	out->type = OMAP_DISPLAY_TYPE_DPI;
 	out->dispc_channel = dpi_get_channel(dpi);
 	out->of_port = port_num;
-	out->ops = &dpi_ops;
 	out->owner = THIS_MODULE;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &dpi->bridge);
+	if (r < 0) {
+		dpi_bridge_cleanup(dpi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -637,6 +662,8 @@ static void dpi_uninit_output_port(struct device_node *port)
 
 	omapdss_device_unregister(out);
 	omapdss_device_cleanup_output(out);
+
+	dpi_bridge_cleanup(dpi);
 }
 
 /* -----------------------------------------------------------------------------
@@ -702,8 +729,6 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	dpi->dss = dss;
 	port->data = dpi;
 
-	mutex_init(&dpi->lock);
-
 	r = dpi_init_regulator(dpi);
 	if (r)
 		return r;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
