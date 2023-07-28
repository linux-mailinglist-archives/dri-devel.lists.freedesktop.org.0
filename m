Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC391767912
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E7010E7A9;
	Fri, 28 Jul 2023 23:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7C10E7A2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b9bb097c1bso40464951fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587124; x=1691191924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GkN+pDmjYAUdw1ZCIY5PENQNQ2LenR4opvjJC9F59c=;
 b=N/Qxd35qWft83sNflQDnr8pD8vcj69nLELQ9GVC5Wgbg46W10bXL/yHywDTZTYJHZ+
 jL+lW/GiJqFM7ndP14KLcselulr7kYNI0rsDyujWmzDw5kJW1Gbc1jUi4Li+lk1MTUDC
 NTPps6JLHuvKQ3C8eIUniLMUspSlz/8qfcGUGwHitDQevEmwVp5gcZaowa+MNHlNb0lt
 uLjm3bBbC8sYw8doQjbBkHsc10HzXOLRh6AdwYY2foFt6xBmuH5x6LaNkeaN1M7UI8OM
 e0BXs085Lellql9PhMtU7cB64KpNoLs0/cQi+VZ7IGDHvJzQpnrspJR1XBsHSE96RXtG
 wyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587124; x=1691191924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GkN+pDmjYAUdw1ZCIY5PENQNQ2LenR4opvjJC9F59c=;
 b=E2IlqC729TDm9x7aK4YSN8hewyvzvDldTGLOXb/96lCBabKdG88G7ptNnMOpoMxHp3
 PxDHkW3+6wODThx6gR7y/VH4mfGe0311SGqaHq2N2vMqJ/lp8bI4oVWO/zUjJa6tO/zw
 htJ7J8x3YvYftjCJUFL0OhHZpT+cdOm+nRdrpd4oUg5PiOxnWZDkOiRpB8vau0ABLSon
 /C8uAstdloqyu/TB7BfIOF9WmUJ8rMLFOKs5cEJvdaWAzjRbKIaUaxFzvyv9hYORvaYX
 +uJLr0S2akWmLhX8SpqfPrgd4qFdGBaVN3zHvsDIdsC057LCckCfP/sR3cfkUrx2jsfP
 hEAQ==
X-Gm-Message-State: ABy/qLY6yoAuE5zgMOY1dFepCMKR5r49xHMBNAI08AnYVpeoH+Y/vPYc
 m8X27154m7h/nfQzFgtOqV7naA==
X-Google-Smtp-Source: APBJJlEVGTDF5oZHZHY2dZ0GlFsP5G65hbxsKH7hgLVcgmjmTMjPVIaH9v6EY4oW25yQAQtbrWlJbA==
X-Received: by 2002:a2e:2c0e:0:b0:2b9:344c:a214 with SMTP id
 s14-20020a2e2c0e000000b002b9344ca214mr3109534ljs.42.1690587124145; 
 Fri, 28 Jul 2023 16:32:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 4/6] drm/msm/dpu: make the irq table size static
Date: Sat, 29 Jul 2023 02:31:58 +0300
Message-Id: <20230728233200.151735-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
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

The size of the irq table is static, it has MDP_INTR_MAX * 32 interrupt
entries. Provide the fixed length and drop struct_size() statement.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 13 +++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +++---
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 14d374de30c5..308b122059cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -203,7 +203,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
 					 int irq_idx)
 {
-	return irq_idx >= 0 && irq_idx < intr->total_irqs;
+	return irq_idx >= 0 && irq_idx < DPU_NUM_IRQS;
 }
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
@@ -470,13 +470,12 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
-	int nirq = MDP_INTR_MAX * 32;
 	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
+	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
@@ -487,8 +486,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->hw.blk_addr = addr + m->mdp[0].base;
 
-	intr->total_irqs = nirq;
-
 	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
 			 BIT(MDP_SSPP_TOP0_INTR2) |
 			 BIT(MDP_SSPP_TOP0_HIST_INTR);
@@ -601,7 +598,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -636,7 +633,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -652,7 +649,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 391fb268ad90..bb775b6a2432 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -38,6 +38,8 @@ enum dpu_hw_intr_reg {
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
+#define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
+
 struct dpu_hw_intr_entry {
 	void (*cb)(void *arg);
 	void *arg;
@@ -50,7 +52,6 @@ struct dpu_hw_intr_entry {
  * @ops:              function pointer mapping for IRQ handling
  * @cache_irq_mask:   array of IRQ enable masks reg storage created during init
  * @save_irq_status:  array of IRQ status reg storage created during init
- * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
  * @irq_cb_tbl:       array of IRQ callbacks
  */
@@ -58,12 +59,11 @@ struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
 	u32 cache_irq_mask[MDP_INTR_MAX];
 	u32 *save_irq_status;
-	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
 	const struct dpu_intr_reg *intr_set;
 
-	struct dpu_hw_intr_entry irq_tbl[];
+	struct dpu_hw_intr_entry irq_tbl[DPU_NUM_IRQS];
 };
 
 /**
-- 
2.39.2

