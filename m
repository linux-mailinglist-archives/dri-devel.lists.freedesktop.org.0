Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E981E0CC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 14:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359410E16C;
	Mon, 25 Dec 2023 13:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C057410E162
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 13:08:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cc3f5e7451so39344631fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 05:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703509737; x=1704114537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZcqOezVchrhaL9FgMKMTA/pGLD7s8MUxgWn0y1XG3Rg=;
 b=e67rOCwFmqeJGOMc9Qsspv8ib+nZjUvkaP4TAEYIyAES89r2bD3ohDIRA+M7IO6dRG
 zRq4plpY/7+/vsHRIssRk8E2Z9Chp/Ip1AYpKzpfxR1uAA52GNU6GLkaFsuKzhan6wB+
 fURsd/z9pfClM1YXP5Q02kos9RrZFUg31M3CVpx12KxhCAkjYBpM9bzW/KyNVdidK5rv
 uXQ8GCG3hCBmek4T3hebgb6Ka4ROvVbZKo6sM9g5EkVoYoe9CvuYfcALPUZmqMQEJ/XV
 fQ+x0vlwD+T+2WA+1g4jEIZ20x7Klw8+ZoZamt4GwBMt+bW0TgKUjX5gyhs+4ZmCPaKq
 xD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703509737; x=1704114537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZcqOezVchrhaL9FgMKMTA/pGLD7s8MUxgWn0y1XG3Rg=;
 b=c1Z371546zv/Jvga5poOYLcCF+q2h16fNfgp27F/lJvnz/PQbd5RufbdM7n2VsbG9U
 kUxpZ3pdF94MI5ohfPsCrEvazONgjFEAjbheTG/iwxqm/tgZW2lU83AF2Aw6VSdm4xLy
 IJwpcM2joaBZ/yD/IxvAWS+Vr3GKKpcGa5jpmdaKLSUlJkWIZRniYTosjHPjuKDDP3s3
 oSlFbJtNz0wJBFGCsyCbXS6/qydxyQhRKAdYAlFKsxAhSl0Nc3TUoalse1tLvPfrS7nD
 65881XE+mq62bMLYO4dIHerZHbO3ClzJ9DthAQsnF7Ar/o/ira4cE7q8vB7iZ4BqYZ9e
 SZvw==
X-Gm-Message-State: AOJu0YxcAVtydsPOIemjEqToa3DfPMPvoVEALj1PT+zoXLe4s+ZQrhAj
 HgEZhtvVgZ3m1NbGH9Kx7fUuH9IyyoAx8w==
X-Google-Smtp-Source: AGHT+IHNXCqGexozPKtiBhDWJiVtjJX4ljmTMvUihOIw4VQLe50vHkSnAgzQspn4btT3MBa+cPf4fw==
X-Received: by 2002:a2e:9dd8:0:b0:2cc:8bd4:b860 with SMTP id
 x24-20020a2e9dd8000000b002cc8bd4b860mr2409341ljj.85.1703509736988; 
 Mon, 25 Dec 2023 05:08:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 05:08:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 3/5] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
Date: Mon, 25 Dec 2023 15:08:51 +0200
Message-Id: <20231225130853.3659424-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
INTF and WB are statically allocated to each encoder/phys_enc, drop the
atomic_mode_set callback and set the IRQs during encoder init.

For the CMD panel usecase some of IRQ indexes depend on the selected
resources. Move setting them to the irq_enable() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 ---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++-----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +------
 5 files changed, 17 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7b79fa3a79a3..5022d0b9b4b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1152,8 +1152,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
-		if (phys->ops.atomic_mode_set)
-			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 8c5b0c853572..7eb8bdfe6bbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -69,8 +69,6 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @atomic_mode_set:		DRM Call. Set a DRM mode.
- *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
@@ -96,9 +94,6 @@ struct dpu_encoder_phys;
 struct dpu_encoder_phys_ops {
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
-			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index de826f9745e5..fc1d5736d7fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -142,23 +142,6 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
-static void dpu_encoder_phys_cmd_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-}
-
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -297,6 +280,14 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -327,6 +318,10 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
+
+	phys_enc->irq[INTR_IDX_CTL_START] = 0;
+	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
+	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -706,7 +701,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
@@ -745,6 +739,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+
 	cmd_enc->stream_sel = 0;
 
 	if (!phys_enc->hw_intf) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9743ec43d862..bc4ac7e2e4ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -349,16 +349,6 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
-static void dpu_encoder_phys_vid_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
-
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-}
-
 static int dpu_encoder_phys_vid_control_vblank_irq(
 		struct dpu_encoder_phys *phys_enc,
 		bool enable)
@@ -686,7 +676,6 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
@@ -725,6 +714,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 602013725484..a0a28230fc31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -539,15 +539,6 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
-static void dpu_encoder_phys_wb_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-
-	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
-}
-
 static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -784,7 +775,6 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
@@ -831,6 +821,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 
-- 
2.39.2

