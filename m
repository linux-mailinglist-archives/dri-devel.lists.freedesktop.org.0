Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6D91C403
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712A010ECAB;
	Fri, 28 Jun 2024 16:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/KgMDq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CC610ECA7;
 Fri, 28 Jun 2024 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593089; x=1751129089;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=juotR3T/lnjwfa3Zkd6o94DptTc8srSvK/dSdOTs6OU=;
 b=D/KgMDq4rLkJ6czT0JBoJF8ZKZxz2F4x3b2g8xwpAgTM5u0JofYuw1E+
 e9B82gwA1aeTkqy8tl9WDO5sofJLl8DXeJZicTBMz07sfqgPQ1eGlIp6d
 gZ1+n5dO162tcJlTIzID4ja60WJ32jzKZseD/cZGM6PVTBPlpyK1jd5Tb
 fT6e9PbUfjOu6vApyNaLHMOioGxLc08GOpcA4aRrrvzMpRZ8ZysQISrm0
 wx3xtcM1uHrGn6okCg9c9jjxYYtxTmiU7ncKnIp6bAnjhwG502jl2g19R
 XRw1xYzp6I64YeD1dMbsE9JXlsL0L2EF5mz1bd5+0XA8sHMk+bwspReig w==;
X-CSE-ConnectionGUID: 2QhynrNiToaWLvtDYH4OyQ==
X-CSE-MsgGUID: D//l5BiBT1WxKc/hAH0G5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620070"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:49 -0700
X-CSE-ConnectionGUID: 4LOPpEV8RluN8xock8BUXg==
X-CSE-MsgGUID: cinhOJAmQbOBi9496Wk7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519916"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:48 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
Date: Fri, 28 Jun 2024 19:44:44 +0300
Message-ID: <20240628164451.1177612-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Replace the to_bpp_x16() helper defined by the driver with the
equivalent fxp_q4_from_int() helper defined by DRM core.

v2: Rebase on the s/drm_x16/fxp_q4 change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c       |  5 +++--
 .../gpu/drm/i915/display/intel_display_types.h  |  5 -----
 drivers/gpu/drm/i915/display/intel_dp.c         | 17 +++++++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c     | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_fdi.c        |  4 +++-
 drivers/gpu/drm/i915/display/intel_link_bw.c    |  4 +++-
 6 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index ec1e3a3803601..fe7bf918dea56 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -30,6 +30,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -3529,8 +3530,8 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
 
 	crtc_state->pipe_bpp = bpc * 3;
 
