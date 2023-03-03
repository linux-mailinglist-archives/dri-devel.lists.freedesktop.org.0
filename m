Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D96A907B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 06:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD13B10E5B3;
	Fri,  3 Mar 2023 05:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828910E10A;
 Fri,  3 Mar 2023 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677821730; x=1709357730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgdYT1TPm1kL4DBDZa5e3UAX3EFNkYM2yPcv7646Xi8=;
 b=ZDMxuV3Pf8hwIZRkLIphApLcmuYiwA/zg3gokAcfoEObpBoOmwdPiaj/
 AyAErhpKiXGds/nBq7+Thn1pa2xxLvKf1MQWVTQXlhakA2j9dWtj5QlKa
 sNX6MBbMhaOFq6Rgf6BoRvb+41wmsBwX/Ug4z36q7y9qfWjxY/ifimVZ7
 DMUzLAg3hiNkAv+VFI/osUatxPqPT+Ii2xsZvAJOgxv2HfWx4tROZvjq/
 eqOHqwdon+Ayp+FkKzizbWcxUO7+oBliigz//34h172bFosvCt4Tkgvwg
 H2PkpzR1rrqjv0YOTypSlUOaFuA/wrApKqdXP0rupl0BT+4sgqvf9HWHb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318783284"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="318783284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 21:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764292581"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="764292581"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2023 21:35:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/i915/display: Fill in native_420 field
Date: Fri,  3 Mar 2023 11:04:31 +0530
Message-Id: <20230303053431.4123881-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222053153.3658345-6-suraj.kandpal@intel.com>
References: <20230222053153.3658345-6-suraj.kandpal@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have laid the groundwork for YUV420 Enablement
we fill up native_420 field in vdsc_cfg and add appropriate
checks wherever required.

---v2
-adding native_422 field as 0 [Vandita]
-filling in second_line_bpg_offset, second_line_offset_adj
and nsl_bpg_offset in vds_cfg when native_420 is true

---v3
-adding display version check to solve igt issue

--v7
-remove is_pipe_dsc check as its always true for D14 [Jani]

--v10
-keep sink capability check [Jani]
-move from !(x == y  || w == z) to x !=y && w != z [Jani]

--v11
-avoid native_420 computation if not gen14 [Uma]

--v12
-fix state mismatch issue of compressed_bpp

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c    |  2 -
 drivers/gpu/drm/i915/display/intel_dp.c   | 16 +++-
 drivers/gpu/drm/i915/display/intel_vdsc.c | 98 ++++++++++++++++++++---
 3 files changed, 100 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index b5316715bb3b..fb7efab8e9e6 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1539,8 +1539,6 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 	if (crtc_state->dsc.slice_count > 1)
 		crtc_state->dsc.dsc_split = true;
 
-	vdsc_cfg->convert_rgb = true;
-
 	/* FIXME: initialize from VBT */
 	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2649e8b8ef57..86b9348b74bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1467,9 +1467,10 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	vdsc_cfg->dsc_version_minor =
 		min(intel_dp_source_dsc_version_minor(intel_dp),
 		    intel_dp_sink_dsc_version_minor(intel_dp));
-
-	vdsc_cfg->convert_rgb = intel_dp->dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
-		DP_DSC_RGB;
+	if (vdsc_cfg->convert_rgb)
+		vdsc_cfg->convert_rgb =
+			intel_dp->dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
+			DP_DSC_RGB;
 
 	line_buf_depth = drm_dp_dsc_sink_line_buf_depth(intel_dp->dsc_dpcd);
 	if (!line_buf_depth) {
@@ -1587,6 +1588,15 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							    pipe_config->bigjoiner_pipes,
 							    pipe_bpp,
 							    timeslots);
+			/*
+			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
+			 * supported PPS value can be 63.9375 and with the further
+			 * mention that bpp should be programmed double the target bpp
+			 * restricting our target bpp to be 31.9375 at max
+			 */
+			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+				dsc_max_output_bpp = min_t(u16, dsc_max_output_bpp, 31 << 4);
+
 			if (!dsc_max_output_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
 					    "Compressed BPP not supported\n");
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index ed16f63d6355..44243fc81b46 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -460,14 +460,50 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
 	vdsc_cfg->slice_width = DIV_ROUND_UP(vdsc_cfg->pic_width,
 					     pipe_config->dsc.slice_count);
