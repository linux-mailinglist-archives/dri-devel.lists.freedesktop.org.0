Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA59091D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592ED10EE0B;
	Fri, 14 Jun 2024 17:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZtn9ES4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3936910EE07;
 Fri, 14 Jun 2024 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386748; x=1749922748;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FQ9ml1D0bffXbtFkqTcUEcl3qYwLvptU2gNypeNR7t8=;
 b=YZtn9ES4fMTIereg3a6zB1ZwUpEVZvHQf0KD9G3X9sdKNGoEXPkUhNAk
 X9bqKU9/rc3MeLzmtDcIWC+N0eXbvQd2SINIeFBxT6KhLiZYaHsUQP+rO
 DltKNczJthJIClGqcYQCn7PUu13vOX5Oj19Avq2YaO9OaTRIJlYu/1SV8
 qE/AA6mOlLSG60+P/Y2Oic4IzQHDTTU5cftbqG2gxllB8IDcOuT+5Zvwu
 it7KBdYi0mLdSAekR+RMsJgknu8dTZwTBm7vuSeFH0zpQN6uYohRXZz5F
 Mh4S8lzFu67QDSiUpf/r2+cRjb6/Tntzex8ishOWON5jrEKLAGTN7ulYO g==;
X-CSE-ConnectionGUID: oFr3uaLNTuak5sXbP2YEqg==
X-CSE-MsgGUID: Ng+nX4j1Rv2YGBhCapRzIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069324"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:08 -0700
X-CSE-ConnectionGUID: a8N9TgT1RE6u72sq3oZKXA==
X-CSE-MsgGUID: KVHdqaecRNK4nmy2U6fSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712446"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:07 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915: Replace to_bpp_int() with drm_x16_to_int()
Date: Fri, 14 Jun 2024 20:39:04 +0300
Message-ID: <20240614173911.3743172-5-imre.deak@intel.com>
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

Replace to_bpp_int() defined by the driver with the equivalent
drm_x16_from_int() defined by DRM core.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c             | 9 +++++----
 drivers/gpu/drm/i915/display/intel_display.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_display_types.h | 7 +------
 drivers/gpu/drm/i915/display/intel_dp.c            | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 6 +++---
 drivers/gpu/drm/i915/display/intel_fdi.c           | 2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 5 +++--
 7 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ae8f6617aa70c..8e32e5958bd7b 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -27,6 +27,7 @@
 
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_mipi_dsi.h>
 
 #include "i915_reg.h"
