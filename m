Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C6C001D5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EAA10E376;
	Thu, 23 Oct 2025 09:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px3JgAoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6310E373;
 Thu, 23 Oct 2025 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210540; x=1792746540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qwRzKqFTL8XlkDjw4Qc4JJB7ykeTVFYoGnBs21v9zGw=;
 b=Px3JgAoyGssUSWPyMr2mCSUCfHltncDBwsqJwQqP2m6Bvw1bcy3TaZsJ
 miyCwTHUs1YMXRfT1BqraJhA6BNI2x5luFJzJH8qHUgWm3V2nqFm5hRuS
 dsLhOdssoCv7KacENh94JdNxcImXDqwSCwTZ18yEmPQMiRChvrgHbaISd
 bDo4baKzVZ4kV6FzQNb3ZDc18Fo0dCHyi6TBfhVPu56W4qBGROIsrc+4Y
 xhgz6TXqMs9kFGB3veqMdrjpEhDi7JH+NI0Tn5TEoX8qNEm+mM+XVV8Wo
 EJT7GHYdhT1G+NAWrK1FvrFD6qO70KTHBfAtOaauy2F0nL23wTLddKsje Q==;
X-CSE-ConnectionGUID: Gt4laz7VSjiw718l0+9Z5w==
X-CSE-MsgGUID: 2pu9dyNhRk6mipSTwxwMOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020611"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:09:00 -0700
X-CSE-ConnectionGUID: BwsqsL+rTz+hmeVEzap6Ug==
X-CSE-MsgGUID: bWYEnSV+T7O7rVqpAxgGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329410"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:08:58 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 3/8] drm/i915/alpm: Replace is_edp() with alpm_is_possible()
Date: Thu, 23 Oct 2025 14:11:42 +0530
Message-Id: <20251023084147.572535-4-animesh.manna@intel.com>
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

Add a separate alpm_is_possible() which will check for both edp and dp.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 6372f533f65b..973791f8956c 100644
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
@@ -265,7 +275,7 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (intel_dp->alpm.sink_alpm_error)
 		return;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_alpm_is_possible(intel_dp))
 		return;
 
 	if (DISPLAY_VER(display) < 20)
@@ -416,7 +426,7 @@ void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 
 		intel_dp = enc_to_intel_dp(encoder);
 
-		if (!intel_dp_is_edp(intel_dp))
+		if (!intel_alpm_is_possible(intel_dp))
 			continue;
 
 		if (old_crtc_state->has_lobf) {
@@ -468,7 +478,7 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 
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

