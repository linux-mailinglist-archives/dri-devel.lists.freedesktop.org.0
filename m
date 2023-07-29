Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7DB76829B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 00:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3310E23D;
	Sat, 29 Jul 2023 22:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1306910E230
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 22:27:16 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9c55e0fbeso42492891fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690669634; x=1691274434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HZVB2TpWsIms9tY9bHa3VuGyxASbRqT+ZSqT3K+7L4=;
 b=nxlDnB6USxIjcO4v0y1DUfTMMyVPOLI38WfZvMtC+dlI+ZHXIndgzvckL5WW3+rQ2K
 LAqXeA9xBMXTLtztDbOBOQ07XuZMHcjJmb3i8mnEiaK4sDDClTX+gDzVHfKnnuCpGwXI
 NvjwVKk/cFvEb+Oewv3V/KtW5oLyJpVa744DuwfOzdbBwQoiDR7tWN8RSQtkUKSpNzc+
 qhj7IjfYvfTq6bts1+ADrL9zNLTStB9YZWar+2TwZoDNuum19qQhEB/f4I41kSwN7xIE
 ivCQSd5qoalX87W6BfhXqJkWR8pFJ7yJpPzN1nO9vxSZ0CfoqNLiepkWM2/yz2M9TMUc
 hwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690669634; x=1691274434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HZVB2TpWsIms9tY9bHa3VuGyxASbRqT+ZSqT3K+7L4=;
 b=Bcac0NFympdPgtK6eIh67qmWAHXCZRUEjdFz6PaNehbAuSyZ2iFPmCf3yzRCd+zOdW
 dmQDFSgLyghZ1rBMHkEGB5Vt9sSZbK0QDT/RiPj2UbtODABhIrg1+tUbpriQ70ArrSX7
 WXuQNG2GtIgB9zSiXHZp7ZF0Cpx2EEYt28TtHflcczwhxHpGIGv2E27qxXOugZFqL0GD
 rr8AzqMvh+Ar2seLQuVeyg1IQGdipWMaFDsqhckXPRYcvURx8g4x9xki7HYnDfuIFCP7
 Ec7vXqm57NuEx0s+rlN0MeUZ04wDNDAv1lwyTT5gKq7kbJ813tb3nO3vbvq1Vp0/W9gj
 4Kkg==
X-Gm-Message-State: ABy/qLb1E2BhFwCcukur6R+nkdQOW9zpVB+xL+20pWxpZWnJFlQi1MUN
 TNROMknhmpILjgoq+1HKCBz/Vg==
X-Google-Smtp-Source: APBJJlHoE+zgCEMkoWxulwpgWHcfbE2Gd0vMGBm77MSTNh6mc6Sf1JVFuDbjtm3pB4YxEXysWQ2sSQ==
X-Received: by 2002:a05:651c:cd:b0:2b6:eb5a:d377 with SMTP id
 13-20020a05651c00cd00b002b6eb5ad377mr4243244ljr.5.1690669634387; 
 Sat, 29 Jul 2023 15:27:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a2e9789000000b002b9ae051ea1sm1734737lji.113.2023.07.29.15.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 15:27:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 5/7] drm/msm/dpu: stop using raw IRQ indices in the kernel
 output
Date: Sun, 30 Jul 2023 01:27:06 +0300
Message-Id: <20230729222708.329265-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 26 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 51 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
 3 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 051447a3620c..b81daa415efb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -351,7 +351,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq,
+		int irq_idx,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
@@ -366,36 +366,36 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, callback=%ps, irq=%d\n",
+		DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ: [%d, %d]\n",
 			  DRMID(phys_enc->parent), func,
-			  irq);
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EWOULDBLOCK;
 	}
 
-	if (irq < 0) {
+	if (irq_idx < 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, callback=%ps, irq=%d, pp=%d, pending_cnt=%d\n",
+	DRM_DEBUG_KMS("id=%u, callback=%ps, IRQ: [%d, %d], pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), func,
-		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
+		      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
 
 	ret = dpu_encoder_helper_wait_event_timeout(
 			DRMID(phys_enc->parent),
-			irq,
+			irq_idx,
 			wait_info);
 
 	if (ret <= 0) {
-		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq);
+		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq_idx);
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+			DRM_DEBUG_KMS("IRQ [%d, %d] not triggered id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
+				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
 				      DRMID(phys_enc->parent), func,
-				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
@@ -404,16 +404,16 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+			DRM_DEBUG_KMS("IRQ: [%d, %d] timeout id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
+				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
 				      DRMID(phys_enc->parent), func,
-				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 		}
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			func, irq,
+			func, irq_idx,
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 3d6d13407dde..b1592d73470d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(int irq_idx)
 {
@@ -220,10 +219,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 
-	VERB("irq_idx=%d\n", irq_idx);
+	VERB("IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	if (!irq_entry->cb)
-		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
+		DRM_ERROR("no registered cb, IRQ: [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	atomic_inc(&irq_entry->count);
 
@@ -305,7 +305,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -341,7 +342,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ [%d, %d] %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -358,7 +360,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -390,7 +393,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ [%d, %d] %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -443,7 +447,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 		return 0;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return 0;
 	}
 
@@ -519,16 +523,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	int ret;
 
 	if (!irq_cb) {
-		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
+		DPU_ERROR("invalid IRQ: [%d, %d] irq_cb:%ps\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 		return -EINVAL;
 	}
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ: [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] IRQ: [%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -547,8 +554,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 				dpu_kms->hw_intr,
 				irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
-					irq_idx);
+		DPU_ERROR("Fail to enable IRQ [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 	trace_dpu_irq_register_success(irq_idx);
@@ -563,19 +570,21 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	int ret;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ: [%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] IRQ: [%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx);
 
 	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
-					irq_idx, ret);
+		DPU_ERROR("Fail to disable IRQ [%d, %d]: %d\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), ret);
 
 	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 	irq_entry->cb = NULL;
@@ -605,7 +614,8 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
-			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
+			seq_printf(s, "IRQ: [%d, %d] count:%d cb:%ps\n",
+				   DPU_IRQ_REG(i), DPU_IRQ_BIT(i), irq_count, cb);
 	}
 
 	return 0;
@@ -651,7 +661,8 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
-			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+			DPU_ERROR("IRQ: [%d, %d] still enabled/registered\n",
+				  DPU_IRQ_REG(i), DPU_IRQ_BIT(i));
 	}
 
 	dpu_clear_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index bb775b6a2432..9df5d6e737a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
+#define DPU_IRQ_BIT(irq_idx)	(irq_idx % 32)
 
 #define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
 
-- 
2.39.2

