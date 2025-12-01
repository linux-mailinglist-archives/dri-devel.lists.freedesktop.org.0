Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6CC961C7
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A03910E2FC;
	Mon,  1 Dec 2025 08:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcqsF3G+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B6910E2F7;
 Mon,  1 Dec 2025 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577723; x=1796113723;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=OnoQw+WGMOSua69IZF429WXsBNR+plizO3e0OgMJIsU=;
 b=HcqsF3G+tDCIEIyXfYhiAByCQkkBi8+SUUQAbDdEfRrOGGXPjupyhk4+
 qqSR7Wv6AgpjH2kLPao7N+F87KaVjIOMqqIb28E1CPIwkpeY9BK9dFwnM
 NDE1kb7wua51jChTKPbP9egK1Y0FBSmLRRmgDOT3OPMxM3zem0eG/2ngr
 3t1qE/+I016xNLzzLwgDnZv5kGL4UYmpaN+nmAZ7YWym0gcA/8BsW8YMP
 s0RUyL859gb8OLrocjGK316zRh7w1btP/Qt6exapD8otrq6wX2vru7tB/
 kyWEgu5Fz+5oYTV22H1IB2ndD1vydiSYpMC6RuvMRXC97KMccGVbXzz+Q Q==;
X-CSE-ConnectionGUID: tD2MH56RSLG1M3SGzQxPpg==
X-CSE-MsgGUID: +sCNRF78TViuXgpKRh6Jgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578287"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:28:39 -0800
X-CSE-ConnectionGUID: dUz1XNkAQ5a/O60GuH7lEg==
X-CSE-MsgGUID: md3xzBmpQI2rnUE2TCxZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352494"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:28:32 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:43 +0530
Subject: [PATCH v9 01/20] DO_NOT_REVIEW: plane/crtc color pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-1-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Squashed patch for plane and crtc pipeline implementation in drm.
https://patchwork.freedesktop.org/series/152970/
https://patchwork.freedesktop.org/patch/675255

Note: Entire series is not taken
       AMD changes not take!

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/Makefile                           |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  2 +-
 drivers/gpu/drm/drm_atomic.c                       |  3 +
 drivers/gpu/drm/drm_atomic_uapi.c                  | 64 ++++++++++++++++--
 drivers/gpu/drm/drm_colorop.c                      | 35 ++++++++--
 drivers/gpu/drm/drm_connector.c                    |  1 +
 drivers/gpu/drm/drm_crtc.c                         | 77 ++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h                |  6 ++
 drivers/gpu/drm/drm_ioctl.c                        | 12 ++++
 drivers/gpu/drm/drm_mode_object.c                  | 16 +++++
 include/drm/drm_atomic.h                           | 20 ++++++
 include/drm/drm_atomic_uapi.h                      |  2 +
 include/drm/drm_colorop.h                          |  4 ++
 include/drm/drm_crtc.h                             | 27 ++++++++
 include/drm/drm_drv.h                              |  6 ++
 include/drm/drm_file.h                             | 21 ++++--
 include/uapi/drm/drm.h                             | 44 +++++++++++++
 18 files changed, 327 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4b3f3ad5058a32288561c1e576012f5f9a55c423..6987bb6745c2a3377ff38001532a7569745bc0d7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -172,7 +172,7 @@ obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
-obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
+#obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
 obj-$(CONFIG_DRM_I915)	+= i915/
 obj-$(CONFIG_DRM_XE)	+= xe/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1dcc79b35225f5c9128cfd020ce9a37fe6f42d39..9a2834d626106b21b17f57bf4a3dac8edbf2ffbd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -570,7 +570,7 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
  *
  * The matrix needs to be a 3x4 (12 entry) matrix.
  */
