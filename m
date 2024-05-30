Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85E8D455F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1EE11B477;
	Thu, 30 May 2024 06:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtOH7pPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3911B46F;
 Thu, 30 May 2024 06:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049687; x=1748585687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7D7ny0YUvJGupdUVvjNzsk+JDDUyuuvnYYFdPbnmn6Q=;
 b=FtOH7pPpH5h/SDG6fmo2Xw25OfH0dCYbAb2RYLxbHMXv1019ClOEF8Nh
 pN3mlmR44k4dmPZg2xG0qfMAHUAomb4ld9obrPAw/+th55XL+tzsHQqmc
 4wYbaLg2IEf4CQ76bIfgnt3vgOWZebCk5vLW96/XQREj/yD/ylBAuaBVY
 hvszz9tlixjZMfgUuWDk88XVXpS3MjgFdOItHPpbSEXhYXkDclnV9NxFo
 YS/HsqDU+/+WgK0NY1AIqPUlrlUOjWVf3wV4HYFLHDsmzKaamvJGHHxiE
 oKu3w4CL6W7gDeS05O2677v24OSR1ORK7E5jhkD7CkZ7aS1SEqbwXOEZr A==;
X-CSE-ConnectionGUID: TrYYH+oCQMGvz/BTArwuTA==
X-CSE-MsgGUID: fDDWeWy4SSSQiu7itKxX6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915542"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:47 -0700
X-CSE-ConnectionGUID: 6+2zufVeSjmhqNXPw8VTGw==
X-CSE-MsgGUID: J6mhLq0UQNiT3mC4NfM9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335699"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:45 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 8/8] drm/i915/display: Compute vrr vsync params
Date: Thu, 30 May 2024 11:34:08 +0530
Message-Id: <20240530060408.67027-9-mitulkumar.ajitkumar.golani@intel.com>
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

Compute vrr vsync params in case of FAVT as well instead of
only to AVT mode of operation.

--v2:
- Remove redundant computation for vrr_vsync_start
and vrr_vsync_end(Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 1e4e2d8a0927..2090a12b38aa 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -217,14 +217,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
-		if (intel_dp_as_sdp_supported(intel_dp)) {
-			crtc_state->vrr.vsync_start =
-				(crtc_state->hw.adjusted_mode.crtc_vtotal -
-					crtc_state->hw.adjusted_mode.vsync_start);
-			crtc_state->vrr.vsync_end =
-				(crtc_state->hw.adjusted_mode.crtc_vtotal -
-					crtc_state->hw.adjusted_mode.vsync_end);
-		}
 	} else if (is_cmrr_frac_required(crtc_state) && is_edp) {
 		crtc_state->vrr.enable = true;
 		crtc_state->cmrr.enable = true;
@@ -234,6 +226,15 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 	}
 
+	if (intel_dp_as_sdp_supported(intel_dp)) {
+		crtc_state->vrr.vsync_start =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			 crtc_state->hw.adjusted_mode.vsync_start);
+		crtc_state->vrr.vsync_end =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			 crtc_state->hw.adjusted_mode.vsync_end);
+	}
+
 	/*
 	 * For XE_LPD+, we use guardband and pipeline override
 	 * is deprecated.
-- 
2.25.1

