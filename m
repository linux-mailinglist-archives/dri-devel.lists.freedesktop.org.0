Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CE965100
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414410E70F;
	Thu, 29 Aug 2024 20:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y/hRNcyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796E810E725;
 Thu, 29 Aug 2024 20:49:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGK98e024486;
 Thu, 29 Aug 2024 20:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SmxPX7cEtCu+YKrM4/VjO7Xh4HTNFTAXD9bnzsqPX/U=; b=Y/hRNcytnTFnYONH
 aoTzgBJGwkr1ERIJ6v6KG+5pdz0M2yTvC/U6LSsxXrzj20HM4suvTvhu85SaOoH/
 lDhPX4ANz4Ayfq001+xX0dw3pztydtCkhV8RCVKDP9B7g4ioBIHy+vM9LPdsvgzS
 fIXlX5HoyGE4iqLl5yktMxGLYMb8JtYxTtT9rw+dEIl4zXmnndCA4IcRDe6Gcr9r
 JASB8UEkzdThcOSK6XDLObIgghM6XcrqhXoeZlPrJhjD80wRFVs80MGbwD7xE3jO
 LZ6TauSIVopKnzrYzlpCSPFJSyOrttSEQ6dvZxfqxlJhzaQugnxlR+C1Z0G2E16z
 fLK+EQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puvem38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn3F9003476
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:03 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:37 -0700
Subject: [PATCH 16/21] drm/msm/dpu: Program hw_ctl to support CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-16-502b16ae2ebb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=10226;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TvS7kqWVhkk04g2QK4/rFaLgMhi7+1NbU6nSMKHgF9o=;
 b=JmD4WVUvq8v06acHbuhd64BMEhjwMxrcovX8fBGm3vCy04/bHiShlC8Yy7REBZAeFULb4foMR
 P4OgiiUoERkB/hnmfsKZaCTtiVyiJsogFh5L8PH/NQtQd7GO0hOM8el
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KMjWvFU9BkxvcFtDxjNqN3neonQZ94Gl
X-Proofpoint-GUID: KMjWvFU9BkxvcFtDxjNqN3neonQZ94Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Add support for configuring the CWB pending flush and active bits

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  8 +++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 13 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 30 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 14 +++++++++-
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0f8f6c0182d5..bde385318018 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2081,6 +2081,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 				if (phys_enc->hw_wb->ops.setup_input_ctrl)
 					phys_enc->hw_wb->ops.setup_input_ctrl(phys_enc->hw_wb,
 							cwb_idx, PINGPONG_NONE);
+
+				/* mark CWB flush as pending */
+				if (phys_enc->hw_ctl->ops.update_pending_flush_cwb)
+					phys_enc->hw_ctl->ops.update_pending_flush_cwb(ctl, cwb_idx);
 			}
 		}
 	} else {
@@ -2126,8 +2130,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	if (phys_enc->hw_intf)
 		intf_cfg.intf = phys_enc->hw_intf->idx;
-	if (phys_enc->hw_wb)
+	if (phys_enc->hw_wb) {
 		intf_cfg.wb = phys_enc->hw_wb->idx;
+		intf_cfg.cwb = dpu_enc->cwb_mask;
+	}
 
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d)
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e1ec64ffc742..6d93e6ae442d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -236,6 +236,7 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 
 		intf_cfg.intf = DPU_NONE;
 		intf_cfg.wb = hw_wb->idx;
+		intf_cfg.cwb = dpu_encoder_get_cwb_mask(phys_enc->parent);
 
 		if (mode_3d && hw_pp && hw_pp->merge_3d)
 			intf_cfg.merge_3d = hw_pp->merge_3d->idx;
@@ -314,6 +315,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_cdm *hw_cdm;
 	u32 pending_flush = 0;
+	u32 cwb_mask, cwb_idx;
 
 	if (!phys_enc)
 		return;
@@ -322,6 +324,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	hw_pp = phys_enc->hw_pp;
 	hw_ctl = phys_enc->hw_ctl;
 	hw_cdm = phys_enc->hw_cdm;
+	cwb_mask = dpu_encoder_get_cwb_mask(phys_enc->parent);
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
@@ -340,6 +343,16 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	if (hw_cdm && hw_ctl->ops.update_pending_flush_cdm)
 		hw_ctl->ops.update_pending_flush_cdm(hw_ctl, hw_cdm->idx);
 
+	for (int i = 0; i < hweight32(cwb_mask); i++) {
+		if (!(cwb_mask & (1 << i)))
+			continue;
+
+		cwb_idx = i + CWB_0;
+
+		if (hw_ctl->ops.update_pending_flush_cwb)
+			hw_ctl->ops.update_pending_flush_cwb(hw_ctl, cwb_idx);
+	}
+
 	if (hw_ctl->ops.get_pending_flush)
 		pending_flush = hw_ctl->ops.get_pending_flush(hw_ctl);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2e50049f2f85..792687b010ee 100644
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
index 4401fdc0f3e4..6972fc86d986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DPU_HW_CTL_H
@@ -51,6 +51,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	enum dpu_cdm cdm;
 	int stream_sel;
+	unsigned int cwb;
 	unsigned int dsc;
 };
 
@@ -114,6 +115,15 @@ struct dpu_hw_ctl_ops {
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
@@ -258,6 +268,7 @@ struct dpu_hw_ctl_ops {
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
  * @pending_intf_flush_mask: pending INTF flush
  * @pending_wb_flush_mask: pending WB flush
+ * @pending_cwb_flush_mask: pending CWB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
  * @ops: operation list
@@ -274,6 +285,7 @@ struct dpu_hw_ctl {
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
 	u32 pending_wb_flush_mask;
+	u32 pending_cwb_flush_mask;
 	u32 pending_periph_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];

-- 
2.34.1