-static void __drm_ctm_3x4_to_dc_matrix(const struct drm_color_ctm_3x4 *ctm,
+static void __drm_ctm_3x4_to_dc_matrix(const struct drm_amdgpu_color_ctm_3x4 *ctm,
 				       struct fixed31_32 *matrix)
 {
 	int i;
@@ -1971,7 +1971,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
-	struct drm_color_ctm_3x4 *ctm = NULL;
+	struct drm_amdgpu_color_ctm_3x4 *ctm = NULL;
 	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
@@ -2026,7 +2026,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 
 	/* Setup CRTC CTM. */
 	if (dm_plane_state->ctm) {
-		ctm = (struct drm_color_ctm_3x4 *)dm_plane_state->ctm->data;
+		ctm = (struct drm_amdgpu_color_ctm_3x4 *)dm_plane_state->ctm->data;
 		/*
 		 * DCN2 and older don't support both pre-blending and
 		 * post-blending gamut remap. For this HW family, if we have
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 2e3ee78999d99d4b109620e41c1b6c52784fad0f..337ef1810b9c8d9c0b99c63ba0c3490d1cef7079 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1695,7 +1695,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->ctm,
 							val,
-							sizeof(struct drm_color_ctm_3x4), -1,
+							sizeof(struct drm_amdgpu_color_ctm_3x4), -1,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 67e095e398a34de31e5ae95861512b5f4e6465f6..c15d66834419ee6f6311d91cb0698dacd35269db 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -389,6 +389,7 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	state->crtcs[index].new_state = crtc_state;
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
+	crtc_state->color_pipeline_enabled = state->post_blend_color_pipeline;
 
 	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
 		       crtc->base.id, crtc->name, crtc_state, state);
@@ -475,6 +476,8 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "\tplane_mask=%x\n", state->plane_mask);
 	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
 	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
 
 	if (crtc->funcs->atomic_print_state)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7320db4b8489f10e24ed772094c77e2172951633..f2ba8e4c2bf2317880eed9d17f7ba3b113f2c057 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -394,8 +394,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 }
 
 static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
-		struct drm_crtc_state *state, struct drm_property *property,
-		uint64_t val)
+		struct drm_crtc_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -404,7 +404,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 
 	if (property == config->prop_active)
 		state->active = val;
-	else if (property == config->prop_mode_id) {
+	else if (property == crtc->color_pipeline_property) {
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		drm_atomic_set_colorop_for_crtc(state, colorop);
+	} else if (property == config->prop_mode_id) {
 		struct drm_property_blob *mode =
 			drm_property_lookup_blob(dev, val);
 		ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
@@ -413,6 +423,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
+		if (file_priv->post_blend_color_pipeline) {
+			drm_dbg_atomic(dev,
+				"Setting DEGAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
@@ -429,6 +444,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
+		if (file_priv->post_blend_color_pipeline) {
+			drm_dbg_atomic(dev,
+				"Setting GAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
@@ -487,6 +507,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
+	else if (property == crtc->color_pipeline_property)
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	else if (property == crtc->sharpness_strength_property)
 		*val = state->sharpness_strength;
 	else if (crtc->funcs->atomic_get_property)
@@ -722,6 +744,34 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 						 &replaced);
 }
 
+/**
+ * drm_atomic_set_colorop_for_crtc - set colorop for crtc
+ * @crtc_state: atomic state object for the crtc
+ * @colorop: colorop to use for the crtc
+ *
+ * Helper function to select the color pipeline on a crtc by setting
+ * it to the first drm_colorop element of the pipeline.
+ */
+void
+drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
+				 struct drm_colorop *colorop)
+{
+	struct drm_crtc *crtc = crtc_state->crtc;
+
+	if (colorop)
+		drm_dbg_atomic(crtc->dev,
+			       "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
+			       colorop->base.id, crtc->base.id, crtc->name,
+			       crtc_state);
+	else
+		drm_dbg_atomic(crtc->dev,
+			       "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
+			       crtc->base.id, crtc->name, crtc_state);
+
+	crtc_state->color_pipeline = colorop;
+}
+EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
+
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 					   struct drm_colorop_state *state,
 					   struct drm_file *file_priv,
@@ -1050,8 +1100,11 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 
 		if (colorop->plane)
 			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
+		else if (colorop->crtc)
+			WARN_ON(!drm_modeset_is_locked(&colorop->crtc->mutex));
 
-		ret = drm_atomic_colorop_get_property(colorop, colorop->state, property, val);
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);
 		break;
 	}
 	default:
