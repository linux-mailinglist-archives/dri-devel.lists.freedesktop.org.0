Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BE3A4744
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2EF6E820;
	Fri, 11 Jun 2021 17:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAEF6E820
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:00:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c13so6445666oib.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlmv1eeDkO2pPX/G2UzjbnzL6XKsZ2uz2UEOVRUZHw0=;
 b=JOlmeybaAiKTguAC8h04H5GPTQztM5r5EkgKz2WeOU5nB5vyrzb88ea6a+QadTGMDA
 gSksNtjVN/Kkg6t2TQpABVSjkt/10I4zDhDEjYOQDSaeylScvzyHCH0Bg7nS17OhfD3V
 UsA3J54tChNLCWHHvQuNGnmg3rlj6TlyVwWxgQDINum1oIX1b1bMNUZ4FSvswRak3XSk
 veWUaOjxlqe99aJxHYbaaMtjpQ0MDtirwDTVOlPgqfTZ2TfXLDrpFRdL8CufkFbTcdEx
 4aHoe5xXfcjtN8ZFXh4jsdTzK5M1E71z3WvnXB+b3FN32OXhX9nPazwSjvnUXnNjKlRW
 7Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlmv1eeDkO2pPX/G2UzjbnzL6XKsZ2uz2UEOVRUZHw0=;
 b=hQu871G/XicQKDGlZ/P2Bao6buWIZ4L6BUYvZ6FUVvdMtSKM6/7ykcvE5M9NE84xfM
 g58P+C1v/dOKa9hUMch9koNcaPoNN7wEWK1yw4c6xILEoGsNgy908CdZ3vVCE042l26L
 afc2f//x1R0IBjG3BZPeJd7W6ttaMhUpIWtvoRqB+jjpSZsxej99dhJR8iWf2FgapcLM
 kiaXpR4S3vdGsuGHYr5RIztwJJKYIrbiLY+j49pYUwgO8bSEU7T06CqIqQdN5XzdFZKl
 1QV+xLea+a0bP6v9hKiqavIj28I6WfopwS7IcrqYslyj10aasV/UNu03BWsDcAp0fYLN
 /jug==
X-Gm-Message-State: AOAM530tdP6qkgZWIY16xN4R7li8KDsAHd+1hkU7r4Lj13ZnWY7IlzYc
 dsaUnsIXxsKfhO5U07eYkJQgRA==
X-Google-Smtp-Source: ABdhPJxqxSQk3fRZ3w8ipJ2ez+mvQj/XlBEwseR+p2o9jOwwAK2/atzy23h4QQEcnR7cizU9Lo8BqQ==
X-Received: by 2002:aca:3e89:: with SMTP id l131mr2998686oia.34.1623430854245; 
 Fri, 11 Jun 2021 10:00:54 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p5sm1256302oip.35.2021.06.11.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:00:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/msm/dpu: Avoid ABBA deadlock between IRQ modules
Date: Fri, 11 Jun 2021 10:00:03 -0700
Message-Id: <20210611170003.3539059-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handling of the interrupt callback lists is done in dpu_core_irq.c,
under the "cb_lock" spinlock. When these operations results in the need
for enableing or disabling the IRQ in the hardware the code jumps to
dpu_hw_interrupts.c, which protects its operations with "irq_lock"
spinlock.

When an interrupt fires, dpu_hw_intr_dispatch_irq() inspects the
hardware state while holding the "irq_lock" spinlock and jumps to
dpu_core_irq_callback_handler() to invoke the registered handlers, which
traverses the callback list under the "cb_lock" spinlock.

As such, in the event that these happens concurrently we'll end up with
a deadlock.

Prior to '1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")'
the enable/disable of the hardware interrupt was done outside the
"cb_lock" region, optimitically by using an atomic enable-counter for
each interrupt and an warning print if someone changed the list between
the atomic_read and the time the operation concluded.

Rather than re-introducing the large array of atomics, this change
embraces the fact that dpu_core_irq and dpu_hw_interrupts are deeply
entangled and make them share the single "irq_lock".

Following this step it's suggested that we squash the two parts into a
single irq handling thing.

Fixes: 1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Make dpu_core_irq use dpu_hw_interrupts' irq_lock instead of adding another
  mutex.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 27 ++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 60 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 20 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  2 -
 4 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 4f110c428b60..18557b9713b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -22,7 +22,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 	struct dpu_kms *dpu_kms = arg;
 	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
 	struct dpu_irq_callback *cb;
-	unsigned long irq_flags;
 
 	pr_debug("irq_idx=%d\n", irq_idx);
 
@@ -34,11 +33,9 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 	/*
 	 * Perform registered function callback
 	 */
-	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 }
 
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
@@ -82,22 +79,21 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
-	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
 	if (list_is_first(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
-		int ret = dpu_kms->hw_intr->ops.enable_irq(
+		int ret = dpu_kms->hw_intr->ops.enable_irq_locked(
 				dpu_kms->hw_intr,
 				irq_idx);
 		if (ret)
 			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
 					irq_idx);
 	}
-
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
 
 	return 0;
 }
@@ -127,12 +123,12 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
-	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	/* empty callback list but interrupt is still enabled */
 	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
-		int ret = dpu_kms->hw_intr->ops.disable_irq(
+		int ret = dpu_kms->hw_intr->ops.disable_irq_locked(
 				dpu_kms->hw_intr,
 				irq_idx);
 		if (ret)
@@ -140,7 +136,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 					irq_idx);
 		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
 	}
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
 
 	return 0;
 }
