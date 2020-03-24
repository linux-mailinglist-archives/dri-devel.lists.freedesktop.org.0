Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5719226D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C126E5A9;
	Wed, 25 Mar 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61F46E466;
 Tue, 24 Mar 2020 10:02:32 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 24 Mar 2020 15:31:47 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 24 Mar 2020 15:31:30 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 67F1A4718; Tue, 24 Mar 2020 15:31:29 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] drm/msm/dpu: add support for pcc color block in dpu driver
Date: Tue, 24 Mar 2020 15:31:19 +0530
Message-Id: <1585044079-358-2-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: mkrishn@codeaurora.org, travitej@codeaurora.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change adds support for color correction sub block
for SC7180 device.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 77 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 49 +++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 33 ++++++++++-
 4 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bf51341..156a997 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -9,6 +9,7 @@
 #include <linux/sort.h>
 #include <linux/debugfs.h>
 #include <linux/ktime.h>
+#include <linux/bits.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_flip_work.h>
@@ -20,6 +21,7 @@
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
+#include "dpu_hw_dspp.h"
 #include "dpu_crtc.h"
 #include "dpu_plane.h"
 #include "dpu_encoder.h"
@@ -40,6 +42,9 @@
 /* timeout in ms waiting for frame done */
 #define DPU_CRTC_FRAME_DONE_TIMEOUT_MS	60
 
+#define	CONVERT_S3_15(val) \
+	(((((u64)val) & ~BIT_ULL(63)) >> 17) & GENMASK_ULL(17, 0))
+
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv = crtc->dev->dev_private;
@@ -422,6 +427,74 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 	drm_mode_debug_printmodeline(adj_mode);
 }
 
+static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
+		struct dpu_hw_pcc_cfg *cfg)
+{
+	struct drm_color_ctm *ctm;
+
+	memset(cfg, 0, sizeof(struct dpu_hw_pcc_cfg));
+
+	ctm = (struct drm_color_ctm *)state->ctm->data;
+
+	if (!ctm)
+		return;
+
+	cfg->r.r = CONVERT_S3_15(ctm->matrix[0]);
+	cfg->g.r = CONVERT_S3_15(ctm->matrix[1]);
+	cfg->b.r = CONVERT_S3_15(ctm->matrix[2]);
+
+	cfg->r.g = CONVERT_S3_15(ctm->matrix[3]);
+	cfg->g.g = CONVERT_S3_15(ctm->matrix[4]);
+	cfg->b.g = CONVERT_S3_15(ctm->matrix[5]);
+
+	cfg->r.b = CONVERT_S3_15(ctm->matrix[6]);
+	cfg->g.b = CONVERT_S3_15(ctm->matrix[7]);
+	cfg->b.b = CONVERT_S3_15(ctm->matrix[8]);
+}
+
+static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *state = crtc->state;
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
+	struct dpu_crtc_mixer *mixer = cstate->mixers;
+	struct dpu_hw_pcc_cfg cfg;
+	struct dpu_hw_ctl *ctl;
+	struct dpu_hw_mixer *lm;
+	struct dpu_hw_dspp *dspp;
+	int i;
+
+
+	if (!state->color_mgmt_changed)
+		return;
+
+	for (i = 0; i < cstate->num_mixers; i++) {
+		ctl = mixer[i].lm_ctl;
+		lm = mixer[i].hw_lm;
+		dspp = mixer[i].hw_dspp;
+
+		if (!dspp || !dspp->ops.setup_pcc)
+			continue;
+
+		if (!state->ctm) {
+			dspp->ops.setup_pcc(dspp, NULL);
+		} else {
+			_dpu_crtc_get_pcc_coeff(state, &cfg);
+			dspp->ops.setup_pcc(dspp, &cfg);
+		}
+
+		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
+			mixer[i].hw_dspp->idx);
+
+		/* stage config flush mask */
+		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
+
+		DPU_DEBUG("lm %d, ctl %d, flush mask 0x%x\n",
+			mixer[i].hw_lm->idx - DSPP_0,
+			ctl->idx - CTL_0,
+			mixer[i].flush_mask);
+	}
+}
+
 static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 		struct drm_crtc_state *old_state)
 {
@@ -475,6 +548,8 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	_dpu_crtc_blend_setup(crtc);
 
+	_dpu_crtc_setup_cp_blocks(crtc);
+
 	/*
 	 * PP_DONE irq is only used by command mode for now.
 	 * It is better to request pending before FLUSH and START trigger
@@ -1317,6 +1392,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
+	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 19d065a..731b4fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -41,7 +41,7 @@
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
-#define DSPP_SC7180_MASK 0
+#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
@@ -339,12 +339,17 @@
 /*************************************************************
  * DSPP sub blocks config
  *************************************************************/
+static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
+	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+		.len = 0x90, .version = 0x10000},
+};
+
 #define DSPP_BLK(_name, _id, _base) \
 		{\
 		.name = _name, .id = _id, \
 		.base = _base, .len = 0x1800, \
 		.features = DSPP_SC7180_MASK, \
-		.sblk = NULL, \
+		.sblk = &sc7180_dspp_sblk \
 		}
 
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 75c82e9..b5189ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -9,10 +9,57 @@
 #include "dpu_kms.h"
 
 
