Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E1C2E4B2
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8D10E4ED;
	Mon,  3 Nov 2025 22:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMm5nwI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B910E4EB;
 Mon,  3 Nov 2025 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209473; x=1793745473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2R1FqenwqbKmbvoEny8Dz4EmdwFnRQZwOBbkky8PECY=;
 b=QMm5nwI9+uUDKGqUgZJgVcPrBalOaHpu+7ovcC0jzkXXAHKIcCCJFri5
 3lmTZD3Q+nnNZdcFTfy3F+u9UW1j1afTE7QeayHvdciAzTMwCvw1c5NqB
 hUJRhHmMw0yZyhYOBFOrGg/eyUOt4q1hk+dK3xrDz3KKhDfTP7bcF+jur
 H5tLHuRwD2zZUDbei7Fj/YXRCg+L/hJnp1TjLROEjgYZ7P0IcmwwGGuv0
 zjtkBLQBL1n0Tnz+YI2OuIeMqgDZKmgDxnJmw4ESKKKKS2Bh30RZFszLn
 GONZa2rC6YxW3/CM5Y4Y5MJ1A1F11cFJ7QGXdPxX9hADrpRR2ThYIWpiD g==;
X-CSE-ConnectionGUID: H/CXMzM8RwewZtEng5ME5g==
X-CSE-MsgGUID: MK37hig1Ry2um93iYqxatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899647"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:52 -0800
X-CSE-ConnectionGUID: ETKnR3YyTVa93A2A2EeiJQ==
X-CSE-MsgGUID: EZiZ1T5sRrifJOFcElBVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707549"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:51 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 10/10] drm/i915/alpm: Introduce has_alpm to decouple from
 pr/psr2/lobf
Date: Tue,  4 Nov 2025 03:39:57 +0530
Message-Id: <20251103220957.1229608-11-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251103220957.1229608-1-animesh.manna@intel.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
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
will be supported without ALPM. So decouple ALPM feaure by has_alpm flag
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
index 16fe66a75f05..e1988f43cbb9 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -376,6 +376,8 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 
 	crtc_state->has_lobf = (context_latency + guardband) >
 		(first_sdp_position + waketime_in_lines);
+
+	crtc_state->has_alpm = crtc_state->has_lobf;
 }
 
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
@@ -385,8 +387,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
 
-	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
-					  !crtc_state->has_lobf))
+	if (!crtc_state->has_alpm)
 		return;
 
 	mutex_lock(&intel_dp->alpm.lock);
@@ -510,7 +511,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
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
index 05014ffe3ce1..eeb4255b5e5e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1681,6 +1681,8 @@ static bool intel_sel_update_config_valid(struct intel_dp *intel_dp,
 	crtc_state->enable_psr2_su_region_et =
 		psr2_su_region_et_valid(intel_dp, crtc_state->has_panel_replay);
 
+	crtc_state->has_alpm = intel_alpm_is_possible(intel_dp);
+
 	return true;
 
 unsupported:
@@ -1750,11 +1752,17 @@ _panel_replay_compute_config(struct intel_dp *intel_dp,
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
@@ -1777,9 +1785,6 @@ _panel_replay_compute_config(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (!alpm_config_valid(intel_dp, crtc_state, true, true, false))
-		return false;
-
 	return true;
 }
 
@@ -4445,16 +4450,6 @@ void intel_psr_connector_debugfs_add(struct intel_connector *connector)
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
@@ -4470,7 +4465,7 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 
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

