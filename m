Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211635A974
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB826EC5E;
	Sat, 10 Apr 2021 00:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896126EC61
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:14:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w8so3792760lfr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmnAAlgWaQCqtmQHnAR63+Bi976uhQGIiII1nTF9pHQ=;
 b=SACn2MprumfeM31nw/rmVvVuB4VMcavSVDJreD3WSFHomXc6llKKxEmejLS/HH9CbA
 zQxLAXn5CwFaMu3GHe6o27J95Ewjv5uHx6F9ZDtt1sTnkczHNZrZnXdi2bDxESh7ZkgQ
 AMguzIfSyavVp/lIOfmH6D1W+TNBp9D+BF2D1/gmyW+YRW5BacRDmvwZlM0RLqatwCk1
 Xz3LLK0jmNQCbxknGfY8bPhhEIR2MACK2R9ylYJrY9gphXKbTGQwbJqYXmIGfnO7qd+4
 eTXcU/Pwy6xubRXwPGzs7zLT8/I/5mUbv2l1zDW72pubtvolgc6or7/vJo27i19Vrmkf
 g7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmnAAlgWaQCqtmQHnAR63+Bi976uhQGIiII1nTF9pHQ=;
 b=j8WdWilsrXLz0nWkoYFCeE3fIGWVLyPnx6XnFt6g7ioqItl1Zpi1flqjdzcyPs1HJS
 b8B8hbncoHKT6cnLODUuCPW0++dl2FkFZuEgCpxCcMsCKDHVw2xeYzwpeLolGiHJFghQ
 RrrgtlF7580TIL6jf1V7dnXLUXlrmgpHSxbUINS+1G6yyQ0Mlk/1VMAIOe4Ou7G1qQn8
 7+iDldFDBpw/smuzc0In5UdgiLtjcr8+2qgK8VEdRWnXhYF8zAiH33F06aDSvLS1iAc2
 nW7AlzOwTMKseRvlXxu3WiD6hCXOt0ty3WW/jbfMQH8DBp7GEFnN1ZCeNNibgwuWBZWH
 eMrg==
X-Gm-Message-State: AOAM530h6epjPMeWaXC542PSY+RU41BvetwtKN5arOvjvvOrERB20f1S
 ElLrO8c0zGga8y+V/pJkswWmzQ==
X-Google-Smtp-Source: ABdhPJyVEOyxavkcYreXxNpo1PjnGAtOQp65dcJ3VAMUgnBYB72sbBn/5z6ZWZQYBYlIf4IG5cLUyw==
X-Received: by 2002:a19:98f:: with SMTP id 137mr11610715lfj.149.1618013671877; 
 Fri, 09 Apr 2021 17:14:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a17sm323360lfg.20.2021.04.09.17.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 17:14:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 1/3] drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into
 dpu_hw_intr_dispatch_irqs
Date: Sat, 10 Apr 2021 03:14:28 +0300
Message-Id: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little sense in reading interrupt statuses and right after that
going after the array of statuses to dispatch them. Merge both loops
into single function doing read and dispatch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 10 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 66 ++++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  8 ---
 3 files changed, 20 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 84ea09d9692f..c977e8484174 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -376,15 +376,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 
 irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 {
-	/*
-	 * Read interrupt status from all sources. Interrupt status are
-	 * stored within hw_intr.
-	 * Function will also clear the interrupt status after reading.
-	 * Individual interrupt status bit will only get stored if it
-	 * is enabled.
-	 */
-	dpu_kms->hw_intr->ops.get_interrupt_statuses(dpu_kms->hw_intr);
-
 	/*
 	 * Dispatch to HW driver to handle interrupt lookup that is being
 	 * fired. When matching interrupt is located, HW driver will call to
@@ -392,6 +383,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 	 * dpu_core_irq_callback_handler will perform the registered function
 	 * callback, and do the interrupt status clearing once the registered
 	 * callback is finished.
+	 * Function will also clear the interrupt status after reading.
 	 */
 	dpu_kms->hw_intr->ops.dispatch_irqs(
 			dpu_kms->hw_intr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5c521de71567..a8d463a8e8fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -780,6 +780,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	int start_idx;
 	int end_idx;
 	u32 irq_status;
+	u32 enable_mask;
 	unsigned long irq_flags;
 
 	if (!intr)
@@ -792,8 +793,6 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	 */
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
-		irq_status = intr->save_irq_status[reg_idx];
-
 		/*
 		 * Each Interrupt register has a range of 32 indexes, and
 		 * that is static for dpu_irq_map.
@@ -805,6 +804,20 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 			start_idx >= ARRAY_SIZE(dpu_irq_map))
 			continue;
 
+		/* Read interrupt status */
+		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
+
+		/* Read enable mask */
+		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
+
+		/* and clear the interrupt */
+		if (irq_status)
+			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+				     irq_status);
+
+		/* Finally update IRQ status based on enable mask */
+		irq_status &= enable_mask;
+
 		/*
 		 * Search through matching intr status from irq map.
 		 * start_idx and end_idx defined the search range in
@@ -836,6 +849,10 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
 			}
 	}
+
+	/* ensure register writes go through */
+	wmb();
+
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 }
 
@@ -987,41 +1004,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
-{
-	int i;
-	u32 enable_mask;
-	unsigned long irq_flags;
-
-	if (!intr)
-		return;
-
-	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
-		if (!test_bit(i, &intr->irq_mask))
-			continue;
-
-		/* Read interrupt status */
-		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
-				dpu_intr_set[i].status_off);
-
-		/* Read enable mask */
-		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[i].en_off);
-
-		/* and clear the interrupt */
-		if (intr->save_irq_status[i])
-			DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off,
-					intr->save_irq_status[i]);
-
-		/* Finally update IRQ status based on enable mask */
-		intr->save_irq_status[i] &= enable_mask;
-	}
-
-	/* ensure register writes go through */
-	wmb();
-
-	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
-}
 
 static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 		int irq_idx)
@@ -1080,7 +1062,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
 	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
@@ -1117,14 +1098,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	intr->save_irq_status = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
-			GFP_KERNEL);
-	if (intr->save_irq_status == NULL) {
-		kfree(intr->cache_irq_mask);
-		kfree(intr);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	intr->irq_mask = m->mdss_irqs;
 	spin_lock_init(&intr->irq_lock);
 
@@ -1135,7 +1108,6 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
 	if (intr) {
 		kfree(intr->cache_irq_mask);
-		kfree(intr->save_irq_status);
 		kfree(intr);
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index fc9c98617281..d8b9d5fe6b8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -141,14 +141,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * get_interrupt_statuses - Gets and store value from all interrupt
-	 *                          status registers that are currently fired.
-	 * @intr:	HW interrupt handle
-	 */
-	void (*get_interrupt_statuses)(
-			struct dpu_hw_intr *intr);
-
 	/**
 	 * clear_intr_status_nolock() - clears the HW interrupts without lock
 	 * @intr:	HW interrupt handle
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
