Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A253E78C935
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBFB10E41D;
	Tue, 29 Aug 2023 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16F310E41A;
 Tue, 29 Aug 2023 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324800; x=1724860800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T+wERlQG8R/pr72eTvqLBpH/8v2dX2AjwU8+RK3DLPI=;
 b=Nojbf046bEHThpGb5Cj+/Uk3r6TS30ozXbHliJ39wsDjwYfF/9R4y2Cb
 J2JNwT3hkbPtfGVmSJctSLgFCZrBKboOgRQflIpJjRNtkOcqTZRL9C5Vf
 Yn78nEz8yoZqNmUrS4jbp3QoMbGF2gdy6gwCjrvzqcLB4pF6BApPS/WkO
 z95mF5E9BA2VQ5AOAffzYgHVdx5XrtG1DSXwB8yvbc6zLprCH9lqxt2ec
 uwhbLV9FRx7a6AINaNu1e9EjnGaoePaaINse96FFZjV3V98flwSzI7KeE
 z4XXGzdT+P2HfAtVK3YeaXEA0pCuGXWlUgJrF3HqJT+b+NGZyFi6P3Hkk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769497"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769497"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555247"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555247"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:47 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 32/33] drm/i915/color: Add a dummy pipeline with 3D LUT
Date: Tue, 29 Aug 2023 21:34:21 +0530
Message-ID: <20230829160422.1251087-33-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

This patch is to demonstrate how a pipeline can be added.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  |  3 ++
 drivers/gpu/drm/drm_atomic_uapi.c          | 15 +++++++++
 drivers/gpu/drm/i915/display/intel_color.c | 37 ++++++++++++++++++++--
 include/drm/drm_plane.h                    |  6 ++++
 4 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a554e04c2ce3..9c389d97b344 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -349,6 +349,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 		drm_property_blob_get(state->color.post_csc_lut);
 	if (state->color.private_color_op_data)
 		drm_property_blob_get(state->color.private_color_op_data);
+	if (state->color.lut_3d)
+		drm_property_blob_get(state->color.lut_3d);
 
 	state->color_mgmt_changed = false;
 }
@@ -402,6 +404,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 	drm_property_blob_put(state->color.ctm);
 	drm_property_blob_put(state->color.post_csc_lut);
 	drm_property_blob_put(state->color.private_color_op_data);
+	drm_property_blob_put(state->color.lut_3d);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9e0fb36d1f47..5629db763fd1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -482,6 +482,15 @@ int drm_plane_reset_color_op_blobs(struct drm_plane *plane,
 						       &blob_replaced);
 	temp_replaced |= blob_replaced;
 
+	if (ret)
+		goto out;
+
+	ret = drm_atomic_replace_property_blob_from_id(dev,
+						       &state->color.lut_3d,
+						       0, -1, -1,
+						       &blob_replaced);
+	temp_replaced |= blob_replaced;
+
 	if (ret)
 		goto out;
 out:
@@ -551,6 +560,12 @@ int drm_plane_replace_color_op_blobs(struct drm_plane *plane,
 							color_op[i].blob_id,
 							-1, -1,
 							&blob_replaced);
+		} else if (color_op[i].name == DRM_CB_3D_LUT) {
+			ret = drm_atomic_replace_property_blob_from_id(dev,
+							&state->color.lut_3d,
+							color_op[i].blob_id,
+							-1, sizeof(struct drm_color_lut_ext),
+							&blob_replaced);
 		} else {
 			ret = -EINVAL;
 			goto copy_fail;
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4e5c82c88bd4..2352ddb4a96a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4265,6 +4265,19 @@ static const struct drm_color_lut_range xelpd_post_csc_hdr[] = {
 	},
 };
 
+static const struct drm_color_lut_range dummy_3d_lut_range[] = {
+	{
+		.flags = (DRM_MODE_LUT_POST_CSC |
+			  DRM_MODE_LUT_REFLECT_NEGATIVE |
+			  DRM_MODE_LUT_INTERPOLATE |
+			  DRM_MODE_LUT_NON_DECREASING),
+		.count = 32,
+		.input_bpc = 24, .output_bpc = 16,
+		.start = 0, .end = (1 << 24) - 1,
+		.min = 0, .max = (1 << 24) - 1,
+	},
+};
+
 struct drm_color_op color_pipeline_sdr[] = {
 	{
 		.name = DRM_CB_PRE_CSC,
@@ -4300,10 +4313,17 @@ struct drm_color_op color_pipeline_hdr[] = {
 	},
 };
 
+struct drm_color_op color_pipeline_3dlut[] = {
+	{
+		.name = DRM_CB_3D_LUT,
+		.type = CURVE_3D,
+	},
+};
+
 static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 {
 	struct drm_i915_private *i915 = to_i915(plane->dev);
-	struct drm_property_blob *blob[2] = {NULL};
+	struct drm_property_blob *blob[3] = {NULL};
 	int ret = 0, i = 0;
 
 	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
@@ -4350,6 +4370,17 @@ static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 			color_pipeline_sdr[1].blob_id = blob[i++]->base.id;
 	}
 
+	blob[i] = drm_property_create_blob(plane->dev,
+					   sizeof(dummy_3d_lut_range),
+					   dummy_3d_lut_range);
+
+	if (IS_ERR(blob[i])) {
+		ret = PTR_ERR(blob[i]);
+		goto out;
+	}
+
+	color_pipeline_3dlut[0].blob_id = blob[i++]->base.id;
+
 out:
 	if (ret) {
 		for (int j = 0; j < i; j++) {
@@ -4368,7 +4399,7 @@ void intel_color_plane_init(struct drm_plane *plane)
 	if (DISPLAY_VER(i915) < 13)
 		return;
 
-	drm_plane_create_get_color_pipeline_property(plane->dev, plane, 2);
+	drm_plane_create_get_color_pipeline_property(plane->dev, plane, 3);
 
 	intel_prepare_plane_color_pipeline(plane);
 
@@ -4387,6 +4418,8 @@ void intel_color_plane_init(struct drm_plane *plane)
 					     color_pipeline_sdr,
 					     sizeof(color_pipeline_sdr));
 
+	drm_plane_add_color_pipeline(plane, "color pipeline 3dlut", color_pipeline_3dlut,
+				     sizeof(color_pipeline_3dlut));
 	drm_plane_attach_get_color_pipeline_property(plane);
 
 	drm_plane_create_set_color_pipeline_property(plane->dev, plane);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 601b01e47a93..5cb84fa32dd5 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -284,6 +284,12 @@ struct drm_plane_state {
 		 * For example: Parameterized/non-parameterized fixed function operations
 		 */
 		struct drm_property_blob *private_color_op_data;
+
+		/* @lut_3d:
+		 *
+		 * Three dimensional luts
+		 */
+		struct drm_property_blob *lut_3d;
 	} color;
 
 	/**
-- 
2.38.1

