Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6B125FC3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9366EB35;
	Thu, 19 Dec 2019 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59B46EB19
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:57 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B227140C;
 Thu, 19 Dec 2019 11:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752355;
 bh=vUP+U5fBoyGa6GNUv+RZ/DyPT1k56wPmvKGHIcPMXeU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RWd6jo0g3+BYKyhIodIpjLe8lMFo4prJSj9LvRC56WYvQEi3rE1kMOHLzz2K1OoCw
 hPBbJ55c6B7vmGSm1kisqu8xy2SuGU0Y8B2RIegLauwAASiNNrJOHbL38DqqLM6lnZ
 evxqLGu8u+cKrHM/gNgkJgNth0xoI2N9r4Dvq3fU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 21/51] drm/omap: Use the drm_panel_bridge API
Date: Thu, 19 Dec 2019 12:44:52 +0200
Message-Id: <20191219104522.9379-22-laurent.pinchart@ideasonboard.com>
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

Replace the manual panel handling code by a drm_panel_bridge. This
simplifies the driver and allows all components in the display pipeline
to be treated as bridges, paving the way to generic connector handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v1:

- Keep #include <drm/drm_panel.h>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 12 ++++-----
 drivers/gpu/drm/omapdrm/dss/output.c     | 31 +++++++++++++++++++++---
 drivers/gpu/drm/omapdrm/omap_connector.c | 10 --------
 drivers/gpu/drm/omapdrm/omap_drv.c       | 13 ----------
 drivers/gpu/drm/omapdrm/omap_encoder.c   | 13 ----------
 5 files changed, 32 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index cae5687822e2..80d48936d177 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -149,8 +149,7 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
 			goto done;
 		}
 
-		if (dssdev->id &&
-		    (dssdev->next || dssdev->bridge || dssdev->panel))
+		if (dssdev->id && (dssdev->next || dssdev->bridge))
 			goto done;
 	}
 
