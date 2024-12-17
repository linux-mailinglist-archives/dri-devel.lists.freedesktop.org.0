Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9C9F3F2D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333BD10E826;
	Tue, 17 Dec 2024 00:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PrOcaQ46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A5D10E81A;
 Tue, 17 Dec 2024 00:43:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH02Uo8027359;
 Tue, 17 Dec 2024 00:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jwLODqYhu1R6pkmCl0yireIrFOhIw6F4+x0+5pIwMUU=; b=PrOcaQ46wHDvsNN9
 abEA7SQPPyeuTDYDE4wCSNIGvb4sBojtVblQVaEyRxuMN237h2xZriVPTh0qRRdU
 aYhHj/ywqG53s9dBUlxkyMUJgyI67xWSl1m9JNqmwi7mSSkAC4u7PtQ5rW9GT4Sp
 CJAK377o1SFZB2b2olyF9t09KhQ+KmEp4I1GUkHWw4aHfYwYbqzPnI+5HdhQa7bg
 mfci2Vu/UrH0ggraQjt3CQ7OoTxwD7X9LF4w0Wydl8MzXO1+JKwzHNIRzcpEZQ8z
 TTkq5MMClPAKykAqd7QgY/+oo72WmuqzzNgssFtxXL6zImBUmK3Yo3bGy9Wy3GP0
 SQEYoA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jxdm02hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hVRT026932
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:31 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:30 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:31 -0800
Subject: [PATCH v4 20/25] drm/msm/dpu: Support CWB in dpu_hw_ctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-20-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=10359;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=hyEv/2p93PSPKlwXoyiWeS7KpKh6p+DnYXb36MqrGVc=;
 b=jHIjuAISPEuj8feq1xBtZ7nWbUSQYUkXiQlH8bzCwHG6QpsxrMYF1bUVWj2js6iGdzRsWWCiA
 ke9R9C9BtbRCygGT2hoaoi1fUvRMZGaPnGF6beeGnK64MP5VQiRRprh
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1E2EXdGQGveWSzTP6Ul3Qhf1yb_46ejM
X-Proofpoint-ORIG-GUID: 1E2EXdGQGveWSzTP6Ul3Qhf1yb_46ejM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=961
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170004
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

The CWB mux has a pending flush bit and *_active register.

Add support for configuring them within the dpu_hw_ctl layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 13 ++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 30 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 15 ++++++++++-
 4 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 066b96601a92945defe778ea40eb9d70783a0ae1..0af813aae626853a7f75f4994999cf1ca137d342 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2263,6 +2263,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
+	intf_cfg.cwb = dpu_enc->cwb_mask;
 
 	if (phys_enc->hw_intf)
 		intf_cfg.intf = phys_enc->hw_intf->idx;
@@ -2285,6 +2286,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 	struct dpu_hw_cwb *hw_cwb;
+	struct dpu_hw_ctl *hw_ctl;
 	struct dpu_hw_cwb_setup_cfg cwb_cfg;
 
 	struct dpu_kms *dpu_kms;
@@ -2295,6 +2297,14 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	if (!phys_enc->hw_wb)
 		return;
 
+	hw_ctl = phys_enc->hw_ctl;
+
+	if (!phys_enc->hw_ctl) {
+		DPU_DEBUG("[wb:%d] no ctl assigned\n",
+			  phys_enc->hw_wb->idx - WB_0);
+		return;
+	}
+
 	dpu_kms = phys_enc->dpu_kms;
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
@@ -2327,6 +2337,9 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 		}
 
 		hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
+
+		if (hw_ctl->ops.update_pending_flush_cwb)
+			hw_ctl->ops.update_pending_flush_cwb(hw_ctl, hw_cwb->idx);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index f2cbc9335e54e826c2ebd00b3a809af41eed95a4..648e6b3aab84957ca0401cbbc25889f0bd64b71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -236,6 +236,7 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 
 		intf_cfg.intf = DPU_NONE;
 		intf_cfg.wb = hw_wb->idx;
+		intf_cfg.cwb = dpu_encoder_helper_get_cwb_mask(phys_enc);
 
 		if (mode_3d && hw_pp && hw_pp->merge_3d)
 			intf_cfg.merge_3d = hw_pp->merge_3d->idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..411a7cf088eb72f856940c09b0af9e108ccade4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -31,12 +31,14 @@
 #define   CTL_MERGE_3D_ACTIVE           0x0E4
 #define   CTL_DSC_ACTIVE                0x0E8
 #define   CTL_WB_ACTIVE                 0x0EC
