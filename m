Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DF6F2BB8
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 01:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7E610E15B;
	Sun, 30 Apr 2023 23:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AF410E14E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00d3f98deso20080246e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899056; x=1685491056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icdJtegekkgYsX4U66knfpjSw2MxsAgQy4ibiaDhhuw=;
 b=codVAWlz+QwrLOnxmjA/ikQWSWjFmYuiSUFcz+bP4Ksv2Fhz1BkiH203rMPSqRN8HG
 HiXeDqKj2n5rbPoFEtUDd4j02iVTZZcQtB42lJlbJwnowL/r7lPzWZJBhvmgfBJLA1+d
 U7BXAeIgi23JjRrHcOjBE1+jFYXQtJrbeKR4tmpgF3JU7ssQ+t+Qv5VVKNflxwwtKQ7v
 LfHCxABfmq7YSe9TqaKTyXH00NSp3qMIdfdPoZqNxzHkvR2TXTcR/g2YuIYVOgTFguLx
 OeOTURh46FA2lH+5dYxqpXc2PEY/8lubYFTcrGg0dZHnHyeA0n6TpJEbIrnalcTpPWyu
 4j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899056; x=1685491056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=icdJtegekkgYsX4U66knfpjSw2MxsAgQy4ibiaDhhuw=;
 b=IrEfao2czqVXgX69XiKRlsV2NIDOo7H4gXA4CdCrr4HAFSZ5tedzoJVL8K7qvG0i8V
 +oxbxNKRXbtaQO+EICcI1CzXtoYPaq65/HFCu+r9WwrHJhTCjJ/8t6lj+jmWwes0XP7C
 LqkrStkGaSpYpgYhXrNSV64Oejs2Ya1gTIijB4C98C5wigIbRZMpy2ienwKDZc5aqoIb
 HehfOPUCWxbAzqzE8juhdM9NlQjDUoJDdArzXQCwOTIL3JsoQ7DS36zIv3bvz/XjrMEr
 OuZqTfOznivCBhvL8HJ0+yhQR4THMUa6iBLy8StlG7hDvznDbSVafFbr1mlpKRkgSJg+
 EvkQ==
X-Gm-Message-State: AC+VfDxB4veqZimvUvlgLuVn8KN+ZUlpv8a6bjPQvSAa1G4JkYQtq5t/
 ow8/Hvg9pJplaYrb2ujyqEqYmg==
X-Google-Smtp-Source: ACHHUZ4WsCeMp6npLC2STlbZ/57eQtk0+65yKWznSNl8KkO4QkdaE95BZ0b6UwMSTjAFFRmm2+GymQ==
X-Received: by 2002:ac2:4c15:0:b0:4f0:76b:4a8f with SMTP id
 t21-20020ac24c15000000b004f0076b4a8fmr3413561lfq.20.1682899056326; 
 Sun, 30 Apr 2023 16:57:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/7] drm/msm/dpu: drop duplicated intf/wb indices from encoder
 structs
Date: Mon,  1 May 2023 02:57:29 +0300
Message-Id: <20230430235732.3341119-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove intf_idx and wb_idx fields from struct dpu_encoder_phys and
struct dpu_enc_phys_init_params. Set the hw_intf and hw_wb directly and
use them to get the instance index.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 72 ++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 12 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 16 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  8 +--
 5 files changed, 46 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c60dce5861e2..4c85cbb030e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -339,7 +339,8 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 	DRM_ERROR("irq timeout id=%u, intf_mode=%s intf=%d wb=%d, pp=%d, intr=%d\n",
 			DRMID(phys_enc->parent),
 			dpu_encoder_helper_get_intf_type(phys_enc->intf_mode),
-			phys_enc->intf_idx - INTF_0, phys_enc->wb_idx - WB_0,
+			phys_enc->hw_intf ? phys_enc->hw_intf->idx - INTF_0 : -1,
+			phys_enc->hw_wb ? phys_enc->hw_wb->idx - WB_0 : -1,
 			phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
 
 	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
@@ -1408,7 +1409,8 @@ void dpu_encoder_frame_done_callback(
 			 */
 			trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc), event,
 					dpu_encoder_helper_get_intf_type(ready_phys->intf_mode),
-					ready_phys->intf_idx, ready_phys->wb_idx);
+					ready_phys->hw_intf ? ready_phys->hw_intf->idx : -1,
+					ready_phys->hw_wb ? ready_phys->hw_wb->idx : -1);
 			return;
 		}
 
