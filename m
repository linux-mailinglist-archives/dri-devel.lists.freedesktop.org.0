Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAE74093E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 07:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659A010E34F;
	Wed, 28 Jun 2023 05:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F210E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 05:21:48 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 664C0324B4E;
 Wed, 28 Jun 2023 06:21:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687929707; bh=PlYlrbWWwJtWJcmFw2VbkDqk22QaTSHZokjMoAoCL3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J7XjjcWo6bTwegmKtx0Lf+DWDhp3m85mFuMH54/9wzfJTNM6d5xyTzhQ97DaLSQwj
 NXrMjQS/JkS+5U7K1JGJJH3+/0hyWc5lUm9/FJ1QWGER7ZH/1KDVWt5I1GBZOzrdLe
 ykURrzqiZJV4nvRVR8iOujqxsQ0sOTLXhDyjbBiqldwLQR2lz2G8vhIYzzWaIx64oF
 vv2qaO7Sr9upFk+MhzV8eCm/JkyNR8uMkQLBHPgn3FuOO8udjrmNjHVoLpL30F0cP/
 MQ796erxTklumBJicnlDNp0pFtKvKtpS3ZidTJR9RcDZL/CydCF4neUblETBEHaF1W
 zuwgHJUYdBoZw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Date: Wed, 28 Jun 2023 01:21:27 -0400
Message-Id: <20230628052133.553154-3-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628052133.553154-1-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, javierm@redhat.com, banackm@vmware.com,
 krastevm@vmware.com, ppaalanen@gmail.com, iforbes@vmware.com,
 mombasawalam@vmware.com
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
 drivers/gpu/drm/drm_plane.c               | 50 +++++++++++++++++++++++
 include/drm/drm_plane.h                   | 14 +++++++
 4 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..54975de44a0e 100644
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
index 98d3b10c08ae..07a7b3f18df2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -593,6 +593,22 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
@@ -653,6 +669,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->scaling_filter;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val);
+	} else if (property == plane->hotspot_x_property) {
+		*val = state->hotspot_x;
+	} else if (property == plane->hotspot_y_property) {
+		*val = state->hotspot_y;
 	} else {
 		drm_dbg_atomic(dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index c6bbb0c209f4..eaca367bdc7e 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -230,6 +230,47 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
+/**
+ * drm_plane_create_hotspot_properties - creates the mouse hotspot
+ * properties and attaches them to the given cursor plane
+ *
+ * @plane: drm cursor plane
+ *
+ * This function enables the mouse hotspot property on a given
+ * cursor plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
+{
+	struct drm_property *prop_x;
+	struct drm_property *prop_y;
+
+	drm_WARN_ON(plane->dev,
+		    !drm_core_check_feature(plane->dev,
+					    DRIVER_CURSOR_HOTSPOT));
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
+
 __printf(9, 0)
 static int __drm_universal_plane_init(struct drm_device *dev,
 				      struct drm_plane *plane,
@@ -348,6 +389,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_w, 0);
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
+	if (drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT) &&
+	    type == DRM_PLANE_TYPE_CURSOR) {
+		drm_plane_create_hotspot_properties(plane);
+	}
 
 	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
@@ -1067,6 +1112,11 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 
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
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..74e62f90a1ad 100644
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
-- 
2.39.2

