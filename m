Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D395C2E4AF
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6455610E4EE;
	Mon,  3 Nov 2025 22:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXCN3GF5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BEE10E4EC;
 Mon,  3 Nov 2025 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209470; x=1793745470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OkFhJ9N7I1MG6z7LvJR+84q/JlNBPoornbKiMz+XnYg=;
 b=CXCN3GF5SsjzZIJfZhRsaT4F9i9YBgaD6g5IY+p9H1l9V5v8+Uzv/+ES
 5XE9Hfo9tPUkY3PrboTN4IvRL8EQIXVkenbbDGqgx0kfpU6ucwnjGlFjD
 6rc3MXbnlRZckTfsZreHMYMQUqU+dnyFiCnsiRxaXd4MZWrekXN0Lz4GA
 AUCd1cyXzdHBCn+6aITJaRrpcJG9jTBSSjwdJRYwTMfWWovvsd0BoT3qB
 XOUhf7D+eui7VlZEHwwu2ixDhMHD7Zz1cCN2XEtzEdoCc4TIkPBA9t0ne
 DrpRaVd3dHgPiThUIvpFVhYEAYRCpKST/EyJSicAQkrRnXAKS7e2w03xA A==;
X-CSE-ConnectionGUID: oU1cVJ3jQvG9g8Q3N+ylRg==
X-CSE-MsgGUID: vxEuOMmESi6M9slE2k99Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899641"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:49 -0800
X-CSE-ConnectionGUID: fOwk5a0vR1qlQaG7VVQT8A==
X-CSE-MsgGUID: Yzw+fqPIRwmp6wibXufldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707544"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:48 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 09/10] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Date: Tue,  4 Nov 2025 03:39:56 +0530
Message-Id: <20251103220957.1229608-10-animesh.manna@intel.com>
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

Add a separate alpm_is_possible() which will check for both edp and dp.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 97813ce2d4d0..16fe66a75f05 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -41,6 +41,16 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
 }
 
+bool intel_alpm_is_possible(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return (DISPLAY_VER(display) >= 12 && intel_dp->alpm_dpcd) ||
+	       (DISPLAY_VER(display) >= 35 &&
+		intel_dp->lttpr_common_caps[DP_LTTPR_ALPM_CAPABILITIES -
+					    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV]);
+}
+
 void intel_alpm_init(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
@@ -332,7 +342,7 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp->alpm.sink_alpm_error)
 		return;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_alpm_is_possible(intel_dp))
 		return;
 
 	if (DISPLAY_VER(display) < 20)
@@ -483,7 +493,7 @@ void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (!intel_dp_is_edp(intel_dp))
+		if (!intel_alpm_is_possible(intel_dp))
 			continue;
 
 		if (old_crtc_state->has_lobf) {
@@ -535,7 +545,7 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (intel_dp_is_edp(intel_dp)) {
+		if (intel_alpm_is_possible(intel_dp)) {
 			intel_alpm_enable_sink(intel_dp, crtc_state);
 			intel_alpm_configure(intel_dp, crtc_state);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 53599b464dea..0c9972faa2e0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -15,6 +15,7 @@ struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
 
+bool intel_alpm_is_possible(struct intel_dp *intel_dp);
 void intel_alpm_init(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
-- 
2.29.0

