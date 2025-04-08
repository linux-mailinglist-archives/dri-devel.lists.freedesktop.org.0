Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74ACA7FBFA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030810E658;
	Tue,  8 Apr 2025 10:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xd4h0IAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0327110E641;
 Tue,  8 Apr 2025 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744108209; x=1775644209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHiOL1KxfFwv95m4t833tbaTmY6h7OTxeH5wvg+fuG4=;
 b=Xd4h0IAzxRT8wa18dHo9t5EZ0Lm34MKJsA7XDVceb9rcXo9jwJaVE2tg
 eigE1ijLOLZ/dAT6iIN4DKaXfgjSYJV/HDCQ4kVmPK8dpQInJd7slLpo2
 wmu8+GXD5IXcqma2SE7XZnYNIUUUifFxu8VTpkiapZke4iX7GJUrNBYvW
 F9uxzqN8aiDW8Wx1WzpgzTJdkKnxPIK/odiD7BLFN4fMc/OWyeyQ3+RYk
 WgmSFxqs9EaKTNZOTZkWMqL5voss8vLjmnJTdiepaO7FMfo6ULGXHfIQr
 qk+eUzna1Eq9jFXL72GAX3sGEI/lXJhGmq6TGIwo/GkKvfhasyr+mecb6 w==;
X-CSE-ConnectionGUID: snoORVpAQR6eiRAQ6FFJdw==
X-CSE-MsgGUID: EvCmawdZQdC+3crU2MuUpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62934164"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="62934164"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 03:30:09 -0700
X-CSE-ConnectionGUID: MQRBAU+kS6WrwEt8A21nkA==
X-CSE-MsgGUID: VTctyxzqSfS3zIg5qysUwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133392156"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 03:30:07 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/10] drm/i915/display: Set and get the casf config
Date: Tue,  8 Apr 2025 15:55:04 +0530
Message-Id: <20250408102506.1053569-9-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408102506.1053569-1-nemesa.garg@intel.com>
References: <20250408102506.1053569-1-nemesa.garg@intel.com>
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

Set the configuration for CASF and capture it
in crtc_state and get the configuration by
reading back. Add the support to compare the
software and hardware state of CASF.

v2: Update subject[Ankit]
v3: Add the state compare[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  7 +++++++
 drivers/gpu/drm/i915/display/skl_scaler.c    | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1d6c4c1e5ddb..8c58cbaaf484 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4242,6 +4242,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 		return ret;
 	}
 
+	ret = intel_casf_compute_config(crtc_state);
+	if (ret)
+		return ret;
+
 	if (DISPLAY_VER(display) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
 		    intel_crtc_needs_fastset(crtc_state) ||
@@ -5294,6 +5298,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
 		PIPE_CONF_CHECK_I(pixel_rate);
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
+		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
+		PIPE_CONF_CHECK_I(hw.casf_params.strength);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index d816dae9cec4..c22f067207af 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -961,16 +961,22 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			continue;
 
 		id = i;
-		crtc_state->pch_pfit.enabled = true;
+
+		if (HAS_CASF(display) && id == 1)
+			intel_casf_sharpness_get_config(crtc_state);
+
+		if (!crtc_state->hw.casf_params.casf_enable)
+			crtc_state->pch_pfit.enabled = true;
 
 		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
 		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
 
-		drm_rect_init(&crtc_state->pch_pfit.dst,
-			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
-			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
-			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
-			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
+		if (!crtc_state->hw.casf_params.casf_enable)
+			drm_rect_init(&crtc_state->pch_pfit.dst,
+				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
+				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
+				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
 
 		scaler_state->scalers[i].in_use = true;
 		break;
-- 
2.25.1

