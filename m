Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11804020D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3D89CF1;
	Mon,  6 Sep 2021 21:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20E889CD3;
 Mon,  6 Sep 2021 21:01:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747383"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362131"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:00:59 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 03/22] drm: Add Plane Degamma Mode property
Date: Tue,  7 Sep 2021 03:08:45 +0530
Message-Id: <20210906213904.27918-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Plane Degamma Mode as an enum property. Create a helper
function for all plane color management features.

This is an enum property with values as blob_id's and exposes
the various gamma modes supported and the lut ranges. Getting
the blob id in userspace, user can get the mode supported and
also the range of gamma mode supported with number of lut
coefficients. It can then set one of the modes using this
enum property.

Lut values will be sent through separate GAMMA_LUT blob property.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c              |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
 drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++-
 include/drm/drm_mode_object.h             |  2 +-
 include/drm/drm_plane.h                   | 23 ++++++
 7 files changed, 212 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 1ef7951ded5e..f4658417bf20 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -545,9 +545,99 @@ Damage Tracking Properties
 Color Management Properties
 ---------------------------
 
+Below is how a typical hardware pipeline for color
+will look like:
+
+.. kernel-render:: DOT
+   :alt: Display Color Pipeline
+   :caption: Display Color Pipeline Overview
+
+   digraph "KMS" {
+      node [shape=box]
+
+      subgraph cluster_static {
+          style=dashed
+          label="Display Color Hardware Blocks"
+
+          node [bgcolor=grey style=filled]
+          "Plane Degamma A" -> "Plane CSC/CTM A"
+          "Plane CSC/CTM A" -> "Plane Gamma A"
+          "Pipe Blender" [color=lightblue,style=filled, width=5.25, height=0.75];
+          "Plane Gamma A" -> "Pipe Blender"
+	  "Pipe Blender" -> "Pipe DeGamma"
+          "Pipe DeGamma" -> "Pipe CSC/CTM"
+          "Pipe CSC/CTM" -> "Pipe Gamma"
+          "Pipe Gamma" -> "Pipe Output"
+      }
+
+      subgraph cluster_static {
+          style=dashed
+
+          node [shape=box]
+          "Plane Degamma B" -> "Plane CSC/CTM B"
+          "Plane CSC/CTM B" -> "Plane Gamma B"
+          "Plane Gamma B" -> "Pipe Blender"
+      }
+
+      subgraph cluster_static {
+          style=dashed
+
+          node [shape=box]
+          "Plane Degamma C" -> "Plane CSC/CTM C"
+          "Plane CSC/CTM C" -> "Plane Gamma C"
+          "Plane Gamma C" -> "Pipe Blender"
+      }
+
+      subgraph cluster_fb {
+          style=dashed
+          label="RAM"
+
+          node [shape=box width=1.7 height=0.2]
+
+          "FB 1" -> "Plane Degamma A"
+          "FB 2" -> "Plane Degamma B"
+          "FB 3" -> "Plane Degamma C"
+      }
+   }
+
+In real world usecases,
+
+1. Plane Degamma can be used to linearize a non linear gamma
+encoded framebuffer. This is needed to do any linear math like
+color space conversion. For ex, linearize frames encoded in SRGB
+or by HDR curve.
+
+2. Later Plane CTM block can convert the content to some different
+colorspace. For ex, SRGB to BT2020 etc.
+
+3. Plane Gamma block can be used later to re-apply the non-linear
+curve. This can also be used to apply Tone Mapping for HDR usecases.
+
+All the layers or framebuffers need to be converted to same color
+space and format before blending. The plane color hardware blocks
+can help with this. Once the Data is blended, similar color processing
+can be done on blended output using pipe color hardware blocks.
+
+DRM Properties have been created to define and expose all these
+hardware blocks to userspace. A userspace application (compositor
+or any color app) can use these interfaces and define policies to
+efficiently use the display hardware for such color operations.
+
+Pipe Color Management Properties
+---------------------------------
+
 .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
    :doc: overview
 
