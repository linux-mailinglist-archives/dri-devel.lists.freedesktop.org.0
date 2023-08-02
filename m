Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A276CA65
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21FF10E542;
	Wed,  2 Aug 2023 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E332D10E539
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:04:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso192986e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970670; x=1691575470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSzZTg0NGy1LkISwWv0vV5hJXartPJReDYXcjvBetNs=;
 b=ESLbnk9nARaAUHRkFNP96p6VQNT1bZ+PtsNlt5as9fJxa9P7Thuw3cD2Bs8Bn/scUQ
 XTxwYZn42R1OflWZKXjlBwSvyE4hb+CCv17uQxDKf4KQAH+XkaVvNv7z5/qcQQlb00lR
 CNJeIn62GTPt8FS5oj3UlQqDwvGD2lrpE1+rIECAMFNYS4zmLl5SmY2zFLqkzj8X1cVI
 y8sfFhipgLAZGUmbuBW2qEmhi0Eb6uVC/t0QPcw/rG+1Qe6zDGYZ2N56D+QV+pWfdAaM
 9eZGB+x4yDosOoBEdHnWMYRH7NHN/kDNdmDwsZ13WN4SVNkntuvon/UR6XhZgHZPIge9
 y/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970670; x=1691575470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSzZTg0NGy1LkISwWv0vV5hJXartPJReDYXcjvBetNs=;
 b=VuVi/uGf5+eJuFiZvmQqqDqrA2fqD5F72m80iFpGoTvjh21DjsZyrN7o/shDvP7EZ8
 DVYGGKdufkea3m+4K0zIinNPNQpRE4aCiRJeZX5WQndB4cq/mdhQt/X4uErobOKL5t+P
 9SlNllT9bVWdQ3jeRgXO/hvnAtZLsbeSPkEOAbrSIpP3kRBRpj2ioYK86YbffCrctzVs
 Lx9AwCeSLoLUJtCQXnt3pTfdS2aKOWCBzyxpQTWdhiYe8D1+BiovAZ+mQOXxL3EwGjtM
 vpRUMA1WnBEmJDUplYS/EDEs9R5bBCoadwBzzieGTZbnlsFuzlZqj9/6mIfhXZ3ABciv
 u8xA==
X-Gm-Message-State: ABy/qLb4X2am2kQ6xOIHTEZ48aEq9oSZ59NhZrUQ7TV6OKeQ5Fny1nfQ
 bEeheBrHZrHR0/4UATkUUu7LMA==
X-Google-Smtp-Source: APBJJlFhhAwKqZq5i0h0VMFIsaYkr/5Aloca7GP2ed8p1JLAidzbpvMW5GtJiySv/ItmZzOWJeKyZw==
X-Received: by 2002:a05:6512:33c8:b0:4fb:772a:af17 with SMTP id
 d8-20020a05651233c800b004fb772aaf17mr5340362lfg.37.1690970670274; 
 Wed, 02 Aug 2023 03:04:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 4/8] drm/msm/dpu: add helper to get IRQ-related data
Date: Wed,  2 Aug 2023 13:04:22 +0300
Message-Id: <20230802100426.4184892-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
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

In preparation to reworking IRQ indices, move irq_tbl access to
a separate helper.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
 2 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 81d03b6c67d1..14d374de30c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -206,6 +206,12 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
 	return irq_idx >= 0 && irq_idx < intr->total_irqs;
 }
 
+static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
+							       int irq_idx)
+{
+	return &intr->irq_tbl[irq_idx];
+}
+
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @dpu_kms:		Pointer to DPU's KMS structure
@@ -213,17 +219,19 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
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
@@ -510,6 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -527,15 +536,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
+	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
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
@@ -552,6 +562,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -570,8 +581,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
 					irq_idx, ret);
 
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
-	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
+	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
+	irq_entry->cb = NULL;
+	irq_entry->arg = NULL;
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -584,14 +596,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
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
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
+		irq_count = atomic_read(&irq_entry->count);
+		cb = irq_entry->cb;
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
@@ -614,6 +628,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct dpu_hw_intr_entry *irq_entry;
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -621,22 +636,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
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
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
+		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+	}
 
 	dpu_clear_irqs(dpu_kms);
 	dpu_disable_all_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index e2b00dd32619..391fb268ad90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -38,6 +38,12 @@ enum dpu_hw_intr_reg {
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
+struct dpu_hw_intr_entry {
+	void (*cb)(void *arg);
+	void *arg;
+	atomic_t count;
+};
+
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
  * @hw:               virtual address mapping
@@ -57,11 +63,7 @@ struct dpu_hw_intr {
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

