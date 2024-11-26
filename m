Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BD9D985E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822010E8B4;
	Tue, 26 Nov 2024 13:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOPZxIZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131E010E8B4;
 Tue, 26 Nov 2024 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627248; x=1764163248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDBFekHAhTInrLTZ/QjY4lNZ05N/183d6/JDYBXNR3s=;
 b=AOPZxIZ/mrNRiSS3QiTP/uhxBFVsSa9IUWmHY6cYS9DfqjOYnh14pHzA
 9eEnMPK8jcGpCt3zlvvrvtDu/XjqAlTCO9VDybHmY1iVYvp8x8ATS+eWQ
 CXCeCh3zq+sepTPAuTUAPLbwhEzw862PW6iHlcrK2wv8Q+twOTf1AI4pg
 y2eUFacT8dV2EQe36GfK4Xuu3HMtQwTthBVgz4se4PGXdXTXmEp5VZAqA
 XGV2xwgLXRyFY+jsyS0YX9+6TndCBLlVQVft1SSH0n0Dn6T6y4II66yaF
 EarhAVzRI87F6Zk7aD6nuWlsj3ROZJdl7z3el8Eh77hxFnNI7kiQ8cldk g==;
X-CSE-ConnectionGUID: C2frGnYORT6oZxx03Yxs3A==
X-CSE-MsgGUID: WqQI9B7GSeWSkLEA163fTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170396"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:47 -0800
X-CSE-ConnectionGUID: w+NHGkS1S9i6fhidINm7vA==
X-CSE-MsgGUID: +7wyEWVcTM6sgr8zEqmKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875009"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:43 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 20/25] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Tue, 26 Nov 2024 18:57:25 +0530
Message-ID: <20241126132730.1192571-21-uma.shankar@intel.com>
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

Add framework that will help in loading LUT to Pre/Post CSC color
blocks.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 27 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index df5d81bbd7e3..736113faaec0 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -89,6 +89,10 @@ struct intel_color_funcs {
 	/* Plane CSC*/
 	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
 				      const struct drm_property_blob *blob);
+
+	/* Plane Pre/Post CSC */
+	void (*load_plane_luts)(const struct drm_plane_state *plane_state,
+				const struct drm_property_blob *blob, bool is_pre_csc);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3876,6 +3880,20 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
 		i915->display.funcs.color->load_plane_csc_matrix(plane_state, blob);
 }
 
+static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
+				  const struct drm_property_blob *blob, bool is_pre_csc)
+{
+}
+
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
+				 const struct drm_property_blob *blob, bool is_pre_csc)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_plane_luts)
+		i915->display.funcs.color->load_plane_luts(plane_state, blob, is_pre_csc);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3935,6 +3953,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
@@ -4199,6 +4218,14 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
 		(*plane_color_ctl) |= PLANE_COLOR_PLANE_CSC_ENABLE;
 		if (state->data && intel_colorop->id == CB_PLANE_CSC)
 			intel_color_load_plane_csc_matrix(plane_state, state->data);
+	} else if (colorop->type == DRM_COLOROP_1D_LUT_MULTSEG) {
+		if (state->data && intel_colorop->id == CB_PLANE_PRE_CSC_LUT) {
+			(*plane_color_ctl) |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
+			intel_color_load_plane_luts(plane_state, state->data, true);
+		} else if (state->data && intel_colorop->id == CB_PLANE_POST_CSC_LUT) {
+			(*plane_color_ctl) &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
+			intel_color_load_plane_luts(plane_state, state->data, false);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 522d1ddd574a..98de1f98651b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -52,5 +52,7 @@ void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
 void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
 				       const struct drm_property_blob *blob);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
+				 const struct drm_property_blob *blob, bool is_pre_csc);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

