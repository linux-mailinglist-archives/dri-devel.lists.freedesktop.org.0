Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE187751EFA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2305F10E675;
	Thu, 13 Jul 2023 10:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1810E670;
 Thu, 13 Jul 2023 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244671; x=1720780671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YpmARCwuN53B3jIy4gFtICG4aT6P2+HaC3plxhjoIX8=;
 b=EtjZrXIkJgzJjy84o0scaBFFH8sBCwh1UDKnnj7L9mh19fUxH5Lnx+hH
 40fI9PfPq/BUam5MPB8sDL3OaZpP9nq9IIQ1VokW/AhAfLjX/OZ9le9Nz
 9kseHrVt7cKt5mxYiwe5WV/O94jmsEvAhthmFXiEyIsfFXUc86YYLOkGE
 sHFIIjMas3w5EbR8x/Q3zeDbN/XEEjBBTHYbfwel6kr9vHBFzo5cqj5s2
 loY+wVRY41oJDts359H18+8/R32WU2PUVThquRkKBk58ZJExvmuhXJoxc
 +YwwNPM0ONikwWjLYVAuRJd9qyn71sgaxBAdrq1+m5/l8S38uJ0HOmChn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897573"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965343"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965343"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:48 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/display: Account for DSC not split case while
 computing cdclk
Date: Thu, 13 Jul 2023 16:03:33 +0530
Message-Id: <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index dcc1f6941b60..701909966545 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2508,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 	int pixel_rate = crtc_state->pixel_rate;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
-		return DIV_ROUND_UP(pixel_rate, 2);
+		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
 	else if (DISPLAY_VER(dev_priv) == 9 ||
 		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
 		return pixel_rate;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 9d76c2756784..bbfdbf06da68 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -1038,3 +1038,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
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
index 2cc41ff08909..3bb4b1980b6b 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -28,4 +28,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
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