@@ -1488,7 +1490,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_trigger_flush(DRMID(drm_enc),
 			dpu_encoder_helper_get_intf_type(phys->intf_mode),
-			phys->intf_idx, phys->wb_idx,
+			phys->hw_intf ? phys->hw_intf->idx : -1,
+			phys->hw_wb ? phys->hw_wb->idx : -1,
 			pending_kickoff_cnt, ctl->idx,
 			extra_flush_bits, ret);
 }
@@ -2099,7 +2102,8 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
 		seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
-				phys->intf_idx - INTF_0, phys->wb_idx - WB_0,
+				phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
+				phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
 				atomic_read(&phys->vsync_cnt),
 				atomic_read(&phys->underrun_cnt));
 
@@ -2256,6 +2260,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
+		enum dpu_intf intf_idx;
+		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2269,57 +2275,39 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
+		intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
 							    disp_info->intf_type,
 							    controller_id);
 
-		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
+		wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
 				disp_info->intf_type, controller_id);
-		/*
-		 * The phys_params might represent either an INTF or a WB unit, but not
-		 * both of them at the same time.
-		 */
-		if ((phys_params.intf_idx == INTF_MAX) &&
-				(phys_params.wb_idx == WB_MAX)) {
-			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
-						  disp_info->intf_type, controller_id);
-			ret = -EINVAL;
-		}
 
-		if ((phys_params.intf_idx != INTF_MAX) &&
-				(phys_params.wb_idx != WB_MAX)) {
-			DPU_ERROR_ENC(dpu_enc, "both intf and wb present: type %d, id %d\n",
-						  disp_info->intf_type, controller_id);
-			ret = -EINVAL;
-		}
+		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
+			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
 
