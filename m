Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E584AA203
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 22:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615E110E2C6;
	Fri,  4 Feb 2022 21:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4710E31A;
 Fri,  4 Feb 2022 21:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644009476; x=1675545476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R4vc8veVE5vGtYvuP7FikCnvo+UspBg0N538lwNDY+A=;
 b=AS7eZP2by/Ao+XmAkDA+fEHF8PZLTYLQIljFe2JZwl6F6XuZRD86Hx0Y
 MQkjL3J5OBxoh8BrQGhknacAXbCfiYQB/27tDdP9Xe/HnNwkgSaZ466yF
 mSAQUb6oWWoyCuAqPtM19gUhKfJ6VtFIbTzy0ybXqhJy/petBTJLNrb2e o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 13:17:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 13:17:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:51 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:50 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/12] drm/msm/dpu: add changes to support writeback in hw_ctl
Date: Fri, 4 Feb 2022 13:17:17 -0800
Message-ID: <1644009445-17320-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org,
 markyacoub@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add changes to support writeback module in the dpu_hw_ctl
interface. In addition inroduce a reset_intf_cfg op to reset
the interface bits for the currently active interfaces in
the ctl path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 65 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 27 ++++++++-
 4 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940..4cb72fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
@@ -70,7 +71,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
-	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
+	ctl->ops.setup_intf_cfg(ctl, &intf_cfg, false);
 }
 
 static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89..950fcd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
+/*
+ *  Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ *  Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -290,7 +292,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
 			&timing_params, fmt);
-	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
+	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg, false);
 
 	/* setup which pp blk will connect to this intf */
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ec..a2069af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -23,8 +24,10 @@
 #define   CTL_SW_RESET                  0x030
 #define   CTL_LAYER_EXTN_OFFSET         0x40
 #define   CTL_MERGE_3D_ACTIVE           0x0E4
+#define   CTL_WB_ACTIVE                 0x0EC
 #define   CTL_INTF_ACTIVE               0x0F4
 #define   CTL_MERGE_3D_FLUSH            0x100
+#define   CTL_WB_FLUSH                  0x108
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
@@ -35,6 +38,7 @@
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
 #define  INTF_IDX       31
+#define WB_IDX          16
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
 
@@ -128,6 +132,9 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 	if (ctx->pending_flush_mask & BIT(INTF_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
 				ctx->pending_intf_flush_mask);
+	if (ctx->pending_flush_mask & BIT(WB_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
+				ctx->pending_wb_flush_mask);
 
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
@@ -248,6 +255,13 @@ static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
 	}
 }
 
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
@@ -493,10 +507,11 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 
 
 static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
-		struct dpu_hw_intf_cfg *cfg)
+		struct dpu_hw_intf_cfg *cfg, bool is_wb)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 wb_active = 0;
 	u32 mode_sel = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
@@ -509,18 +524,25 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
-	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
-	intf_active |= BIT(cfg->intf - INTF_0);
+	if (!is_wb) {
+		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
+		intf_active |= BIT(cfg->intf - INTF_0);
+	} else {
+		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
+		wb_active = BIT(cfg->wb - WB_0);
+	}
 
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
+
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
-		struct dpu_hw_intf_cfg *cfg)
+		struct dpu_hw_intf_cfg *cfg, bool is_wb)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_cfg = 0;
@@ -532,6 +554,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
 	}
 
+	if (is_wb)
+		intf_cfg |= (cfg->wb & 0x3) + 2;
+
 	switch (cfg->intf_mode_sel) {
 	case DPU_CTL_MODE_SEL_VID:
 		intf_cfg &= ~BIT(17);
@@ -549,6 +574,34 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
 }
 
+static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
+	struct dpu_hw_intf_cfg *cfg, bool is_wb)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 intf_active = 0;
+	u32 wb_active = 0;
+	u32 merge3d_active = 0;
+
+	if (cfg->merge_3d) {
+		merge3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
+		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
+			      BIT(cfg->merge_3d - MERGE_3D_0));
+	}
+
+	dpu_hw_ctl_clear_all_blendstages(ctx);
+
+	if (!is_wb) {
+		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
+		intf_active &= ~BIT(cfg->intf - INTF_0);
+		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+	} else {
+		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
+		wb_active &= ~BIT(cfg->wb - WB_0);
+		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
+	}
+}
+
+
 static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	unsigned long *fetch_active)
 {
@@ -572,10 +625,12 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf_v1;
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171..fb4baca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_CTL_H
@@ -43,6 +44,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
@@ -93,6 +95,15 @@ struct dpu_hw_ctl_ops {
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
@@ -127,9 +138,19 @@ struct dpu_hw_ctl_ops {
 	 * Setup ctl_path interface config
 	 * @ctx
 	 * @cfg    : interface config structure pointer
+	 * @is_wb  : to indicate wb mode for programming the ctl path
 	 */
 	void (*setup_intf_cfg)(struct dpu_hw_ctl *ctx,
-		struct dpu_hw_intf_cfg *cfg);
+		struct dpu_hw_intf_cfg *cfg, bool is_wb);
+
+	/**
+	 * reset ctl_path interface config
+	 * @ctx
+	 * @cfg    : interface config structure pointer
+	 * @is_wb  : to indicate wb mode for programming the ctl path
+	 */
+	void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
+		struct dpu_hw_intf_cfg *cfg, bool is_wb);
 
 	int (*reset)(struct dpu_hw_ctl *c);
 
@@ -182,6 +203,7 @@ struct dpu_hw_ctl_ops {
  * @mixer_hw_caps: mixer hardware capabilities
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
  * @pending_intf_flush_mask: pending INTF flush
+ * @pending_wb_flush_mask: pending WB flush
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -195,6 +217,7 @@ struct dpu_hw_ctl {
 	const struct dpu_lm_cfg *mixer_hw_caps;
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
+	u32 pending_wb_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 
 	/* ops */
-- 
2.7.4

