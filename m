Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95974B978F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1794710E7FF;
	Thu, 17 Feb 2022 04:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B5F10E7CB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 04:16:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u20so7661003lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
 b=bkhuZyhZCMGvu5H/DkxhUkW2wgOQzYi/8NORCjzbidTjKpvX2kmxbeqH0VBs0M1JDK
 L9WJoRjJEBuJ6U/jTladD+RG03szdfMm4enpBOv4zNTBqrSD3KN58RPgiRtwnbcoP1QI
 x2jBNLd3Vr89wZvymnwfSnhY6sluxk3Vz+AdFJHhrLjhwpc078Q+t7WInw5dN+4UJe07
 52OLXkIMpcUfW9xcr+kHj0kigieUFmJ8Z8wf8ZwEWtArHy4A1lAEoYaODSQIica1NWBe
 y5Y+ByKr+QtFNjd0mtj2QvU4nSPMxf6w0akozqL+abl1vVS8yJH4fC+umjlBu6lO02hX
 GE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
 b=OlYKQgTWpUmv3VnO1ghKKgZtyUgCOubHN7XlqISI681Wek9ianv8VfWAPQ8MoxR1IQ
 GZLsPeHKwehbcD+vBW7lBl1pdfTlfY8Qf/s+lNaMXRhu8OFwDiyWXyB50Kdf4M8NyKSL
 VQUuhvICKmQpkwtMlxJZtkZLuYwTH3Vra9ce/PhZnZbA3gIiNoMKMHkyIP6TSF32M3Oe
 7U5v2KxqEaqOmGDlHlIayMIQ1nmCmQofpAFjaSF5QBcZUJT9W+wpMPBDJ9d3rYq7S3mT
 WW0n+mJN+hxpdQN4BVBYytAXM/RTrnMtBK3NDrF+XBec8kRbgQUkg5rGdgGMSoJR+T04
 nDAw==
X-Gm-Message-State: AOAM530CKFDL3tW9n49yPNZqs8xDrdIzEbIrAvw0fabalNY7sr11TpLd
 TB59aIt6zMUSlzU9FDFq2N7Rfw==
X-Google-Smtp-Source: ABdhPJyrfjUrfsWHk0OaXnezPMdkjID3KTb3i1Tfr2BKqkJq3LVzQ0x9tMJ1XNpSnRSVtXqFTFeCMA==
X-Received: by 2002:ac2:4d06:0:b0:443:5f59:45e0 with SMTP id
 r6-20020ac24d06000000b004435f5945e0mr844221lfi.500.1645071380577; 
 Wed, 16 Feb 2022 20:16:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:16:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
Date: Thu, 17 Feb 2022 07:16:13 +0300
Message-Id: <20220217041617.470875-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
References: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
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

