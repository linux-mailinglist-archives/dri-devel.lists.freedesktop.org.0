Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D49D9856
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAA10E8A7;
	Tue, 26 Nov 2024 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMrOZlVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138B10E8A4;
 Tue, 26 Nov 2024 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627233; x=1764163233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZIiJ34MjeD6nIC5UwTqgUF8GJz6sgebezQ7fXKyHEk=;
 b=UMrOZlVvgDFvm+u4HEjEUMA+6O29iV3241wt0Q1nrnfUPmAT1iKyE3BY
 HRsHsDsl/ITmHgC8sxgSfMAh0eCjCZkxgXD8WXbfVjOhy4P6RooZvN3nd
 RiunD/L0jQUndgXNrSCTG9u9VShAdFxpZSDO/z3IxTPVxbgJ9D/V+pnOv
 tVfSA5bq/EUsPi3dU4ifopkalLF213sknHLRdJJAl1HKQgJSqbndZs5rm
 NsT9xfoSWTm9nuu+WISAiBhkJsVbAHCWiOjlw1dq7t9aJ3TLYsc27xB7y
 hgDGDZPBWdGB+0l2wSxkoSNmKHSbZZAyZCGDK+Ho3sGleq2RItCOMUkct g==;
X-CSE-ConnectionGUID: kyIoillVQaClgxDw3XlZQA==
X-CSE-MsgGUID: OULzF2CWS2yOrIsoP/mDTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170352"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:32 -0800
X-CSE-ConnectionGUID: CGGZyDlNRvy5spDUK61QrA==
X-CSE-MsgGUID: EYDC0l++SXiL7rO5U9ul0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874889"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:28 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 16/25] drm/i915/color: Add callbacks to set plane CTM
Date: Tue, 26 Nov 2024 18:57:21 +0530
Message-ID: <20241126132730.1192571-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add callback to intel color functions for setting plane CTM.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 23 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 01bd5820a12b..26c51334f3b7 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -29,6 +29,7 @@
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 #include "skl_universal_plane.h"
+#include "skl_universal_plane_regs.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -84,6 +85,10 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/* Plane CSC*/
+	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
+				      const struct drm_property_blob *blob);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3784,6 +3789,15 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
+				       const struct drm_property_blob *blob)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_plane_csc_matrix)
+		i915->display.funcs.color->load_plane_csc_matrix(plane_state, blob);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -4087,6 +4101,15 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
 			  struct drm_colorop *colorop,
 			  u32 *plane_color_ctl)
 {
+	struct drm_colorop_state *state = colorop->state;
+	struct intel_plane_colorop *intel_colorop = to_intel_plane_colorop(colorop);
+
+	if (colorop->type == DRM_COLOROP_CTM_3X3) {
+		/* TODO: use intel_color_op state data */
+		(*plane_color_ctl) |= PLANE_COLOR_PLANE_CSC_ENABLE;
+		if (state->data && intel_colorop->id == CB_PLANE_CSC)
+			intel_color_load_plane_csc_matrix(plane_state, state->data);
+	}
 }
 
 void intel_program_pipeline(const struct drm_plane_state *plane_state, u32 *plane_color_ctl)
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 7be2453eee0a..522d1ddd574a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -50,5 +50,7 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 int intel_plane_color_init(struct drm_plane *plane);
 void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
+				       const struct drm_property_blob *blob);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

