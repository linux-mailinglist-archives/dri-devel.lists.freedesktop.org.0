Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE18C359C8
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F22410E731;
	Wed,  5 Nov 2025 12:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhwxxOQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709C410E72E;
 Wed,  5 Nov 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345387; x=1793881387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukZBDzFqBLXNTRk+/ermYkYAuCcSbx2RxjyLyzXX/iU=;
 b=WhwxxOQznKtIBGcjDLj0USxjEjqnx7H/Je2x3H5a4wqhuKKYsohVbN3L
 lMx4o9ADSVyw0B2ePudu0EC25hl6JiO+tC0xrGgHx+CZ7hk4vE37B+yiX
 Jnx29NGNuGS6Tm89eeuf73f2q7U7C4PVuQzqpxLxGPlyNYq1vu6Vgpyuc
 QncWAZ1/ExMuAV1m83ZBWScqicVgbE6rd7HsrzKAxaoellqpC0HIzkFuv
 oIJZjsKMROhEA1IQLuB8U1wWZ+KzYnggzg2y3Woth0GXdqM0OinzXzs1F
 iHqUdpB3rU1cvruwvXzmk3zVjo3NnXV7Sxkg4S0cW8Lg6BOZlaL4tvZdf Q==;
X-CSE-ConnectionGUID: gd64CEuxTs2bEv3EgNZViA==
X-CSE-MsgGUID: o11xL2KrSMe8eegeIoCzpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317540"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:07 -0800
X-CSE-ConnectionGUID: 49NpjVdjQQujfaKGuzNnzA==
X-CSE-MsgGUID: XWCW/lxOTsSY2OHhpqNugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740298"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:03 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 10/16] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Wed,  5 Nov 2025 18:04:06 +0530
Message-ID: <20251105123413.2671075-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Add framework that will help in loading LUT to Pre/Post CSC color
blocks.

v2: Add dsb support
v3: Align enum names
v4: Propagate change in lut data to crtc_state

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c       | 16 ++++++++++++++++
 .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c       |  4 ++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index fd3c6b7b0f38..83b0cb519e44 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -93,6 +93,10 @@ struct intel_color_funcs {
 	/* Plane CSC*/
 	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
 				      const struct intel_plane_state *plane_state);
+
+	/* Plane Pre/Post CSC */
+	void (*load_plane_luts)(struct intel_dsb *dsb,
+				const struct intel_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -4076,11 +4080,23 @@ intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
 		display->funcs.color->load_plane_csc_matrix(dsb, plane_state);
 }
 
+static void
+intel_color_load_plane_luts(struct intel_dsb *dsb,
+			    const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+
+	if (display->funcs.color->load_plane_luts)
+		display->funcs.color->load_plane_luts(dsb, plane_state);
+}
+
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 					const struct intel_plane_state *plane_state)
 {
 	if (plane_state->hw.ctm)
 		intel_color_load_plane_csc_matrix(dsb, plane_state);
+	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
+		intel_color_load_plane_luts(dsb, plane_state);
 }
 
 void intel_color_crtc_init(struct intel_crtc *crtc)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d25f90ded71f..d8fe80a55601 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -646,7 +646,7 @@ struct intel_plane_state {
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
-		struct drm_property_blob *ctm;
+		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index a5d0f95a6f10..298f8e186fee 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -344,6 +344,10 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
 {
 	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
 		return drm_property_replace_blob(&plane_state->hw.ctm, blob);
+	else if (intel_colorop->id == INTEL_PLANE_CB_PRE_CSC_LUT)
+		return	drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
+	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
+		return drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
 
 	return false;
 }
-- 
2.50.1

