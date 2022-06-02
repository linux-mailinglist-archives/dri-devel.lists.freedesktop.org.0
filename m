Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED553BBBB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883DB112FE4;
	Thu,  2 Jun 2022 15:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199E7112FE4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:42:58 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1CC9A335F73;
 Thu,  2 Jun 2022 16:42:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1654184577; bh=dftW5qvoG7NQycIQnJNRGqp50QS7wTLS92WSlu1Bi3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BapxHLcxgAoPMA35Yy9b1HZw0PymPgM5nErfnHKpK+embysSH8oA5sgjJMFkRo1Rz
 ZD2QZuZLYWH3pHZIFZURJx/MBTgJNop3IXctkAcKvcSLc68TEihMukDVwYZfQ4PHmc
 DJti/PMFW/jnrUud5Edli//x553n00oWxuYhDUqnmh5drqH8iLOk8eecruG8AaIx19
 yNJkdHMKt3v8w9IaWNPbAZ11sqYQ0T4dp1w5bVRkQlbn5QxqVCGkrZYj4Mh6wWXCmI
 Qhw7jZNkz9lFv18QRLLf7XqaVz/gWNISvd4e8Msb8ZbNxihz8vEYdKmOc4V9/TDJTw
 0m8dJ3ERWU0oA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/atomic: Add support for mouse hotspots
Date: Thu,  2 Jun 2022 11:42:38 -0400
Message-Id: <20220602154243.1015688-2-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
References: <20220602154243.1015688-1-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
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
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++++
 drivers/gpu/drm/drm_plane.c               | 43 +++++++++++++++++++++++
 include/drm/drm_plane.h                   | 15 ++++++++
 4 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 3b6d3bdbd099..bc8735998099 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -273,6 +273,20 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
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
index 434f3d4cb8a2..76a5d5221442 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -574,6 +574,22 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -634,6 +650,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
index 726f2f163c26..bb28d1eaf985 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1043,6 +1043,11 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 
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
@@ -1571,3 +1576,41 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
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

