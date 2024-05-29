Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F68D3F88
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 22:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F015910FF1C;
	Wed, 29 May 2024 20:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpR8iO4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2937710E029;
 Wed, 29 May 2024 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717014243; x=1748550243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PuMlUTH58dKhspY3XdC8bnMEIssKeFdpCxI9K2Iu30o=;
 b=cpR8iO4MfTiYdiSMq76+VTTPyGwy7fHqap666js0Ci5dHYayGvUFzzo3
 1wQK7xA8saf4sANW/BS5qhS0Sv8qDeeWATQf2ySmyJgmVc9uRNvYR0ek8
 SplBqAYOgZe69ebxMTugWubwCk9yFtyRkoTMM4bKAct0KK4XxQkiY5Z3B
 /l4QVX2nfp87EsSuZ16b/rss7UvkdzZRP++fJLYZZPQ6Zw/h0DviLUNmu
 5ln3L1aO8AUxuNhK+J1tOzFirWSWdqCBZ5hPxrF6CEA0BoMAsgETYTFxG
 msPLEL/LtgsPBZS4VrlIuI/G7NTJxRqc0fn6Yu5k9wNybSJmJd879lrJg w==;
X-CSE-ConnectionGUID: n5FQdSUxTpCiRBN5mrDrNw==
X-CSE-MsgGUID: NfuqV4lzRnaQfKTy0qp2IQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13397236"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13397236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:24:03 -0700
X-CSE-ConnectionGUID: JJM+/qc0RiSWa/AE+KERrg==
X-CSE-MsgGUID: X25jf7sxRqeznQ6dbei0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66759960"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 13:24:01 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v7 2/6] drm/i915/alpm: Move alpm related code to a new file
Date: Thu, 30 May 2024 01:37:38 +0530
Message-Id: <20240529200742.1694401-3-animesh.manna@intel.com>
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

Move ALPM feature related code as it will be used for
non-psr panel also thorugh LOBF feature.

v1: Initial version.
v2: Correct ordering in makefile. [Jani]

Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/Makefile             |   1 +
 drivers/gpu/drm/i915/display/intel_alpm.c | 295 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  18 ++
 drivers/gpu/drm/i915/display/intel_psr.c  | 283 +--------------------
 drivers/gpu/drm/xe/Makefile               |   1 +
 5 files changed, 318 insertions(+), 280 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c8c8b31da4fb..211b51b21279 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -243,6 +243,7 @@ i915-y += \
 	display/hsw_ips.o \
 	display/i9xx_plane.o \
 	display/i9xx_wm.o \
