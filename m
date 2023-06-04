Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC987217EC
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 16:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2EE10E150;
	Sun,  4 Jun 2023 14:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6979110E141
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 14:45:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso462092e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685889916; x=1688481916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+O+AJJrl3XVIr977gOcXum1cp8dXrKD4I3HRUiHedRM=;
 b=Av+ifvSycv0NMjMPqH7BpSFUV/oHXbLy3Q7K2IVFIL9Ra1qjYzaeT/iT+9XYZxzqXJ
 6SBKDTPOePibADf5aT3ROs1O+79AqAKwvfB0zXducN2XP9zKA/rtZsWatlsInmIq78uS
 2NvJLp1VJ/px/j81Ax7G0DmTr1vv/Nu14Y4FAyAK3RWklHGQGDLiEOTOHv9IgpyC5Y/Z
 A3tNHxGpcanrrGlinoMQHfq1QWtLWwuP6t1Ds62k5XV36eC9DfiPEKY8eY6jS2txWT8C
 X9cHftGdSewkbKO6FcjLYNCmuFf8EPFv4o8MhnX7+M1zx22iRELcGVV3/pAOomqNTisZ
 YF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685889916; x=1688481916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+O+AJJrl3XVIr977gOcXum1cp8dXrKD4I3HRUiHedRM=;
 b=duPwFw2W2/bK7g4I0QNu3DxE+M93hoA1whJ1t8cP0zCQRRWdv3OWqMNVAmQncSBpHq
 EM29x5elBgG1lRt1TCn9CjJDaWtCRWsK9lKhjvt24z0OG7BpZjv8dk74LgGkljNBGaG6
 AHRgtMVr4KIxVWR68sT6KlZwHOCcQjBKLnHT00tg2YkK85IiZVK4boe4vG2b8oWe6CqJ
 nADFdPqv2ohCw9JVIVQdyPP9scR9YP5pUQKtaAo98FS5s0zvQnw1CMqng3u3K+a1ymqL
 9CeI2YdvlnZWL/ooIC8QLDBXt2a4lOxagEftlQU2beyVFcUOQRVl0BAlOiQhVFGRXvXv
 0eSg==
X-Gm-Message-State: AC+VfDyNiz3+LPb8KekJRafAvRNDEELUUbbGr6vcKs03DuHRiIoO+hFg
 s2fwUGFHbmtH68KJMrLIHpjC6Yt51WwVbnmAl9U=
X-Google-Smtp-Source: ACHHUZ4UB8BL2TtfbfxQgFzZ6X0IlKfd9AOVA2GWSvIkQi9WTUJ0yHXU/RGR09iq+FVF0MwZ1eRk7Q==
X-Received: by 2002:a05:6512:11c8:b0:4f3:bb93:4c8b with SMTP id
 h8-20020a05651211c800b004f3bb934c8bmr3725488lfr.19.1685889916122; 
 Sun, 04 Jun 2023 07:45:16 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 07:45:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/3] drm/msm/dpu: split irq_control into irq_enable and
 _disable
Date: Sun,  4 Jun 2023 17:45:12 +0300
Message-Id: <20230604144514.949628-2-dmitry.baryshkov@linaro.org>
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

The single helper for both enable and disable cases is too complicated,
especially if we start adding more code to these helpers. Split it into
irq_enable and irq_disable cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 ++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 63 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 48 +++++++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 29 ++++++---
 5 files changed, 112 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2e1873d29c4b..7c131c5cbe71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -717,7 +717,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 }
 
-static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
+static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	int i;
@@ -729,14 +729,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 
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
@@ -762,11 +780,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
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
@@ -827,7 +845,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, true);
 
@@ -882,7 +900,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		if (is_vid_mode &&
 			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		}
 		/* skip if is already OFF or IDLE, resources are off already */
 		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
@@ -957,7 +975,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode)
-			_dpu_encoder_irq_control(drm_enc, false);
+			_dpu_encoder_irq_disable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..faf033cd086e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,7 +84,8 @@ struct dpu_encoder_phys;
  * @handle_post_kickoff:	Do any work necessary post-kickoff work
  * @trigger_start:		Process start event on physical encoder
  * @needs_single_flush:		Whether encoder slaves need to be flushed
- * @irq_control:		Handler to enable/disable all the encoder IRQs
+ * @irq_enable:			Handler to enable all the encoder IRQs
+ * @irq_disable:		Handler to disable all the encoder IRQs
  * @prepare_idle_pc:		phys encoder can update the vsync_enable status
  *                              on idle power collapse prepare
  * @restore:			Restore all the encoder configs.
@@ -111,7 +112,8 @@ struct dpu_encoder_phys_ops {
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
index 4f8c9187f76d..3422b49f23c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -280,40 +280,44 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	return ret;
 }
 
-static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
 	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, atomic_read(&phys_enc->vblank_refcount));
-
-	if (enable) {
+					phys_enc->hw_pp->idx - PINGPONG_0,
+					true,
+					atomic_read(&phys_enc->vblank_refcount));
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
-				phys_enc->irq[INTR_IDX_PINGPONG],
-				dpu_encoder_phys_cmd_pp_tx_done_irq,
-				phys_enc);
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_cmd_underrun_irq,
-				phys_enc);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
+					       phys_enc->irq[INTR_IDX_CTL_START],
+					       dpu_encoder_phys_cmd_ctl_start_irq,
+					       phys_enc);
+}
 
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START],
-					dpu_encoder_phys_cmd_ctl_start_irq,
-					phys_enc);
-	} else {
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START]);
+static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
+			phys_enc->hw_pp->idx - PINGPONG_0,
+			false,
+			atomic_read(&phys_enc->vblank_refcount));
 
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG]);
-	}
+				phys_enc->irq[INTR_IDX_CTL_START]);
+
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -744,7 +748,8 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_vblank = dpu_encoder_phys_cmd_wait_for_vblank;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
-	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
+	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
 	ops->restore = dpu_encoder_phys_cmd_enable_helper;
 	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
 	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e26629e9e303..a550b290246c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -611,30 +611,35 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 	}
 }
 
-static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_vid_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
 	int ret;
 
 	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
-			    phys_enc->hw_intf->idx - INTF_0,
-			    enable,
-			    atomic_read(&phys_enc->vblank_refcount));
-
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
+					phys_enc->hw_intf->idx - INTF_0,
+					true,
+					atomic_read(&phys_enc->vblank_refcount));
+
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
+	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
+					phys_enc->hw_intf->idx - INTF_0,
+					false,
+					atomic_read(&phys_enc->vblank_refcount));
+
+	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					 phys_enc->irq[INTR_IDX_UNDERRUN]);
 }
 
 static int dpu_encoder_phys_vid_get_line_count(
@@ -687,7 +692,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
-	ops->irq_control = dpu_encoder_phys_vid_irq_control;
+	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e9325cafb1a8..858fe6656c9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -382,21 +382,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
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
 
@@ -670,7 +680,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->trigger_start = dpu_encoder_helper_trigger_start;
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
-	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->irq_enable = dpu_encoder_phys_wb_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_wb_irq_disable;
 	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
 
 }
-- 
2.39.2

