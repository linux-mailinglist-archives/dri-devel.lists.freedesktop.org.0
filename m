Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C067C70007A
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609810E635;
	Fri, 12 May 2023 06:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0355F10E638;
 Fri, 12 May 2023 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872960; x=1715408960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TKypDbOSzdiVSwTscmox+8QAa6aWVF4dJ2Yf4fliSo=;
 b=TvXWB8PRCuyn1Q/xykWHZh8FCA3YAKciwHaQhTe4hhg5MMykEVGjXtqr
 vAdgjP+N3ZiG+ojrmHu5pOyALnB+seUtmx35L2IDkDAcgm8Q/CsxOEhuL
 zuCtxFpZocWsmQbrDRdndc687PWhQdrIsxjNbs+0SHYHPwS9mn/BK1+JX
 stEy7LtQYYfhnk4OzPiMwqwVZFkfOaKx/AxxfkdfNlYo64FD+7Jaa/6mW
 Sc/j9epmbPTySl9RU8eyGYoIu6gbdbKhCGdB71OxkjBVXSTR6ZGjEOmR4
 bQ+FWwmLRURWZseB62fM9G+rn6eH7wigv2OZxMUK40oszlMdlfJy1Dk7/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741999"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941322"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941322"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:18 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/13] drm/i915: Query compressed bpp properly using correct
 DPCD and DP Spec info
Date: Fri, 12 May 2023 11:54:17 +0530
Message-Id: <20230512062417.2584427-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Currently we seem to be using wrong DPCD register for reading compressed bpps,
reading min/max input bpc instead of compressed bpp.
Fix that, so that we now apply min/max compressed bpp limitations we get
from DP Spec Table 2-157 DP v2.0 and/or correspondent DPCD register
DP_DSC_MAX_BITS_PER_PIXEL_LOW/HIGH.

This might also allow us to get rid of an ugly compressed bpp recalculation,
which we had to add to make some MST hubs usable.

v2: - Fix operator precedence
v3: - Added debug info about compressed bpps
v4: - Don't try to intersect Sink input bpp and compressed bpps.
v5: - Decrease step while looking for suitable compressed bpp to
      accommodate.
v6: - Use helper for getting min and max compressed_bpp (Ankit)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  3 +-
 drivers/gpu/drm/i915/display/intel_dp.h     |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 43 ++++++++-------------
 3 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 578320220c9a..3cb442516eb9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1707,7 +1707,6 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-static
 u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
 					    struct intel_crtc_state *pipe_config,
 					    int bpc)
@@ -1734,7 +1733,7 @@ u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
 	return 0;
 }
 
-static u16 intel_dp_dsc_min_compressed_bppx16(struct intel_crtc_state *pipe_config)
+u16 intel_dp_dsc_min_compressed_bppx16(struct intel_crtc_state *pipe_config)
 {
 	switch (pipe_config->output_format) {
 	case INTEL_OUTPUT_FORMAT_RGB:
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 295b967de3cc..dcb32bd0c656 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -123,6 +123,10 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp);
+u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
+					    struct intel_crtc_state *pipe_config,
+					    int bpc);
+u16 intel_dp_dsc_min_compressed_bppx16(struct intel_crtc_state *pipe_config);
 
 void intel_ddi_update_pipe(struct intel_atomic_state *state,
 			   struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f02ae68a9877..461f588aab8d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -101,6 +101,9 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 							      crtc_state->lane_count);
 	}
 
+	drm_dbg_kms(&i915->drm, "Looking for slots in range min bpp %d max bpp %d\n",
+		    min_bpp, max_bpp);
+
 	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
 		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
 
@@ -194,8 +197,7 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	u8 dsc_bpc[3] = {0};
 	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
 	u8 dsc_max_bpc;
-	bool need_timeslot_recalc = false;
-	u32 last_compressed_bpp;
+	int min_compressed_bpp, max_compressed_bpp;
 
 	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
 	if (DISPLAY_VER(i915) >= 12)
@@ -231,34 +233,21 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	if (max_bpp > sink_max_bpp)
 		max_bpp = sink_max_bpp;
 
-	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp,
-						     min_bpp, limits,
-						     conn_state, 2 * 3, true);
-
-	if (slots < 0)
-		return slots;
-
-	last_compressed_bpp = crtc_state->dsc.compressed_bpp;
+	max_compressed_bpp = intel_dp_dsc_max_sink_compressed_bppx16(intel_dp, crtc_state, max_bpp / 3) >> 4;
+	min_compressed_bpp = intel_dp_dsc_min_compressed_bppx16(crtc_state) >> 4;
+	drm_dbg_kms(&i915->drm, "DSC Sink supported compressed min bpp %d compressed max bpp %d\n",
+		    min_compressed_bpp, max_compressed_bpp);
 
-	crtc_state->dsc.compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915,
-									last_compressed_bpp,
-									crtc_state->pipe_bpp);
+	/* Align compressed bpps according to our own constraints */
+	max_compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915, max_compressed_bpp, crtc_state->pipe_bpp);
+	min_compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915, min_compressed_bpp, crtc_state->pipe_bpp);
 
-	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
-		need_timeslot_recalc = true;
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_compressed_bpp,
+						     min_compressed_bpp, limits,
+						     conn_state, 1, true);
 
-	/*
-	 * Apparently some MST hubs dislike if vcpi slots are not matching precisely
-	 * the actual compressed bpp we use.
-	 */
-	if (need_timeslot_recalc) {
-		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
-							     crtc_state->dsc.compressed_bpp,
-							     crtc_state->dsc.compressed_bpp,
-							     limits, conn_state, 2 * 3, true);
-		if (slots < 0)
-			return slots;
-	}
+	if (slots < 0)
+		return slots;
 
 	intel_link_compute_m_n(crtc_state->dsc.compressed_bpp,
 			       crtc_state->lane_count,
-- 
2.25.1