@@ -1206,7 +1259,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		}
 
 		ret = drm_atomic_crtc_set_property(crtc,
-				crtc_state, prop, prop_value);
+				crtc_state, file_priv, prop, prop_value);
 		break;
 	}
 	case DRM_MODE_OBJECT_PLANE: {
@@ -1606,6 +1659,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
+	state->post_blend_color_pipeline = file_priv->post_blend_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2e88b1e606c3b435ba30a88d4cfcb..96eaaa078281a48dad057e06900b112ebb032631 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -28,6 +28,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
 
 #include "drm_crtc_internal.h"
 
@@ -92,9 +93,9 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 
 /* Init Helpers */
 
-static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, enum drm_colorop_type type,
-				  uint32_t flags)
+static int drm_common_colorop_init(struct drm_device *dev,
+				   struct drm_colorop *colorop,
+				   enum drm_colorop_type type, uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -107,7 +108,6 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->base.properties = &colorop->properties;
 	colorop->dev = dev;
 	colorop->type = type;
-	colorop->plane = plane;
 	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
@@ -156,6 +156,33 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	return ret;
 }
 
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, enum drm_colorop_type type,
+				  uint32_t flags)
+{
+	int ret = 0;
+
+	ret = drm_common_colorop_init(dev, colorop, type, flags);
+
+	colorop->plane = plane;
+
+	return ret;
+}
+
+static int drm_crtc_colorop_init(struct drm_device *dev,
+				 struct drm_colorop *colorop,
+				 struct drm_crtc *crtc,
+				 enum drm_colorop_type type, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_common_colorop_init(dev, colorop, type, flags);
+
+	colorop->crtc = crtc;
+
+	return ret;
+}
+
 /**
  * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
  *
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4dbb9ddbedf724dc7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	 */
 	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
 			file_priv->plane_color_pipeline,
+			file_priv->post_blend_color_pipeline,
 			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
 			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
 			&out_resp->count_props);
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index a7797d260f1e2fe5fae2127b340b39318e30a3e2..d1650dfbe6062c8ac9a5da3af1ac499113a6645a 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -994,3 +994,80 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
 	return hweight32(crtc_state->encoder_mask) > 1;
 }
 EXPORT_SYMBOL(drm_crtc_in_clone_mode);
