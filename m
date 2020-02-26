Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E516FD7E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9A66E527;
	Wed, 26 Feb 2020 11:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230C6E584
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:25:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7502143F;
 Wed, 26 Feb 2020 12:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716351;
 bh=qinY8XbaS7Lv2wLfKzi/CiS3JWm56fGMSHFSBWHFW8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UONhElCA2WYiZlyFTondHb//7p+6kSrg9Hle9VeIZhhfWO+zRDmSDk8H3FY6OlEk1
 w1aiGnHlzj2rqQWGI9HoJmvnwVG3+jBpjvL2KJkFE3uWVxKypcxepTr7u9eQ3Lgrdk
 Y3KFZITOPSafwRr504cSL63IngWV+FkXCiu8GKFM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 23/54] drm/omap: Factor out display type to connector type
 conversion
Date: Wed, 26 Feb 2020 13:24:43 +0200
Message-Id: <20200226112514.12455-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
References: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the code that computes the DRM connector type for the
omapdss_device display type to a new omapdss_device_connector_type()
function for later reuse.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 23 +++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |  1 +
 drivers/gpu/drm/omapdrm/omap_connector.c | 19 +------------------
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index a1970b9db6ab..cae5687822e2 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -285,6 +285,29 @@ void omapdss_device_post_disable(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
 
+unsigned int omapdss_device_connector_type(enum omap_display_type type)
+{
+	switch (type) {
+	case OMAP_DISPLAY_TYPE_HDMI:
+		return DRM_MODE_CONNECTOR_HDMIA;
+	case OMAP_DISPLAY_TYPE_DVI:
+		return DRM_MODE_CONNECTOR_DVID;
+	case OMAP_DISPLAY_TYPE_DSI:
+		return DRM_MODE_CONNECTOR_DSI;
+	case OMAP_DISPLAY_TYPE_DPI:
+	case OMAP_DISPLAY_TYPE_DBI:
+		return DRM_MODE_CONNECTOR_DPI;
+	case OMAP_DISPLAY_TYPE_VENC:
+		/* TODO: This could also be composite */
+		return DRM_MODE_CONNECTOR_SVIDEO;
+	case OMAP_DISPLAY_TYPE_SDI:
+		return DRM_MODE_CONNECTOR_LVDS;
+	default:
+		return DRM_MODE_CONNECTOR_Unknown;
+	}
+}
+EXPORT_SYMBOL_GPL(omapdss_device_connector_type);
+
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 79f6b195c7cf..c5672e5174c5 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -479,6 +479,7 @@ void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
 void omapdss_device_enable(struct omap_dss_device *dssdev);
 void omapdss_device_disable(struct omap_dss_device *dssdev);
 void omapdss_device_post_disable(struct omap_dss_device *dssdev);
+unsigned int omapdss_device_connector_type(enum omap_display_type type);
 
 int omap_dss_get_num_overlay_managers(void);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index 88dbf3fa473f..38c7a79c5d4a 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -296,24 +296,7 @@ static int omap_connector_get_type(struct omap_dss_device *output)
 	type = display->type;
 	omapdss_device_put(display);
 
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
+	return omapdss_device_connector_type(type);
 }
 
 /* initialize connector */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
