Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C88E881854
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1DC10E3DE;
	Wed, 20 Mar 2024 20:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqjq2uwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB79810E3C1;
 Wed, 20 Mar 2024 20:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710965485; x=1742501485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d98wRS0/Uaw0wR/0wCIRMluRsjucHT20LbRuYsHDCRc=;
 b=nqjq2uwFMXtuzvdAgl/sSSCtZoDQgS0qZpw72qDcr0uywTnVF2qnnfBS
 yKbbdEgXr0fBfqMGbc7HhUapl3OoG4YECsvmrHXiEGgeX0ftFBhADJwr9
 3D03sdJHrDd9yIkSX2DxnlcqXlKZzYJJjsFmBpxPMNyJCqUwuUC1Uaqx0
 wGvAXWwHzxp73hT4bE2OMUUMPsVF81qVw0M6ajt0QpV4rAsTBgcrUntYD
 PsbrW9xRMS9YVxv8Olb1gqmGWLB6MELFxFYx6CgvaTQNfTqSLWCI/VL4k
 I64iJw9MLVh555zz9v+ZOsSuwdvhPrpGHMfCdmmJQA5QaH8WDZjccSFqN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31352328"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31352328"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14246457"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:24 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/i915/dp: Fix DSC line buffer depth programming
Date: Wed, 20 Mar 2024 22:11:41 +0200
Message-ID: <20240320201152.3487892-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240320201152.3487892-1-imre.deak@intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the calculation of the DSC line buffer depth. This is limited both
by the source's and sink's maximum line buffer depth, but the former one
was not taken into account. On all Intel platform's the source's maximum
buffer depth is 13, so the overall limit is simply the minimum of the
source/sink's limit, regardless of the DSC version.

This leaves the DSI DSC line buffer depth calculation as-is, trusting
VBT.

On DSC version 1.2 for sinks reporting a maximum line buffer depth of 16
the line buffer depth was incorrectly programmed as 0, leading to a
corruption in color gradients / lines on the decompressed screen image.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++----------
 include/drm/display/drm_dsc.h           |  3 ---
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index af7ca00e9bc0a..dbe65651bf277 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -89,6 +89,9 @@
 #define DP_DSC_MAX_ENC_THROUGHPUT_0		340000
 #define DP_DSC_MAX_ENC_THROUGHPUT_1		400000
 
+/* Max DSC line buffer depth supported by HW. */
+#define INTEL_DP_DSC_MAX_LINE_BUF_DEPTH		13
+
 /* DP DSC FEC Overhead factor in ppm = 1/(0.972261) = 1.028530 */
 #define DP_DSC_FEC_OVERHEAD_FACTOR		1028530
 
@@ -1703,7 +1706,6 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
-	u8 line_buf_depth;
 	int ret;
 
 	/*
@@ -1732,20 +1734,14 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
 			connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
 			DP_DSC_RGB;
 
-	line_buf_depth = drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd);
-	if (!line_buf_depth) {
+	vdsc_cfg->line_buf_depth = min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
+				       drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
+	if (!vdsc_cfg->line_buf_depth) {
 		drm_dbg_kms(&i915->drm,
 			    "DSC Sink Line Buffer Depth invalid\n");
 		return -EINVAL;
 	}
 
-	if (vdsc_cfg->dsc_version_minor == 2)
-		vdsc_cfg->line_buf_depth = (line_buf_depth == DSC_1_2_MAX_LINEBUF_DEPTH_BITS) ?
-			DSC_1_2_MAX_LINEBUF_DEPTH_VAL : line_buf_depth;
-	else
-		vdsc_cfg->line_buf_depth = (line_buf_depth > DSC_1_1_MAX_LINEBUF_DEPTH_BITS) ?
-			DSC_1_1_MAX_LINEBUF_DEPTH_BITS : line_buf_depth;
-
 	vdsc_cfg->block_pred_enable =
 		connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
 		DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bc90273d06a62..bbbe7438473d3 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -40,9 +40,6 @@
 #define DSC_PPS_RC_RANGE_MINQP_SHIFT		11
 #define DSC_PPS_RC_RANGE_MAXQP_SHIFT		6
 #define DSC_PPS_NATIVE_420_SHIFT		1
-#define DSC_1_2_MAX_LINEBUF_DEPTH_BITS		16
-#define DSC_1_2_MAX_LINEBUF_DEPTH_VAL		0
-#define DSC_1_1_MAX_LINEBUF_DEPTH_BITS		13
 
 /**
  * struct drm_dsc_rc_range_parameters - DSC Rate Control range parameters
-- 
2.43.3

