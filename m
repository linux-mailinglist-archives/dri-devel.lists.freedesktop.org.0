Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E77E7B3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C67E10E96D;
	Fri, 10 Nov 2023 10:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9E10E96A;
 Fri, 10 Nov 2023 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611384; x=1731147384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CoWkUndc8lkoYE4X8kqxx/vg7vJDne89/c1y1nIOIB4=;
 b=K87G1oApG2aurszEZmAya0iHIuu3mcAPB9mC6VUnDolhpkjLTXr0552z
 weWav+6rdw5mZHtw/EDJxus97MQmri0/rf5bHWBRA+bgYEqHfQh6vAznS
 ygJwhdD60kt0Zi42KdnhODYqkSiJshl12w9taBAM1wqST5vmgV75V3S0Q
 dUWuBR+wo95LzkvyVI6bb7hk/mhYJ08ValfMv943ErSAkUfmlpgQoxhsg
 SaqsFAzQt/sPrYWQ+0PGspjQ/g5vVOctB8ayfrEbmRBquNczEgHrC7mho
 SAWi+ZcvTNA43FK2lvClgPGxZNgj9k61VVa68GDBeybdXvNB+2kiFeruJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712800"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816403"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:21 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/11] drm/i915/display: Consider fractional vdsc bpp while
 computing m_n values
Date: Fri, 10 Nov 2023 15:40:12 +0530
Message-Id: <20231110101020.4067342-4-ankit.k.nautiyal@intel.com>
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

MTL+ supports fractional compressed bits_per_pixel, with precision of
1/16. This compressed bpp is stored in U6.4 format.
Accommodate this precision while computing m_n values.

v1:
Replace the computation of 'data_clock' with 'data_clock =
DIV_ROUND_UP(data_clock, 16).' (Sui Jingfeng).

v2:
Rebase and pass bits_per_pixel in U6.4 format.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/i915/display/intel_display.c |  4 ++--
 drivers/gpu/drm/i915/display/intel_dp.c      | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_fdi.c     |  3 ++-
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b4a8e3087e50..125903007a29 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2415,12 +2415,12 @@ add_bw_alloc_overhead(int link_clock, int bw_overhead,
 }
 
 void
-intel_link_compute_m_n(u16 bits_per_pixel, int nlanes,
+intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 		       int pixel_clock, int link_clock,
 		       int bw_overhead,
 		       struct intel_link_m_n *m_n)
 {
-	u32 data_clock = bits_per_pixel * pixel_clock;
+	u32 data_clock = DIV_ROUND_UP(bits_per_pixel_x16 * pixel_clock, 16);
 	u32 data_m;
 	u32 data_n;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4ad3718c3c7d..246f50d1f030 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2663,7 +2663,7 @@ static bool can_enable_drrs(struct intel_connector *connector,
 static void
 intel_dp_drrs_compute_config(struct intel_connector *connector,
 			     struct intel_crtc_state *pipe_config,
-			     int link_bpp)
+			     int link_bpp_x16)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *downclock_mode =
@@ -2688,7 +2688,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 	if (pipe_config->splitter.enable)
 		pixel_clock /= pipe_config->splitter.link_count;
 
-	intel_link_compute_m_n(link_bpp, pipe_config->lane_count, pixel_clock,
+	intel_link_compute_m_n(link_bpp_x16, pipe_config->lane_count, pixel_clock,
 			       pipe_config->port_clock,
 			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 			       &pipe_config->dp_m2_n2);
@@ -2792,7 +2792,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	const struct drm_display_mode *fixed_mode;
 	struct intel_connector *connector = intel_dp->attached_connector;
-	int ret = 0, link_bpp;
+	int ret = 0, link_bpp_x16;
 
 	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv) && encoder->port != PORT_A)
 		pipe_config->has_pch_encoder = true;
@@ -2841,10 +2841,10 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
 
 	if (pipe_config->dsc.compression_enable)
-		link_bpp = to_bpp_int(pipe_config->dsc.compressed_bpp_x16);
+		link_bpp_x16 = pipe_config->dsc.compressed_bpp_x16;
 	else
-		link_bpp = intel_dp_output_bpp(pipe_config->output_format,
-					       pipe_config->pipe_bpp);
+		link_bpp_x16 = to_bpp_x16(intel_dp_output_bpp(pipe_config->output_format,
+							      pipe_config->pipe_bpp));
 
 	if (intel_dp->mso_link_count) {
 		int n = intel_dp->mso_link_count;
@@ -2868,7 +2868,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
 
-	intel_link_compute_m_n(link_bpp,
+	intel_link_compute_m_n(link_bpp_x16,
 			       pipe_config->lane_count,
 			       adjusted_mode->crtc_clock,
 			       pipe_config->port_clock,
@@ -2884,7 +2884,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
-	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp);
+	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 31461ea25f7c..5c7e9d296483 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -70,7 +70,7 @@ static int intel_dp_mst_check_constraints(struct drm_i915_private *i915, int bpp
 
 static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
 				    const struct intel_connector *connector,
-				    bool ssc, bool dsc, int bpp)
+				    bool ssc, bool dsc, int bpp_x16)
 {
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
@@ -94,7 +94,7 @@ static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
 	overhead = drm_dp_bw_overhead(crtc_state->lane_count,
 				      adjusted_mode->hdisplay,
 				      dsc_slice_count,
-				      to_bpp_x16(bpp),
+				      bpp_x16,
 				      flags);
 
 	/*
@@ -107,16 +107,16 @@ static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
 static void intel_dp_mst_compute_m_n(const struct intel_crtc_state *crtc_state,
 				     const struct intel_connector *connector,
 				     bool ssc, bool dsc,
-				     int bpp,
+				     int bpp_x16,
 				     struct intel_link_m_n *m_n)
 {
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int overhead = intel_dp_mst_bw_overhead(crtc_state,
 						connector,
-						ssc, dsc, bpp);
+						ssc, dsc, bpp_x16);
 
-	intel_link_compute_m_n(bpp, crtc_state->lane_count,
+	intel_link_compute_m_n(bpp_x16, crtc_state->lane_count,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
 			       overhead,
@@ -180,9 +180,9 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 		link_bpp = dsc ? bpp :
 			intel_dp_output_bpp(crtc_state->output_format, bpp);
 
-		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc, link_bpp,
+		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc, to_bpp_x16(link_bpp),
 					 &crtc_state->dp_m_n);
-		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc, link_bpp,
+		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc, to_bpp_x16(link_bpp),
 					 &remote_m_n);
 
 		/*
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 1d87fbc1e813..295a0f24ebbf 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -339,7 +339,8 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
 
 	pipe_config->fdi_lanes = lane;
 
-	intel_link_compute_m_n(pipe_config->pipe_bpp, lane, fdi_dotclock,
+	intel_link_compute_m_n(to_bpp_x16(pipe_config->pipe_bpp),
+			       lane, fdi_dotclock,
 			       link_bw,
 			       intel_dp_bw_fec_overhead(false),
 			       &pipe_config->fdi_m_n);
-- 
2.40.1

