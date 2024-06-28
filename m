Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74C91C405
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DA410ECAD;
	Fri, 28 Jun 2024 16:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPB9PP00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8E10EC91;
 Fri, 28 Jun 2024 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593092; x=1751129092;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Kp/FBZ8dHgKxN4gMzIVCGITGYTmU0v26+yCcbB1e9Xk=;
 b=IPB9PP00cW0YwficcNm9uZ/KWG5NAJLWtM5B0mkRTLtrACKhxj7+uVqf
 NKA4g0jXmTcybOXHm+rOHx0a6V2cFMVH1CAOZkbM0FaklIrjQ+ie5KnIH
 jl3XQI/TeqnRS64qRBP8HH1reGAvB5cHLMzUaBS7i0kpJiWnbNya2ccj7
 2VE2ifOVcJMMOY1pLjKbzktp3+Ee6BLkit0W1SIJ8hWSq9oNNXgDjoCYd
 S1q3uv+Syg2IpKaj2epfIcWw2GymSQ1gGFAWN6mx0nIcYuxlvlSabczrf
 rwsqCxum5l3SHb9jakqb97keL/Jn6AcPj/uOGxP1l5SRlTM49sE0rWW2r w==;
X-CSE-ConnectionGUID: wVckUV3jQt2RnbWAOTTVoQ==
X-CSE-MsgGUID: IgtI6EbHRf+88DToIr55Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620075"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:52 -0700
X-CSE-ConnectionGUID: XesLLxuPTGyO6CGQ5WH+Ug==
X-CSE-MsgGUID: iJutK8BNRNmMBBQiZuRmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519921"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:51 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/i915: Replace to_bpp_int_roundup() with
 fxp_q4_to_int_roundup()
Date: Fri, 28 Jun 2024 19:44:46 +0300
Message-ID: <20240628164451.1177612-6-imre.deak@intel.com>
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

Replace the to_bpp_int_roundup() helper defined by the driver with the
equivalent fxp_q4_to_int_roundup() helper defined by DRM core.

v2: Rebase on s/drm_x16/fxp_q4 change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 5 ++++-
 drivers/gpu/drm/i915/display/intel_display_types.h | 5 -----
 drivers/gpu/drm/i915/display/intel_dp.c            | 6 +++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 2 +-
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 16d5550f7e5e5..aa3ba66c5307f 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -23,7 +23,10 @@
 
 #include <linux/time.h>
 
+#include <drm/drm_fixed.h>
+
 #include "soc/intel_dram.h"
+
 #include "hsw_ips.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
@@ -2750,7 +2753,7 @@ static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
 		 */
 		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
 		int min_cdclk_bj =
-			(to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) *
+			(fxp_q4_to_int_roundup(crtc_state->dsc.compressed_bpp_x16) *
 			 pixel_clock) / (2 * bigjoiner_interface_bits);
 
 		min_cdclk = max(min_cdclk, min_cdclk_bj);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6ffdcdb09c05e..d11b0ca6944be 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2186,11 +2186,6 @@ static inline int to_bpp_frac(int bpp_x16)
 #define BPP_X16_FMT		"%d.%04d"
 #define BPP_X16_ARGS(bpp_x16)	fxp_q4_to_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
 
-static inline int to_bpp_int_roundup(int bpp_x16)
-{
-	return (bpp_x16 + 0xf) >> 4;
-}
-
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1107c08456554..2852d89b0957c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2006,7 +2006,7 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
 	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
 	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
-	dsc_min_bpp = max(dsc_min_bpp, to_bpp_int_roundup(limits->link.min_bpp_x16));
+	dsc_min_bpp = max(dsc_min_bpp, fxp_q4_to_int_roundup(limits->link.min_bpp_x16));
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
 	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(connector,
@@ -2168,7 +2168,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
 	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
 	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
-	dsc_min_bpp = max(dsc_min_bpp, to_bpp_int_roundup(limits->link.min_bpp_x16));
+	dsc_min_bpp = max(dsc_min_bpp, fxp_q4_to_int_roundup(limits->link.min_bpp_x16));
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
 	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(connector,
@@ -2394,7 +2394,7 @@ int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state)
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpp = crtc_state->dsc.compression_enable ?
-		to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
+		fxp_q4_to_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
 		crtc_state->pipe_bpp;
 
 	return intel_dp_link_required(adjusted_mode->crtc_clock, bpp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index cac51b527c8e4..3f863ddb0c597 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -378,7 +378,7 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 
 	min_compressed_bpp = intel_dp_dsc_sink_min_compressed_bpp(crtc_state);
 	min_compressed_bpp = max(min_compressed_bpp,
-				 to_bpp_int_roundup(limits->link.min_bpp_x16));
+				 fxp_q4_to_int_roundup(limits->link.min_bpp_x16));
 
 	drm_dbg_kms(&i915->drm, "DSC Sink supported compressed min bpp %d compressed max bpp %d\n",
 		    min_compressed_bpp, max_compressed_bpp);
-- 
2.43.3

