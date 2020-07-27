Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984A222E3DD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B486E167;
	Mon, 27 Jul 2020 02:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E756E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:12 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5835BA12;
 Mon, 27 Jul 2020 04:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815626;
 bh=KyO+I215Lg7CMtiWnUPkRc5zISqdinL15NjvDiuISSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iFW98Nf6IJ2JJ91cE/Rrj9e2FkYKqKP1iwz1rd5NRjlFnfb4lvu3QP1hIb/q9mecg
 ViIp8gQlEqU1ImSA/cw39kDJ0Su04oxsbUCW6Gi+pyLyBKxKK2MGDZRyWm3bxXshAE
 2VLOlC52c1tABMVRQFblTMILSBBjWjg73whlqIqo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/22] drm: mxsfb: Use drm_panel_bridge
Date: Mon, 27 Jul 2020 05:06:34 +0300
Message-Id: <20200727020654.8231-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the manual connector implementation based on drm_panel with the
drm_panel_bridge helper. This simplifies the mxsfb driver by removing
connector-related code, and standardizing all pipeline control
operations on bridges.

A hack is needed to get hold of the connector, as that's our only source
of bus flags and formats for now. As soon as the bridge API provides us
with that information this can be fixed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
Changes since v2:

- Use drm_panel_bridge_add_typed()

Changes since v1:

- Select DRM_PANEL_BRIDGE in Kconfig
---
 drivers/gpu/drm/mxsfb/Kconfig     |   1 +
 drivers/gpu/drm/mxsfb/Makefile    |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 105 ++++++++++++++----------------
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |   5 +-
 drivers/gpu/drm/mxsfb/mxsfb_out.c |  99 ----------------------------
 5 files changed, 55 insertions(+), 157 deletions(-)
 delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 0dca8f27169e..e43b326e9147 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -13,6 +13,7 @@ config DRM_MXSFB
 	select DRM_KMS_FB_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
 	  LCD controller.
diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
index ff6e358088fa..811584e54ad1 100644
--- a/drivers/gpu/drm/mxsfb/Makefile
+++ b/drivers/gpu/drm/mxsfb/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mxsfb-y := mxsfb_drv.o mxsfb_crtc.o mxsfb_out.o
+mxsfb-y := mxsfb_drv.o mxsfb_crtc.o
 obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 79cd2511a86b..689f50b1ef68 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -29,7 +29,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_irq.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -105,29 +104,11 @@ static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
 			      struct drm_crtc_state *crtc_state,
 			      struct drm_plane_state *plane_state)
 {
-	struct drm_connector *connector;
 	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
 	struct drm_device *drm = pipe->plane.dev;
 
-	if (!mxsfb->connector) {
-		list_for_each_entry(connector,
-				    &drm->mode_config.connector_list,
-				    head)
-			if (connector->encoder == &mxsfb->pipe.encoder) {
-				mxsfb->connector = connector;
-				break;
-			}
-	}
-
-	if (!mxsfb->connector) {
-		dev_warn(drm->dev, "No connector attached, using default\n");
-		mxsfb->connector = &mxsfb->panel_connector;
-	}
-
 	pm_runtime_get_sync(drm->dev);
-	drm_panel_prepare(mxsfb->panel);
 	mxsfb_crtc_enable(mxsfb);
-	drm_panel_enable(mxsfb->panel);
 }
 
 static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
@@ -137,9 +118,7 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_pending_vblank_event *event;
 
-	drm_panel_disable(mxsfb->panel);
 	mxsfb_crtc_disable(mxsfb);
-	drm_panel_unprepare(mxsfb->panel);
 	pm_runtime_put_sync(drm->dev);
 
 	spin_lock_irq(&drm->event_lock);
@@ -149,9 +128,6 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
 		drm_crtc_send_vblank_event(crtc, event);
 	}
 	spin_unlock_irq(&drm->event_lock);
-
-	if (mxsfb->connector != &mxsfb->panel_connector)
-		mxsfb->connector = NULL;
 }
 
 static void mxsfb_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -195,6 +171,49 @@ static struct drm_simple_display_pipe_funcs mxsfb_funcs = {
 	.disable_vblank	= mxsfb_pipe_disable_vblank,
 };
 
+static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_device *drm = mxsfb->drm;
+	struct drm_connector_list_iter iter;
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
+					  &bridge);
+	if (ret)
+		return ret;
+
+	if (panel) {
+		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
+							 DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
+
+	if (!bridge)
+		return -ENODEV;
+
+	ret = drm_simple_display_pipe_attach_bridge(&mxsfb->pipe, bridge);
+	if (ret) {
+		DRM_DEV_ERROR(drm->dev,
+			      "failed to attach bridge: %d\n", ret);
+		return ret;
+	}
+
+	mxsfb->bridge = bridge;
+
+	/*
+	 * Get hold of the connector. This is a bit of a hack, until the bridge
+	 * API gives us bus flags and formats.
+	 */
+	drm_connector_list_iter_begin(drm, &iter);
+	mxsfb->connector = drm_connector_list_iter_next(&iter);
+	drm_connector_list_iter_end(&iter);
+
+	return 0;
+}
+
 static int mxsfb_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
@@ -206,6 +225,7 @@ static int mxsfb_load(struct drm_device *drm)
 	if (!mxsfb)
 		return -ENOMEM;
 
+	mxsfb->drm = drm;
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = &mxsfb_devdata[pdev->id_entry->driver_data];
 
