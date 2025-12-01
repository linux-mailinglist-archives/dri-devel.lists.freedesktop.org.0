Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93500C95E0A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3C210E2D1;
	Mon,  1 Dec 2025 06:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Arv7Q2iU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660610E2C6;
 Mon,  1 Dec 2025 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570959; x=1796106959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VkVEvmec002RFwYfNPyMZ+NjcRRF+OHpkdmOsXACe3A=;
 b=Arv7Q2iUCBoCmN5wLij8zRX5KJkFOWUVOhm7IRbuyvmuQbaGKqJDt1E0
 8yKr5fCY4cSFJm/DAFku7ih3sgXHBbGEOFwQUrAL8WDVlzLbWZ778ZtqE
 AJI4/sOM2TZcRtDUyQO7PQ5Dg/SxboxvLgcMDa3a8LIvRCVCIqlkEyxgp
 VNLYJCm2ogmRn7YPoQ1VHmiG8QKyUF7lOJu65uqQoyFQt3sg1o9JzLKuc
 dvoORqxabtPsyhJE28/VR/ny1a2BuD6jyvYAHE00HC4RabZRRD7fhHWcT
 RQ70AgkauMtscAuVIPA8j4UnzsoQvUMA9VRKtd04kMhE3RJ7WXiKn1dEz A==;
X-CSE-ConnectionGUID: +Cv2iqCzR4+J7D1tSQsoNQ==
X-CSE-MsgGUID: Snt05Dk7ShG2VKvHQINpCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663230"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:58 -0800
X-CSE-ConnectionGUID: d6Vub/KlSMCq2mnSPXNgOA==
X-CSE-MsgGUID: DeBtVaqxSEq3kOLFmzzchg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806107"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:53 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 10/15] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Mon,  1 Dec 2025 12:16:50 +0530
Message-ID: <20251201064655.3579280-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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
index 2f8e985d51e5..4ca359d68730 100644
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
@@ -4077,11 +4081,23 @@ intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
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
index 6d8217497583..c419a814cb34 100644
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
index 328b12af4d27..4e6ddb36b872 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -348,6 +348,10 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
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

