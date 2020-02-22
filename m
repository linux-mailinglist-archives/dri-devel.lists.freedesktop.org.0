Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25E168F9B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4146E947;
	Sat, 22 Feb 2020 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6D96E921
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:02:12 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FECA40DC;
 Sat, 22 Feb 2020 16:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383729;
 bh=IGQio4eU6aKm5wP+M7XOMBeoRxyIVB6lTaVIi2cdaR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l9k5j7vyw56JdU669Alwa21BYDHPPDVJ5uuqMEwmLaDX0ctrDrvOPM4RyIIcrXqPr
 VwQbcueLmul46ny1mGG6VqmZf8EJNuigANFZZv4AEK5RKv8d2SiY/ID9XSIz+9w7F/
 SZjQM/1t0xJh82o1Or8EWmhAZX2dsAoO8ztW/5t0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 42/54] drm/omap: venc: Remove omap_dss_device operations
Date: Sat, 22 Feb 2020 17:00:54 +0200
Message-Id: <20200222150106.22919-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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

Now that the VENC output is driven fully through the drm_bridge API its
omap_dss_device operations are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 45 ------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index c8c19967a42f..766553bb2f87 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -306,7 +306,6 @@ struct venc_device {
 	struct drm_bridge bridge;
 };
 
-#define dssdev_to_venc(dssdev) container_of(dssdev, struct venc_device, output)
 #define drm_bridge_to_venc(b) container_of(b, struct venc_device, bridge)
 
 static inline void venc_write_reg(struct venc_device *venc, int idx, u32 val)
@@ -479,30 +478,6 @@ static void venc_power_off(struct venc_device *venc)
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
@@ -598,25 +573,6 @@ static int venc_get_clocks(struct venc_device *venc)
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
@@ -816,7 +772,6 @@ static int venc_init_output(struct venc_device *venc)
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
