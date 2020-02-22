Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C3168F9C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D0C6E949;
	Sat, 22 Feb 2020 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C426E921
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:02:09 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BA9840CB;
 Sat, 22 Feb 2020 16:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383726;
 bh=6lbdO4VQnLz+O5T2YeOq/PB102kaTIK4sRDxdIBTD10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fjJH8X60+/BvvSDtvKb5Am3Lo70vt3oTX3o4tXaE7QDzegTpWpVl4xoT3InAg9v2Y
 eKAzmAeJJQHgwB/GW9F7WArkfQV/Ur5tboS/Eaefcm3bM4j03Meyc/Ms6T37ivvG0s
 lm9SHICqzGs5o2wUj/96mTAGMatFX9whkekv1Ea0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 38/54] drm/omap: Create connector for bridges
Date: Sat, 22 Feb 2020 17:00:50 +0200
Message-Id: <20200222150106.22919-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_bridge_connector helper to create a connector for pipelines
that use drm_bridge. This allows splitting connector operations across
multiple bridges when necessary, instead of having the last bridge in
the chain creating the connector and handling all connector operations
internally.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes since v3:

- Remove outdated comment

Changes since v1:

- Squash with patch "drm/omap: Detach from panels at remove time"
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 74 +++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 1df509342b5d..47afa37055b3 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -12,10 +12,12 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -291,9 +293,14 @@ static int omap_modeset_init(struct drm_device *dev)
 
 		if (pipe->output->bridge) {
 			ret = drm_bridge_attach(pipe->encoder,
-						pipe->output->bridge, NULL, 0);
-			if (ret < 0)
+						pipe->output->bridge, NULL,
+						DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+			if (ret < 0) {
+				dev_err(priv->dev,
+					"unable to attach bridge %pOF\n",
+					pipe->output->bridge->of_node);
 				return ret;
+			}
 		}
 
 		id = omap_display_id(pipe->output);
@@ -329,8 +336,23 @@ static int omap_modeset_init(struct drm_device *dev)
 							      encoder);
 			if (!pipe->connector)
 				return -ENOMEM;
+		} else {
+			pipe->connector = drm_bridge_connector_init(dev, encoder);
+			if (IS_ERR(pipe->connector)) {
+				dev_err(priv->dev,
+					"unable to create bridge connector for %s\n",
+					pipe->output->name);
+				return PTR_ERR(pipe->connector);
+			}
+		}
 
-			drm_connector_attach_encoder(pipe->connector, encoder);
+		drm_connector_attach_encoder(pipe->connector, encoder);
+
+		if (pipe->output->panel) {
+			ret = drm_panel_attach(pipe->output->panel,
+					       pipe->connector);
+			if (ret < 0)
+				return ret;
 		}
 
 		crtc = omap_crtc_init(dev, pipe, priv->planes[i]);
@@ -369,6 +391,23 @@ static int omap_modeset_init(struct drm_device *dev)
 	return 0;
 }
 
+static void omap_modeset_fini(struct drm_device *ddev)
+{
+	struct omap_drm_private *priv = ddev->dev_private;
+	unsigned int i;
+
+	omap_drm_irq_uninstall(ddev);
+
+	for (i = 0; i < priv->num_pipes; i++) {
+		struct omap_drm_pipeline *pipe = &priv->pipes[i];
+
+		if (pipe->output->panel)
+			drm_panel_detach(pipe->output->panel);
+	}
+
+	drm_mode_config_cleanup(ddev);
+}
+
 /*
  * Enable the HPD in external components if supported
  */
@@ -378,8 +417,15 @@ static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
 	unsigned int i;
 
 	for (i = 0; i < priv->num_pipes; i++) {
-		if (priv->pipes[i].connector)
-			omap_connector_enable_hpd(priv->pipes[i].connector);
+		struct drm_connector *connector = priv->pipes[i].connector;
+
+		if (!connector)
+			continue;
+
+		if (priv->pipes[i].output->next)
+			omap_connector_enable_hpd(connector);
+		else
+			drm_bridge_connector_enable_hpd(connector);
 	}
 }
 
@@ -392,8 +438,15 @@ static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
 	unsigned int i;
 
 	for (i = 0; i < priv->num_pipes; i++) {
-		if (priv->pipes[i].connector)
-			omap_connector_disable_hpd(priv->pipes[i].connector);
+		struct drm_connector *connector = priv->pipes[i].connector;
+
+		if (!connector)
+			continue;
+
+		if (priv->pipes[i].output->next)
+			omap_connector_disable_hpd(connector);
+		else
+			drm_bridge_connector_disable_hpd(connector);
 	}
 }
 
@@ -616,8 +669,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_fbdev_fini(ddev);
 err_cleanup_modeset:
-	drm_mode_config_cleanup(ddev);
-	omap_drm_irq_uninstall(ddev);
+	omap_modeset_fini(ddev);
 err_gem_deinit:
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
@@ -642,9 +694,7 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_atomic_helper_shutdown(ddev);
 
-	drm_mode_config_cleanup(ddev);
-
-	omap_drm_irq_uninstall(ddev);
+	omap_modeset_fini(ddev);
 	omap_gem_deinit(ddev);
 
 	destroy_workqueue(priv->wq);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
