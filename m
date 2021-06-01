Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9970397133
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2C36EA06;
	Tue,  1 Jun 2021 10:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0356EA06;
 Tue,  1 Jun 2021 10:16:36 +0000 (UTC)
IronPort-SDR: JWu8HlbaV7utNd5cqB+NrS5Vs7Qd4KaH9kw42GO5DjNqUC4W8KWjjHelMuSs+EOUa9PG3hiKJ8
 bj5gUvv5Lz+A==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550049"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:35 -0700
IronPort-SDR: asM4Jj+EGZuqvC/e0kBgQcJcyWtlbINVqHRkxR5AV5Kj6RdqDpLh1CdE5dtQp5B9s2oWGJBMzJ
 TK1LP/N4Ftbw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431383"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:33 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/21] drm: Add Plane Gamma Lut property
Date: Tue,  1 Jun 2021 16:22:14 +0530
Message-Id: <20210601105218.29185-18-uma.shankar@intel.com>
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

Add Plane Gamma Lut as a blob property.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 10 ++++++++++
 drivers/gpu/drm/drm_color_mgmt.c          | 18 ++++++++++++++++++
 include/drm/drm_plane.h                   | 14 ++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index fafb8af1c9cb..7ddf6e4b956b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -316,6 +316,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 		drm_property_blob_get(state->degamma_lut);
 	if (state->ctm)
 		drm_property_blob_get(state->ctm);
+	if (state->gamma_lut)
+		drm_property_blob_get(state->gamma_lut);
 
 	state->color_mgmt_changed = false;
 }
@@ -366,6 +368,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 	drm_property_blob_put(state->fb_damage_clips);
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
+	drm_property_blob_put(state->gamma_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6e3958491d10..4f5b7f76208d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -614,6 +614,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return ret;
 	} else if (property == plane->gamma_mode_property) {
 		state->gamma_mode = val;
+	} else if (property == plane->gamma_lut_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->gamma_lut,
+					val, -1, sizeof(struct drm_color_lut_ext),
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -689,6 +696,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	} else if (property == plane->gamma_mode_property) {
 		*val = state->gamma_mode;
+	} else if (property == plane->gamma_lut_property) {
+		*val = (state->gamma_lut) ?
+			state->gamma_lut->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 02367e691cf3..b5b3ff7f654d 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -613,6 +613,11 @@ EXPORT_SYMBOL(drm_plane_create_color_properties);
  *     to query and get the plane gamma color caps and choose the
  *     appropriate gamma mode and create lut values accordingly
  *
+ * gamma_lut_property:
+ *	Blob property which allows a userspace to provide LUT values
+ *	to apply gamma curve using the h/w plane degamma processing
+ *	engine, thereby making the content as non-linear.
+ *
  */
 int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
@@ -648,6 +653,13 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 
 	plane->gamma_mode_property = prop;
 
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+				   "PLANE_GAMMA_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->gamma_lut_property = prop;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
@@ -685,6 +697,12 @@ void drm_plane_attach_gamma_properties(struct drm_plane *plane)
 
 	drm_object_attach_property(&plane->base,
 				   plane->gamma_mode_property, 0);
+
+	if (!plane->gamma_lut_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->gamma_lut_property, 0);
 }
 EXPORT_SYMBOL(drm_plane_attach_gamma_properties);
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index a7b7c8599702..8989bb1aa46c 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -267,6 +267,14 @@ struct drm_plane_state {
 	 */
 	u32 gamma_mode;
 
+	/* @gamma_lut:
+	 *
+	 * Lookup table for converting framebuffer pixel data after applying the
+	 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
+	 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
+	 */
+	struct drm_property_blob *gamma_lut;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -804,6 +812,12 @@ struct drm_plane {
 	 * used to convert the framebuffer's colors to non-linear gamma.
 	 */
 	struct drm_property *gamma_mode_property;
+
+	/**
+	 * @gamma_lut_property: Optional Plane property to set the LUT
+	 * used to convert the framebuffer's colors to non-linear gamma.
+	 */
+	struct drm_property *gamma_lut_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.26.2

