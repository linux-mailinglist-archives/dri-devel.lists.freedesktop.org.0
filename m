Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AB4A5FBC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9918110E660;
	Tue,  1 Feb 2022 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50F10E660
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:11:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e9so24602935ljq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 07:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6lnpyo73afN0IHz+DKpWBo1aVh2379YVtYC8DPNtkA=;
 b=aR3L5CkHwslHyWfY8NQbBaC7O9Kcbcf68nnYaaWIxBa8N8VGYlyzAM+rg+1Us21UK8
 GYKiocn9bKIf6xnwcXKzCwUolSPXMyYIerUfdkq2ecHG+I1t8bnUXsdsOtt8bVScfiW2
 3XYZa2oXR9i33pKZ0sKBjthVQFlnmBcJn9pqmyjQgHZs5C39cS4YgDLS0XWDb1Vi1Rpe
 BvI6ikZQHQwpIU1TUZYdMgqeQZ/8c0Ig3WDpKkZimjWiMgC29xyJn1DvR4zSo+1txBnL
 qySrjHvi6GWn2bFCuqIghTjP/aWTMHfZMu9H1/FDBZ6Bw20ZBO6u4+1SZQQRbwZ4v3E6
 zStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6lnpyo73afN0IHz+DKpWBo1aVh2379YVtYC8DPNtkA=;
 b=jVrYeFAssMoIU/m6jMUirPqy+AyNpWP5vwcnTX7CvHTGDKAwncsRHjdyQIyHUu7peD
 K1e0gPPB5yuR2M+nWA/Ou9rjdXqU4W697SPj7uri0+LNCyrwv3zDtAopjY5wsCJwmjBk
 vXYugeunzK+Dyo5xNJqrziRFDyua5dwREC8Vtam4osbXlI6J6UHq7ylnUU5nxNdMJYd9
 MMZsUgURnvRk9Y/A6suQuW4X7U4LvFVZiT76JTjh3bMcaOj3DwNtBUIDtOSEkHTrOfUK
 qt0eSICtr19NcfmD9nlAS/Uh3t2B1wfrJKqAtj7XctFAXt402BGnVyDN8cxgJpaGUncN
 2x1g==
X-Gm-Message-State: AOAM531CrgKUBNLDTlcEpGYQHD92loyhRSefUYW9fyU9go1D5wzVcKbX
 QnKJ0yESqX3WBHoYZ7yQEzQ1Og==
X-Google-Smtp-Source: ABdhPJz9aC8mTDnA5uVD/9FCbveuCPgrKc68lQPRWpVEddZKysRdrAqXbeWKO9y/kHz+/p36hs7HnA==
X-Received: by 2002:a05:651c:4c8:: with SMTP id
 e8mr14087663lji.267.1643728260715; 
 Tue, 01 Feb 2022 07:11:00 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y6sm1337723lfk.157.2022.02.01.07.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:11:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/6] drm/msm/dpu: allow just single IRQ callback
