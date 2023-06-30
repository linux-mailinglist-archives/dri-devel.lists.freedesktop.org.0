Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056A743C2E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46A210E468;
	Fri, 30 Jun 2023 12:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7010E1BD;
 Fri, 30 Jun 2023 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129459; x=1719665459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZcitgGD0LR5+G1rlrngoGF4+eWQvBHCf/NoaxttXI4=;
 b=fsU6Ew0SN7VDofU0Ysc1iiklg/CEo1i1q08GnHot3bwdkHZvLNIt6Ckh
 2D/Yb1wdgA2Pzr/bVthg4uXrjapov1J8NdrQs6vSckexsio5fl3RqRaYi
 nE+xKw5DM1KgTsTI8J3gycX1LsLLFLJkwanhtVVHyCtZvKk8NONpL56Sv
 KEMGwBNyeLVWe1R8KBpdHf1DDv977jHxCiBKKGNEF7go0oBtnP6d+B+Y6
 4J8l+ZmLKX1Mz0pdzKY3Wk/AmTcFm8g/NAX7tPuiHVCRkGwdGjSfB46d/
 yXtX9c6OM3RkxNxx8HCOBGMhwIrkCb1tp5okEBKJcnoEb5egjM16GhaG5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232158"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219048"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219048"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/display: Account for DSC not split case while
 computing cdclk
Date: Fri, 30 Jun 2023 18:16:38 +0530
Message-Id: <20230630124652.4140932-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we assume 2 Pixels Per Clock (PPC) while computing
plane cdclk and min_cdlck. In cases where DSC single engine
is used the throughput is 1 PPC.

So account for the above case, while computing cdclk.

v2: Use helper to get the adjusted pixel rate.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  3 ++-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 4207863b7b2a..990dc16511f9 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -37,6 +37,7 @@
 #include "intel_pci_config.h"
 #include "intel_pcode.h"
 #include "intel_psr.h"
+#include "intel_vdsc.h"
 #include "vlv_sideband.h"
 
 /**
@@ -2507,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 	int pixel_rate = crtc_state->pixel_rate;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
-		return DIV_ROUND_UP(pixel_rate, 2);
+		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
 	else if (DISPLAY_VER(dev_priv) == 9 ||
 		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
 		return pixel_rate;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index bd9116d2cd76..11227491834e 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -974,3 +974,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 out:
 	intel_display_power_put(dev_priv, power_domain, wakeref);
 }
+
+int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate)
+{
+	/*
+	 * If single VDSC engine is used, it uses one pixel per clock
+	 * otherwise we use two pixels per clock.
+	 */
+	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
+		return pixel_rate;
+
+	return DIV_ROUND_UP(pixel_rate, 2);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
index 8763f00fa7e2..9f21a6c565c6 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -27,4 +27,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
 void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state);
 
+int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate);
+
 #endif /* __INTEL_VDSC_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 6b01a0b68b97..9eeb25ec4be9 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -17,6 +17,7 @@
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_psr.h"
+#include "intel_vdsc.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -263,8 +264,7 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 {
 	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
 
-	/* two pixels per clock */
-	return DIV_ROUND_UP(pixel_rate, 2);
+	return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
 }
 
 static void
-- 
2.40.1

