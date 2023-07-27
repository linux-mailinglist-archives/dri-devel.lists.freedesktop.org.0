Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F07656C6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9089304;
	Thu, 27 Jul 2023 15:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4C410E5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:05:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-522462d8416so1383097a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690470298; x=1691075098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9wMrYOqpVkCtoqd1u6PtCNzvezXfxpRgShKixL1X+c=;
 b=Lg5yiRkfsGYxNy9+5IVn60s7LFUQu7ujVaPpVSbF89QGi7/W15yDCuzAXFTqPS6xDr
 VixhczPcGyjUoaiMugtK/ndrSqkvGq7lhw7buuaLCzO1WuLxPOzw9GXf6H+ilS6fKy9W
 uZc9zOwi6j4xezXxX4BeqatN5NZSRjBf9kJTf8x+kOEmW7kXBMqXwrdbDcM31oQMRIdG
 6uojE7evNuwLdD5Kk59scLTzuB8JWN3cX2SinL5XN06JxhqE0+khgPBnbQ+BEdN2XXv5
 8PQv0MXn6PHhyD4/NYNcojfnIPlPCFu7J+AsDSliNkmhoQV108spJkcD3xZhlHHMH6sV
 /f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470298; x=1691075098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9wMrYOqpVkCtoqd1u6PtCNzvezXfxpRgShKixL1X+c=;
 b=B8vzvquSINUQnd3icaJ0uP2FofZUdAtwvHLtYXjaLTGl+e1w5t6VAiCFby73JVqOwM
 CuS3ni+hA7xxLSsezGnWY4Z/acMHBKrp2lr6FuguwAEgnsN526Mgt/+6vxBVp0wwBvSG
 5rMQWjtN9pDov9LGWzle/WLCP8X8HVvyU1M7PLAY/PyytH9P2TI2/Ogtl4s6OuFh/r3s
 Slk2hIrLo+FQ/WHPC/LaFRy0f8dH3sqxAvtLl8cOj447RWplbVYbRAEUTbRdrEyIKji/
 1jImzyZy43gXasSTC0W0Zec1WDgNs9r5ktpehr/d/nuVPAIM/CB4lbiomPnGkgdRmkz3
 IdpQ==
X-Gm-Message-State: ABy/qLaCdKGvdibHgBAX+1HVPKRMKfYAbdLAJBgT+xSUkhwfBh9UQaLW
 VvgHVgPI7K0wxEe82Xr28bEiY3GHImmy5PC3e98=
X-Google-Smtp-Source: APBJJlHHgkUat4F2FOqpJ0O5mSxBi32lXigIB0W3wUoJPgDvTQRkxtOuen62Z3pqcgX8IAM/FfVIAA==
X-Received: by 2002:a17:906:3114:b0:992:7594:e6b2 with SMTP id
 20-20020a170906311400b009927594e6b2mr1987022ejx.77.1690470298389; 
 Thu, 27 Jul 2023 08:04:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/4] drm/msm/dpu: remove irq_idx argument from IRQ callbacks
Date: Thu, 27 Jul 2023 18:04:52 +0300
Message-Id: <20230727150455.1489575-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
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

