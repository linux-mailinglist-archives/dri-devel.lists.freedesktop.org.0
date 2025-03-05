Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C91A50000
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1C310E7C8;
	Wed,  5 Mar 2025 13:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5PDcADs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8B10E7AB;
 Wed,  5 Mar 2025 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180523; x=1772716523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nSlQLjolFpy+L9Sg8t+dpjk4rZgBROxYlvUERjwIkMY=;
 b=X5PDcADsVin4ASYdBjrej2cxdnKtAt6SukunTQELdUtUlut9drs3iFwU
 4sGErTHPKuit1VAtHcuilv/goW9m+j5Kqt5BjNRfgFKxFucIXr0CVgqcO
 2LRRKUZ5GyZVcLac7YTso+Z1xU6BWUH7sqUXHE4c0/cxnXJX1cAYtz12j
 RkITM7xJ8xPKpCrkeHEW//PuRkWpNqNJu+TXvAnAjz/2wHQ0aTJSJe8+Q
 eJD6W0YnQFfEE5yUw0iV2kYPp+wr9hdHEFDaKa/ab7eBMIYoDA9+i/bP5
 4fzUXu4fwqCfa5NrjsflsCht7mMEydJfDg2i61Mmjhhfa7T4TpAB1mEEY g==;
X-CSE-ConnectionGUID: ClXwZ4UuSoi1RpABDaoDVA==
X-CSE-MsgGUID: y33vMu/8S+e6gKCgXH3iHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685601"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685601"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:23 -0800
X-CSE-ConnectionGUID: zAB5mDqjSq+HVA/XZtgDgg==
X-CSE-MsgGUID: zq0LBmCzTjqT9qusyL6CFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701232"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:18 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 18/23] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Wed,  5 Mar 2025 18:56:03 +0530
Message-ID: <20250305132608.2379253-19-uma.shankar@intel.com>
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

