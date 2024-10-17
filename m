Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE089A17B9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8DE10E2E3;
	Thu, 17 Oct 2024 01:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ST5MHTNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FDE10E770;
 Thu, 17 Oct 2024 01:21:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGXNpE020138;
 Thu, 17 Oct 2024 01:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8WhKeSz4AKf+Fl4eRYRkspIg8lEBTt91JWhC7A9FL8Q=; b=ST5MHTNc1t3bA1KL
 OaKo/erzLNrsScH6cI3rHaSZoOzBmXxvNYtEzs/OxExlgvwIUh4kw1UkCCTO1Cvw
 nzt36xbKyKLHMJeNWPkJyJvjAK4xMogRVkjKgE5rvaW/Q9JNM2klCx0E06IiiwTE
 iWfXDhtQ19T/N5UN87SQPOsnmw2/yULMjS+jXnVP66Jza/iV7DYqVmeUSezh4Lno
 2nfqFeULwHhea+NZT5h8/uMd84CICl/gLmaH9tPbuSSVf3bSsK69SJ2T4K4jN0Wg
 S/RGoABooFx/3FdC2uwGNCfolqjzxs5YLn5d9443HeMy+6nUc5dykaEUrxxKxcph
 Fcn0Dg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0fehsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LKGa022789
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:20 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:20 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:22 -0700
Subject: [PATCH v3 16/23] drm/msm/dpu: Reserve resources for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-16-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=10051;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=MAq42oHRI4gNz8ZNLtlDXtpA1FLAewSvWTYrw7E1lqQ=;
 b=xyZbtkE+wtFKzJ/FB+Hqu2pVjjS+q4KOf6D0TwkztQamby7EsvXY/8nxxgjY14US0BkMjmpNM
 QwRNuAfHya5Cb+5s1DcBLZARiY71kZKSeIcCq6hue/LqcWD9QRTf3w1
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xweQQEBTJM0stKcDgDTeDR98svHSU7SQ
X-Proofpoint-ORIG-GUID: xweQQEBTJM0stKcDgDTeDR98svHSU7SQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008
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

Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes

For concurrent writeback, even-indexed CWB muxes must be assigned to
even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
even/odd rule applies for dedicated CWB PINGPONGs.

Track the CWB muxes in the global state and add a CWB-specific helper to
reserve the correct CWB muxes and dedicated PINGPONGs following the
even/odd rule.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 36b677cf9c7a53fdedf79107db8958a67cdd2c95..b2f0bf4124512ff9b86c6e03b74a7338037e398f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Red Hat
  * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -28,6 +28,7 @@
 #include "dpu_hw_dsc.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_hw_cdm.h"
+#include "dpu_hw_cwb.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
  * @cur_slave:		As above but for the slave encoder.
  * @hw_pp:		Handle to the pingpong blocks used for the display. No.
  *			pingpong blocks can be different than num_phys_encs.
+ * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
+ *			display. Number of CWB muxes can be different than
+ *			num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
@@ -177,6 +181,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -1053,7 +1058,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
 	int num_pp, num_dsc;
+	int num_cwb = 0;
+	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1067,6 +1075,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
+	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
+			dpu_enc->disp_info.intf_type == INTF_WB;
 
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	if (IS_ERR_OR_NULL(global_state)) {
@@ -1077,9 +1087,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
 	/* Query resource that have been reserved in atomic check step. */
-	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
-		ARRAY_SIZE(hw_pp));
+	if (is_cwb_encoder) {
+		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						       drm_enc->crtc,
+						       DPU_HW_BLK_DCWB_PINGPONG,
+						       hw_pp, ARRAY_SIZE(hw_pp));
+		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						       drm_enc->crtc,
+						       DPU_HW_BLK_CWB,
+						       hw_cwb, ARRAY_SIZE(hw_cwb));
+	} else {
+		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						       drm_enc->crtc,
+						       DPU_HW_BLK_PINGPONG, hw_pp,
+						       ARRAY_SIZE(hw_pp));
+	}
+
+	for (i = 0; i < num_cwb; i++)
+		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
+
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index c43cb55fe1d22123abc49b68d91689c637921527..34195bf4e270b7e24f2b9ba299007159a430dd3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_LM,
 	DPU_HW_BLK_CTL,
 	DPU_HW_BLK_PINGPONG,
