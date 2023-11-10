Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543097E7B4D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456C610E97C;
	Fri, 10 Nov 2023 10:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6446510E972;
 Fri, 10 Nov 2023 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611397; x=1731147397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gEH0AV6kljhYvSsRTWcBdT+k+ODd+qd5D7Ax/4KA4Ww=;
 b=GZM/9BY/Xxi6skO+BCVTVRmaf9h9qYAR7rfSPdutf+YM6FSAKFzkfD7G
 53t5110XKKmDU4RUyVJ8L+VadK0n3GeTirxqDZampSzAUKa3pFa6A1Zwj
 hyHr0RGJWeTk3RZNTR18fap0yxvxHSZbmlpWHReHpgdHuBHszOpKk27AS
 gFGAv4TlgcEakIfNhUATyOJSUd4k+LSTgEJNzzzwlhAG/OfyTvBJjj8PR
 LPBnYvO3rfn9sSySCDWrIwzsxXEcWmpoNoqc7Cp9p7DFldTKb2svmkD/w
 7RjgCsok2SlvPDChwFRp0xVmgvD75PpdgF0z09RvSSpYJZ976ccH6p9tT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712831"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816431"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:35 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/i915/dp_mst: Use precision of 1/16 for computing bpp
Date: Fri, 10 Nov 2023 15:40:18 +0530
Message-Id: <20231110101020.4067342-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify the functions to deal with bpps with 1/16 precision.
This will make way for cases when DSC with fractional bpp is used.
For bpp without DSC, there is no change, as we still use whole numbers.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 56 +++++++++++----------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 5c7e9d296483..e7806fe11b9d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -47,20 +47,21 @@
 #include "intel_vdsc.h"
 #include "skl_scaler.h"
 
-static int intel_dp_mst_check_constraints(struct drm_i915_private *i915, int bpp,
+static int intel_dp_mst_check_constraints(struct drm_i915_private *i915, int bpp_x16,
 					  const struct drm_display_mode *adjusted_mode,
 					  struct intel_crtc_state *crtc_state,
 					  bool dsc)
 {
 	if (intel_dp_is_uhbr(crtc_state) && DISPLAY_VER(i915) <= 13 && dsc) {
-		int output_bpp = bpp;
+		int output_bpp_x16 = bpp_x16;
 		/* DisplayPort 2 128b/132b, bits per lane is always 32 */
 		int symbol_clock = crtc_state->port_clock / 32;
 
-		if (output_bpp * adjusted_mode->crtc_clock >=
+		if (DIV_ROUND_UP(output_bpp_x16 * adjusted_mode->crtc_clock, 16) >=
 		    symbol_clock * 72) {
 			drm_dbg_kms(&i915->drm, "UHBR check failed(required bw %d available %d)\n",
-				    output_bpp * adjusted_mode->crtc_clock, symbol_clock * 72);
+				    DIV_ROUND_UP(output_bpp_x16 * adjusted_mode->crtc_clock, 16),
+				    symbol_clock * 72);
 			return -EINVAL;
 		}
 	}
@@ -127,8 +128,8 @@ static void intel_dp_mst_compute_m_n(const struct intel_crtc_state *crtc_state,
 
 static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 						struct intel_crtc_state *crtc_state,
-						int max_bpp,
-						int min_bpp,
+						int max_bpp_x16,
+						int min_bpp_x16,
 						struct link_config_limits *limits,
 						struct drm_connector_state *conn_state,
 						int step,
@@ -143,7 +144,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	int bpp, slots = -EINVAL;
+	int bpp_x16, slots = -EINVAL;
 	int ret = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
@@ -164,25 +165,25 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 						      crtc_state->port_clock,
 						      crtc_state->lane_count);
 
-	drm_dbg_kms(&i915->drm, "Looking for slots in range min bpp %d max bpp %d\n",
-		    min_bpp, max_bpp);
+	drm_dbg_kms(&i915->drm, "Looking for slots in range min bpp " BPP_X16_FMT " max bpp " BPP_X16_FMT "\n",
+		    BPP_X16_ARGS(min_bpp_x16), BPP_X16_ARGS(max_bpp_x16));
 
-	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
+	for (bpp_x16 = max_bpp_x16; bpp_x16 >= min_bpp_x16; bpp_x16 -= step) {
 		struct intel_link_m_n remote_m_n;
-		int link_bpp;
+		int link_bpp_x16;
 
-		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
+		drm_dbg_kms(&i915->drm, "Trying bpp " BPP_X16_FMT "\n", BPP_X16_ARGS(bpp_x16));
 
-		ret = intel_dp_mst_check_constraints(i915, bpp, adjusted_mode, crtc_state, dsc);
+		ret = intel_dp_mst_check_constraints(i915, bpp_x16, adjusted_mode, crtc_state, dsc);
 		if (ret)
 			continue;
 
-		link_bpp = dsc ? bpp :
-			intel_dp_output_bpp(crtc_state->output_format, bpp);
+		link_bpp_x16 = dsc ? bpp_x16 :
+			intel_dp_output_bpp(crtc_state->output_format, to_bpp_int(bpp_x16));
 
-		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc, to_bpp_x16(link_bpp),
+		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc, link_bpp_x16,
 					 &crtc_state->dp_m_n);
-		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc, to_bpp_x16(link_bpp),
+		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc, link_bpp_x16,
 					 &remote_m_n);
 
 		/*
@@ -225,10 +226,11 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 			    slots);
 	} else {
 		if (!dsc)
-			crtc_state->pipe_bpp = bpp;
+			crtc_state->pipe_bpp = to_bpp_int(bpp_x16);
 		else
-			crtc_state->dsc.compressed_bpp_x16 = to_bpp_x16(bpp);
-		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
+			crtc_state->dsc.compressed_bpp_x16 = bpp_x16;
+		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp " BPP_X16_FMT " dsc %d\n",
+			    slots, BPP_X16_ARGS(bpp_x16), dsc);
 	}
 
 	return slots;
@@ -246,10 +248,10 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	 * YUV420 is only half of the pipe bpp value.
 	 */
 	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
-						     to_bpp_int(limits->link.max_bpp_x16),
-						     to_bpp_int(limits->link.min_bpp_x16),
+						     limits->link.max_bpp_x16,
+						     limits->link.min_bpp_x16,
 						     limits,
-						     conn_state, 2 * 3, false);
+						     conn_state, 2 * 3 * 16, false);
 
 	if (slots < 0)
 		return slots;
@@ -325,9 +327,11 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	min_compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915, min_compressed_bpp,
 							    crtc_state->pipe_bpp);
 
-	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_compressed_bpp,
-						     min_compressed_bpp, limits,
-						     conn_state, 1, true);
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
+						     to_bpp_x16(max_compressed_bpp),
+						     to_bpp_x16(min_compressed_bpp),
+						     limits,
+						     conn_state, 16, true);
 
 	if (slots < 0)
 		return slots;
-- 
2.40.1

