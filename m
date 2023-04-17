Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68176E51B6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E26610E5E3;
	Mon, 17 Apr 2023 20:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240810E5EA;
 Mon, 17 Apr 2023 20:21:59 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9C3C53F9DD;
 Mon, 17 Apr 2023 22:21:57 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Apr 2023 22:21:55 +0200
Subject: [PATCH v2 16/17] drm/msm/dpu: Implement tearcheck support on INTF
 block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-16-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.12.2
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
PINGPONG block and into the INTF.  Implement the necessary callbacks in
the INTF block, and use these callbacks together with the INTF_TEAR
interrupts.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  11 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 160 +++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 214 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  25 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 ++
 7 files changed, 378 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe58572..cf1de5d94ce6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -666,6 +666,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	struct dpu_kms *dpu_kms;
 	struct dpu_hw_mdp *hw_mdptop;
 	struct drm_encoder *drm_enc;
+	struct dpu_encoder_phys *phys_enc;
 	int i;
 
 	if (!dpu_enc || !disp_info) {
@@ -696,12 +697,22 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
+		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
+
 		if (disp_info->is_te_using_watchdog_timer)
 			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
 		else
 			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+
+		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+			phys_enc = dpu_enc->phys_encs[i];
+
+			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+						vsync_cfg.vsync_source);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..90f177e43262 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -129,10 +129,10 @@ struct dpu_encoder_phys_ops {
 /**
  * enum dpu_intr_idx - dpu encoder interrupt index
  * @INTR_IDX_VSYNC:    Vsync interrupt for video mode panel
- * @INTR_IDX_PINGPONG: Pingpong done unterrupt for cmd mode panel
- * @INTR_IDX_UNDERRUN: Underrun unterrupt for video and cmd mode panel
- * @INTR_IDX_RDPTR:    Readpointer done unterrupt for cmd mode panel
- * @INTR_IDX_WB_DONE:  Writeback fone interrupt for virtual connector
+ * @INTR_IDX_PINGPONG: Pingpong done interrupt for cmd mode panel
+ * @INTR_IDX_UNDERRUN: Underrun interrupt for video and cmd mode panel
+ * @INTR_IDX_RDPTR:    Readpointer done interrupt for cmd mode panel
+ * @INTR_IDX_WB_DONE:  Writeback done interrupt for virtual connector
  */
 enum dpu_intr_idx {
 	INTR_IDX_VSYNC,
@@ -176,6 +176,7 @@ enum dpu_intr_idx {
  *                              pending.
  * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
  * @irq:			IRQ indices
+ * @has_intf_te:		Interface TE configuration support
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
@@ -200,6 +201,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
 	int irq[INTR_IDX_MAX];
+	bool has_intf_te;
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 1df3745224f5..d8ed85a238af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -97,13 +97,18 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("pp_done_irq");
 }
 
-static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (!phys_enc->hw_pp)
-		return;
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf)
+			return;
+	} else {
+		if (!phys_enc->hw_pp)
+			return;
+	}
 
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
@@ -144,7 +149,10 @@ static void dpu_encoder_phys_cmd_atomic_mode_set(
 
 	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
 
-	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
 
 	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 }
@@ -255,7 +263,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_RDPTR],
-				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
+				dpu_encoder_phys_cmd_te_rd_ptr_irq,
 				phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
@@ -319,19 +327,26 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	u32 vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	mode = &phys_enc->cached_mode;
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf ||
+		    !phys_enc->hw_intf->ops.enable_tearcheck) {
+			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+			return;
+		}
 
