Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9278C938
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F6510E436;
	Tue, 29 Aug 2023 16:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5E10E427;
 Tue, 29 Aug 2023 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324800; x=1724860800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0iIMb8qITZAdx5HadKHRx6hwV/mNvZm9aWyX0epqTk=;
 b=POWz73e+TBCxomaVGDSzpFYYURlXGlA8OpihimwnnLagS0aOyJUVIrIZ
 KxU8umG+fS6PrEBynm6mvUW9XLiGw6FclV1bW8xlsUlRzvFbu70e2K7lR
 FW0u4mOEVnm24xQJvSyI7LyrWyDj+Q9CDT2+otg5unclKeFva8PTmRhli
 c1O1BPyA7F+h/MQ9WKUM3MntFG/9JmY6EXLm9sZyF+157WsIXT3+rER3D
 YrIntfZNoASYrI5fsjdmA1in8kAo/ci4sdpKC0n8hmsortAL5TIjlrM8x
 JhacSFjAoaiIlDsidO3nIqCP0okJzfOz4hLbW/+uqPJGyX7LkZQguYoYn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769512"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769512"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555278"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555278"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:49 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 33/33] drm/i915/color: Add example implementation for vendor
 specific color operation
Date: Tue, 29 Aug 2023 21:34:22 +0530
Message-ID: <20230829160422.1251087-34-uma.shankar@intel.com>
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

This is an example of how vendor specific color operation could be
supported by the uapi

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 42 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.h    |  1 +
 .../drm/i915/display/skl_universal_plane.c    |  1 +
 include/uapi/drm/i915_drm.h                   | 25 +++++++++++
 4 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2352ddb4a96a..5acc89b0cbf7 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  *
  */
+#include <uapi/drm/i915_drm.h>
 
 #include "i915_reg.h"
 #include "intel_color.h"
@@ -87,6 +88,7 @@ struct intel_color_funcs {
 	 */
 	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state);
 	void (*load_plane_luts)(const struct drm_plane_state *plane_state);
+	void (*load_private)(const struct drm_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -2145,6 +2147,25 @@ static void xelpd_load_plane_csc_matrix(const struct drm_plane_state *state)
 	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
 }
 
+static void xelpd_load_private(const struct drm_plane_state *state)
+{
+	struct drm_i915_private *i915 = to_i915(state->plane->dev);
+	struct i915_color_op_data *op_data;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	int i, num;
+
+	if (icl_is_hdr_plane(i915, plane) || !state->color.private_color_op_data)
+		return;
+
+	op_data = state->color.private_color_op_data->data;
+	num = state->color.private_color_op_data->length / sizeof(struct i915_color_op_data);
+
+	for (i = 0; i < num; i++) {
+		if (op_data[i].flag == I915_COLOR_OP_FIXED_FUNC_CSC)
+			DRM_DEBUG_KMS("CSC OP [%d]", op_data[i].csc_type);
+	}
+}
+
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
@@ -2168,6 +2189,14 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
 		i915->display.funcs.color->load_plane_csc_matrix(plane_state);
 }
 
+void intel_color_load_private(const struct drm_plane_state *plane_state)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_private)
+		i915->display.funcs.color->load_private(plane_state);
+}
+
 void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
@@ -4011,6 +4040,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.read_csc = icl_read_csc,
 	.load_plane_luts = xelpd_plane_load_luts,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_private = xelpd_load_private,
 };
 
 static const struct intel_color_funcs tgl_color_funcs = {
@@ -4284,10 +4314,12 @@ struct drm_color_op color_pipeline_sdr[] = {
 		.type = CURVE_1D,
 		.blob_id = 0, /* To be updated during plane initialization */
 	},
-	/*
-	 * SDR planes have fixed function CSC capabilities.
-	 * TODO: Add support for it
-	 */
+	{
+		.name = DRM_CB_PRIVATE,
+		.type = FIXED_FUNCTION,
+		.blob_id = 0,
+		.private_flags = I915_COLOR_OP_FIXED_FUNC_CSC,
+	},
 	{
 		.name = DRM_CB_POST_CSC,
 		.type = CURVE_1D,
@@ -4367,7 +4399,7 @@ static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 		 * LUT ranges for SDR planes are similar for pre and post-csc blocks
 		 */
 		color_pipeline_sdr[0].blob_id =
-			color_pipeline_sdr[1].blob_id = blob[i++]->base.id;
+			color_pipeline_sdr[2].blob_id = blob[i++]->base.id;
 	}
 
 	blob[i] = drm_property_create_blob(plane->dev,
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index a513c88d3bfc..aa8841f1d1ef 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -34,4 +34,5 @@ void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 void intel_color_plane_init(struct drm_plane *plane);
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state);
 void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state);
+void intel_color_load_private(const struct drm_plane_state *plane_state);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 2e4ca55fdbb2..e7228da3358d 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1283,6 +1283,7 @@ icl_plane_update_noarm(struct intel_plane *plane,
 	if (plane_state->uapi.color_mgmt_changed) {
 		intel_color_load_plane_luts(&plane_state->uapi);
 		intel_color_load_plane_csc_matrix(&plane_state->uapi);
+		intel_color_load_private(&plane_state->uapi);
 	}
 
 	intel_psr2_program_plane_sel_fetch_noarm(plane, crtc_state, plane_state, color_plane);
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7000e5910a1d..e7f87ad0645c 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3841,6 +3841,31 @@ struct drm_i915_gem_create_ext_set_pat {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/* I915 specific color operation */
+#define I915_COLOR_OP_FIXED_FUNC_CSC (1 << 0)
+
+/**
+ * enum i915_csc_operation
+ *
+ * Color conversion operations which can be performed by a fixed function h/w
+ * of type I915_COLOR_OP_FIXED_FUNC_CSC
+ */
+enum i915_csc_operation {
+	I915_CSC_YUV601_TO_RGB601,
+	I915_CSC_YUV709_TO_RGB709,
+	I915_CSC_YUV2020_TO_RGB2020,
+	I915_CSC_RGB709_TO_RGB2020,
+	I915_CSC_MAX,
+};
+
+struct i915_color_op_data {
+	__u32 flag; /* to identify i915 specific color operation */
+	union {
+		enum i915_csc_operation csc_type;
+		/* Add more structures here */
+	};
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.38.1

