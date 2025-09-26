Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14490BA3831
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDAD10EA3E;
	Fri, 26 Sep 2025 11:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8vJ8STn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9A710EA3C;
 Fri, 26 Sep 2025 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886942; x=1790422942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yBnhz/iz/HeUljmemQO0L/YaAsU/ZIgVl/zkQ72Dozg=;
 b=V8vJ8STn3XP3ppH1PV+B7Of6Zm+fFANuio157wfdbZ7bneKHDMW0IYr5
 sllLMU4IBRONleykvKAZUfo6VGl4hke4JT6EUjM6IUty/yWpfznrWCRtm
 IYrxOs5AuPWVZDbAHQh07q45qx+3ws4j442pCQ/w7ADawvR8l+mzW6j+F
 CGRY2yDMVpvvuvJmyTik4bjA+rA0z8wCeXTQOxfj6eV1FLR4wpzoWF0rj
 GaDzSWBiV6n5DjSZMB2z8ReVSWaCY39dPAq8Lr8yfam+hYKttzDSo01dP
 knbz1HFvh25hCb5y4oUXuNaOshgy5bh1ZJRV2kxLqv3zaFDCFQ3sL4Bbg A==;
X-CSE-ConnectionGUID: 0aSif1JURh6lJSXgw/hI3Q==
X-CSE-MsgGUID: dzRmhFfZSSOSABAAi/OYAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78860097"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78860097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:42:22 -0700
X-CSE-ConnectionGUID: 8oJ32fb0Qxql0ZJQTTtEHA==
X-CSE-MsgGUID: sENdmW2XQFu0JSKmr8Vpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176723519"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 26 Sep 2025 04:42:20 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/10] drm/i915/display: Set and get the casf config
Date: Fri, 26 Sep 2025 17:07:26 +0530
Message-Id: <20250926113728.606315-9-nemesa.garg@intel.com>
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
 drivers/gpu/drm/i915/display/skl_scaler.c    | 19 +++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6c3f6207143c..6a4d0fe4d6e5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4203,6 +4203,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 		return ret;
 	}
 
+	ret = intel_casf_compute_config(crtc_state);
+	if (ret)
+		return ret;
+
 	if (DISPLAY_VER(display) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
 		    intel_crtc_needs_fastset(crtc_state) ||
@@ -5265,6 +5269,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
 		PIPE_CONF_CHECK_I(pixel_rate);
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
+		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
+		PIPE_CONF_CHECK_I(hw.casf_params.strength);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 9cab3f9dc147..956b1f6cbaa5 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -981,16 +981,23 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			continue;
 
 		id = i;
-		crtc_state->pch_pfit.enabled = true;
+
+		/* Read CASF regs for second scaler */
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

