Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E378695C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6110E494;
	Thu, 24 Aug 2023 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165310E4C9;
 Thu, 24 Aug 2023 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692864316; x=1724400316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DzUzAkotMdYaaDH+bpfMfQn1lE9QvOXz/KEc/cGaam8=;
 b=KjEGscZDXGoLG0SKFpPZwacbZ+O6sUGV/p0R1e5m4mo+k1YGJRlAFqBC
 w0Ylmzx2IpFaqGKuYo0/Y4jKA8ZtadhYSAvlvXoFRIMyIyfwkOy9DcMKu
 da2sIBtyfm6Ug4kO/9B7GytQ61BUEXP7aF1PZKSxtKsawR7W9ei6HcTLI
 OCd62iD3ip6+t6k8QrQ9R1rnspvt2sHm9IepncNq/008c4aAEaV1p57y5
 Y3POMCK9rYdXQIGsO9RvxcDVXJ3dsvI9eJfHi3bCTEOKIvHdQ1UTBmfHh
 JgKJTPgBOBsmfiKTnj9BKeiCMFdkD4r95wX5Z1i3HwZHKocewr299nszt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374345871"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374345871"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880710320"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:18 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/22] drm/dp_mst: Add a way to calculate PBN values with
 FEC overhead
Date: Thu, 24 Aug 2023 11:05:05 +0300
Message-Id: <20230824080517.693621-11-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230824080517.693621-1-imre.deak@intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <wayne.lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a way for drivers to calculate the MST PBN values with FEC overhead.
This is required by 8b/10b links both for DSC and non-DSC (the latter
needed if there are both DSC and non-DSC streams on the same MST link).

Also add kunit test cases for PBN values calculated with FEC overhead.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 18 +++++++++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  5 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 23 ++++++++++++++++++-
 include/drm/display/drm_dp_mst_helper.h       |  2 +-
 7 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 268cb99a4c4bc..22868d6eb8977 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6782,7 +6782,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 								    max_bpc);
 		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
 		clock = adjusted_mode->clock;
-		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp, false);
+		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp, false, false);
 	}
 
 	dm_new_connector_state->vcpi_slots =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 57230661132bd..9acfdefc792d6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1636,7 +1636,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	} else {
 		/* check if mode could be supported within full_pbn */
 		bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
-		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
+		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false, false);
 
 		if (pbn > aconnector->mst_output_port->full_pbn)
 			return DC_FAIL_BANDWIDTH_VALIDATE;
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index bd0f35a0ea5fb..e26f1b7f5a701 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4693,26 +4693,34 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
  * @clock: dot clock for the mode
  * @bpp: bpp for the mode.
  * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
+ * @fec: FEC overhead.
  *
  * This uses the formula in the spec to calculate the PBN value for a mode.
  */
-int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc, bool fec)
 {
 	/*
-	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
+	 * Overheads:
+	 * - SSC downspread and ref clock variation margin:
+	 *     5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
+	 * - FEC symbol insertions:
+	 *     2.4% as per spec, factor is 1.024
+	 *
 	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
 	 * common multiplier to render an integer PBN for all link rate/lane
 	 * counts combinations
 	 * calculate
-	 * peak_kbps *= (1006/1000)
+	 * peak_kbps *= (1006/1000) without FEC, or
+	 * peak_kbps *= (1030/1000) with FEC
 	 * peak_kbps *= (64/54)
-	 * peak_kbps *= 8    convert to bytes
+	 * peak_kbps /= 8    convert to bytes
 	 *
 	 * If the bpp is in units of 1/16, further divide by 16. Put this
 	 * factor in the numerator rather than the denominator to avoid
 	 * integer overflow
 	 */
-	u32 bpp_m = (dsc ? 64 / 16 : 64) * 1006 * bpp;
+	u32 overhead = fec ? 1030 : 1006;
+	u32 bpp_m = (dsc ? 64 / 16 : 64) * overhead * bpp;
 
 	return DIV_ROUND_UP_ULL(mul_u32_u32(clock, bpp_m),
 				8 * 54 * 1000 * 1000);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 525766206fce5..6eeb7dbf5ba67 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -110,7 +110,8 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
 						       dsc ? bpp << 4 : bpp,
-						       dsc);
+						       dsc,
+						       false);
 
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
@@ -983,7 +984,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		return ret;
 
 	if (mode_rate > max_rate || mode->clock > max_dotclk ||
-	    drm_dp_calc_pbn_mode(mode->clock, min_bpp, false) > port->full_pbn) {
+	    drm_dp_calc_pbn_mode(mode->clock, min_bpp, false, false) > port->full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e7c9c353c511..d71c28e458107 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -967,7 +967,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 
 		asyh->or.bpc = connector->display_info.bpc;
 		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
-						    false);
+						    false, false);
 	}
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &mstm->mgr);
diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index ea2182815ebe8..3c0c0ffd5f9f5 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -16,6 +16,7 @@ struct drm_dp_mst_calc_pbn_mode_test {
 	const int clock;
 	const int bpp;
 	const bool dsc;
+	const bool fec;
 	const int expected;
 };
 
@@ -24,39 +25,59 @@ static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases
 		.clock = 154000,
 		.bpp = 30,
 		.dsc = false,
+		.fec = false,
 		.expected = 689
 	},
 	{
 		.clock = 234000,
 		.bpp = 30,
 		.dsc = false,
+		.fec = false,
 		.expected = 1047
 	},
 	{
 		.clock = 297000,
 		.bpp = 24,
 		.dsc = false,
+		.fec = false,
 		.expected = 1063
 	},
 	{
 		.clock = 332880,
 		.bpp = 24 << 4,
 		.dsc = true,
+		.fec = false,
 		.expected = 1191
 	},
 	{
 		.clock = 324540,
 		.bpp = 24 << 4,
 		.dsc = true,
+		.fec = false,
 		.expected = 1161
 	},
+	{
+		.clock = 324540,
+		.bpp = 24 << 4,
+		.dsc = true,
+		.fec = true,
+		.expected = 1189
+	},
+	{
+		.clock = 324540,
+		.bpp = 24,
+		.dsc = false,
+		.fec = true,
+		.expected = 1189
+	},
 };
 
 static void drm_test_dp_mst_calc_pbn_mode(struct kunit *test)
 {
 	const struct drm_dp_mst_calc_pbn_mode_test *params = test->param_value;
 
-	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp, params->dsc),
+	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp,
+						   params->dsc, params->fec),
 			params->expected);
 }
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index ed5c9660563c4..0953b7b16a51b 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -832,7 +832,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector,
 int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count);
 
-int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc, bool fec);
 
 void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
 
-- 
2.37.2

