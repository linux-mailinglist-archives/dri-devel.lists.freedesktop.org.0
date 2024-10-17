Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B19A17AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF8B10E783;
	Thu, 17 Oct 2024 01:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IE0fbcQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7DA10E2F1;
 Thu, 17 Oct 2024 01:21:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GKIgfa011297;
 Thu, 17 Oct 2024 01:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I9PHPT1Qn7ScudIMCX1w5xFKzxNDp3MfufH+6lNtuOs=; b=IE0fbcQ5mJfiQCAh
 Cyrc08Xywz4ri8URbCKEwt2VLLy4JOPXuP/ZvEzrzL/9ZZFa0cH6Ljm+zo0mZVwn
 i8ZsBPWHKLArABUFVFcbweX9OUdOMr4gPX4Cv7wZ6r7NqinSEHqwGxHOD/i7kRoA
 y2WUI1iXMU9wL+7X/5Nut+FBKIpTXTEvM06JJUHyaaFE9uwnN2auNtr2CIakRUvp
 rnQMZng8YEjgcE0oTsXPEWDY/prHI1BE1OO842TC3krtYcmy5u4QnzM6x0YccJxT
 /CWIB6/mTHwfz5S0AWOYuUUqCB/L/oEeDALKywLus3S+xtgpbO03xFqsFN+ARFTw
 +DnF7Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5jaed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LKRv022801
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:20 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:20 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:23 -0700
Subject: [PATCH v3 17/23] drm/msm/dpu: Configure CWB in writeback encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-17-a33cf9b93835@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=7460;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=huDqaBRpey5jMVJGaKPtKxRPAh7PlyRsmV91F15UTjQ=;
 b=M25YiSaR6SB/fastSeDztRO+gAfo+wXcLU1NBvO5tr6nZJy3SYupTlB1XqcAbUvTqWcAw2NIU
 a7yfM0RCnF+BRPGfE2dCzW/wKFAaG2dJCeG6bojaXoJ27RDOKn9UnGP
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: l2v6fQba4svFDclcipRs-yTEYbr06s7K
X-Proofpoint-GUID: l2v6fQba4svFDclcipRs-yTEYbr06s7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Cache the CWB block mask in the DPU virtual encoder and configure CWB
according to the CWB block mask within the writeback phys encoder

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 75 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 12 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
 3 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b2f0bf4124512ff9b86c6e03b74a7338037e398f..2c42343bb658e0c005f359b0997e8a74f13e63f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -24,6 +24,7 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_ctl.h"
+#include "dpu_hw_cwb.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_dsc.h"
 #include "dpu_hw_merge3d.h"
@@ -139,6 +140,7 @@ enum dpu_enc_rc_states {
  *			num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
+ * @cwb_mask		Bitmask of used CWB muxes
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs
@@ -185,6 +187,7 @@ struct dpu_encoder_virt {
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
+	unsigned int cwb_mask;
 
 	bool intfs_swapped;
 
@@ -1063,6 +1066,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
+	unsigned int cwb_mask = 0;
 	int i;
 
 	if (!drm_enc) {
@@ -1103,8 +1107,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 						       ARRAY_SIZE(hw_pp));
 	}
 
-	for (i = 0; i < num_cwb; i++)
+	for (i = 0; i < num_cwb; i++) {
 		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
+		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
+	}
+
+	dpu_enc->cwb_mask = cwb_mask;
 
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
@@ -2071,6 +2079,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		}
 	}
 
+	if (dpu_enc->cwb_mask)
+		dpu_encoder_helper_phys_setup_cwb(phys_enc, false);
+
 	/* reset the merge 3D HW block */
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
@@ -2114,6 +2125,56 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
+void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
+				       bool enable)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
+	struct dpu_hw_cwb *hw_cwb;
+	struct dpu_hw_cwb_setup_cfg cwb_cfg;
+
+	struct dpu_kms *dpu_kms;
+	struct dpu_global_state *global_state;
+	struct dpu_hw_blk *rt_pp_list[MAX_CHANNELS_PER_ENC];
+	int num_pp;
+
+	if (!phys_enc->hw_wb)
+		return;
+
+	dpu_kms = phys_enc->dpu_kms;
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+					       phys_enc->parent->crtc,
+					       DPU_HW_BLK_PINGPONG, rt_pp_list,
+					       ARRAY_SIZE(rt_pp_list));
+
+	if (num_pp == 0 || num_pp > MAX_CHANNELS_PER_ENC) {
+		DPU_DEBUG_ENC(dpu_enc, "invalid num_pp %d\n", num_pp);
+		return;
+	}
+
+	/*
+	 * The CWB mux supports using LM or DSPP as tap points. For now,
+	 * always use LM tap point
+	 */
+	cwb_cfg.input = INPUT_MODE_LM_OUT;
+
+	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		hw_cwb = dpu_enc->hw_cwb[i];
+		if (!hw_cwb)
+			continue;
+
+		if (enable) {
+			struct dpu_hw_pingpong *hw_pp =
+					to_dpu_hw_pingpong(rt_pp_list[i]);
+			cwb_cfg.pp_idx = hw_pp->idx;
+		} else {
+			cwb_cfg.pp_idx = PINGPONG_NONE;
+		}
+
+		hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
+	}
+}
+
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 				       const struct msm_format *dpu_fmt,
 				       u32 output_type)
@@ -2557,6 +2618,18 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	return INTF_MODE_NONE;
 }
 
+/**
+ * dpu_encoder_helper_get_cwb_mask - get CWB blocks mask for the DPU encoder
+ * @phys_enc: Pointer to physical encoder structure
+ */
+unsigned int dpu_encoder_helper_get_cwb_mask(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *encoder = phys_enc->parent;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
+
+	return dpu_enc->cwb_mask;
+}
+
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *encoder = phys_enc->parent;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e77ebe3a68da99cc51638f225fe4b76540f9656f..6d7b797a448ce1852195d676e26955316225674d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
  */
 
@@ -331,6 +331,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 	return BLEND_3D_NONE;
 }
 
+unsigned int dpu_encoder_helper_get_cwb_mask(struct dpu_encoder_phys *phys_enc);
+
 /**
  * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
  *   This helper function is used by physical encoder to get DSC blocks mask
@@ -400,6 +402,14 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
  */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
+ * @phys_enc: Pointer to physical encoder structure
+ * @enable: Enable CWB mux
+ */
+void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
+				       bool enable);
+
 /**
  * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
  * @phys_enc: Pointer to physical encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859cec6dfc4b646200e68a748a5294ac9..e88c4d91041f237b17d18c7cd598f7307258e335 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
 
+	dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
+
 	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
 

-- 
2.34.1

