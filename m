Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5B965118
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352310E77B;
	Thu, 29 Aug 2024 20:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mLFkgvqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ECD10E742;
 Thu, 29 Aug 2024 20:49:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THVEd9029336;
 Thu, 29 Aug 2024 20:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Aa6lH7sPEGG7HqGc3eIoP4ElKkQXZh63Yi660WPiEck=; b=mLFkgvqr7m9knRPM
 siDbcNhenRbNq3BR/DMFjhxmm2SZo9TVMkXCES8l/YUq3jeEqassJNA8b4cHcB0O
 Na/fKhar6zJgA1YJ8uC4wE07/kDNeAFgbKjZ7GtJMKoF/ouzeORiuVmxF7XZPvI3
 y5RtNi1+RaJlAqihbe+WzSxd/8AvUI6G93DnUu1IkZ4c2XAJYat2ked9rZHTooPx
 /PGQcOfHKZK4qWZJcMhOjiUq1eoYuYkf2/H05L4pQZusj1oTeTVd/c4iVJoad4LW
 h1Hvz1c5zhrxtY/q+xxNNydSEwwYJsoyZvTpqbPMCOVwJS4botAp7/Ecg0wD+zfn
 3sBxBA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuehx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn3BB003473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:03 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:36 -0700
Subject: [PATCH 15/21] drm/msm/dpu: Configure CWB in writeback encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-15-502b16ae2ebb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=9855;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Ig2dAomey3G6s4V4jnd4i3M6aLIJuteSLsPKXtBejrI=;
 b=z2PUYpbsZSrguh/9tjKnp3t89OKbCp3ICRtD9j//AO9ytLz5E//vIsS7xqIxjzjgHThy7qk50
 FgmBfsJ4MZXDN5D23rqU69eRczg6pJ14VMtNwAwvAmL88X1J3F5qFRI
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7sXBfK8wyAS__NvfSxyaEwxrjagJt5_W
X-Proofpoint-ORIG-GUID: 7sXBfK8wyAS__NvfSxyaEwxrjagJt5_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Cache the CWB block mask in the DPU virtual encoder and configure CWB
according to the CWB block mask within the writeback phys encoder

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 29 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 43 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  9 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 18 ++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 43 +++++++++++++++++++++-
 5 files changed, 139 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 99eaaca405a4..c8ef59af444c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1236,6 +1236,33 @@ static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
 	return true;
 }
 
+static void dpu_crtc_set_encoder_cwb_mask(struct drm_crtc *crtc,
+		struct drm_crtc_state *crtc_state)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	int cwb_idx = 0;
+	u32 cwb_mask = 0;
+
+	/*
+	 * Since there can only be one CWB session at a time, if the CRTC LM
+	 * starts with an even index we start with CWB_0. If the LM index is
+	 * odd, we start with CWB_1
+	 */
+	if (cstate->mixers[0].hw_lm)
+		cwb_idx = (cstate->mixers[0].hw_lm->idx - LM_0) % 2;
+
+	if (drm_crtc_in_clone_mode(crtc_state)) {
+		for (int i = 0; i < cstate->num_mixers; i++) {
+			cwb_mask |= (1 << cwb_idx);
+			cwb_idx++;
+		}
+	}
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		dpu_encoder_set_cwb_mask(drm_enc, cwb_mask);
+}
+
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
@@ -1329,6 +1356,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			!dpu_crtc_has_valid_clones(crtc, crtc_state))
 		return -EINVAL;
 
+	dpu_crtc_set_encoder_cwb_mask(crtc, crtc_state);
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f1bd14d1f89e..0f8f6c0182d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @cwb_mask:			current encoder is in clone mode
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -202,6 +203,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 cwb_mask;
 
 	bool wide_bus_en;
 
@@ -638,6 +640,33 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
 	return false;
 }
 
