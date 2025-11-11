Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D78C4E0D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223DC10E5B4;
	Tue, 11 Nov 2025 13:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C67/N4S8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CB510E5B4;
 Tue, 11 Nov 2025 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866677; x=1794402677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iv/hm/FKM031fg3UTs7uW2O0xEYSMBbXCe+Lz1ojDSg=;
 b=C67/N4S8QgaTeexG4rhT90Y/3NTaGYVOu5OwKJS046A/4lH66xk3U1oc
 CPYtI6w4eNUx63tg8RYQiIDfRL8Jc2t2TuKtFPlsXHgrLeB3eAqy5PyHc
 ESkcFFowNTfL4cxy1qPj/JSQCPpPZlVexGWSwIn1LVqvV++tlMb54jeqR
 UrYW+Rn8NQEKbofsb3b6RwmEOYahGb55f6ISpiNy+tjgSAWoU3noJFtJC
 L356Y+LUUT7xfymt61EwtuAgEFmDqbvi/UM5rqGm3phZaa/r56ju2Yk+t
 ss8WYZ5dCnLEbTTwi/2/IFBEAu/8PX4EjNCpxiKpDt4ZwnyEO30mU0cbP A==;
X-CSE-ConnectionGUID: aQe524EhQ1C5zlTz7bomWQ==
X-CSE-MsgGUID: xEOg44UkSqy00Wqan1cAmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967492"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:11:17 -0800
X-CSE-ConnectionGUID: 00NtI0oiSo21yfjN9BXAbQ==
X-CSE-MsgGUID: axHrkp99TVquSmzhFtPYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129329"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:11:14 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 10/10] drm/i915/alpm: Introduce has_alpm to decouple from
 pr/psr2/lobf
Date: Tue, 11 Nov 2025 18:13:16 +0530
Message-Id: <20251111124316.1421013-11-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251111124316.1421013-1-animesh.manna@intel.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
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
index 1d5aabf83330..88c7fd6807f1 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -389,6 +389,8 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 
 	crtc_state->has_lobf = (context_latency + guardband) >
 		(first_sdp_position + waketime_in_lines);
+
+	crtc_state->has_alpm = crtc_state->has_lobf;
 }
 
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
@@ -398,8 +400,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
 
-	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
-					  !crtc_state->has_lobf))
+	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
 		return;
 
 	mutex_lock(&intel_dp->alpm.lock);
@@ -523,7 +524,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 {
 	u8 val;
 
-	if (!intel_psr_needs_alpm(intel_dp, crtc_state) && !crtc_state->has_lobf)
+	if (!crtc_state->has_alpm)
 		return;
 
 	val = DP_ALPM_ENABLE | DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 00600134bda0..0b60ada4b972 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1392,6 +1392,8 @@ struct intel_crtc_state {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_state;
+
+	bool has_alpm;
 };
 
 enum intel_pipe_crc_source {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00b06771ae2d..9a39228ea15e 100644
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

