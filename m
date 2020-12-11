Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F412D7EE5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC76EA5E;
	Fri, 11 Dec 2020 18:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0479A6E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:56:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 47CD73B4AF4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:47:00 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D20F8E000F;
 Fri, 11 Dec 2020 18:46:37 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm: require each CRTC to have a unique primary plane
Date: Fri, 11 Dec 2020 19:46:34 +0100
Message-Id: <20201211184634.74534-4-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211184634.74534-1-contact@emersion.fr>
References: <20201211184634.74534-1-contact@emersion.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space expects to be able to pick a primary plane for each CRTC
exposed by the driver. Make sure this assumption holds in
drm_mode_config_validate.

Use the legacy drm_crtc.primary field to check this, because it's
simpler and we require drivers to set it anyways. Accumulate a set of
primary planes which are already used for a CRTC in a bitmask. Error out
if a primary plane is re-used.

v2: new patch

v3:
- Use u64 instead of __u64 (Jani)
- Use `unsigned int` instead of `unsigned` (Jani)

v4:
- Use u32 instead of u64 for plane mask (Ville)
- Use drm_plane_mask instead of BIT (Ville)
- Fix typos (Ville)

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c       |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 1e5da83fd2a8..7ffc0d6a8e2c 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -626,6 +626,9 @@ void drm_mode_config_validate(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
+	struct drm_plane *plane;
+	u32 primary_with_crtc = 0, cursor_with_crtc = 0;
+	unsigned int num_primary = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
@@ -647,12 +650,30 @@ void drm_mode_config_validate(struct drm_device *dev)
 			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
 			     crtc->primary->base.id, crtc->primary->name,
 			     crtc->base.id, crtc->name);
+			WARN(primary_with_crtc & drm_plane_mask(crtc->primary),
+			     "Primary plane [PLANE:%d:%s] used for multiple CRTCs",
+			     crtc->primary->base.id, crtc->primary->name);
+			primary_with_crtc |= drm_plane_mask(crtc->primary);
 		}
 		if (crtc->cursor) {
 			WARN(!(crtc->cursor->possible_crtcs & drm_crtc_mask(crtc)),
 			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
 			     crtc->cursor->base.id, crtc->cursor->name,
 			     crtc->base.id, crtc->name);
+			WARN(cursor_with_crtc & drm_plane_mask(crtc->cursor),
+			     "Cursor plane [PLANE:%d:%s] used for multiple CRTCs",
+			     crtc->cursor->base.id, crtc->cursor->name);
+			cursor_with_crtc |= drm_plane_mask(crtc->cursor);
 		}
 	}
+
+	drm_for_each_plane(plane, dev) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+			num_primary++;
+		}
+	}
+
+	WARN(num_primary != dev->mode_config.num_crtc,
+	     "Must have as many primary planes as there are CRTCs, but have %u primary planes and %u CRTCs",
+	     num_primary, dev->mode_config.num_crtc);
 }
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 49b0a8b9ac02..a1f4510efa83 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -54,6 +54,12 @@
  * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
  * &drm_plane.possible_crtcs.
  *
+ * Each CRTC must have a unique primary plane userspace can attach to enable
+ * the CRTC. In other words, userspace must be able to attach a different
+ * primary plane to each CRTC at the same time. Primary planes can still be
+ * compatible with multiple CRTCs. There must be exactly as many primary planes
+ * as there are CRTCs.
+ *
  * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
  * relies on the driver to set the primary and optionally the cursor plane used
  * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
