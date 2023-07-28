Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A000476790C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9913210E7A2;
	Fri, 28 Jul 2023 23:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EBB10E79F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:03 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so40351091fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FEKk8pG0VsyNp42xpmgSixQYCR++nZtmu3MxU/a/1Go=;
 b=DIstl+yq79MgjgIZXtmHrcwAa/UiLtBGXcfBkyt10jXbFtEYa/LbiY3moWJrjP/mLZ
 gzscHzQsO02wxnSGsGEWgE9xkReYb8LAEf60xJ9z0bqbygd2dqA11Fh29JvT1C/evITd
 OMPrzmAboj0AS6kmK/teiTrrkVtT2FznaxUaJ5QP1716+YC718qc8zW12mxfCg/KCcpq
 4kyAxbuv5WsWwvESrGS7yCSAD4lCE/oqptFOWyBzQUq3jWTXtnmVVFWJB1qIf6ovi8SW
 Wj8AGRgzbuZo+ATaNv355zzWAcuBWCJIzQfCDM4oq/2CzemQ6VX5OmKAtETm983znqkF
 D7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEKk8pG0VsyNp42xpmgSixQYCR++nZtmu3MxU/a/1Go=;
 b=O+5HvJ8GKbtxsyA0F0ysdVb/5vI6uXliG4axoXAzkl8QyIaEz3K3bGefapwdzZlucj
 M0h0ta+S5QKm+KGIf5yHH55B8MaP3H7fxWoUMYuCy9v+Yzfc3TxVu9bZtDpTJXCHRRK4
 iQPf52pqIqrgpMbPscUPlNq0sEF/Bi1XQ364j3x37YHG9IYCZl6zIEckCFETcVpGmcY0
 j2guQNJR0txkUx+9CYbKGu/ouiYxAjyT97tM2JgSX8AZ7aj8X/XoPVq2Q1H/50oCiR3+
 VIWrR9RQdLfWI22c1ywD4UJzZ55TMgF0ZSXc5o4QyweJQFm62IFTZBtAEQo63LaGX7Tl
 /+OQ==
X-Gm-Message-State: ABy/qLYEdCLOKnKbSEMmAE0Adn2bgOQvTOLoZ4dprteaBZ1DJcfzIEz9
 WcyOBX+dcMqNF7jxYoGFioumqQ==
X-Google-Smtp-Source: APBJJlF9JqTHKtiRIoSyRbqc+wVU51aBiGYwUWMQLNcxbDSJjVmzXaM0mn1aYxP6nP1ZqwSWVbvblA==
X-Received: by 2002:a2e:9844:0:b0:2b8:4079:fd9d with SMTP id
 e4-20020a2e9844000000b002b84079fd9dmr2864614ljj.29.1690587122123; 
 Fri, 28 Jul 2023 16:32:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 1/6] drm/msm/dpu: remove irq_idx argument from IRQ callbacks
Date: Sat, 29 Jul 2023 02:31:55 +0300
Message-Id: <20230728233200.151735-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
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

There is no point in passing the IRQ index to IRQ callbacks, no function
uses that. Drop it at last.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 16 +++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  2 +-
 8 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index b5b6e7031fb9..ba06312cbb16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -53,7 +53,7 @@ u32 dpu_core_irq_read(
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
 		int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f0a2a1dca741..051447a3620c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -352,7 +352,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
 	u32 irq_status;
@@ -399,7 +399,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			func(phys_enc, irq);
+			func(phys_enc);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..f91661a69888 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -365,7 +365,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..9589fe719452 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -76,7 +76,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
 }
 
-static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	unsigned long lock_flags;
@@ -103,7 +103,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("pp_done_irq");
 }
 
-static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
@@ -126,7 +126,7 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("rd_ptr_irq");
 }
 
-static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
@@ -139,7 +139,7 @@ static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("ctl_start_irq");
 }
 
-static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c2189e58de6a..a01fda711883 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -297,7 +297,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	programmable_fetch_config(phys_enc, &timing_params);
 }
 
-static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_vblank_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_hw_ctl *hw_ctl;
@@ -334,7 +334,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("vblank_irq");
 }
 
-static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a466ff70a4d6..7df5e7f4a0e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -345,7 +345,11 @@ static void dpu_encoder_phys_wb_setup(
 
 }
 
-static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
+/**
+ * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
+ * @arg:	Pointer to writeback encoder
+ */
+static void dpu_encoder_phys_wb_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -371,16 +375,6 @@ static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
 	wake_up_all(&phys_enc->pending_kickoff_wq);
 }
 
-/**
- * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
- * @arg:	Pointer to writeback encoder
- * @irq_idx:	interrupt index
- */
-static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
-{
-	_dpu_encoder_phys_wb_frame_done_helper(arg);
-}
-
 /**
  * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
  * @phys:	Pointer to physical encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index e3c50439f80a..01a9ccfcd54b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -217,7 +217,7 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 	/*
 	 * Perform registered function callback
 	 */
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -507,7 +507,7 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
 	unsigned long irq_flags;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index dab761e54863..e2b00dd32619 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -58,7 +58,7 @@ struct dpu_hw_intr {
 	const struct dpu_intr_reg *intr_set;
 
 	struct {
-		void (*cb)(void *arg, int irq_idx);
+		void (*cb)(void *arg);
 		void *arg;
 		atomic_t count;
 	} irq_tbl[];
-- 
2.39.2

