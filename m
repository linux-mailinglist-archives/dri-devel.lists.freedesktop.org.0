Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B1904FB1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B98410E818;
	Wed, 12 Jun 2024 09:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQqivRdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D216410E809;
 Wed, 12 Jun 2024 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718186075; x=1749722075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=To9DU10Zhe8E/I7Qn0M/0vjZR5mT3ISO+qho+zaXReQ=;
 b=CQqivRdG4z4AL/n+UqnXP8UZH2dfVtDO/cnuFrwzDUHGlsqnD3zkDD1g
 WKzQbhfGuwSR6+GaKURE07j3oaoaMUoHM7PsbXCcdhyWzWFbVdhlV8Kms
 Upidd7Y2PLKl1MeTKpZH59dNFYgUd8Ge0sWgswNP7BHWApSwo+GmLtxh1
 H1X9P1KaE+lIAWmCzZM8wQ1UeARkjgmQDke50cvDR1FXdYjI8F7Of51lR
 NjEGZLXF+qWA2Zz8CxCb/wzuE8NGyx9Trzho+O+zchmqzOVYfaAHYEHMr
 BnMWKisXxYOUJ1PVYnaLi4I4+bOwICJ1sZxTpWnC4Ph8tIkoyUyabmd8q g==;
X-CSE-ConnectionGUID: j3tTnqTJQ3GkoGQibZ+wLA==
X-CSE-MsgGUID: sUzkI1tAQTugkpOG5jj8eQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15068941"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15068941"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:54:34 -0700
X-CSE-ConnectionGUID: qQ7ze+SwRuaM3SfJ8iReew==
X-CSE-MsgGUID: fNWL6necQ5uUdNH1llGPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40441635"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 02:54:32 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, sfr@canb.auug.org.au
Subject: [PATCH 3/3] drm/i915/display: Update calculation to avoid overflow
Date: Wed, 12 Jun 2024 15:24:33 +0530
Message-ID: <20240612095433.323342-4-mitulkumar.ajitkumar.golani@intel.com>
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

Update calculation to avoid overflow.

Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index dc9cf7ddafe9..5da9d5b9936e 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -147,10 +147,11 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 		multiplier_n = 1000;
 	}
 
-	crtc_state->cmrr.cmrr_n =
-		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
-	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
-	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
+	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
+					      multiplier_n);
+	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
+				  crtc_state->cmrr.cmrr_n);
+	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
 	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
 
 	return vtotal;
-- 
2.45.2

