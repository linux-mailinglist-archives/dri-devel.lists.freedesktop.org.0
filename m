Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20A9F8708
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5254E10E34B;
	Thu, 19 Dec 2024 21:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YH/3J8I2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE2010E34B;
 Thu, 19 Dec 2024 21:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644088; x=1766180088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SwSLugi9gtFPmhWp1xRl3rR0e+wFPxAcAu1V9fvcP7w=;
 b=YH/3J8I2WK6eTKEz5G29g6NxOaje73tfjVZD4BqmEzwp7RfXc4GkPjCs
 RNdAZlkM4BFeW6LcNA7H4XUSjwSqMf6qr1wlBbfU/Fq1nj5G0XcaQ0tA9
 L+QRA2FvkHg9cOFZEVBaj2xQWqXtGIVsru/nVsB2Aa35+jebY0Izm+2pn
 gT87aPLhhREfFDBDmAAtbP8LNWrQLkZmbMcw/jY2W3usxrNSiqlmdylf/
 DROZboYwetG9V3RlD5ftnpwM100+wpN+c7eUTN4CBuqoVDKQ6o+bdG3BM
 CtKwtNWdqp8jtpgczINOX9JGRAFXEwn8O74B2NubOmi+TCZ5IvXjxrR6E g==;
X-CSE-ConnectionGUID: ineHoEFGRKy6MvvROt0idA==
X-CSE-MsgGUID: bfa8iCZuQgqilFPU/3QhqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330541"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:48 -0800
X-CSE-ConnectionGUID: 0Yyk6HGkTsqUZNy5R5uF0A==
X-CSE-MsgGUID: 8986nXxdT6WqZ0nvsIAp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115631"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 06/16] drm/i915/mst: split out a helper for figuring out
 the TU
Date: Thu, 19 Dec 2024 23:33:55 +0200
Message-Id: <bde1edd1d6eac9d5e6519cb2e23b07ff6c71b181.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extract intel_dp_mtp_tu_compute_config() for figuring out the TU. Move
the link configuration and mst state access to the callers. This will be
easier to adapt to 128b/132b SST.

v2: Don't add SST stuff here yet

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 53 ++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.h |  7 +++
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 51f0248084b6..d08824d2fefe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -209,31 +209,23 @@ static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connec
 					    num_joined_pipes);
 }
 
-static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
-					      struct intel_crtc_state *crtc_state,
-					      int max_bpp, int min_bpp,
-					      struct link_config_limits *limits,
-					      struct drm_connector_state *conn_state,
-					      int step, bool dsc)
+int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
+				   struct intel_crtc_state *crtc_state,
+				   int max_bpp, int min_bpp,
+				   struct drm_connector_state *conn_state,
+				   int step, bool dsc)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct drm_atomic_state *state = crtc_state->uapi.state;
-	struct drm_dp_mst_topology_state *mst_state;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	fixed20_12 pbn_div;
 	int bpp, slots = -EINVAL;
 	int dsc_slice_count = 0;
 	int max_dpt_bpp;
 
-	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
-	if (IS_ERR(mst_state))
-		return PTR_ERR(mst_state);
-
-	crtc_state->lane_count = limits->max_lane_count;
-	crtc_state->port_clock = limits->max_rate;
-
 	if (dsc) {
 		if (!intel_dp_supports_fec(intel_dp, connector, crtc_state))
 			return -EINVAL;
@@ -241,8 +233,8 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		crtc_state->fec_enable = !intel_dp_is_uhbr(crtc_state);
 	}
 
-	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
-						      crtc_state->lane_count);
+	pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
+					   crtc_state->lane_count);
 
 	max_dpt_bpp = intel_dp_mst_max_dpt_bpp(crtc_state, dsc);
 	if (max_bpp > max_dpt_bpp) {
@@ -302,7 +294,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
 							      link_bpp_x16,
 							      remote_bw_overhead));
-		remote_tu = DIV_ROUND_UP(pbn.full, mst_state->pbn_div.full);
+		remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
 
 		/*
 		 * Aligning the TUs ensures that symbols consisting of multiple
@@ -320,7 +312,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		 * allocated for the whole path and the TUs allocated for the
 		 * first branch device's link also applies here.
 		 */
-		pbn.full = remote_tu * mst_state->pbn_div.full;
+		pbn.full = remote_tu * pbn_div.full;
 
 		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
 		crtc_state->dp_m_n.tu = remote_tu;
@@ -355,6 +347,31 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 	return 0;
 }
 
+static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
+					      struct intel_crtc_state *crtc_state,
+					      int max_bpp, int min_bpp,
+					      struct link_config_limits *limits,
+					      struct drm_connector_state *conn_state,
+					      int step, bool dsc)
+{
+	struct drm_atomic_state *state = crtc_state->uapi.state;
+	struct drm_dp_mst_topology_state *mst_state;
+
+	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
+	if (IS_ERR(mst_state))
+		return PTR_ERR(mst_state);
+
+	crtc_state->lane_count = limits->max_lane_count;
+	crtc_state->port_clock = limits->max_rate;
+
+	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
+						      crtc_state->lane_count);
+
+	return intel_dp_mtp_tu_compute_config(intel_dp, crtc_state,
+					      max_bpp, min_bpp,
+					      conn_state, step, dsc);
+}
+
 static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
 					  struct intel_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
index 8343804ce3f8..c6bdc1d190a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct drm_connector_state;
 struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
@@ -30,4 +31,10 @@ bool intel_dp_mst_crtc_needs_modeset(struct intel_atomic_state *state,
 void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp);
 bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp);
 
+int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
+				   struct intel_crtc_state *crtc_state,
+				   int max_bpp, int min_bpp,
+				   struct drm_connector_state *conn_state,
+				   int step, bool dsc);
+
 #endif /* __INTEL_DP_MST_H__ */
-- 
2.39.5

