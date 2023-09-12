Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB879D699
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E893110E446;
	Tue, 12 Sep 2023 16:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F210E445;
 Tue, 12 Sep 2023 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694536988; x=1726072988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e7LHg9nYrvWMHZxedYwBKvv/wcrPKiHK4vtXPbwvz3E=;
 b=QheiJu+4O3Hxn5zLsC6gl0ndjF6TBsONNda/tiPjj7dKJULcC6r5wOtm
 Anq/HqhFHcqHupcKhE8SqehEib9tXNruYWA1JLTakISM6NseXik75eEfr
 F+2ohA+EnMdZnTUcbH2rc5LslV4z6p2KWdbOBXrurxjI12qgDAKEdkT60
 SmXOpCbR1sYgDYJniaYuGo5KDoBaJ9yis1A7GulYnN8oqNIBoSXDe3QAs
 ICMNQ7mAImjYVbm/qnbG9ksM/DQxybEb6wNg5SBFIZIY0NYIT3FqxYS2B
 BuDO4q03uZPelHN1BGwVSoBlBzN4FlR1uUXwf4wMKh/u0vjf0ffhAsGr+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442446858"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442446858"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743775734"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743775734"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 09:43:05 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915/audio : Consider fractional vdsc bpp while
 computing tu_data
Date: Tue, 12 Sep 2023 22:07:31 +0530
Message-Id: <20230912163735.1075868-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

MTL+ supports fractional compressed bits_per_pixel, with precision of
1/16. This compressed bpp is stored in U6.4 format.
Accommodate the precision during calculation of transfer unit data
for hblank_early calculation.

v2:
-Fixed tu_data calculation while dealing with U6.4 format. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 4f1db1581316..3b08be54ce4f 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -522,25 +522,25 @@ static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
 	unsigned int link_clks_available, link_clks_required;
 	unsigned int tu_data, tu_line, link_clks_active;
 	unsigned int h_active, h_total, hblank_delta, pixel_clk;
-	unsigned int fec_coeff, cdclk, vdsc_bpp;
+	unsigned int fec_coeff, cdclk, vdsc_bppx16;
 	unsigned int link_clk, lanes;
 	unsigned int hblank_rise;
 
 	h_active = crtc_state->hw.adjusted_mode.crtc_hdisplay;
 	h_total = crtc_state->hw.adjusted_mode.crtc_htotal;
 	pixel_clk = crtc_state->hw.adjusted_mode.crtc_clock;
-	vdsc_bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
+	vdsc_bppx16 = crtc_state->dsc.compressed_bpp_x16;
 	cdclk = i915->display.cdclk.hw.cdclk;
 	/* fec= 0.972261, using rounding multiplier of 1000000 */
 	fec_coeff = 972261;
 	link_clk = crtc_state->port_clock;
 	lanes = crtc_state->lane_count;
 
-	drm_dbg_kms(&i915->drm, "h_active = %u link_clk = %u :"
-		    "lanes = %u vdsc_bpp = %u cdclk = %u\n",
-		    h_active, link_clk, lanes, vdsc_bpp, cdclk);
+	drm_dbg_kms(&i915->drm,
+		    "h_active = %u link_clk = %u : lanes = %u vdsc_bppx16 = %u cdclk = %u\n",
+		    h_active, link_clk, lanes, vdsc_bppx16, cdclk);
 
-	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bpp || !cdclk))
+	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bppx16 || !cdclk))
 		return 0;
 
 	link_clks_available = (h_total - h_active) * link_clk / pixel_clk - 28;
@@ -552,8 +552,8 @@ static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
 		hblank_delta = DIV64_U64_ROUND_UP(mul_u32_u32(5 * (link_clk + cdclk), pixel_clk),
 						  mul_u32_u32(link_clk, cdclk));
 
-	tu_data = div64_u64(mul_u32_u32(pixel_clk * vdsc_bpp * 8, 1000000),
-			    mul_u32_u32(link_clk * lanes, fec_coeff));
+	tu_data = div64_u64(mul_u32_u32(pixel_clk * vdsc_bppx16 * 8, 1000000),
+			    mul_u32_u32(link_clk * lanes * 16, fec_coeff));
 	tu_line = div64_u64(h_active * mul_u32_u32(link_clk, fec_coeff),
 			    mul_u32_u32(64 * pixel_clk, 1000000));
 	link_clks_active  = (tu_line - 1) * 64 + tu_data;
-- 
2.25.1

