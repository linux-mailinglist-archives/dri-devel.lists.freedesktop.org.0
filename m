Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BEE1D2280
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 00:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EDB6EA9E;
	Wed, 13 May 2020 22:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B06E293
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 22:58:47 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B982351F;
 Thu, 14 May 2020 00:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589410724;
 bh=4PSJXsh+nCdVM0pOVD+OgBXTM2FWlKlGMuuISrHkYZc=;
 h=From:To:Cc:Subject:Date:From;
 b=WH0dtuCR6oGLylf0qbMg0rZRa2ooiU4F0KSUfCi7kdOwfn/OQlCoN84jsUi3+Gaob
 hEDs5uavmKIr7vCDj1x7RF0bpCOqRxz61hKnGzbMaJ9EHFYoTnyBlOSfaEXdoiSbjL
 qW2JlGolRoS0Mmxvl9bmpgrfOv0lUTIsLOlLdbUw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: plane: Verify that no or all planes have a zpos
 property
Date: Thu, 14 May 2020 01:58:35 +0300
Message-Id: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The zpos property is used by userspace to sort the order of planes.
While the property is not mandatory for drivers to implement, mixing
planes with and without zpos confuses userspace, and shall not be
allowed. Clarify this in the documentation and warn at runtime if the
drivers mixes planes with and without zpos properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Changes since v1:

- Fix verification when no planes have a zpos property
---
 drivers/gpu/drm/drm_blend.c | 10 ++++++----
 drivers/gpu/drm/drm_plane.c |  9 +++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 88eedee018d3..f1dcad96f341 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -135,7 +135,9 @@
  *	are underneath planes with higher Z position values. Two planes with the
  *	same Z position value have undefined ordering. Note that the Z position
  *	value can also be immutable, to inform userspace about the hard-coded
- *	stacking of planes, see drm_plane_create_zpos_immutable_property().
+ *	stacking of planes, see drm_plane_create_zpos_immutable_property(). If
+ *	any plane has a zpos property (either mutable or immutable), then all
+ *	planes shall have a zpos property.
  *
  * pixel blend mode:
  *	Pixel blend mode is set up with drm_plane_create_blend_mode_property().
@@ -344,10 +346,10 @@ EXPORT_SYMBOL(drm_rotation_simplify);
  * should be set to 0 and max to maximal number of planes for given crtc - 1.
  *
  * If zpos of some planes cannot be changed (like fixed background or
- * cursor/topmost planes), driver should adjust min/max values and assign those
- * planes immutable zpos property with lower or higher values (for more
+ * cursor/topmost planes), drivers shall adjust the min/max values and assign
+ * those planes immutable zpos properties with lower or higher values (for more
  * information, see drm_plane_create_zpos_immutable_property() function). In such
- * case driver should also assign proper initial zpos values for all planes in
+ * case drivers shall also assign proper initial zpos values for all planes in
  * its plane_reset() callback, so the planes will be always sorted properly.
  *
  * See also drm_atomic_normalize_zpos().
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index d6ad60ab0d38..4af173ced327 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -289,6 +289,8 @@ EXPORT_SYMBOL(drm_universal_plane_init);
 
 int drm_plane_register_all(struct drm_device *dev)
 {
+	unsigned int num_planes = 0;
+	unsigned int num_zpos = 0;
 	struct drm_plane *plane;
 	int ret = 0;
 
@@ -297,8 +299,15 @@ int drm_plane_register_all(struct drm_device *dev)
 			ret = plane->funcs->late_register(plane);
 		if (ret)
 			return ret;
+
+		if (plane->zpos_property)
+			num_zpos++;
+		num_planes++;
 	}
 
+	drm_WARN(dev, num_zpos && num_planes != num_zpos,
+		 "Mixing planes with and without zpos property is invalid\n");
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
