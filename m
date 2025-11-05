Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E83C359EC
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1393F10E73B;
	Wed,  5 Nov 2025 12:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e00vA6s2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9510E743;
 Wed,  5 Nov 2025 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345414; x=1793881414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=enLHRVlyw5g0aUDOB/6XfkCMwc/amXXa1UE1pyp0T5E=;
 b=e00vA6s29YxKkuFs4NgGHMZBj10ZFZiG1H6RDa+K0KUnYf6zOFKPynZ7
 KLaeIv0ngNOn5Coy7W0Jj9Z3kmgNlmdbRZLUYFXuWckHj9HPQZsX6SJ7a
 BwB3AuVa+huDU06D1yQM55gZHsegXCotEtbC1rePMKz2/cBlf4qMiRfD6
 ugHgk/7VpgzcJmSeCLWKSdFnf3DU/SAZ8dH1VkBH6858xS7T6DaYkdXma
 OzKREZFGsnqg84G7bzPHtT90xu1XlVvtFsd2PS6HBXMP1djX6hUepq/jz
 697Uadawe9Rn/Urk2qYuVYC0wst4GnzFk2rkroNeNDV0Y8XeoRi8a5Wrh Q==;
X-CSE-ConnectionGUID: 1ihsOa2PT22J6uRghcKZJw==
X-CSE-MsgGUID: eQOx51LaT66B8pWm8yL2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64384381"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64384381"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:34 -0800
X-CSE-ConnectionGUID: v2EmiW+CRcW9pIrU8XF/1Q==
X-CSE-MsgGUID: r1VnPiQ+Q2u8eoNsJ1lDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740414"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:30 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 16/16] drm/i915/color: Enable Plane Color Pipelines
Date: Wed,  5 Nov 2025 18:04:12 +0530
Message-ID: <20251105123413.2671075-17-uma.shankar@intel.com>
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

Expose color pipeline and add ability to program it.

v2: Set bit to enable multisegmented lut
v3: s/drm_color_lut_32/drm_color_lut32 (Simon)
v4: - Fix dsb programming
    - Remove multi-segment LUT, they will be added in later patches
    - Add pipeline only to TGL+
    - Code Refactor

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  5 ++++-
 .../drm/i915/display/skl_universal_plane.c    | 21 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 42ec78798666..ea898a0bdefb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7284,6 +7284,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	unsigned int size = new_crtc_state->plane_color_changed ? 8192 : 1024;
 
 	if (!new_crtc_state->use_flipq &&
 	    !new_crtc_state->use_dsb &&
@@ -7294,10 +7295,12 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 	 * Rough estimate:
 	 * ~64 registers per each plane * 8 planes = 512
 	 * Double that for pipe stuff and other overhead.
+	 * ~4913 registers for 3DLUT
+	 * ~200 color registers * 3 HDR planes
 	 */
 	new_crtc_state->dsb_commit = intel_dsb_prepare(state, crtc, INTEL_DSB_0,
 						       new_crtc_state->use_dsb ||
-						       new_crtc_state->use_flipq ? 1024 : 16);
+						       new_crtc_state->use_flipq ? size : 16);
 	if (!new_crtc_state->dsb_commit) {
 		new_crtc_state->use_flipq = false;
 		new_crtc_state->use_dsb = false;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba1bf0bd4c55..f58d17842c24 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -11,6 +11,8 @@
 
 #include "pxp/intel_pxp.h"
 #include "intel_bo.h"
+#include "intel_color.h"
+#include "intel_color_pipeline.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
@@ -1276,6 +1278,18 @@ static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
 	if (plane_state->force_black)
 		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
 
+	if (plane_state->hw.degamma_lut)
+		plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
+
+	if (plane_state->hw.ctm)
+		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
+
+	if (plane_state->hw.gamma_lut) {
+		plane_color_ctl &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
+		if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
+			plane_color_ctl |= PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
+	}
+
 	return plane_color_ctl;
 }
 
@@ -1557,6 +1571,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
+	intel_color_plane_program_pipeline(dsb, plane_state);
+
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
 		crtc_x = 0;
@@ -1658,6 +1674,8 @@ icl_plane_update_arm(struct intel_dsb *dsb,
 
 	icl_plane_update_sel_fetch_arm(dsb, plane, crtc_state, plane_state);
 
+	intel_color_plane_commit_arm(dsb, plane_state);
+
 	/*
 	 * In order to have FBC for fp16 formats pixel normalizer block must be
 	 * active. Check if pixel normalizer block need to be enabled for FBC.
@@ -3001,6 +3019,9 @@ skl_universal_plane_create(struct intel_display *display,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	if (DISPLAY_VER(display) >= 12)
+		intel_color_pipeline_plane_init(&plane->base, pipe);
+
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
 					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-- 
2.50.1

