Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A370F89B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055C10E280;
	Wed, 24 May 2023 14:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A104F10E67F;
 Wed, 24 May 2023 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938407; x=1716474407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpNzxHv9oO+XI/KU5tj0ZuxnaHUVbc6bhspKNHW4Urk=;
 b=EVCMBU63WRQqXbJOti0EBI164CQZBgl9tYjZYK46SSXCkXu+x+XbZ+Kx
 Cw7J/c2/t3EEHGAkhsb1m2gN8hnvB9veL9PJA9VomreFGZexFA/ZdGscw
 w87ANMM2sjvD6Dwk5S/EaurCO6v8pyK1FUVdhokBlGQxmoQJG4O+15FTW
 Y9c1aSOSPYM3e53D2rnZ2703FFz93YrHz0iX43VIV4STUCV1UYBGHkTI3
 YKmsAIeCuNAGaN8lVkAtODD7GlkUScVlWvJGCUH6MnHf3dEdsX+BLXSqF
 +f5iqBkdPSeWqlXkRfNF3GbIL/+Eq7eYYTqkKlsxyj1pnolJAQ5H7ooy+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806381"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556024"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556024"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:43 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Date: Wed, 24 May 2023 19:52:02 +0530
Message-Id: <20230524142210.3779331-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 51 +++++++++++++++++++---
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 14ccda8a0bf1..9f7e246772d7 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2524,6 +2524,48 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
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
+		int pixel_clock = crtc_state->hw.adjusted_mode.clock;
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
+		 *
+		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
+		 * Check if we need to use FEC overhead in the above calculations.
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
@@ -2595,13 +2637,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
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

