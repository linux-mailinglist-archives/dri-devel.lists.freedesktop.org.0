Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41165A73A
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 22:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63C610E2A7;
	Sat, 31 Dec 2022 21:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1327E10E2A7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 21:50:50 +0000 (UTC)
Received: from localhost.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 00D713ED10;
 Sat, 31 Dec 2022 22:50:47 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC PATCH 6/7] drm/msm/dpu: Implement tearcheck support on INTF block
Date: Sat, 31 Dec 2022 22:50:05 +0100
Message-Id: <20221231215006.211860-7-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231215006.211860-1-marijn.suijten@somainline.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
PINGPONG block and into the INTF.  Implement the necessary callbacks in
the INTF block, and use these callbacks together with the INTF_TEAR
interrupts

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  11 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  10 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 113 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 206 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  29 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 6 files changed, 340 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b5a194..8b9070220ab2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -673,6 +673,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	struct dpu_kms *dpu_kms;
 	struct dpu_hw_mdp *hw_mdptop;
 	struct drm_encoder *drm_enc;
+	struct dpu_encoder_phys *phys_enc;
 	int i;
 
 	if (!dpu_enc || !disp_info) {
@@ -703,12 +704,22 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
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
index f2af07d87f56..47e79401032c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -148,10 +148,10 @@ struct dpu_encoder_phys_ops {
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
@@ -195,6 +195,7 @@ enum dpu_intr_idx {
  *                              pending.
  * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
  * @irq:			IRQ indices
+ * @has_intf_te:		Interface TE configuration support
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
@@ -220,6 +221,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
 	int irq[INTR_IDX_MAX];
+	bool has_intf_te;
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 7e5ba52197cd..ca44a8087f01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -100,12 +100,12 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("pp_done_irq");
 }
 
-static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (!phys_enc->hw_pp)
+	if (!phys_enc->hw_pp || !phys_enc->hw_intf)
 		return;
 
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
@@ -147,11 +147,19 @@ static void dpu_encoder_phys_cmd_atomic_mode_set(
 		struct drm_crtc_state *crtc_state,
 		struct drm_connector_state *conn_state)
 {
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf) {
+		DPU_ERROR("invalid intf configuration\n");
+		return;
+	}
+
 	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
 
 	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
 
-	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
 
 	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 }
@@ -264,7 +272,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_RDPTR],
-				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
+				dpu_encoder_phys_cmd_te_rd_ptr_irq,
 				phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
@@ -336,10 +344,18 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 
 	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
 
-	if (!phys_enc->hw_pp->ops.setup_tearcheck ||
-		!phys_enc->hw_pp->ops.enable_tearcheck) {
-		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-		return;
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf->ops.setup_tearcheck ||
+			!phys_enc->hw_intf->ops.enable_tearcheck) {
+			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+			return;
+		}
+	} else {
+		if (!phys_enc->hw_pp->ops.setup_tearcheck ||
+			!phys_enc->hw_pp->ops.enable_tearcheck) {
+			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+			return;
+		}
 	}
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -392,8 +408,13 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
 		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
 
