Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D89F871D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BDA10EDDF;
	Thu, 19 Dec 2024 21:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCeGYytA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A910EDE3;
 Thu, 19 Dec 2024 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644132; x=1766180132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wDv+lTEp05TdVllO14qQELzG+sfvKVl/mjYP8K5avgE=;
 b=NCeGYytAjfXZblm1/UFaqoCQOtEHOn/PYqR9xuF+DdC0mVN0fz8ZnM8U
 huVZrX8MPpxRUm2+xwTrx7SwdwuKe86/UIE+FkNNU38/jtdcgmpEyQVm5
 oG25pTyRv0exQo3aiTvz1gKtS/wOyrKTFK0OUSUwgrVav9coM3JjLLakZ
 b8kKT4ttvjO5jV7DPIWi1Ln+Hx2C7Vn+pDgIy4kx287Hf/MpnlWzoj2EO
 iDnFuG7KzpLNsix6LpHnbdT0dvgDL904CE8XcmZ3ZP0AZiVyjlNHUhtOn
 dDblnwM6fZyiAjjI0oJgeGh/qXv5HqkADlyKF+YEQDspvCYX6tgja2r7a A==;
X-CSE-ConnectionGUID: eXd1XTc7TXmtlqVxUjmUzw==
X-CSE-MsgGUID: 4WRcP2V8SVCUx+Lt/MriXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590402"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:32 -0800
X-CSE-ConnectionGUID: Uj6i1FsYTWupecOOCefUIQ==
X-CSE-MsgGUID: 3T+Y2GECQhyYWa8AeIeZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146332"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 14/16] drm/i915/ddi: handle 128b/132b SST in
 intel_ddi_read_func_ctl()
Date: Thu, 19 Dec 2024 23:34:03 +0200
Message-Id: <e522cc88476adbbcc9222df70cb2f76636f7db49.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

We'll only ever get here in MST mode from MST stream encoders; the
primary encoder's ->get_config() won't be called when we've detected
it's MST.

v2: Read mst_master_transcoder in 128b/132b SST path (Imre)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 04118f2eea94..37b771f07d59 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4026,6 +4026,11 @@ static void intel_ddi_read_func_ctl_dp_sst(struct intel_encoder *encoder,
 	crtc_state->lane_count =
 		((ddi_func_ctl & DDI_PORT_WIDTH_MASK) >> DDI_PORT_WIDTH_SHIFT) + 1;
 
+	if (DISPLAY_VER(display) >= 12 &&
+	    (ddi_func_ctl & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B)
+		crtc_state->mst_master_transcoder =
+			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
+
 	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
 	intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder, &crtc_state->dp_m2_n2);
 
@@ -4120,9 +4125,19 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		intel_ddi_read_func_ctl_fdi(encoder, pipe_config, ddi_func_ctl);
 	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_SST) {
 		intel_ddi_read_func_ctl_dp_sst(encoder, pipe_config, ddi_func_ctl);
-	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
-		   (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))) {
+	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST) {
 		intel_ddi_read_func_ctl_dp_mst(encoder, pipe_config, ddi_func_ctl);
+	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display)) {
+		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+		/*
+		 * If this is true, we know we're being called from mst stream
+		 * encoder's ->get_config().
+		 */
+		if (intel_dp->is_mst)
+			intel_ddi_read_func_ctl_dp_mst(encoder, pipe_config, ddi_func_ctl);
+		else
+			intel_ddi_read_func_ctl_dp_sst(encoder, pipe_config, ddi_func_ctl);
 	}
 }
 
-- 
2.39.5

