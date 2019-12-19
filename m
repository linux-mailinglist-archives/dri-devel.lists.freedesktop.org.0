Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE3125FC9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54BA6EB41;
	Thu, 19 Dec 2019 10:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524E6EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:20 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 302F3193C;
 Thu, 19 Dec 2019 11:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752377;
 bh=h7+lRCsz3NwSNmvZ5+ngX1e38IS0t26BwkJE8mYmVXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vLYHDv0vdp1TnmJ0XLB1dRbLSNI5IShYA9CRlu64xozGrrAZDEJThMtYVCX65PCBs
 3vDWpwcgQqhA4XcrKEnXpbu9TOnNj2aOy5WOriBfrMQ36+LfuGd0gYdN67CHkotMuL
 ACGwXyCTQtSosSeXdH3trfdSzW5OKQFyIbl+wejA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 49/51] drm/omap: dss: Remove unused omap_dss_device
 operations
Date: Thu, 19 Dec 2019 12:45:20 +0200
Message-Id: <20191219104522.9379-50-laurent.pinchart@ideasonboard.com>
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

The omap_dss_device .pre_enable(), .post_disable() and .set_timings()
are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c     | 26 ---------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  6 ----
 drivers/gpu/drm/omapdrm/omap_encoder.c | 44 +++-----------------------
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 455b410f7401..c7650a7c155d 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -234,18 +234,6 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
 
-void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	omapdss_device_pre_enable(dssdev->next);
-
-	if (dssdev->ops && dssdev->ops->pre_enable)
-		dssdev->ops->pre_enable(dssdev);
-}
-EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
-
 void omapdss_device_enable(struct omap_dss_device *dssdev)
 {
 	if (!dssdev)
@@ -272,20 +260,6 @@ void omapdss_device_disable(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disable);
 
-void omapdss_device_post_disable(struct omap_dss_device *dssdev)
-{
-	if (!dssdev)
-		return;
-
-	if (dssdev->ops && dssdev->ops->post_disable)
-		dssdev->ops->post_disable(dssdev);
-
-	omapdss_device_post_disable(dssdev->next);
-
-	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-}
-EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
-
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 2e5453df2293..64aedc50cb0b 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -342,15 +342,11 @@ struct omap_dss_device_ops {
 	void (*disconnect)(struct omap_dss_device *dssdev,
 			struct omap_dss_device *dst);
 
-	void (*pre_enable)(struct omap_dss_device *dssdev);
 	void (*enable)(struct omap_dss_device *dssdev);
 	void (*disable)(struct omap_dss_device *dssdev);
-	void (*post_disable)(struct omap_dss_device *dssdev);
 
 	int (*check_timings)(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode);
-	void (*set_timings)(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode);
 
 	int (*get_modes)(struct omap_dss_device *dssdev,
 			 struct drm_connector *connector);
@@ -450,10 +446,8 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct omap_dss_device *src,
 			       struct omap_dss_device *dst);
-void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
 void omapdss_device_enable(struct omap_dss_device *dssdev);
 void omapdss_device_disable(struct omap_dss_device *dssdev);
-void omapdss_device_post_disable(struct omap_dss_device *dssdev);
 
 int omap_dss_get_num_overlay_managers(void);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 18a79dde6815..ae4b867a67a3 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -113,13 +113,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	bus_flags = connector->display_info.bus_flags;
 	omap_encoder_update_videomode_flags(&vm, bus_flags);
 
-	/* Set timings for all devices in the display pipeline. */
+	/* Set timings for the dss manager. */
 	dss_mgr_set_timings(output, &vm);
-
-	for (dssdev = output; dssdev; dssdev = dssdev->next) {
-		if (dssdev->ops && dssdev->ops->set_timings)
-			dssdev->ops->set_timings(dssdev, adjusted_mode);
-	}
 }
 
 static void omap_encoder_disable(struct drm_encoder *encoder)
@@ -132,26 +127,10 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 
 	/*
 	 * Disable the chain of external devices, starting at the one at the
-	 * internal encoder's output.
+	 * internal encoder's output. This is used for DSI outputs only, as
+	 * dssdev->next is NULL for all other outputs.
 	 */
 	omapdss_device_disable(dssdev->next);
-
-	/*
-	 * Disable the internal encoder. This will disable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
-	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->disable)
-			dssdev->ops->disable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-	}
-
-	/*
-	 * Perform the post-disable operations on the chain of external devices
-	 * to complete the display pipeline disable.
-	 */
-	omapdss_device_post_disable(dssdev->next);
 }
 
 static void omap_encoder_enable(struct drm_encoder *encoder)
@@ -162,23 +141,10 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 
 	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
 
-	/* Prepare the chain of external devices for pipeline enable. */
-	omapdss_device_pre_enable(dssdev->next);
-
-	/*
-	 * Enable the internal encoder. This will enable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
-	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->enable)
-			dssdev->ops->enable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-	}
-
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-	 * internal encoder's output.
+	 * internal encoder's output. This is used for DSI outputs only, as
+	 * dssdev->next is NULL for all other outputs.
 	 */
 	omapdss_device_enable(dssdev->next);
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
