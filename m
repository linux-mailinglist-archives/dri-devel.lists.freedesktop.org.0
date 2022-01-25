Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB749AF81
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C315210EF02;
	Tue, 25 Jan 2022 09:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8710EEF3;
 Tue, 25 Jan 2022 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643101943; x=1674637943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6AmkMjRBDi+8caJAG6VytMdj5BtAs0p6ixGrOiA2R4=;
 b=kQfFCvyjSqNiMtQp+0fLnMzZ+rqaOJvStx8DKEvVCNJEe5+EsRJqz3h3
 FPn6nKKQ1FqbCsg92HR0gPdY41hpJw5W7md9yXe6zJWGHeHaD22Wf2s0Q
 FdHN+LQuhrpnz0CIIi+C1oIgxqz3S/LoXrcoEwjJRiXxScHnIxoA8m8W4
 7+4zU/RQEe5At9gKmSm3BqZy7K9kxHMnbHjXoanLl7EM6/Bei6+I2Be10
 sfHID55PEEIUScXWT9T+wqxob8WVqORTdEBDquUpci3SeYhRJHPw6rsqY
 z79mClKa0Qv1C0uiPTvgiHnSgxRHDmtgGMZWsubwYMI5YeFkXgrXHB0UL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246042341"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246042341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="695768119"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:20 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/display: Simplify helpers for getting DSC slices
 and bpp
Date: Tue, 25 Jan 2022 14:28:01 +0530
Message-Id: <20220125085801.1025521-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Genralize the helper for getting DSC slice count and compressed bpp
for HDMI sink supporting DSC.
This patch:
-Removes the assumption on the bpc and sends it as an argument for
calculating compressed bpc.
-Sends the resolution, and output format as parameters for which the
DSC paremeters are to be calculated instead of crtc_state.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   |  7 +++++--
 drivers/gpu/drm/i915/display/intel_hdmi.c | 24 ++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_hdmi.h |  5 +++--
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f7fe7de7e553..17d08f06499b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2357,7 +2357,9 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
 	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
 	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
 
-	return intel_hdmi_dsc_get_num_slices(crtc_state, pcon_max_slices,
+	return intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+					     crtc_state->output_format,
+					     pcon_max_slices,
 					     pcon_max_slice_width,
 					     hdmi_max_slices, hdmi_throughput);
 }
@@ -2374,9 +2376,10 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
 	int pcon_fractional_bpp = drm_dp_pcon_dsc_bpp_incr(intel_dp->pcon_dsc_dpcd);
 	int hdmi_max_chunk_bytes =
 		connector->display_info.hdmi.dsc_cap.total_chunk_kbytes * 1024;
+	int bpc = crtc_state->pipe_bpp / 3;
 
 	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
-				      num_slices, output_format, hdmi_all_bpp,
+				      num_slices, output_format, bpc, hdmi_all_bpp,
 				      hdmi_max_chunk_bytes);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 381a9de3a015..f75e2384da63 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3004,7 +3004,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  * intel_hdmi_dsc_get_num_slices - get no. of dsc slices based on dsc encoder
  * and dsc decoder capabilities
  *
- * @crtc_state: intel crtc_state
+ * @mode: drm_display_mode for which num of slices are needed
+ * @output_format : pipe output format
  * @src_max_slices: maximum slices supported by the DSC encoder
  * @src_max_slice_width: maximum slice width supported by DSC encoder
  * @hdmi_max_slices: maximum slices supported by sink DSC decoder
@@ -3014,7 +3015,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  * and decoder.
  */
 int
-intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
+intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+			      enum intel_output_format output_format,
 			      int src_max_slices, int src_max_slice_width,
 			      int hdmi_max_slices, int hdmi_throughput)
 {
@@ -3036,7 +3038,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 	int max_throughput; /* max clock freq. in khz per slice */
 	int max_slice_width;
 	int slice_width;
-	int pixel_clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int pixel_clock = mode->crtc_clock;
 
 	if (!hdmi_throughput)
 		return 0;
@@ -3047,8 +3049,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 	 * for 4:4:4 is 1.0. Multiplying these factors by 10 and later
 	 * dividing adjusted clock value by 10.
 	 */
-	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
-	    crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB)
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
+	    output_format == INTEL_OUTPUT_FORMAT_RGB)
 		kslice_adjust = 10;
 	else
 		kslice_adjust = 5;
@@ -3103,7 +3105,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 		else
 			return 0;
 
-		slice_width = DIV_ROUND_UP(crtc_state->hw.adjusted_mode.hdisplay, target_slices);
+		slice_width = DIV_ROUND_UP(mode->hdisplay, target_slices);
 		if (slice_width >= max_slice_width)
 			min_slices = target_slices + 1;
 	} while (slice_width >= max_slice_width);
@@ -3119,6 +3121,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
  * @slice_width: dsc slice width supported by the source and sink
  * @num_slices: num of slices supported by the source and sink
  * @output_format: video output format
+ * @bpc: bits per color
  * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
  * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
  *
@@ -3126,7 +3129,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
-		       enum intel_output_format output_format,
+		       enum intel_output_format output_format, int bpc,
 		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
 {
 	int max_dsc_bpp, min_dsc_bpp;
@@ -3144,18 +3147,17 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	 * for each bpp we check if no of bytes can be supported by HDMI sink
 	 */
 
-	/* Assuming: bpc as 8*/
 	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		min_dsc_bpp = 6;
-		max_dsc_bpp = 3 * 4; /* 3*bpc/2 */
+		max_dsc_bpp = 3 * bpc / 2;
 	} else if (output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
 		   output_format == INTEL_OUTPUT_FORMAT_RGB) {
 		min_dsc_bpp = 8;
-		max_dsc_bpp = 3 * 8; /* 3*bpc */
+		max_dsc_bpp = 3 * bpc;
 	} else {
 		/* Assuming 4:2:2 encoding */
 		min_dsc_bpp = 7;
-		max_dsc_bpp = 2 * 8; /* 2*bpc */
+		max_dsc_bpp = 2 * bpc;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index fe40e49d2962..0866bd9da7ed 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -51,8 +51,9 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink, bool ycbcr420_output);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
-			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
-int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
+			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
 int intel_hdmi_dsc_get_slice_height(int vactive);
-- 
2.25.1