+Plane Color Management Properties
+---------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
+   :doc: Plane Color Properties
+
+.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
+   :doc: export
+
 Tile Group Property
 -------------------
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..fddf9df15cd5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -709,6 +709,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ddcf5c2c8e6a..f26b03853711 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -311,6 +311,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
+
+	state->color_mgmt_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 909f31833181..3c952123f747 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->degamma_mode_property) {
+		state->degamma_mode = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -662,6 +664,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->degamma_mode_property) {
+		*val = state->degamma_mode;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..085ed0d0db00 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -34,8 +34,8 @@
 /**
  * DOC: overview
  *
- * Color management or color space adjustments is supported through a set of 5
- * properties on the &drm_crtc object. They are set up by calling
+ * Pipe Color management or color space adjustments is supported through a
+ * set of 5 properties on the &drm_crtc object. They are set up by calling
  * drm_crtc_enable_color_mgmt().
  *
  * "DEGAMMA_LUT”:
@@ -584,6 +584,95 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
 
+/**
+ * DOC: Plane Color Properties
+ *
+ * Plane Color management or color space adjustments is supported
+ * through a set of 5 properties on the &drm_plane object.
+ *
+ * degamma_mode_property:
+ *     Blob property which advertizes the possible degamma modes and
+ *     lut ranges supported by the platform. This  allows userspace
+ *     to query and get the plane degamma color caps and choose the
+ *     appropriate degamma mode and create lut values accordingly
+ *
+ */
+int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
+					   struct drm_plane *plane,
+					   int num_values)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
+				   "PLANE_DEGAMMA_MODE", num_values);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->degamma_mode_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
+
+void drm_plane_attach_degamma_properties(struct drm_plane *plane)
+{
+	if (!plane->degamma_mode_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->degamma_mode_property, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_degamma_properties);
+
+int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
+						 const char *name,
+						 const struct drm_color_lut_range *ranges,
+						 size_t length, enum lut_type type)
+{
+	struct drm_property_blob *blob;
+	struct drm_property *prop = NULL;
+	int num_ranges = length / sizeof(ranges[0]);
+	int i, ret, num_types_0;
+
+	if (type == LUT_TYPE_DEGAMMA)
+		prop = plane->degamma_mode_property;
+
+	if (!prop)
+		return -EINVAL;
+
+	if (length == 0 && name)
+		return drm_property_add_enum(prop, 0, name);
+
+	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
+		return -EINVAL;
+	num_types_0 = hweight8(ranges[0].flags & (DRM_MODE_LUT_GAMMA |
+			       DRM_MODE_LUT_DEGAMMA));
+	if (num_types_0 == 0)
+		return -EINVAL;
+
+	for (i = 1; i < num_ranges; i++) {
+		int num_types = hweight8(ranges[i].flags & (DRM_MODE_LUT_GAMMA |
+					 DRM_MODE_LUT_DEGAMMA));
+
+		/* either all ranges have DEGAMMA|GAMMA or none have it */
+		if (num_types_0 != num_types)
+			return -EINVAL;
+	}
+
+	blob = drm_property_create_blob(plane->dev, length, ranges);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	ret = drm_property_add_enum(prop, blob->base.id, name);
+	if (ret) {
+		drm_property_blob_put(blob);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_color_add_gamma_degamma_mode_range);
+
 /**
  * drm_color_lut_check - check validity of lookup table
  * @lut: property blob containing LUT to check
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c34a3e8030e1..d4128c7daa08 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 26
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0c1102dc4d88..b9064101db2b 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -239,6 +239,15 @@ struct drm_plane_state {
 
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
+
+	/**
+	 * @degamma_mode: This is a blob_id and exposes the platform capabilities
+	 * wrt to various gamma modes and the respective lut ranges. This also
+	 * helps user select a degamma mode amongst the supported ones.
+	 */
+	u32 degamma_mode;
+
+	u8 color_mgmt_changed : 1;
 };
 
 static inline struct drm_rect
@@ -750,6 +759,12 @@ struct drm_plane {
 	 * scaling.
 	 */
 	struct drm_property *scaling_filter_property;
+
+	/**
+	 * @degamma_mode_property: Optional Plane property to set the LUT
+	 * used to convert the framebuffer's colors to linear gamma.
+	 */
+	struct drm_property *degamma_mode_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -841,6 +856,14 @@ void drm_plane_force_disable(struct drm_plane *plane);
 int drm_mode_plane_set_obj_prop(struct drm_plane *plane,
 				       struct drm_property *property,
 				       uint64_t value);
+int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
+					   struct drm_plane *plane,
+					   int num_values);
+void drm_plane_attach_degamma_properties(struct drm_plane *plane);
+int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
+						 const char *name,
+						 const struct drm_color_lut_range *ranges,
+						 size_t length, enum lut_type type);
 
 /**
  * drm_plane_find - find a &drm_plane
-- 
2.26.2

