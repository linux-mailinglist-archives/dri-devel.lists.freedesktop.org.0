Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C99F0486
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 07:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7587D10EEFC;
	Fri, 13 Dec 2024 06:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur6SCALs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8832B10EEFC;
 Fri, 13 Dec 2024 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069810; x=1765605810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AA/BTXA14QmhRDkVE1LtWm2L4roNt2cpZ1DnFeIsqos=;
 b=Ur6SCALsHmephdbNCcArdisKvy6OsSC4pIrI0nj33pqPvMEuxcJgdv+t
 3iX5V1JMVPpx2yP0oplWEh+h9ywJ+P66hd10+Ec66rJm8FjUonZ3AZaOZ
 4xU+KF2pD4ZRwcLApZ99eKbB1X6OPumLhGpUV1O95Q/PQ3E091yVkIgV0
 T227RLQJg6wafMN9GiTLPTpiGWbAWT2XywNCFDPccGiAwx1I/BxL2Q+r0
 d6WDqAg1ejYZU/x/PQYQPL9ajpsw6idTEWxzmAN+zvbsYAQPxezAqSbrd
 AAUM1sZN27JfF9/OmF8GifbjYIgA6NLnGNpnkNcJkZhnLvxPyqCA2SjNd g==;
X-CSE-ConnectionGUID: 9M5Ql9PtQNmj9QhFNabsLA==
X-CSE-MsgGUID: vRXtwIEbQYKuLkMOsUSiHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34646451"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34646451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:03:29 -0800
X-CSE-ConnectionGUID: 1Jk8RqOURaunFyTBcvk73g==
X-CSE-MsgGUID: ZNBdR7lRTli2Yk3URMV9Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96883961"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 22:03:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Date: Fri, 13 Dec 2024 11:33:17 +0530
Message-Id: <20241213060317.2674290-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213060317.2674290-1-suraj.kandpal@intel.com>
References: <20241213060317.2674290-1-suraj.kandpal@intel.com>
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

Usually retimers take around 30 to 40ms to exit all devices from
sleep state. Extended wake timeout request helps to give additional
time by reading the DPCD register through which sink requests the
minimal amount of time required to wake the sink up and giving the
same amount of wait requested by sink device.
Spec: DP v2.1 Section 3.6.12.3

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
 .../drm/i915/display/intel_dp_link_training.c | 46 +++++++++++++++++++
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4f9c50996446..d092c3ba0ccf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2624,6 +2624,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 
+	intel_dp_lttpr_wake_timeout_setup(intel_dp);
+
 	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
 	if (!is_mst)
 		intel_dp_sink_enable_decompression(state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ea9b4730a176..d0f0da78794e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -134,6 +134,52 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 		DP_PHY_REPEATER_MODE_TRANSPARENT;
 }
 
+void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	u8 val = 1;
+	int ret;
+
+	if (intel_dp_lttpr_transparent_mode_enabled(intel_dp)) {
+		static const u8 timeout_mapping[] = {
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] = 1,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS] = 80,
+			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS] = 100,
+		};
+
+		ret = drm_dp_dpcd_readb(&intel_dp->aux,
+					DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
+		if (ret != 1) {
+			drm_dbg_kms(display->drm,
+				    "Failed to read Extended sleep wake timeout request\n");
+			return;
+		}
+
+		val = (val < sizeof(timeout_mapping) && timeout_mapping[val]) ?
+			timeout_mapping[val] : 1;
+
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
+				   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
+	} else {
+		ret = drm_dp_dpcd_readb(&intel_dp->aux,
+					DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
+		if (ret != 1) {
+			drm_dbg_kms(display->drm,
+				    "Failed to read Extended sleep wake timeout request\n");
+			return;
+		}
+
+		val = (val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
+			(val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
+
+		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
+				   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
+	}
+}
+
 /*
  * Read the LTTPR common capabilities and switch the LTTPR PHYs to
  * non-transparent mode if this is supported. Preserve the
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 2066b9146762..cd4e0d6db6ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -15,6 +15,7 @@ struct intel_dp;
 
 int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
+void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp);
 
 void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
 				     int link_rate, bool is_vrr);
-- 
2.34.1

