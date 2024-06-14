Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978039091D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7354710EE03;
	Fri, 14 Jun 2024 17:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Skl4QNKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F42110EE04;
 Fri, 14 Jun 2024 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386750; x=1749922750;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ejyNjcxuGqsHKJOZgfcogD/feejZYxow2bcCppLbLMQ=;
 b=Skl4QNKYIfQ91QVCbV8wI8lQ36jdaDb5yCWr8jIeB9se4s4WeadZhOzN
 Rd0ZFYORdXe1cy2gzRVf89ZNTj5C2lf2Z2nukmyjlY0YL8mRzeElUXO0T
 umS93wLdjLx7Rz2LIHs3aQHHwSmLjI4dW5D+9R9ELDv+ge+qeIsVtk5uo
 wr6RFd0GS+jEr6wgDrOG5cs7rkOwTeJIDoeRDmXN6TajSrbE9ZcYB+DET
 XBHhgNDxALPASPSI/5SBTlbadROejp/qD7Hxm4VYhcyLwCSv0A2rYXilc
 1aiCq4unF9MWmu6qBZMZiFD5U19fwBnE5TXI3rtO5zwWxaqGmOWYh/AwJ g==;
X-CSE-ConnectionGUID: HIXVIv3FT223Q7LuG2azGg==
X-CSE-MsgGUID: 8+9BmLzMRuiQA4iONTGqdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069327"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:10 -0700
X-CSE-ConnectionGUID: pHzOD8zoSNapdoiUgs9HaQ==
X-CSE-MsgGUID: JMeJ8qjhS/6X49JxKUHXKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712449"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:08 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/i915: Replace to_bpp_int_roundup() with
 drm_x16_to_int_roundup()
Date: Fri, 14 Jun 2024 20:39:05 +0300
Message-ID: <20240614173911.3743172-6-imre.deak@intel.com>
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

Replace to_bpp_int_roundup() defined by the driver with the equivalent
drm_x16_to_int_roundup() defined by DRM core.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 4 +++-
 drivers/gpu/drm/i915/display/intel_display_types.h | 5 -----
 drivers/gpu/drm/i915/display/intel_dp.c            | 6 +++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c5bc49e48c882..3aebf42b50cf6 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -23,6 +23,8 @@
 
 #include <linux/time.h>
 
+#include <drm/drm_fixed.h>
+
 #include "hsw_ips.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
@@ -2749,7 +2751,7 @@ static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
 		 */
 		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
 		int min_cdclk_bj =
-			(to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) *
+			(drm_x16_to_int_roundup(crtc_state->dsc.compressed_bpp_x16) *
 			 pixel_clock) / (2 * bigjoiner_interface_bits);
 
 		min_cdclk = max(min_cdclk, min_cdclk_bj);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0d0ab54ab9ebf..68f37029dbd88 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2176,11 +2176,6 @@ static inline int to_bpp_frac(int bpp_x16)
 #define BPP_X16_FMT		"%d.%04d"
 #define BPP_X16_ARGS(bpp_x16)	drm_x16_to_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
 
-static inline int to_bpp_int_roundup(int bpp_x16)
-{
-	return (bpp_x16 + 0xf) >> 4;
-}
-
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 25284d2318096..67d0348152878 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1982,7 +1982,7 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
 	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
 	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
-	dsc_min_bpp = max(dsc_min_bpp, to_bpp_int_roundup(limits->link.min_bpp_x16));
+	dsc_min_bpp = max(dsc_min_bpp, drm_x16_to_int_roundup(limits->link.min_bpp_x16));
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
 	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(connector,
@@ -2144,7 +2144,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
 	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
 	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
-	dsc_min_bpp = max(dsc_min_bpp, to_bpp_int_roundup(limits->link.min_bpp_x16));
+	dsc_min_bpp = max(dsc_min_bpp, drm_x16_to_int_roundup(limits->link.min_bpp_x16));
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
 	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(connector,
@@ -2370,7 +2370,7 @@ int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state)
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpp = crtc_state->dsc.compression_enable ?
-		to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
+		drm_x16_to_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
 		crtc_state->pipe_bpp;
 
 	return intel_dp_link_required(adjusted_mode->crtc_clock, bpp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index a67b2ee7af750..09c1ca63362e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -378,7 +378,7 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 
 	min_compressed_bpp = intel_dp_dsc_sink_min_compressed_bpp(crtc_state);
 	min_compressed_bpp = max(min_compressed_bpp,
-				 to_bpp_int_roundup(limits->link.min_bpp_x16));
+				 drm_x16_to_int_roundup(limits->link.min_bpp_x16));
 
 	drm_dbg_kms(&i915->drm, "DSC Sink supported compressed min bpp %d compressed max bpp %d\n",
 		    min_compressed_bpp, max_compressed_bpp);
-- 
2.43.3

