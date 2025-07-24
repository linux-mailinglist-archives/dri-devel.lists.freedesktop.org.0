Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF6B10C02
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482510E95C;
	Thu, 24 Jul 2025 13:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hClarbJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677FD10E954;
 Thu, 24 Jul 2025 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365074; x=1784901074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gBq3o1/KqXwxXBUrTZyePxvQHh35Xpd+bEBxoD3m2Rc=;
 b=hClarbJ1vioFNX52a88lIsMxEK7LxrwBNgaZfw8EDWVWu3sIgiOhtVeB
 CnW1uZ7YLfsCOZzWWq/Lcchjk8v5grkFeREsICeIItNTG2noLTlXKMlpw
 d8a9Tm43wbCh5PblmsqJve2vsJAjZn87hFLNjZlN5hS3GfWYLdTWIcdqE
 70lInzHCwiqoB2JblzCNkyO0rNnEniwZByKI33Of65IdR2J9417ftGL/j
 5HSUo/2LiPAsj7H1i0rFaEsWt8342n6R9bpTIZUvrWskZxwxOqmQGe0ce
 x6VUxh7FGT8EmemC1WC/6Q6PzdcQMoLbtzAKqFeiAHdY/dqxd3YtSXUAR g==;
X-CSE-ConnectionGUID: KGVVNrXxSqS8+rZGoGtyQw==
X-CSE-MsgGUID: N2rvqWNEQp+W1E/mSJI+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55553892"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55553892"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 06:51:14 -0700
X-CSE-ConnectionGUID: n03oU9S5T/Kxqz+58KpeDQ==
X-CSE-MsgGUID: mQsytlB4SlaemMxx1Dnnsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159826494"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 06:51:11 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/10] drm/i915/display: Enable/disable casf
Date: Thu, 24 Jul 2025 19:15:43 +0530
Message-Id: <20250724134544.284371-10-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724134544.284371-1-nemesa.garg@intel.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    | 30 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_display.c | 26 +++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index d5d5b967bf05..5570c83f3890 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -261,3 +261,33 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 					      filter_coeff[i]);
 	}
 }
+
+void intel_casf_enable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 sharpness_ctl;
+
+	intel_casf_filter_lut_load(crtc, crtc_state);
+
+	intel_casf_write_coeff(crtc_state);
+
+	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
+
+	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
+
+	skl_scaler_setup_casf(crtc_state);
+}
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
index a546f88a65bb..21baaaa6baf8 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -18,5 +18,7 @@ void intel_casf_filter_lut_load(struct intel_crtc *crtc,
 				const struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
+void intel_casf_enable(struct intel_crtc_state *crtc_state);
+void intel_casf_disable(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1abaafc0a165..48f453dc8a90 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1040,6 +1040,24 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
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
 
@@ -1190,6 +1208,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	if (hsw_ips_pre_update(state, crtc))
@@ -6742,6 +6763,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
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

