Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6625710E4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60410F617;
	Tue, 12 Jul 2022 03:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974E10F547
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 03:33:04 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 76C65321FA9;
 Tue, 12 Jul 2022 04:33:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1657596783; bh=vEJQWvjD+cPgiVaBwEpo7ZIP2U3wLN33weenkCob+n8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ct0GEjf9GO1o6ZAPtjD18bYX/XDwr1DpvlSDfmMjNXO7EHVxzotTGNxkK2o7Oi27/
 ovypfK+3BVyFBJNNsY9mPV+/joq6gxJWjLwI5aECtlNZF4tQjxlnzlcSK5kgEfu06l
 yZ3jP+SdOoo5xAJ8JZyL96JDjn+s/BZ7eU5bR8fd0l32etmkyLNIKXVDPdl42n4jpm
 SGM4ejTF1Qx4I4fxq+RwsnAVAhYvuWEmQ8OMP0FXXjBwIUozDsZJvVQThE79vo0loy
 rBl+f4ocqfx5m0LxdSrv/svCX+K4wnENT48fXG3XvPDWzLQPiUKBitarkUg1OBBciq
 c86pmt+09YLag==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/atomic: Add support for mouse hotspots
Date: Mon, 11 Jul 2022 23:32:40 -0400
Message-Id: <20220712033246.1148476-3-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com, ppaalanen@gmail.com,
 mombasawalam@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting code lacked support for specifying mouse cursor
hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
the hotspot but the functionality was not implemented in the new atomic
paths.

Due to the lack of hotspots in the atomic paths userspace compositors
completely disable atomic modesetting for drivers that require it (i.e.
all paravirtualized drivers).

This change adds hotspot properties to the atomic codepaths throughtout
the DRM core and will allow enabling atomic modesetting for virtualized
drivers in the userspace.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 ++++++++++
 drivers/gpu/drm/drm_plane.c               | 47 +++++++++++++++++++++++
 include/drm/drm_plane.h                   | 15 ++++++++
 4 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bf31b9d92094..9c4fda0b35e8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -275,6 +275,20 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 			plane_state->normalized_zpos = val;
 		}
 	}
+
+	if (plane->hotspot_x_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->hotspot_x_property,
+							   &val))
+			plane_state->hotspot_x = val;
+	}
+
+	if (plane->hotspot_y_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->hotspot_y_property,
+							   &val))
+			plane_state->hotspot_y = val;
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..6132540c97a9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -575,6 +575,22 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
+	} else if (property == plane->hotspot_x_property) {
+		if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
+				       plane->base.id, plane->name, val);
+			return -EINVAL;
+		}
+		state->hotspot_x = val;
+	} else if (property == plane->hotspot_y_property) {
+		if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
+				       plane->base.id, plane->name, val);
+			return -EINVAL;
+		}
+		state->hotspot_y = val;
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -635,6 +651,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->scaling_filter;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val);
+	} else if (property == plane->hotspot_x_property) {
+		*val = state->hotspot_x;
+	} else if (property == plane->hotspot_y_property) {
+		*val = state->hotspot_y;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index e1e2a65c7119..0a6a1b5adf82 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -343,6 +343,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_w, 0);
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
+	if (drm_core_check_feature(dev, DRIVER_VIRTUAL) &&
+	    type == DRM_PLANE_TYPE_CURSOR) {
+		drm_plane_create_hotspot_properties(plane);
+	}
 
 	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
@@ -1054,6 +1058,11 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 
 			fb->hot_x = req->hot_x;
 			fb->hot_y = req->hot_y;
+
+			if (plane->hotspot_x_property && plane->state)
+				plane->state->hotspot_x = req->hot_x;
+			if (plane->hotspot_y_property && plane->state)
+				plane->state->hotspot_y = req->hot_y;
 		} else {
 			fb = NULL;
 		}
@@ -1582,3 +1591,41 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
+
+/**
+ * drm_plane_create_hotspot_properties - creates the mouse hotspot
+ * properties and attaches them to the given cursor plane
+ *
+ * @plane: drm cursor plane
+ *
+ * This function lets driver to enable the mouse hotspot property on a given
+ * cursor plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_create_hotspot_properties(struct drm_plane *plane)
+{
+	struct drm_property *prop_x;
+	struct drm_property *prop_y;
+
+	prop_x = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
+						  INT_MIN, INT_MAX);
+	if (IS_ERR(prop_x))
+		return PTR_ERR(prop_x);
+
+	prop_y = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
+						  INT_MIN, INT_MAX);
+	if (IS_ERR(prop_y)) {
+		drm_property_destroy(plane->dev, prop_x);
+		return PTR_ERR(prop_y);
+	}
+
+	drm_object_attach_property(&plane->base, prop_x, 0);
+	drm_object_attach_property(&plane->base, prop_y, 0);
+	plane->hotspot_x_property = prop_x;
+	plane->hotspot_y_property = prop_y;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_hotspot_properties);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 89ea54652e87..09d3e3791e67 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -116,6 +116,10 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/** @hotspot_x: x offset to mouse cursor hotspot */
+	/** @hotspot_y: y offset to mouse cursor hotspot */
+	int32_t hotspot_x, hotspot_y;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -748,6 +752,16 @@ struct drm_plane {
 	 * scaling.
 	 */
 	struct drm_property *scaling_filter_property;
+
+	/**
+	 * @hotspot_x_property: property to set mouse hotspot x offset.
+	 */
+	struct drm_property *hotspot_x_property;
+
+	/**
+	 * @hotspot_y_property: property to set mouse hotspot y offset.
+	 */
+	struct drm_property *hotspot_y_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -907,5 +921,6 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_create_hotspot_properties(struct drm_plane *plane);
 
 #endif
-- 
2.34.1

