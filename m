Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690A7A0E3E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40E10E58F;
	Thu, 14 Sep 2023 19:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1B10E588;
 Thu, 14 Sep 2023 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694719621; x=1726255621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/7l2vZgN7z9j+UnpsAOgMTUEyfhEeqr7aPiMyqK36o=;
 b=En2oMrH7cszzB3fmBfkSijJaHmnv5nNjtHX86G1jHMVINIMZtLrfQRrL
 L4/K8JgM2vN+/I4kuBg7DoxX56qTteKDeXLn50YaT4odWlMvynPW0AMpc
 k1TN7KE03RcpfWfSGMxYXyMqXzHOLfBWDEQr46QEhjE8ayVZu+7i8g37c
 g8aB33Wl78HwQTQjNUzciJ6+CEF8bUbjVQ8EOmiMMM2g43LcCRmlCiySe
 MA2DsFB8XuCPiX3eKal3ewBjsBebtdDd+wAa3iu3JesDwKFVw3AH+A7Fe
 usWoyA7e7UTMx5aXFHfqUEjkAYjBCoWQ4jEZ9DSnKIJatssfX1JDxKtIu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465421734"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="465421734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779790581"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779790581"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:26:58 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 13/25] drm/dp_mst: Add a way to calculate PBN values with
 FEC overhead
Date: Thu, 14 Sep 2023 22:26:47 +0300
Message-Id: <20230914192659.757475-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230914192659.757475-1-imre.deak@intel.com>
References: <20230914192659.757475-1-imre.deak@intel.com>
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

Also add a kunit test case for PBN values calculated with FEC overhead.

v2:
- Rebase on fractional bpp fix in the previous patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com> (v1)
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 19 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  5 +++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 15 ++++++++++++++-
 include/drm/display/drm_dp_mst_helper.h       |  2 +-
 7 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1df65e3e674f6..fb175ac279318 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6804,7 +6804,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 								    max_bpc);
 		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
 		clock = adjusted_mode->clock;
-		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp << 4);
+		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp << 4, false);
 	}
 
 	dm_new_connector_state->vcpi_slots =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2afd1bc74978d..46829361175dc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1636,7 +1636,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	} else {
 		/* check if mode could be supported within full_pbn */
 		bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
-		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp << 4);
+		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp << 4, false);
 
 		if (pbn > aconnector->mst_output_port->full_pbn)
 			return DC_FAIL_BANDWIDTH_VALIDATE;
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0264f673295a8..db97aa76575c1 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4721,22 +4721,31 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
  * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
  * @clock: dot clock
  * @bpp: bpp as .4 binary fixed point
+ * @fec: calculate PBN with FEC overhead
  *
  * This uses the formula in the spec to calculate the PBN value for a mode.
  */
-int drm_dp_calc_pbn_mode(int clock, int bpp)
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool fec)
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
 	 */
-	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
+	u32 overhead = fec ? 1030 : 1006;
+
+	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * overhead >> 4),
 				1000 * 8 * 54 * 1000);
 }
 EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index dd04306ba9b32..01291bbb44693 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -109,7 +109,8 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 			continue;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       bpp << 4);
+						       bpp << 4,
+						       false);
 
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
@@ -975,7 +976,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		return ret;
 
 	if (mode_rate > max_rate || mode->clock > max_dotclk ||
-	    drm_dp_calc_pbn_mode(mode->clock, min_bpp << 4) > port->full_pbn) {
+	    drm_dp_calc_pbn_mode(mode->clock, min_bpp << 4, false) > port->full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 0e1542a5b9ac1..e1c8f03e6bb57 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -967,7 +967,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 		const int clock = crtc_state->adjusted_mode.clock;
 
 		asyh->or.bpc = connector->display_info.bpc;
-		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3 << 4);
+		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3 << 4, false);
 	}
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &mstm->mgr);
diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index e3c818dfc0e6d..b8e3d9b64b3c4 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -16,6 +16,7 @@ struct drm_dp_mst_calc_pbn_mode_test {
 	const int clock;
 	const int bpp;
 	const bool dsc;
+	const bool fec;
 	const int expected;
 };
 
@@ -24,39 +25,51 @@ static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases
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
 		.bpp = 24,
 		.dsc = true,
+		.fec = false,
 		.expected = 1191
 	},
 	{
 		.clock = 324540,
 		.bpp = 24,
 		.dsc = true,
+		.fec = false,
 		.expected = 1161
 	},
+	{
+		.clock = 324540,
+		.bpp = 24,
+		.dsc = true,
+		.fec = true,
+		.expected = 1189
+	},
 };
 
 static void drm_test_dp_mst_calc_pbn_mode(struct kunit *test)
 {
 	const struct drm_dp_mst_calc_pbn_mode_test *params = test->param_value;
 
-	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp << 4),
+	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp << 4, params->fec),
 			params->expected);
 }
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 655862b3d2a49..5de0c3d28794b 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -842,7 +842,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector,
 int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count);
 
-int drm_dp_calc_pbn_mode(int clock, int bpp);
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool fec);
 
 void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
 
-- 
2.37.2

