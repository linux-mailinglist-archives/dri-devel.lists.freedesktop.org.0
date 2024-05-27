Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BD8CFBCF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF32910F33A;
	Mon, 27 May 2024 08:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWsio++h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1919610E868;
 Mon, 27 May 2024 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716799390; x=1748335390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2b56xnFKiHWhfOmWGE7zV4aDcV6augaLRxzxMfT10wg=;
 b=VWsio++hXCT3wHQRiIMqX6xgn/GADb+Ef9xoyuPC4NuugPJ4TLWhXxNB
 BjvL8/inhJFKtBSSOvqhwyh7ssAjodZSu0KGSPI58wqw9cDUj1ApzhSql
 x3eoou3GGzb/DzuqDXD1vnCiTI2SgGSy55Q8HEavOA7gVYVJ12DgAFPZQ
 l4HIWRtlHWPf4BF07zYW5omgH1wjmzxabAflqle0QBN4Lqc7zY9r2mt5p
 n0z4SanUIvfH0vLPaY+e7LfRyEfKXbQAG/PTkZgGJfF4GvRqS9t+2JrHF
 Sj0YMXTVCJ/7n8YBTB8yHkl5aY/nCPGkXl8ROXBbAfZmVZ3Fzz8wD87/u w==;
X-CSE-ConnectionGUID: hGUV9ESdTlqmSt1QYu5hIw==
X-CSE-MsgGUID: /x2iRMV8QYOkcJk+ki/e2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13049011"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13049011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 01:43:05 -0700
X-CSE-ConnectionGUID: 23bYf0vQQBCFGLEwrFELOw==
X-CSE-MsgGUID: T+EGvYDoQTyDCorwzg2XDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34676859"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 01:43:03 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Date: Mon, 27 May 2024 13:56:35 +0530
Message-Id: <20240527082636.1519057-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240527082636.1519057-1-animesh.manna@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
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

Set the Link Off Between Frames Enable bit in ALPM_CTL register.

Note: Lobf need to be enabled adaptive sync fixed refresh mode
where vmin = vmax = flipline, which will arise after cmmr feature
enablement. Will add enabling sequence in a separate patch.

v1: Initial version.
v2: Condition check modified in alpm_configure(). [Jouni]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++-----
 drivers/gpu/drm/i915/display/intel_alpm.h |  4 ++--
 drivers/gpu/drm/i915/display/intel_psr.c  |  2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 3ac5986b4ad9..a8ae5f65a250 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -304,10 +304,11 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 		(first_sdp_position + waketime_in_lines);
 }
 
-static void lnl_alpm_configure(struct intel_dp *intel_dp)
+static void lnl_alpm_configure(struct intel_dp *intel_dp,
+			       const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
 
 	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.sel_update_enabled &&
@@ -318,7 +319,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if (intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) {
+	if ((intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) ||
+	    (crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp))) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
@@ -345,12 +347,16 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
+	if (crtc_state->has_lobf)
+		alpm_ctl |= ALPM_CTL_LOBF_ENABLE;
+
 	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
 
 	intel_de_write(dev_priv, ALPM_CTL(dev_priv, cpu_transcoder), alpm_ctl);
 }
 
-void intel_alpm_configure(struct intel_dp *intel_dp)
+void intel_alpm_configure(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state)
 {
-	lnl_alpm_configure(intel_dp);
+	lnl_alpm_configure(intel_dp, crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index e586e8a01b10..80b9ca086a49 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -18,6 +18,6 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state);
-void intel_alpm_configure(struct intel_dp *intel_dp);
-
+void intel_alpm_configure(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state);
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b37dfadb994b..ac6b4614fe29 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1692,7 +1692,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			     IGNORE_PSR2_HW_TRACKING : 0);
 
 	if (intel_dp_is_edp(intel_dp))
-		intel_alpm_configure(intel_dp);
+		intel_alpm_configure(intel_dp, crtc_state);
 
 	/*
 	 * Wa_16013835468
-- 
2.29.0

