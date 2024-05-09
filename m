Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F178C0B2A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 07:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359CE10E2FC;
	Thu,  9 May 2024 05:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVbGLvhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95B510E24D;
 Thu,  9 May 2024 05:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715233685; x=1746769685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QjKfr7LZumJHTI7VMM+czlwJdVy7oqNdx+TSYUNC4ZI=;
 b=AVbGLvhfBITJREqwe66GUJS1L49cQB2OkzvGugHclag6qO5vGq4DCibY
 gfj3lmaL9i9x3sMWYk6lLDH3xWYrHtdmpm0eyuKpcb9npRAeiw+JI49fV
 i1WZFKOE1jjkNtIX50HrO8gApcpKjDu4/mv3sjoRlzl+MIMCXHpkE1DVi
 QSwkLtzzCTyjaHOtbImVH+VXLaKOkAOFz4rSGwhxtdxmIVik+z+3gwgpO
 Y2AUDNjYg/6JUTiJxsUBi6Aq7RbI9sqiJ46mS2Brl4F3SOD2HIenxRk8Q
 vvzqiaFFkH6uhQSCnC1Cq1BVzHpEupR7VexZeyd8+8koHJcjhXMCZMczS w==;
X-CSE-ConnectionGUID: JHmFqGjhRq2r6QASg3RdQw==
X-CSE-MsgGUID: 8pwKsZ+MRbi7xi7GLwMybg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645993"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28645993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:48:04 -0700
X-CSE-ConnectionGUID: Uy6FTrQ+QqqNaI9xU7YtOw==
X-CSE-MsgGUID: PfxV/EMNSwS1Lt5UyHbb3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33817640"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2024 22:48:02 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Date: Thu,  9 May 2024 11:01:54 +0530
Message-Id: <20240509053155.327071-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240509053155.327071-1-animesh.manna@intel.com>
References: <20240509053155.327071-1-animesh.manna@intel.com>
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
index 5979eab1f2e0..c8eddc910cc5 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -300,10 +300,11 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
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
 
 	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.psr2_enabled &&
@@ -314,7 +315,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if (intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) {
+	if ((intel_dp->psr.panel_replay_enabled && intel_dp_is_edp(intel_dp)) ||
+	    (crtc_state->has_lobf && intel_dp->alpm_parameters.mode == ALPM_AUX_LESS)) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
@@ -339,12 +341,16 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
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
index 80c8a66b34af..c0c085c1e5b0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -18,6 +18,6 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state);
-void intel_alpm_configure(struct intel_dp *intel_dp);
-
+void intel_alpm_configure(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state);
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9e89844e6418..cd1afc82aefc 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1620,7 +1620,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			     IGNORE_PSR2_HW_TRACKING : 0);
 
 	if (intel_dp_is_edp(intel_dp))
-		intel_alpm_configure(intel_dp);
+		intel_alpm_configure(intel_dp, crtc_state);
 
 	/*
 	 * Wa_16013835468
-- 
2.29.0