-	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+		DPU_DEBUG_CMDENC(cmd_enc, "");
+	} else {
+		if (!phys_enc->hw_pp ||
+		    !phys_enc->hw_pp->ops.enable_tearcheck) {
+			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+			return;
+		}
 
-	if (!phys_enc->hw_pp->ops.enable_tearcheck) {
-		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-		return;
+		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
 	}
 
+	mode = &phys_enc->cached_mode;
+
 	dpu_kms = phys_enc->dpu_kms;
 
 	/*
@@ -366,23 +381,24 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc %d vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
-		phys_enc->hw_pp->idx - PINGPONG_0, vsync_hz,
-		mode->vtotal, drm_mode_vrefresh(mode));
+		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc %d enable %u start_pos %u rd_ptr_irq %u\n",
-		phys_enc->hw_pp->idx - PINGPONG_0, tc_enable, tc_cfg.start_pos,
-		tc_cfg.rd_ptr_irq);
+		"tc enable %u start_pos %u rd_ptr_irq %u\n",
+		tc_enable, tc_cfg.start_pos, tc_cfg.rd_ptr_irq);
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc %d hw_vsync_mode %u vsync_count %u vsync_init_val %u\n",
-		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.hw_vsync_mode,
-		tc_cfg.vsync_count, tc_cfg.vsync_init_val);
+		"tc hw_vsync_mode %u vsync_count %u vsync_init_val %u\n",
+		tc_cfg.hw_vsync_mode, tc_cfg.vsync_count,
+		tc_cfg.vsync_init_val);
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc %d cfgheight %u thresh_start %u thresh_cont %u\n",
-		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
-		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
-
-	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, &tc_cfg);
+		"tc cfgheight %u thresh_start %u thresh_cont %u\n",
+		tc_cfg.sync_cfg_height, tc_cfg.sync_threshold_start,
+		tc_cfg.sync_threshold_continue);
+
+	if (phys_enc->has_intf_te)
+		phys_enc->hw_intf->ops.enable_tearcheck(phys_enc->hw_intf, &tc_cfg);
+	else
+		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, &tc_cfg);
 }
 
 static void _dpu_encoder_phys_cmd_pingpong_config(
@@ -459,11 +475,19 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 static void _dpu_encoder_phys_cmd_connect_te(
 		struct dpu_encoder_phys *phys_enc, bool enable)
 {
-	if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
-		return;
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.connect_external_te)
+			return;
 
-	trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
-	phys_enc->hw_pp->ops.connect_external_te(phys_enc->hw_pp, enable);
+		trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
+		phys_enc->hw_intf->ops.connect_external_te(phys_enc->hw_intf, enable);
+	} else {
+		if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
+			return;
+
+		trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
+		phys_enc->hw_pp->ops.connect_external_te(phys_enc->hw_pp, enable);
+	}
 }
 
 static void dpu_encoder_phys_cmd_prepare_idle_pc(
@@ -476,17 +500,21 @@ static int dpu_encoder_phys_cmd_get_line_count(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_pingpong *hw_pp;
-
-	if (!phys_enc->hw_pp)
-		return -EINVAL;
+	struct dpu_hw_intf *hw_intf;
 
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return -EINVAL;
 
+	if (phys_enc->has_intf_te) {
+		hw_intf = phys_enc->hw_intf;
+		if (!hw_intf || !hw_intf->ops.get_line_count)
+			return -EINVAL;
+		return hw_intf->ops.get_line_count(hw_intf);
+	}
+
 	hw_pp = phys_enc->hw_pp;
-	if (!hw_pp->ops.get_line_count)
+	if (!hw_pp || !hw_pp->ops.get_line_count)
 		return -EINVAL;
-
 	return hw_pp->ops.get_line_count(hw_pp);
 }
 
@@ -496,21 +524,31 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		to_dpu_encoder_phys_cmd(phys_enc);
 	struct dpu_hw_ctl *ctl;
 
-	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	DRM_DEBUG_KMS("id:%u pp:%d state:%d\n", DRMID(phys_enc->parent),
-		      phys_enc->hw_pp->idx - PINGPONG_0,
-		      phys_enc->enable_state);
-
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
 		DPU_ERROR_CMDENC(cmd_enc, "already disabled\n");
 		return;
 	}
 
-	if (phys_enc->hw_pp->ops.disable_tearcheck)
-		phys_enc->hw_pp->ops.disable_tearcheck(phys_enc->hw_pp);
+	if (phys_enc->has_intf_te) {
+		DRM_DEBUG_KMS("id:%u intf:%d state:%d\n", DRMID(phys_enc->parent),
+			      phys_enc->hw_intf->idx - INTF_0,
+			      phys_enc->enable_state);
+
+		if (phys_enc->hw_intf->ops.disable_tearcheck)
+			phys_enc->hw_intf->ops.disable_tearcheck(phys_enc->hw_intf);
+	} else {
+		if (!phys_enc->hw_pp) {
+			DPU_ERROR("invalid encoder\n");
+			return;
+		}
+
+		DRM_DEBUG_KMS("id:%u pp:%d state:%d\n", DRMID(phys_enc->parent),
+			      phys_enc->hw_pp->idx - PINGPONG_0,
+			      phys_enc->enable_state);
+
+		if (phys_enc->hw_pp->ops.disable_tearcheck)
+			phys_enc->hw_pp->ops.disable_tearcheck(phys_enc->hw_pp);
+	}
 
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
@@ -572,15 +610,26 @@ static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
 	if (!phys_enc)
 		return;
-	if (!phys_enc->hw_pp)
-		return;
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return;
 
-	if (phys_enc->hw_pp->ops.disable_autorefresh) {
-		phys_enc->hw_pp->ops.disable_autorefresh(phys_enc->hw_pp,
-							 DRMID(phys_enc->parent),
-							 phys_enc->cached_mode.vdisplay);
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf->ops.disable_autorefresh)
+			return;
+
+		phys_enc->hw_intf->ops.disable_autorefresh(
+				phys_enc->hw_intf,
+				DRMID(phys_enc->parent),
+				phys_enc->cached_mode.vdisplay);
+	} else {
+		if (!phys_enc->hw_pp ||
+		    !phys_enc->hw_pp->ops.disable_autorefresh)
+			return;
+
+		phys_enc->hw_pp->ops.disable_autorefresh(
+				phys_enc->hw_pp,
+				DRMID(phys_enc->parent),
+				phys_enc->cached_mode.vdisplay);
 	}
 }
 
@@ -658,7 +707,7 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 
 	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
 			phys_enc->irq[INTR_IDX_RDPTR],
-			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
+			dpu_encoder_phys_cmd_te_rd_ptr_irq,
 			&wait_info);
 
 	return rc;
@@ -732,6 +781,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
 		phys_enc->irq[i] = -EINVAL;
 
+	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
+			&phys_enc->dpu_kms->catalog->intf[p->intf_idx - INTF_0].features);
+
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1491568f86fc..2c28532f9ca3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -8,6 +8,9 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_intf.h"
 #include "dpu_kms.h"
+#include "dpu_trace.h"
+
+#include <linux/iopoll.h>
 
 #define INTF_TIMING_ENGINE_EN           0x000
 #define INTF_CONFIG                     0x004
@@ -64,6 +67,24 @@
 
 #define INTF_MUX                        0x25C
 #define INTF_STATUS                     0x26C
+#define INTF_AVR_CONTROL                0x270
+#define INTF_AVR_MODE                   0x274
+#define INTF_AVR_TRIGGER                0x278
+#define INTF_AVR_VTOTAL                 0x27C
+#define INTF_TEAR_MDP_VSYNC_SEL         0x280
+#define INTF_TEAR_TEAR_CHECK_EN         0x284
+#define INTF_TEAR_SYNC_CONFIG_VSYNC     0x288
+#define INTF_TEAR_SYNC_CONFIG_HEIGHT    0x28C
+#define INTF_TEAR_SYNC_WRCOUNT          0x290
+#define INTF_TEAR_VSYNC_INIT_VAL        0x294
+#define INTF_TEAR_INT_COUNT_VAL         0x298
+#define INTF_TEAR_SYNC_THRESH           0x29C
+#define INTF_TEAR_START_POS             0x2A0
+#define INTF_TEAR_RD_PTR_IRQ            0x2A4
+#define INTF_TEAR_WR_PTR_IRQ            0x2A8
+#define INTF_TEAR_OUT_LINE_COUNT        0x2AC
+#define INTF_TEAR_LINE_COUNT            0x2B0
+#define INTF_TEAR_AUTOREFRESH_CONFIG    0x2B4
 
 #define INTF_CFG_ACTIVE_H_EN	BIT(29)
 #define INTF_CFG_ACTIVE_V_EN	BIT(30)
@@ -335,6 +356,191 @@ static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
 	return dpu_hw_collect_misr(&intf->hw, INTF_MISR_CTRL, INTF_MISR_SIGNATURE, misr_value);
 }
 
+static int dpu_hw_intf_enable_te(struct dpu_hw_intf *intf,
+		struct dpu_hw_tear_check *te)
+{
+	struct dpu_hw_blk_reg_map *c;
+	int cfg;
+
+	if (!intf)
+		return -EINVAL;
+
+	c = &intf->hw;
+
+	cfg = BIT(19); /* VSYNC_COUNTER_EN */
+	if (te->hw_vsync_mode)
+		cfg |= BIT(20);
+
+	cfg |= te->vsync_count;
+
+	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_VSYNC, cfg);
+	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_HEIGHT, te->sync_cfg_height);
+	DPU_REG_WRITE(c, INTF_TEAR_VSYNC_INIT_VAL, te->vsync_init_val);
+	DPU_REG_WRITE(c, INTF_TEAR_RD_PTR_IRQ, te->rd_ptr_irq);
+	DPU_REG_WRITE(c, INTF_TEAR_START_POS, te->start_pos);
+	DPU_REG_WRITE(c, INTF_TEAR_SYNC_THRESH,
+			((te->sync_threshold_continue << 16) |
+			 te->sync_threshold_start));
+	DPU_REG_WRITE(c, INTF_TEAR_SYNC_WRCOUNT,
+			(te->start_pos + te->sync_threshold_start + 1));
+
+	DPU_REG_WRITE(c, INTF_TEAR_TEAR_CHECK_EN, 1);
+
+	return 0;
+}
+
+static void dpu_hw_intf_setup_autorefresh_config(struct dpu_hw_intf *intf,
+		u32 frame_count, bool enable)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 refresh_cfg;
+
+	c = &intf->hw;
+	refresh_cfg = DPU_REG_READ(c, INTF_TEAR_AUTOREFRESH_CONFIG);
+	if (enable)
+		refresh_cfg = BIT(31) | frame_count;
+	else
+		refresh_cfg &= ~BIT(31);
+
+	DPU_REG_WRITE(c, INTF_TEAR_AUTOREFRESH_CONFIG, refresh_cfg);
+}
+
+/*
+ * dpu_hw_intf_get_autorefresh_config - Get autorefresh config from HW
+ * @intf:        DPU intf structure
+ * @frame_count: Used to return the current frame count from hw
+ *
+ * Returns: True if autorefresh enabled, false if disabled.
+ */
+static bool dpu_hw_intf_get_autorefresh_config(struct dpu_hw_intf *intf,
+		u32 *frame_count)
+{
+	u32 val = DPU_REG_READ(&intf->hw, INTF_TEAR_AUTOREFRESH_CONFIG);
+
+	if (frame_count != NULL)
+		*frame_count = val & 0xffff;
+	return !!((val & BIT(31)) >> 31);
+}
+
+static int dpu_hw_intf_disable_te(struct dpu_hw_intf *intf)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return -EINVAL;
+
+	c = &intf->hw;
+	DPU_REG_WRITE(c, INTF_TEAR_TEAR_CHECK_EN, 0);
+	return 0;
+}
+
+static int dpu_hw_intf_connect_external_te(struct dpu_hw_intf *intf,
+		bool enable_external_te)
+{
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
+	u32 cfg;
+	int orig;
+
+	if (!intf)
+		return -EINVAL;
+
+	c = &intf->hw;
+	cfg = DPU_REG_READ(c, INTF_TEAR_SYNC_CONFIG_VSYNC);
+	orig = (bool)(cfg & BIT(20));
+	if (enable_external_te)
+		cfg |= BIT(20);
+	else
+		cfg &= ~BIT(20);
+	DPU_REG_WRITE(c, INTF_TEAR_SYNC_CONFIG_VSYNC, cfg);
+	trace_dpu_intf_connect_ext_te(intf->idx - INTF_0, cfg);
+
+	return orig;
+}
+
+static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
+		struct dpu_hw_pp_vsync_info *info)
+{
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
+	u32 val;
+
+	if (!intf || !info)
+		return -EINVAL;
+
+	c = &intf->hw;
+
+	val = DPU_REG_READ(c, INTF_TEAR_VSYNC_INIT_VAL);
+	info->rd_ptr_init_val = val & 0xffff;
+
+	val = DPU_REG_READ(c, INTF_TEAR_INT_COUNT_VAL);
+	info->rd_ptr_frame_count = (val & 0xffff0000) >> 16;
+	info->rd_ptr_line_count = val & 0xffff;
+
+	val = DPU_REG_READ(c, INTF_TEAR_LINE_COUNT);
+	info->wr_ptr_line_count = val & 0xffff;
+
+	val = DPU_REG_READ(c, INTF_FRAME_COUNT);
+	info->intf_frame_count = val;
+
+	return 0;
+}
+
+static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
+		u32 vsync_source)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
+					    uint32_t encoder_id, u16 vdisplay)
+{
+	struct dpu_hw_pp_vsync_info info;
+	int trial = 0;
+
+	/* If autorefresh is already disabled, we have nothing to do */
+	if (!dpu_hw_intf_get_autorefresh_config(intf, NULL))
+		return;
+
+	/*
+	 * If autorefresh is enabled, disable it and make sure it is safe to
+	 * proceed with current frame commit/push. Sequence followed is,
+	 * 1. Disable TE
+	 * 2. Disable autorefresh config
+	 * 4. Poll for frame transfer ongoing to be false
+	 * 5. Enable TE back
+	 */
+
+	dpu_hw_intf_connect_external_te(intf, false);
+	dpu_hw_intf_setup_autorefresh_config(intf, 0, false);
+
+	do {
+		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
+		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
+				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
+			DPU_ERROR("enc%d intf%d disable autorefresh failed\n",
+				  encoder_id, intf->idx - INTF_0);
+			break;
+		}
+
+		trial++;
+
+		dpu_hw_intf_get_vsync_info(intf, &info);
+	} while (info.wr_ptr_line_count > 0 &&
+		 info.wr_ptr_line_count < vdisplay);
+
+	dpu_hw_intf_connect_external_te(intf, true);
+
+	DPU_DEBUG("enc%d intf%d disabled autorefresh\n",
+		  encoder_id, intf->idx - INTF_0);
+
+}
+
 static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		unsigned long cap)
 {
@@ -347,6 +553,14 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 	ops->setup_misr = dpu_hw_intf_setup_misr;
 	ops->collect_misr = dpu_hw_intf_collect_misr;
+
+	if (cap & BIT(DPU_INTF_TE)) {
+		ops->enable_tearcheck = dpu_hw_intf_enable_te;
+		ops->disable_tearcheck = dpu_hw_intf_disable_te;
+		ops->connect_external_te = dpu_hw_intf_connect_external_te;
+		ops->vsync_sel = dpu_hw_intf_vsync_sel;
+		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
+	}
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 643dd10bc030..0d2686a380ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -60,6 +60,16 @@ struct intf_status {
  *                     feed pixels to this interface
  * @setup_misr: enable/disable MISR
  * @collect_misr: read MISR signature
+ * @enable_tearcheck:           Enables vsync generation and sets up init value of read
+ *                              pointer and programs the tear check configuration
+ * @disable_tearcheck:          Disables tearcheck block
+ * @connect_external_te:        Read, modify, write to either set or clear listening to external TE
+ *                              Return: 1 if TE was originally connected, 0 if not, or -ERROR
+ * @get_vsync_info:             Provides the programmed and current line_count
+ * @setup_autorefresh:          Configure and enable the autorefresh config
+ * @get_autorefresh:            Retrieve autorefresh config from hardware
+ *                              Return: 0 on success, -ETIMEDOUT on timeout
+ * @vsync_sel:                  Select vsync signal for tear-effect configuration
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -82,6 +92,21 @@ struct dpu_hw_intf_ops {
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
+
+	// Tearcheck on INTF since DPU 5.0.0
+
+	int (*enable_tearcheck)(struct dpu_hw_intf *intf, struct dpu_hw_tear_check *cfg);
+
+	int (*disable_tearcheck)(struct dpu_hw_intf *intf);
+
+	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
+
+	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
+
+	/**
+	 * Disable autorefresh if enabled
+	 */
+	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
 };
 
 struct dpu_hw_intf {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 6ed12fd0505b..1913a19de733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -501,12 +501,14 @@ struct dpu_hw_tear_check {
  * @rd_ptr_frame_count: Num frames sent since enabling interface
  * @rd_ptr_line_count:  Current line on panel (rd ptr)
  * @wr_ptr_line_count:  Current line within pp fifo (wr ptr)
+ * @intf_frame_count:   Frames read from intf
  */
 struct dpu_hw_pp_vsync_info {
 	u32 rd_ptr_init_val;
 	u32 rd_ptr_frame_count;
 	u32 rd_ptr_line_count;
 	u32 wr_ptr_line_count;
+	u32 intf_frame_count;
 };
 
 #endif  /* _DPU_HW_MDSS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 0ad148cc2fb8..1a92d21094f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -871,6 +871,20 @@ TRACE_EVENT(dpu_pp_connect_ext_te,
 	TP_printk("pp:%d cfg:%u", __entry->pp, __entry->cfg)
 );
 
+TRACE_EVENT(dpu_intf_connect_ext_te,
+	TP_PROTO(enum dpu_intf intf, u32 cfg),
+	TP_ARGS(intf, cfg),
+	TP_STRUCT__entry(
+		__field(	enum dpu_intf,	intf	)
+		__field(	u32,			cfg	)
+	),
+	TP_fast_assign(
+		__entry->intf = intf;
+		__entry->cfg = cfg;
+	),
+	TP_printk("intf:%d cfg:%u", __entry->intf, __entry->cfg)
+);
+
 TRACE_EVENT(dpu_core_irq_register_callback,
 	TP_PROTO(int irq_idx, void *callback),
 	TP_ARGS(irq_idx, callback),

-- 
2.40.0

