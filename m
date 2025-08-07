Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9DB1D4D0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 11:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11B10E81A;
	Thu,  7 Aug 2025 09:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkezQrGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880A10E816;
 Thu,  7 Aug 2025 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754559251; x=1786095251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wsGM7xdG+N1NDTQZlg7D1rvZxW0Eu504MArABCo90+Y=;
 b=UkezQrGWlHFftwzjj086/+YoJJH8gc5be5LTymyUqBfLF0d556C9MwZj
 xy4YiNUKk2D2K1oOiUF1ptRkpqc6yTG5TdaT3+FVGIDrIMcrtHi5C94sz
 9o7baIfkUzq7aig6XVC2y5X+FGhg88AdX6415v1YYA9YDpVz8P/EZ8eIM
 oizsPdoxb3HukZwrraKyNVqQtFRH/uMRXilkVH9uFBo+8NcFQOPdWAE/r
 WTwIkIpaCe9Xn7jb8u1kZBdnGlalPCNvXGTT7wogRJSIan5qjWAEryBJ4
 WcUeo3f0L+Ogz26J5W0LILec64cqZyIc7gK/C+I5Y1A4RKfUhSKP2CCWA w==;
X-CSE-ConnectionGUID: 4OieMB8QToa4aAIDek8wWg==
X-CSE-MsgGUID: 29uEYem+QZecEcJolZ2oew==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56597312"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56597312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 02:34:11 -0700
X-CSE-ConnectionGUID: +zXxXxMDT0KuQZp/zqgP7g==
X-CSE-MsgGUID: OGMCjJK/RAaSyUn0X4YMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164918594"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 02:34:09 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/10] drm/i915/display: Enable/disable casf
Date: Thu,  7 Aug 2025 14:58:40 +0530
Message-Id: <20250807092841.3169436-10-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
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
index 71df736a6c83..8605eda7ae1e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1041,6 +1041,24 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
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
 
@@ -1196,6 +1214,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	if (audio_disabling(old_crtc_state, new_crtc_state))
 		intel_encoders_audio_disable(state, crtc);
 
+	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
+		intel_casf_disable(new_crtc_state);
+
 	intel_drrs_deactivate(old_crtc_state);
 
 	if (hsw_ips_pre_update(state, crtc))
@@ -6748,6 +6769,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
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

