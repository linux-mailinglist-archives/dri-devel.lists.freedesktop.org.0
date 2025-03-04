Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD7A4DAB1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B161810E584;
	Tue,  4 Mar 2025 10:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmM6qscM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0E10E574;
 Tue,  4 Mar 2025 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084429; x=1772620429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ACXTK+2LaiboZChIkDyVLI+pNGhEsTw5HkIsMQ4fdE=;
 b=GmM6qscMlN1wOO1tXOzk00Pf4eR49+y/OJnZfHeFPuxlHPzUCfOhfRBp
 1hlwYmnHiFUN24BlR9r5uaUVgLG3PQTw2p7bsdx6cjs/OssrexGoePYLP
 32IZQkWZ0TbOvoIib8SwzP6AXX/3vs0QfDjEr5Q4DPnh3NrSluJ61S0R3
 PYDPSD5RIkmiCbH7gyvlG5E806ddE1pFp8KbIcTTqzQ10nW1oVDL90F1n
 UqFbUjUmWjePMrxqS24OrwZ6kN0B18nRFRJhRUmeSl0KIPnpDh3klDUOx
 FMvY8phpc8WojlLw2FnR1OWr0uRso3aB/D5dk4AU56d09Zgq2Xk1P8eGp g==;
X-CSE-ConnectionGUID: Vnz6syPGQfGe+QQH4y0OIA==
X-CSE-MsgGUID: KFucQm06RkyGdUREq9JUzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584099"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584099"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:49 -0800
X-CSE-ConnectionGUID: tNJ18St+TSGwDXWmgdvODA==
X-CSE-MsgGUID: Yk60POc6TGKabwGOBDdJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064056"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:48 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 08/10] drm/i915/display: Call the compute function
Date: Tue,  4 Mar 2025 15:58:55 +0530
Message-Id: <20250304102857.326544-9-nemesa.garg@intel.com>
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

Once the casf_compute config is called then the
strength and win_size bit of sharpness ctl register
will be set. Read back the bits in get_config.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    | 11 +++++++
 drivers/gpu/drm/i915/display/intel_display.c |  4 +++
 drivers/gpu/drm/i915/display/skl_scaler.c    | 32 +++++++++++++++-----
 3 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 1d9196c4d22f..9f14418dc3c9 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -97,6 +97,17 @@ static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (!HAS_CASF(display))
+		return 0;
+
+	if (crtc_state->uapi.sharpness_strength == 0) {
+		crtc_state->hw.casf_params.casf_enable = false;
+		crtc_state->hw.casf_params.strength = 0;
+		return 0;
+	}
+
 	crtc_state->hw.casf_params.casf_enable = true;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 03acf01cac75..a2fb68c7cf7a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4267,6 +4267,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 			return ret;
 	}
 
+	ret = intel_casf_compute_config(crtc_state);
+	if (ret)
+		return ret;
+
 	if (DISPLAY_VER(dev_priv) >= 9 ||
 	    IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv)) {
 		ret = hsw_compute_linetime_wm(state, crtc);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 93a847c05535..79b6749c157e 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -957,23 +957,41 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 	/* find scaler attached to this pipe */
 	for (i = 0; i < crtc->num_scalers; i++) {
-		u32 ctl, pos, size;
+		u32 ctl, pos, size, sharp;
 
 		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
 			continue;
 
 		id = i;
-		crtc_state->pch_pfit.enabled = true;
+
+		if (HAS_CASF(display) && id == 1) {
+			sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
+			if (sharp & FILTER_EN) {
+				if (drm_WARN_ON(display->drm,
+						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
+					crtc_state->hw.casf_params.strength = 0;
+				else
+					crtc_state->hw.casf_params.strength =
+						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
+				crtc_state->hw.casf_params.casf_enable = true;
+				crtc_state->hw.casf_params.win_size =
+					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
+			}
+		}
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