-
-	/* Gen 11 does not support YCbCr */
+	/*
+	 * According to DSC 1.2 specs if colorspace is YCbCr then convert_rgb is 0
+	 * else 1
+	 */
+	vdsc_cfg->convert_rgb = pipe_config->output_format != INTEL_OUTPUT_FORMAT_YCBCR420 &&
+				pipe_config->output_format != INTEL_OUTPUT_FORMAT_YCBCR444;
+
+	if (DISPLAY_VER(dev_priv) >= 14 &&
+	    pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		vdsc_cfg->native_420 = true;
+	/* We do not support YcBCr422 as of now */
+	vdsc_cfg->native_422 = false;
 	vdsc_cfg->simple_422 = false;
 	/* Gen 11 does not support VBR */
 	vdsc_cfg->vbr_enable = false;
 
 	/* Gen 11 only supports integral values of bpp */
 	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
+
+	/*
+	 * According to DSC 1.2 specs in Section 4.1 if native_420 is set:
+	 * -We need to double the current bpp.
+	 * -second_line_bpg_offset is 12 in general and equal to 2*(slice_height-1) if slice
+	 * height < 8.
+	 * -second_line_offset_adj is 512 as shown by emperical values to yeild best chroma
+	 * preservation in second line.
+	 * -nsl_bpg_offset is calculated as second_line_offset/slice_height -1 then rounded
+	 * up to 16 fractional bits, we left shift second line offset by 11 to preserve 11
+	 * fractional bits.
+	 */
+	if (vdsc_cfg->native_420) {
+		vdsc_cfg->bits_per_pixel <<= 1;
+
+		if (vdsc_cfg->slice_height >= 8)
+			vdsc_cfg->second_line_bpg_offset = 12;
+		else
+			vdsc_cfg->second_line_bpg_offset =
+				2 * (vdsc_cfg->slice_height - 1);
+
+		vdsc_cfg->second_line_offset_adj = 512;
+		vdsc_cfg->nsl_bpg_offset = DIV_ROUND_UP(vdsc_cfg->second_line_bpg_offset << 11,
+							vdsc_cfg->slice_height - 1);
+	}
+
 	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
 
 	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
@@ -594,8 +630,13 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 		DSC_VER_MIN_SHIFT |
 		vdsc_cfg->bits_per_component << DSC_BPC_SHIFT |
 		vdsc_cfg->line_buf_depth << DSC_LINE_BUF_DEPTH_SHIFT;
-	if (vdsc_cfg->dsc_version_minor == 2)
+	if (vdsc_cfg->dsc_version_minor == 2) {
 		pps_val |= DSC_ALT_ICH_SEL;
+		if (vdsc_cfg->native_420)
+			pps_val |= DSC_NATIVE_420_ENABLE;
+		if (vdsc_cfg->native_422)
+			pps_val |= DSC_NATIVE_422_ENABLE;
+	}
 	if (vdsc_cfg->block_pred_enable)
 		pps_val |= DSC_BLOCK_PREDICTION;
 	if (vdsc_cfg->convert_rgb)
@@ -906,6 +947,33 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 				       pps_val);
 	}
 
+	if (DISPLAY_VER(dev_priv) >= 14) {
+		/* Populate PICTURE_PARAMETER_SET_17 registers */
+		pps_val = 0;
+		pps_val |= DSC_SL_BPG_OFFSET(vdsc_cfg->second_line_bpg_offset);
+		drm_dbg_kms(&dev_priv->drm, "PPS17 = 0x%08x\n", pps_val);
+		intel_de_write(dev_priv,
+			       MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe),
+			       pps_val);
+		if (crtc_state->dsc.dsc_split)
+			intel_de_write(dev_priv,
+				       MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe),
+				       pps_val);
+
+		/* Populate PICTURE_PARAMETER_SET_18 registers */
+		pps_val = 0;
+		pps_val |= DSC_NSL_BPG_OFFSET(vdsc_cfg->nsl_bpg_offset) |
+			   DSC_SL_OFFSET_ADJ(vdsc_cfg->second_line_offset_adj);
+		drm_dbg_kms(&dev_priv->drm, "PPS18 = 0x%08x\n", pps_val);
+		intel_de_write(dev_priv,
+			       MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe),
+			       pps_val);
+		if (crtc_state->dsc.dsc_split)
+			intel_de_write(dev_priv,
+				       MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe),
+				       pps_val);
+	}
+
 	/* Populate the RC_BUF_THRESH registers */
 	memset(rc_buf_thresh_dword, 0, sizeof(rc_buf_thresh_dword));
 	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
@@ -1180,7 +1248,7 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
-	u32 dss_ctl1, dss_ctl2, val;
+	u32 dss_ctl1, dss_ctl2, pps0 = 0, pps1 = 0;
 
 	if (!intel_dsc_source_support(crtc_state))
 		return;
@@ -1203,13 +1271,21 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 
 	/* FIXME: add more state readout as needed */
 
-	/* PPS1 */
-	if (!is_pipe_dsc(crtc, cpu_transcoder))
-		val = intel_de_read(dev_priv, DSCA_PICTURE_PARAMETER_SET_1);
-	else
-		val = intel_de_read(dev_priv,
-				    ICL_DSC0_PICTURE_PARAMETER_SET_1(pipe));
-	vdsc_cfg->bits_per_pixel = val;
+	/* PPS0 & PPS1 */
+	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
+		pps1 = intel_de_read(dev_priv, DSCA_PICTURE_PARAMETER_SET_1);
+	} else {
+		pps0 = intel_de_read(dev_priv,
+				     ICL_DSC0_PICTURE_PARAMETER_SET_0(pipe));
+		pps1 = intel_de_read(dev_priv,
+				     ICL_DSC0_PICTURE_PARAMETER_SET_1(pipe));
+	}
+
+	vdsc_cfg->bits_per_pixel = pps1;
+
+	if (pps0 & DSC_NATIVE_420_ENABLE)
+		vdsc_cfg->bits_per_pixel >>= 1;
+
 	crtc_state->dsc.compressed_bpp = vdsc_cfg->bits_per_pixel >> 4;
 out:
 	intel_display_power_put(dev_priv, power_domain, wakeref);
-- 
2.25.1

