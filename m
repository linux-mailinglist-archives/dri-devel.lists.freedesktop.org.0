Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2928C001E9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B309110E36D;
	Thu, 23 Oct 2025 09:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZecBWX0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89B10E37C;
 Thu, 23 Oct 2025 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210545; x=1792746545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2dmUos7YEgFUFLbL0p87K51n+wfvD34f34Q1NTQCso=;
 b=ZecBWX0bcVa+N06YEcxTGely+O3Sss88mxRbYFdDC+fKgxNY4iXZ1lzo
 n633y4p1FX+NDZvMm74Tzvp4gCx9Oft/wmwsopJWdqsOpAY+iV4GF6IWh
 YFfy1BAz7a5rtTCiKkjutaXO3AYQ1HtfZaq5Wi/+hN81IcpuPGexMX3HH
 f3sF7EyI2TCA1uOmvYbNtMppouY4iFkeLNjZ3/fUEL5yApTc1s4dSDyRA
 A6l1UnMqudY2fRq7wBvbCr8uu/VoydN5mG14fHoPBGkE3du2e5CkA13P9
 FxCPoFlXwZk6KGlWKEfNPkZ2rBfSGdlkIWDWvP8QOCeFDM9AfayXUMV12 g==;
X-CSE-ConnectionGUID: V303vByZQDWRfoICk3E4PA==
X-CSE-MsgGUID: UuEHVSxuQKizCgAIabdlzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020644"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:09:05 -0700
X-CSE-ConnectionGUID: /MD7xeBIR1aN4GKWFFlIFw==
X-CSE-MsgGUID: lwWG0UmHRVWOsCjZimtrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329426"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:09:03 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 5/8] drm/i915/alpm: Auxless wake time calculation for Xe3p
Date: Thu, 23 Oct 2025 14:11:44 +0530
Message-Id: <20251023084147.572535-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
References: <20251023084147.572535-1-animesh.manna@intel.com>
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

Add support for auxless waketime calculation for DP2.1 ALPM
as dependent parameter got changed.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 78 +++++++++++++++++++----
 1 file changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 0f6b15bca3be..ee5b1e3d79d2 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -96,6 +96,66 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
+static int get_tphy2_p2_to_p0(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return DISPLAY_VER(display) >= 35 ? (40 * 1000) : (12 * 1000);
+}
+
+static int get_establishment_period(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state)
+{
+	int port_clock = crtc_state->port_clock;
+	int t1 = 50 * 1000;
+	int tps4 = (port_clock >= 1000000) ? (396 * 32) : (252 * 10);
+	int tml_phy_lock = 1000 * 1000 * tps4 / port_clock / 10;
+	int lttpr_count = 0;
+	int establishment_period;
+	int tcds;
+
+	if (!intel_dp_is_edp(intel_dp)) {
+		lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
+		tcds = 7 * tml_phy_lock;
+	} else {
+		tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
+	}
+
+	if (lttpr_count) {
+		int tlw = 13000;
+		int tcs = 10000;
+		int tlfps_period = get_lfps_cycle_time(crtc_state);
+		int tdcs = (SILENCE_PERIOD_TIME + t1 + tcs +
+			    (lttpr_count - 1) * (tlw + tlfps_period));
+		int tacds = 70000;
+		int tds = (lttpr_count - 1) * 7 * tml_phy_lock;
+
+		/* tdrl is same as tcds*/
+		establishment_period = tlw + tlfps_period + tdcs + tacds + tds + tcds;
+	} else {
+		/* TODO: Add a check for data realign by DPCD 0x116[3] */
+
+		establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+	}
+
+	return establishment_period;
+}
+
+static int get_switch_to_active(int port_clock)
+{
+	int switch_to_active;
+
+	if (port_clock >= 1000000) {
+		int symbol_clock = port_clock / intel_dp_link_symbol_size(port_clock);
+
+		switch_to_active = 32 * DIV_ROUND_UP((396 + 3 + 64), symbol_clock);
+	} else {
+		switch_to_active = 0;
+	}
+
+	return switch_to_active;
+}
+
 /*
  * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
  * tSilence, Max+ tPHY Establishment + tCDS) / tline)
@@ -115,19 +175,15 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
  * tML_PHY_LOCK = TPS4 Length * ( 10 / (Link Rate in MHz) )
  * TPS4 Length = 252 Symbols
  */
-static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state *crtc_state)
+static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state)
 {
-	int tphy2_p2_to_p0 = 12 * 1000;
-	int t1 = 50 * 1000;
-	int tps4 = 252;
-	/* port_clock is link rate in 10kbit/s units */
-	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
-	int num_ml_phy_lock = 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
-	int t2 = num_ml_phy_lock * tml_phy_lock;
-	int tcds = 1 * t2;
+	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(intel_dp);
+	int establishment_period = get_establishment_period(intel_dp, crtc_state);
+	int switch_to_active = get_switch_to_active(crtc_state->port_clock);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
+			    establishment_period + switch_to_active, 1000);
 }
 
 static int
@@ -139,7 +195,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 		lfps_half_cycle;
 
 	aux_less_wake_time =
-		_lnl_compute_aux_less_wake_time(crtc_state);
+		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
 	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
-- 
2.29.0

