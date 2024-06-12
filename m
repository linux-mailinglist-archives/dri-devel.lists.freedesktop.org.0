Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CF904FAE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2C110E812;
	Wed, 12 Jun 2024 09:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4UbmurC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCDC10E813;
 Wed, 12 Jun 2024 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718186072; x=1749722072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=did2WuwK3Oifkj9Eg4E4zFLiIRquPsUlKco9JnLFOi8=;
 b=H4UbmurCfKSOKg1WwvOAzNJ5C83oo1Z9ZC2naPlzHIYWi0mO6n1VbAfj
 cfvoYDb1CRNInLjYK4Sm0MMvPvbxkyQWCUimyH6hqDdFRUNUbbJ2GmkZr
 YfNIAiuLyn1rQ46T2F6HRzLV5AvUM7agzAFrjONnX/WhvzQ0vxLjGHRlT
 XU9zEBumo5HBM0UjrTWE8rJoEhmL+jXERx1BcsvzcP3+H6Zq98nclM8oj
 f5qUSrnHqq0s+Fwpxo9j37ZCdCm6SAbmt+J0NY21o3pD3vrrpQZcb4Y6d
 JjzAgDM+pf/aLhfelJP4Daog9PPuV5LqgQRWl+HVwvs7wJOJQPuAJE5jV g==;
X-CSE-ConnectionGUID: Ti3btqTcSxyxHcm3lmM6jg==
X-CSE-MsgGUID: qUIhMsLHQ3iOOZDlWog15Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15068935"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15068935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:54:31 -0700
X-CSE-ConnectionGUID: 77PbWAhaSZCNwl5O5QfBdQ==
X-CSE-MsgGUID: jbLPL7gxRomv8Su0NYoFcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40441630"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 02:54:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, sfr@canb.auug.org.au
Subject: [PATCH 2/3] drm/i915/display: Send vrr vsync params whne vrr is
 enabled
Date: Wed, 12 Jun 2024 15:24:32 +0530
Message-ID: <20240612095433.323342-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute trans vrr vsync params only when either VRR or CMRR
is enabled.

Fixes: 5922f45329cd ("drm/i915/display: Compute vrr vsync params")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 05f67dc9d98d..dc9cf7ddafe9 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -232,7 +232,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 	}
 
-	if (intel_dp_as_sdp_supported(intel_dp)) {
+	if (intel_dp_as_sdp_supported(intel_dp) &&
+	    crtc_state->vrr.enable) {
 		crtc_state->vrr.vsync_start =
 			(crtc_state->hw.adjusted_mode.crtc_vtotal -
 			 crtc_state->hw.adjusted_mode.vsync_start);
-- 
2.45.2

