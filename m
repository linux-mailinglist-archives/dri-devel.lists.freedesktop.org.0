Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A463FC5767C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060C10E805;
	Thu, 13 Nov 2025 12:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaRY5YTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5710E803;
 Thu, 13 Nov 2025 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036941; x=1794572941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFK97ZqkTCOMXeYkAMzVDs57Ya76ZogvCrhusYV11Jc=;
 b=eaRY5YTC4oGVouI6dCPUOt8Bs0ZiBU67tdtbyClrBKj3nN6x17ZqAFPJ
 i3oaPvSAvkQpoDvsgFgIMPlXrGaW+aNerEN8kYiyi82/V1Klmyz3YoBmV
 DShOX5aFnQ9M3J1DuRoJNWa58/K46vmCCUIXL5Y1PFpouB/h/ldnl5Zrk
 NVCG/k5IYvyIGw2nR8qIXzc9Ct5z6F9XpSlF708vB8hhsHe2bSvQWRHbq
 yjsTEI61X5nhWjB867Z+lWaXOzqHIV6PA16m8gXSydVUL1hbOo7XM6fj3
 Wo3HiuZbAAqL9ne4SwV/AHDzdS0i/X0WXMXjPHAG4MKk+Rrh4Z72zsUqi A==;
X-CSE-ConnectionGUID: QWkx0vlqSZiRHNiFKb1CVg==
X-CSE-MsgGUID: oCfuQY6OQqSkSZ4PaNoKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677899"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:01 -0800
X-CSE-ConnectionGUID: A1xBLu4XRu6lrPruXNJn/A==
X-CSE-MsgGUID: 0rDyynifToGKLs4N02jwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757737"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:28:59 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 04/10] drm/i915/alpm: Refactor Auxless wake time calculation
Date: Thu, 13 Nov 2025 17:31:13 +0530
Message-Id: <20251113120119.1437955-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

v2: Refactor first existing calculation. [Jani]
v3: Cosmetic changes. [Jani, Suraj]

Bspec: 71477
Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 31 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 3e271de5504b..b4b874dd3725 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -98,6 +98,25 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
+static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
+{
+	return 12 * 1000;
+}
+
+static int get_establishment_period(const struct intel_crtc_state *crtc_state)
+{
+	int t1 = 50 * 1000;
+	int tps4 = 252;
+	/* port_clock is link rate in 10kbit/s units */
+	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
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
@@ -119,17 +138,11 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
  */
 static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state *crtc_state)
 {
-	int tphy2_p2_to_p0 = 12 * 1000;
-	int t1 = 50 * 1000;
-	int tps4 = 252;
-	/* port_clock is link rate in 10kbit/s units */
-	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
-	int num_ml_phy_lock = 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
-	int t2 = num_ml_phy_lock * tml_phy_lock;
-	int tcds = 1 * t2;
+	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(crtc_state);
+	int establishment_period = get_establishment_period(crtc_state);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
+			    establishment_period, 1000);
 }
 
 static int
-- 
2.29.0

