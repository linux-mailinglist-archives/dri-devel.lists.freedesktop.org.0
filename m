Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C014B97BC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E459A10E803;
	Thu, 17 Feb 2022 04:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980D310E796
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 04:31:52 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id o9so6470386ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
 b=q1li0SXAdTI4moSmYEV3ZKUyytG+SSOQR1y2b4fN1S1Ppl9ZKFKqnkANnmXWT2k9AU
 iywuQuAnoUzyXtbgkweEt/jZpPWcAp1a03GFgSordholykmD6pr30UtFwDYjpmx8Vbpz
 Y/FbPeDVELvQf4jdlQ/L9vm2+myY7T/WnkcsppbW/BdPUn99RUoywmFFPoH5vQV9w3I3
 xJUqkJxH37NMGY2o0Oh6Ur4+V4CdlbV+CGLxFDtrhauZfbrYJM+kM3HAXLHGe/yY7Ftx
 rfXp1UkY46MIZlmBHlZNLJCqittKjAKEXaNTS3stXouk4pHH6LMo6T1B4NC5YGmxuDWX
 OV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
 b=mCiyShcQdp3sT3O89E0NOgk2wAGuGRQfEaK5vUE/hzV8rMU6wpEsiLEtKGUvbvl9hu
 U/dN1AvVSHf4L6P+pwxCGlruXhNOd4+tetF3ho/x4yyuual4MKoWYgmBSRI+NRQn6g41
 OU/GHiTgQK7iRw3ZDZMDbsa8g4M9xjUcq6X0TV1aJRhOfIUO0al69fKWa9fVLvhQuIUA
 UKiLqAILzamScL0c83F3RAMIOMSUOnPmYgrj0052VUe7hH4dEnuGNOkbOyl22LEoiHjH
 kIOBFqC2HrhQ7iXCRrEG+TkJsVwKqBEmaM/GJzgkghrCZ33egForAMZWl9pn25eB73El
 bIXg==
X-Gm-Message-State: AOAM533q39Yxpry3DHprHnZQRO0bicjMbxFGsGGoljv3QuU6legWZghy
 bInOPE9cORuFtHsd3qPqoyhGhA==
X-Google-Smtp-Source: ABdhPJwKrcQFY9EYGS9iFVYjR/pNCIQEUlLK5X/y/eA+Vo7BjU31XsfV8+aTUS+HPzW3vvjWi1u1CQ==
X-Received: by 2002:a2e:2a44:0:b0:243:6b73:1c0 with SMTP id
 q65-20020a2e2a44000000b002436b7301c0mr961535ljq.376.1645072310956; 
 Wed, 16 Feb 2022 20:31:50 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:31:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
Date: Thu, 17 Feb 2022 07:31:44 +0300
Message-Id: <20220217043148.480898-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The argument clear of the function dpu_core_irq_read() is always true.
Remove it.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h      | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 7023ccb79814..6dce5d89f817 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -33,13 +33,11 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
  * @dpu_kms:		DPU handle
  * @irq_idx:		irq index
- * @clear:		True to clear the irq after read
  * @return:		non-zero if irq detected; otherwise no irq detected
  */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
-		bool clear);
+		int irq_idx);
 
 /**
  * dpu_core_irq_register_callback - For registering callback function on IRQ
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..5576b8a3e6ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -301,8 +301,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			wait_info);
 
 	if (ret <= 0) {
-		irq_status = dpu_core_irq_read(phys_enc->dpu_kms,
-				irq->irq_idx, true);
+		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
 		if (irq_status) {
 			unsigned long flags;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 71882d3fe705..85404c9ab4e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -357,7 +357,7 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -384,7 +384,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 	intr_status = DPU_REG_READ(&intr->hw,
 			dpu_intr_set[reg_idx].status_off) &
 		DPU_IRQ_MASK(irq_idx);
-	if (intr_status && clear)
+	if (intr_status)
 		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
 				intr_status);
 
-- 
2.34.1

