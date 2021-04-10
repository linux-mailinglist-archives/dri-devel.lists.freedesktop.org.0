Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5335A978
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565736EC64;
	Sat, 10 Apr 2021 00:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519DA6EC61
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:14:34 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z8so8382026ljm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 17:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XVOy4fgMUlHspu+4cBqeL0KKWzBqXTAeE3Y/jlAnjk4=;
 b=ZsnumkQiVI0JO3QUmCYB70xnS2Qfgrh/bEViTKsPWel/EvTmZnIDicpKY3VlAUsdKa
 XmuTUmOIWoWgb8Y5x8eOoydy6qGidg3bpd6VPXAKehAiu/j5cqmDnxwj4pgGPCx87ybi
 Z9sGCRf3POyNk8S3kB1hkANeuJK9cgO84RisLvnPEA6wzKqwxgQH0AQq7PIU7wkmRFU6
 9ZjRhLqmnNxLkZas9J0ZwaoBTi/UegcMfnF4/mx0yWydVXTyyWD+R8p1Y5wDXplbF5nI
 HsEZtuRZhHDDiOTfN9Ro6ga93stMMViYkIxpf7g5tVufTnx1Ua422ZDAxUfJM5cCe4um
 WXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XVOy4fgMUlHspu+4cBqeL0KKWzBqXTAeE3Y/jlAnjk4=;
 b=JH1X8NmykCRDriE8a3o5if9Vq6TOxOWlkpyK6wx14ZQk6gj7qgRfOIDGDp+SsDvVib
 NjiAWLcHNm+MtCwGGUBFlTc9YICDij6hiXXhL0Y75zRe0IKHaVTV8Vjl3g8jBFMnRyHG
 DsOkrzAOgO3rviTgVhzSl0cCmse4yqYo58+XQIvRR/AAr6DstK2bVjoZWtTQb3+MQqfw
 sS/6I6e3zeexzckq+Bjre0+9gEdv+VrvW5hESczOFl85PnXqcmNRK+gjIHZjLlizUyAI
 KNJE/Uk58BQxgwmaCymJq5XeW9NPsr67mOmSuP4xntVLIh/2c5f7LB/HfS1Lb0ssjtEJ
 Q9mQ==
X-Gm-Message-State: AOAM532sW/R5xTZS1Ve9YnOBlbu+hssYrYszAmnUgXj1+rJumFgTUkOy
 oggOd/5LYIFgVAt6HA4X9xqAtg==
X-Google-Smtp-Source: ABdhPJzrHAAINr94MMEkM9Nz/5LIVbBylUmMFVPcOKPEoo6u/oX0koMC3yWQAkBFpKbGQDEnL0kp3Q==
X-Received: by 2002:a2e:8708:: with SMTP id m8mr10886037lji.339.1618013672565; 
 Fri, 09 Apr 2021 17:14:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a17sm323360lfg.20.2021.04.09.17.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 17:14:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 2/3] drm/msm/dpu: hw_intr: always call
 dpu_hw_intr_clear_intr_status_nolock
Date: Sat, 10 Apr 2021 03:14:29 +0300
Message-Id: <20210410001430.1732450-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
References: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
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

Always call dpu_hw_intr_clear_intr_status_nolock() from the
dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
and enforces clearing the hw interrupt status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
 3 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index c977e8484174..dadb4103b0eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
-
-	/*
-	 * Clear pending interrupt status in HW.
-	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
-	 *       spinlock, so it is safe to clear any interrupt status here.
-	 */
-	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
-			dpu_kms->hw_intr,
-			irq_idx);
 }
 
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a8d463a8e8fe..3d48ad69c901 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -771,6 +771,22 @@ static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
 	return -EINVAL;
 }
 
+static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
+		int irq_idx)
+{
+	int reg_idx;
+
+	if (!intr)
+		return;
+
+	reg_idx = dpu_irq_map[irq_idx].reg_idx;
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			dpu_irq_map[irq_idx].irq_mask);
+
+	/* ensure register writes go through */
+	wmb();
+}
+
 static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		void (*cbfunc)(void *, int),
 		void *arg)
@@ -837,9 +853,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				 */
 				if (cbfunc)
 					cbfunc(arg, irq_idx);
-				else
-					intr->ops.clear_intr_status_nolock(
-							intr, irq_idx);
+
+				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
 
 				/*
 				 * When callback finish, clear the irq_status
@@ -1004,23 +1019,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 		int irq_idx, bool clear)
 {
@@ -1062,7 +1060,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index d8b9d5fe6b8c..8d005687b265 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -141,15 +141,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * clear_intr_status_nolock() - clears the HW interrupts without lock
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 */
-	void (*clear_intr_status_nolock)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
 	/**
 	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
 	 *                        based on given lookup IRQ index.
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
