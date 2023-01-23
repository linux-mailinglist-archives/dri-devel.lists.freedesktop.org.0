Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E536784C8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BE010E535;
	Mon, 23 Jan 2023 18:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3E10E52B;
 Mon, 23 Jan 2023 18:25:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NFUVOH025345; Mon, 23 Jan 2023 18:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=uoBcwIUiXEq5X02y5wqlcnhiMx9It3eJGoPHPE8i1EM=;
 b=AVeeix96qQZvhXgztcT3yllRYQmx3/r8rGiH16EHLrN2y5/VAfa96u6jctSKHg+DcIyw
 B2zVyQLoQyEvxARrsbkdeG6o3s7nfZTwhnAHs03bEwa5Y+G831ITP4ldza835yKl+VTP
 kwYsAFh+sJO4YKbDroU40/0PJi1fWn/deTKQlW0iCYLpPN2x4imGDuMgmgzumVWBbpfy
 1QmiSzBlpL+SlDbkm/fr0Xg50lrzsG7o3uGw1nUs8L78SFofrGOEkG+qW0hfLRDScR60
 mWlA21dubODbH3q0M+6zmq4/73a1EEgBcdVAyrsFDHF74QJ7whbwD6Q/d6wssqiJbBht 8g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89gtbhna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIP4rU006458
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:05 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:25:04 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 11/14] drm/msm/disp/dpu1: add supports of new flush
 mechanism
Date: Mon, 23 Jan 2023 10:24:31 -0800
Message-ID: <1674498274-6010-12-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8gwiZ946bdC8T0IIYTupQDr8VBTpkG5K
X-Proofpoint-ORIG-GUID: 8gwiZ946bdC8T0IIYTupQDr8VBTpkG5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301230177
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new flushing mechanism is introduced to decouple peripheral metadata
flushing from timing engine related flush. This patch add peripheral
flushing functions.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 24 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  7 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 43 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 21 +++++++++++
 5 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 901e317..d2625b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1472,6 +1472,12 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 	if (extra_flush_bits && ctl->ops.update_pending_flush)
 		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
 
+	if (phys->hw_intf->cap->type == INTF_DP &&
+		phys->comp_type == MSM_DISPLAY_COMPRESSION_DSC &&
+						phys->comp_ratio) {
+		ctl->ops.update_pending_flush_periph(ctl, phys->hw_intf->idx);
+	}
+
 	ctl->ops.trigger_flush(ctl);
 
 	if (ctl->ops.get_pending_flush)
@@ -1814,12 +1820,18 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
 	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
 }
 
-static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
+static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
+				     struct dpu_hw_dsc *hw_dsc,
 				     struct dpu_hw_pingpong *hw_pp,
 				     struct drm_dsc_config *dsc,
 				     u32 common_mode,
 				     u32 initial_lines)
 {
+	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl;
+
+	ctl = cur_master->hw_ctl;
+
 	if (hw_dsc->ops.dsc_config)
 		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines, false);
 
@@ -1834,6 +1846,10 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
+
+	if (ctl->ops.update_pending_flush_dsc)
+		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
+
 }
 
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
@@ -1877,8 +1893,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
-		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
+					dsc_common_mode, initial_lines);
+	}
 }
 
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b2..0569b36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -200,6 +200,8 @@ struct dpu_encoder_phys {
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
 	int irq[INTR_IDX_MAX];
+	enum msm_display_compression_type comp_type;
+	u32 comp_ratio;
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 48c4810..2d864f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -427,6 +428,12 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
 		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
+	if (phys_enc->hw_intf->cap->type == INTF_DP &&
+		phys_enc->comp_type == MSM_DISPLAY_COMPRESSION_DSC &&
+					phys_enc->comp_ratio) {
+		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
+	}
+
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
 		"update pending flush ctl %d intf %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index b88a2f3..1891c57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -33,6 +33,7 @@
 #define   CTL_DSC_FLUSH                0x104
 #define   CTL_WB_FLUSH                  0x108
 #define   CTL_INTF_FLUSH                0x110
+#define   CTL_PERIPH_FLUSH              0x128
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
 
@@ -42,11 +43,13 @@
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
 #define  DSC_IDX        22
+#define  PERIPH_IDX     30
 #define  INTF_IDX       31
 #define WB_IDX          16
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
 
+
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
 	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
@@ -123,6 +126,7 @@ static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
 	trace_dpu_hw_ctl_update_pending_flush(flushbits,
 					      ctx->pending_flush_mask);
 	ctx->pending_flush_mask |= flushbits;
+
 }
 
 static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
@@ -142,6 +146,15 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
 				ctx->pending_wb_flush_mask);
 
+	if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
+				ctx->pending_periph_flush_mask);
+
+	if (ctx->pending_flush_mask & BIT(DSC_IDX)) {
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
+				ctx->pending_dsc_flush_mask);
+	}
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -281,6 +294,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(INTF_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_periph(struct dpu_hw_ctl *ctx,
+		enum dpu_intf intf)
+{
+	ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
+	ctx->pending_flush_mask |= BIT(PERIPH_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 		enum dpu_merge_3d merge_3d)
 {
@@ -288,6 +308,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_dsc dsc_num)
+{
+	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
+	ctx->pending_flush_mask |= BIT(DSC_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp)
 {
@@ -472,6 +499,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 wb_active = 0;
 	u32 mode_sel = 0;
+	u32 dsc_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -502,9 +530,11 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
-	if (cfg->dsc) {
-		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
-		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+
+	if (cfg->dsc_num) {
+		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+		dsc_active |= BIT(cfg->dsc_num - DSC_0);
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	}
 }
 
@@ -605,9 +635,16 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		ops->update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph;
+
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+
+		ops->update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 96c012e..d3faa0b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -48,6 +48,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
+	enum dpu_dsc dsc_num;
 	int stream_sel;
 	unsigned int dsc;
 };
@@ -121,6 +122,15 @@ struct dpu_hw_ctl_ops {
 		enum dpu_intf blk);
 
 	/**
+	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : interface block index
+	 */
+	void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
+		enum dpu_intf blk);
+
+	/**
 	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
@@ -156,6 +166,15 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
 		enum dpu_dspp blk);
 	/**
+	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : interface block index
+	 */
+	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
+		enum dpu_dsc blk);
+
+	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
@@ -241,7 +260,9 @@ struct dpu_hw_ctl {
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
 	u32 pending_wb_flush_mask;
+	u32 pending_periph_flush_mask;
 	u32 pending_merge_3d_flush_mask;
+	u32 pending_dsc_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

