Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCFC2E494
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92210E4E3;
	Mon,  3 Nov 2025 22:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px8BpsP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DAC10E4E3;
 Mon,  3 Nov 2025 22:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209460; x=1793745460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y/b7vpLcYZTwOYu+LjhHAWHiWP3z0QzXiy/mLMOuK7I=;
 b=Px8BpsP7o4NJ+lh4r566D+wJvyx/qkGL5pxQ0f+mNhEd8PZl6vkYjISG
 h0Y3h+ew2Jkq5MQpiZjsR2zwhAHuNJdwWZVN0zPvswM/mOp8GMHm+4cls
 b2/A3J7d9PoWawuAjYzjrXuPqAWrilgDiB1zRq+pzU/OoVNgRpCHTX/m2
 JGQUP41++Co3d7iVkwYTT7wEH0SNWmv4fO5QHzVMo7rSc2nRgLH7UpKIr
 +iokUuvvM9OhtQyIs4QQIFdKqvAnEPvjK1PdDMwXHY7xoWbYQcx5Dep7q
 9Xo9JvypmaPmxHKQgom1jGcTJKvll2nyq1+S8KgsFtZnY9Dz560ne0YnU g==;
X-CSE-ConnectionGUID: c+HYB5W+Sm+pQUTPAyCNdg==
X-CSE-MsgGUID: 5rIJP2jfSR6QJB42BF4cHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899625"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:39 -0800
X-CSE-ConnectionGUID: 9dVQCg17Sk2bOiZiYYx/hQ==
X-CSE-MsgGUID: BHhGrdcpToqGSiSA2FMZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707527"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:38 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 06/10] drm/i915/alpm: Half LFPS cycle calculation
Date: Tue,  4 Nov 2025 03:39:53 +0530
Message-Id: <20251103220957.1229608-7-animesh.manna@intel.com>
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

Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
parameters got changed.

v1: Initial version.
v2: Avoid returning early. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 38 +++++++++++++++--------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 5686064def8d..97813ce2d4d0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -57,31 +57,43 @@ static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 		1000 / 1000;
 }
 
-static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *crtc_state,
+static void get_lfps_cycle_min_max_time(struct intel_dp *intel_dp,
+					const struct intel_crtc_state *crtc_state,
 					int *min, int *max)
 {
-	if (crtc_state->port_clock < 540000) {
-		*min = 65 * LFPS_CYCLE_COUNT;
-		*max = 75 * LFPS_CYCLE_COUNT;
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (intel_dp_is_edp(intel_dp)) {
+		if (crtc_state->port_clock < 540000) {
+			*min = DISPLAY_VER(display) < 35 ? 65 * LFPS_CYCLE_COUNT : 140;
+			*max = DISPLAY_VER(display) < 35 ? 75 * LFPS_CYCLE_COUNT : 800;
+		} else {
+			*min = 140;
+			*max = 800;
+		}
 	} else {
-		*min = 140;
-		*max = 800;
+		*min = 320;
+		*max = 1600;
+		return;
 	}
 }
 
-static int get_lfps_cycle_time(const struct intel_crtc_state *crtc_state)
+static int get_lfps_cycle_time(struct intel_dp *intel_dp,
+			       const struct intel_crtc_state *crtc_state)
 {
 	int tlfps_cycle_min, tlfps_cycle_max;
 
-	get_lfps_cycle_min_max_time(crtc_state, &tlfps_cycle_min,
+	get_lfps_cycle_min_max_time(intel_dp, crtc_state, &tlfps_cycle_min,
 				    &tlfps_cycle_max);
 
 	return tlfps_cycle_min +  (tlfps_cycle_max - tlfps_cycle_min) / 2;
 }
 
-static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
+static int get_lfps_half_cycle_clocks(struct intel_dp *intel_dp,
+				      const struct intel_crtc_state *crtc_state)
 {
-	return get_lfps_cycle_time(crtc_state) * crtc_state->port_clock / 1000 /
+	return get_lfps_cycle_time(intel_dp, crtc_state) *
+		crtc_state->port_clock / 1000 /
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
@@ -112,7 +124,7 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 	if (lttpr_count) {
 		int tlw = 13000;
 		int tcs = 10000;
-		int tlfps_period = get_lfps_cycle_time(crtc_state);
+		int tlfps_period = get_lfps_cycle_time(intel_dp, crtc_state);
 		int tdcs = (SILENCE_PERIOD_TIME + t1 + tcs +
 			    (lttpr_count - 1) * (tlw + tlfps_period));
 		int tacds = 70000;
@@ -171,7 +183,7 @@ static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
 	int establishment_period = get_establishment_period(intel_dp, crtc_state);
 	int switch_to_active = get_switch_to_active(crtc_state);
 
-	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
+	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(intel_dp, crtc_state) +
 			    establishment_period + switch_to_active, 1000);
 }
 
@@ -189,7 +201,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
 
-	lfps_half_cycle = get_lfps_half_cycle_clocks(crtc_state);
+	lfps_half_cycle = get_lfps_half_cycle_clocks(intel_dp, crtc_state);
 
 	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
 	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||
-- 
2.29.0

