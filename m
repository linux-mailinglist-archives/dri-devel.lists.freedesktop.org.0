Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFAA17739
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CAA10E4C9;
	Tue, 21 Jan 2025 06:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/ufwFDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9510E4D3;
 Tue, 21 Jan 2025 06:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737439547; x=1768975547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gHN3rEwtrk8noNB9BUS1rpklo9YB6Ii4jWZ3QQx7KPI=;
 b=S/ufwFDrLDYpr/Kw6wv7utjYkOTQ2bJTl/HiU2RKkmBJtB47tMw/GXZ5
 gdcXqPlgq48VFVHOYIDCzzV3WNv7X+b9qrl6B+9GlVfk8chggNzXY9aow
 cF2aqUFZsMKNL5l/xRcw7oQWQySeS9e+E4wRXZ/beXeHTIRHMcTvyAP9H
 UPDepRKeVFmuVoA9UP2DZpugDzxiyC1QOfTc/lS3ngjTdrReET7A0odLu
 DWzcIull3l0h8bCJxDGtlNC5itSeQYpSvvpWRkKy6cSSUfHHxJ0orF6+0
 q38QHXQS0JE6dYhW7z0VZfVYSEPA7XKt69ezFrK+hTIfwdnQOqKZ+FYgA w==;
X-CSE-ConnectionGUID: tvNalv1MR/av1cwDDZtcRQ==
X-CSE-MsgGUID: 2ZnY3mLKRymXsN3qf7/Q7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37947897"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37947897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:05:47 -0800
X-CSE-ConnectionGUID: EChYB6GYQh2BG7uoAfIgkg==
X-CSE-MsgGUID: oihqvBlLRxGG3qGSsaq9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106509125"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 22:05:44 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/3] drm/i915/lttpr: Enable Extended Wake Timeout
Date: Tue, 21 Jan 2025 11:35:22 +0530
Message-Id: <20250121060522.1296166-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121060522.1296166-1-suraj.kandpal@intel.com>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
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
sleep state. Extended wake timeout mechanism helps to give
that additional time.

--v2
-Grant the requested time only if greater than 1ms [Arun/Jani]
-Reframe commit message [Arun]

--v3
-Move the function to drm_core [Dmitry/Jani]

Spec: DP v2.1 Section 3.6.12.3
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c              | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_link_training.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index acb986bc1f33..0aec4b958af6 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2594,6 +2594,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	bool transparent_mode;
 	int ret;
 
 	intel_dp_set_link_params(intel_dp,
@@ -2645,6 +2646,9 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 
+	transparent_mode = intel_dp_lttpr_transparent_mode_enabled(intel_dp);
+	drm_dp_lttpr_wake_timeout_setup(&intel_dp->aux, transparent_mode);
+
 	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
 	if (!is_mst)
 		intel_dp_sink_enable_decompression(state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec50..c0f8473e7223 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -128,7 +128,7 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	return true;
 }
 
-static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
+bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 {
 	return intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 					   DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] ==
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 2066b9146762..46614124569f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -15,6 +15,7 @@ struct intel_dp;
 
 int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
+bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp);
 
 void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
 				     int link_rate, bool is_vrr);
-- 
2.34.1

