Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FC7218A6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9931210E177;
	Sun,  4 Jun 2023 16:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD2B10E165
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4898542e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896087; x=1688488087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OD4VSBop6Xe6IAXvlnXwYSBEWEofkBHKAtiY14/IogE=;
 b=bny4Q7NjewEpfdbJkyheQLvx2+J3u5uRdFETmKLnQS+GIY6uiF6Ss82ftMpLrE+LHe
 dbwdFlEYZuXSLiOMVBWff/12ZXS4QBARzZ0GRQ7qwQ7wpwwjjcUU/x0ja9vge3ZCm0zV
 y1lpqixqXthBUbe8lf0c8R3fcRXPIlq9GU9Bda5vs+b7MlFvGCCFZyFOLWrQJD1FjqYd
 Q6KmN+AD8vZ0Jes2GttYzwFB3RDEyBlmphU9bWIHkRO1g02uesm3hIWakasBeyIvaP6L
 vc5JPtSDO82Aj8vTWT0aJY2Vsl67DTPqJ7dhrJ6yPYXy/3qVEyP8U8CRKRd8bL50nee0
 0D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896087; x=1688488087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OD4VSBop6Xe6IAXvlnXwYSBEWEofkBHKAtiY14/IogE=;
 b=EfhH0+IMtR6kEUH4Eyk8s7p5qmfMqOHF3NC1zsAYAHXA3bjuadccZw1cvMMKcyY6x8
 JyXcbWJQOHwQQPJkFMMbwrT6iNMhG+BsruL8IRt6AvC8xCjrtzTx3Y20OILrQ0h0XL2c
 ah2quKamC6vZLtBz1BAX3yXDca8azpG2gB9cRpD3QmofsVKqXOG9zRstL889Lw6B6C8D
 6Gf+30GZfw9c3YD4JvF7S2BCOnymtjWMu0B1uEnKMVn8EzSil1aeqZLhuXgDjlV6vEye
 0C3lY9yLIpeBUxMX8MUOJL8v0qYiPVgqfsi200llS1BLmaYz3sTzB4z8Uqr1eYO9CSXj
 7PeQ==
X-Gm-Message-State: AC+VfDyZr9rgbFOmLFToe9nzNr4Q47GKk5kXpQB/iAE5nP1ORqsF2d5w
 6fdSvu+bONGERH8Oayn39Xfieg==
X-Google-Smtp-Source: ACHHUZ4Ieepkzan1a4s1pPV+qHF90erGblcDqHtOP4QYqPtROu/MDxlrvormUU7MsyhtDyjXpjGx8w==
X-Received: by 2002:ac2:420d:0:b0:4f3:845e:f9e with SMTP id
 y13-20020ac2420d000000b004f3845e0f9emr4020141lfh.13.1685896087255; 
 Sun, 04 Jun 2023 09:28:07 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 8/8] drm/msm/dpu: shift IRQ indices by 1
Date: Sun,  4 Jun 2023 19:28:00 +0300
Message-Id: <20230604162800.1048327-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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

In order to simplify IRQ declarations, shift IRQ indices by 1. This
makes 0 the 'no IRQ' value. Thanks to this change, we do no longer have
to explicitly set the 'no interrupt' fields in catalog structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 47 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  8 ++--
 9 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 182e91bb7dda..47a719449798 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -141,9 +141,9 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sc7280_pp_sblk,
-			-1),
+			DPU_NO_IRQ),
 	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sc7280_pp_sblk,
-			-1),
+			DPU_NO_IRQ),
 };
 
 static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 3d48d961977f..8c08c856d38c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -145,9 +145,9 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31)),
 	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
-			-1),
+			DPU_NO_IRQ),
 	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
-			-1),
+			DPU_NO_IRQ),
 };
 
 static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index ba06312cbb16..7c286bafb948 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -37,7 +37,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
  */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_core_irq_register_callback - For registering callback function on IRQ
