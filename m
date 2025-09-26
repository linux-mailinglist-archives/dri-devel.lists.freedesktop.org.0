Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F46BA3837
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4810EA31;
	Fri, 26 Sep 2025 11:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXoOWQ7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B7E10EA3F;
 Fri, 26 Sep 2025 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886945; x=1790422945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWqlymo5W0OuegQxAD+sy7KDP7tU4jKprbV9njMckhM=;
 b=EXoOWQ7kvNWN91iDdZYtbaMGgo/b9HFveWVuhW0bEE5Gu4avn/4vYjRy
 0ZBZ3doHFEbbz554FWADTVRRXAgeZaG3KYUh8aD+TBu+LDPikSAnIQUC3
 Ytcpy1vGNfrFotA15OJnNuLKVgEzkRMOKVk2KWiUI8B76L63wMWw5ac+G
 lzmOsG55ASod9lUAFX0qOAakJ8w7GpOI6nj4ky/yl4MzONKgsfoArNUv8
 PgR7D9Ob2TI53kr67Ge7CSexu3x/ePjQNd/hT3LURu3aEJp/u2/oAnvgj
 Yx5ac5zH5nMMTox63jvc5KgFCZB6c1rX/myaS8hjzzwDfHO1yxEPCcAv/ g==;
X-CSE-ConnectionGUID: hIq+LakUQbWSuKx3bN7nLg==
X-CSE-MsgGUID: VmVcHjaDSzSRe7ybuS/LCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78860103"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78860103"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:42:24 -0700
X-CSE-ConnectionGUID: y6JbCdXNQrqpS4uSuTd1NA==
X-CSE-MsgGUID: w2qas68oTIC5JPFAhPQcTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176723523"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 26 Sep 2025 04:42:23 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/10] drm/i915/display: Enable/disable casf
Date: Fri, 26 Sep 2025 17:07:27 +0530
Message-Id: <20250926113728.606315-10-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250926113728.606315-1-nemesa.garg@intel.com>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
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

To enable or disable the sharpness check the
casf_enable flag. While enabling the sharpness
write the programmable coefficients, sharpness
register bits and also enable the scaler.
Load the filter lut value which needs to be done
one time while enabling the sharpness.

v2: Introduce casf_enable here[Ankit]
v3: Use is_disabling in casf_disabling[Ankit]
v4: Swap old_state and new_state param[Ankit]
v5: In disable fn move win_sz after sharpness_ctl.
v6: Add filter_lut_load in casf_enable

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    | 23 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 26 ++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 3011a6c4b46b..5570c83f3890 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -264,7 +264,30 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 sharpness_ctl;
+
+	intel_casf_filter_lut_load(crtc, crtc_state);
+
 	intel_casf_write_coeff(crtc_state);
 
+	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
+
+	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
+
 	skl_scaler_setup_casf(crtc_state);
 }
+
+void intel_casf_disable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	intel_de_write(display, SKL_PS_CTRL(crtc->pipe, 1), 0);
+	intel_de_write(display, SKL_PS_WIN_POS(crtc->pipe, 1), 0);
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
+	intel_de_write(display, SKL_PS_WIN_SZ(crtc->pipe, 1), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index f59a8603eea4..6d820e2b5b21 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -19,5 +19,6 @@ void intel_casf_filter_lut_load(struct intel_crtc *crtc,
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
+void intel_casf_disable(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6a4d0fe4d6e5..d27366f9435c 100644
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
@@ -6692,6 +6713,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
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
2.25.1

