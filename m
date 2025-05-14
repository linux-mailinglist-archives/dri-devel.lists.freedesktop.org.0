Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA9AB6698
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8A10E2BB;
	Wed, 14 May 2025 08:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Egkelvbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B146610E1FB;
 Wed, 14 May 2025 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747212909; x=1778748909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1rt+dbvWUUT7zeFWk90IRzVm48flClzWR+//0gRSEc=;
 b=EgkelvbvlUOhZ58jUCcm+xtUwIjNbiWIftbtIr4Ea70zzeGE4xZGMdal
 yweT+F2oHiiUkbCjkJRRX3VRaM2hlEEzr55TompTymAOXktX7GBzTELAv
 Y0JUwGLGBcU33KXnF+yBGfh7P9XlqDBRQzCMKCYVwTeKJnNHmb6NKd7Nj
 2wopGKRngX4RfXQqqCXREVjHud6HTlvkLUrCIUH/TJblXcudD4u3I/WdW
 jPw+jO+RmWE9OhaDja0TECJCTARaUtVgJjKNWN8B0WiI6GjMiauyV1oU8
 /G5lAlYGHnLiWDi8BBdQ8uhgYy4rIY+kdEspsow6orJfxL/ZesEOJm5Zt g==;
X-CSE-ConnectionGUID: v9fxihfQRDeyFcNRmc0Eew==
X-CSE-MsgGUID: jThAFmQNSoOr/AQw80+ZUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60106624"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60106624"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:55:09 -0700
X-CSE-ConnectionGUID: 6KMHjXifSaKRRCYs0SIfcw==
X-CSE-MsgGUID: HeO34aJsSpyAJWNYhHQNgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="138399191"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:55:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] Revert "drm/i915/dp: Reject HBR3 when sink doesn't
 support TPS4"
Date: Wed, 14 May 2025 14:13:55 +0530
Message-ID: <20250514084356.1558407-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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

This reverts commit 584cf613c24a4250d9be4819efc841aa2624d5b6.

Some eDP panels support HBR3 but not TPS4 and rely on a fixed mode that
requires HBR3. After the original commit, these panels go blank due to
the rejection of HBR3.

To restore functionality for such panels, this commit reverts the change.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++---------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 91a34d474463..97cf80372264 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -175,28 +175,10 @@ int intel_dp_link_symbol_clock(int rate)
 
 static int max_dprx_rate(struct intel_dp *intel_dp)
 {
-	struct intel_display *display = to_intel_display(intel_dp);
-	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	int max_rate;
-
 	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
-		max_rate = drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
-	else
-		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
+		return drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
 
-	/*
-	 * Some broken eDP sinks illegally declare support for
-	 * HBR3 without TPS4, and are unable to produce a stable
-	 * output. Reject HBR3 when TPS4 is not available.
-	 */
-	if (max_rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
-		drm_dbg_kms(display->drm,
-			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
-			    encoder->base.base.id, encoder->base.name);
-		max_rate = 540000;
-	}
-
-	return max_rate;
+	return drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
 }
 
 static int max_dprx_lane_count(struct intel_dp *intel_dp)
@@ -4272,9 +4254,6 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 static void
 intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 {
-	struct intel_display *display = to_intel_display(intel_dp);
-	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-
 	intel_dp->num_sink_rates = 0;
 
 	if (intel_dp->edp_dpcd[0] >= DP_EDP_14) {
@@ -4285,7 +4264,10 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 				 sink_rates, sizeof(sink_rates));
 
 		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
-			int rate;
+			int val = le16_to_cpu(sink_rates[i]);
+
+			if (val == 0)
+				break;
 
 			/* Value read multiplied by 200kHz gives the per-lane
 			 * link rate in kHz. The source rates are, however,
@@ -4293,24 +4275,7 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 			 * back to symbols is
 			 * (val * 200kHz)*(8/10 ch. encoding)*(1/8 bit to Byte)
 			 */
-			rate = le16_to_cpu(sink_rates[i]) * 200 / 10;
-
-			if (rate == 0)
-				break;
-
-			/*
-			 * Some broken eDP sinks illegally declare support for
-			 * HBR3 without TPS4, and are unable to produce a stable
-			 * output. Reject HBR3 when TPS4 is not available.
-			 */
-			if (rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
-				drm_dbg_kms(display->drm,
-					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
-					    encoder->base.base.id, encoder->base.name);
-				break;
-			}
-
-			intel_dp->sink_rates[i] = rate;
+			intel_dp->sink_rates[i] = (val * 200) / 10;
 		}
 		intel_dp->num_sink_rates = i;
 	}
-- 
2.45.2

