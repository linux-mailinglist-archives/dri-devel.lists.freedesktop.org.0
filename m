Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF657662DB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56E510E644;
	Fri, 28 Jul 2023 04:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEC510E642;
 Fri, 28 Jul 2023 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517735; x=1722053735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H18D9nSIZuuqPQbkyf3/VXKz7e3/sIw8JDERhcN//gM=;
 b=jE/Ve9+m01PqOaEoDgOvMz4/nmxt6Z8Vc2Vg6WwtPpDDcUruO9a+oM55
 I2iR0Swa6oAzKzV2Zk5gRLHduedMpCj/ghjL01LqcuWeGymCPmctVAa4c
 sFTg6BRdL95PzVvlT1g2ajynsuqc6x+2kusirr5W+lCWYL29oCCuZtNgn
 su2zIqbY+K8c+F6NXew1jQScwmvV08M8SYyjGeiEaTvlXpNPjRq1QHz9V
 Q73p4Lnoxj2CgoqrhJM62yn3Azika7UvTodV10hssv4lmhHqhS5CY1Oxn
 6YFSRNxJhKDHg1oTbCyfCKxfliqpuv1wP+O6dQzeo2iQt/ThP9/kzQ9jI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104168"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104168"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276298"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276298"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/20] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Date: Fri, 28 Jul 2023 09:41:36 +0530
Message-Id: <20230728041150.2524032-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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

As per Bsepc:49259, Bigjoiner BW check puts restriction on the
compressed bpp for a given CDCLK, pixelclock in cases where
Bigjoiner + DSC are used.

Currently compressed bpp is computed first, and it is ensured that
the bpp will work at least with the max CDCLK freq.

Since the CDCLK is computed later, lets account for Bigjoiner BW
check while calculating Min CDCLK.

v2: Use pixel clock in the bw calculations. (Ville)

v3: Use helper to account for FEC overhead. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 59 +++++++++++++++++-----
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index dcc1f6941b60..0205368ebcb8 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -32,6 +32,7 @@
 #include "intel_cdclk.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
+#include "intel_dp.h"
 #include "intel_display_types.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pci_config.h"
@@ -2533,6 +2534,48 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 	return min_cdclk;
 }
 
+static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
+	int min_cdclk = 0;
+
+	/*
+	 * When we decide to use only one VDSC engine, since
+	 * each VDSC operates with 1 ppc throughput, pixel clock
+	 * cannot be higher than the VDSC clock (cdclk)
+	 * If there 2 VDSC engines, then pixel clock can't be higher than
+	 * VDSC clock(cdclk) * 2 and so on.
+	 */
+	min_cdclk = max_t(int, min_cdclk,
+			  DIV_ROUND_UP(crtc_state->pixel_rate, num_vdsc_instances));
+
+	if (crtc_state->bigjoiner_pipes) {
+		int pixel_clock = intel_dp_mode_to_fec_clock(crtc_state->hw.adjusted_mode.clock);
+
+		/*
+		 * According to Bigjoiner bw check:
+		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
+		 *
+		 * We have already computed compressed_bpp, so now compute the min CDCLK that
+		 * is required to support this compressed_bpp.
+		 *
+		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
+		 *
+		 * Since PPC = 2 with bigjoiner
+		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
+		 */
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
+		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
+				   (2 * bigjoiner_interface_bits);
+
+		min_cdclk = max(min_cdclk, min_cdclk_bj);
+	}
+
+	return min_cdclk;
+}
+
 int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv =
@@ -2604,20 +2647,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 	/* Account for additional needs from the planes */
 	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
 
-	/*
-	 * When we decide to use only one VDSC engine, since
-	 * each VDSC operates with 1 ppc throughput, pixel clock
-	 * cannot be higher than the VDSC clock (cdclk)
-	 * If there 2 VDSC engines, then pixel clock can't be higher than
-	 * VDSC clock(cdclk) * 2 and so on.
-	 */
-	if (crtc_state->dsc.compression_enable) {
-		int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
-
-		min_cdclk = max_t(int, min_cdclk,
-				  DIV_ROUND_UP(crtc_state->pixel_rate,
-					       num_vdsc_instances));
-	}
+	if (crtc_state->dsc.compression_enable)
+		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
 
 	/*
 	 * HACK. Currently for TGL/DG2 platforms we calculate
-- 
2.40.1