@@ -52,7 +52,7 @@ u32 dpu_core_irq_read(
  */
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
+		unsigned int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
@@ -67,7 +67,7 @@ int dpu_core_irq_register_callback(
  */
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_debugfs_core_irq_init - register core irq debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 701c5265c98d..d96eb1a8fd72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2540,7 +2540,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
+		phys_enc->irq[i] = DPU_NO_IRQ;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f91661a69888..e203f3775ed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -193,7 +193,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_ctlstart_cnt;
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
-	int irq[INTR_IDX_MAX];
+	unsigned int irq[INTR_IDX_MAX];
 	bool has_intf_te;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 42f8c12c91a2..356280aefa3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -489,7 +489,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.merge_3d = _merge_3d, \
 	.sblk = &_sblk, \
 	.intr_done = _done, \
-	.intr_rdptr = -1, \
 	}
 #define PP_BLK_NO_TE(_name, _id, _base, _features, _merge_3d, _sblk, _done) \
 	{\
@@ -499,7 +498,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.merge_3d = _merge_3d, \
 	.sblk = &_sblk, \
 	.intr_done = _done, \
-	.intr_rdptr = -1, \
 	}
 #define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
 	{\
@@ -546,7 +544,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.prog_fetch_lines_worst_case = _progfetch, \
 	.intr_underrun = _underrun, \
 	.intr_vsync = _vsync, \
-	.intr_tear_rd_ptr = -1, \
 	}
 
 /* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d59a9027c4b6..d6365144af8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -500,7 +500,7 @@ struct dpu_ubwc_cfg {
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
-	s32 intr_start;
+	unsigned int intr_start;
 };
 
 /**
@@ -563,8 +563,8 @@ struct dpu_dspp_cfg  {
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
 	u32 merge_3d;
-	s32 intr_done;
-	s32 intr_rdptr;
+	unsigned int intr_done;
+	unsigned int intr_rdptr;
 	const struct dpu_pingpong_sub_blks *sblk;
 };
 
@@ -608,9 +608,9 @@ struct dpu_intf_cfg  {
 	u32 type;   /* interface type*/
 	u32 controller_id;
 	u32 prog_fetch_lines_worst_case;
-	s32 intr_underrun;
-	s32 intr_vsync;
-	s32 intr_tear_rd_ptr;
+	unsigned int intr_underrun;
+	unsigned int intr_vsync;
+	unsigned int intr_tear_rd_ptr;
 };
 
 /**
@@ -629,7 +629,7 @@ struct dpu_wb_cfg {
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
-	s32 intr_wb_done;
+	unsigned int intr_wb_done;
 	const u32 *format_list;
 	u32 num_formats;
 	enum dpu_clk_ctrl_type clk_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 91d3818956ce..633d22152113 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -181,7 +181,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
-							       int irq_idx)
+							       unsigned int irq_idx)
 {
 	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
 }
@@ -191,7 +191,7 @@ static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *d
  * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
-static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
+static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
 
@@ -213,7 +213,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
-	int irq_idx;
+	unsigned int irq_idx;
 	u32 irq_status;
 	u32 enable_mask;
 	int bit;
@@ -269,7 +269,8 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
-static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr,
+					 unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -279,7 +280,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (irq_idx == DPU_NO_IRQ || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -318,7 +319,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr,
+					  unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -328,7 +330,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (irq_idx == DPU_NO_IRQ || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -403,7 +405,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
+		      unsigned int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -413,13 +416,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	if (!intr)
 		return 0;
 
-	if (irq_idx < 0) {
-		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
-				__builtin_return_address(0), irq_idx);
-		return 0;
-	}
-
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (irq_idx == DPU_NO_IRQ || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
@@ -477,9 +474,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 	kfree(intr);
 }
 
-int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg),
-		void *irq_arg)
+int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
+				   unsigned int irq_idx,
+				   void (*irq_cb)(void *arg),
+				   void *irq_arg)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
@@ -490,7 +488,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (irq_idx == DPU_NO_IRQ || irq_idx > dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -523,13 +521,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	return 0;
 }
 
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
+				     unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (irq_idx == DPU_NO_IRQ || irq_idx > dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -564,7 +563,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -599,7 +598,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -615,7 +614,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 2238e3f724db..173022df5ce2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -41,9 +41,11 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
-#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
-#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
-#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
+#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset + 1)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx - 1) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx - 1) % 32)
+
+#define DPU_NO_IRQ			0
 
 struct dpu_hw_intr_entry {
 	void (*cb)(void *arg);
-- 
2.39.2

