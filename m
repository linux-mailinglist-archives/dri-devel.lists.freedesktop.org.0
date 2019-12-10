Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619DC119EDA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D286E9FF;
	Tue, 10 Dec 2019 22:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB206E9ED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:22 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 704C413C7;
 Tue, 10 Dec 2019 23:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018700;
 bh=6yTcQkz4MCV4aNrY9t0ASgMokohIXFyq+L3vaXLc+tI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nhS5/ClGDnWt7UdrhNPWm4FkuJjt112SbzzllMJVjTiQg5I3xVceXkmAjYajReZ6R
 D1deRmsJTkyp/6X3lqv3/GlrnrnWWWBiqWT0oE+vbIWdl7iHLxw1XoWAhyKAWaISXO
 3YD3pqX09Xtu676SbduiRt+HV6VQYutgKQ7WMZfs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 19/50] drm/omap: Simplify HDMI mode and infoframe
 configuration
Date: Wed, 11 Dec 2019 00:57:19 +0200
Message-Id: <20191210225750.15709-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the omap_connector_get_hdmi_mode() function as the HDMI mode can
be accessed directly from the connector's display info.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
