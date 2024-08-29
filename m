Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F208965114
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDF010E76B;
	Thu, 29 Aug 2024 20:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NCJiajVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA7010E725;
 Thu, 29 Aug 2024 20:49:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THEpXM019321;
 Thu, 29 Aug 2024 20:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4GAK/z9YiqfLV1y4jyEzvDZoUYIJTuKn1mU2EbXrCHI=; b=NCJiajVcJdLdmSdl
 BUOl6I99yzbT845ACkTabkr2OIHcjz8nZjwNoAarwa5fc6XVnWNO5+oUZ/PocqCp
 2xgCw/f7b3l2EMu5a8Gww7jTpWo4GXio3RhfmfdqDQQYhjn6UWo5HjmeywwyYo+/
 66oWpQ1srCWphDUqUlvX4aJ6vnoxrZ0r4kgZubthWVfDomAXx0HVK4T/OTbfbjR+
 zPcYIeUsH1VrykJ9BFKcs2lSCPsnsAT8gW+wMA7B47HOF+niuYwrqrcrlK9BwzVL
 bGZuyxiqjWR4gUXtZBMIJHiLsvrY6M6ogRN5WmPxg/fX7A4T67DXkTdF5Rmx7TbU
 O2yBJQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putpnc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn369003416
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:02 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:35 -0700
Subject: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
In-Reply-To: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=5847;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=KXLjepDBneJjSHty/aXZSXhstveeaM7nUatiLHjqo48=;
 b=BO5r5FtR0LOmIolXR5pVT52HfZSloODTzv9XcB6f/AyPlNH3LVGGuviIZJzd90Qznk58djJCO
 JoDFjYtZQe6CArnO13KEpzbbY/i5KwPQ/MnECX0Ku+u49caNcSmmY2A
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZIE72Bm0DEE-IhELrYbNtj3NA3t5h30U
X-Proofpoint-ORIG-GUID: ZIE72Bm0DEE-IhELrYbNtj3NA3t5h30U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147
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

Reserve dedicated pingpong blocks for CWB

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 36b677cf9c7a..f1bd14d1f89e 100644
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
@@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	int num_pp, num_dsc;
+	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
+	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
+		dpu_enc->disp_info.intf_type == INTF_WB;
 
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	if (IS_ERR_OR_NULL(global_state)) {
@@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
 	/* Query resource that have been reserved in atomic check step. */
-	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
-		ARRAY_SIZE(hw_pp));
+	if (is_cwb_encoder)
+		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+			drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
+			ARRAY_SIZE(hw_pp));
+	else
+		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+			drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
+			ARRAY_SIZE(hw_pp));
+
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index c43cb55fe1d2..c87790a1b940 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_LM,
 	DPU_HW_BLK_CTL,
 	DPU_HW_BLK_PINGPONG,
+	DPU_HW_BLK_DCWB_PINGPONG,
 	DPU_HW_BLK_INTF,
 	DPU_HW_BLK_WB,
 	DPU_HW_BLK_DSPP,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 13f84375e15d..afad26556cd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
 	return -EINVAL;
 }
 
+static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
+		struct dpu_global_state *global_state, uint32_t crtc_id,
+		struct msm_display_topology *topology)
+{
+	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
+	int cwb_pp_idx[MAX_BLOCKS];
+
+	/*
+	 * Reserve additional dedicated CWB pingpong blocks for each mixer
+	 *
+	 * TODO: add support for reserving non-dedicated CWB pingpong blocks
+	 */
+	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
+			cwb_pp_count < num_cwb_pp; i++) {
+		for (int j = PINGPONG_CWB_0 - PINGPONG_0;
+				j < ARRAY_SIZE(rm->pingpong_blks); j++) {
+			/*
+			 * Odd LMs must be assigned to odd pingpongs and even
+			 * LMs with even pingpongs
+			 */
+			if (reserved_by_other(global_state->pingpong_to_crtc_id,
+						j, crtc_id) ||
+					i % 2 != j % 2)
+				continue;
+
+			cwb_pp_idx[cwb_pp_count] = j;
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
+	for (int i = 0; i < cwb_pp_count; i++)
+		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
+
+	return 0;
+}
+
 /**
  * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
  *	proposed use case requirements, incl. hardwired dependent blocks like
@@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
+	if (topology->cwb_enabled) {
+		ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
+				crtc_id, topology);
+		if (ret) {
+			DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
+			return ret;
+		}
+	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
 			topology);
@@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
+	case DPU_HW_BLK_DCWB_PINGPONG:
 		hw_blks = rm->pingpong_blks;
 		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
@@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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

-- 
2.34.1

