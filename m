Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB3743C46
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7A410E482;
	Fri, 30 Jun 2023 12:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DA810E477;
 Fri, 30 Jun 2023 12:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129489; x=1719665489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZSFfD7+nKWeBxUy74X/4IMFttvp+3avgDGha1KRnME=;
 b=FT6t0KpTrjPlwo5fp5LBk0cuzKzeSmnxYnfl1QZ6gwihM92MMNHmHR3m
 CkqSCvNC8Y3aCKvX1mUmB/Eja+L3pObdu4qjA7s2tbu5vidL7GkMbBG0R
 Fy5BAnEU/42uJ2vY22Bbveu/yHMDrzmEsuOnFmnFyRQlWmSrCstKOZbtX
 aRqd+E0B43UB62+++BGvrOa/GyYHG5Qt52l7oGDe+VZeLIW+tkUIHV384
 JUqv6Pa9K9KTuzGKSnmrnhAsWwDVGnneVrFXn3m6ySww7S4ut5axMNaRn
 pJ38tFWHWOOsUHvZe16bO0IXEpRJVaJOObylqgBx9FuGaxAJKad9bSdvG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232271"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232271"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219148"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219148"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915: Query compressed bpp properly using correct
 DPCD and DP Spec info
Date: Fri, 30 Jun 2023 18:16:51 +0530
Message-Id: <20230630124652.4140932-20-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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

Currently we seem to be using wrong DPCD register for reading
compressed bpps, reading min/max input bpc instead of compressed bpp.
Fix that, so that we now apply min/max compressed bpp limitations we
get from DP Spec Table 2-157 DP v2.0 and/or correspondent DPCD
register DP_DSC_MAX_BITS_PER_PIXEL_LOW/HIGH.

This might also allow us to get rid of an ugly compressed bpp
recalculation, which we had to add to make some MST hubs usable.

v2: - Fix operator precedence
v3: - Added debug info about compressed bpps
v4: - Don't try to intersect Sink input bpp and compressed bpps.
v5: - Decrease step while looking for suitable compressed bpp to
      accommodate.
v6: - Use helper for getting min and max compressed_bpp (Ankit)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 12 +++---
 drivers/gpu/drm/i915/display/intel_dp.h     |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 43 ++++++++-------------
 3 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 119a1eff8e6c..9f157ff6cce4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1753,7 +1753,7 @@ u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
 	return 0;
 }
 
-static int dsc_sink_min_compressed_bpp(struct intel_crtc_state *pipe_config)
+int intel_dp_dsc_sink_min_compressed_bpp(struct intel_crtc_state *pipe_config)
 {
 	/* From Mandatory bit rate range Support Table 2-157 (DP v2.0) */
 	switch (pipe_config->output_format) {
@@ -1770,9 +1770,9 @@ static int dsc_sink_min_compressed_bpp(struct intel_crtc_state *pipe_config)
 	return 0;
 }
 
-static int dsc_sink_max_compressed_bpp(struct intel_dp *intel_dp,
-				       struct intel_crtc_state *pipe_config,
-				       int bpc)
+int intel_dp_dsc_sink_max_compressed_bpp(struct intel_dp *intel_dp,
+					 struct intel_crtc_state *pipe_config,
+					 int bpc)
 {
 	return intel_dp_dsc_max_sink_compressed_bppx16(intel_dp,
 						       pipe_config, bpc) >> 4;
@@ -1885,11 +1885,11 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 	int dsc_joiner_max_bpp;
 
 	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
-	dsc_sink_min_bpp = dsc_sink_min_compressed_bpp(pipe_config);
+	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
 	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
-	dsc_sink_max_bpp = dsc_sink_max_compressed_bpp(intel_dp, pipe_config, pipe_bpp / 3);
+	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(intel_dp, pipe_config, pipe_bpp / 3);
 	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
 
 	dsc_joiner_max_bpp = get_max_compressed_bpp_with_joiner(i915, adjusted_mode->clock,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 788a577ebe16..f29e48028f39 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -114,6 +114,10 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					enum intel_output_format output_format,
 					u32 pipe_bpp,
 					u32 timeslots);
+int intel_dp_dsc_sink_min_compressed_bpp(struct intel_crtc_state *pipe_config);
+int intel_dp_dsc_sink_max_compressed_bpp(struct intel_dp *intel_dp,
+					 struct intel_crtc_state *pipe_config,
+					 int bpc);
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
 				int mode_clock, int mode_hdisplay,
 				bool bigjoiner);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3eb085fbc7c8..0df930d605ed 100644
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
+	max_compressed_bpp = intel_dp_dsc_sink_max_compressed_bpp(intel_dp, crtc_state, max_bpp / 3);
+	min_compressed_bpp = intel_dp_dsc_sink_min_compressed_bpp(crtc_state);
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
2.40.1