Date: Tue,  1 Feb 2022 18:10:53 +0300
Message-Id: <20220201151056.2480055-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU interrupts code allows multiple callbacks per interrut. In reality
none of the interrupts is shared between blocks (and will probably never
be). Drop support for registering multiple callbacks per interrupt to
simplify interrupt handling code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  10 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 140 ++++++------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  12 +-
 9 files changed, 75 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 6dce5d89f817..b5b6e7031fb9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -44,10 +44,8 @@ u32 dpu_core_irq_read(
  *                             interrupt
  * @dpu_kms:		DPU handle
  * @irq_idx:		irq index
- * @irq_cb:		IRQ callback structure, containing callback function
- *			and argument. Passing NULL for irq_cb will unregister
- *			the callback for the given irq_idx
- *			This must exist until un-registration.
+ * @irq_cb:		IRQ callback funcion.
+ * @irq_arg:		IRQ callback argument.
  * @return:		0 for success registering callback, otherwise failure
  *
  * This function supports registration of multiple callbacks for each interrupt.
@@ -55,25 +53,21 @@ u32 dpu_core_irq_read(
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
 		int irq_idx,
-		struct dpu_irq_callback *irq_cb);
+		void (*irq_cb)(void *arg, int irq_idx),
+		void *irq_arg);
 
 /**
  * dpu_core_irq_unregister_callback - For unregistering callback function on IRQ
  *                             interrupt
  * @dpu_kms:		DPU handle
  * @irq_idx:		irq index
- * @irq_cb:		IRQ callback structure, containing callback function
- *			and argument. Passing NULL for irq_cb will unregister
- *			the callback for the given irq_idx
- *			This must match with registration.
  * @return:		0 for success registering callback, otherwise failure
  *
  * This function supports registration of multiple callbacks for each interrupt.
  */
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
-		struct dpu_irq_callback *irq_cb);
+		int irq_idx);
 
 /**
  * dpu_debugfs_core_irq_init - register core irq debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5576b8a3e6ee..17ca149e7dcd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -311,7 +311,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			irq->cb.func(phys_enc, irq->irq_idx);
+			irq->func(phys_enc, irq->irq_idx);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
@@ -352,7 +352,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
 	}
 
 	ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
-			&irq->cb);
+			irq->func, phys_enc);
 	if (ret) {
 		DPU_ERROR_PHYS(phys_enc,
 			"failed to register IRQ callback for %s\n",
@@ -383,8 +383,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 		return 0;
 	}
 
-	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
-			&irq->cb);
+	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx);
 	if (ret) {
 		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
 			  DRMID(phys_enc->parent), intr_idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..80d87871fd94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -174,7 +174,7 @@ struct dpu_encoder_irq {
 	const char *name;
 	enum dpu_intr_idx intr_idx;
 	int irq_idx;
-	struct dpu_irq_callback cb;
+	void (*func)(void *arg, int irq_idx);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..a0652bdcf59b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -782,30 +782,28 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 	for (i = 0; i < INTR_IDX_MAX; i++) {
 		irq = &phys_enc->irq[i];
-		INIT_LIST_HEAD(&irq->cb.list);
 		irq->irq_idx = -EINVAL;
-		irq->cb.arg = phys_enc;
 	}
 
 	irq = &phys_enc->irq[INTR_IDX_CTL_START];
 	irq->name = "ctl_start";
 	irq->intr_idx = INTR_IDX_CTL_START;
-	irq->cb.func = dpu_encoder_phys_cmd_ctl_start_irq;
+	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
 
 	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
 	irq->name = "pp_done";
 	irq->intr_idx = INTR_IDX_PINGPONG;
-	irq->cb.func = dpu_encoder_phys_cmd_pp_tx_done_irq;
+	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
 
 	irq = &phys_enc->irq[INTR_IDX_RDPTR];
 	irq->name = "pp_rd_ptr";
 	irq->intr_idx = INTR_IDX_RDPTR;
-	irq->cb.func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
+	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
 
 	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
 	irq->name = "underrun";
 	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->cb.func = dpu_encoder_phys_cmd_underrun_irq;
+	irq->func = dpu_encoder_phys_cmd_underrun_irq;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..407e45e2010b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -725,20 +725,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	for (i = 0; i < INTR_IDX_MAX; i++) {
 		irq = &phys_enc->irq[i];
-		INIT_LIST_HEAD(&irq->cb.list);
 		irq->irq_idx = -EINVAL;
-		irq->cb.arg = phys_enc;
 	}
 
 	irq = &phys_enc->irq[INTR_IDX_VSYNC];
 	irq->name = "vsync_irq";
 	irq->intr_idx = INTR_IDX_VSYNC;
-	irq->cb.func = dpu_encoder_phys_vid_vblank_irq;
+	irq->func = dpu_encoder_phys_vid_vblank_irq;
 
 	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
 	irq->name = "underrun";
 	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->cb.func = dpu_encoder_phys_vid_underrun_irq;
+	irq->func = dpu_encoder_phys_vid_underrun_irq;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 85404c9ab4e1..8297498f2279 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -145,21 +145,17 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
-	struct dpu_irq_callback *cb;
-
 	VERB("irq_idx=%d\n", irq_idx);
 
-	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]))
+	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
 		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
 
-	atomic_inc(&dpu_kms->hw_intr->irq_counts[irq_idx]);
+	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
 
 	/*
 	 * Perform registered function callback
 	 */
-	list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[irq_idx], list)
-		if (cb->func)
-			cb->func(cb->arg, irq_idx);
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -408,24 +404,18 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
+	int nirq = MDP_INTR_MAX * 32;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
+	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
 	__intr_offset(m, addr, &intr->hw);
 
-	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
-
-	intr->cache_irq_mask = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
-			GFP_KERNEL);
-	if (intr->cache_irq_mask == NULL) {
-		kfree(intr);
-		return ERR_PTR(-ENOMEM);
-	}
+	intr->total_irqs = nirq;
 
 	intr->irq_mask = m->mdss_irqs;
 
@@ -436,31 +426,19 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
-	if (intr) {
-		kfree(intr->cache_irq_mask);
-
-		kfree(intr->irq_cb_tbl);
-		kfree(intr->irq_counts);
-
+	if (intr)
 		kfree(intr);
-	}
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
+		void (*irq_cb)(void *arg, int irq_idx),
+		void *irq_arg)
 {
 	unsigned long irq_flags;
+	int ret;
 
-	if (!dpu_kms->hw_intr->irq_cb_tbl) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
+	if (!irq_cb) {
+		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
 		return -EINVAL;
 	}
 
@@ -472,41 +450,32 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
-	list_add_tail(&register_irq_cb->list,
-			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]);
-	if (list_is_first(&register_irq_cb->list,
-			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
-		int ret = dpu_hw_intr_enable_irq_locked(
+
+	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
+		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
+
+		return -EBUSY;
+	}
+
+	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
+	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
+
+	ret = dpu_hw_intr_enable_irq_locked(
 				dpu_kms->hw_intr,
 				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
+	if (ret)
+		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
 					irq_idx);
-	}
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 	return 0;
 }
 
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	unsigned long irq_flags;
-
-	if (!dpu_kms->hw_intr->irq_cb_tbl) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
-		return -EINVAL;
-	}
+	int ret;
 
 	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
