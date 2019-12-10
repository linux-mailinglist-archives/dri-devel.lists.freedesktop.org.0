Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51B119EDF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2146EA0F;
	Tue, 10 Dec 2019 22:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB306E9F1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:36 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF941215;
 Tue, 10 Dec 2019 23:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018714;
 bh=CfJeilaI6Q1MDtvOCpSLZbd0N8LgBzMnGMd3luD8pkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TU3HcU4Er6/NGUgYDi06iVQxCBBBgemtUyBEA8rqosIY1OWrER2UK7UQ/5h3Urfw4
 6GwkzXvqzF93zpMdL3Xo4YmcAooiHodueTNHFR0CVHSoMLxjHrOQU+HZokM1CxtMex
 jtE6yhieRtXaK6Ej3qi5gHZtRd2egR46u6pCoR34=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 33/50] drm/omap: dss: Remove .set_hdmi_mode() and
 .set_infoframe() operations
Date: Wed, 11 Dec 2019 00:57:33 +0200
Message-Id: <20191210225750.15709-34-laurent.pinchart@ideasonboard.com>
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

The omapdss_hdmi_ops .set_hdmi_mode() and .set_infoframe() operations
operations are not used anymore, remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  3 ---
 drivers/gpu/drm/omapdrm/omap_encoder.c | 26 --------------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 269e143d57be..30a12cf91cbb 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -287,9 +287,6 @@ struct omap_dss_writeback_info {
 
 struct omapdss_hdmi_ops {
 	void (*lost_hotplug)(struct omap_dss_device *dssdev);
-	int (*set_hdmi_mode)(struct omap_dss_device *dssdev, bool hdmi_mode);
-	int (*set_infoframe)(struct omap_dss_device *dssdev,
-		const struct hdmi_avi_infoframe *avi);
 };
 
 struct omapdss_dsi_ops {
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index b232acd3bc3d..18a79dde6815 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -69,28 +69,6 @@ static void omap_encoder_update_videomode_flags(struct videomode *vm,
 	}
 }
 
-static void omap_encoder_hdmi_mode_set(struct drm_connector *connector,
-				       struct drm_encoder *encoder,
-				       struct drm_display_mode *adjusted_mode)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	struct omap_dss_device *dssdev = omap_encoder->output;
-	bool hdmi_mode = connector->display_info.is_hdmi;
-
-	if (dssdev->ops && dssdev->ops->hdmi.set_hdmi_mode)
-		dssdev->ops->hdmi.set_hdmi_mode(dssdev, hdmi_mode);
-
-	if (hdmi_mode && dssdev->ops && dssdev->ops->hdmi.set_infoframe) {
-		struct hdmi_avi_infoframe avi;
-		int r;
-
-		r = drm_hdmi_avi_infoframe_from_display_mode(&avi, connector,
-							     adjusted_mode);
-		if (r == 0)
-			dssdev->ops->hdmi.set_infoframe(dssdev, &avi);
-	}
-}
-
 static void omap_encoder_mode_set(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
@@ -142,10 +120,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 		if (dssdev->ops && dssdev->ops->set_timings)
 			dssdev->ops->set_timings(dssdev, adjusted_mode);
 	}
-
-	/* Set the HDMI mode and HDMI infoframe if applicable. */
-	if (output->type == OMAP_DISPLAY_TYPE_HDMI)
-		omap_encoder_hdmi_mode_set(connector, encoder, adjusted_mode);
 }
 
 static void omap_encoder_disable(struct drm_encoder *encoder)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
