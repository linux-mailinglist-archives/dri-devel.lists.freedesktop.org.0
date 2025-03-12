Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868BA5D709
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3988210E707;
	Wed, 12 Mar 2025 07:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6WwTJLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA0E10E706;
 Wed, 12 Mar 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763608; x=1773299608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nSlQLjolFpy+L9Sg8t+dpjk4rZgBROxYlvUERjwIkMY=;
 b=I6WwTJLPT866orB22g47dO+Ncxnt/UT8OWM8JFrFS7F68le4SimtjR0k
 XZ9CQmlWHd06q/HjZ3ZJcBRolP1s1n9IFWB7l2pXZ/y5gndyBvh6Ge2ad
 9xv0MPCINMwVi6WKjO4aogA+/rqD9S/aURsR9jt65CfsS+ch5/o80PUZa
 It53saMl4LVUdCjhXJkWwoQkFc6dqyv3b3C5nlkR1TCJ0Zoe1weXOcvwu
 QGcooztiOa4/+m3aee29BbNa8kKhFB2b54KE3QjL3Pp44/m56bJbbgm9o
 sLCz+5nuHbDrtYaXJP/jyU0m54QZ9QlyNPU2iePYR8CAX3BHlsuOWvLCr g==;
X-CSE-ConnectionGUID: PhgjlOSzT7i2/gLdGD1gRw==
X-CSE-MsgGUID: gXbQCMI9Th64lMABRAdrZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288874"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:26 -0700
X-CSE-ConnectionGUID: 3uD930IgQ5aUskVT2M/QwA==
X-CSE-MsgGUID: uZovimV6QLOnrqmB5PtOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367860"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:21 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 18/23] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Wed, 12 Mar 2025 12:54:20 +0530
Message-ID: <20250312072425.3099205-19-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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
index 9fe5f29c9e68..b650a4d76be4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -91,6 +91,10 @@ struct intel_color_funcs {
 	/* Plane CSC*/
 	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
 				      const struct drm_property_blob *blob);
+
+	/* Plane Pre/Post CSC */
+	void (*load_plane_luts)(const struct drm_plane_state *plane_state,
+				const struct drm_property_blob *blob, bool is_pre_csc);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3903,6 +3907,20 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
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
@@ -3962,6 +3980,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
@@ -4226,6 +4245,14 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
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
index c8d4f23cfb99..5e9a6f2f2ad1 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -52,4 +52,6 @@ void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
 void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
 				       const struct drm_property_blob *blob);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
+				 const struct drm_property_blob *blob, bool is_pre_csc);
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

