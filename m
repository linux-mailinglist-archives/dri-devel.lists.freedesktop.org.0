Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFCBC5769B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320D010E817;
	Thu, 13 Nov 2025 12:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkdslLJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3510E815;
 Thu, 13 Nov 2025 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036960; x=1794572960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=895hHzF62kqke6uMkh3/H1tc9Uj7h2fgC9+BV2l3iWk=;
 b=WkdslLJ4j+hZj6rIpM5n6h2dV6KxMpYZNXK+BW3pa2kJESud04nwBm2Y
 un3LRSsbw3I2mh888B5m8oViR5fc3Ro+ZMwwX0ICmc6Kw/w58fnitrjpG
 Cui/uiOpw+tppLVtK1UuRkagdTpdg0cU/YZoruP3n0SKwRSarFfI75j2l
 chz68VhX766odC5AGqHWSyhTIdugQPaeBencARfwF498acsSffBFkdvbE
 YVdkU8FwfhPM7dRZ5OIyAKJUX+4JJyEq+nWH9z/z/Rc6tPN4TA44NySnP
 x5fOPOv8Mw2fKX34ERRe7j7ipFyu+5TJTnxbiiUz2THsegI8bwvHkED17 w==;
X-CSE-ConnectionGUID: dDX0HVQKRHaUWjImmFYiwA==
X-CSE-MsgGUID: 6lAuDD7MSiOqXQbjAac+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677925"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677925"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:19 -0800
X-CSE-ConnectionGUID: mMW3POjtT0Oj0BMG48fvGA==
X-CSE-MsgGUID: 1NmWN2l0RJyBYz0DtnIlcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757775"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:29:17 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 10/10] drm/i915/alpm: Introduce has_alpm to decouple from
 pr/psr2/lobf
Date: Thu, 13 Nov 2025 17:31:19 +0530
Message-Id: <20251113120119.1437955-11-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

For DP2.1, ALPM is optional and there can be scenario where panel replay
will be supported without ALPM. So decouple ALPM feature by has_alpm flag
from related display features.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     |  7 +++---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 23 ++++++++-----------
 drivers/gpu/drm/i915/display/intel_psr.h      |  1 -
 4 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 87c7c1f6e17f..94a092bc5df9 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -385,6 +385,8 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 
 	crtc_state->has_lobf = (context_latency + guardband) >
 		(first_sdp_position + waketime_in_lines);
+
+	crtc_state->has_alpm = crtc_state->has_lobf;
 }
 
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
@@ -394,8 +396,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
 
-	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
-					  !crtc_state->has_lobf))
+	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
 		return;
 
 	mutex_lock(&intel_dp->alpm.lock);
@@ -519,7 +520,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 {
 	u8 val;
 
-	if (!intel_psr_needs_alpm(intel_dp, crtc_state) && !crtc_state->has_lobf)
+	if (!crtc_state->has_alpm)
 		return;
 
 	val = DP_ALPM_ENABLE | DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 38702a9e0f50..0290caf9e14d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1391,6 +1391,8 @@ struct intel_crtc_state {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_state;
+
+	bool has_alpm;
 };
 
 enum intel_pipe_crc_source {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00ac652809cc..99bcbf36252f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1686,6 +1686,8 @@ static bool intel_sel_update_config_valid(struct intel_dp *intel_dp,
 	crtc_state->enable_psr2_su_region_et =
 		psr2_su_region_et_valid(intel_dp, crtc_state->has_panel_replay);
 
+	crtc_state->has_alpm = intel_alpm_is_possible(intel_dp);
+
 	return true;
 
 unsupported:
@@ -1755,11 +1757,17 @@ _panel_replay_compute_config(struct intel_dp *intel_dp,
 		return false;
 	}
 
+	if (intel_alpm_is_possible(intel_dp))
+		crtc_state->has_alpm = alpm_config_valid(intel_dp, crtc_state, true, true, false);
+
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
 
 	/* Remaining checks are for eDP only */
 
+	if (!crtc_state->has_alpm)
+		return false;
+
 	if (to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_A &&
 	    to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_B)
 		return false;
@@ -1782,9 +1790,6 @@ _panel_replay_compute_config(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (!alpm_config_valid(intel_dp, crtc_state, true, true, false))
-		return false;
-
 	return true;
 }
 
@@ -4450,16 +4455,6 @@ void intel_psr_connector_debugfs_add(struct intel_connector *connector)
 				    connector, &i915_psr_status_fops);
 }
 
-bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state)
-{
-	/*
-	 * eDP Panel Replay uses always ALPM
-	 * PSR2 uses ALPM but PSR1 doesn't
-	 */
-	return intel_dp_is_edp(intel_dp) && (crtc_state->has_sel_update ||
-					     crtc_state->has_panel_replay);
-}
-
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state)
 {
@@ -4475,7 +4470,7 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 
 	if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state))
 		wake_lines = crtc_state->alpm_state.aux_less_wake_lines;
-	else if (intel_psr_needs_alpm(intel_dp, crtc_state))
+	else if (crtc_state->has_alpm)
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 						    crtc_state->alpm_state.fast_wake_lines) :
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 620b35928832..3cb4fa20e427 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -80,7 +80,6 @@ void intel_psr_trigger_frame_change_event(struct intel_dsb *dsb,
 int intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state);
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
-bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
-- 
2.29.0

