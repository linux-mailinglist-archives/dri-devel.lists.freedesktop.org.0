Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E9C4E0A7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ABD10E59D;
	Tue, 11 Nov 2025 13:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmPU4JID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4410E59E;
 Tue, 11 Nov 2025 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866663; x=1794402663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ASV5vANHJLeSu2NFjuhdzk13Y4R8MawJwE4U9KBWxW4=;
 b=ZmPU4JIDO5EBKoreIWnjMN90LHW8HA6LAPrqta4YSMR44vpjwYt/oRvu
 3LyIk6K9eBv18MFG9+WY0n2nce5phmjx04XUmumZYHHxJc5mn6JLVBTmp
 hFxieVVtQEcO8VkHFTTimpEBOcWpMZoTaSSfHSJ9F6gBfGilpmoxg+rHQ
 k/e3t6W4LfMDMrl+f5cFI1dpQZzjsQRsC2wMp6YDYQaPIxE0EMtbbwmSd
 Jsu6wPeuhyMA44Cu3clL4wiekCIuR4aTic1gVt6iRAF7r4Ll77y+UjaD5
 zniQsR9mDkUwHul2sIdz5uaaeEfMKswUy92DJObLff3KCZXgv2M28TM9q g==;
X-CSE-ConnectionGUID: eNlPvpQmRySUqJzm6gwz6g==
X-CSE-MsgGUID: FQw5p+5ERjqa4Gfmp9Xdxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967476"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:11:03 -0800
X-CSE-ConnectionGUID: RB80Eqe+Tcm9A9m3HRYt+Q==
X-CSE-MsgGUID: LIszg+QTS+KMgRlTsldfAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129278"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:11:00 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 06/10] drm/i915/alpm: Half LFPS cycle calculation
Date: Tue, 11 Nov 2025 18:13:12 +0530
Message-Id: <20251111124316.1421013-7-animesh.manna@intel.com>
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
index 81472254ab73..9c37f3ec06aa 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -70,31 +70,43 @@ static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
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
 
@@ -125,7 +137,7 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 	if (lttpr_count) {
 		int tlw = 13000;
 		int tcs = 10000;
-		int tlfps_period = get_lfps_cycle_time(crtc_state);
+		int tlfps_period = get_lfps_cycle_time(intel_dp, crtc_state);
 		int tdcs = (SILENCE_PERIOD_TIME + t1 + tcs +
 			    (lttpr_count - 1) * (tlw + tlfps_period));
 		int tacds = 70000;
@@ -184,7 +196,7 @@ static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
 	int establishment_period = get_establishment_period(intel_dp, crtc_state);
 	int switch_to_active = get_switch_to_active(crtc_state);
 
-	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
+	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(intel_dp, crtc_state) +
 			    establishment_period + switch_to_active, 1000);
 }
 
@@ -202,7 +214,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
 
-	lfps_half_cycle = get_lfps_half_cycle_clocks(crtc_state);
+	lfps_half_cycle = get_lfps_half_cycle_clocks(intel_dp, crtc_state);
 
 	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
 	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||
-- 
2.29.0

