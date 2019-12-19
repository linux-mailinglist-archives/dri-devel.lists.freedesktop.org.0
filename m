Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201D125FAF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50A76EB20;
	Thu, 19 Dec 2019 10:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6DE6EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:19 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A9A018C0;
 Thu, 19 Dec 2019 11:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752377;
 bh=WRJkPDhrb0t8ftKEE2f2GAu+/3QCnlI2vzvitER4lcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u46X3jFGqGp0OrE4x10Q2fXupqAqG5WFc2HY/MBgk6JdnpJq4GkroVFtyf1qQzwZA
 lG3GtDnlFqX2xunhy+tedInc9dOFLzKvhMi8Gp2UBwKbfKcJ+dPOUOgcfKVLq4wL6K
 sQEW0/JatEodW5a8OVj+6QqXWzFa9qbghePM3eUI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 48/51] drm/omap: Hardcode omap_connector type to DSI
Date: Thu, 19 Dec 2019 12:45:19 +0200
Message-Id: <20191219104522.9379-49-laurent.pinchart@ideasonboard.com>
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

The omap_connector implementation is now used for DSI only. Hardcode its
type and drop unused code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 23 ------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |  1 -
 drivers/gpu/drm/omapdrm/omap_connector.c | 31 ++----------------------
 3 files changed, 2 insertions(+), 53 deletions(-)

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
