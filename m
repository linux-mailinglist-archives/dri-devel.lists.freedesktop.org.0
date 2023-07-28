Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95266767915
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F9010E7AC;
	Fri, 28 Jul 2023 23:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD9610E7A3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:06 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so48882231fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587125; x=1691191925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oseJULiE4DKRUQdbGIWxmLhogan8Futk21rKFzuy5Bk=;
 b=gjAVkTpbFC3noMLyvbdGvtMv2KHat0IjgnXmNn0GJmmDM1shuknmARsg0mC392Al4p
 aAOmSd4XZWiGQC69sdyG3A+50UUYc+fPQ5mDRRIK4+wgXgdDxGaVDysif5Xam3YkE6Cw
 Aa20QVRjx4uIJxF+Phsb8bPAQZmJGwS2tlBIMGRagOAVNuGJnoJKKLeA/DM6pfa9gFam
 +bs1+LKtXYc2Ht48ZFmCrbDNH8MrSl2Wtm0499dKZu9hreRnNa3T2nRJ6W0edGrQyWz/
 s83Q4R4elwV8sUZ7KxzmVGwy07juAJbP+3eo8iaMn9iwrIFsb9i6a4Ee9n3MOJemwOU4
 dwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587125; x=1691191925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oseJULiE4DKRUQdbGIWxmLhogan8Futk21rKFzuy5Bk=;
 b=CunuPq+WRXb6/HCztfQsjdjA+Ham1HKj/6Kpb9zr3m/SqH5c7UA7JQ1xSX7xE3BMm9
 0T+goF5kGRE7nP0tVr8ty3x31zEJxNY8gYhwlW19YiIl55E0yXJM8YKRcwAJwPqj+XKk
 Gf1kxraMgSgJvLiJ04nOLeeAg19/Qj+NZPX1ENC9ZinJgTEPn+Kak2zVOhixfzf/ZzcB
 Uci4czUn9y/Zss38HxNTXVueEAuOySfS48FhJodsR3Zl5zu1vdNVyaLPK5/9pG+/pEZ2
 JvP93svY+sq7DBY5b5qPKIYb7Vpf6dNnD63xnysi+0TljUGh0Js8PeUu+hpaACJ4AwZS
 ViQg==
X-Gm-Message-State: ABy/qLZCZWTXmlMqFWWtMQ6OixvPq1/hleW3bmyoCyyh2du/NEiyDU6I
 f33xUwe69BgjSXjVD3osQNefUw==
X-Google-Smtp-Source: APBJJlFZeYd4DRxKDl4/KQISrmcgGIigRQFDnjdlV963Z4Uj9wD33UhHnTlC27k+RC8Qr6H1wt+wAA==
X-Received: by 2002:a05:651c:39e:b0:2b9:90fb:3502 with SMTP id
 e30-20020a05651c039e00b002b990fb3502mr2427838ljp.9.1690587124843; 
 Fri, 28 Jul 2023 16:32:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/6] drm/msm/dpu: stop using raw IRQ indices in the kernel
 output
Date: Sat, 29 Jul 2023 02:31:59 +0300
Message-Id: <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
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

In preparation to reworking IRQ indcies, stop using raw indices in
kernel output (both printk and debugfs). Instead use a pair of register
index and bit. This corresponds closer to the values in HW catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 ++++++++++++-------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 308b122059cd..6071d3f05b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -199,6 +199,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_BIT(irq_idx)	(ffs(DPU_IRQ_MASK(irq_idx)) - 1)
 
 static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
 					 int irq_idx)
@@ -221,10 +222,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 
-	VERB("irq_idx=%d\n", irq_idx);
+	VERB("irq=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	if (!irq_entry->cb)
-		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
+		DRM_ERROR("no registered cb, IRQ:[%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	atomic_inc(&irq_entry->count);
 
@@ -306,7 +308,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -342,7 +345,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ [%d, %d] %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -359,7 +363,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -391,7 +396,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ [%d, %d] %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -444,7 +450,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 		return 0;
 
 	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return 0;
 	}
 
@@ -520,16 +526,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	int ret;
 
 	if (!irq_cb) {
-		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
+		DPU_ERROR("invalid ird_IRQ:[%d, %d] irq_cb:%ps\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 		return -EINVAL;
 	}
 
 	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ: [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] irq=[%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -548,8 +557,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 				dpu_kms->hw_intr,
 				irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
-					irq_idx);
+		DPU_ERROR("Fail to enable IRQ for [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 	trace_dpu_irq_register_success(irq_idx);
@@ -564,19 +573,21 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	int ret;
 
 	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ: [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] irq=[%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx);
 
 	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
-					irq_idx, ret);
+		DPU_ERROR("Fail to disable IRQ for [%d, %d]: %d\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), ret);
 
 	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 	irq_entry->cb = NULL;
@@ -606,7 +617,8 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
-			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
+			seq_printf(s, "IRQ:[%d, %d] count:%d cb:%ps\n",
+				   DPU_IRQ_REG(i), DPU_IRQ_BIT(i), irq_count, cb);
 	}
 
 	return 0;
@@ -652,7 +664,8 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
-			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+			DPU_ERROR("irq=[%d, %d] still enabled/registered\n",
+				  DPU_IRQ_REG(i), DPU_IRQ_BIT(i));
 	}
 
 	dpu_clear_irqs(dpu_kms);
-- 
2.39.2

