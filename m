Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94E397114
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080336E9E4;
	Tue,  1 Jun 2021 10:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09846E9E3;
 Tue,  1 Jun 2021 10:16:07 +0000 (UTC)
IronPort-SDR: GGM64ew4BmETC1ybfKOIa2tQWAYFZ7vhkr8ANSLvgMSqL7HtRust74IoOXhazRZPNDnGqfoSee
 VpKVasPNXUeA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203549946"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203549946"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:07 -0700
IronPort-SDR: gx5phQ/jIwI05I5ogUbSWKGCNCAVD5mMT+2QO75IWa2jon50pHhZuoc/wJxADDXGcmYebm/5+7
 Ayv7O3499vwQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431189"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:05 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/21] drm: Add Plane Degamma Lut property
Date: Tue,  1 Jun 2021 16:22:00 +0530
Message-Id: <20210601105218.29185-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
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
index 40fa05fa33dc..ce3cb65d415e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -597,6 +597,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -665,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
index e476a5939f8e..bbd0033ed1d2 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -244,6 +244,14 @@ struct drm_plane_state {
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
 
@@ -762,6 +770,12 @@ struct drm_plane {
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

