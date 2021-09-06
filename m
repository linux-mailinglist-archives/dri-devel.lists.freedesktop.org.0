Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B704020D8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6F989CF2;
	Mon,  6 Sep 2021 21:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426C89CCB;
 Mon,  6 Sep 2021 21:01:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747395"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747395"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362150"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:02 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 04/22] drm: Add Plane Degamma Lut property
Date: Tue,  7 Sep 2021 03:08:46 +0530
Message-Id: <20210906213904.27918-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Plane Degamma Lut as a blob property. User will calculate
the lut values, create the blob and send it to driver using
this property. Lut calculation will be based on the gamma mode
chosen out of the gamma mode exposed.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 19 +++++++++++++++++++
 include/drm/drm_plane.h                   | 14 ++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index f26b03853711..6e358067cb7a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -312,6 +312,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
 
+	if (state->degamma_lut)
+		drm_property_blob_get(state->degamma_lut);
+
 	state->color_mgmt_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
@@ -359,6 +362,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
+	drm_property_blob_put(state->degamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3c952123f747..904291b96ba9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -598,6 +598,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_range = val;
 	} else if (property == plane->degamma_mode_property) {
 		state->degamma_mode = val;
+	} else if (property == plane->degamma_lut_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->degamma_lut,
+					val, -1, sizeof(struct drm_color_lut_ext),
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -666,6 +673,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_range;
 	} else if (property == plane->degamma_mode_property) {
 		*val = state->degamma_mode;
+	} else if (property == plane->degamma_lut_property) {
+		*val = (state->degamma_lut) ?
+			state->degamma_lut->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 085ed0d0db00..29d0fc1e52b5 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -596,6 +596,12 @@ EXPORT_SYMBOL(drm_plane_create_color_properties);
  *     to query and get the plane degamma color caps and choose the
  *     appropriate degamma mode and create lut values accordingly
  *
+ * degamma_lut_property:
+ *	Blob property which allows a userspace to provide LUT values
+ *	to apply degamma curve using the h/w plane degamma processing
+ *	engine, thereby making the content as linear for further color
+ *	processing.
+ *
  */
 int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
@@ -610,6 +616,13 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 
 	plane->degamma_mode_property = prop;
 
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+				   "PLANE_DEGAMMA_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->degamma_lut_property = prop;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
@@ -621,6 +634,12 @@ void drm_plane_attach_degamma_properties(struct drm_plane *plane)
 
 	drm_object_attach_property(&plane->base,
 				   plane->degamma_mode_property, 0);
+
+	if (!plane->degamma_lut_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->degamma_lut_property, 0);
 }
 EXPORT_SYMBOL(drm_plane_attach_degamma_properties);
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index b9064101db2b..fbfada0b990d 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -247,6 +247,14 @@ struct drm_plane_state {
 	 */
 	u32 degamma_mode;
 
+	/* @degamma_lut:
+	 *
+	 * Lookup table for converting framebuffer pixel data before apply the
+	 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
+	 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
+	 */
+	struct drm_property_blob *degamma_lut;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -765,6 +773,12 @@ struct drm_plane {
 	 * used to convert the framebuffer's colors to linear gamma.
 	 */
 	struct drm_property *degamma_mode_property;
+
+	/**
+	 * @degamma_lut_property: Optional Plane property to set the LUT
+	 * used to convert the framebuffer's colors to linear gamma.
+	 */
+	struct drm_property *degamma_lut_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.26.2

