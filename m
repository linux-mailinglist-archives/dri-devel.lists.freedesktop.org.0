Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C54A57D5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881FD10E6AF;
	Tue,  1 Feb 2022 07:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35110E603;
 Tue,  1 Feb 2022 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643700878; x=1675236878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/mh7T78VayFsQqGGcZxb0LOHZTw0jd3pS596N08/dc=;
 b=fOK4pD3A6CkA2TzNoMu/zVAyYg37Dr/chKXD6HG4LEVlMgsQ0nGXEgfy
 76kaRbldSorJShNyi5z/EPvBfCpsA6itS0HxPu1UTVWLZSJ6JuToKZlA5
 MKXjtAVUeolKjrBU+tUAvXw/HCs4exRrOKl0Yjg11wY5tmpMbJchvJ4Y9
 2JwtwtZWX+3eAwtgwEz7DxuPnkSbfsjE/H9cPMS5m1+M7zjjB3Y4jkC/F
 Ho14gWfwvZyeHWxRW1ultsp102Ni2T5irPO7DZT9TgIoWGranJRcQrFGJ
 sfNXnJ9ItG3CCYk3QvSF45Ybk/CLr0J0Db+ehlDEw5TnCUqoe/OlPOo0R A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245227837"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245227837"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698315977"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:36 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915/display: Simplify helpers for getting DSC
 slices and bpp
Date: Tue,  1 Feb 2022 12:50:30 +0530
Message-Id: <20220201072030.1466446-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
References: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
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

v2: Added forward declaration for struct drm_display_mode.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   |  7 +++++--
 drivers/gpu/drm/i915/display/intel_hdmi.c | 24 ++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_hdmi.h |  6 ++++--
 3 files changed, 22 insertions(+), 15 deletions(-)

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
index ea2a3456bd4b..8a2941d285de 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -12,6 +12,7 @@
 #include "i915_reg.h"
 
 struct drm_connector;
+struct drm_display_mode;
 struct drm_encoder;
 struct drm_i915_private;
 struct intel_connector;
@@ -51,8 +52,9 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
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

