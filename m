Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9A9F871A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00B010EDE0;
	Thu, 19 Dec 2024 21:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJbtgcp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834A710EDDE;
 Thu, 19 Dec 2024 21:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644126; x=1766180126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDLKltzicX8XqHHF8R00lVRj7B1a4htxdxGNWTp2PYk=;
 b=IJbtgcp3SithP6/tZmuhMv0f3xsTJSpOsPr90ibGk+OhK10SUpssuLv9
 j3fkixVuDtBo641sQBAE1SZy7A73K7nyXXfCmvYOBggXantLvgCtb6FEw
 5g+rcppn2ZmKipiTDHl8fMtvy5AAmtm+bsAjWB+r34DD0gHa8dN2fPHpk
 T27UDGBWVo6s9sx+GptCfBHLuwz++XwT4wB9Ea+9WIacFySF6Tow2bhqj
 AyOMhm0wFi0H1u+OpcR3+F3cS9csm6Zk2hIWrc6zJE8juMZwWzRmv/CRt
 PdusGpc5lJ/LnACcNuGvxpqQaRXPrbLy/wkBiP1pcTWiR2sO24+9N1UNk Q==;
X-CSE-ConnectionGUID: uuxT/ZT+T/CAGvZgnZxZLA==
X-CSE-MsgGUID: PNb2LDgjQii7t++I29vgqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590384"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:26 -0800
X-CSE-ConnectionGUID: A8kcpW7kRvmw2iIqR0gsAQ==
X-CSE-MsgGUID: rEo2L/O/RsKn0fJ4rN+alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146306"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 imre.deak@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 13/16] drm/i915/ddi: start distinguishing 128b/132b SST and
 MST at state readout
Date: Thu, 19 Dec 2024 23:34:02 +0200
Message-Id: <2c95b57e72ba2a7f07fe377ac71cb4f4038f751d.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
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

We'll want to distinguish 128b/132b SST and MST modes at state
readout. There's a catch, though. From the hardware perspective,
128b/132b SST and MST programming are pretty much the same. And we can't
really ask the sink at this point.

If we have more than one transcoder in 128b/132b mode associated with
the port, we can safely assume it's MST. But for MST with only a single
stream enabled, we are pretty much out of luck. Let's fall back to
looking at the software state, i.e. intel_dp->is_mst. It should be fine
for the state checker, but for hardware takeover at probe, we'll have to
trust the GOP has only enabled SST.

TODO: Not sure how this *or* our current code handles 128b/132b enabled
by GOP.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 29 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7b739b9c5a06..04118f2eea94 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -786,7 +786,7 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 	intel_wakeref_t wakeref;
 	enum pipe p;
 	u32 tmp;
-	u8 mst_pipe_mask;
+	u8 mst_pipe_mask = 0, dp128b132b_pipe_mask = 0;
 
 	*pipe_mask = 0;
 	*is_dp_mst = false;
@@ -823,7 +823,6 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 		goto out;
 	}
 
-	mst_pipe_mask = 0;
 	for_each_pipe(dev_priv, p) {
 		enum transcoder cpu_transcoder = (enum transcoder)p;
 		u32 port_mask, ddi_select, ddi_mode;
@@ -852,9 +851,10 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 
 		ddi_mode = tmp & TRANS_DDI_MODE_SELECT_MASK;
 
-		if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
-		    (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display)))
+		if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST)
 			mst_pipe_mask |= BIT(p);
+		else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))
+			dp128b132b_pipe_mask |= BIT(p);
 
 		*pipe_mask |= BIT(p);
 	}
@@ -864,6 +864,23 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 			    "No pipe for [ENCODER:%d:%s] found\n",
 			    encoder->base.base.id, encoder->base.name);
 
+	if (!mst_pipe_mask && dp128b132b_pipe_mask) {
+		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+		/*
+		 * If we don't have 8b/10b MST, but have more than one
+		 * transcoder in 128b/132b mode, we know it must be 128b/132b
+		 * MST.
+		 *
+		 * Otherwise, we fall back to checking the current MST
+		 * state. It's not accurate for hardware takeover at probe, but
+		 * we don't expect MST to have been enabled at that point, and
+		 * can assume it's SST.
+		 */
+		if (hweight8(dp128b132b_pipe_mask) > 1 || intel_dp->is_mst)
+			mst_pipe_mask = dp128b132b_pipe_mask;
+	}
+
 	if (!mst_pipe_mask && hweight8(*pipe_mask) > 1) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Multiple pipes for [ENCODER:%d:%s] (pipe_mask %02x)\n",
@@ -874,9 +891,9 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 
 	if (mst_pipe_mask && mst_pipe_mask != *pipe_mask)
 		drm_dbg_kms(&dev_priv->drm,
-			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe_mask %02x mst_pipe_mask %02x)\n",
+			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe masks: all %02x, MST %02x, 128b/132b %02x)\n",
 			    encoder->base.base.id, encoder->base.name,
-			    *pipe_mask, mst_pipe_mask);
+			    *pipe_mask, mst_pipe_mask, dp128b132b_pipe_mask);
 	else
 		*is_dp_mst = mst_pipe_mask;
 
-- 
2.39.5