-	crtc_state->dsc.compressed_bpp_x16 = to_bpp_x16(min(crtc_state->pipe_bpp,
-							    VBT_DSC_MAX_BPP(dsc->max_bpp)));
+	crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(min(crtc_state->pipe_bpp,
+								 VBT_DSC_MAX_BPP(dsc->max_bpp)));
 
 	/*
 	 * FIXME: This is ugly, and slice count should take DSC engine
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8713835e2307c..4f2e986a6437e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2196,11 +2196,6 @@ static inline int to_bpp_int_roundup(int bpp_x16)
 	return (bpp_x16 + 0xf) >> 4;
 }
 
-static inline int to_bpp_x16(int bpp)
-{
-	return bpp << 4;
-}
-
 /*
  * Conversion functions/macros from various pointer types to struct
  * intel_display pointer.
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3903f6ead6e66..2cb6cb569b80c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
@@ -1927,7 +1928,7 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      timeslots);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 =
-				to_bpp_x16(valid_dsc_bpp[i]);
+				fxp_q4_from_int(valid_dsc_bpp[i]);
 			return 0;
 		}
 	}
@@ -2180,7 +2181,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
 
 	pipe_config->dsc.compressed_bpp_x16 =
-		to_bpp_x16(max(dsc_min_bpp, dsc_max_bpp));
+		fxp_q4_from_int(max(dsc_min_bpp, dsc_max_bpp));
 
 	pipe_config->pipe_bpp = pipe_bpp;
 
@@ -2312,15 +2313,15 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 	int max_link_bpp_x16;
 
 	max_link_bpp_x16 = min(crtc_state->max_link_bpp_x16,
-			       to_bpp_x16(limits->pipe.max_bpp));
+			       fxp_q4_from_int(limits->pipe.max_bpp));
 
 	if (!dsc) {
-		max_link_bpp_x16 = rounddown(max_link_bpp_x16, to_bpp_x16(2 * 3));
+		max_link_bpp_x16 = rounddown(max_link_bpp_x16, fxp_q4_from_int(2 * 3));
 
-		if (max_link_bpp_x16 < to_bpp_x16(limits->pipe.min_bpp))
+		if (max_link_bpp_x16 < fxp_q4_from_int(limits->pipe.min_bpp))
 			return false;
 
-		limits->link.min_bpp_x16 = to_bpp_x16(limits->pipe.min_bpp);
+		limits->link.min_bpp_x16 = fxp_q4_from_int(limits->pipe.min_bpp);
 	} else {
 		/*
 		 * TODO: set the DSC link limits already here, atm these are
@@ -2967,8 +2968,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (pipe_config->dsc.compression_enable)
 		link_bpp_x16 = pipe_config->dsc.compressed_bpp_x16;
 	else
-		link_bpp_x16 = to_bpp_x16(intel_dp_output_bpp(pipe_config->output_format,
-							      pipe_config->pipe_bpp));
+		link_bpp_x16 = fxp_q4_from_int(intel_dp_output_bpp(pipe_config->output_format,
+								   pipe_config->pipe_bpp));
 
 	if (intel_dp->mso_link_count) {
 		int n = intel_dp->mso_link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 27ce5c3f5951e..d1b4042490a11 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -211,8 +211,8 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 
 		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
 
-		link_bpp_x16 = to_bpp_x16(dsc ? bpp :
-					  intel_dp_output_bpp(crtc_state->output_format, bpp));
+		link_bpp_x16 = fxp_q4_from_int(dsc ? bpp :
+					       intel_dp_output_bpp(crtc_state->output_format, bpp));
 
 		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state, connector,
 							     false, dsc, link_bpp_x16);
@@ -289,7 +289,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 		if (!dsc)
 			crtc_state->pipe_bpp = bpp;
 		else
-			crtc_state->dsc.compressed_bpp_x16 = to_bpp_x16(bpp);
+			crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(bpp);
 		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
 	}
 
@@ -478,10 +478,10 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
 			    crtc->base.base.id, crtc->base.name,
 			    connector->base.base.id, connector->base.name);
 
-		if (limits->link.max_bpp_x16 < to_bpp_x16(24))
+		if (limits->link.max_bpp_x16 < fxp_q4_from_int(24))
 			return false;
 
-		limits->link.min_bpp_x16 = to_bpp_x16(24);
+		limits->link.min_bpp_x16 = fxp_q4_from_int(24);
 
 		return true;
 	}
@@ -489,9 +489,9 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
 	drm_WARN_ON(&i915->drm, limits->min_rate != limits->max_rate);
 
 	if (limits->max_rate < 540000)
-		min_bpp_x16 = to_bpp_x16(13);
+		min_bpp_x16 = fxp_q4_from_int(13);
 	else if (limits->max_rate < 810000)
-		min_bpp_x16 = to_bpp_x16(10);
+		min_bpp_x16 = fxp_q4_from_int(10);
 
 	if (limits->link.min_bpp_x16 >= min_bpp_x16)
 		return true;
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index d33befd7994d5..d08331805d75b 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -5,6 +5,8 @@
 
 #include <linux/string_helpers.h>
 
+#include <drm/drm_fixed.h>
+
 #include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_crtc.h"
@@ -340,7 +342,7 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
 
 	pipe_config->fdi_lanes = lane;
 
-	intel_link_compute_m_n(to_bpp_x16(pipe_config->pipe_bpp),
+	intel_link_compute_m_n(fxp_q4_from_int(pipe_config->pipe_bpp),
 			       lane, fdi_dotclock,
 			       link_bw,
 			       intel_dp_bw_fec_overhead(false),
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
index dfd7d5e23f3fa..5db0724b65205 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_fixed.h>
+
 #include "i915_drv.h"
 
 #include "intel_atomic.h"
@@ -93,7 +95,7 @@ int intel_link_bw_reduce_bpp(struct intel_atomic_state *state,
 			 * is based on the pipe bpp value, set the actual link bpp
 			 * limit here once the MST BW allocation is fixed.
 			 */
-			link_bpp_x16 = to_bpp_x16(crtc_state->pipe_bpp);
+			link_bpp_x16 = fxp_q4_from_int(crtc_state->pipe_bpp);
 
 		if (link_bpp_x16 > max_bpp_x16) {
 			max_bpp_x16 = link_bpp_x16;
-- 
2.43.3

