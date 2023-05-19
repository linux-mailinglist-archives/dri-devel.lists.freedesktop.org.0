Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F94708DF2
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5210E5AE;
	Fri, 19 May 2023 02:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8B10E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:39:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac90178fdaso29443851fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463939; x=1687055939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVYe0LE6zc5Xl9DbPzO6ilZj1HlprmVpLRlXMEwKhaI=;
 b=eUAMDl5mMXwYihKHpBJZMt6CXt0RWdMNbgZMRo6ryNJuUV6aGJcD14D2IR5/dH8Qtx
 ozWfpk03w8YNQChHwCUeRgwn/gSc7PxwJKy9BHn1q70BfumhOBAUwytxVmzQwTmx/NhG
 8Bi3plfoGCfgZwQ3KB8jwmqKQlah83YB1EIYckULWheETNobmBxlhVUgCYniyFj+Rl9z
 S2Bo54bz7wH25MPTwH6GA/fj3mA4xoT3oGFm7gJuUvX8e7eyBtWVlhaCnc+mnGdxouFI
 b/LC3pa597tbxPx3YrWi8vgX3/bTiGbbEcVY/N1fbzX+CwFG4zI2f/aEaV+f26Z/Nslz
 GNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463939; x=1687055939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVYe0LE6zc5Xl9DbPzO6ilZj1HlprmVpLRlXMEwKhaI=;
 b=DhmVBKfhE/+RaJ1h1fDooey5n7/yJwF7ylWLVdgiQka1PNb0gsZLTsPnMPOfUvQasj
 Esi3oZHZUYVoAwnLzv8JQ+R2UUikwqhzWNJTGNzenlaPUAzbyUWjSrngTENu6hew9tLq
 Jf/s0Zenwtte3O8vp0lKscRZnsN2VqOTailg5nmmUl2eaKvUQzWT5+t9sXIb7oYCAeS/
 HcRlWHpc8EG6BbZ/PAjljLlTQ/3ZlY1d3Rwo5Ojj+1M0g8x8/FbfcIfC74GAaLmv+eeN
 Xuij2JWlVOGfO+l50EVbbTFqAelXif7lnurP9knUU9uZCMHuDTm3SyYNqk3M+9NITKjU
 6VZw==
X-Gm-Message-State: AC+VfDxxknbgYBly0EiAbsZe8yUep8BxNGnjzW0hArapYY6vz3HamiGk
 KTc/EgaXfymrDHgyTqL7AZnLRQ==
X-Google-Smtp-Source: ACHHUZ7V5NSLFMrEqTxCph56gi25LF6h/WQZ4ysdQeSPZORz712c9iNfTFABdZZFtzIaaXCJHIDVFw==
X-Received: by 2002:a2e:b0ee:0:b0:2ad:9a13:ec0f with SMTP id
 h14-20020a2eb0ee000000b002ad9a13ec0fmr97691ljl.42.1684463939002; 
 Thu, 18 May 2023 19:38:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:38:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/7] drm/msm/dpu: drop duplicated intf/wb indices from
 encoder structs
Date: Fri, 19 May 2023 05:38:51 +0300
Message-Id: <20230519023855.3840907-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 72 ++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 12 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 16 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  8 +--
 5 files changed, 46 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 06b34bac4171..267626245a74 100644
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
 
@@ -2263,6 +2267,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
+		enum dpu_intf intf_idx;
+		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2276,57 +2282,39 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
@@ -2518,8 +2506,8 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
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
index 69c3ba5fab26..faa6f69e5ce5 100644
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
index 6898664e1381..bedc8d0316c6 100644
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
index dc951fdf473b..e26629e9e303 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -718,7 +718,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
 
-	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
+	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
 	return phys_enc;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 008d1d09b9ba..6608c00e3c33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -240,7 +240,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 	const struct drm_display_mode *mode = &crtc_state->mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
+			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
 
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
@@ -561,7 +561,7 @@ static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
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