-	phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
-	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
+	if (phys_enc->has_intf_te) {
+		phys_enc->hw_intf->ops.setup_tearcheck(phys_enc->hw_intf, &tc_cfg);
+		phys_enc->hw_intf->ops.enable_tearcheck(phys_enc->hw_intf, tc_enable);
+	} else {
+		phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
+		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
+	}
 }
 
 static void _dpu_encoder_phys_cmd_pingpong_config(
@@ -470,11 +491,19 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
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
@@ -487,6 +516,7 @@ static int dpu_encoder_phys_cmd_get_line_count(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_pingpong *hw_pp;
+	struct dpu_hw_intf *hw_intf;
 
 	if (!phys_enc->hw_pp)
 		return -EINVAL;
@@ -494,10 +524,16 @@ static int dpu_encoder_phys_cmd_get_line_count(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return -EINVAL;
 
+	if (phys_enc->has_intf_te) {
+		hw_intf = phys_enc->hw_intf;
+		if (!hw_intf->ops.get_line_count)
+			return -EINVAL;
+		return hw_intf->ops.get_line_count(hw_intf);
+	}
+
 	hw_pp = phys_enc->hw_pp;
 	if (!hw_pp->ops.get_line_count)
 		return -EINVAL;
-
 	return hw_pp->ops.get_line_count(hw_pp);
 }
 
@@ -520,7 +556,9 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (phys_enc->hw_pp->ops.enable_tearcheck)
+	if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.enable_tearcheck)
+		phys_enc->hw_intf->ops.enable_tearcheck(phys_enc->hw_intf, false);
+	else if (phys_enc->hw_pp->ops.enable_tearcheck)
 		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
 
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
@@ -582,10 +620,19 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 {
 	struct dpu_hw_pp_vsync_info info;
 
-	if (!phys_enc || !phys_enc->hw_pp->ops.get_vsync_info)
+	if (!phys_enc)
 		return false;
 
-	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf->ops.get_vsync_info)
+			return false;
+		phys_enc->hw_intf->ops.get_vsync_info(phys_enc->hw_intf, &info);
+	} else {
+		if (!phys_enc->hw_pp->ops.get_vsync_info)
+			return false;
+		phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
+	}
+
 	if (info.wr_ptr_line_count > 0 &&
 	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
 		return true;
@@ -602,17 +649,23 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 
 	if (!phys_enc)
 		return;
-	if (!phys_enc->hw_pp)
-		return;
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return;
 
-	if (!phys_enc->hw_pp->ops.get_autorefresh || !phys_enc->hw_pp->ops.setup_autorefresh)
-		return;
-
 	/* If autorefresh is already disabled, we have nothing to do */
-	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
-		return;
+	if (phys_enc->has_intf_te) {
+		if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_autorefresh ||
+				!phys_enc->hw_intf->ops.setup_autorefresh)
+			return;
+		if (!phys_enc->hw_intf->ops.get_autorefresh(phys_enc->hw_intf, NULL))
+			return;
+	} else {
+		if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.get_autorefresh ||
+				!phys_enc->hw_pp->ops.setup_autorefresh)
+			return;
+		if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
+			return;
+	}
 
 	/*
 	 * If autorefresh is enabled, disable it and make sure it is safe to
@@ -623,7 +676,10 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 	 * 5. Enable TE back
 	 */
 	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
-	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
+	if (phys_enc->has_intf_te)
+		phys_enc->hw_intf->ops.setup_autorefresh(phys_enc->hw_intf, 0, false);
+	else
+		phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
 
 	do {
 		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
@@ -717,7 +773,7 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 
 	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
 			phys_enc->irq[INTR_IDX_RDPTR],
-			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
+			dpu_encoder_phys_cmd_te_rd_ptr_irq,
 			&wait_info);
 
 	return rc;
@@ -793,6 +849,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
 		phys_enc->irq[i] = -EINVAL;
 
+	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
+			&phys_enc->dpu_kms->catalog->intf[p->intf_idx - INTF_0].features);
+
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7ce66bf3f4c8..42929278df8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -9,6 +9,8 @@
 #include "dpu_hw_intf.h"
 #include "dpu_kms.h"
 
+#include <linux/iopoll.h>
+
 #define INTF_TIMING_ENGINE_EN           0x000
 #define INTF_CONFIG                     0x004
 #define INTF_HSYNC_CTL                  0x008
@@ -62,6 +64,27 @@
 #define   INTF_LINE_COUNT               0x0B0
 
 #define   INTF_MUX                      0x25C
+#define   INTF_MISR_SIGNATURE           0x184
+
+#define INTF_STATUS                     0x26C
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
@@ -309,6 +332,22 @@ static void dpu_hw_intf_get_status(
 	}
 }
 
+static void dpu_hw_intf_v1_get_status(
+		struct dpu_hw_intf *intf,
+		struct intf_status *s)
+{
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
+
+	s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
+	if (s->is_en) {
+		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
+		s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
+	} else {
+		s->line_count = 0;
+		s->frame_count = 0;
+	}
+}
+
 static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -331,6 +370,161 @@ static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
 	return dpu_hw_collect_misr(&intf->hw, INTF_MISR_CTRL, INTF_MISR_SIGNATURE, misr_value);
 }
 
