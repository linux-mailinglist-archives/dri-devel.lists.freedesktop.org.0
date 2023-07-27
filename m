Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9F76563D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DB310E59A;
	Thu, 27 Jul 2023 14:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D210E59A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fdd14c1fbfso1874884e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySkrUDanMc9ZbI2s5Lw++O0slJDHRsqtls5Tv4CEjbo=;
 b=rOzA7S76EDTb2qD731viBkqHuLSRuSprdbhRGaIWQDC9+CCyOYTwsYIuiV1kErKAqK
 pP52ocynh4QkFszSvRDc0Ziks7zNb0UlkAtBuxTCHXlrqg2hdnQARPw9rkYcuA/+cZUV
 aJHc/4Bxj60OS0uDDevmxrX/Wqzh2C7yuEvrHB0VB+TCd6eLVxwFkPk/5fqU/YqoSLyB
 +lP9VAKWpwfPp0spwCRkQIkFTl3S+rl0OzsHT1du+ML2VsGISSHmsnU5WqQohjpbpXLR
 +pL5bozcZYbAVLXI5xMuBSadFsJyyhV07Q+jnR0W09k51F1TPyxjzj6ev9URkomIJSxX
 XSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySkrUDanMc9ZbI2s5Lw++O0slJDHRsqtls5Tv4CEjbo=;
 b=CWIcq05tB5IozdtRCDpYBFoZ8AsQqCwIkjN77cAX9m3YdR8qcbqh3oY7LgOM4Bt38H
 khMSHgy5tWL16rTgMHrc1CimTF+cRslvMlL43TV0aUCxDRJzi/KRaowsHByu0FPPFkGg
 1ehqi5pHwoT+yX/2bu35Qsk8y5+gRz+ejCXHY19FVdp+jL5LNojLcK7UAW7fOsjUr0yw
 /NbQ8YUtXjg7B4ifikvfLwbwGfxCvQV5SJwibLI4FHvSXifAiJzS7TAQ73bSogH1HfB8
 lWzrA3jWfl4Th46t8S8ahH5dV2724E2tCa+hk22+Gn8jrforxIZ+nhIqvG9IS6uOSAFD
 z60g==
X-Gm-Message-State: ABy/qLZaDlfCN5vf4BX+sChEXwfSrT+1IOhFBb/SfhsLOUbiGuORx2ZK
 55m6gHoBjQuThbJBZunf6/Pu4A==
X-Google-Smtp-Source: APBJJlGd8gH4gBBz5NHcNIkymr7usd3IzWwDdNx5XcfUIww8mQX2s9ImQTa3YtyedY3G3LnAUHybPg==
X-Received: by 2002:ac2:5f81:0:b0:4fe:d9e:a47 with SMTP id
 r1-20020ac25f81000000b004fe0d9e0a47mr1789383lfe.69.1690469146920; 
 Thu, 27 Jul 2023 07:45:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 2/5] drm/msm/dpu: split interrupt address arrays
Date: Thu, 27 Jul 2023 17:45:40 +0300
Message-Id: <20230727144543.1483630-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no point in having a single enum (and a single array) for both
DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
enum and two IRQ address arrays.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Fixes: c7314613226a0 ("drm/msm: Add missing struct identifier")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
 2 files changed, 72 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0776b0f6df4f..0cecdc847b49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -51,11 +51,9 @@ struct dpu_intr_reg {
 };
 
 /*
- * struct dpu_intr_reg -  List of DPU interrupt registers
- *
- * When making changes be sure to sync with dpu_hw_intr_reg
+ * dpu_intr_set_legacy -  List of DPU interrupt registers for DPU <= 6.x
  */
