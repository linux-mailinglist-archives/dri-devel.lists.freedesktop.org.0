Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1AA4A5FBA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086CE10E641;
	Tue,  1 Feb 2022 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090D10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:11:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id j14so24599696lja.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rStlTv/QLBk6KsFVu0/iZDaKBkJO7zJVGuOILLqnt5c=;
 b=mBvRaov7kXUZJbbBGmYwL865IkYzMKUi6VGXGwk8/+sbEhvr/OfoTroK0Obq60dxAC
 MfGUqE4FzLuS6XowC0d/q3lvwCMVK2P5h69IUhNrHvsnMd2nu/z0kF328GCKzc/obLLO
 1WYNJ7iCHemNwTVCjJwn/DgWrIwwoTFoUsVHf03r5bT75qHsvx/vzWj3hXTxibvg2EAA
 vqmw0qKSA/wpfdJ5o+MgVNx2xmjfhmItzzunM2CIh0Up3NXIQvKfCeMhjUxuSyXMdMr+
 u6SzQiV5kjwFd54eBlNk/o3vZ/TxZsuDkTSF9kjSPVFZ5QuAb4635rD9kbwY6TEqAO4w
 jAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rStlTv/QLBk6KsFVu0/iZDaKBkJO7zJVGuOILLqnt5c=;
 b=LSv26/dwDdwIo7hnmijPt+OIWbHLJrD3TqQorAjPB3GAqz2EGv20jnMj1G/bcXr3mH
 E/whPXQ+Nl7DGsbr+7DwRqyLZEpl2fR3P9RoOH0F3tH/Kzn51t4cq92eaqwvqVTll7O1
 R7NImgWa7BAuLi5vOkUeRp8IolDiVhKTbKOBOp5zozmde7xWkWpM6BEtw6qKLibFaniN
 AphvfcHxA1EErOWNVAzm82nxw1XIeMOqCYUckQxzftRAEjBEwW/UBDf8Zw9xC440ToLv
 FUkWnrdaL660XhzsK4mFSEpTW5Bczt84JWgkZJl/X38dtEogxLeBNfSvwXjDM1SF8Pru
 ZwXg==
X-Gm-Message-State: AOAM533zz/cIEcbD65UbVBk8zE6CF95jOYxS3xJ4s5ZyV3eklDMu4Csz
 m6DVc8CAO38aVxlImsSinlm1Vw==
X-Google-Smtp-Source: ABdhPJzq9CJyf0JuC5CGgMT/Ht0mAwkETYveQMmGOdE2xCYm21V94ua9h1e6atg/5Ls/bfs82LvnWw==
X-Received: by 2002:a05:651c:1249:: with SMTP id
 h9mr16891980ljh.127.1643728259886; 
 Tue, 01 Feb 2022 07:10:59 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y6sm1337723lfk.157.2022.02.01.07.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:10:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
Date: Tue,  1 Feb 2022 18:10:52 +0300
Message-Id: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
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

