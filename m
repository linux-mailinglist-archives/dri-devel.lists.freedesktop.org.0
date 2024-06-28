Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3991C40E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17A810ECBD;
	Fri, 28 Jun 2024 16:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAdSg81g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592510ECB2;
 Fri, 28 Jun 2024 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593097; x=1751129097;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dUsXL0hYjRno1OpBTKc6F9Myq5yga5cW6QO/+XSToM4=;
 b=TAdSg81gCa8Rbuvtsv/BlULqcOwVFmn//1nLpOlFisP6jxgqhOc2SaEk
 TNJ/Ti4xlXlTtIM+mZC955zfsg761ZhKLhYriffOw/O1XmXR+LuGsM1Cl
 rAqToiNimZ76PJC8aPttXriWM83cTMqG4DcGhw6zkODy4DUXVWu8fN6XV
 3caNUUHrID7LO0rWZDMmSlNmaaFfe+IZO1jEvG/O33PeffK2GBDHqmG2j
 gBe+/pz5J/PoYsfOlijKoYSn1RC8K2scBgI9ZqbIeUsoSSSVmfv/JQm6q
 +35DFLbSGpWtYdcisQO5GXszerJDfPnjK2aQ7hLPOPUl6MXVShrZjVvVH Q==;
X-CSE-ConnectionGUID: 6Y06NsfrThikNkxnAedduA==
X-CSE-MsgGUID: Mn3QEoPHQxGcqphQlKGhgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620092"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:56 -0700
X-CSE-ConnectionGUID: dWSBtvIITTOuj72WfH9Vrw==
X-CSE-MsgGUID: 4tR4OXmoRxWvSR+vpR4BTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519933"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:56 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/i915: Remove DSC register dump
Date: Fri, 28 Jun 2024 19:44:50 +0300
Message-ID: <20240628164451.1177612-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

The Display Engine's DSC register values are deducted from the DSC
configuration stored in intel_crtc_state::dsc. The latter one is
dumped in a human-readable format, so dumping the register values is
redundant, remove it.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 24 ++---------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 404ed05371cb8..2e849b015e748 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -457,36 +457,30 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 		pps_val |= DSC_PPS0_422_ENABLE;
 	if (vdsc_cfg->vbr_enable)
 		pps_val |= DSC_PPS0_VBR_ENABLE;
