Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0406C2E488
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722910E4CE;
	Mon,  3 Nov 2025 22:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg285d0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A19610E4DC;
 Mon,  3 Nov 2025 22:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209453; x=1793745453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1OfLTO9LecGVmZIo/rXmYQF5kffU0EcwF8iBnR9XgM=;
 b=jg285d0RnpzzjPNJCtUS45L+gzcKwL0mEdfNliblGJLOCFKUDU1dSymO
 XqFdSNnrnMkcreXiq6g88Fh4c0hoY39UjdwGK88SXWfh9hUln6u977bT4
 1Q9m8CniF0woh3sJ1gcaOZQnGvi7pGc4LcZwKcc025KM3vY8yH1uKa9Ci
 S5AVBaKuivAZnUVdbyu+HDyPujdNMHYutMwhsIyCWEwi5qtCZWZ0H6898
 yNMJyJWbttbpBEgW/OAFPrjGwAgRZ/sS3I3/CmuDGUaOiqCGnFANnh12u
 KsyVmTm1PUFM6FM6JAKEN6cIPrVV/w9BTkEkyZfBoKikkP6UQeR8wWZ7a Q==;
X-CSE-ConnectionGUID: ZJkRyh0lSmaexn5I8B791g==
X-CSE-MsgGUID: qbq9UtQqQj2NGmJNq0Wr7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899617"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899617"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:33 -0800
X-CSE-ConnectionGUID: MEefr4K1RZW6StnPJfJ5pA==
X-CSE-MsgGUID: 7im7aaXnTXSpPr2WwTllLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707516"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:31 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time calculation
Date: Tue,  4 Nov 2025 03:39:51 +0530
Message-Id: <20251103220957.1229608-5-animesh.manna@intel.com>
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

Divide the auxless wake time calculation in parts which will
help later to add Xe3p related modification.

v1: Initial version.
v2: Refactor first existing calculation. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 37 ++++++++++++++++-------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 779718d0c8dd..8d07455a62c2 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -85,6 +85,26 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
+static int get_tphy2_p2_to_p0(struct intel_dp *intel_dp)
+{
+	return 12 * 1000;
+}
+
+static int get_establishment_period(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state)
+{
+	int port_clock = crtc_state->port_clock;
+	int t1 = 50 * 1000;
+	int tps4 = (252 * 10);
+	long tml_phy_lock = 1000 * 1000 * tps4 / port_clock / 10;
+	int tcds, establishment_period;
+
+	tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
+	establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+
+	return establishment_period;
+}
+
 /*
  * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
  * tSilence, Max+ tPHY Establishment + tCDS) / tline)
@@ -104,19 +124,14 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
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
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
+			    establishment_period, 1000);
 }
 
 static int
@@ -128,7 +143,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 		lfps_half_cycle;
 
 	aux_less_wake_time =
-		_lnl_compute_aux_less_wake_time(crtc_state);
+		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
 	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
-- 
2.29.0

