Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E789DABF36E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6016112E5A;
	Wed, 21 May 2025 11:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+LT42CS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4EF112E64;
 Wed, 21 May 2025 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828433; x=1779364433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r7OC49p3dtDWWDLgsPHkvDsHMTTVpbWyvWudLlKi/RU=;
 b=a+LT42CSE5c4Ao4wf60jnJ2NbvdN3F8maThKXdN8MS+/X1gwSLxmLtAA
 kldV+7PoXkBKt81mPILz6Bp6Sc/Z2vclvJZCe9FlbqjH/JoJ6rN4/LXsM
 XfuNi5jBrtGnHaMxfIQ2qZNgOUYyLdAV8g8r7e2qXlzZKKngxPixAAct2
 xFlBvHqjxhFYiwhKlbudAiYVrz5SK+sGIF+GmprsET/MoQ38zLWu5sJpA
 9OCaPs0+TBhxbgNHJu9NxXuEJvNNYXj9OEGN6WD7hp8yNOmw6Nr6hh1Rl
 spZvZJ8u5AuKmsQ0CTLJZ1b3ViCQPrMWfEpbGKUtV0N6JzHz1C3Egd98x A==;
X-CSE-ConnectionGUID: /+YEcwKwT/CfyyLQupEEkw==
X-CSE-MsgGUID: jbX7IZdPQ46bUxPw6lAcVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217815"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:53 -0700
X-CSE-ConnectionGUID: rQZULmOJTxuPG/an2wrBLA==
X-CSE-MsgGUID: aRraigPrRIK1X89LURWsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452903"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:51 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 07/12] drm/i915/alpm: Add new interface to check if AUXLess
 ALPM is used
Date: Wed, 21 May 2025 14:53:14 +0300
Message-ID: <20250521115319.2380655-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
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

we need to know if AUXLess ALPM is used when preparing for link
training. Add new interface for this and use it in existing code where
possible.

v2: remove kerneldoc comment

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 0890247085a7..bbcf510b0c25 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -26,6 +26,13 @@ bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp)
 	return intel_dp->alpm_dpcd & DP_ALPM_AUX_LESS_CAP;
 }
 
+bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state)
+{
+	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) ||
+		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
+}
+
 void intel_alpm_init(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
@@ -341,8 +348,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if ((crtc_state->has_panel_replay && intel_dp_is_edp(intel_dp)) ||
-	    (crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp))) {
+	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c9fe21e3e72c..86f4d5ab1981 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -32,6 +32,8 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
+bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 #endif
-- 
2.43.0

