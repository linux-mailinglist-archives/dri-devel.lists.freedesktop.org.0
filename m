Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA17A4DAB3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379010E58D;
	Tue,  4 Mar 2025 10:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW+Y0/I9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AC10E575;
 Tue,  4 Mar 2025 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084432; x=1772620432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YIGd0ALM2SQJ6vvEi2erS3EoCiETZ1+drfWKmAKbeys=;
 b=aW+Y0/I9ewEBFv2NisDlRe6dMafU6fVFFfr7R7/RKUQFGup9SjeTwQFO
 tilLIVQhfi2Ffbc8WuGsnKfW1WEZjNd1rsysJlArnPH5SuN2cbiEhVPbw
 QZrl4Fg1OYTxkigzROuek9JKc5nYzoLdk8oZDoYkXVxxvpZnSJ21VpvUI
 hzkbM0ULfdX86OAahoZT9dKim9N7jpHSg7qGbbuQ1mt9/8w9JXZwO1HSw
 g1mAwsjsRqKYkLLKGU3TqpKmPi29YB9UyCKzY6bHBgROTyWA6DGOReLqW
 pjU3ptuSrmqMoYTjrPafxIYQPZRI2EnvxpN8+fB57cGJ3Bpw7mlag6JZf Q==;
X-CSE-ConnectionGUID: L68ssDbYTZiV4Fm1PtHcUg==
X-CSE-MsgGUID: DE8T5hgkRTa7UcacAuT3LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584100"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:51 -0800
X-CSE-ConnectionGUID: OWJRlVawSNq/5OueiyTlrQ==
X-CSE-MsgGUID: 7UHjigTSSmmXmZBlppPp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064060"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:50 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 09/10] drm/i915/display: Enable/disable casf
Date: Tue,  4 Mar 2025 15:58:56 +0530
Message-Id: <20250304102857.326544-10-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Add a check for enabling/disabling the casf
and enable the sharpness bit. Also load the
filter lut value which is needed one time.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    | 18 +++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 32 ++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 9f14418dc3c9..1a4362788d30 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -230,7 +230,25 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 sharpness_ctl;
+
 	intel_casf_write_coeff(crtc_state);
 
 	skl_scaler_setup_casf(crtc_state);
+
+	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
+
+	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
+}
+
+void intel_casf_disable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index c75a4b2f3133..64821aafdc2f 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -18,5 +18,6 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
+void intel_casf_disable(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a2fb68c7cf7a..7d500bdc58fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1036,6 +1036,25 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
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
+static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
+				 const struct intel_crtc_state *old_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return (new_crtc_state->hw.casf_params.casf_enable !=
+			old_crtc_state->hw.casf_params.casf_enable);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -1182,6 +1201,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	intel_psr_pre_plane_update(state, crtc);
@@ -1650,6 +1672,8 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	struct intel_crtc *pipe_crtc;
@@ -1742,6 +1766,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 			intel_crtc_wait_for_next_vblank(wa_crtc);
 			intel_crtc_wait_for_next_vblank(wa_crtc);
 		}
+
+		if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+			intel_filter_lut_load(crtc, new_crtc_state);
 	}
 }
 
@@ -6722,6 +6749,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
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

