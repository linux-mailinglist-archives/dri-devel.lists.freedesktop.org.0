Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECAC4E0A1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A610E58D;
	Tue, 11 Nov 2025 13:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzsz0Ipi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8910E58D;
 Tue, 11 Nov 2025 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866656; x=1794402656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rawZZladWJILyVaX3PKAxwF2N+MVSVk4SkQkdLCw9RY=;
 b=kzsz0IpilTHF92Anj/xMCWZH2/uH1S4F5P/Dp+QZuMgU/OF6YiSjQUf4
 45wR9b0UOa4AjGB755cikb56mIpor6j5hSCpqLYx6xZ3mzzhapOPVNnDy
 EAHbXgJUJ6wEtKvjGGRChfz38fqG21OiXN/pXsVRm84M0MKCSLYQET5MX
 ZYvMnUBDkCDSjuM6c4Zp0r3BlwH/ow7uYd+Y+kX50pp2mrFLbYL+T3bRa
 HhzS6NUJMpv/IAspB8r3aDg7V4WSAua9qTfQg4z/bI4nJOZJm6ue0vVhL
 VwOjH7rtWFtDYQSfqsH2/VVi6CuS/Qs2E0tbW3VFvNP+Q2f3lDhMEV0PJ g==;
X-CSE-ConnectionGUID: r9KW8b/4RqSfZrjO5FZEXw==
X-CSE-MsgGUID: j6AA0S6TRtKitucpGxTq9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967469"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:56 -0800
X-CSE-ConnectionGUID: oSeY3rarSvC9iU3Abz6uDQ==
X-CSE-MsgGUID: OQpT0Th1SVikWAuZh1grCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129238"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:54 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 04/10] drm/i915/alpm: Refactor Auxless wake time calculation
Date: Tue, 11 Nov 2025 18:13:10 +0530
Message-Id: <20251111124316.1421013-5-animesh.manna@intel.com>
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

Divide the auxless wake time calculation in parts which will
help later to add Xe3p related modification.

v2: Refactor first existing calculation. [Jani]
v3: Cosmetic changes. [Jani, Suraj]

Bspec: 71477
Cc: Jouni Högander <jouni.hogander@intel.com>
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

