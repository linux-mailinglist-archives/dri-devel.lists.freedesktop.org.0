Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFFA4FFF2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA0D10E798;
	Wed,  5 Mar 2025 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIOSZoSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7504E10E7B5;
 Wed,  5 Mar 2025 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180505; x=1772716505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/NoBQjTFYrzIL0DrIijUUvJ3KmFWPJSxw9U3Yeql4w=;
 b=lIOSZoSoa/NX9HQltMxxCQUueitDih3wiAemKMEvKj1ivYYcvSieLB8f
 hxxHkD2I9qVQk2YNF4qerL0QDe6KsjbuyNZ7GaZHtM8QXepIym6Mbtqb4
 aQn9WKkn2Q2rz5jaGMYgoouaZil9+HmuZ6x9dqTBFNKVK3MMk4u7Sh464
 AV299KVw+ElsUjrWcL++U5RjNnwEW7D6nv1y976zT4LaTeJb+cWHIbAkv
 LJDYoH++bFxqGZairF6l3jQOzUnrEMN/NGSJ4xAR1Iw0ov8egqemQShat
 vaUnH9p/YZ1eIAHr0BUBb2ya07Nt1yl7+6ek6PxCzcWN42VH2Ak3BkDgC Q==;
X-CSE-ConnectionGUID: aliSmkoCScu45p1iiltZpw==
X-CSE-MsgGUID: 1b/nCU6KQhOf5zWa+ND3MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685560"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:04 -0800
X-CSE-ConnectionGUID: mn+iQCHIS1eQ92y2uPVJEQ==
X-CSE-MsgGUID: sVHjodV+TmyRU8YmaUNUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701184"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:00 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 14/23] drm/i915/color: Add callbacks to set plane CTM
Date: Wed,  5 Mar 2025 18:55:59 +0530
Message-ID: <20250305132608.2379253-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 23 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index cf508094a038..ac4bf97741a3 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -31,6 +31,7 @@
 #include "intel_dsb.h"
 #include "intel_vrr.h"
 #include "skl_universal_plane.h"
+#include "skl_universal_plane_regs.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -86,6 +87,10 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/* Plane CSC*/
+	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
+				      const struct drm_property_blob *blob);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3811,6 +3816,15 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
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
@@ -4114,6 +4128,15 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
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
index 7be2453eee0a..c8d4f23cfb99 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -50,5 +50,6 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 int intel_plane_color_init(struct drm_plane *plane);
 void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
-
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
+				       const struct drm_property_blob *blob);
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