@@ -164,7 +160,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 #ifdef CONFIG_DEBUG_FS
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
-	struct dpu_irq *irq_obj = s->private;
+	struct dpu_kms *dpu_kms = s->private;
+	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
 	struct dpu_irq_callback *cb;
 	unsigned long irq_flags;
 	int i, irq_count, cb_count;
@@ -173,12 +170,12 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 		return 0;
 
 	for (i = 0; i < irq_obj->total_irqs; i++) {
-		spin_lock_irqsave(&irq_obj->cb_lock, irq_flags);
+		irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
 		cb_count = 0;
 		irq_count = atomic_read(&irq_obj->irq_counts[i]);
 		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
 			cb_count++;
-		spin_unlock_irqrestore(&irq_obj->cb_lock, irq_flags);
+		dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
 
 		if (irq_count || cb_count)
 			seq_printf(s, "idx:%d irq:%d cb:%d\n",
@@ -193,7 +190,7 @@ DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
 void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
 {
-	debugfs_create_file("core_irq", 0600, parent, &dpu_kms->irq_obj,
+	debugfs_create_file("core_irq", 0600, parent, dpu_kms,
 		&dpu_debugfs_core_irq_fops);
 }
 #endif
@@ -207,8 +204,6 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
-
 	/* Create irq callbacks for all possible irq_idx */
 	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
 	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index bf9a147ac245..996011e356f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -211,10 +211,9 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 }
 
-static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 {
 	int reg_idx;
-	unsigned long irq_flags;
 	const struct dpu_intr_reg *reg;
 	const char *dbgstr = NULL;
 	uint32_t cache_irq_mask;
@@ -227,10 +226,16 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 	}
 
+	/*
+	 * The cache_irq_mask and hardware RMW operations needs to be done
+	 * under irq_lock and it's the caller's responsibility to ensure that's
+	 * held.
+	 */
+	assert_spin_locked(&intr->irq_lock);
+
 	reg_idx = DPU_IRQ_REG(irq_idx);
 	reg = &dpu_intr_set[reg_idx];
 
-	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
 		dbgstr = "DPU IRQ already set:";
@@ -248,7 +253,6 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
-	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 
 	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
@@ -256,7 +260,7 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -271,6 +275,13 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 	}
 
+	/*
+	 * The cache_irq_mask and hardware RMW operations needs to be done
+	 * under irq_lock and it's the caller's responsibility to ensure that's
+	 * held.
+	 */
+	assert_spin_locked(&intr->irq_lock);
+
 	reg_idx = DPU_IRQ_REG(irq_idx);
 	reg = &dpu_intr_set[reg_idx];
 
@@ -298,25 +309,6 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
-{
-	unsigned long irq_flags;
-
-	if (!intr)
-		return -EINVAL;
-
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
-		return -EINVAL;
-	}
-
-	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-	dpu_hw_intr_disable_irq_nolock(intr, irq_idx);
-	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
-
-	return 0;
-}
-
 static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
 {
 	int i;
@@ -388,14 +380,30 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 	return intr_status;
 }
 
+static unsigned long dpu_hw_intr_lock(struct dpu_hw_intr *intr)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&intr->irq_lock, irq_flags);
+
+	return irq_flags;
+}
+
+static void dpu_hw_intr_unlock(struct dpu_hw_intr *intr, unsigned long irq_flags)
+{
+	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
+}
+
 static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 {
-	ops->enable_irq = dpu_hw_intr_enable_irq;
-	ops->disable_irq = dpu_hw_intr_disable_irq;
+	ops->enable_irq_locked = dpu_hw_intr_enable_irq_locked;
+	ops->disable_irq_locked = dpu_hw_intr_disable_irq_locked;
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
+	ops->lock = dpu_hw_intr_lock;
+	ops->unlock = dpu_hw_intr_unlock;
 }
 
 static void __intr_offset(struct dpu_mdss_cfg *m,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 0073d32effc5..d90dac77c26f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -46,7 +46,7 @@ struct dpu_hw_intr_ops {
 	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
 	 * @return:	0 for success, otherwise failure
 	 */
-	int (*enable_irq)(
+	int (*enable_irq_locked)(
 			struct dpu_hw_intr *intr,
 			int irq_idx);
 
@@ -56,7 +56,7 @@ struct dpu_hw_intr_ops {
 	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
 	 * @return:	0 for success, otherwise failure
 	 */
-	int (*disable_irq)(
+	int (*disable_irq_locked)(
 			struct dpu_hw_intr *intr,
 			int irq_idx);
 
@@ -101,6 +101,22 @@ struct dpu_hw_intr_ops {
 			struct dpu_hw_intr *intr,
 			int irq_idx,
 			bool clear);
+
+	/**
+	 * lock - take the IRQ lock
+	 * @intr:	HW interrupt handle
+	 * @return:	irq_flags for the taken spinlock
+	 */
+	unsigned long (*lock)(
+			struct dpu_hw_intr *intr);
+
+	/**
+	 * unlock - take the IRQ lock
+	 * @intr:	HW interrupt handle
+	 * @irq_flags:  the irq_flags returned from lock
+	 */
+	void (*unlock)(
+			struct dpu_hw_intr *intr, unsigned long irq_flags);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f6840b1af6e4..3034da1d2977 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -82,14 +82,12 @@ struct dpu_irq_callback {
  * struct dpu_irq: IRQ structure contains callback registration info
  * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
  * @irq_cb_tbl:   array of IRQ callbacks setting
- * @cb_lock:      callback lock
  * @debugfs_file: debugfs file for irq statistics
  */
 struct dpu_irq {
 	u32 total_irqs;
 	struct list_head *irq_cb_tbl;
 	atomic_t *irq_counts;
-	spinlock_t cb_lock;
 };
 
 struct dpu_kms {
-- 
2.29.2

