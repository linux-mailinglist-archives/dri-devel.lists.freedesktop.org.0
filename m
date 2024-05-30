Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE18D455C
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAE711B472;
	Thu, 30 May 2024 06:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LT+AgflT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4297911B462;
 Thu, 30 May 2024 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049685; x=1748585685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5L0QCrnPu9IMzJlekJMyS4/Cy+gY1yeMrGsCDFCsbGI=;
 b=LT+AgflTBHKUXni+fjztXvbz+a7LrpvAYNnoaijBaT+s99ESE7MrKtrp
 F+je7sOSXYh4yWFoZfIFCZhv6kGZj+PmHHg8K2C1eqIqQq2IVU9f5WWOj
 W7GPKZdcxQbWT7fwGBkgRG4Yosf5VXC5WlljFFBZePrXCg5ri1pAkgIvz
 ublcL+O+zCP4mexeJt/q8FYzh+6vkGbJQSsJmfbf3ox8zj8jxRdgC3l6Z
 zNRxplIJaROWiR5m9T16sCoQlqhRl3MLhL9FtiF6iPmlSK6RfcreglCiI
 A2Zg03vmOgSyqqp1x+DJAIWLx2Mm6qiJtU9/acHGELL/Bsth0wSkN5J5Q g==;
X-CSE-ConnectionGUID: bxYsail7QI6+TpiD0EqHbw==
X-CSE-MsgGUID: /hUslR2HQEuUc136q2xLWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915535"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:45 -0700
X-CSE-ConnectionGUID: E7ofjAjAS5iSede4jJdL+g==
X-CSE-MsgGUID: l/xs7wSrTgON6wjGp5RyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335694"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:43 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 7/8] drm/i915/display: Compute Adaptive sync SDP params
Date: Thu, 30 May 2024 11:34:07 +0530
Message-Id: <20240530060408.67027-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute params for Adaptive Sync SDP when Fixed Average Vtotal
mode is enabled.

--v2:
Since vrr.enable is set in case of cmrr also, handle accordingly(Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 95cf586f3bed..7007a509363a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2627,7 +2627,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	if (!crtc_state->vrr.enable ||
+	if (!(crtc_state->vrr.enable || crtc_state->cmrr.enable) ||
 	    !intel_dp_as_sdp_supported(intel_dp))
 		return;
 
@@ -2636,11 +2636,20 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
 	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
 	as_sdp->length = 0x9;
-	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
-	as_sdp->vtotal = adjusted_mode->vtotal;
-	as_sdp->target_rr = 0;
 	as_sdp->duration_incr_ms = 0;
 	as_sdp->duration_incr_ms = 0;
+
+	if (crtc_state->vrr.enable) {
+		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
+		as_sdp->vtotal = adjusted_mode->vtotal;
+		as_sdp->target_rr = DIV_ROUND_UP(adjusted_mode->clock * 1000,
+						 adjusted_mode->htotal * adjusted_mode->vtotal);
+		as_sdp->target_rr_divider = true;
+	} else{
+		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
+		as_sdp->vtotal = adjusted_mode->vtotal;
+		as_sdp->target_rr = 0;
+	}
 }
 
 static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
-- 
2.25.1

