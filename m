Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E21A14942
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70910EA58;
	Fri, 17 Jan 2025 05:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9C8YgQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E310EA59;
 Fri, 17 Jan 2025 05:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737092996; x=1768628996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tBLFu7/6c5zkJqz3bJuTzy3QHv4KbsKyId/MGb3ch8M=;
 b=h9C8YgQbOCVYnlMdRNSFhmP0wOE1jr0VKAoUn3ARHBaYTwUlT2CDDcsw
 Ie2edzoK6m4B/wtkPeDr+uu7Xy2vc5IdeWozcs4MHXjj4zVQ/i84h5OB7
 ozIhNW6cvkUFjhA5FB9L8dlA09mQ6aS482r1I8W+AAx0znqIgyWqJneRZ
 k5tGIR3KpvbqQfPPwuuRFJTInGnb+h9LRnrdkolWnEjSmvL+N/ebQSgy1
 tBRU5/eG2DL2ctxv51FO90t60QD5837VB+qxsIaZ94ihpqm8QJkyZOW8K
 ACDOLn4nMAObXfOVmRQ5HDk0/M0r22snSGRdFYIhj/tY9tzvjDjempHPj g==;
X-CSE-ConnectionGUID: zSOMpFGqRWamYcTGu4acKQ==
X-CSE-MsgGUID: a/t3caIuRO2xBM7JUh/Tbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48910439"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="48910439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 21:49:56 -0800
X-CSE-ConnectionGUID: it51bSkISL2yiSy/k8XDOQ==
X-CSE-MsgGUID: pUJEHuUHRtOu0g/YpoILSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="136560362"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2025 21:49:55 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Date: Fri, 17 Jan 2025 11:18:50 +0530
Message-Id: <20250117054850.1189650-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117054850.1189650-1-suraj.kandpal@intel.com>
References: <20250117054850.1189650-1-suraj.kandpal@intel.com>
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
minimal amount of time required to wake the sink up.
Source  device shall keep retying  the AUX tansaction till the extended
timeout that is being granted for LTTPRs from the sink device

--v2
-Grant the requested time only if greater than 1ms [Arun]
-Reframe commit message [Arun]

Spec: DP v2.1 Section 3.6.12.3
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
 .../drm/i915/display/intel_dp_link_training.c | 49 +++++++++++++++++++
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index acb986bc1f33..96cabe618678 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2645,6 +2645,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 
+	intel_dp_lttpr_wake_timeout_setup(intel_dp);
+
 	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
 	if (!is_mst)
 		intel_dp_sink_enable_decompression(state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec50..c113b0be259e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -135,6 +135,55 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
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
+		if (val > 1)
+			drm_dp_dpcd_writeb(&intel_dp->aux,
+					   DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
+					   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
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
+		if (val > 1)
+			drm_dp_dpcd_writeb(&intel_dp->aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
+					   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
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