@@ -185,11 +184,10 @@ int omapdss_device_connect(struct dss_device *dss,
 	if (!dst) {
 		/*
 		 * The destination is NULL when the source is connected to a
-		 * bridge or panel instead of a DSS device. Stop here, we will
-		 * attach the bridge or panel later when we will have a DRM
-		 * encoder.
+		 * bridge instead of a DSS device. Stop here, we will attach
+		 * the bridge later when we will have a DRM encoder.
 		 */
-		return src && (src->bridge || src->panel) ? 0 : -EINVAL;
+		return src && src->bridge ? 0 : -EINVAL;
 	}
 
 	if (omapdss_device_is_connected(dst))
@@ -217,7 +215,7 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 		dst ? dev_name(dst->dev) : "NULL");
 
 	if (!dst) {
-		WARN_ON(!src->bridge && !src->panel);
+		WARN_ON(!src->bridge);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 0693d34fca1b..99a253a424c1 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -21,6 +21,7 @@
 int omapdss_device_init_output(struct omap_dss_device *out)
 {
 	struct device_node *remote_node;
+	int ret;
 
 	remote_node = of_graph_get_remote_node(out->dev->of_node,
 					       ffs(out->of_ports) - 1, 0);
@@ -39,17 +40,39 @@ int omapdss_device_init_output(struct omap_dss_device *out)
 
 	if (out->next && out->type != out->next->type) {
 		dev_err(out->dev, "output type and display type don't match\n");
-		omapdss_device_put(out->next);
-		out->next = NULL;
-		return -EINVAL;
+		ret = -EINVAL;
+		goto error;
 	}
 
-	return out->next || out->bridge || out->panel ? 0 : -EPROBE_DEFER;
+	if (out->panel) {
+		struct drm_bridge *bridge;
+
+		bridge = drm_panel_bridge_add(out->panel);
+		if (IS_ERR(bridge)) {
+			dev_err(out->dev,
+				"unable to create panel bridge (%ld)\n",
+				PTR_ERR(bridge));
+			ret = PTR_ERR(bridge);
+			goto error;
+		}
+
+		out->bridge = bridge;
+	}
+
+	return out->next || out->bridge ? 0 : -EPROBE_DEFER;
+
+error:
+	omapdss_device_put(out->next);
+	out->next = NULL;
+	return ret;
 }
 EXPORT_SYMBOL(omapdss_device_init_output);
 
 void omapdss_device_cleanup_output(struct omap_dss_device *out)
 {
+	if (out->bridge && out->panel)
+		drm_panel_bridge_remove(out->bridge);
+
 	if (out->next)
 		omapdss_device_put(out->next);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index 38c7a79c5d4a..b0cb2ecb30ab 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -6,7 +6,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 #include "omap_drv.h"
@@ -190,7 +189,6 @@ static int omap_connector_get_modes_edid(struct drm_connector *connector,
 
 static int omap_connector_get_modes(struct drm_connector *connector)
 {
-	struct omap_connector *omap_connector = to_omap_connector(connector);
 	struct omap_dss_device *dssdev;
 
 	DBG("%s", connector->name);
@@ -213,14 +211,6 @@ static int omap_connector_get_modes(struct drm_connector *connector)
 	if (dssdev)
 		return dssdev->ops->get_modes(dssdev, connector);
 
-	/*
-	 * Otherwise if the display pipeline uses a drm_panel, we delegate the
-	 * operation to the panel API.
-	 */
-	if (omap_connector->output->panel)
-		return drm_panel_get_modes(omap_connector->output->panel,
-					   connector);
-
 	/*
 	 * We can't retrieve modes, which can happen for instance for a DVI or
 	 * VGA output with the DDC bus unconnected. The KMS core will add the
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 390e0662a8b8..aefcf86d4045 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -16,7 +16,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -134,9 +133,6 @@ static void omap_disconnect_pipelines(struct drm_device *ddev)
 	for (i = 0; i < priv->num_pipes; i++) {
 		struct omap_drm_pipeline *pipe = &priv->pipes[i];
 
-		if (pipe->output->panel)
-			drm_panel_detach(pipe->output->panel);
-
 		omapdss_device_disconnect(NULL, pipe->output);
 
 		omapdss_device_put(pipe->output);
@@ -221,8 +217,6 @@ static int omap_display_id(struct omap_dss_device *output)
 			bridge = drm_bridge_get_next_bridge(bridge);
 
 		node = bridge->of_node;
-	} else if (output->panel) {
-		node = output->panel->dev->of_node;
 	}
 
 	return node ? of_alias_get_id(node, "display") : -ENODEV;
@@ -337,13 +331,6 @@ static int omap_modeset_init(struct drm_device *dev)
 				return -ENOMEM;
 
 			drm_connector_attach_encoder(pipe->connector, encoder);
-
-			if (pipe->output->panel) {
-				ret = drm_panel_attach(pipe->output->panel,
-						       pipe->connector);
-				if (ret < 0)
-					return ret;
-			}
 		}
 
 		crtc = omap_crtc_init(dev, pipe, priv->planes[i]);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index cb5aa01d2f87..a270173a2411 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -10,7 +10,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_panel.h>
 
 #include "omap_drv.h"
 
@@ -157,12 +156,6 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 
 	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
 
-	/* Disable the panel if present. */
-	if (dssdev->panel) {
-		drm_panel_disable(dssdev->panel);
-		drm_panel_unprepare(dssdev->panel);
-	}
-
 	/*
 	 * Disable the chain of external devices, starting at the one at the
 	 * internal encoder's output.
@@ -212,12 +205,6 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	 * internal encoder's output.
 	 */
 	omapdss_device_enable(dssdev->next);
-
-	/* Enable the panel if present. */
-	if (dssdev->panel) {
-		drm_panel_prepare(dssdev->panel);
-		drm_panel_enable(dssdev->panel);
-	}
 }
 
 static int omap_encoder_atomic_check(struct drm_encoder *encoder,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
