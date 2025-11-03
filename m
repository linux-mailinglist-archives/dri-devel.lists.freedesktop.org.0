Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E162C2E48E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E65510E4DD;
	Mon,  3 Nov 2025 22:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJT3f6Q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AE610E4D8;
 Mon,  3 Nov 2025 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209456; x=1793745456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iWSmL/2mos6xKiZb7oTc7EhTXs0+No2zevzOkElzQjA=;
 b=nJT3f6Q+1SqxizEfWYu1ZrmPWylgIuXgaYzFbclFOyps/E8sGF1c1YJ2
 mhRHBKMJ6XX5iPv935JryI1ydemr9pbMdRyT+mKYsqGHgzu+M1vRbp/tE
 OYDnxWkhRVgSDymsJ7416orJJnSevEtti9wLpnufwdq2OVSISr2/rqsby
 QkI4KHuvd+VXCXWLP+CXbGGthT/9CS8N1a8+F6O08LhG6OxO6BLVe3a8p
 jjhj+/O6EWMuokSgtiJoX+wbXDgNRebVQyY/wfOnhXG/i/JXXJMsPJ+CU
 XWFW4lrYUtg7YncvmqqfXUUjerxl1zD/gJHlqQpFgGMBWIoCX8Qgk150+ Q==;
X-CSE-ConnectionGUID: Zng/FCeURZaSXiuAV76x2Q==
X-CSE-MsgGUID: A1v06iWERVKU0Z1HOccOAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899623"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:36 -0800
X-CSE-ConnectionGUID: crJ3LubMTGObx0kOVn5FiQ==
X-CSE-MsgGUID: jpt/G6R+R8uuDLEee0q3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707522"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:34 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 05/10] drm/i915/alpm: Auxless wake time calculation for Xe3p
Date: Tue,  4 Nov 2025 03:39:52 +0530
Message-Id: <20251103220957.1229608-6-animesh.manna@intel.com>
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

Add support for auxless waketime calculation for DP2.1 ALPM
as dependent parameter got changed.

v1: Initial version.
v2: Use intel_dp_is_uhbr(). [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 51 ++++++++++++++++++++---
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 8d07455a62c2..5686064def8d 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -87,7 +87,9 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 
 static int get_tphy2_p2_to_p0(struct intel_dp *intel_dp)
 {
-	return 12 * 1000;
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return DISPLAY_VER(display) >= 35 ? (40 * 1000) : (12 * 1000);
 }
 
 static int get_establishment_period(struct intel_dp *intel_dp,
@@ -95,16 +97,54 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 {
 	int port_clock = crtc_state->port_clock;
 	int t1 = 50 * 1000;
-	int tps4 = (252 * 10);
+	int tps4 = intel_dp_is_uhbr(crtc_state) ? (396 * 32) : (252 * 10);
 	long tml_phy_lock = 1000 * 1000 * tps4 / port_clock / 10;
+	int lttpr_count = 0;
 	int tcds, establishment_period;
 
-	tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
-	establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+	if (intel_dp_is_edp(intel_dp)) {
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
@@ -129,9 +169,10 @@ static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
 {
 	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(intel_dp);
 	int establishment_period = get_establishment_period(intel_dp, crtc_state);
+	int switch_to_active = get_switch_to_active(crtc_state);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    establishment_period, 1000);
+			    establishment_period + switch_to_active, 1000);
 }
 
 static int
-- 
2.29.0

