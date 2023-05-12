Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49C70006D
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBB810E62D;
	Fri, 12 May 2023 06:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D13010E628;
 Fri, 12 May 2023 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872942; x=1715408942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CL4vgMZvaS8OXCBHwzGWnqWymfeIPDZz2OoMfulkESc=;
 b=iqGrkDB24QIV0uNEI1zRqxr48JPetr+JOo//qHo4RkmZqisiqnc058zK
 ZzB4Jgx7O9Mhv9lJxDtpWS0Ec5hYdUCNwLkMQuWuA27ZVAhpawwIxBc6P
 PUOO2tadDcokPCx7RlvpnmcwyKKKbAeFmpcbMv8I+jtd+dzbKXYT4PDBU
 5o6879PrMYey3zW1dsNWFVr2cWVgjC7VYGtujUAvK5VYv8MOuYtuigiHZ
 1K6x0cupcpAXo0Hf1z6YyNf407is1LGCTjCUCv5I7iQuvKtap6T1JNRvS
 WO0sHKnagWgysg28PI8TpR4sL+WQ4ZTRrS4oXT3E/hhAbzRWRxWl2sOUn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741939"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741939"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941287"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941287"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:00 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Date: Fri, 12 May 2023 11:54:09 +0530
Message-Id: <20230512062417.2584427-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 49 ++++++++++++++++++----
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 6bed75f1541a..3532640c5027 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2520,6 +2520,46 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 	return min_cdclk;
 }
 
+static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	int min_cdclk = 0;
+
+	/*
+	 * When we decide to use only one VDSC engine, since
+	 * each VDSC operates with 1 ppc throughput, pixel clock
+	 * cannot be higher than the VDSC clock (cdclk)
+	 */
+	if (!crtc_state->dsc.dsc_split)
+		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
+
+	if (crtc_state->bigjoiner_pipes) {
+		/*
+		 * According to Bigjoiner bw check:
+		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
+		 *
+		 * We have already computed compressed_bpp, so now compute the min CDCLK that
+		 * is required to support this compressed_bpp.
+		 *
+		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
+		 *
+		 * Since Num of pipes joined = 2, and PPC = 2 with bigjoiner
+		 * => CDCLK >= compressed_bpp * pixel_rate  / Bigjoiner Interface bits
+		 *
+		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
+		 * Check if we need to use FEC overhead in the above calculations.
+		 */
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
+		int min_cdclk_bj = crtc_state->dsc.compressed_bpp * crtc_state->pixel_rate /
+				   bigjoiner_interface_bits;
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
@@ -2591,13 +2631,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 	/* Account for additional needs from the planes */
 	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
 
-	/*
-	 * When we decide to use only one VDSC engine, since
-	 * each VDSC operates with 1 ppc throughput, pixel clock
-	 * cannot be higher than the VDSC clock (cdclk)
-	 */
-	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
-		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
+	if (crtc_state->dsc.compression_enable)
+		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
 
 	/*
 	 * HACK. Currently for TGL/DG2 platforms we calculate
-- 
2.25.1