+
+struct drm_property *
+drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
+					  const struct drm_prop_enum_list *pipelines,
+					  int num_pipelines)
+{
+	struct drm_prop_enum_list *all_pipelines;
+	struct drm_property *prop;
+	int len = 0;
+	int i;
+
+	all_pipelines = kcalloc(num_pipelines + 1,
+				sizeof(*all_pipelines),
+				GFP_KERNEL);
+
+	if (!all_pipelines) {
+		drm_err(dev, "failed to allocate color pipeline\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Create default Bypass color pipeline */
+	all_pipelines[len].type = 0;
+	all_pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add all other color pipelines */
+	for (i = 0; i < num_pipelines; i++, len++) {
+		all_pipelines[len].type = pipelines[i].type;
+		all_pipelines[len].name = pipelines[i].name;
+	}
+
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					all_pipelines, len);
+	if (IS_ERR(prop)) {
+		kfree(all_pipelines);
+		return prop;
+	}
+
+	drm_object_attach_property(obj, prop, 0);
+
+	kfree(all_pipelines);
+	return prop;
+}
+
+/**
+ * drm_crtc_create_color_pipeline_property - create a new color pipeline
+ * property
+ *
+ * @crtc: drm CRTC
+ * @pipelines: list of pipelines
+ * @num_pipelines: number of pipelines
+ *
+ * Create the COLOR_PIPELINE CRTC property to specify color pipelines on
+ * the CRTC.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
+					    const struct drm_prop_enum_list *pipelines,
+					    int num_pipelines)
+{
+	struct drm_property *prop;
+
+	prop = drm_common_create_color_pipeline_property(crtc->dev,
+							 &crtc->base,
+							 pipelines,
+							 num_pipelines);
+	if (IS_ERR(prop))
+		return PTR_ERR(prop);
+
+	crtc->color_pipeline_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_color_pipeline_property);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c094092296448093c5cd192ecdc8ea9a50769c90..c53f154e5392a10c326c844b7321666275f9ac02 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -35,6 +35,7 @@
 #ifndef __DRM_CRTC_INTERNAL_H__
 #define __DRM_CRTC_INTERNAL_H__
 
+#include <drm/drm_property.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crtc,
 int drm_crtc_register_all(struct drm_device *dev);
 void drm_crtc_unregister_all(struct drm_device *dev);
 int drm_crtc_force_disable(struct drm_crtc *crtc);
+struct drm_property *
+drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
+					  const struct drm_prop_enum_list *pipelines,
+					  int num_pipelines);
 
 struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
 
@@ -164,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
 				struct drm_mode_object *object);
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   bool plane_color_pipeline,
+				   bool post_blend_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ff193155129e7e863888d8958458978566b144f8..ea9600f5392f520a2b42ba7ef363d2f08ce19812 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_POST_BLEND_COLOR_PIPELINE:
+		req->value = drm_core_check_feature(dev, DRIVER_POST_BLEND_COLOR_PIPELINE);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -380,6 +383,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->plane_color_pipeline = req->value;
 		break;
+	case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		if (!drm_core_check_feature(dev, DRIVER_POST_BLEND_COLOR_PIPELINE))
+			return -EINVAL;
+		file_priv->post_blend_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..40e979af34a34a8127bb2e48e74192049c9ca6cc 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
 /* helper for getconnector and getproperties ioctls */
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   bool plane_color_pipeline,
+				   bool post_blend_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props)
@@ -416,6 +417,20 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				continue;
 		}
 
