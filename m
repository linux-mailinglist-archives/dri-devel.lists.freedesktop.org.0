Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A084E3F7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81D310E8E6;
	Thu,  8 Feb 2024 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jkrejwm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274510E8D7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:45 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d0a96bad85so28587671fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405644; x=1708010444; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pD8NFY3C23D5pY1eaim0ZItVfbwtuhOEOgYDjY7n37g=;
 b=Jkrejwm9c9nYtf9Oy/czzgHrpdKMix8ZspOpUc487Rk6WT5kRUECYDaV8uFai1Jfwh
 8vArLXanMJfacVSXg1Z1yFo+5NZSv/b2AXa5snQ+LdY4vjrxbDiEPnJ4ZgFEgVjAfugp
 0MhjF44Biay09F2fcx2aKUZA/3gG/AMj9BYJ7B1KhtbUFI+D1AcBBdVY133wcDXWGmHc
 OQ3IuRw25J/7kfya8lbdT0xn7QaoVEOKGncrhaQiUWKIhiBZa37OBRRgbogy/W1PNerB
 Forfmu4n1Q8sipPA06nBMln20ORQt7+asf/L/aKxg4tpQlDAs/OI6qOYjwxfPzqLx9Rl
 bU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405644; x=1708010444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pD8NFY3C23D5pY1eaim0ZItVfbwtuhOEOgYDjY7n37g=;
 b=KsMoEr9OPDO33sAPuTqHXSzOyehaJC44uaDqbGyE9DKqL//ZhQt+G99x4pA7HZLr7I
 bT56F7yFNbZI+wHyQT/gt0RnruybogHdPJmHP80flpZqYYU7vsBms+VstKIe5FkhWapZ
 jn54tdhWcJ1QsM3+qSNrhSHZ3AE3ST8Nux0c3SEROzIfwuYh6HnV2JuR7t/S9AbNISQ9
 pOsxhBOjLbWEBemOdVgabF1XJkgQfwlzidDW7n8yNl+DI2d/6OYrU/yrkt718wWkle48
 irqLAjlbf7eueIymK5KKZYMrivgFuVVhpJKgz0+iumkUbA6ylRG/LvB8cTTOBo7ujCF2
 YEnA==
X-Gm-Message-State: AOJu0YxYflHk8PYDrMCkGlympUM65aCbRW39KlAaKbXaqXJcd2WshoQI
 +bymyUnrNZpbLhVCBSX2VFMLfJOw5zCR1Nz4tWc7OF621gNn5Gf2HAQd5wJ4v4xTA4S1BaY5U5a
 F
X-Google-Smtp-Source: AGHT+IECo0e7zlDwzC+qK7mS1CdQiTutLGlMtdt69c5XhvkPtSH8qXrWRF27qWN18jBLKeqXylJkIg==
X-Received: by 2002:a05:651c:1411:b0:2d0:9fac:bdff with SMTP id
 u17-20020a05651c141100b002d09facbdffmr6166882lje.38.1707405643738; 
 Thu, 08 Feb 2024 07:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHLZhJGFr0xDaDG1/nvprbbZEhpAFc/VLX841oIrynZ5GlJ5l9jtcBR82j0/iv+pKe2XDJBvJYiFFXWbpzTc0xpZFUgQrZ4/PG4lncRRLXEQX0Ek2cPwOsKOIRLUwcgoMnb5/Oa6sDMHYSmMKwjyemjcryDQAf/dVL4i+LPOOpyF7sQeL25gdqlwGxKZY01mpWfKLLMtD6b7JjU73Wy7TgxYVcCaparQwCmnEKnDS3ubfc+viYxJW/k2jxag9NhhPe4H2H49tBNd3nczhIKbOZpqvK2SLFPNwrHKz3yf6Iyf2SUgSPEQa7Au1MUTzkU54ZRiSKgCvQz79d16M=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:41 +0200
Subject: [PATCH v4 1/5] drm/msm/dpu: split irq_control into irq_enable and
 _disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-1-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=17113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hi4ozukHaJbEW9QTJeM5bhr1N9GU68ltmc8dMLtUFbY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFJjZ9hAXLUDyFqGmQFudLSmvr4JIhzyeFcI
 RUZE/KuZ0CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSQAKCRCLPIo+Aiko
 1U+gB/9XvVpLJa5kYNCLUN9kkG350vbN5uyQ1MgWxfN7AE+MH+LwnOcmCrwDbet+ILqgf1zfbfg
 CJBMupD9MU/gvjP7ZuIocWdJbeYI/fIzRQ6NH5db5C77pR6SKpSEKRRzGkCM3sFJ4Exsjldcv07
 d8qe271JH/1t+iWE8S7OIHBHePHF8F5UFP/d6ylqz4xhdoRXn4mz5exhfrDlr9a1Sqt+Dk8+mz0
 cTb1/bKeEz/CvhTscbHEbAddlvYdJBThnxyj34WlMlVic2r1UpeGeOTLcSO/1olgAaijyBtMUFN
 9AvjyUpJqasIzhIzF7Wol+FwKjRJqoDaN5dk5h7CLfp0XLE1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The single helper for both enable and disable cases is too complicated,