@@ -516,18 +485,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
-	/* empty callback list but interrupt is still enabled */
-	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
-		int ret = dpu_hw_intr_disable_irq_locked(
-				dpu_kms->hw_intr,
-				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
-					irq_idx);
-		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
-	}
+	trace_dpu_core_irq_unregister_callback(irq_idx);
+
+	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
+	if (ret)
+		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
+					irq_idx, ret);
+
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
+	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
+
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 	return 0;
@@ -537,24 +504,18 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
 	struct dpu_kms *dpu_kms = s->private;
-	struct dpu_irq_callback *cb;
 	unsigned long irq_flags;
-	int i, irq_count, cb_count;
-
-	if (WARN_ON(!dpu_kms->hw_intr->irq_cb_tbl))
-		return 0;
+	int i, irq_count;
+	void *cb;
 
 	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-		cb_count = 0;
-		irq_count = atomic_read(&dpu_kms->hw_intr->irq_counts[i]);
-		list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[i], list)
-			cb_count++;
+		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
+		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-		if (irq_count || cb_count)
-			seq_printf(s, "idx:%d irq:%d cb:%d\n",
-					i, irq_count, cb_count);
+		if (irq_count || cb)
+			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
 	}
 
 	return 0;
@@ -580,15 +541,8 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	/* Create irq callbacks for all possible irq_idx */
-	dpu_kms->hw_intr->irq_cb_tbl = kcalloc(dpu_kms->hw_intr->total_irqs,
-			sizeof(struct list_head), GFP_KERNEL);
-	dpu_kms->hw_intr->irq_counts = kcalloc(dpu_kms->hw_intr->total_irqs,
-			sizeof(atomic_t), GFP_KERNEL);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
-		INIT_LIST_HEAD(&dpu_kms->hw_intr->irq_cb_tbl[i]);
-		atomic_set(&dpu_kms->hw_intr->irq_counts[i], 0);
-	}
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
+		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
 }
 
 void dpu_core_irq_uninstall(struct msm_kms *kms)
@@ -598,7 +552,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
+		if (dpu_kms->hw_intr->irq_tbl[i].cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
 
 	dpu_clear_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1ab75cccd145..3136c1d260f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -43,19 +43,21 @@ enum dpu_hw_intr_reg {
  * @save_irq_status:  array of IRQ status reg storage created during init
  * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
- * @irq_cb_tbl:       array of IRQ callbacks lists
- * @irq_counts:       array of IRQ counts
+ * @irq_cb_tbl:       array of IRQ callbacks
  */
 struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
-	u32 *cache_irq_mask;
+	u32 cache_irq_mask[MDP_INTR_MAX];
 	u32 *save_irq_status;
 	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
 
-	struct list_head *irq_cb_tbl;
-	atomic_t *irq_counts;
+	struct {
+		void (*cb)(void *arg, int irq_idx);
+		void *arg;
+		atomic_t count;
+	} irq_tbl[];
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 2d385b4b7f5e..b6371f1d554c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -66,18 +66,6 @@
 
 #define DPU_NAME_SIZE  12
 
-/*
- * struct dpu_irq_callback - IRQ callback handlers
- * @list: list to callback
- * @func: intr handler
- * @arg: argument for the handler
- */
-struct dpu_irq_callback {
-	struct list_head list;
-	void (*func)(void *arg, int irq_idx);
-	void *arg;
-};
-
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 54d74341e690..91fa4d3fd63f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -872,26 +872,26 @@ TRACE_EVENT(dpu_pp_connect_ext_te,
 );
 
 DECLARE_EVENT_CLASS(dpu_core_irq_callback_template,
-	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
+	TP_PROTO(int irq_idx, void *callback),
 	TP_ARGS(irq_idx, callback),
 	TP_STRUCT__entry(
 		__field(	int,				irq_idx	)
-		__field(	struct dpu_irq_callback *,	callback)
+		__field(	void *,				callback)
 	),
 	TP_fast_assign(
 		__entry->irq_idx = irq_idx;
 		__entry->callback = callback;
 	),
-	TP_printk("irq_idx:%d callback:%pK", __entry->irq_idx,
+	TP_printk("irq_idx:%d callback:%ps", __entry->irq_idx,
 		  __entry->callback)
 );
 DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_register_callback,
-	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
+	TP_PROTO(int irq_idx, void *callback),
 	TP_ARGS(irq_idx, callback)
 );
 DEFINE_EVENT(dpu_core_irq_callback_template, dpu_core_irq_unregister_callback,
-	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
-	TP_ARGS(irq_idx, callback)
+	TP_PROTO(int irq_idx),
+	TP_ARGS(irq_idx)
 );
 
 TRACE_EVENT(dpu_core_perf_update_clk,
-- 
2.34.1

