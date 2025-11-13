Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E309C5769C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6010E814;
	Thu, 13 Nov 2025 12:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nffz6wlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F110E814;
 Thu, 13 Nov 2025 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036956; x=1794572956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EcKdJSffaFUJJAlCgCuJnA361mL8VD2ptFdTcE23tBk=;
 b=nffz6wlXVItgPg/bJufmIK7QSRl7y1ijvdzle27oH55yg9dIN+Lw4XiE
 U7fmr9CQU15zTwaTyVZufqjNgg1i5IN5GUon0+rfRBCzMdHIRVCfO/9PG
 41OQODaAcnWChNxwch3/UZQ7uj5CqDOGvuYCzL9k1zc4OXDcfUc9VZtij
 XxX/9fsfEUKyKbOP1LvLsRD3BXiC9bgQ15GN79KysG18dD9GasOq+GGxl
 fEERrKlLEbYQSn9RrDqWyXrtmo6ckc/7TVbE3rn5dek6r7AhC2CUEHHyd
 Aj/6iVpQsT5DNVQ9+5EZRDYPaNadvx9kxXmEWv9k5B0Ou9SheqvzP/eoM Q==;
X-CSE-ConnectionGUID: 6Kf0JqYNRISmNAKmzXIOsg==
X-CSE-MsgGUID: c4SMEuvhRDinTVsVvf5ANw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677922"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:16 -0800
X-CSE-ConnectionGUID: NTVyjpXmRo2jUNMnGnSuag==
X-CSE-MsgGUID: ivU2IbPWRNiJ5k3S+w5FTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757769"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:29:14 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 09/10] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Date: Thu, 13 Nov 2025 17:31:18 +0530
Message-Id: <20251113120119.1437955-10-animesh.manna@intel.com>
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

Add a separate alpm_is_possible() which will check for both edp and dp.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 33620f95ecc5..87c7c1f6e17f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -64,6 +64,16 @@ void intel_alpm_get_sink_capability(struct intel_dp *intel_dp)
 	intel_dp->alpm_dpcd = dpcd;
 }
 
+bool intel_alpm_is_possible(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return (DISPLAY_VER(display) >= 12 && intel_dp->alpm_dpcd) ||
+		(DISPLAY_VER(display) >= 35 &&
+		intel_dp->lttpr_common_caps[DP_LTTPR_ALPM_CAPABILITIES -
+					    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV]);
+}
+
 static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 {
 	return SILENCE_PERIOD_TIME * intel_dp_link_symbol_clock(crtc_state->port_clock) /
@@ -341,7 +351,7 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp->alpm.sink_alpm_error)
 		return;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_alpm_is_possible(intel_dp))
 		return;
 
 	if (DISPLAY_VER(display) < 20)
@@ -492,7 +502,7 @@ void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (!intel_dp_is_edp(intel_dp))
+		if (!intel_alpm_is_possible(intel_dp))
 			continue;
 
 		if (old_crtc_state->has_lobf) {
@@ -544,7 +554,7 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (intel_dp_is_edp(intel_dp)) {
+		if (intel_alpm_is_possible(intel_dp)) {
 			intel_alpm_enable_sink(intel_dp, crtc_state);
 			intel_alpm_configure(intel_dp, crtc_state);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index bcc354a46a1d..05416f64f418 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -17,6 +17,7 @@ struct intel_crtc;
 
 bool intel_alpm_source_supported(struct intel_connector *connector);
 void intel_alpm_get_sink_capability(struct intel_dp *intel_dp);
+bool intel_alpm_is_possible(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
-- 
2.29.0