@@ -241,41 +261,18 @@ static int mxsfb_load(struct drm_device *drm)
 	/* Modeset init */
 	drm_mode_config_init(drm);
 
-	ret = mxsfb_create_output(drm);
-	if (ret < 0) {
-		dev_err(drm->dev, "Failed to create outputs\n");
-		goto err_vblank;
-	}
-
 	ret = drm_simple_display_pipe_init(drm, &mxsfb->pipe, &mxsfb_funcs,
 			mxsfb_formats, ARRAY_SIZE(mxsfb_formats),
-			mxsfb_modifiers, mxsfb->connector);
+			mxsfb_modifiers, NULL);
 	if (ret < 0) {
 		dev_err(drm->dev, "Cannot setup simple display pipe\n");
 		goto err_vblank;
 	}
 
-	/*
-	 * Attach panel only if there is one.
-	 * If there is no panel attach, it must be a bridge. In this case, we
-	 * need a reference to its connector for a proper initialization.
-	 * We will do this check in pipe->enable(), since the connector won't
-	 * be attached to an encoder until then.
-	 */
-
-	if (mxsfb->panel) {
-		ret = drm_panel_attach(mxsfb->panel, mxsfb->connector);
-		if (ret) {
-			dev_err(drm->dev, "Cannot connect panel: %d\n", ret);
-			goto err_vblank;
-		}
-	} else if (mxsfb->bridge) {
-		ret = drm_simple_display_pipe_attach_bridge(&mxsfb->pipe,
-							    mxsfb->bridge);
-		if (ret) {
-			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
-			goto err_vblank;
-		}
+	ret = mxsfb_attach_bridge(mxsfb);
+	if (ret) {
+		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
+		goto err_vblank;
 	}
 
 	drm->mode_config.min_width	= MXSFB_MIN_XRES;
@@ -293,7 +290,7 @@ static int mxsfb_load(struct drm_device *drm)
 
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to install IRQ handler\n");
-		goto err_irq;
+		goto err_vblank;
 	}
 
 	drm_kms_helper_poll_init(drm);
@@ -304,8 +301,6 @@ static int mxsfb_load(struct drm_device *drm)
 
 	return 0;
 
-err_irq:
-	drm_panel_detach(mxsfb->panel);
 err_vblank:
 	pm_runtime_disable(drm->dev);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 0b65b5194a9c..0e3e5a63bbf9 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -8,6 +8,8 @@
 #ifndef __MXSFB_DRV_H__
 #define __MXSFB_DRV_H__
 
+struct drm_device;
+
 struct mxsfb_devdata {
 	unsigned int	 transfer_count;
 	unsigned int	 cur_buf;
@@ -26,10 +28,9 @@ struct mxsfb_drm_private {
 	struct clk			*clk_axi;
 	struct clk			*clk_disp_axi;
 
+	struct drm_device		*drm;
 	struct drm_simple_display_pipe	pipe;
-	struct drm_connector		panel_connector;
 	struct drm_connector		*connector;
-	struct drm_panel		*panel;
 	struct drm_bridge		*bridge;
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
deleted file mode 100644
index 9eca1605d11d..000000000000
--- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 Marek Vasut <marex@denx.de>
- */
-
-#include <linux/of_graph.h>
-
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
-#include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_of.h>
-#include <drm/drm_panel.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
-#include "mxsfb_drv.h"
-
-static struct mxsfb_drm_private *
-drm_connector_to_mxsfb_drm_private(struct drm_connector *connector)
-{
-	return container_of(connector, struct mxsfb_drm_private,
-			    panel_connector);
-}
-
-static int mxsfb_panel_get_modes(struct drm_connector *connector)
-{
-	struct mxsfb_drm_private *mxsfb =
-			drm_connector_to_mxsfb_drm_private(connector);
-
-	if (mxsfb->panel)
-		return drm_panel_get_modes(mxsfb->panel, connector);
-
-	return 0;
-}
-
-static const struct
-drm_connector_helper_funcs mxsfb_panel_connector_helper_funcs = {
-	.get_modes = mxsfb_panel_get_modes,
-};
-
-static enum drm_connector_status
-mxsfb_panel_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct mxsfb_drm_private *mxsfb =
-			drm_connector_to_mxsfb_drm_private(connector);
-
-	if (mxsfb->panel)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
-}
-
-static void mxsfb_panel_connector_destroy(struct drm_connector *connector)
-{
-	struct mxsfb_drm_private *mxsfb =
-			drm_connector_to_mxsfb_drm_private(connector);
-
-	if (mxsfb->panel)
-		drm_panel_detach(mxsfb->panel);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
-	.detect			= mxsfb_panel_connector_detect,
-	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= mxsfb_panel_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-};
-
-int mxsfb_create_output(struct drm_device *drm)
-{
-	struct mxsfb_drm_private *mxsfb = drm->dev_private;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0,
-					  &mxsfb->panel, &mxsfb->bridge);
-	if (ret)
-		return ret;
-
-	if (mxsfb->panel) {
-		mxsfb->connector = &mxsfb->panel_connector;
-		mxsfb->connector->dpms = DRM_MODE_DPMS_OFF;
-		mxsfb->connector->polled = 0;
-		drm_connector_helper_add(mxsfb->connector,
-					 &mxsfb_panel_connector_helper_funcs);
-		ret = drm_connector_init(drm, mxsfb->connector,
-					 &mxsfb_panel_connector_funcs,
-					 DRM_MODE_CONNECTOR_Unknown);
-	}
-
-	return ret;
-}
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
