Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B45100B5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C06910E32E;
	Tue, 26 Apr 2022 14:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1009C10E32E;
 Tue, 26 Apr 2022 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984134; x=1682520134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vxi68HRYzWuDsfED2NNhwGRJfovb/XD9ftyxBN8jRG8=;
 b=iRw21Zrqj3jh6aqcsgPz0HAL74J7E7Vp3ySjBprN2Cpyj05KsBZrzPkv
 cuPRYpU6U3+yzJ1fe8BRw1gvJ01lfKo/Jt96tDZoj3S5YSVYbTHlee31f
 5yHHqRdwSuYb5GI4RD3jOoki9Si8d37edtXzq8xa3sQoNjxpj6oeRVaAF Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 07:42:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:42:13 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:13 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:12 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v6 08/19] drm/msm/dpu: add changes to support writeback in
 hw_ctl
Date: Tue, 26 Apr 2022 07:41:25 -0700
Message-ID: <1650984096-9964-9-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add changes to support writeback module in the dpu_hw_ctl
interface.

changes in v4:
	- fix the copyright year order

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 52 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 13 ++++++++
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 524f024..254fdf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -23,10 +24,12 @@
 #define   CTL_SW_RESET                  0x030
 #define   CTL_LAYER_EXTN_OFFSET         0x40
 #define   CTL_MERGE_3D_ACTIVE           0x0E4
+#define   CTL_WB_ACTIVE                 0x0EC
 #define   CTL_INTF_ACTIVE               0x0F4
 #define   CTL_MERGE_3D_FLUSH            0x100
 #define   CTL_DSC_ACTIVE                0x0E8
 #define   CTL_DSC_FLUSH                0x104
+#define   CTL_WB_FLUSH                  0x108
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
@@ -38,6 +41,7 @@
 #define  MERGE_3D_IDX   23
 #define  DSC_IDX        22
 #define  INTF_IDX       31
+#define WB_IDX          16
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
 
@@ -135,6 +139,9 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 	if (ctx->pending_flush_mask & BIT(INTF_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
 				ctx->pending_intf_flush_mask);
+	if (ctx->pending_flush_mask & BIT(WB_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
+				ctx->pending_wb_flush_mask);
 
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
@@ -255,6 +262,26 @@ static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
 	}
 }
 
+static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
+		enum dpu_wb wb)
+{
+	switch (wb) {
+	case WB_0:
+	case WB_1:
+	case WB_2:
+		ctx->pending_flush_mask |= BIT(WB_IDX);
+	default:
+		break;
+	}
+}
+
+static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_wb wb)
+{
+	ctx->pending_wb_flush_mask |= BIT(wb - WB_0);
+	ctx->pending_flush_mask |= BIT(WB_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
 		enum dpu_intf intf)
 {
@@ -504,6 +531,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 wb_active = 0;
 	u32 mode_sel = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
@@ -520,10 +548,18 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		mode_sel |= BIT(17);
 
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
-	intf_active |= BIT(cfg->intf - INTF_0);
+	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
+
+	if (cfg->intf)
+		intf_active |= BIT(cfg->intf - INTF_0);
+
+	if (cfg->wb)
+		wb_active |= BIT(cfg->wb - WB_0);
 
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
+
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
@@ -546,6 +582,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
 	}
 
+	if (cfg->wb)
+		intf_cfg |= (cfg->wb & 0x3) + 2;
+
 	switch (cfg->intf_mode_sel) {
 	case DPU_CTL_MODE_SEL_VID:
 		intf_cfg &= ~BIT(17);
@@ -568,12 +607,13 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 wb_active = 0;
 	u32 merge3d_active = 0;
 
 	/*
 	 * This API resets each portion of the CTL path namely,
 	 * clearing the sspps staged on the lm, merge_3d block,
-	 * interfaces etc to ensure clean teardown of the pipeline.
+	 * interfaces , writeback etc to ensure clean teardown of the pipeline.
 	 * This will be used for writeback to begin with to have a
 	 * proper teardown of the writeback session but upon further
 	 * validation, this can be extended to all interfaces.
@@ -592,6 +632,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		intf_active &= ~BIT(cfg->intf - INTF_0);
 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	}
+
+	if (cfg->wb) {
+		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
+		wb_active &= ~BIT(cfg->wb - WB_0);
+		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
+	}
 }
 
 static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
@@ -622,11 +668,13 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 			dpu_hw_ctl_update_pending_flush_intf_v1;
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf;
+		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
 	}
 	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
 	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index c61a8fd..5755307 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DPU_HW_CTL_H
@@ -44,6 +45,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
@@ -102,6 +104,15 @@ struct dpu_hw_ctl_ops {
 		u32 flushbits);
 
 	/**
+	 * OR in the given flushbits to the cached pending_(wb_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : writeback block index
+	 */
+	void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
+		enum dpu_wb blk);
+
+	/**
 	 * OR in the given flushbits to the cached pending_(intf_)flush_mask
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
@@ -199,6 +210,7 @@ struct dpu_hw_ctl_ops {
  * @mixer_hw_caps: mixer hardware capabilities
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
  * @pending_intf_flush_mask: pending INTF flush
+ * @pending_wb_flush_mask: pending WB flush
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -212,6 +224,7 @@ struct dpu_hw_ctl {
 	const struct dpu_lm_cfg *mixer_hw_caps;
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
+	u32 pending_wb_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 
 	/* ops */
-- 
2.7.4