+		if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
+			struct drm_crtc *crtc = obj_to_crtc(obj);
+
+			if (prop == crtc->color_pipeline_property)
+				continue;
+		}
+
+		if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
+			struct drm_crtc *crtc = obj_to_crtc(obj);
+
+			if (prop == crtc->color_pipeline_property)
+				continue;
+		}
+
 		if (*arg_count_props > count) {
 			ret = __drm_object_property_get_value(obj, prop, &val);
 			if (ret)
@@ -475,6 +490,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
 			file_priv->plane_color_pipeline,
+			file_priv->post_blend_color_pipeline,
 			(uint32_t __user *)(unsigned long)(arg->props_ptr),
 			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
 			&arg->count_props);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 43783891d3594be1031e5ba5bde7b02545e08592..673c6eeaaefc8e87c44d85e27be449ec79a7ab36 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -473,6 +473,26 @@ struct drm_atomic_state {
 	 */
 	struct drm_device *dev;
 
+	/**
+	 * @post_blend_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - GAMMA_LUT
+	 *  - DEGAMMA_LUT
+	 *  - GAMMA_LUT_SIZE
+	 *  - CTM
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool post_blend_color_pipeline : 1;
+
 	/**
 	 * @allow_modeset:
 	 *
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 4363155233267b93767c895fa6085544e2277442..4dc191f6f929d73deee9812025c48275a33cf770 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -52,6 +52,8 @@ void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
 void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 				      struct drm_colorop *colorop);
+void drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
+				     struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a3a32f9f918c73cc2ea9c6d6967d92eca4eff8b8..33cb6a2446dacf612d5f4dc35674e7518dfa9c58 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,8 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+struct drm_crtc;
+
 /* DRM colorop flags */
 #define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
 
@@ -228,6 +230,8 @@ struct drm_colorop {
 	 */
 	struct drm_plane *plane;
 
+	struct drm_crtc *crtc;
+
 	/**
 	 * @state:
 	 *
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd68e69e9d0724ea5a33f93231e3f8b..e58a732b720174135a17d3b4d63c6355d6eddfe4 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,22 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @color_pipeline:
+	 *
+	 * The first colorop of the active color pipeline, or NULL, if no
+	 * color pipeline is active.
+	 */
+	struct drm_colorop *color_pipeline;
+
+	/**
+	 * @color_pipeline_enabled:
+	 *
+	 * Whether color management should be done based on the &color_pipeline
+	 * or the legacy color properties (&ctm, &gamma_lut and &degamma_lut).
+	 */
+	bool color_pipeline_enabled;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1093,6 +1109,14 @@ struct drm_crtc {
 	/** @properties: property tracking for this CRTC */
 	struct drm_object_properties properties;
 
+	/**
+	 * @color_pipeline_property:
+	 *
+	 * Optional "COLOR_PIPELINE" enum property for specifying
+	 * a color pipeline to use on the CRTC.
+	 */
+	struct drm_property *color_pipeline_property;
+
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
 	 * scaling.
@@ -1340,6 +1364,9 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
 int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986dee9261f8b08c4fc7d93b8d6d9769..6b0f4904e69766232283d430c2540d30afef850f 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -122,6 +122,12 @@ enum drm_driver_feature {
 	 * the cursor planes to work correctly).
 	 */
 	DRIVER_CURSOR_HOTSPOT           = BIT(9),
+	/**
+	 * @DRIVER_POST_BLEND_COLOR_PIPELINE:
+	 *
+	 * Driver supports post-blend color pipeline.
+	 */
+	DRIVER_POST_BLEND_COLOR_PIPELINE		= BIT(10),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 1a3018e4a537b3341acb50187d47371f6b781b9d..af848676427291e28c13a8d516e1a3ea00263737 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -206,13 +206,6 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
-	/**
-	 * @plane_color_pipeline:
-	 *
-	 * True if client understands plane color pipelines
-	 */
-	bool plane_color_pipeline;
-
 	/**
 	 * @was_master:
 	 *
@@ -224,6 +217,20 @@ struct drm_file {
 	 */
 	bool was_master;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * True if client understands plane color pipelines
+	 */
+	bool plane_color_pipeline;
+
+	/**
+	 * @post_blend_color_pipeline:
+	 *
+	 * True if client understands post-blend color pipelines
+	 */
+	bool post_blend_color_pipeline;
+
 	/**
 	 * @is_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d275c7a7fe057840ef792f30a582bb7..732104ba83ffc5b089dcb1934359eaff11486934 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -812,6 +812,12 @@ struct drm_gem_change_handle {
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+/**
+ * DRM_CAP_POST_BLEND_COLOR_PIPELINE
+ *
+ * If set to 1, the driver supports post-blend color pipelines.
+ */
+#define DRM_CAP_POST_BLEND_COLOR_PIPELINE	0x16
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
@@ -921,6 +927,44 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
 
+/**
+ * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_crtc, as well as drm_colorop properties.
+ *
+ * Setting of these crtc properties will be rejected when this client
+ * cap is set:
+ * - GAMMA_LUT
+ * - DEGAMMA_LUT
+ * - CTM
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This client cap can only be set if the driver sets the corresponding driver
+ * cap &DRM_CAP_POST_BLEND_COLOR_PIPELINE.
+ */
+#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
+
+/**
+ * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_crtc, as well as drm_colorop properties.
+ *
+ * Setting of these crtc properties will be rejected when this client
+ * cap is set:
+ * - GAMMA_LUT
+ * - DEGAMMA_LUT
+ * - CTM
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This client cap can only be set if the driver sets the corresponding driver
+ * cap &DRM_CAP_POST_BLEND_COLOR_PIPELINE.
+ */
+#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;

-- 
2.25.1

