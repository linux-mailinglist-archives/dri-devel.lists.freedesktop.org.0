Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3519D6F462B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE3D10E378;
	Tue,  2 May 2023 14:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA210E378;
 Tue,  2 May 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038354; x=1714574354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7pbRHqJuD9d0jDwayIPtbkXf7UBC2L5pObOCuIbhWDk=;
 b=DTf0IZA/xVilsh1n4DDX/0OdG+pcvYDBDzyPrg7enEaPRWqFDhh174Is
 zC4F3B37OqvYs8an9/kVerqJ8zIz3oKd4uVn3onPiBn0CslJStWOsaS4o
 Qn/3A41Hu1500ZjbHBs9ho4CR08/+dBmA8xv1y0JaH6izMo6W98+8YPcY
 XkR3tfJzk2rsh3CaYhBuhK1+InZsb1/3DKlZh3g803vhq0hB4BaMxU/G+
 jui/mIc8Jfg0MyO1vuJ4dcaCitizb+CxuE4px0PgdZHHhRxfNx/sJ27g1
 /Dy3nWUlmFdGjSo5f2ccn2djGUjbbcDA2ROfzOEDZe0yEkU2r9Bz7YK4i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396818"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396818"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991698"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991698"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:09 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/dp_mst: Fix fractional DSC bpp handling
Date: Tue,  2 May 2023 17:38:56 +0300
Message-Id: <20230502143906.2401-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, David Francis <David.Francis@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The current code does '(bpp << 4) / 16' in the MST PBN
calculation, but that is just the same as 'bpp' so the
DSC codepath achieves absolutely nothing. Fix it up so that
the fractional part of the bpp value is actually used instead
of truncated away. 64*1006 has enough zero lsbs that we can
just shift that down in the dividend and thus still manage
to stick to a 32bit divisor.

And while touching this, let's just make the whole thing more
straightforward by making the passed in bpp value .4 binary
fixed point always, instead of having to pass in different
things based on whether DSC is enabled or not.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: David Francis <David.Francis@amd.com>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: dc48529fb14e ("drm/dp_mst: Add PBN calculation for DSC modes")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 +++++--------------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  5 ++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +--
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    |  2 +-
 include/drm/display/drm_dp_mst_helper.h       |  2 +-
 7 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6cacb76f389e..7d58f08a5444 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6763,7 +6763,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 								    max_bpc);
 		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
 		clock = adjusted_mode->clock;
-		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp, false);
+		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp << 4);
 	}
 
 	dm_new_connector_state->vcpi_slots =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 994ba426ca66..eb4b666e50e8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1515,7 +1515,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	} else {
 		/* check if mode could be supported within full_pbn */
 		bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
-		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
+		pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp << 4);
 
 		if (pbn > aconnector->mst_output_port->full_pbn)
 			return DC_FAIL_BANDWIDTH_VALIDATE;
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..cd4c4f22c903 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4619,13 +4619,12 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
 
 /**
  * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
- * @clock: dot clock for the mode
- * @bpp: bpp for the mode.
- * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
+ * @clock: dot clock
+ * @bpp: bpp as .4 binary fixed point
  *
  * This uses the formula in the spec to calculate the PBN value for a mode.
  */
-int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
+int drm_dp_calc_pbn_mode(int clock, int bpp)
 {
 	/*
 	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
@@ -4636,18 +4635,9 @@ int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
 	 * peak_kbps *= (1006/1000)
 	 * peak_kbps *= (64/54)
 	 * peak_kbps *= 8    convert to bytes
-	 *
-	 * If the bpp is in units of 1/16, further divide by 16. Put this
-	 * factor in the numerator rather than the denominator to avoid
-	 * integer overflow
 	 */
-
-	if (dsc)
-		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006),
-					8 * 54 * 1000 * 1000);
-
-	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
-				8 * 54 * 1000 * 1000);
+	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
+				1000 * 8 * 54 * 1000);
 }
 EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 2c49d9ab86a2..44c15d6faac4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -109,8 +109,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 			continue;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       dsc ? bpp << 4 : bpp,
-						       dsc);
+						       bpp << 4);
 
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
@@ -936,7 +935,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		return ret;
 
 	if (mode_rate > max_rate || mode->clock > max_dotclk ||
-	    drm_dp_calc_pbn_mode(mode->clock, min_bpp, false) > port->full_pbn) {
+	    drm_dp_calc_pbn_mode(mode->clock, min_bpp << 4) > port->full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5bb777ff1313..d896cbb8cf3d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -961,8 +961,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 		const int clock = crtc_state->adjusted_mode.clock;
 
 		asyh->or.bpc = connector->display_info.bpc;
-		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
-						    false);
+		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3 << 4);
 	}
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &mstm->mgr);
diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index 545beea33e8c..39fc449148e1 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -56,7 +56,7 @@ static void drm_test_dp_mst_calc_pbn_mode(struct kunit *test)
 {
 	const struct drm_dp_mst_calc_pbn_mode_test *params = test->param_value;
 
-	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp, params->dsc),
+	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp << 4),
 			params->expected);
 }
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 32c764fb9cb5..c254500b4507 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -829,7 +829,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count);
 
-int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
+int drm_dp_calc_pbn_mode(int clock, int bpp);
 
 void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
 
-- 
2.39.2