+#define   CTL_CWB_ACTIVE                0x0F0
 #define   CTL_INTF_ACTIVE               0x0F4
 #define   CTL_CDM_ACTIVE                0x0F8
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
 #define   CTL_MERGE_3D_FLUSH            0x100
 #define   CTL_DSC_FLUSH                0x104
 #define   CTL_WB_FLUSH                  0x108
+#define   CTL_CWB_FLUSH                 0x10C
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
@@ -53,6 +55,7 @@
 #define  PERIPH_IDX     30
 #define  INTF_IDX       31
 #define WB_IDX          16
+#define CWB_IDX         28
 #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
@@ -110,6 +113,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	ctx->pending_flush_mask = 0x0;
 	ctx->pending_intf_flush_mask = 0;
 	ctx->pending_wb_flush_mask = 0;
+	ctx->pending_cwb_flush_mask = 0;
 	ctx->pending_merge_3d_flush_mask = 0;
 	ctx->pending_dsc_flush_mask = 0;
 	ctx->pending_cdm_flush_mask = 0;
@@ -144,6 +148,9 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 	if (ctx->pending_flush_mask & BIT(WB_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
 				ctx->pending_wb_flush_mask);
+	if (ctx->pending_flush_mask & BIT(CWB_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_CWB_FLUSH,
+				ctx->pending_cwb_flush_mask);
 
 	if (ctx->pending_flush_mask & BIT(DSPP_IDX))
 		for (dspp = DSPP_0; dspp < DSPP_MAX; dspp++) {
@@ -310,6 +317,13 @@ static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(WB_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_cwb_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_cwb cwb)
+{
+	ctx->pending_cwb_flush_mask |= BIT(cwb - CWB_0);
+	ctx->pending_flush_mask |= BIT(CWB_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
 		enum dpu_intf intf)
 {
@@ -547,6 +561,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 dsc_active = 0;
 	u32 wb_active = 0;
+	u32 cwb_active = 0;
 	u32 mode_sel = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
@@ -561,6 +576,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
+	cwb_active = DPU_REG_READ(c, CTL_CWB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
 
 	if (cfg->intf)
@@ -569,12 +585,16 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->wb)
 		wb_active |= BIT(cfg->wb - WB_0);
 
+	if (cfg->cwb)
+		cwb_active |= cfg->cwb;
+
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
+	DPU_REG_WRITE(c, CTL_CWB_ACTIVE, cwb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 
 	if (cfg->merge_3d)
@@ -624,6 +644,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
 	u32 wb_active = 0;
+	u32 cwb_active = 0;
 	u32 merge3d_active = 0;
 	u32 dsc_active;
 	u32 cdm_active;
@@ -651,6 +672,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	}
 
+	if (cfg->cwb) {
+		cwb_active = DPU_REG_READ(c, CTL_CWB_ACTIVE);
+		cwb_active &= ~cfg->cwb;
+		DPU_REG_WRITE(c, CTL_CWB_ACTIVE, cwb_active);
+	}
+
 	if (cfg->wb) {
 		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 		wb_active &= ~BIT(cfg->wb - WB_0);
@@ -703,6 +730,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
 		ops->update_pending_flush_dsc =
 			dpu_hw_ctl_update_pending_flush_dsc_v1;
 		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 85c6c835cc8780e6cb66f3a262d9897c91962935..080a9550a0cc6530b4115165dd737857b6213d15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DPU_HW_CTL_H
@@ -42,6 +42,7 @@ struct dpu_hw_stage_cfg {
  * @cdm:                   CDM block used
  * @stream_sel:            Stream selection for multi-stream interfaces
  * @dsc:                   DSC BIT masks used
+ * @cwb:                   CWB BIT masks used
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
@@ -51,6 +52,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	enum dpu_cdm cdm;
 	int stream_sel;
+	unsigned int cwb;
 	unsigned int dsc;
 };
 
@@ -114,6 +116,15 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
 		enum dpu_wb blk);
 
+	/**
+	 * OR in the given flushbits to the cached pending_(cwb_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : concurrent writeback block index
+	 */
+	void (*update_pending_flush_cwb)(struct dpu_hw_ctl *ctx,
+		enum dpu_cwb blk);
+
 	/**
 	 * OR in the given flushbits to the cached pending_(intf_)flush_mask
 	 * No effect on hardware
@@ -258,6 +269,7 @@ struct dpu_hw_ctl_ops {
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
  * @pending_intf_flush_mask: pending INTF flush
  * @pending_wb_flush_mask: pending WB flush
+ * @pending_cwb_flush_mask: pending CWB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
  * @ops: operation list
@@ -274,6 +286,7 @@ struct dpu_hw_ctl {
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
 	u32 pending_wb_flush_mask;
+	u32 pending_cwb_flush_mask;
 	u32 pending_periph_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];

-- 
2.34.1

