Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E23AB586
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 16:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6FD6E906;
	Thu, 17 Jun 2021 14:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D966E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 14:09:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r198so10714209lff.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohafdZMD93z0T1nAFWI/eeGOu8zBpwsaEHdxkL5H5hs=;
 b=LBHVvctJnDBpWBqFfPQNZvK0t2sXQ+Q3tidWwHDBn/qT5zcIz7v7XZACISNLektChy
 fa86Tn8In4mYc9XO7Z0msq4FGAJALRRdQLiq7GRgy79wHxl3h6l/luJiBPEGj2Gatfvd
 z7iaVTPPFOKmWr47HTlna9j64XfvV27eR+QTE/7x+qONIwxUerluiJIyvSf342u2vTgX
 0e2YDzCh/9UClShA/Bzbv2AxSL+PCbWezJkZq7AP1QXMzxtKujcf1FGxRIB/4XOynJz5
 B2hxbtm7S93zSrBzMn1TtoIAXGRalEvmA9UClDU77H6Uu+2Vj2lIGuGNxqo8VjJhgwNL
 XzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohafdZMD93z0T1nAFWI/eeGOu8zBpwsaEHdxkL5H5hs=;
 b=MMpHdL3Z6OfCMWjxAmSYCrgSftG4+1rYOerkQMVfjEAWcuKM2ZojDyQolzUO9/YGFJ
 Y66XMn8CbaDhsLQQNX7j2GYPf/On9AQnHOczG2B45760U3OEyBnrNcbubTuGb28p8CkW
 p4FN0s1PCPSQRu6By338BllDWchmHi8x7xtmILrBh8B9DJIXPkGN8cP1mbvRRA3gxuk5
 TJIAn8GSjvdc2FewdjH/pKQVUy7BqzaIk6KhEZcgqp2NerQ9zQ54oYSCoBy5prNwMWaB
 +diJrODTxg2Eexh/e1C0s3GWnvo4cT1MIPJWP28WMr4Wwcy9etQENWG5IL/BYRDV9VnA
 gaIQ==
X-Gm-Message-State: AOAM530Jhrr0iCm4FZpc28wP5copdPReMidr5+V/dWWI5FpWXOx9lay/
 JrDzr50n+ndRnceXKYMW5G/rng==
X-Google-Smtp-Source: ABdhPJz35SujFyVO/YYgflPXgzJ7yj9aJZtAWo28FtMvqAvaN+Ooqsj4QlCeb9tA1w2SeHIRabGH8g==
X-Received: by 2002:ac2:55ba:: with SMTP id y26mr4073545lfg.416.1623938953943; 
 Thu, 17 Jun 2021 07:09:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 07:09:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 4/7] drm/msm/dpu: hide struct dpu_irq_callback
Date: Thu, 17 Jun 2021 17:09:05 +0300
Message-Id: <20210617140908.412298-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct dpu_irq_callbacks looks internal to IRQ handling code. Hide
it from the rest of the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 18 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 62 ++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 12 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  8 +--
 8 files changed, 69 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 90ae6c9ccc95..44ab97fb2964 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -46,10 +46,8 @@ u32 dpu_core_irq_read(
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
@@ -57,17 +55,16 @@ u32 dpu_core_irq_read(
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
+ * @irq_cb:		IRQ callback funcion.
+ * @irq_arg:		IRQ callback argument.
  * @return:		0 for success registering callback, otherwise failure
  *
  * This function supports registration of multiple callbacks for each interrupt.
@@ -75,7 +72,8 @@ int dpu_core_irq_register_callback(
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
 		int irq_idx,
-		struct dpu_irq_callback *irq_cb);
+		void (*irq_cb)(void *arg, int irq_idx),
+		void *irq_arg);
 
 /**
  * dpu_debugfs_core_irq_init - register core irq debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7f06238a7c64..186b2f87d193 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -310,7 +310,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
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
@@ -384,7 +384,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 	}
 
 	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
-			&irq->cb);
+			irq->func, phys_enc);
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
index dba1219c6f1b..dbc8f0811dd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -786,30 +786,28 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
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
index 391b13b99c01..21722cdfaaf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -728,20 +728,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
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
index e5dce884e7c0..73a20fc5c766 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -32,6 +32,18 @@
 #define MDP_INTF_1_OFF_REV_7xxx             0x35000
 #define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
+/*
+ * struct dpu_irq_callback - IRQ callback handlers
+ * @list: list to callback
+ * @func: intr handler
+ * @arg: argument for the handler
+ */
+struct dpu_irq_callback {
+	struct list_head list;
+	void (*func)(void *arg, int irq_idx);
+	void *arg;
+};
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -428,20 +440,19 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
+		void (*irq_cb)(void *arg, int irq_idx),
+		void *irq_arg)
 {
 	unsigned long irq_flags;
+	struct dpu_irq_callback *register_irq_cb;
 
 	if (!dpu_kms->hw_intr->irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
 
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
+	if (!irq_cb) {
+		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
 		return -EINVAL;
 	}
 
@@ -452,9 +463,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
+	register_irq_cb = kzalloc(sizeof(*register_irq_cb), GFP_KERNEL);
+	if (!register_irq_cb)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&register_irq_cb->list);
+	register_irq_cb->func = irq_cb;
+	register_irq_cb->arg = irq_arg;
+
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
 			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]);
 	if (list_is_first(&register_irq_cb->list,
@@ -472,20 +490,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 }
 
 int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
+		void (*irq_cb)(void *arg, int irq_idx),
+		void *irq_arg)
 {
 	unsigned long irq_flags;
+	struct dpu_irq_callback *entry, *register_irq_cb = NULL;
 
 	if (!dpu_kms->hw_intr->irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
 
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
+	if (!irq_cb) {
+		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
 		return -EINVAL;
 	}
 
@@ -497,8 +514,23 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
+	trace_dpu_core_irq_unregister_callback(irq_idx, irq_cb);
+	list_for_each_entry(entry, &dpu_kms->hw_intr->irq_cb_tbl[irq_idx], list) {
+		if (entry->func != irq_cb || entry->arg != irq_arg)
+			continue;
+
+		register_irq_cb = entry;
+		break;
+	}
+
+	if (WARN_ON(!register_irq_cb)) {
+		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
+		return -EINVAL;
+	}
+
+	list_del(&register_irq_cb->list);
+	kfree(register_irq_cb);
+
 	/* empty callback list but interrupt is still enabled */
 	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
 		int ret = dpu_hw_intr_disable_irq_locked(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f261c5afc6ac..624ccf977694 100644
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
index 37bba57675a8..d0b04e2668d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -876,7 +876,7 @@ TRACE_EVENT(dpu_pp_connect_ext_te,
 );
 
 DECLARE_EVENT_CLASS(dpu_core_irq_callback_template,
-	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
+	TP_PROTO(int irq_idx, void *callback),
 	TP_ARGS(irq_idx, callback),
 	TP_STRUCT__entry(
 		__field(	int,				irq_idx	)
@@ -886,15 +886,15 @@ DECLARE_EVENT_CLASS(dpu_core_irq_callback_template,
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
+	TP_PROTO(int irq_idx, void *callback),
 	TP_ARGS(irq_idx, callback)
 );
 
-- 
2.30.2