+void dpu_encoder_set_cwb_mask(struct drm_encoder *enc, u32 cwb_mask)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
+
+	dpu_enc->cwb_mask = cwb_mask;
+}
+
+u32 dpu_encoder_get_cwb_mask(struct drm_encoder *enc)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
+
+	if (!dpu_enc)
+		return 0;
+
+	return dpu_enc->cwb_mask;
+}
+
+bool dpu_encoder_in_clone_mode(struct drm_encoder *enc)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
+
+	if (!dpu_enc)
+		return 0;
+
+	return dpu_enc->cwb_mask != 0;
+}
+
 struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
@@ -2019,6 +2048,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 	int i;
+	enum dpu_cwb cwb_idx;
 	struct dpu_encoder_virt *dpu_enc;
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
@@ -2040,6 +2070,19 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		/* mark WB flush as pending */
 		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
 			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
+
+		if (dpu_enc->cwb_mask) {
+			for (i = 0; i < hweight32(dpu_enc->cwb_mask); i++) {
+				if (!(dpu_enc->cwb_mask & (1 << i)))
+					continue;
+
+				cwb_idx = i + CWB_0;
+
+				if (phys_enc->hw_wb->ops.setup_input_ctrl)
+					phys_enc->hw_wb->ops.setup_input_ctrl(phys_enc->hw_wb,
+							cwb_idx, PINGPONG_NONE);
+			}
+		}
 	} else {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 0d27e50384f0..131bb8b2c0ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -188,6 +188,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
  */
 bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
 
+/**
+ * dpu_encoder_set_cwb_mask - set the CWB blocks mask for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @cwb_mask:   CWB blocks mask to set for the encoder
+ */
+void dpu_encoder_set_cwb_mask(struct drm_encoder *drm_enc, u32 cwb_mask);
+
 /**
  * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e77ebe3a68da..f0e5c5b073e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
  */
 
@@ -339,6 +339,22 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_cwb_mask - get CWB blocks mask for DPU encoder
+ *   This helper function is used by physical encoders to get the CWB blocks
+ *   mask used for this encoder.
+ * @enc: Pointer to DRM encoder structure
+ */
+u32 dpu_encoder_get_cwb_mask(struct drm_encoder *enc);
+
+/**
+ * dpu_encoder_in_clone_mode - determine if DPU encoder is in clone mode
+ *   This helper is used by physical encoders to determine if the encoder is in
+ *   clone mode.
+ * @enc: Pointer to DRM encoder structure
+ */
+bool dpu_encoder_in_clone_mode(struct drm_encoder *enc);
+
 /**
  * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
  *   This helper function is used by physical encoder to get DSC config
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859ce..e1ec64ffc742 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -264,6 +264,45 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
+static void dpu_encoder_phys_wb_setup_cwb(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_wb *hw_wb;
+	struct dpu_hw_ctl *hw_ctl;
+	struct dpu_hw_pingpong *hw_pp;
+	u32 cwb_mask, cwb_idx;
+
+	if (!phys_enc)
+		return;
+
+	hw_wb = phys_enc->hw_wb;
+	hw_ctl = phys_enc->hw_ctl;
+	hw_pp = phys_enc->hw_pp;
+
+	if (!hw_wb || !hw_ctl || !hw_pp) {
+		DPU_DEBUG("[wb:%d] no ctl or pp assigned\n", hw_wb->idx - WB_0);
+		return;
+	}
+
+	cwb_mask = dpu_encoder_get_cwb_mask(phys_enc->parent);
+
+	for (int i = 0; i < hweight32(cwb_mask); i++) {
+		if (!(cwb_mask & (1 << i)))
+			continue;
+
+		cwb_idx = i + CWB_0;
+
+		if (hw_wb->ops.setup_input_ctrl)
+			hw_wb->ops.setup_input_ctrl(hw_wb, cwb_idx, hw_pp->idx + i);
+
+		/*
+		 * The CWB mux supports using LM or DSPP as tap points. For now,
+		 * always use DSPP tap point
+		 */
+		if (hw_wb->ops.setup_input_mode)
+			hw_wb->ops.setup_input_mode(hw_wb, cwb_idx, INPUT_MODE_DSPP_OUT);
+	}
+}
+
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
@@ -342,6 +381,8 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
 
+	dpu_encoder_phys_wb_setup_cwb(phys_enc);
+
 	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
 

-- 
2.34.1