+static int dpu_hw_intf_setup_te_config(struct dpu_hw_intf *intf,
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
+static int dpu_hw_intf_poll_timeout_wr_ptr(struct dpu_hw_intf *intf,
+		u32 timeout_us)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 val;
+	int rc;
+
+	if (!intf)
+		return -EINVAL;
+
+	c = &intf->hw;
+	rc = readl_poll_timeout(c->blk_addr + INTF_TEAR_LINE_COUNT,
+			val, (val & 0xffff) >= 1, 10, timeout_us);
+
+	return rc;
+}
+
+static int dpu_hw_intf_enable_te(struct dpu_hw_intf *intf, bool enable)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return -EINVAL;
+
+	c = &intf->hw;
+	DPU_REG_WRITE(c, INTF_TEAR_TEAR_CHECK_EN, enable);
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
 static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		unsigned long cap)
 {
@@ -343,6 +537,18 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 	ops->setup_misr = dpu_hw_intf_setup_misr;
 	ops->collect_misr = dpu_hw_intf_collect_misr;
+
+	if (cap & BIT(DPU_INTF_TE)) {
+		ops->setup_tearcheck = dpu_hw_intf_setup_te_config;
+		ops->enable_tearcheck = dpu_hw_intf_enable_te;
+		ops->connect_external_te = dpu_hw_intf_connect_external_te;
+		ops->get_vsync_info = dpu_hw_intf_get_vsync_info;
+		ops->setup_autorefresh = dpu_hw_intf_setup_autorefresh_config;
+		ops->get_autorefresh = dpu_hw_intf_get_autorefresh_config;
+		ops->poll_timeout_wr_ptr = dpu_hw_intf_poll_timeout_wr_ptr;
+		ops->vsync_sel = dpu_hw_intf_vsync_sel;
+		ops->get_status = dpu_hw_intf_v1_get_status;
+	}
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 643dd10bc030..1521c9475fad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -60,6 +60,17 @@ struct intf_status {
  *                     feed pixels to this interface
  * @setup_misr: enable/disable MISR
  * @collect_misr: read MISR signature
+ * @setup_tearcheck:            Enables vsync generation and sets up init value of read
+ *                              pointer and programs the tear check configuration
+ * @enable_tearcheck:           Enables tearcheck block
+ * @connect_external_te:        Read, modify, write to either set or clear listening to external TE
+ *                              Return: 1 if TE was originally connected, 0 if not, or -ERROR
+ * @get_vsync_info:             Provides the programmed and current line_count
+ * @setup_autorefresh:          Configure and enable the autorefresh config
+ * @get_autorefresh:            Retrieve autorefresh config from hardware
+ * @poll_timeout_wr_ptr:        Poll until write pointer transmission starts
+ *                              Return: 0 on success, -ETIMEDOUT on timeout
+ * @vsync_sel:                  Select vsync signal for tear-effect configuration
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -82,6 +93,24 @@ struct dpu_hw_intf_ops {
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
+
+	// Tearcheck on INTF since DPU 5.0.0
+
+	int (*setup_tearcheck)(struct dpu_hw_intf *intf, struct dpu_hw_tear_check *cfg);
+
+	int (*enable_tearcheck)(struct dpu_hw_intf *intf, bool enable);
+
+	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
+
+	int (*get_vsync_info)(struct dpu_hw_intf *intf, struct dpu_hw_pp_vsync_info *info);
+
+	void (*setup_autorefresh)(struct dpu_hw_intf *intf, u32 frame_count, bool enable);
+
+	bool (*get_autorefresh)(struct dpu_hw_intf *intf, u32 *frame_count);
+
+	int (*poll_timeout_wr_ptr)(struct dpu_hw_intf *intf, u32 timeout_us);
+
+	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
 };
 
 struct dpu_hw_intf {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 64b2bf219a34..773579906961 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -494,12 +494,14 @@ struct dpu_hw_tear_check {
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
-- 
2.39.0

