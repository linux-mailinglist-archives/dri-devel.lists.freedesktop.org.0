Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A14020E9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077C58966B;
	Mon,  6 Sep 2021 21:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2E78966B;
 Mon,  6 Sep 2021 21:01:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747506"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362262"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:28 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 13/22] drm: Add Plane CTM property
Date: Tue,  7 Sep 2021 03:08:55 +0530
Message-Id: <20210906213904.27918-14-uma.shankar@intel.com>
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

Add a blob property for plane CSC usage.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 11 +++++++++++
 include/drm/drm_plane.h                   | 15 +++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 6e358067cb7a..fafb8af1c9cb 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -314,6 +314,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 
 	if (state->degamma_lut)
 		drm_property_blob_get(state->degamma_lut);
+	if (state->ctm)
+		drm_property_blob_get(state->ctm);
 
 	state->color_mgmt_changed = false;
 }
@@ -363,6 +365,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 
 	drm_property_blob_put(state->fb_damage_clips);
 	drm_property_blob_put(state->degamma_lut);
+	drm_property_blob_put(state->ctm);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 904291b96ba9..e736fd7c1d5b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -605,6 +605,14 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == plane->ctm_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->ctm,
+					val,
+					sizeof(struct drm_color_ctm), -1,
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -676,6 +684,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	} else if (property == plane->degamma_lut_property) {
 		*val = (state->degamma_lut) ?
 			state->degamma_lut->base.id : 0;
+	} else if (property == plane->ctm_property) {
+		*val = (state->ctm) ? state->ctm->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 29d0fc1e52b5..83832adf3adf 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -602,6 +602,10 @@ EXPORT_SYMBOL(drm_plane_create_color_properties);
  *	engine, thereby making the content as linear for further color
  *	processing.
  *
+ * ctm_property:
+ *	Blob property which allows a userspace to provide CTM coefficients
+ *	to do color space conversion or any other enhancement by doing a
+ *	matrix multiplication using the h/w CTM processing engine
  */
 int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
@@ -623,6 +627,13 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 
 	plane->degamma_lut_property = prop;
 
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+				   "PLANE_CTM", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->ctm_property = prop;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index fbfada0b990d..c4ed1799ecaf 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -255,6 +255,14 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *degamma_lut;
 
+	/**
+	 * @ctm:
+	 *
+	 * Color transformation matrix. See drm_plane_enable_color_mgmt(). The
+	 * blob (if not NULL) is a &struct drm_color_ctm.
+	 */
+	struct drm_property_blob *ctm;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -779,6 +787,13 @@ struct drm_plane {
 	 * used to convert the framebuffer's colors to linear gamma.
 	 */
 	struct drm_property *degamma_lut_property;
+
+	/**
+	 * @plane_ctm_property: Optional Plane property to set the
+	 * matrix used to convert colors after the lookup in the
+	 * degamma LUT.
+	 */
+	struct drm_property *ctm_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.26.2