especially if we start adding more code to these helpers. Split it into
irq_enable and irq_disable cases.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 36 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 65 +++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 46 ++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 29 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          | 62 ++++++++++++++++-----
 6 files changed, 158 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6a4b489d44e5..e0ff7d8aa199 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -714,7 +714,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 }
 
-static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
+static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	int i;
@@ -726,14 +726,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	DPU_DEBUG_ENC(dpu_enc, "enable:%d\n", enable);
+	DPU_DEBUG_ENC(dpu_enc, "\n");
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys->ops.irq_control)
-			phys->ops.irq_control(phys, enable);
+		phys->ops.irq_enable(phys);
+	}
+}
+
+static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	if (!drm_enc) {
+		DPU_ERROR("invalid encoder\n");
+		return;
 	}
 
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		phys->ops.irq_disable(phys);
+	}
 }
 
 static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
@@ -759,11 +777,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 		pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 		/* enable all the irq */
-		_dpu_encoder_irq_control(drm_enc, true);
+		_dpu_encoder_irq_enable(drm_enc);
 
 	} else {
 		/* disable all the irq */
-		_dpu_encoder_irq_control(drm_enc, false);
+		_dpu_encoder_irq_disable(drm_enc);
 
 		/* disable DPU core clks */
 		pm_runtime_put_sync(&dpu_kms->pdev->dev);
@@ -824,7 +842,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, true);
 
@@ -879,7 +897,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		if (is_vid_mode &&
 			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		}
 		/* skip if is already OFF or IDLE, resources are off already */
 		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
@@ -954,7 +972,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode)
-			_dpu_encoder_irq_control(drm_enc, false);
+			_dpu_encoder_irq_disable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 993f26343331..8c5b0c853572 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -85,7 +85,8 @@ struct dpu_encoder_phys;
  * @handle_post_kickoff:	Do any work necessary post-kickoff work
  * @trigger_start:		Process start event on physical encoder
  * @needs_single_flush:		Whether encoder slaves need to be flushed
- * @irq_control:		Handler to enable/disable all the encoder IRQs
+ * @irq_enable:			Handler to enable all the encoder IRQs
+ * @irq_disable:		Handler to disable all the encoder IRQs
  * @prepare_idle_pc:		phys encoder can update the vsync_enable status
  *                              on idle power collapse prepare
  * @restore:			Restore all the encoder configs.
@@ -110,7 +111,8 @@ struct dpu_encoder_phys_ops {
 	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
 	bool (*needs_single_flush)(struct dpu_encoder_phys *phys_enc);
-	void (*irq_control)(struct dpu_encoder_phys *phys, bool enable);
+	void (*irq_enable)(struct dpu_encoder_phys *phys);
+	void (*irq_disable)(struct dpu_encoder_phys *phys);
 	void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a301e2833177..de826f9745e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -291,40 +291,42 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	return ret;
 }
 
-static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
-	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, phys_enc->vblank_refcount);
-
-	if (enable) {
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG],
-				dpu_encoder_phys_cmd_pp_tx_done_irq,
-				phys_enc);
+	trace_dpu_enc_phys_cmd_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_pp->idx - PINGPONG_0,
+					  phys_enc->vblank_refcount);
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_PINGPONG],
+				       dpu_encoder_phys_cmd_pp_tx_done_irq,
+				       phys_enc);
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_cmd_underrun_irq,
+				       phys_enc);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_cmd_underrun_irq,
-				phys_enc);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
-
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START],
-					dpu_encoder_phys_cmd_ctl_start_irq,
-					phys_enc);
-	} else {
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START]);
+					       phys_enc->irq[INTR_IDX_CTL_START],
+					       dpu_encoder_phys_cmd_ctl_start_irq,
+					       phys_enc);
+}
 
