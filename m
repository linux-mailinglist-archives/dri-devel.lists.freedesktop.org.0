Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46E8D3F87
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 22:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3610E8EA;
	Wed, 29 May 2024 20:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlOsSu/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8110E42E;
 Wed, 29 May 2024 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717014240; x=1748550240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wfDueCe6wJ4aLKNxJw2UclUB20PhZ5MOwsd9/Yn90Fo=;
 b=hlOsSu/owd9Wmzm5zVY2JTOIJ/Yn9wNRs10qLKNO3K/PnzNKnO0ZgoQr
 V9l1a995LM3fC1N8INImU9xthBMoVNpqgG/MeHhuBgRMrgBi/KJA/arnV
 ocqFddOUk38Tj0Qa7VruwfRYd71tSSfnxIeVHgcxbHMaoFM8CM6w1fOX7
 dFTiFoGo7axzLtEFS89tE/TyLqLRqaaECLynxgegkuDXN6v6F9OQJHs9S
 vBFxlBY7YnZhZTZEkxFj9bBfHYq7oqReRtAh/+myI0ivZHd2P5fLa5W0A
 ztyaCy5NPgxHAHD22pUUHNk0vDmrAM7hvrL9IC3vPWY5JibQULuRz5g/A w==;
X-CSE-ConnectionGUID: eck+y/j4Tfijv/jEu72VSg==
X-CSE-MsgGUID: Ry832IMHRi+XyNIpEqor6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13397233"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13397233"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:24:00 -0700
X-CSE-ConnectionGUID: hadkHIl9Q66tMBCYxgEDHA==
X-CSE-MsgGUID: GsySWLiFSy6IEF0V/vOCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66759941"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 13:23:59 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v7 1/6] drm/i915/alpm: Move alpm parameters from intel_psr
Date: Thu, 30 May 2024 01:37:37 +0530
Message-Id: <20240529200742.1694401-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240529200742.1694401-1-animesh.manna@intel.com>
References: <20240529200742.1694401-1-animesh.manna@intel.com>
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

