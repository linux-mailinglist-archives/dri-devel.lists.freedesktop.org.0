Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C1160695
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613E66E4D0;
	Sun, 16 Feb 2020 21:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0960B6E47A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:07 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CA8D124E;
 Sun, 16 Feb 2020 22:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887045;
 bh=liZTGfqvg+EmFTyuxGCt724rZEsUiy8t60jP2qqOJC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7QsTVgubfhiK77uyTt7kRhO8k8aJYPPPcJKShlhtMAYnPjlcEtFf6fDsRbZ8dIAT
 DQUGJ8vkhlpmgDKgoxnS0iuzZq+uCUexi5zUpGMKWFh5kVNkO6pCGb0iUgIaKZTmQZ
 kqDL4vTdhf0+BRWUGmvNubg7pSgkRzg5AnDl7zwM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 39/51] drm/omap: venc: Remove omap_dss_device operations
Date: Sun, 16 Feb 2020 23:02:56 +0200
Message-Id: <20200216210308.17312-40-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
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
