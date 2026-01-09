Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEDD07E75
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34810E821;
	Fri,  9 Jan 2026 08:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrZQrIYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82310E821;
 Fri,  9 Jan 2026 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948206; x=1799484206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b0IaFL2z0NITR8pu6W8I9zrmaOUAiShvU+0Xk8WylfQ=;
 b=LrZQrIYDIvwwe2ovdFF3SiTKbt/Zm1JQIRZkYKSiknpCAPCZJVCd+qUm
 g+DAhnIg72rl+vmXTiG19BVUPe9mXFGSC26+dmaB7tOoe2b9YWFDWp133
 A7Zos2BVfU2ojb2TOyZ0YN5D+APWtlEFJovSRAWrbClhuAtwcDJ/cEFCg
 Ga0HwW/se8GBv2iMQUvNwf6LsfhDup6+wRy3iKkRvwofy1aNnHKT1tory
 qlfHHUUBDFHcIiYmcqw9d8VRm6HZtkxORJ4d4e+qsZG755N7Vy89Ufa+p
 tlCjigTIlZuC9YU1KkdXvXeiEfFCetcDVlNVjU3YY58fSliIPRbdYfQ6E w==;
X-CSE-ConnectionGUID: MKWmKlf+Tueminb+m65xXQ==
X-CSE-MsgGUID: i2Q5BIkRR7WnPsin6UccSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241424"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:25 -0800
X-CSE-ConnectionGUID: q/Yt2zhwTye5NXn6bTwhRw==
X-CSE-MsgGUID: CgZmeH6xQ6y7afxmIF00bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924580"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:21 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 06/13] drm: Allow driver-managed destruction of colorop
 objects
Date: Fri,  9 Jan 2026 13:47:21 +0530
Message-Id: <20260109081728.478844-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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

Some drivers might want to embed struct drm_colorop inside
driver-specific objects, similar to planes or CRTCs. In such
cases, freeing only the drm_colorop is incorrect.

Add a drm_colorop_funcs callback to allow drivers to provide a destroy
hook that cleans up the full enclosing object. Make changes in helper
functions to accept helper functions as argument. Pass NULL for now
to retain current behavior.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
 drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
 .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
 drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
 include/drm/drm_colorop.h                     | 30 +++++++++++++++---
 5 files changed, 66 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index a2de3bba8346..dfdb4fb4219f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 					      amdgpu_dm_supported_degam_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
@@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 						amdgpu_dm_supported_shaper_tfs,
 						DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		if (ret)
@@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
+							MAX_COLOR_LUT_ENTRIES,
 							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 							DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		if (ret)
@@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
 					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 					DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		if (ret)
@@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
 					      amdgpu_dm_supported_blnd_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
@@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL, MAX_COLOR_LUT_ENTRIES,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index ba19a3ab23cb..4b27804bb0bd 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -93,7 +93,8 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, enum drm_colorop_type type,
+				  struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				  enum drm_colorop_type type,
 				  uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
@@ -109,6 +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->type = type;
 	colorop->plane = plane;
 	colorop->next = NULL;
+	colorop->funcs = funcs;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -215,6 +217,7 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @funcs: control functions for the new colorop
  * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
  *                 created using BIT(curve_type) and combined with the OR '|'
  *                 operator.
@@ -222,7 +225,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
+				    struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				    u64 supported_tfs, uint32_t flags)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
@@ -243,7 +247,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 		return -EINVAL;
 	}
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_1D_CURVE, flags);
 	if (ret)
 		return ret;
 
@@ -300,20 +304,23 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @funcs: control functions for new colorop
  * @lut_size: LUT size supported by driver
  * @interpolation: 1D LUT interpolation type
  * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size,
+					struct drm_plane *plane,
+					const struct drm_colorop_funcs *funcs,
+					uint32_t lut_size,
 					enum drm_colorop_lut1d_interpolation_type interpolation,
 					uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_1D_LUT, flags);
 	if (ret)
 		return ret;
 
@@ -351,11 +358,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane, uint32_t flags)
+				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				   uint32_t flags)
 {
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_CTM_3X4, flags);
 	if (ret)
 		return ret;
 
@@ -375,16 +383,18 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
  * @dev: DRM device
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
+ * @funcs: control functions for the new colorop
  * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane, uint32_t flags)
+				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_MULTIPLIER, flags);
 	if (ret)
 		return ret;
 
@@ -403,6 +413,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
 
 int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
 				 struct drm_plane *plane,
+				 const struct drm_colorop_funcs *funcs,
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags)
@@ -410,7 +421,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_3D_LUT, flags);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 04af552b3648..d3d73d60727c 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
 						  PLANE_DEGAMMA_SIZE,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
@@ -39,7 +39,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	prev_op = &colorop->base;
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
-	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, NULL,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		return ret;
@@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
 		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
 
-		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
+		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, NULL, 17,
 						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 						   true);
 		if (ret)
@@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	}
 
 	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane, NULL,
 						  PLANE_GAMMA_SIZE,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index d03a1f2e9c41..9e9dd0494628 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
@@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 0f5ba72c1704..ee6454b08b2d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -187,6 +187,19 @@ struct drm_colorop_state {
 	struct drm_atomic_state *state;
 };
 
+/**
+ * struct drm_colorop_funcs - driver colorop control functions
+ */
+struct drm_colorop_funcs {
+	/**
+	 * @destroy:
+	 *
+	 * Clean up colorop resources. This is called at driver unload time
+	 * through drm_mode_config_cleanup()
+	 */
+	void (*destroy)(struct drm_colorop *colorop);
+};
+
 /**
  * struct drm_colorop - DRM color operation control structure
  *
@@ -362,6 +375,8 @@ struct drm_colorop {
 	 */
 	struct drm_property *next_property;
 
+	/** @funcs: colorop control functions */
+	const struct drm_colorop_funcs *funcs;
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
 void drm_colorop_cleanup(struct drm_colorop *colorop);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
+				    struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				    u64 supported_tfs, uint32_t flags);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size,
+					struct drm_plane *plane,
+					const struct drm_colorop_funcs *funcs,
+					uint32_t lut_size,
 					enum drm_colorop_lut1d_interpolation_type interpolation,
 					uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane, uint32_t flags);
+				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				   uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-				struct drm_plane *plane, uint32_t flags);
+				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				uint32_t flags);
 int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				 struct drm_plane *plane,
+				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags);
-- 
2.25.1