ALPM can be enabled for non psr panel and currenly aplm-params are
encapsulated under intel_psr struct, so moving out to intel_dp struct.

Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_display_types.h    | 21 +++++----
 drivers/gpu/drm/i915/display/intel_psr.c      | 44 +++++++++----------
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6fbfe8a18f45..f03b598638d7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1705,17 +1705,6 @@ struct intel_psr {
 	bool psr2_sel_fetch_cff_enabled;
 	bool req_psr2_sdp_prior_scanline;
 	u8 sink_sync_latency;
-
-	struct {
-		u8 io_wake_lines;
-		u8 fast_wake_lines;
-
-		/* LNL and beyond */
-		u8 check_entry_lines;
-		u8 silence_period_sym_clocks;
-		u8 lfps_half_cycle_num_of_syms;
-	} alpm_parameters;
-
 	ktime_t last_entry_attempt;
 	ktime_t last_exit;
 	bool sink_not_reliable;
@@ -1847,6 +1836,16 @@ struct intel_dp {
 	unsigned long last_oui_write;
 
 	bool colorimetry_support;
+
+	struct {
+		u8 io_wake_lines;
+		u8 fast_wake_lines;
+
+		/* LNL and beyond */
+		u8 check_entry_lines;
+		u8 silence_period_sym_clocks;
+		u8 lfps_half_cycle_num_of_syms;
+	} alpm_parameters;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 19f8ac12f995..977a7eaa0cde 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -864,8 +864,8 @@ static u32 intel_psr2_get_tp_time(struct intel_dp *intel_dp)
 
 static int psr2_block_count_lines(struct intel_dp *intel_dp)
 {
-	return intel_dp->psr.alpm_parameters.io_wake_lines < 9 &&
-		intel_dp->psr.alpm_parameters.fast_wake_lines < 9 ? 8 : 12;
+	return intel_dp->alpm_parameters.io_wake_lines < 9 &&
+		intel_dp->alpm_parameters.fast_wake_lines < 9 ? 8 : 12;
 }
 
 static int psr2_block_count(struct intel_dp *intel_dp)
@@ -903,7 +903,6 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
 static void hsw_activate_psr2(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	struct intel_psr *psr = &intel_dp->psr;
 	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
 	u32 val = EDP_PSR2_ENABLE;
 	u32 psr_val = 0;
@@ -945,20 +944,20 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 		 */
 		int tmp;
 
-		tmp = map[psr->alpm_parameters.io_wake_lines -
+		tmp = map[intel_dp->alpm_parameters.io_wake_lines -
 			  TGL_EDP_PSR2_IO_BUFFER_WAKE_MIN_LINES];
 		val |= TGL_EDP_PSR2_IO_BUFFER_WAKE(tmp + TGL_EDP_PSR2_IO_BUFFER_WAKE_MIN_LINES);
 
-		tmp = map[psr->alpm_parameters.fast_wake_lines - TGL_EDP_PSR2_FAST_WAKE_MIN_LINES];
+		tmp = map[intel_dp->alpm_parameters.fast_wake_lines - TGL_EDP_PSR2_FAST_WAKE_MIN_LINES];
 		val |= TGL_EDP_PSR2_FAST_WAKE(tmp + TGL_EDP_PSR2_FAST_WAKE_MIN_LINES);
 	} else if (DISPLAY_VER(dev_priv) >= 20) {
-		val |= LNL_EDP_PSR2_IO_BUFFER_WAKE(psr->alpm_parameters.io_wake_lines);
+		val |= LNL_EDP_PSR2_IO_BUFFER_WAKE(intel_dp->alpm_parameters.io_wake_lines);
 	} else if (DISPLAY_VER(dev_priv) >= 12) {
-		val |= TGL_EDP_PSR2_IO_BUFFER_WAKE(psr->alpm_parameters.io_wake_lines);
-		val |= TGL_EDP_PSR2_FAST_WAKE(psr->alpm_parameters.fast_wake_lines);
+		val |= TGL_EDP_PSR2_IO_BUFFER_WAKE(intel_dp->alpm_parameters.io_wake_lines);
+		val |= TGL_EDP_PSR2_FAST_WAKE(intel_dp->alpm_parameters.fast_wake_lines);
 	} else if (DISPLAY_VER(dev_priv) >= 9) {
-		val |= EDP_PSR2_IO_BUFFER_WAKE(psr->alpm_parameters.io_wake_lines);
-		val |= EDP_PSR2_FAST_WAKE(psr->alpm_parameters.fast_wake_lines);
+		val |= EDP_PSR2_IO_BUFFER_WAKE(intel_dp->alpm_parameters.io_wake_lines);
+		val |= EDP_PSR2_FAST_WAKE(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
 	if (intel_dp->psr.req_psr2_sdp_prior_scanline)
@@ -1341,9 +1340,9 @@ static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 	if (i915->display.params.psr_safest_params)
 		aux_less_wake_lines = ALPM_CTL_AUX_LESS_WAKE_TIME_MASK;
 
-	intel_dp->psr.alpm_parameters.fast_wake_lines = aux_less_wake_lines;
-	intel_dp->psr.alpm_parameters.silence_period_sym_clocks = silence_period;
-	intel_dp->psr.alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
+	intel_dp->alpm_parameters.fast_wake_lines = aux_less_wake_lines;
+	intel_dp->alpm_parameters.silence_period_sym_clocks = silence_period;
+	intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
 
 	return true;
 }
@@ -1370,7 +1369,7 @@ static bool _lnl_compute_alpm_params(struct intel_dp *intel_dp,
 	if (i915->display.params.psr_safest_params)
 		check_entry_lines = 15;
 
-	intel_dp->psr.alpm_parameters.check_entry_lines = check_entry_lines;
+	intel_dp->alpm_parameters.check_entry_lines = check_entry_lines;
 
 	return true;
 }
@@ -1439,8 +1438,8 @@ static bool _compute_alpm_params(struct intel_dp *intel_dp,
 		io_wake_lines = fast_wake_lines = max_wake_lines;
 
 	/* According to Bspec lower limit should be set as 7 lines. */
-	intel_dp->psr.alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
-	intel_dp->psr.alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
+	intel_dp->alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
+	intel_dp->alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
 
 	return true;
 }
@@ -1841,7 +1840,6 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
-	struct intel_psr *psr = &intel_dp->psr;
 	u32 alpm_ctl;
 
 	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.sel_update_enabled &&
@@ -1863,23 +1861,23 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
 			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
 			       PORT_ALPM_CTL_SILENCE_PERIOD(
-				       psr->alpm_parameters.silence_period_sym_clocks));
+				       intel_dp->alpm_parameters.silence_period_sym_clocks));
 
 		intel_de_write(dev_priv,
 			       PORT_ALPM_LFPS_CTL(dev_priv, cpu_transcoder),
 			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
 			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
-				       psr->alpm_parameters.lfps_half_cycle_num_of_syms) |
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
 			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
-				       psr->alpm_parameters.lfps_half_cycle_num_of_syms) |
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
 			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
-				       psr->alpm_parameters.lfps_half_cycle_num_of_syms));
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms));
 	} else {
 		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
-			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(psr->alpm_parameters.fast_wake_lines);
+			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
-	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(psr->alpm_parameters.check_entry_lines);
+	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
 
 	intel_de_write(dev_priv, ALPM_CTL(dev_priv, cpu_transcoder), alpm_ctl);
 }
-- 
2.29.0