+/* DSPP_PCC */
+#define PCC_EN BIT(0)
+#define PCC_DIS 0
+#define PCC_RED_R_OFF 0x10
+#define PCC_RED_G_OFF 0x1C
+#define PCC_RED_B_OFF 0x28
+#define PCC_GREEN_R_OFF 0x14
+#define PCC_GREEN_G_OFF 0x20
+#define PCC_GREEN_B_OFF 0x2C
+#define PCC_BLUE_R_OFF 0x18
+#define PCC_BLUE_G_OFF 0x24
+#define PCC_BLUE_B_OFF 0x30
+
+void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+		struct dpu_hw_pcc_cfg *cfg)
+{
+
+	u32 base = ctx->cap->sblk->pcc.base;
+
+	if (!ctx || !base) {
+		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
+		return;
+	}
+
+	if (!cfg) {
+		DRM_DEBUG_DRIVER("disable pcc feature\n");
+		DPU_REG_WRITE(&ctx->hw, base, PCC_DIS);
+		return;
+	}
+
+	DPU_REG_WRITE(&ctx->hw, base + PCC_RED_R_OFF, cfg->r.r);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_RED_G_OFF, cfg->r.g);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_RED_B_OFF, cfg->r.b);
+
+	DPU_REG_WRITE(&ctx->hw, base + PCC_GREEN_R_OFF, cfg->g.r);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_GREEN_G_OFF, cfg->g.g);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_GREEN_B_OFF, cfg->g.b);
+
+	DPU_REG_WRITE(&ctx->hw, base + PCC_BLUE_R_OFF, cfg->b.r);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_BLUE_G_OFF, cfg->b.g);
+	DPU_REG_WRITE(&ctx->hw, base + PCC_BLUE_B_OFF, cfg->b.b);
+
+	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
+}
+
 static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		unsigned long features)
 {
-	return;
+	if (test_bit(DPU_DSPP_PCC, &features) &&
+		IS_SC7180_TARGET(c->hw.hwversion))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
 static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 09807ea..7fa189c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -10,13 +10,44 @@
 struct dpu_hw_dspp;
 
 /**
+ * struct dpu_hw_pcc_coeff - PCC coefficient structure for each color
+ *                            component.
+ * @r: red coefficient.
+ * @g: green coefficient.
+ * @b: blue coefficient.
+ */
+
+struct dpu_hw_pcc_coeff {
+	__u32 r;
+	__u32 g;
+	__u32 b;
+};
+
+/**
+ * struct dpu_hw_pcc - pcc feature structure
+ * @r: red coefficients.
+ * @g: green coefficients.
+ * @b: blue coefficients.
+ */
+struct dpu_hw_pcc_cfg {
+	struct dpu_hw_pcc_coeff r;
+	struct dpu_hw_pcc_coeff g;
+	struct dpu_hw_pcc_coeff b;
+};
+
+/**
  * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
  * Caller must call the init function to get the dspp context for each dspp
  * Assumption is these functions will be called after clocks are enabled
  */
 struct dpu_hw_dspp_ops {
+	/**
+	 * setup_pcc - setup dspp pcc
+	 * @ctx: Pointer to dspp context
+	 * @cfg: Pointer to configuration
+	 */
+	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
 
-	void (*dummy)(struct dpu_hw_dspp *ctx);
 };
 
 /**
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
