Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33237217EB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 16:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E0610E14D;
	Sun,  4 Jun 2023 14:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB69310E144
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 14:45:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f620583bc2so918478e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685889918; x=1688481918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDr9DAUfI6kBX/1k4iRKmgxLrfTkoXq96tu0DGJx0o0=;
 b=s1tHyopSs7sh1JbFdV8Sx6JL/CA7l/QmUJtLTTu7ka/L+YxbRYp+Iqjlc1P8Ev34AO
 barOE0tRPBNe7PMc94902k/qHcB4RXZistgA94YjEsZDgESQemQX4SXlxc3taSlyCyOY
 1HfEboeYdpq618wpEvhvVch5TWN2gpPNwvOgzzn8Vmf2upN9w12iWw3G22fmgG+1zEwY
 IGN4OAQszDnpKRQZxw6p77y9K/1f7bkAl9vwb4Q+BsQDAkA96G2mCMf27eQw/b1s5P8o
 fBQwlSTQJdVA8U+WAlQOjGZLb/8tSI94p3rkxGYFootLKy3CC/6oCHMZ59KtxX8jd71h
 XKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685889918; x=1688481918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDr9DAUfI6kBX/1k4iRKmgxLrfTkoXq96tu0DGJx0o0=;
 b=SFr51lfm+yTpAPdoNoG0J8F+Qzf55RP2pKti8SNxkiKlVLhkUyhzGoSVpSiniZFtCh
 +xfM7A6nQZxx/oz01MRkwRmz9TmQDhKJpwCdSZQv++zpVyuGgFUO9iATFgeBtrP1ufsm
 wfK42Vz3phTx/iHZjiOdTOeBoKBoDIV7MP0c3HONdlJdRyB4K4c9bZUmC+ks9//U0g8T
 L6kYk4x6ZpmwCEvOsSpfyuvZb3DhYvokN3az8pbDrbdam+k+uL1QMoUjTguFuQmVKcrT
 e8+apkO0wfFWx3IYTBxzz18eIIJV4oCnjboopiHiIJkDu8qHex1vW092WGjUHPxz25te
 760Q==
X-Gm-Message-State: AC+VfDyTrV5/x1kFYmTaFb5y5GULslyVyIJ3KDSixkKxIq/Fn2XdwG/b
 kJO5+zm/9piiUxfHxFwlNKDR7LtVnEKVkc7lf44=
X-Google-Smtp-Source: ACHHUZ6/h/Hv0Wbw096BZcGGrxL/MlXXZjSc2lTfC9bIzYQprPVcFgOeyHxxCWeK857pUQwuXeH+RA==
X-Received: by 2002:a05:6512:3882:b0:4f3:7c24:1024 with SMTP id
 n2-20020a056512388200b004f37c241024mr4093685lft.40.1685889917697; 
 Sun, 04 Jun 2023 07:45:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 07:45:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/3] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
Date: Sun,  4 Jun 2023 17:45:14 +0300
Message-Id: <20230604144514.949628-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
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

The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
INTF and WB are statically allocated to each encoder/phys_enc, drop the
atomic_mode_set callback and set the IRQs during encoder init.

For the CMD panel usecase some of IRQ indexes depend on the selected
resources. Move setting them to the irq_enable() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 ---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++-----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +------
 5 files changed, 17 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index cc61f0cf059d..6b5c80dc5967 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1148,8 +1148,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
-		if (phys->ops.atomic_mode_set)
-			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index faf033cd086e..24dbc28be4f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -67,8 +67,6 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @atomic_mode_set:		DRM Call. Set a DRM mode.
- *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
@@ -95,9 +93,6 @@ struct dpu_encoder_phys;
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
index 3422b49f23c2..a0b7d8803e94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -140,23 +140,6 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
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
@@ -287,6 +270,14 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					true,
 					atomic_read(&phys_enc->vblank_refcount));
 
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
@@ -318,6 +309,10 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
+
+	phys_enc->irq[INTR_IDX_CTL_START] = -1;
+	phys_enc->irq[INTR_IDX_PINGPONG] = -1;
+	phys_enc->irq[INTR_IDX_RDPTR] = -1;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -737,7 +732,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
@@ -775,6 +769,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+
 	cmd_enc->stream_sel = 0;
 
 	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a550b290246c..3f2e0ebe3cfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -348,16 +348,6 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
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
@@ -684,7 +674,6 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
@@ -723,6 +712,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 858fe6656c9b..439f645e0bc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -410,15 +410,6 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
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
@@ -668,7 +659,6 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->destroy = dpu_encoder_phys_wb_destroy;
@@ -715,6 +705,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 
-- 
2.39.2

