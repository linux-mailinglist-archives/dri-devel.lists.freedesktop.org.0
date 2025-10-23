Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EBC001F2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028A110E37F;
	Thu, 23 Oct 2025 09:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gE4S7g2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E710E370;
 Thu, 23 Oct 2025 09:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210548; x=1792746548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3rqInR5C9x7F6dvMZeKyRYDiXNjkObxe7N4Ii2fiqIs=;
 b=gE4S7g2jMUOIG3DPb3W9r22GLUYJy6hoE1raO8TzAF9IxyPohskfoJWK
 xVX2YqBoMXCWig71JavoKElS2tq+6ki2vDnxFJWfrN+lhoOpN1Yr3GlhO
 OVEbYEtrs/RxvFhYCYO1MlCnvEiENWsY+R9DIGEMSd9p/GLTQGbstlVbR
 KXWgjNPV6vU9OCdC8yglv5iCmhNih2Kr1dnTl6W6KsgvSXfZdyiH3KMZg
 DwVWWWSXFxxZlJVMfBKLbKRP6dv+igisSju1huhPB/qUJZ7VrElhXCooo
 9uOQl/74d9cVToaoE9BJPN0YdQfWlGB0xownnw6dbnUAoYgKthXUbX0xL w==;
X-CSE-ConnectionGUID: BKVl4QWvQJS/js+JBoWjBg==
X-CSE-MsgGUID: 85H+HXviTrSapwYQvT3usQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020655"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:09:08 -0700
X-CSE-ConnectionGUID: xsVC8AykSsmdwBOnQ/BpSQ==
X-CSE-MsgGUID: niOFrVM4Th+qIxFhONru9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329436"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:09:06 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 6/8] drm/i915/alpm: Half LFPS cycle calculation
Date: Thu, 23 Oct 2025 14:11:45 +0530
Message-Id: <20251023084147.572535-7-animesh.manna@intel.com>
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

Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
parameters got changed.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 32 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index ee5b1e3d79d2..f7803088f916 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -68,31 +68,43 @@ static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 		1000 / 1000;
 }
 
-static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *crtc_state,
+static void get_lfps_cycle_min_max_time(struct intel_dp *intel_dp,
+					const struct intel_crtc_state *crtc_state,
 					int *min, int *max)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (!intel_dp_is_edp(intel_dp)) {
+		*min = 320;
+		*max = 1600;
+		return;
+	}
+
 	if (crtc_state->port_clock < 540000) {
-		*min = 65 * LFPS_CYCLE_COUNT;
-		*max = 75 * LFPS_CYCLE_COUNT;
+		*min = DISPLAY_VER(display) < 35 ? 65 * LFPS_CYCLE_COUNT : 140;
+		*max = DISPLAY_VER(display) < 35 ? 75 * LFPS_CYCLE_COUNT : 800;
 	} else {
 		*min = 140;
 		*max = 800;
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
 
@@ -124,7 +136,7 @@ static int get_establishment_period(struct intel_dp *intel_dp,
 	if (lttpr_count) {
 		int tlw = 13000;
 		int tcs = 10000;
-		int tlfps_period = get_lfps_cycle_time(crtc_state);
+		int tlfps_period = get_lfps_cycle_time(intel_dp, crtc_state);
 		int tdcs = (SILENCE_PERIOD_TIME + t1 + tcs +
 			    (lttpr_count - 1) * (tlw + tlfps_period));
 		int tacds = 70000;
@@ -182,7 +194,7 @@ static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
 	int establishment_period = get_establishment_period(intel_dp, crtc_state);
 	int switch_to_active = get_switch_to_active(crtc_state->port_clock);
 
-	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
+	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(intel_dp, crtc_state) +
 			    establishment_period + switch_to_active, 1000);
 }
 
@@ -200,7 +212,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
 						       aux_less_wake_time);
 	silence_period = get_silence_period_symbols(crtc_state);
 
-	lfps_half_cycle = get_lfps_half_cycle_clocks(crtc_state);
+	lfps_half_cycle = get_lfps_half_cycle_clocks(intel_dp, crtc_state);
 
 	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
 	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||
-- 
2.29.0