+	DPU_HW_BLK_DCWB_PINGPONG,
 	DPU_HW_BLK_INTF,
 	DPU_HW_BLK_WB,
 	DPU_HW_BLK_DSPP,
 	DPU_HW_BLK_MERGE_3D,
 	DPU_HW_BLK_DSC,
 	DPU_HW_BLK_CDM,
+	DPU_HW_BLK_CWB,
 	DPU_HW_BLK_MAX,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4fdc5f9332610385b3642c6965f526c8442a226b..a078b5334dc196505dc02aa1053abd33a8cf3b8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -128,6 +128,7 @@ struct dpu_global_state {
 	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
 	uint32_t cdm_to_crtc_id;
+	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 04df3056d75a799ad4bdc87d6a9c97acdb990323..311651257bbd93ccdf041ffe01ace2710fe2feed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -223,6 +223,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
 	return -EINVAL;
 }
 
+static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
+						 struct dpu_global_state *global_state,
+						 uint32_t crtc_id,
+						 struct msm_display_topology *topology)
+{
+	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
+	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
+	int cwb_pp_idx[MAX_BLOCKS];
+	int cwb_mux_idx[MAX_BLOCKS];
+
+	/*
+	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
+	 * mixer
+	 *
+	 * TODO: add support reserving resources for platforms with no
+	 *       PINGPONG_CWB
+	 */
+	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
+	     cwb_pp_count < num_cwb_pp; i++) {
+		for (int j = cwb_pp_start_idx;
+		     j < ARRAY_SIZE(rm->pingpong_blks); j++) {
+			/*
+			 * Odd LMs must be assigned to odd PINGPONGs and even
+			 * LMs with even PINGPONGs
+			 */
+			if (reserved_by_other(global_state->pingpong_to_crtc_id, j, crtc_id) ||
+			    i % 2 != j % 2)
+				continue;
+
+			cwb_pp_idx[cwb_pp_count] = j;
+			cwb_mux_idx[cwb_pp_count] = j - cwb_pp_start_idx;
+			cwb_pp_count++;
+			break;
+		}
+	}
+
+	if (cwb_pp_count != num_cwb_pp) {
+		DPU_ERROR("Unable to reserve all CWB PINGPONGs\n");
+		return -ENAVAIL;
+	}
+
+	for (int i = 0; i < cwb_pp_count; i++) {
+		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
+		global_state->cwb_to_crtc_id[cwb_mux_idx[i]] = crtc_id;
+	}
+
+	return 0;
+}
+
 /**
  * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
  *	proposed use case requirements, incl. hardwired dependent blocks like
@@ -603,6 +652,12 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
+	if (topology->cwb_enabled) {
+		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
+							    crtc_id, topology);
+		if (ret)
+			return ret;
+	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
 			topology);
@@ -653,6 +708,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
 			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
 	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
+	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
+			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
 }
 
 int dpu_rm_reserve(
@@ -692,6 +749,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
+	case DPU_HW_BLK_DCWB_PINGPONG:
 		hw_blks = rm->pingpong_blks;
 		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
@@ -721,6 +779,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
 		max_blks = 1;
 		break;
+	case DPU_HW_BLK_CWB:
+		hw_blks = rm->cwb_blks;
+		hw_to_crtc_id = global_state->cwb_to_crtc_id;
+		max_blks = ARRAY_SIZE(rm->cwb_blks);
+		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
@@ -731,6 +794,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		if (hw_to_crtc_id[i] != crtc_id)
 			continue;
 
+		if (type == DPU_HW_BLK_PINGPONG) {
+			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
+
+			if (pp->idx >= PINGPONG_CWB_0)
+				continue;
+		}
+
+		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
+			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
+
+			if (pp->idx < PINGPONG_CWB_0)
+				continue;
+		}
+
 		if (num_blks == blks_size) {
 			DPU_ERROR("More than %d resources assigned to crtc %d\n",
 				  blks_size, crtc_id);
@@ -801,4 +878,10 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_crtc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tcwb=");
+	for (i = 0; i < ARRAY_SIZE(global_state->cwb_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->cwb_blks[i],
+					  global_state->cwb_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.34.1

