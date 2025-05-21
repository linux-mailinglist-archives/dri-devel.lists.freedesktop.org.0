Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8FABEFE3
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4010E6EA;
	Wed, 21 May 2025 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kng05wNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CBC10E6DF;
 Wed, 21 May 2025 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747819983; x=1779355983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jlHqZ4Sfndebk7uLxOHCr7wiKx3rvh0wRG8Gd7wKVws=;
 b=Kng05wNn06SvkE30Fhi/C3mmTY2bCQcxYG7oUP3xaS8/T/VqtzdiDIU+
 E1YyDhfHYbqYDPs0XoMgiL43UtLSafxU9ab/KsWuJ4ovR5bsc0vDAAivb
 LX1JNQQybrjNGb0Sxp4rpsaeqSywVVF0v/aBRjQQjLMv7L+m0Wqf5vEYL
 SfHb2TUuhrY7bDmLVBqJIm7gbn5dF/gIYvJhEmE+Lss5CGHIMSHB9oLl9
 BWccrCdP/hHqia+dXGV3oj6DLXknPFxI048nI5xpxFVhIxjlA0j2zfgB5
 xwKbEQSF4EYQRKvHh4vS6ZQ0nVHlOlPKYre2zjHTgQjI7THrhtNxiD/DJ A==;
X-CSE-ConnectionGUID: rwKlxOnMRFCrK9VNFgBW0A==
X-CSE-MsgGUID: /uYuDmRbSSe7BDmwp56Mcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49714298"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49714298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:03 -0700
X-CSE-ConnectionGUID: N+tUzpomR+ervsOjKrEYwQ==
X-CSE-MsgGUID: 0YcTN6RWTbS6DGI0RXuR/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140407042"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 03/12] drm/i915/psr: Read all Panel Replay capability
 registers from DPCD
Date: Wed, 21 May 2025 12:32:31 +0300
Message-ID: <20250521093240.2284835-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521093240.2284835-1-jouni.hogander@intel.com>
References: <20250521093240.2284835-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There are several Panel Replay capability register in DPCD. Read them
all for later use.

v2:
  - avoid using hardcoded indices
  - read all Panel Replay capability registers

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 +++-
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 ++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b8836d29a721..9334fcd77072 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1669,7 +1669,9 @@ struct intel_dp {
 	bool use_max_params;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 psr_dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
-	u8 pr_dpcd;
+	u8 pr_dpcd[DP_PANEL_REPLAY_CAP_SIZE];
+#define INTEL_PR_DPCD_INDEX(pr_dpcd_register)	((pr_dpcd_register) - DP_PANEL_REPLAY_CAP_SUPPORT)
+
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 0cfdeff268f9..1072549649cd 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -608,7 +608,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
 			return;
 		}
 
-		if (!(intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
+		if (!(intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+		      DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
 			drm_dbg_kms(display->drm,
 				    "Panel doesn't support early transport, eDP Panel Replay not possible\n");
 			return;
@@ -617,7 +618,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
 
 	intel_dp->psr.sink_panel_replay_support = true;
 
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SU_SUPPORT)
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_SU_SUPPORT)
 		intel_dp->psr.sink_panel_replay_su_support = true;
 
 	drm_dbg_kms(display->drm,
@@ -676,10 +678,12 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
-	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
-			  &intel_dp->pr_dpcd);
 
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
+	drm_dp_dpcd_read(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
+			 &intel_dp->pr_dpcd, sizeof(intel_dp->pr_dpcd));
+
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_SUPPORT)
 		_panel_replay_init_dpcd(intel_dp);
 
 	if (intel_dp->psr_dpcd[0])
@@ -736,7 +740,8 @@ static bool psr2_su_region_et_valid(struct intel_dp *intel_dp, bool panel_replay
 		return false;
 
 	return panel_replay ?
-		intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
+		intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+		DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
 		intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_ET_SUPPORTED &&
 		psr2_su_region_et_global_enabled(intel_dp);
 }
@@ -3916,7 +3921,8 @@ static void intel_psr_sink_capability(struct intel_dp *intel_dp,
 	seq_printf(m, ", Panel Replay = %s", str_yes_no(psr->sink_panel_replay_support));
 	seq_printf(m, ", Panel Replay Selective Update = %s",
 		   str_yes_no(psr->sink_panel_replay_su_support));
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
 		seq_printf(m, " (Early Transport)");
 	seq_printf(m, "\n");
 }
-- 
2.43.0