+	display/intel_alpm.o \
 	display/intel_atomic.o \
 	display/intel_atomic_plane.o \
 	display/intel_audio.o \
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
new file mode 100644
index 000000000000..7307e02277d6
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024, Intel Corporation.
+ */
+
+#include "intel_alpm.h"
+#include "intel_crtc.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_dp.h"
+#include "intel_dp_aux.h"
+#include "intel_psr_regs.h"
+
+/*
+ * See Bspec: 71632 for the table
+ *
+ * Silence_period = tSilence,Min + ((tSilence,Max - tSilence,Min) / 2)
+ *
+ * Half cycle duration:
+ *
+ * Link rates 1.62 - 4.32 and tLFPS_Cycle = 70 ns
+ * FLOOR( (Link Rate * tLFPS_Cycle) / (2 * 10) )
+ *
+ * Link rates 5.4 - 8.1
+ * PORT_ALPM_LFPS_CTL[ LFPS Cycle Count ] = 10
+ * LFPS Period chosen is the mid-point of the min:max values from the table
+ * FLOOR( LFPS Period in Symbol clocks /
+ * (2 * PORT_ALPM_LFPS_CTL[ LFPS Cycle Count ]) )
+ */
+static bool _lnl_get_silence_period_and_lfps_half_cycle(int link_rate,
+							int *silence_period,
+							int *lfps_half_cycle)
+{
+	switch (link_rate) {
+	case 162000:
+		*silence_period = 20;
+		*lfps_half_cycle = 5;
+		break;
+	case 216000:
+		*silence_period = 27;
+		*lfps_half_cycle = 7;
+		break;
+	case 243000:
+		*silence_period = 31;
+		*lfps_half_cycle = 8;
+		break;
+	case 270000:
+		*silence_period = 34;
+		*lfps_half_cycle = 9;
+		break;
+	case 324000:
+		*silence_period = 41;
+		*lfps_half_cycle = 11;
+		break;
+	case 432000:
+		*silence_period = 56;
+		*lfps_half_cycle = 15;
+		break;
+	case 540000:
+		*silence_period = 69;
+		*lfps_half_cycle = 12;
+		break;
+	case 648000:
+		*silence_period = 84;
+		*lfps_half_cycle = 15;
+		break;
+	case 675000:
+		*silence_period = 87;
+		*lfps_half_cycle = 15;
+		break;
+	case 810000:
+		*silence_period = 104;
+		*lfps_half_cycle = 19;
+		break;
+	default:
+		*silence_period = *lfps_half_cycle = -1;
+		return false;
+	}
+	return true;
+}
+
+/*
+ * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
+ * tSilence, Max+ tPHY Establishment + tCDS) / tline)
+ * For the "PHY P2 to P0" latency see the PHY Power Control page
+ * (PHY P2 to P0) : https://gfxspecs.intel.com/Predator/Home/Index/68965
+ * : 12 us
+ * The tLFPS_Period, Max term is 800ns
+ * The tSilence, Max term is 180ns
+ * The tPHY Establishment (a.k.a. t1) term is 50us
+ * The tCDS term is 1 or 2 times t2
+ * t2 = Number ML_PHY_LOCK * tML_PHY_LOCK
+ * Number ML_PHY_LOCK = ( 7 + CEILING( 6.5us / tML_PHY_LOCK ) + 1)
+ * Rounding up the 6.5us padding to the next ML_PHY_LOCK boundary and
+ * adding the "+ 1" term ensures all ML_PHY_LOCK sequences that start
+ * within the CDS period complete within the CDS period regardless of
+ * entry into the period
+ * tML_PHY_LOCK = TPS4 Length * ( 10 / (Link Rate in MHz) )
+ * TPS4 Length = 252 Symbols
+ */
+static int _lnl_compute_aux_less_wake_time(int port_clock)
+{
+	int tphy2_p2_to_p0 = 12 * 1000;
+	int tlfps_period_max = 800;
+	int tsilence_max = 180;
+	int t1 = 50 * 1000;
+	int tps4 = 252;
+	int tml_phy_lock = 1000 * 1000 * tps4 * 10 / port_clock;
+	int num_ml_phy_lock = 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
+	int t2 = num_ml_phy_lock * tml_phy_lock;
+	int tcds = 1 * t2;
+
+	return DIV_ROUND_UP(tphy2_p2_to_p0 + tlfps_period_max + tsilence_max +
+			    t1 + tcds, 1000);
+}
+
+static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
+					     struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int aux_less_wake_time, aux_less_wake_lines, silence_period,
+		lfps_half_cycle;
+
+	aux_less_wake_time =
+		_lnl_compute_aux_less_wake_time(crtc_state->port_clock);
+	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
+						       aux_less_wake_time);
+
+	if (!_lnl_get_silence_period_and_lfps_half_cycle(crtc_state->port_clock,
+							 &silence_period,
+							 &lfps_half_cycle))
+		return false;
+
+	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
+	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||
+	    lfps_half_cycle > PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK)
+		return false;
+
+	if (i915->display.params.psr_safest_params)
+		aux_less_wake_lines = ALPM_CTL_AUX_LESS_WAKE_TIME_MASK;
+
+	intel_dp->alpm_parameters.fast_wake_lines = aux_less_wake_lines;
+	intel_dp->alpm_parameters.silence_period_sym_clocks = silence_period;
+	intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
+
+	return true;
+}
+
+static bool _lnl_compute_alpm_params(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int check_entry_lines;
+
+	if (DISPLAY_VER(i915) < 20)
+		return true;
+
+	/* ALPM Entry Check = 2 + CEILING( 5us /tline ) */
+	check_entry_lines = 2 +
+		intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode, 5);
+
+	if (check_entry_lines > 15)
+		return false;
+
+	if (!_lnl_compute_aux_less_alpm_params(intel_dp, crtc_state))
+		return false;
+
+	if (i915->display.params.psr_safest_params)
+		check_entry_lines = 15;
+
+	intel_dp->alpm_parameters.check_entry_lines = check_entry_lines;
+
+	return true;
+}
+
+/*
+ * IO wake time for DISPLAY_VER < 12 is not directly mentioned in Bspec. There
+ * are 50 us io wake time and 32 us fast wake time. Clearly preharge pulses are
+ * not (improperly) included in 32 us fast wake time. 50 us - 32 us = 18 us.
+ */
+static int skl_io_buffer_wake_time(void)
+{
+	return 18;
+}
+
+static int tgl_io_buffer_wake_time(void)
+{
+	return 10;
+}
+
+static int io_buffer_wake_time(const struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+
+	if (DISPLAY_VER(i915) >= 12)
+		return tgl_io_buffer_wake_time();
+	else
+		return skl_io_buffer_wake_time();
+}
+
+bool intel_alpm_compute_params(struct intel_dp *intel_dp,
+				      struct intel_crtc_state *crtc_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int io_wake_lines, io_wake_time, fast_wake_lines, fast_wake_time;
+	int tfw_exit_latency = 20; /* eDP spec */
+	int phy_wake = 4;	   /* eDP spec */
+	int preamble = 8;	   /* eDP spec */
+	int precharge = intel_dp_aux_fw_sync_len() - preamble;
+	u8 max_wake_lines;
+
+	io_wake_time = max(precharge, io_buffer_wake_time(crtc_state)) +
+		preamble + phy_wake + tfw_exit_latency;
+	fast_wake_time = precharge + preamble + phy_wake +
+		tfw_exit_latency;
+
+	if (DISPLAY_VER(i915) >= 20)
+		max_wake_lines = 68;
+	else if (DISPLAY_VER(i915) >= 12)
+		max_wake_lines = 12;
+	else
+		max_wake_lines = 8;
+
+	io_wake_lines = intel_usecs_to_scanlines(
+		&crtc_state->hw.adjusted_mode, io_wake_time);
+	fast_wake_lines = intel_usecs_to_scanlines(
+		&crtc_state->hw.adjusted_mode, fast_wake_time);
+
+	if (io_wake_lines > max_wake_lines ||
+	    fast_wake_lines > max_wake_lines)
+		return false;
+
+	if (!_lnl_compute_alpm_params(intel_dp, crtc_state))
+		return false;
+
+	if (i915->display.params.psr_safest_params)
+		io_wake_lines = fast_wake_lines = max_wake_lines;
+
+	/* According to Bspec lower limit should be set as 7 lines. */
+	intel_dp->alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
+	intel_dp->alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
+
+	return true;
+}
+
+static void lnl_alpm_configure(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
+	u32 alpm_ctl;
+
+	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.sel_update_enabled &&
+					   !intel_dp_is_edp(intel_dp)))
+		return;
+
+	/*
+	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
+	 * check panel support at this point.
+	 */
+	if (intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) {
+		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
+			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
+			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
+
+		intel_de_write(dev_priv,
+			       PORT_ALPM_CTL(dev_priv, cpu_transcoder),
+			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
+			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
+			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
+			       PORT_ALPM_CTL_SILENCE_PERIOD(
+				       intel_dp->alpm_parameters.silence_period_sym_clocks));
+
+		intel_de_write(dev_priv,
+			       PORT_ALPM_LFPS_CTL(dev_priv, cpu_transcoder),
+			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
+			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
+			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
+			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
+				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms));
+	} else {
+		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
+			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
+	}
+
+	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
+
+	intel_de_write(dev_priv, ALPM_CTL(dev_priv, cpu_transcoder), alpm_ctl);
+}
+
+void intel_alpm_configure(struct intel_dp *intel_dp)
+{
+	lnl_alpm_configure(intel_dp);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
new file mode 100644
index 000000000000..c45d078e5a6b
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _INTEL_ALPM_H
+#define _INTEL_ALPM_H
+
+#include <linux/types.h>
+
+struct intel_dp;
+struct intel_crtc_state;
+
+bool intel_alpm_compute_params(struct intel_dp *intel_dp,
+			       struct intel_crtc_state *crtc_state);
+void intel_alpm_configure(struct intel_dp *intel_dp);
+
+#endif
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 977a7eaa0cde..7b22b66bda6a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -27,6 +27,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
+#include "intel_alpm.h"
 #include "intel_atomic.h"
 #include "intel_crtc.h"
 #include "intel_cursor_regs.h"
@@ -1212,238 +1213,6 @@ static bool _compute_psr2_sdp_prior_scanline_indication(struct intel_dp *intel_d
 	return true;
 }
 
-/*
- * See Bspec: 71632 for the table
- *
- * Silence_period = tSilence,Min + ((tSilence,Max - tSilence,Min) / 2)
- *
- * Half cycle duration:
- *
- * Link rates 1.62 - 4.32 and tLFPS_Cycle = 70 ns
- * FLOOR( (Link Rate * tLFPS_Cycle) / (2 * 10) )
- *
- * Link rates 5.4 - 8.1
- * PORT_ALPM_LFPS_CTL[ LFPS Cycle Count ] = 10
- * LFPS Period chosen is the mid-point of the min:max values from the table
- * FLOOR( LFPS Period in Symbol clocks /
- * (2 * PORT_ALPM_LFPS_CTL[ LFPS Cycle Count ]) )
- */
-static bool _lnl_get_silence_period_and_lfps_half_cycle(int link_rate,
-							int *silence_period,
-							int *lfps_half_cycle)
-{
-	switch (link_rate) {
-	case 162000:
-		*silence_period = 20;
-		*lfps_half_cycle = 5;
-		break;
-	case 216000:
-		*silence_period = 27;
-		*lfps_half_cycle = 7;
-		break;
-	case 243000:
-		*silence_period = 31;
-		*lfps_half_cycle = 8;
-		break;
-	case 270000:
-		*silence_period = 34;
-		*lfps_half_cycle = 9;
-		break;
-	case 324000:
-		*silence_period = 41;
-		*lfps_half_cycle = 11;
-		break;
-	case 432000:
-		*silence_period = 56;
-		*lfps_half_cycle = 15;
-		break;
-	case 540000:
-		*silence_period = 69;
-		*lfps_half_cycle = 12;
-		break;
-	case 648000:
-		*silence_period = 84;
-		*lfps_half_cycle = 15;
-		break;
-	case 675000:
-		*silence_period = 87;
-		*lfps_half_cycle = 15;
-		break;
-	case 810000:
-		*silence_period = 104;
-		*lfps_half_cycle = 19;
-		break;
-	default:
-		*silence_period = *lfps_half_cycle = -1;
-		return false;
-	}
-	return true;
-}
-
-/*
- * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
- * tSilence, Max+ tPHY Establishment + tCDS) / tline)
- * For the "PHY P2 to P0" latency see the PHY Power Control page
- * (PHY P2 to P0) : https://gfxspecs.intel.com/Predator/Home/Index/68965
- * : 12 us
- * The tLFPS_Period, Max term is 800ns
- * The tSilence, Max term is 180ns
- * The tPHY Establishment (a.k.a. t1) term is 50us
- * The tCDS term is 1 or 2 times t2
- * t2 = Number ML_PHY_LOCK * tML_PHY_LOCK
- * Number ML_PHY_LOCK = ( 7 + CEILING( 6.5us / tML_PHY_LOCK ) + 1)
- * Rounding up the 6.5us padding to the next ML_PHY_LOCK boundary and
- * adding the "+ 1" term ensures all ML_PHY_LOCK sequences that start
- * within the CDS period complete within the CDS period regardless of
- * entry into the period
- * tML_PHY_LOCK = TPS4 Length * ( 10 / (Link Rate in MHz) )
- * TPS4 Length = 252 Symbols
- */
-static int _lnl_compute_aux_less_wake_time(int port_clock)
-{
-	int tphy2_p2_to_p0 = 12 * 1000;
-	int tlfps_period_max = 800;
-	int tsilence_max = 180;
-	int t1 = 50 * 1000;
-	int tps4 = 252;
-	int tml_phy_lock = 1000 * 1000 * tps4 * 10 / port_clock;
-	int num_ml_phy_lock = 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
-	int t2 = num_ml_phy_lock * tml_phy_lock;
-	int tcds = 1 * t2;
-
-	return DIV_ROUND_UP(tphy2_p2_to_p0 + tlfps_period_max + tsilence_max +
-			    t1 + tcds, 1000);
-}
-
-static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
-					     struct intel_crtc_state *crtc_state)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	int aux_less_wake_time, aux_less_wake_lines, silence_period,
-		lfps_half_cycle;
-
-	aux_less_wake_time =
-		_lnl_compute_aux_less_wake_time(crtc_state->port_clock);
-	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
-						       aux_less_wake_time);
-
-	if (!_lnl_get_silence_period_and_lfps_half_cycle(crtc_state->port_clock,
-							 &silence_period,
-							 &lfps_half_cycle))
-		return false;
-
-	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
-	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||
-	    lfps_half_cycle > PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK)
-		return false;
-
-	if (i915->display.params.psr_safest_params)
-		aux_less_wake_lines = ALPM_CTL_AUX_LESS_WAKE_TIME_MASK;
-
-	intel_dp->alpm_parameters.fast_wake_lines = aux_less_wake_lines;
-	intel_dp->alpm_parameters.silence_period_sym_clocks = silence_period;
-	intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
-
-	return true;
-}
-
-static bool _lnl_compute_alpm_params(struct intel_dp *intel_dp,
-				     struct intel_crtc_state *crtc_state)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	int check_entry_lines;
-
-	if (DISPLAY_VER(i915) < 20)
-		return true;
-
-	/* ALPM Entry Check = 2 + CEILING( 5us /tline ) */
-	check_entry_lines = 2 +
-		intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode, 5);
-
-	if (check_entry_lines > 15)
-		return false;
-
-	if (!_lnl_compute_aux_less_alpm_params(intel_dp, crtc_state))
-		return false;
-
-	if (i915->display.params.psr_safest_params)
-		check_entry_lines = 15;
-
-	intel_dp->alpm_parameters.check_entry_lines = check_entry_lines;
-
-	return true;
-}
-
-/*
- * IO wake time for DISPLAY_VER < 12 is not directly mentioned in Bspec. There
- * are 50 us io wake time and 32 us fast wake time. Clearly preharge pulses are
- * not (improperly) included in 32 us fast wake time. 50 us - 32 us = 18 us.
- */
-static int skl_io_buffer_wake_time(void)
-{
-	return 18;
-}
-
-static int tgl_io_buffer_wake_time(void)
-{
-	return 10;
-}
-
-static int io_buffer_wake_time(const struct intel_crtc_state *crtc_state)
-{
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
-
-	if (DISPLAY_VER(i915) >= 12)
-		return tgl_io_buffer_wake_time();
-	else
-		return skl_io_buffer_wake_time();
-}
-
-static bool _compute_alpm_params(struct intel_dp *intel_dp,
-				 struct intel_crtc_state *crtc_state)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	int io_wake_lines, io_wake_time, fast_wake_lines, fast_wake_time;
-	int tfw_exit_latency = 20; /* eDP spec */
-	int phy_wake = 4;	   /* eDP spec */
-	int preamble = 8;	   /* eDP spec */
-	int precharge = intel_dp_aux_fw_sync_len() - preamble;
-	u8 max_wake_lines;
-
-	io_wake_time = max(precharge, io_buffer_wake_time(crtc_state)) +
-		preamble + phy_wake + tfw_exit_latency;
-	fast_wake_time = precharge + preamble + phy_wake +
-		tfw_exit_latency;
-
-	if (DISPLAY_VER(i915) >= 20)
-		max_wake_lines = 68;
-	else if (DISPLAY_VER(i915) >= 12)
-		max_wake_lines = 12;
-	else
-		max_wake_lines = 8;
-
-	io_wake_lines = intel_usecs_to_scanlines(
-		&crtc_state->hw.adjusted_mode, io_wake_time);
-	fast_wake_lines = intel_usecs_to_scanlines(
-		&crtc_state->hw.adjusted_mode, fast_wake_time);
-
-	if (io_wake_lines > max_wake_lines ||
-	    fast_wake_lines > max_wake_lines)
-		return false;
-
-	if (!_lnl_compute_alpm_params(intel_dp, crtc_state))
-		return false;
-
-	if (i915->display.params.psr_safest_params)
-		io_wake_lines = fast_wake_lines = max_wake_lines;
-
-	/* According to Bspec lower limit should be set as 7 lines. */
-	intel_dp->alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
-	intel_dp->alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
-
-	return true;
-}
-
 static int intel_psr_entry_setup_frames(struct intel_dp *intel_dp,
 					const struct drm_display_mode *adjusted_mode)
 {
@@ -1560,7 +1329,7 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (!_compute_alpm_params(intel_dp, crtc_state)) {
+	if (!intel_alpm_compute_params(intel_dp, crtc_state)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "PSR2 not enabled, Unable to use long enough wake times\n");
 		return false;
@@ -1836,52 +1605,6 @@ static void wm_optimization_wa(struct intel_dp *intel_dp,
 			     wa_16013835468_bit_get(intel_dp), 0);
 }
 
-static void lnl_alpm_configure(struct intel_dp *intel_dp)
-{
-	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
-	u32 alpm_ctl;
-
-	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.sel_update_enabled &&
-					   !intel_dp_is_edp(intel_dp)))
-		return;
-
-	/*
-	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
-	 * check panel support at this point.
-	 */
-	if (intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) {
-		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
-			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
-
-		intel_de_write(dev_priv,
-			       PORT_ALPM_CTL(dev_priv, cpu_transcoder),
-			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
-			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
-			       PORT_ALPM_CTL_SILENCE_PERIOD(
-				       intel_dp->alpm_parameters.silence_period_sym_clocks));
-
-		intel_de_write(dev_priv,
-			       PORT_ALPM_LFPS_CTL(dev_priv, cpu_transcoder),
-			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
-			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
-			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
-			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms));
-	} else {
-		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
-			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
-	}
-
-	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
-
-	intel_de_write(dev_priv, ALPM_CTL(dev_priv, cpu_transcoder), alpm_ctl);
-}
-
 static void intel_psr_enable_source(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -1962,7 +1685,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			     IGNORE_PSR2_HW_TRACKING : 0);
 
 	if (intel_dp_is_edp(intel_dp))
-		lnl_alpm_configure(intel_dp);
+		intel_alpm_configure(intel_dp);
 
 	/*
 	 * Wa_16013835468
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d5b137e762ed..e91d22e55221 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -221,6 +221,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/icl_dsi.o \
+	i915-display/intel_alpm.o \
 	i915-display/intel_atomic.o \
 	i915-display/intel_atomic_plane.o \
 	i915-display/intel_audio.o \
-- 
2.29.0

