Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25214776B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B116FF13;
	Fri, 24 Jan 2020 03:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74916FEDA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:33 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4910C3CA3;
 Fri, 24 Jan 2020 04:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838124;
 bh=wUVHxrFfWX8Nki/HeW1vs4j8hIhK6yq1C4AidZTHFDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i7hv1QRPFghDHh1aZJS4Y6Pwzx5O9r/dOWok98E1Vzp6z5rmzqBcBfRMKCyNEwvnc
 U6Yn7zS1a7Pnk6xXHHu4lKP4bFra2WyQygGVX4bVNVwX39XIsAxrS6ctEHmoiLLAmp
 h1TJ1+upGslPqnqDcGjSZ68XScwIoZiH9toDtEMA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 34/52] drm/omap: dss: Remove .set_hdmi_mode() and
 .set_infoframe() operations
Date: Fri, 24 Jan 2020 05:54:27 +0200
Message-Id: <20200124035445.1830-35-laurent.pinchart@ideasonboard.com>
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

The omapdss_hdmi_ops .set_hdmi_mode() and .set_infoframe() operations
operations are not used anymore, remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
