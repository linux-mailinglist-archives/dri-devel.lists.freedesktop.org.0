Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F17656CD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF41B10E5A1;
	Thu, 27 Jul 2023 15:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B10910E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:05:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so1477915a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690470300; x=1691075100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYC4gd0lfqCdeF6Hs6D+rbRL/FEexlodjjEbv2E3G+I=;
 b=AAyVCUEiYwpcrPA18YCCA0M4Cj7uixgFgDQnKnhK+K7of39oUr8hD5pUYCtfoCGRbd
 9Udx0YKG0M7pht61O+3lJDix5Qa6R6p9eNscqDbe9GnMlrMZ3WM9tEpvYNdXD9X3f86u
 tqQ/ezUmOkcvuJr0pMFOZr8Rgvkn4GuuuENJJ3vl3guaJNFnoMTmfYkAX18m9x2dWnJB
 GoAblDZmE+WqpbLKfD7DL6cNKKnbKYhhIph/PXnYTvBEAqh8G7dR3wdDu7zUDGmw8MqB
 3p0TDfruAczZn+Xpzcsafuj618qmZt0r4Cy14MRzhVe33HLA2Bk4p0nv75GphMfl2QQS
 yRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470300; x=1691075100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYC4gd0lfqCdeF6Hs6D+rbRL/FEexlodjjEbv2E3G+I=;
 b=HWymf33FaciNB+JK0XhXWjEWWb/ICQgM+VUvgfSRwrX8Ct2r4/66CPn9wIQvdcJDOc
 1zg2A1wpwLnJpZ8icXdMuK6A7rEtmm6bxeLT74xZifRhCJqqR4vqipV1K5yUb+2BpXE4
 6aEI/3hocD188FDbw9DSGMHTVFkTr+8KlT7UM9iomgzChnC+7nUswa09gEj5aBlqC77e
 09QPuW4tZd7XWGcBkNJ0y8U+sDpzjToUFXFbh7SGvYA4plVOrwzQhfwdubFHGg626kdI
 yT0Ug81XQ5sjWnqAu3uoEZTfUwgqohrGhQEOVyLW1mMg7kuv4eAJ4gJ/KPl80WpI1Rho
 Bvew==
X-Gm-Message-State: ABy/qLZWcSDLUYZ4rHRVl/XS8khNjuhrnaBx5zdNKRMkx7jDrfpUqoTs
 i5oK7XabaeRVh1hzDT7K0XtCNkA96fIxebF5jxI=
X-Google-Smtp-Source: APBJJlGqnVnZwCcSblVLZOZMPz43G8r3QtX2jzIfBsYoHG3UkONOOkmdLR+FdTVbVfDKHu3kAACzFw==
X-Received: by 2002:a17:906:738b:b0:989:450:e56a with SMTP id
 f11-20020a170906738b00b009890450e56amr2567569ejl.76.1690470300606; 
 Thu, 27 Jul 2023 08:05:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:05:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Date: Thu, 27 Jul 2023 18:04:54 +0300
Message-Id: <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
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

In preparation to reworking the IRQ indices, move irq_tbl access to
separate helper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
 2 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index eaae7f11f57f..ede7161ae904 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -199,6 +199,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
+static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
+							       int irq_idx)
+{
+	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
+}
+
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @dpu_kms:		Pointer to DPU's KMS structure
@@ -206,17 +212,19 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
+
 	VERB("irq_idx=%d\n", irq_idx);
 
-	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
+	if (!irq_entry->cb)
 		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
 
-	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
+	atomic_inc(&irq_entry->count);
 
 	/*
 	 * Perform registered function callback
 	 */
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
+	irq_entry->cb(irq_entry->arg);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -509,6 +517,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -526,15 +535,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
+	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
+	if (unlikely(WARN_ON(irq_entry->cb))) {
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		return -EBUSY;
 	}
 
 	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
-	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
+	irq_entry->arg = irq_arg;
+	irq_entry->cb = irq_cb;
 
 	ret = dpu_hw_intr_enable_irq_locked(
 				dpu_kms->hw_intr,
@@ -551,6 +561,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -569,8 +580,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
 					irq_idx, ret);
 
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
-	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
+	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
+	irq_entry->cb = NULL;
+	irq_entry->arg = NULL;
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -583,14 +595,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
 	struct dpu_kms *dpu_kms = s->private;
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int i, irq_count;
 	void *cb;
 
 	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
-		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
+		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
+		irq_count = atomic_read(&irq_entry->count);
+		cb = irq_entry->cb;
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
@@ -613,6 +627,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct dpu_hw_intr_entry *irq_entry;
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -620,22 +635,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
+		atomic_set(&irq_entry->count, 0);
+	}
 }
 
 void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct dpu_hw_intr_entry *irq_entry;
 	int i;
 
 	if (!dpu_kms->hw_intr)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		if (dpu_kms->hw_intr->irq_tbl[i].cb)
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
+		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+	}
 
 	dpu_clear_irqs(dpu_kms);
 	dpu_disable_all_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 3a988a4e4f33..59bde8ab50c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -40,6 +40,12 @@ enum dpu_hw_intr_reg {
 #define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
 #define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
 
+struct dpu_hw_intr_entry {
+	void (*cb)(void *arg);
+	void *arg;
+	atomic_t count;
+};
+
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
  * @hw:               virtual address mapping
@@ -59,11 +65,7 @@ struct dpu_hw_intr {
 	unsigned long irq_mask;
 	const struct dpu_intr_reg *intr_set;
 
-	struct {
-		void (*cb)(void *arg);
-		void *arg;
-		atomic_t count;
-	} irq_tbl[];
+	struct dpu_hw_intr_entry irq_tbl[];
 };
 
 /**
-- 
2.39.2

