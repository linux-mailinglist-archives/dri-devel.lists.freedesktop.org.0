Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC79119EDC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A627E6EA0B;
	Tue, 10 Dec 2019 22:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2146E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:40 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CDBB1265;
 Tue, 10 Dec 2019 23:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018718;
 bh=tmjlOXmYzxzj1PgW+7qAtzQcJF/ckX2HYM+MvlI5kNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jTjmeVREBWYx8HIELNBVnnw8lV5PucOCxW/OvVrykn1pKR3QqhgN2jo4CL6bPN9HD
 LCKYrNWX5QTk7qem+m0zL9njR7WIkEgf5FRwApHU6a3tBfHMiXuU9lRhZYcPmqxJGO
 vGXcf7nUle542A9ZwYrR69zlosfQkTWDu1JiIH64=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 39/50] drm/omap: venc: Remove omap_dss_device operations
Date: Wed, 11 Dec 2019 00:57:39 +0200
Message-Id: <20191210225750.15709-40-laurent.pinchart@ideasonboard.com>
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

Now that the VENC output is driven fully through the drm_bridge API its
omap_dss_device operations are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 45 ------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 49499e2a9d31..37ac41c9d085 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -308,7 +308,6 @@ struct venc_device {
 	struct drm_bridge bridge;
 };
 
-#define dssdev_to_venc(dssdev) container_of(dssdev, struct venc_device, output)
 #define drm_bridge_to_venc(b) container_of(b, struct venc_device, bridge)
 
 static inline void venc_write_reg(struct venc_device *venc, int idx, u32 val)
@@ -481,30 +480,6 @@ static void venc_power_off(struct venc_device *venc)
 	venc_runtime_put(venc);
 }
 
-static int venc_get_modes(struct omap_dss_device *dssdev,
-			  struct drm_connector *connector)
-{
-	static const struct drm_display_mode *modes[] = {
-		&omap_dss_pal_mode,
-		&omap_dss_ntsc_mode,
-	};
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(modes); ++i) {
-		struct drm_display_mode *mode;
-
-		mode = drm_mode_duplicate(connector->dev, modes[i]);
-		if (!mode)
-			return i;
-
-		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-		drm_mode_set_name(mode);
-		drm_mode_probed_add(connector, mode);
-	}
-
-	return ARRAY_SIZE(modes);
-}
-
 static enum venc_videomode venc_get_videomode(const struct drm_display_mode *mode)
 {
 	if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
@@ -600,25 +575,6 @@ static int venc_get_clocks(struct venc_device *venc)
 	return 0;
 }
 
-static int venc_connect(struct omap_dss_device *src,
-			struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void venc_disconnect(struct omap_dss_device *src,
-			    struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
-static const struct omap_dss_device_ops venc_ops = {
-	.connect = venc_connect,
-	.disconnect = venc_disconnect,
-
-	.get_modes = venc_get_modes,
-};
-
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -827,7 +783,6 @@ static int venc_init_output(struct venc_device *venc)
 	out->type = OMAP_DISPLAY_TYPE_VENC;
 	out->name = "venc.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->ops = &venc_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
