Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCF3A209F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 01:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8CA6EB5A;
	Wed,  9 Jun 2021 23:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9C26E417
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 23:15:57 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so25665054oth.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+qXEuKMwT/Oi1kda+1x77Hj9YustkgX0B7x2oE+wko=;
 b=CozgERK9mWAGLeGbIgbK6FIiUpzN01bkJbwK/Zks7x8ccKbLRkaESJ+H+Bv0lV1ePV
 dbhEAWHlvCAqC2pwJYqmctisuPGwGCFbgCRbogD7A1URYsQ7XV4UqRNeR8OZd9pw7HI4
 gZc2e7RJqgb+buc8mmmKN7uVQ7SKLU6mAqMimjUVONpqRm0dHhYt9Buly5JHj8Ey1gKN
 jNlJ98Iyw4/az9+JOYoZ0CWndTp61RM5JRav4t4eySFXtEw1f6P4mdM3uiFK0CfM4M+e
 aTr/6qgDHcAzvKEB9/MCEbGW9PuU/pQa0+Oms0AB95wq/z033XlgOyecmdFXtOcmmR1P
 /cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+qXEuKMwT/Oi1kda+1x77Hj9YustkgX0B7x2oE+wko=;
 b=TGyiaIRttLG+SAwtlOZcbJfLRf2LgslOK0D4YZxzNkqgZjY0ATPQ1L1GYTDjZkWXpr
 xy3FTCyKHgb/A/VeVFXtRKqwq1pMEB+homInd84QVwVS/KdZ7reQAzZOY4y2YJvEpbne
 nPqu0rZvjVZhH6oD3ApmCJh3mI84zTFxAApnybEJmYvX95KElX7JbtQ6nHKkS8rViI4l
 vNEDoZ/DKNc6oQTYOHYiHy0lNRKEu2CgAnwYt6fqJ4kGv/8GvieVPFTRgv/Dwl4CD/mE
 2p5taOI8SJo8oCUUQdgo8RMMsJZv6zbR23fxSwv46c5R8fsQ0avHSJcxik6CNvkrZQJI
 CZWg==
X-Gm-Message-State: AOAM530XvoTZyZJJEh2GN8NBuUzNCWzFkOcptx9KLloPZYMBHezLUHTC
 unXJiHlRRha0jgDU68WQ/Uq1pw==
X-Google-Smtp-Source: ABdhPJzooXnp7EQxQROOT+sxrgNDDlaYzFNFLhSLck9XXChNXHZU8TVmbfVi32Cje1OtodPD0qw5ow==
X-Received: by 2002:a9d:1b63:: with SMTP id l90mr1519714otl.219.1623280556395; 
 Wed, 09 Jun 2021 16:15:56 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f19sm299960ots.41.2021.06.09.16.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 16:15:55 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: Avoid ABBA deadlock between IRQ modules
Date: Wed,  9 Jun 2021 16:15:07 -0700
Message-Id: <20210609231507.3031904-1-bjorn.andersson@linaro.org>
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

Rather than re-introducing the large array of atomics, serialize the
register/unregister operations under a single mutex.

Fixes: 1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 10 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 4f110c428b60..62bbe35eff7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -82,11 +82,13 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
+	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
+	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	if (list_is_first(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
 		int ret = dpu_kms->hw_intr->ops.enable_irq(
@@ -96,8 +98,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
 					irq_idx);
 	}
-
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
 
 	return 0;
 }
@@ -127,9 +128,11 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
+	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
+	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	/* empty callback list but interrupt is still enabled */
 	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
 		int ret = dpu_kms->hw_intr->ops.disable_irq(
@@ -140,7 +143,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 					irq_idx);
 		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
 	}
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
 
 	return 0;
 }
@@ -207,6 +210,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
+	mutex_init(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
 
 	/* Create irq callbacks for all possible irq_idx */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f6840b1af6e4..5a162caea29d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -83,6 +83,7 @@ struct dpu_irq_callback {
  * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
  * @irq_cb_tbl:   array of IRQ callbacks setting
  * @cb_lock:      callback lock
+ * @hw_enable_lock: lock to synchronize callback register and unregister
  * @debugfs_file: debugfs file for irq statistics
  */
 struct dpu_irq {
@@ -90,6 +91,7 @@ struct dpu_irq {
 	struct list_head *irq_cb_tbl;
 	atomic_t *irq_counts;
 	spinlock_t cb_lock;
+	struct mutex hw_enable_lock;
 };
 
 struct dpu_kms {
-- 
2.29.2

