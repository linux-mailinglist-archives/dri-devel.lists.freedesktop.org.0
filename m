Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB0147761
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4DA6FEEE;
	Fri, 24 Jan 2020 03:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96E6FEDA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:23 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A151E3ABC;
 Fri, 24 Jan 2020 04:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838118;
 bh=6nXqbmN16IjqR41s66OSd6D2iDHURL/MPQbiBJvDOCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HU8p4rowD26w5bY/p9R9d+yPdP2q61X7GgpcquHLE/8TY9q6u0m8S9Z0QW6mKefMv
 CGLHn5MZhBCmwMafUGVYoBueUTqwv22N7m89oLL0+noAlSoiZp5587QYVaxcW5jzoW
 N5bls6/IfCWC5S44c0bVkR+Ov0mVRzxWIPTHrFMo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 21/52] drm/omap: Factor out display type to connector type
 conversion
Date: Fri, 24 Jan 2020 05:54:14 +0200
Message-Id: <20200124035445.1830-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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
