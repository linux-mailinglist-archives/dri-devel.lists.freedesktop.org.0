Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F7984E6A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2F10E8FD;
	Tue, 24 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Xp5OwFfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011310E770;
 Tue, 24 Sep 2024 23:00:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHbaFI004309;
 Tue, 24 Sep 2024 22:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AI8cNOBMHyCfpit/iGIWUo/yiUokSWtEs2ibOpFfo/0=; b=Xp5OwFfcuITnWk5R
 7kupjNFDAHcWKnW7nWHYbPhAeustgARgS7pR+Fxxe5jUDj1C9ZHuremkvGATprRh
 grCJZtSssdl04s4XqmAK0dxRpgpIOL4rxHZCMx1K/QBXUgAMthDSGHQHZ/mZ6dy9
 OvMUJCJxSHALkZzNL5YPVkyahLgWXiUvSk2gGU/OsY+BKWeky6hbtyfxtfmUMp9N
 Mdw3SSqYjqO/riyyq16Yt1QVt5KnfXCbAPESKE8QfUM+ES4DUtloYwgyjmJZhvo7
 GpSdoP+o8njwcTfUej2jry1tC3xTAjIHy6phrzpaVMrsJWvPdF7TWyXcKmBbeRzG
 xjLXIg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh2d6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxwRN024752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:57 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:31 -0700
Subject: [PATCH v2 15/22] drm/msm/dpu: Reserve resources for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-15-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=9883;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=2ntb9sZMuLyHLLW6rHoK24128H3F+A8m3WR/6XPy6mc=;
 b=VbqF0QmxQ05xG2jNrRDzXUePJy4MQPXFu+otUk+8RbbTDtS+KnlCx+EILIRvSxFKh944phDlj
 eoEZUwJUGiRB6q2rURmesnS7zlqAbnaLgk5in0kCuCSABuVRzJXACHq
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mbJmoqIm5opszXV4JyzpYW2bXFyszaa5
X-Proofpoint-GUID: mbJmoqIm5opszXV4JyzpYW2bXFyszaa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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

Add support for RM to reserve dedicated CWB pingpongs and CWB muxes

For concurrent writeback, even-indexed CWB muxes must be assigned to
even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
even/odd rule applies for dedicated CWB pingpongs.

Track the CWB muxes in the global state and add a CWB-specific helper to
reserve the correct CWB muxes and dedicated pingpongs following the
even/odd rule.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 84 +++++++++++++++++++++++++++++
 4 files changed, 117 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 36b677cf9c7a..b2f0bf412451 100644
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
index c43cb55fe1d2..34195bf4e270 100644
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
index 4fdc5f933261..a078b5334dc1 100644
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
index 04df3056d75a..429e432e2163 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -223,6 +223,54 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
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
+	 * Reserve additional dedicated CWB pingpong blocks and muxes for each
+	 * mixer
+	 *
+	 * TODO: add support for reserving non-dedicated CWB pingpong blocks
+	 */
+	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
+	     cwb_pp_count < num_cwb_pp; i++) {
+		for (int j = cwb_pp_start_idx;
+		     j < ARRAY_SIZE(rm->pingpong_blks); j++) {
+			/*
+			 * Odd LMs must be assigned to odd pingpongs and even
+			 * LMs with even pingpongs
+			 */
+			if (reserved_by_other(global_state->pingpong_to_crtc_id,
+					      j, crtc_id) || i % 2 != j % 2)
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
+		DPU_ERROR("Unable to reserve all cwb pingpongs\n");
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
@@ -603,6 +651,14 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
+	if (topology->cwb_enabled) {
+		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
+							    crtc_id, topology);
+		if (ret) {
+			DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
+			return ret;
+		}
+	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
 			topology);
@@ -653,6 +709,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
 			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
 	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
+	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
+			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
 }
 
 int dpu_rm_reserve(
@@ -692,6 +750,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
+	case DPU_HW_BLK_DCWB_PINGPONG:
 		hw_blks = rm->pingpong_blks;
 		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
@@ -721,6 +780,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
@@ -731,6 +795,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
@@ -801,4 +879,10 @@ void dpu_rm_print_state(struct drm_printer *p,
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

