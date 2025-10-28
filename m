Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EDC14984
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4810E3F0;
	Tue, 28 Oct 2025 12:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWJMmp+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBAC10E3D1;
 Tue, 28 Oct 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654063; x=1793190063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqC/9dUO9hNcMgIL++NVL88wYNRMUNbs+kZRuEWn/fI=;
 b=jWJMmp+nUxucGM6bXoKS3yxoJZSP+me27hOlM6F3+cyWmYuiWRQ/WVYD
 SjCjTUeZGG0vr0OXfMnt5PPy6dEvugaF11QE8z2GEE3acY2nI37g9e5Dg
 lipQBNPyZRDRu+PjKczMRx4LXWC8ATL31bTwJiltQPWUzXYz5ZHXf00ar
 AAxH4zWNd1sZ3co0gpxpnaAOs/NdL+PtMkRLLfvy3ujpi0JEOzImGexwf
 4XyVJqQbS4a9jnuEAaOkuT1/HzJg/h5/BobPrn8J76J2ELZweqmZTHO8m
 PsvzqfDg4zanZmqQcTKtnH2vx7vkkJEuq8PU0NlwAGXajHOp/XVF9jeyi Q==;
X-CSE-ConnectionGUID: W2FxRuMNTa2hwjI2D4o/MA==
X-CSE-MsgGUID: ZhD43DqsSmm0birqsQdNNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75198282"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75198282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:21:03 -0700
X-CSE-ConnectionGUID: r0nlA891TbyPutoj7FQkwA==
X-CSE-MsgGUID: 0+6Q5pKDSPWVpATd44T5/A==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:21:01 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: nemesa.garg@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 09/10] drm/i915/display: Enable/disable casf
Date: Tue, 28 Oct 2025 17:37:45 +0530
Message-ID: <20251028120747.3027332-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
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

From: Nemesa Garg <nemesa.garg@intel.com>

Call intel_casf_enable and intel_casf_disable
in atomic commit path to enable and disable casf.
Call intel_casf_update_strength to only update
the desired strength value.

v2: Introduce casf_enable here.[Ankit]
v3: Use is_disabling in casf_disabling.[Ankit]
v4: Swap old_state and new_state param.[Ankit]
v5: In disable fn move win_sz after sharpness_ctl.
v6: Rebase and update commit message.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c82439150eb9..94fff7c5f8dc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -980,6 +980,24 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
 		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
 }
 
+static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
+				const struct intel_crtc_state *old_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
+}
+
+static bool intel_casf_disabling(const struct intel_crtc_state *old_crtc_state,
+				 const struct intel_crtc_state *new_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_disabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -1135,6 +1153,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	if (hsw_ips_pre_update(state, crtc))
@@ -6735,6 +6756,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
+	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+		intel_casf_enable(new_crtc_state);
+	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
+		intel_casf_update_strength(new_crtc_state);
+
 	intel_fbc_update(state, crtc);
 
 	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
-- 
2.45.2