-	drm_dbg_kms(&dev_priv->drm, "PPS0 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 0, pps_val);
 
 	/* PPS 1 */
 	pps_val = DSC_PPS1_BPP(vdsc_cfg->bits_per_pixel);
-	drm_dbg_kms(&dev_priv->drm, "PPS1 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 1, pps_val);
 
 	/* PPS 2 */
 	pps_val = DSC_PPS2_PIC_HEIGHT(vdsc_cfg->pic_height) |
 		DSC_PPS2_PIC_WIDTH(vdsc_cfg->pic_width / num_vdsc_instances);
-	drm_dbg_kms(&dev_priv->drm, "PPS2 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 2, pps_val);
 
 	/* PPS 3 */
 	pps_val = DSC_PPS3_SLICE_HEIGHT(vdsc_cfg->slice_height) |
 		DSC_PPS3_SLICE_WIDTH(vdsc_cfg->slice_width);
-	drm_dbg_kms(&dev_priv->drm, "PPS3 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 3, pps_val);
 
 	/* PPS 4 */
 	pps_val = DSC_PPS4_INITIAL_XMIT_DELAY(vdsc_cfg->initial_xmit_delay) |
 		DSC_PPS4_INITIAL_DEC_DELAY(vdsc_cfg->initial_dec_delay);
-	drm_dbg_kms(&dev_priv->drm, "PPS4 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 4, pps_val);
 
 	/* PPS 5 */
 	pps_val = DSC_PPS5_SCALE_INC_INT(vdsc_cfg->scale_increment_interval) |
 		DSC_PPS5_SCALE_DEC_INT(vdsc_cfg->scale_decrement_interval);
-	drm_dbg_kms(&dev_priv->drm, "PPS5 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 5, pps_val);
 
 	/* PPS 6 */
@@ -494,25 +488,21 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 		DSC_PPS6_FIRST_LINE_BPG_OFFSET(vdsc_cfg->first_line_bpg_offset) |
 		DSC_PPS6_FLATNESS_MIN_QP(vdsc_cfg->flatness_min_qp) |
 		DSC_PPS6_FLATNESS_MAX_QP(vdsc_cfg->flatness_max_qp);
-	drm_dbg_kms(&dev_priv->drm, "PPS6 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 6, pps_val);
 
 	/* PPS 7 */
 	pps_val = DSC_PPS7_SLICE_BPG_OFFSET(vdsc_cfg->slice_bpg_offset) |
 		DSC_PPS7_NFL_BPG_OFFSET(vdsc_cfg->nfl_bpg_offset);
-	drm_dbg_kms(&dev_priv->drm, "PPS7 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 7, pps_val);
 
 	/* PPS 8 */
 	pps_val = DSC_PPS8_FINAL_OFFSET(vdsc_cfg->final_offset) |
 		DSC_PPS8_INITIAL_OFFSET(vdsc_cfg->initial_offset);
-	drm_dbg_kms(&dev_priv->drm, "PPS8 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 8, pps_val);
 
 	/* PPS 9 */
 	pps_val = DSC_PPS9_RC_MODEL_SIZE(vdsc_cfg->rc_model_size) |
 		DSC_PPS9_RC_EDGE_FACTOR(DSC_RC_EDGE_FACTOR_CONST);
-	drm_dbg_kms(&dev_priv->drm, "PPS9 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 9, pps_val);
 
 	/* PPS 10 */
@@ -520,7 +510,6 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 		DSC_PPS10_RC_QUANT_INC_LIMIT1(vdsc_cfg->rc_quant_incr_limit1) |
 		DSC_PPS10_RC_TARGET_OFF_HIGH(DSC_RC_TGT_OFFSET_HI_CONST) |
 		DSC_PPS10_RC_TARGET_OFF_LOW(DSC_RC_TGT_OFFSET_LO_CONST);
-	drm_dbg_kms(&dev_priv->drm, "PPS10 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 10, pps_val);
 
 	/* PPS 16 */
@@ -529,31 +518,25 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 					 vdsc_cfg->slice_width) |
 		DSC_PPS16_SLICE_ROW_PER_FRAME(vdsc_cfg->pic_height /
 					      vdsc_cfg->slice_height);
-	drm_dbg_kms(&dev_priv->drm, "PPS16 = 0x%08x\n", pps_val);
 	intel_dsc_pps_write(crtc_state, 16, pps_val);
 
 	if (DISPLAY_VER(dev_priv) >= 14) {
 		/* PPS 17 */
 		pps_val = DSC_PPS17_SL_BPG_OFFSET(vdsc_cfg->second_line_bpg_offset);
-		drm_dbg_kms(&dev_priv->drm, "PPS17 = 0x%08x\n", pps_val);
 		intel_dsc_pps_write(crtc_state, 17, pps_val);
 
 		/* PPS 18 */
 		pps_val = DSC_PPS18_NSL_BPG_OFFSET(vdsc_cfg->nsl_bpg_offset) |
 			DSC_PPS18_SL_OFFSET_ADJ(vdsc_cfg->second_line_offset_adj);
-		drm_dbg_kms(&dev_priv->drm, "PPS18 = 0x%08x\n", pps_val);
 		intel_dsc_pps_write(crtc_state, 18, pps_val);
 	}
 
 	/* Populate the RC_BUF_THRESH registers */
 	memset(rc_buf_thresh_dword, 0, sizeof(rc_buf_thresh_dword));
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++)
 		rc_buf_thresh_dword[i / 4] |=
 			(u32)(vdsc_cfg->rc_buf_thresh[i] <<
 			      BITS_PER_BYTE * (i % 4));
-		drm_dbg_kms(&dev_priv->drm, "RC_BUF_THRESH_%d = 0x%08x\n", i,
-			    rc_buf_thresh_dword[i / 4]);
-	}
 	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
 		intel_de_write(dev_priv, DSCA_RC_BUF_THRESH_0,
 			       rc_buf_thresh_dword[0]);
@@ -600,7 +583,7 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 
 	/* Populate the RC_RANGE_PARAMETERS registers */
 	memset(rc_range_params_dword, 0, sizeof(rc_range_params_dword));
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++)
 		rc_range_params_dword[i / 2] |=
 			(u32)(((vdsc_cfg->rc_range_params[i].range_bpg_offset <<
 				RC_BPG_OFFSET_SHIFT) |
@@ -608,9 +591,6 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 				RC_MAX_QP_SHIFT) |
 			       (vdsc_cfg->rc_range_params[i].range_min_qp <<
 				RC_MIN_QP_SHIFT)) << 16 * (i % 2));
-		drm_dbg_kms(&dev_priv->drm, "RC_RANGE_PARAM_%d = 0x%08x\n", i,
-			    rc_range_params_dword[i / 2]);
-	}
 	if (!is_pipe_dsc(crtc, cpu_transcoder)) {
 		intel_de_write(dev_priv, DSCA_RC_RANGE_PARAMETERS_0,
 			       rc_range_params_dword[0]);
-- 
2.43.3