-static const struct dpu_intr_reg dpu_intr_set[] = {
+static const struct dpu_intr_reg dpu_intr_set_legacy[] = {
 	[MDP_SSPP_TOP0_INTR] = {
 		INTR_CLEAR,
 		INTR_EN,
@@ -121,57 +119,78 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_AD4_INTR_EN_OFF(1),
 		MDP_AD4_INTR_STATUS_OFF(1),
 	},
-	[MDP_INTF0_7xxx_INTR] = {
+};
+
+/*
+ * dpu_intr_set_7xxx -  List of DPU interrupt registers for DPU >= 7.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(0),
 		MDP_INTF_REV_7xxx_INTR_EN(0),
 		MDP_INTF_REV_7xxx_INTR_STATUS(0)
 	},
-	[MDP_INTF1_7xxx_INTR] = {
+	[MDP_INTF1_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(1),
 		MDP_INTF_REV_7xxx_INTR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_STATUS(1)
 	},
-	[MDP_INTF1_7xxx_TEAR_INTR] = {
+	[MDP_INTF1_TEAR_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
 		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
 	},
-	[MDP_INTF2_7xxx_INTR] = {
+	[MDP_INTF2_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_STATUS(2)
 	},
-	[MDP_INTF2_7xxx_TEAR_INTR] = {
+	[MDP_INTF2_TEAR_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
 	},
-	[MDP_INTF3_7xxx_INTR] = {
+	[MDP_INTF3_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
 		MDP_INTF_REV_7xxx_INTR_EN(3),
 		MDP_INTF_REV_7xxx_INTR_STATUS(3)
 	},
-	[MDP_INTF4_7xxx_INTR] = {
+	[MDP_INTF4_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(4),
 		MDP_INTF_REV_7xxx_INTR_EN(4),
 		MDP_INTF_REV_7xxx_INTR_STATUS(4)
 	},
-	[MDP_INTF5_7xxx_INTR] = {
+	[MDP_INTF5_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(5),
 		MDP_INTF_REV_7xxx_INTR_EN(5),
 		MDP_INTF_REV_7xxx_INTR_STATUS(5)
 	},
-	[MDP_INTF6_7xxx_INTR] = {
+	[MDP_INTF6_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(6),
 		MDP_INTF_REV_7xxx_INTR_EN(6),
 		MDP_INTF_REV_7xxx_INTR_STATUS(6)
 	},
-	[MDP_INTF7_7xxx_INTR] = {
+	[MDP_INTF7_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(7),
 		MDP_INTF_REV_7xxx_INTR_EN(7),
 		MDP_INTF_REV_7xxx_INTR_STATUS(7)
 	},
-	[MDP_INTF8_7xxx_INTR] = {
+	[MDP_INTF8_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(8),
 		MDP_INTF_REV_7xxx_INTR_EN(8),
 		MDP_INTF_REV_7xxx_INTR_STATUS(8)
@@ -216,19 +235,19 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 		return IRQ_NONE;
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
+	for (reg_idx = 0; reg_idx < MDP_INTR_MAX; reg_idx++) {
 		if (!test_bit(reg_idx, &intr->irq_mask))
 			continue;
 
 		/* Read interrupt status */
-		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
+		irq_status = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].status_off);
 
 		/* Read enable mask */
-		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
+		enable_mask = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].en_off);
 
 		/* and clear the interrupt */
 		if (irq_status)
-			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
 				     irq_status);
 
 		/* Finally update IRQ status based on enable mask */
@@ -285,7 +304,11 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	assert_spin_locked(&intr->irq_lock);
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
-	reg = &dpu_intr_set[reg_idx];
+	reg = &intr->intr_set[reg_idx];
+
+	/* Is this interrupt register supported on the platform */
+	if (WARN_ON(!reg->en_off))
+		return -EINVAL;
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
@@ -334,7 +357,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	assert_spin_locked(&intr->irq_lock);
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
-	reg = &dpu_intr_set[reg_idx];
+	reg = &intr->intr_set[reg_idx];
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
@@ -368,10 +391,10 @@ static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
 	if (!intr)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+	for (i = 0; i < MDP_INTR_MAX; i++) {
 		if (test_bit(i, &intr->irq_mask))
 			DPU_REG_WRITE(&intr->hw,
-					dpu_intr_set[i].clr_off, 0xffffffff);
+					intr->intr_set[i].clr_off, 0xffffffff);
 	}
 
 	/* ensure register writes go through */
@@ -386,10 +409,10 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	if (!intr)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+	for (i = 0; i < MDP_INTR_MAX; i++) {
 		if (test_bit(i, &intr->irq_mask))
 			DPU_REG_WRITE(&intr->hw,
-					dpu_intr_set[i].en_off, 0x00000000);
+					intr->intr_set[i].en_off, 0x00000000);
 	}
 
 	/* ensure register writes go through */
@@ -421,10 +444,10 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
 	intr_status = DPU_REG_READ(&intr->hw,
-			dpu_intr_set[reg_idx].status_off) &
+			intr->intr_set[reg_idx].status_off) &
 		DPU_IRQ_MASK(irq_idx);
 	if (intr_status)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+		DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
 				intr_status);
 
 	/* ensure register writes go through */
@@ -448,6 +471,11 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
+	if (m->mdss_ver->core_major_ver >= 7)
+		intr->intr_set = dpu_intr_set_7xxx;
+	else
+		intr->intr_set = dpu_intr_set_legacy;
+
 	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1f2dabc54c22..f329d6d7f646 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -23,24 +23,29 @@ enum dpu_hw_intr_reg {
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
 	MDP_INTF5_INTR,
+	MDP_INTF6_INTR,
+	MDP_INTF7_INTR,
+	MDP_INTF8_INTR,
 	MDP_INTF1_TEAR_INTR,
 	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
-	MDP_INTF0_7xxx_INTR,
-	MDP_INTF1_7xxx_INTR,
-	MDP_INTF1_7xxx_TEAR_INTR,
-	MDP_INTF2_7xxx_INTR,
-	MDP_INTF2_7xxx_TEAR_INTR,
-	MDP_INTF3_7xxx_INTR,
-	MDP_INTF4_7xxx_INTR,
-	MDP_INTF5_7xxx_INTR,
-	MDP_INTF6_7xxx_INTR,
-	MDP_INTF7_7xxx_INTR,
-	MDP_INTF8_7xxx_INTR,
 	MDP_INTR_MAX,
 };
 
+/* compatibility */
+#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
+#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
+#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
+#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
+#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
+#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
+#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
+#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
+#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
+#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
+#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
+
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
 /**
@@ -60,6 +65,7 @@ struct dpu_hw_intr {
 	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
+	const struct dpu_intr_reg *intr_set;
 
 	struct {
 		void (*cb)(void *arg, int irq_idx);
-- 
2.39.2

