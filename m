Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8407125FAB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298686EB1A;
	Thu, 19 Dec 2019 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522666EB15
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:56 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D52EB1367;
 Thu, 19 Dec 2019 11:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752354;
 bh=QbhAwNSi/hveDJ5+S7Y5NdmlGXxsSahTwbVpBV/HcP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HPWtCMebnWmGvPG4hmVOazh0XwwFMsZaBTFp+ZFs7K8eR+FvqrhJUCLuFVI3b9S9J
 ZaFWsYGrIh/HXgC1tHtqLJilAPNMgccKaEiueMqvCzsYoaQq4NgLb4xrvjz2zD/2RR
 dzuIBnrTE8Ow7FrP5fvzOCYsZ85FaLFRWKqURFgw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 19/51] drm/omap: Simplify HDMI mode and infoframe
 configuration
Date: Thu, 19 Dec 2019 12:44:50 +0200
Message-Id: <20191219104522.9379-20-laurent.pinchart@ideasonboard.com>
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

Remove the omap_connector_get_hdmi_mode() function as the HDMI mode can
be accessed directly from the connector's display info.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/omapdrm/omap_connector.c | 11 -----------
 drivers/gpu/drm/omapdrm/omap_connector.h |  1 -
 drivers/gpu/drm/omapdrm/omap_encoder.c   |  4 +---
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index 94cded387174..88dbf3fa473f 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -21,7 +21,6 @@ struct omap_connector {
 	struct drm_connector base;
 	struct omap_dss_device *output;
 	struct omap_dss_device *hpd;
-	bool hdmi_mode;
 };
 
 static void omap_connector_hpd_notify(struct drm_connector *connector,
@@ -84,13 +83,6 @@ void omap_connector_disable_hpd(struct drm_connector *connector)
 		hpd->ops->unregister_hpd_cb(hpd);
 }
 
-bool omap_connector_get_hdmi_mode(struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-
-	return omap_connector->hdmi_mode;
-}
-
 static struct omap_dss_device *
 omap_connector_find_device(struct drm_connector *connector,
 			   enum omap_dss_device_ops_flag op)
@@ -167,7 +159,6 @@ static void omap_connector_destroy(struct drm_connector *connector)
 static int omap_connector_get_modes_edid(struct drm_connector *connector,
 					 struct omap_dss_device *dssdev)
 {
-	struct omap_connector *omap_connector = to_omap_connector(connector);
 	enum drm_connector_status status;
 	void *edid;
 	int n;
@@ -189,8 +180,6 @@ static int omap_connector_get_modes_edid(struct drm_connector *connector,
 	drm_connector_update_edid_property(connector, edid);
 	n = drm_add_edid_modes(connector, edid);
 
-	omap_connector->hdmi_mode = drm_detect_hdmi_monitor(edid);
-
 	kfree(edid);
 	return n;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.h b/drivers/gpu/drm/omapdrm/omap_connector.h
index 13607bda33d8..4aa5608f4bbe 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.h
+++ b/drivers/gpu/drm/omapdrm/omap_connector.h
@@ -21,7 +21,6 @@ struct omap_dss_device;
 struct drm_connector *omap_connector_init(struct drm_device *dev,
 					  struct omap_dss_device *output,
 					  struct drm_encoder *encoder);
-bool omap_connector_get_hdmi_mode(struct drm_connector *connector);
 void omap_connector_enable_hpd(struct drm_connector *connector);
 void omap_connector_disable_hpd(struct drm_connector *connector);
 enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 4f2165a37795..cb5aa01d2f87 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -76,9 +76,7 @@ static void omap_encoder_hdmi_mode_set(struct drm_connector *connector,
 {
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *dssdev = omap_encoder->output;
-	bool hdmi_mode;
-
-	hdmi_mode = omap_connector_get_hdmi_mode(connector);
+	bool hdmi_mode = connector->display_info.is_hdmi;
 
 	if (dssdev->ops->hdmi.set_hdmi_mode)
 		dssdev->ops->hdmi.set_hdmi_mode(dssdev, hdmi_mode);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