-		if (!ret) {
-			ret = dpu_encoder_virt_add_phys_encs(disp_info,
-					dpu_enc, &phys_params);
-			if (ret)
-				DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
-		}
-	}
+		if (wb_idx >= WB_0 && wb_idx < WB_MAX)
+			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
-			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
-
-		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
-			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
-
-		if (!phys->hw_intf && !phys->hw_wb) {
+		if (!phys_params.hw_intf && !phys_params.hw_wb) {
 			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
 			ret = -EINVAL;
+			break;
 		}
 
-		if (phys->hw_intf && phys->hw_wb) {
+		if (phys_params.hw_intf && phys_params.hw_wb) {
 			DPU_ERROR_ENC(dpu_enc,
 					"invalid phys both intf and wb block at idx: %d\n", i);
 			ret = -EINVAL;
+			break;
 		}
+
+		ret = dpu_encoder_virt_add_phys_encs(disp_info,
+				dpu_enc, &phys_params);
+		if (ret) {
+			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
+			break;
+		}
+
 	}
 
 	mutex_unlock(&dpu_enc->enc_lock);
@@ -2510,8 +2498,8 @@ int dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	int i;
 
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
-	phys_enc->wb_idx = p->wb_idx;
+	phys_enc->hw_intf = p->hw_intf;
+	phys_enc->hw_wb = p->hw_wb;
 	phys_enc->parent = p->parent;
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7019870215c0..1c096d9390d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -161,8 +161,6 @@ enum dpu_intr_idx {
  * @enabled:		Whether the encoder has enabled and running a mode
  * @split_role:		Role to play in a split-panel configuration
  * @intf_mode:		Interface mode
- * @intf_idx:		Interface index on dpu hardware
- * @wb_idx:			Writeback index on dpu hardware
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  * @enable_state:	Enable state tracking
  * @vblank_refcount:	Reference count of vblank request
@@ -189,8 +187,6 @@ struct dpu_encoder_phys {
 	struct drm_display_mode cached_mode;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf_mode intf_mode;
-	enum dpu_intf intf_idx;
-	enum dpu_wb wb_idx;
 	spinlock_t *enc_spinlock;
 	enum dpu_enc_enable_state enable_state;
 	atomic_t vblank_refcount;
@@ -256,16 +252,16 @@ struct dpu_encoder_phys_cmd {
  * @parent:		Pointer to the containing virtual encoder
  * @parent_ops:		Callbacks exposed by the parent to the phys_enc
  * @split_role:		Role to play in a split-panel configuration
- * @intf_idx:		Interface index this phys_enc will control
- * @wb_idx:			Writeback index this phys_enc will control
+ * @hw_intf:		Hardware interface to the intf registers
+ * @hw_wb:		Hardware interface to the wb registers
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  */
 struct dpu_enc_phys_init_params {
 	struct dpu_kms *dpu_kms;
 	struct drm_encoder *parent;
 	enum dpu_enc_split_role split_role;
-	enum dpu_intf intf_idx;
-	enum dpu_wb wb_idx;
+	struct dpu_hw_intf *hw_intf;
+	struct dpu_hw_wb *hw_wb;
 	spinlock_t *enc_spinlock;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index ce86b9ef6bf1..781290f17714 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -16,12 +16,12 @@
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
 		(e)->base.parent->base.id : -1, \
-		(e) ? (e)->base.intf_idx - INTF_0 : -1, ##__VA_ARGS__)
+		(e) ? (e)->base.hw_intf->idx - INTF_0 : -1, ##__VA_ARGS__)
 
 #define DPU_ERROR_CMDENC(e, fmt, ...) DPU_ERROR("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
 		(e)->base.parent->base.id : -1, \
-		(e) ? (e)->base.intf_idx - INTF_0 : -1, ##__VA_ARGS__)
+		(e) ? (e)->base.hw_intf->idx - INTF_0 : -1, ##__VA_ARGS__)
 
 #define to_dpu_encoder_phys_cmd(x) \
 	container_of(x, struct dpu_encoder_phys_cmd, base)
@@ -59,7 +59,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	if (!ctl->ops.setup_intf_cfg)
 		return;
 
-	intf_cfg.intf = phys_enc->intf_idx;
+	intf_cfg.intf = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
@@ -430,7 +430,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 		return;
 	}
 
-	dpu_encoder_helper_split_config(phys_enc, phys_enc->intf_idx);
+	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
 	_dpu_encoder_phys_cmd_pingpong_config(phys_enc);
 
@@ -438,7 +438,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 		return;
 
 	ctl = phys_enc->hw_ctl;
-	ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
+	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 }
 
 static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
@@ -525,7 +525,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 				phys_enc->hw_pp->idx);
 
 		ctl = phys_enc->hw_ctl;
-		ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
+		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 	}
 
 	phys_enc->enable_state = DPU_ENC_DISABLED;
@@ -670,7 +670,7 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 	if (rc) {
 		DRM_ERROR("failed wait_for_idle: id:%u ret:%d intf:%d\n",
 			  DRMID(phys_enc->parent), rc,
-			  phys_enc->intf_idx - INTF_0);
+			  phys_enc->hw_intf->idx - INTF_0);
 	}
 
 	return rc;
@@ -761,7 +761,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
 	int ret = 0;
 
-	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
+	DPU_DEBUG("intf\n");
 
 	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index aca3849621e2..f02ff8f43f47 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -721,7 +721,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
 
-	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
+	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
 	return phys_enc;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index c252127552c6..b058c69e8778 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -238,7 +238,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 	const struct drm_display_mode *mode = &crtc_state->mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
+			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
 
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
@@ -559,7 +559,7 @@ static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
 	if (!phys_enc)
 		return;
 
-	DPU_DEBUG("[wb:%d]\n", phys_enc->wb_idx - WB_0);
+	DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
 
 	kfree(phys_enc);
 }
@@ -712,9 +712,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 
 	wb_enc->wb_done_timeout_cnt = 0;
 
-
-	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
-			phys_enc->wb_idx);
+	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n", phys_enc->hw_wb->idx);
 
 	return phys_enc;
 
-- 
2.39.2

