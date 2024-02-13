Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AD852951
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06C10EA88;
	Tue, 13 Feb 2024 06:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1TBIgZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0910EAA1;
 Tue, 13 Feb 2024 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806593; x=1739342593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BYuHGllUddxmTPlr1lHGLjXYibQJKNeFCWdCj86T/v0=;
 b=W1TBIgZL3OjClbxxH+19H5AhOiiiIE3Y6muqN+ta3sLp76duBDXDdvuh
 dtTR4hLHgD0A6SIMumLO3d/JuRqi4TpbGwAitBx89q5QZie0IiSk5fQOS
 3YMWjT144ukHUKtdNYuwF51nrmaNQ0iN5FIaUY4titJQ0i968hVbJm7EE
 SmOemSTYnmcIq9spVr9F0fS/A+e+J+m1sREWcI2eqT9WYdx3aS7EZ2iPq
 178W274bOHCL+ckvzkqz8gF55Ykun7HRrKM28oETK5msmY2Q0GOi2+/b0
 fwpbCRyJ+P3k0d+4PCs+xF5sGOHinC1J4XmE3/3h9Bghn+v/r89Uq+hCQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948241"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450650"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:43:06 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 23/28] drm/i915/color: Add framework to program PRE/POST CSC
 LUT
Date: Tue, 13 Feb 2024 12:18:30 +0530
Message-ID: <20240213064835.139464-24-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
index 85c4b6a9d5f9..0d68f8303502 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -85,6 +85,10 @@ struct intel_color_funcs {
 	/* Plane CSC*/
 	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
 				      const struct drm_property_blob *blob);
+
+	/* Plane Pre/Post CSC */
+	void (*load_plane_luts)(const struct drm_plane_state *plane_state,
+				const struct drm_property_blob *blob, bool is_pre_csc);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3775,6 +3779,20 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
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
@@ -3823,6 +3841,7 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
@@ -4053,6 +4072,14 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
 		(*plane_color_ctl) |= PLANE_COLOR_PLANE_CSC_ENABLE;
 		if (state->data && intel_colorop->id == CB_PLANE_CSC)
 			intel_color_load_plane_csc_matrix(plane_state, state->data);
+	} else if (colorop->type == DRM_COLOROP_1D_LUT) {
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
index 3f1466f88c11..1830a85a696b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -45,5 +45,7 @@ void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
 void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
 				       const struct drm_property_blob *blob);
+void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
+				 const struct drm_property_blob *blob, bool is_pre_csc);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