+static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_cmd_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_pp->idx - PINGPONG_0,
+					   phys_enc->vblank_refcount);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG]);
-	}
+						 phys_enc->irq[INTR_IDX_CTL_START]);
+
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -713,7 +715,8 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_tx_complete = dpu_encoder_phys_cmd_wait_for_tx_complete;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
-	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
+	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
 	ops->restore = dpu_encoder_phys_cmd_enable_helper;
 	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
 	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..9743ec43d862 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -615,30 +615,33 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 	}
 }
 
-static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_vid_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
 	int ret;
 
-	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
-			    phys_enc->hw_intf->idx - INTF_0,
-			    enable,
-			   phys_enc->vblank_refcount);
+	trace_dpu_enc_phys_vid_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_intf->idx - INTF_0,
+					  phys_enc->vblank_refcount);
 
-	if (enable) {
-		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
-		if (WARN_ON(ret))
-			return;
-
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_vid_underrun_irq,
-				phys_enc);
-	} else {
-		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-	}
+	ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
+	if (WARN_ON(ret))
+		return;
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_vid_underrun_irq,
+				       phys_enc);
+}
+
+static void dpu_encoder_phys_vid_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_vid_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_intf->idx - INTF_0,
+					   phys_enc->vblank_refcount);
+
+	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					 phys_enc->irq[INTR_IDX_UNDERRUN]);
 }
 
 static int dpu_encoder_phys_vid_get_line_count(
@@ -689,7 +692,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_tx_complete;
-	ops->irq_control = dpu_encoder_phys_vid_irq_control;
+	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a..602013725484 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -511,21 +511,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 }
 
 /**
- * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
+ * dpu_encoder_phys_wb_irq_enable - irq control of WB
  * @phys:	Pointer to physical encoder
- * @enable:	indicates enable or disable interrupts
  */
-static void dpu_encoder_phys_wb_irq_ctrl(
-		struct dpu_encoder_phys *phys, bool enable)
+static void dpu_encoder_phys_wb_irq_enable(struct dpu_encoder_phys *phys)
 {
 
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
 
-	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
+	if (atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
 		dpu_core_irq_register_callback(phys->dpu_kms,
-				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
-	else if (!enable &&
-			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
+					       phys->irq[INTR_IDX_WB_DONE],
+					       dpu_encoder_phys_wb_done_irq,
+					       phys);
+}
+
+/**
+ * dpu_encoder_phys_wb_irq_disable - irq control of WB
+ * @phys:	Pointer to physical encoder
+ */
+static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
+{
+
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
+
+	if (atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
@@ -785,7 +795,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->trigger_start = dpu_encoder_helper_trigger_start;
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
-	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->irq_enable = dpu_encoder_phys_wb_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_wb_irq_disable;
 	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
 
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 35d03b121a0b..95ce7647ff76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -514,24 +514,41 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
 		  __entry->expected_time, __entry->atomic_cnt)
 );
 
-TRACE_EVENT(dpu_enc_phys_cmd_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp, bool enable,
+TRACE_EVENT(dpu_enc_phys_cmd_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
 		 int refcnt),
-	TP_ARGS(drm_id, pp, enable, refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,		drm_id	)
+		__field(	enum dpu_pingpong,	pp	)
+		__field(	int,			refcnt	)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->pp = pp;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
+		  __entry->refcnt)
+);
+
+TRACE_EVENT(dpu_enc_phys_cmd_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
+		 int refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id	)
 		__field(	enum dpu_pingpong,	pp	)
-		__field(	bool,			enable	)
 		__field(	int,			refcnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->pp = pp;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, pp=%d, enable=%s, refcnt=%d", __entry->drm_id,
-		  __entry->pp, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
 		  __entry->refcnt)
 );
 
@@ -592,24 +609,41 @@ TRACE_EVENT(dpu_enc_phys_vid_post_kickoff,
 	TP_printk("id=%u, intf_idx=%d", __entry->drm_id, __entry->intf_idx)
 );
 
-TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx, bool enable,
+TRACE_EVENT(dpu_enc_phys_vid_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
 		 int refcnt),
-	TP_ARGS(drm_id, intf_idx, enable, refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,	drm_id		)
+		__field(	enum dpu_intf,	intf_idx	)
+		__field(	int,		refcnt		)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->intf_idx = intf_idx;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
+		  __entry->drm_id)
+);
+
+TRACE_EVENT(dpu_enc_phys_vid_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
+		 int refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id		)
 		__field(	enum dpu_intf,	intf_idx	)
-		__field(	bool,		enable		)
 		__field(	int,		refcnt		)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->intf_idx = intf_idx;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, intf_idx=%d enable=%s refcnt=%d", __entry->drm_id,
-		  __entry->intf_idx, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
 		  __entry->drm_id)
 );
 

-- 
2.39.2

