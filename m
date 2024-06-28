Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2D91C406
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758D010ECB1;
	Fri, 28 Jun 2024 16:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeBr8b4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF8A10ECA8;
 Fri, 28 Jun 2024 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593094; x=1751129094;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RKzXirmvifyE7eLShQgnGsC7Us854BdGSHX8sqNHZTw=;
 b=NeBr8b4/x3krAFsUn40A3Mbm4DAxAXydFyxTMfDAdqCcy+fkRHVL8471
 AX+X4m/rNaZO/fD0bWpBb/CmAuPrsg10fVMMxKHHu2wpPjANKabMn7G6e
 Hj9t+xOFffFgRQWIxwDkacDkFAAloVQpDEYMHr9EOqOh7jM902QNZjSvI
 AV8TeDBSw49ope/0LdficnU0Rfxo/z0EC8+0TIr/Ztr5z1p94SiBs81Wv
 WVKcJuM6s2MTofSK3x75rYtJHlOEw7XcMlQMhd5APD9Mzi+qjhcd17CzP
 CJ3tY93STCq6IpQB0+RTqSX+ASDLX7MXpZaufHSin7tWxE8z1COXpR3GC A==;
X-CSE-ConnectionGUID: 9sR123eURKaOErKJsYNrFQ==
X-CSE-MsgGUID: p4suqZoUTverT4A+cAydsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620081"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:54 -0700
X-CSE-ConnectionGUID: Tk0ZoZpSQX2o/FnDWSjkew==
X-CSE-MsgGUID: Co0kfds4QyOdGxL4isfHWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519925"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:53 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/i915: Replace BPP_X16_FMT()/ARGS() with
 FXP_Q4_FMT()/ARGS()
Date: Fri, 28 Jun 2024 19:44:48 +0300
Message-ID: <20240628164451.1177612-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

Replace the BPP_X16_FMT()/ARGS() helpers defined by the driver with the
equivalent FXP_Q4_FMT()/ARGS() helpers defined by DRM core.

v2: Rebase on the s/DRM_X16/FXP_Q4 change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c       |  5 +++--
 drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
 .../gpu/drm/i915/display/intel_display_types.h   |  3 ---
 drivers/gpu/drm/i915/display/intel_dp.c          | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c      |  4 ++--
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index b9bafec06fb8b..9b8508a503f7f 100644
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
+		    "h_active = %u link_clk = %u : lanes = %u vdsc_bpp = " FXP_Q4_FMT " cdclk = %u\n",
+		    h_active, link_clk, lanes, FXP_Q4_ARGS(vdsc_bppx16), cdclk);
 
 	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bppx16 || !cdclk))
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 49628dd891883..17dba8aa16694 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4672,9 +4672,9 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 
 	if (crtc_state->pipe_bpp > fxp_q4_to_int(crtc_state->max_link_bpp_x16)) {
 		drm_dbg_kms(&i915->drm,
-			    "[CRTC:%d:%s] Link bpp limited to " BPP_X16_FMT "\n",
+			    "[CRTC:%d:%s] Link bpp limited to " FXP_Q4_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
-			    BPP_X16_ARGS(crtc_state->max_link_bpp_x16));
+			    FXP_Q4_ARGS(crtc_state->max_link_bpp_x16));
 		crtc_state->bw_constrained = true;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e8b42ceed9529..38a0eff249fa8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2178,9 +2178,6 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
-#define BPP_X16_FMT		"%d.%04d"
-#define BPP_X16_ARGS(bpp_x16)	fxp_q4_to_int(bpp_x16), (fxp_q4_to_frac(bpp_x16) * 625)
-
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4c078ff664005..6a77655dee453 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2271,17 +2271,17 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (ret < 0) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Cannot compute valid DSC parameters for Input Bpp = %d"
-			    "Compressed BPP = " BPP_X16_FMT "\n",
+			    "Compressed BPP = " FXP_Q4_FMT "\n",
 			    pipe_config->pipe_bpp,
-			    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16));
+			    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16));
 		return ret;
 	}
 
 	pipe_config->dsc.compression_enable = true;
 	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
-		    "Compressed Bpp = " BPP_X16_FMT " Slice Count = %d\n",
+		    "Compressed Bpp = " FXP_Q4_FMT " Slice Count = %d\n",
 		    pipe_config->pipe_bpp,
-		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16),
 		    pipe_config->dsc.slice_count);
 
 	return 0;
@@ -2334,7 +2334,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 	limits->link.max_bpp_x16 = max_link_bpp_x16;
 
 	drm_dbg_kms(&i915->drm,
-		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " BPP_X16_FMT "\n",
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " FXP_Q4_FMT "\n",
 		    encoder->base.base.id, encoder->base.name,
 		    crtc->base.base.id, crtc->base.name,
 		    adjusted_mode->crtc_clock,
@@ -2342,7 +2342,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 		    limits->max_lane_count,
 		    limits->max_rate,
 		    limits->pipe.max_bpp,
-		    BPP_X16_ARGS(limits->link.max_bpp_x16));
+		    FXP_Q4_ARGS(limits->link.max_bpp_x16));
 
 	return true;
 }
@@ -2473,10 +2473,10 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	}
 
 	drm_dbg_kms(&i915->drm,
-		    "DP lane count %d clock %d bpp input %d compressed " BPP_X16_FMT " link rate required %d available %d\n",
+		    "DP lane count %d clock %d bpp input %d compressed " FXP_Q4_FMT " link rate required %d available %d\n",
 		    pipe_config->lane_count, pipe_config->port_clock,
 		    pipe_config->pipe_bpp,
-		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16),
 		    intel_dp_config_required_rate(pipe_config),
 		    intel_dp_max_link_data_rate(intel_dp,
 						pipe_config->port_clock,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3f863ddb0c597..eda743866e7f7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -497,10 +497,10 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
 		return true;
 
 	drm_dbg_kms(&i915->drm,
-		    "[CRTC:%d:%s][CONNECTOR:%d:%s] Increasing link min bpp to " BPP_X16_FMT " in DSC mode due to hblank expansion quirk\n",
+		    "[CRTC:%d:%s][CONNECTOR:%d:%s] Increasing link min bpp to " FXP_Q4_FMT " in DSC mode due to hblank expansion quirk\n",
 		    crtc->base.base.id, crtc->base.name,
 		    connector->base.base.id, connector->base.name,
-		    BPP_X16_ARGS(min_bpp_x16));
+		    FXP_Q4_ARGS(min_bpp_x16));
 
 	if (limits->link.max_bpp_x16 < min_bpp_x16)
 		return false;
-- 
2.43.3

