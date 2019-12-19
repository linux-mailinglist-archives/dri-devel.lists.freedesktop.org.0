Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BD125FC0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39AA6EB3A;
	Thu, 19 Dec 2019 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548E96EB18
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:57 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA8C134D;
 Thu, 19 Dec 2019 11:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752354;
 bh=6nXqbmN16IjqR41s66OSd6D2iDHURL/MPQbiBJvDOCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vw+CGqbycCT9MWHV5eIE8SwScz0/Rgie7Dyn0qop/aeUlkCf1CLSB7rNTePPakeN1
 BFhB8juUv5/4vRmACXlZowFTBsZ6MHbOcOwFkGAwXon39/x2UrVQF5MIvTvP7bVrlF
 O3XlNGl7hdADbmHnLaU4NgsDlj3F9onZZct+SUZU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 20/51] drm/omap: Factor out display type to connector type
 conversion
Date: Thu, 19 Dec 2019 12:44:51 +0200
Message-Id: <20191219104522.9379-21-laurent.pinchart@ideasonboard.com>
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

Move the code that computes the DRM connector type for the
omapdss_device display type to a new omapdss_device_connector_type()
function for later reuse.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
