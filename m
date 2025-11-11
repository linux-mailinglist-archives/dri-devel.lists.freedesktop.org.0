Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD9C4E0A3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905210E59C;
	Tue, 11 Nov 2025 13:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjoVjo3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61D210E593;
 Tue, 11 Nov 2025 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866659; x=1794402659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xp8D+R27q7WMA4a4qGRQk8RCxPRaTd0hNZZDyDrB67A=;
 b=ZjoVjo3K1yw8JsaVHFtcKkAnAo7J1ye+Nv2d2hCRVJXXMDb2Jp3YFK8n
 W/cO/DuihRQSC62sALPPMhXsKgFZCULDKcjfnoqX8bEBAw04lxyFT3Pjf
 6B69zDHMT7CqZBRl9BP987GESUeR7zq7YdDy9QFCcDa2QTE1vltuHYuTB
 ZFfWvq+/BEgyCefU0OcAnEr6MJ6f2UG38YPxUERfB5ABI56DIIP4j5Iml
 BCul7YNKxDGfLnly268uPn5aFD4cRg02pZpeaRVntahs2IFE86gIDHLRM
 eOlf5lIWni8p44xwF9jV8kjoszCejeLj8VpoF58crMPWob6MMk57oll79 g==;
X-CSE-ConnectionGUID: gV5Sy3DCTzid/mMjqoUhNQ==
X-CSE-MsgGUID: 10kK0K2rTxG14v03LVORww==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967472"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:59 -0800
X-CSE-ConnectionGUID: 60H2+RNcSnKMPBz40NreZQ==
X-CSE-MsgGUID: XvAkFhdmSOiKUrYZc1c3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129253"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:57 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 05/10] drm/i915/alpm: Auxless wake time calculation for Xe3p
Date: Tue, 11 Nov 2025 18:13:11 +0530
Message-Id: <20251111124316.1421013-6-animesh.manna@intel.com>
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

Add support for auxless waketime calculation for DP2.1 ALPM
as dependent parameter got changed.

v1: Initial version.
v2: Use intel_dp_is_uhbr(). [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 63 +++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index b4b874dd3725..81472254ab73 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -100,23 +100,64 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 
 static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
 {
-	return 12 * 1000;
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return DISPLAY_VER(display) >= 35 ? (40 * 1000) : (12 * 1000);
 }
 
-static int get_establishment_period(const struct intel_crtc_state *crtc_state)
+static int get_establishment_period(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state)
 {
 	int t1 = 50 * 1000;
-	int tps4 = 252;
+	int tps4 = intel_dp_is_uhbr(crtc_state) ? (396 * 32) : (252 * 10);
 	/* port_clock is link rate in 10kbit/s units */
-	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
+	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock / 10;
+	int lttpr_count = 0;
 	int tcds, establishment_period;
 
-	tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
-	establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
+	} else {
+		tcds = 7 * tml_phy_lock;
+		lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
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
 
 	return establishment_period;
 }
 
+static int get_switch_to_active(const struct intel_crtc_state *crtc_state)
+{
+	int port_clock = crtc_state->port_clock;
+	int switch_to_active;
+
+	if (intel_dp_is_uhbr(crtc_state)) {
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
@@ -136,13 +177,15 @@ static int get_establishment_period(const struct intel_crtc_state *crtc_state)
  * tML_PHY_LOCK = TPS4 Length * ( 10 / (Link Rate in MHz) )
  * TPS4 Length = 252 Symbols
  */
-static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state *crtc_state)
+static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state)
 {
 	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(crtc_state);
-	int establishment_period = get_establishment_period(crtc_state);
+	int establishment_period = get_establishment_period(intel_dp, crtc_state);
+	int switch_to_active = get_switch_to_active(crtc_state);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    establishment_period, 1000);
+			    establishment_period + switch_to_active, 1000);
 }
 
 static int
@@ -154,7 +197,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 		lfps_half_cycle;
 
 	aux_less_wake_time =
-		_lnl_compute_aux_less_wake_time(crtc_state);
+		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
 	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
-- 
2.29.0

