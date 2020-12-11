Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9E2D763E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF06EDE2;
	Fri, 11 Dec 2020 13:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0B6EDE2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:08:33 +0000 (UTC)
Date: Fri, 11 Dec 2020 13:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607692111;
 bh=uaDqY6+GXPMr8qc+pEkeLrDwtbyHpOftx4PCZLxh74I=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=lWZyxh9PUgvzBxGtF2RdaE7To3G2AOE6yM+aYU65J4Y7a8hThj2NsNSFWLkg67oa3
 qatTd12Me98DOZA74CeLY3nBgn3Pc8LWH3d7u0mRrDLyDKLoEWFuF85RViJ8wpKY5i
 E8GJsvqDsRuD2JrEhx+rAExH0UhgjzV8EjZJYP5HbLsxnMgbbdRz8EadNZCaruGnWS
 VFau8gFr3aQpi95zxpU7RbFNOeupwjYE8pk/JmllvHQErRa0jM0iclV2wLM8ksd4ew
 nBPbqQAeBYWz3nXjypr5Z51FWN+sXjyVEUQCBdxcHVs3QiHVc/pArGD5GXVA3Is/cE
 YjPVK3hKstfqg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 4/4] drm: require each CRTC to have a unique primary plane
Message-ID: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
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

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c       |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index fbe680035129..c5cf5624c106 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -626,6 +626,9 @@ void drm_mode_config_validate(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
+	struct drm_plane *plane;
+	u64 primary_with_crtc = 0, cursor_with_crtc = 0;
+	unsigned int num_primary = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
@@ -647,12 +650,30 @@ void drm_mode_config_validate(struct drm_device *dev)
 			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
 			     crtc->primary->base.id, crtc->primary->name,
 			     crtc->base.id, crtc->name);
+			WARN(primary_with_crtc & BIT(crtc->primary->index),
+			     "Primary plane [PLANE:%d:%s] used for two CRTCs",
+			     crtc->primary->base.id, crtc->primary->name);
+			primary_with_crtc |= BIT(crtc->primary->index);
 		}
 		if (crtc->cursor) {
 			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
 			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
 			     crtc->cursor->base.id, crtc->cursor->name,
 			     crtc->base.id, crtc->name);
+			WARN(cursor_with_crtc & BIT(crtc->cursor->index),
+			     "Primary plane [PLANE:%d:%s] used for two CRTCs",
+			     crtc->cursor->base.id, crtc->cursor->name);
+			cursor_with_crtc |= BIT(crtc->cursor->index);
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