@@ -330,7 +331,7 @@ static int afe_clk(struct intel_encoder *encoder,
 	int bpp;
 
 	if (crtc_state->dsc.compression_enable)
-		bpp = to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
+		bpp = drm_x16_to_int(crtc_state->dsc.compressed_bpp_x16);
 	else
 		bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
@@ -863,7 +864,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 	 * compressed and non-compressed bpp.
 	 */
 	if (crtc_state->dsc.compression_enable) {
-		mul = to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
+		mul = drm_x16_to_int(crtc_state->dsc.compressed_bpp_x16);
 		div = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 	}
 
@@ -887,7 +888,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 		int bpp, line_time_us, byte_clk_period_ns;
 
 		if (crtc_state->dsc.compression_enable)
-			bpp = to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
+			bpp = drm_x16_to_int(crtc_state->dsc.compressed_bpp_x16);
 		else
 			bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
@@ -1470,7 +1471,7 @@ static void gen11_dsi_get_timings(struct intel_encoder *encoder,
 					&pipe_config->hw.adjusted_mode;
 
 	if (pipe_config->dsc.compressed_bpp_x16) {
-		int div = to_bpp_int(pipe_config->dsc.compressed_bpp_x16);
+		int div = drm_x16_to_int(pipe_config->dsc.compressed_bpp_x16);
 		int mul = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
 		adjusted_mode->crtc_htotal =
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7bc4f3de691e0..179e37cc7df0a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
@@ -4668,7 +4669,7 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 	crtc_state->fec_enable = limits->force_fec_pipes & BIT(crtc->pipe);
 	crtc_state->max_link_bpp_x16 = limits->max_bpp_x16[crtc->pipe];
 
-	if (crtc_state->pipe_bpp > to_bpp_int(crtc_state->max_link_bpp_x16)) {
+	if (crtc_state->pipe_bpp > drm_x16_to_int(crtc_state->max_link_bpp_x16)) {
 		drm_dbg_kms(&i915->drm,
 			    "[CRTC:%d:%s] Link bpp limited to " BPP_X16_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5c93dcb8f01dc..0d0ab54ab9ebf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2168,18 +2168,13 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
-static inline int to_bpp_int(int bpp_x16)
-{
-	return bpp_x16 >> 4;
-}
-
 static inline int to_bpp_frac(int bpp_x16)
 {
 	return bpp_x16 & 0xf;
 }
 
 #define BPP_X16_FMT		"%d.%04d"
-#define BPP_X16_ARGS(bpp_x16)	to_bpp_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
+#define BPP_X16_ARGS(bpp_x16)	drm_x16_to_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
 
 static inline int to_bpp_int_roundup(int bpp_x16)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 348ab95bc0d53..25284d2318096 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1575,8 +1575,8 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	int bpp, i, lane_count, clock = intel_dp_mode_clock(pipe_config, conn_state);
 	int mode_rate, link_rate, link_avail;
 
-	for (bpp = to_bpp_int(limits->link.max_bpp_x16);
-	     bpp >= to_bpp_int(limits->link.min_bpp_x16);
+	for (bpp = drm_x16_to_int(limits->link.max_bpp_x16);
+	     bpp >= drm_x16_to_int(limits->link.min_bpp_x16);
 	     bpp -= 2 * 3) {
 		int link_bpp = intel_dp_output_bpp(pipe_config->output_format, bpp);
 
@@ -1994,7 +1994,7 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 								adjusted_mode->hdisplay,
 								pipe_config->joiner_pipes);
 	dsc_max_bpp = min(dsc_max_bpp, dsc_joiner_max_bpp);
-	dsc_max_bpp = min(dsc_max_bpp, to_bpp_int(limits->link.max_bpp_x16));
+	dsc_max_bpp = min(dsc_max_bpp, drm_x16_to_int(limits->link.max_bpp_x16));
 
 	if (DISPLAY_VER(i915) >= 13)
 		return xelpd_dsc_compute_link_config(intel_dp, connector, pipe_config, limits,
@@ -2151,7 +2151,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 								pipe_config,
 								pipe_bpp / 3);
 	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
-	dsc_max_bpp = min(dsc_max_bpp, to_bpp_int(limits->link.max_bpp_x16));
+	dsc_max_bpp = min(dsc_max_bpp, drm_x16_to_int(limits->link.max_bpp_x16));
 
 	/* Compressed BPP should be less than the Input DSC bpp */
 	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b8e2ffc2301f4..a67b2ee7af750 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -308,8 +308,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	 * YUV420 is only half of the pipe bpp value.
 	 */
 	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
-						     to_bpp_int(limits->link.max_bpp_x16),
-						     to_bpp_int(limits->link.min_bpp_x16),
+						     drm_x16_to_int(limits->link.max_bpp_x16),
+						     drm_x16_to_int(limits->link.min_bpp_x16),
 						     limits,
 						     conn_state, 2 * 3, false);
 
@@ -374,7 +374,7 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 								  crtc_state,
 								  max_bpp / 3);
 	max_compressed_bpp = min(max_compressed_bpp,
-				 to_bpp_int(limits->link.max_bpp_x16));
+				 drm_x16_to_int(limits->link.max_bpp_x16));
 
 	min_compressed_bpp = intel_dp_dsc_sink_min_compressed_bpp(crtc_state);
 	min_compressed_bpp = max(min_compressed_bpp,
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 67e15d3223846..4827faaf7068d 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -306,7 +306,7 @@ int intel_fdi_link_freq(struct drm_i915_private *i915,
 bool intel_fdi_compute_pipe_bpp(struct intel_crtc_state *crtc_state)
 {
 	int pipe_bpp = min(crtc_state->pipe_bpp,
-			   to_bpp_int(crtc_state->max_link_bpp_x16));
+			   drm_x16_to_int(crtc_state->max_link_bpp_x16));
 
 	pipe_bpp = rounddown(pipe_bpp, 2 * 3);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index b9687b7692b8b..5c0acbed7d6a1 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -8,6 +8,7 @@
 #include <linux/limits.h>
 
 #include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_fixed.h>
 
 #include "i915_drv.h"
 #include "intel_crtc.h"
@@ -76,7 +77,7 @@ intel_vdsc_set_min_max_qp(struct drm_dsc_config *vdsc_cfg, int buf,
 static void
 calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 {
-	int bpp = to_bpp_int(vdsc_cfg->bits_per_pixel);
+	int bpp = drm_x16_to_int(vdsc_cfg->bits_per_pixel);
 	int bpc = vdsc_cfg->bits_per_component;
 	int qp_bpc_modifier = (bpc - 8) * 2;
 	int uncompressed_bpg_rate;
@@ -263,7 +264,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
-	u16 compressed_bpp = to_bpp_int(pipe_config->dsc.compressed_bpp_x16);
+	u16 compressed_bpp = drm_x16_to_int(pipe_config->dsc.compressed_bpp_x16);
 	int err;
 	int ret;
 
-- 
2.43.3

