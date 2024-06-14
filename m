Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AC9091DF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81F10EE1A;
	Fri, 14 Jun 2024 17:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjXXSQj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007210EE08;
 Fri, 14 Jun 2024 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386753; x=1749922753;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CVWrVwWOSTuyXmThJ/zqgwLPi0g4jtag9/fPj64oZ1Q=;
 b=mjXXSQj4ufArR+fNXwUqQoj11COxoOTvNPLP/HKzQK0Hz6t4/XkNRhlp
 GR+Eti3mEymydZBYDXZ8jd0c/5JcCWsB8CeUWQVo9eF1m+NlVOdC78bEI
 Y/h/ByTNG3okQrR+SeCtFiW/wYpNQIDob+EkoSS80W0K0YSe+5xzAhdJZ
 KFfijs3rxI6xy0NSO9RRfbXZTWD8ZZNyQwtLE6yCEvvtUqDnmDMQs0hH3
 +mcBWkalNFC6tJSx+wRrck3bwYB/JbZThK9/3fv1lUw+vfJusns1D2H58
 yNc0XRjn6zPqJZMz7vcYrGFKsEW7wAmMGGpHK1t5QyrOmRQiP4Xx1EYLK g==;
X-CSE-ConnectionGUID: hKoxS+8mSiC0HKFJlvsbNA==
X-CSE-MsgGUID: xbRWcAd4TKiOmHe0gCWN0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069346"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:12 -0700
X-CSE-ConnectionGUID: UaB8Sox/SPKGhVN45FK50g==
X-CSE-MsgGUID: KkOBvrfZSRSsj6N8P9lylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712462"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:10 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915: Replace BPP_X16_FMT()/ARGS() with
 DRM_X16_FMT()/ARGS()
Date: Fri, 14 Jun 2024 20:39:07 +0300
Message-ID: <20240614173911.3743172-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240614173911.3743172-1-imre.deak@intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
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

Replace BPP_X16_FMT()/ARGS() defined by the driver with the equivalent
DRM_X16_FMT()/ARGS() defined by DRM core.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c       |  5 +++--
 drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
 .../gpu/drm/i915/display/intel_display_types.h   |  3 ---
 drivers/gpu/drm/i915/display/intel_dp.c          | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c      |  4 ++--
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index b9bafec06fb8b..bba303af1dd0d 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
+#include <drm/drm_fixed.h>
 #include <drm/intel/i915_component.h>
 
 #include "i915_drv.h"
@@ -452,8 +453,8 @@ static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
 	lanes = crtc_state->lane_count;
 
 	drm_dbg_kms(&i915->drm,
-		    "h_active = %u link_clk = %u : lanes = %u vdsc_bpp = " BPP_X16_FMT " cdclk = %u\n",
-		    h_active, link_clk, lanes, BPP_X16_ARGS(vdsc_bppx16), cdclk);
+		    "h_active = %u link_clk = %u : lanes = %u vdsc_bpp = " DRM_X16_FMT " cdclk = %u\n",
+		    h_active, link_clk, lanes, DRM_X16_ARGS(vdsc_bppx16), cdclk);
 
 	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bppx16 || !cdclk))
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 179e37cc7df0a..9a9f05debf462 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4671,9 +4671,9 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 
 	if (crtc_state->pipe_bpp > drm_x16_to_int(crtc_state->max_link_bpp_x16)) {
 		drm_dbg_kms(&i915->drm,
-			    "[CRTC:%d:%s] Link bpp limited to " BPP_X16_FMT "\n",
+			    "[CRTC:%d:%s] Link bpp limited to " DRM_X16_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
-			    BPP_X16_ARGS(crtc_state->max_link_bpp_x16));
+			    DRM_X16_ARGS(crtc_state->max_link_bpp_x16));
 		crtc_state->bw_constrained = true;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 128edecb69a20..795bea8ebde11 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2168,9 +2168,6 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
-#define BPP_X16_FMT		"%d.%04d"
-#define BPP_X16_ARGS(bpp_x16)	drm_x16_to_int(bpp_x16), (drm_x16_to_frac(bpp_x16) * 625)
-
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 168852e20f756..f469913472fdb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2247,17 +2247,17 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (ret < 0) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Cannot compute valid DSC parameters for Input Bpp = %d"
-			    "Compressed BPP = " BPP_X16_FMT "\n",
+			    "Compressed BPP = " DRM_X16_FMT "\n",
 			    pipe_config->pipe_bpp,
-			    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16));
+			    DRM_X16_ARGS(pipe_config->dsc.compressed_bpp_x16));
 		return ret;
 	}
 
 	pipe_config->dsc.compression_enable = true;
 	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
-		    "Compressed Bpp = " BPP_X16_FMT " Slice Count = %d\n",
+		    "Compressed Bpp = " DRM_X16_FMT " Slice Count = %d\n",
 		    pipe_config->pipe_bpp,
-		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    DRM_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
 		    pipe_config->dsc.slice_count);
 
 	return 0;
@@ -2310,7 +2310,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 	limits->link.max_bpp_x16 = max_link_bpp_x16;
 
 	drm_dbg_kms(&i915->drm,
-		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " BPP_X16_FMT "\n",
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " DRM_X16_FMT "\n",
 		    encoder->base.base.id, encoder->base.name,
 		    crtc->base.base.id, crtc->base.name,
 		    adjusted_mode->crtc_clock,
@@ -2318,7 +2318,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 		    limits->max_lane_count,
 		    limits->max_rate,
 		    limits->pipe.max_bpp,
-		    BPP_X16_ARGS(limits->link.max_bpp_x16));
+		    DRM_X16_ARGS(limits->link.max_bpp_x16));
 
 	return true;
 }
@@ -2449,10 +2449,10 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	}
 
 	drm_dbg_kms(&i915->drm,
-		    "DP lane count %d clock %d bpp input %d compressed " BPP_X16_FMT " link rate required %d available %d\n",
+		    "DP lane count %d clock %d bpp input %d compressed " DRM_X16_FMT " link rate required %d available %d\n",
 		    pipe_config->lane_count, pipe_config->port_clock,
 		    pipe_config->pipe_bpp,
-		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    DRM_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
 		    intel_dp_config_required_rate(pipe_config),
 		    intel_dp_max_link_data_rate(intel_dp,
 						pipe_config->port_clock,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 09c1ca63362e7..04a900b0e555e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -509,10 +509,10 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
 		return true;
 
 	drm_dbg_kms(&i915->drm,
-		    "[CRTC:%d:%s][CONNECTOR:%d:%s] Increasing link min bpp to " BPP_X16_FMT " in DSC mode due to hblank expansion quirk\n",
+		    "[CRTC:%d:%s][CONNECTOR:%d:%s] Increasing link min bpp to " DRM_X16_FMT " in DSC mode due to hblank expansion quirk\n",
 		    crtc->base.base.id, crtc->base.name,
 		    connector->base.base.id, connector->base.name,
-		    BPP_X16_ARGS(min_bpp_x16));
+		    DRM_X16_ARGS(min_bpp_x16));
 
 	if (limits->link.max_bpp_x16 < min_bpp_x16)
 		return false;
-- 
2.43.3

