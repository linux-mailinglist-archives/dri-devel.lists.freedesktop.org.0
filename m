Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFD3ABED1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 00:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BC86E82D;
	Thu, 17 Jun 2021 22:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA596E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 22:20:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s22so11202947ljg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
 b=nf/R3gMKmZ8YgJAIeW60PBX9O9+j3CsjOZDroP9lA9yyvHNR7Ca40xUawrTgWUTg1N
 BQu0Z5+/n5ovKf0/qjnQ7GG9EOwTdpb2mGE2O4V+w6lbeZ3wt1rw6R/bBn8NyWydIsSD
 S1NKDTJSygtKDGiQsk1U2BbPWwHLQUwjjKjMict3x1ahfh8Br1AviN9pzzeGsLdH8Scm
 TesUzsO8PJxSSWSsizW9MeGAwk01dFj8tC29SB2w7R857fqIpzcfS6YJs6AyCc6d31ge
 vP4uqGgoxapXtXrsDxq6P6IlvhEgkbaNgFCAkkflnpqORETZ5Xltds3q89BC+TV2slmH
 nnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
 b=hQB0oFKsRPjwvKOr5VH4gW+eQFqmBsn8O4iigu+dv8hsUuQWgn9EDPMx+D4gsEwVDX
 H/RyKVhYRxMtRD669vWpdnOP3cwEZRJZw0Vq4nqy3v3dyWV2Aw69+xaWKhJNIwlzJB7p
 v58z/JfYj/8Np1KXEG3BQA6RVMlnlNQ6zx8XG5OmNbnav3mYCs3yGt7QUktoJCSXxQU5
 MhxD2VyRKFDV5wdQBkJUQ44yykzi4bgoeDFA38L+1uvKOgIFHEi4XqU51gYe9R6DRT37
 DjrjIKEff4B7NckTCOX7ykqNTn4xBwt3CAXOrcyRCsz1/FjLxIe39ITF+6FjFUOgOGVL
 5r5g==
X-Gm-Message-State: AOAM5309xot/Y3uya7lKDaq68eg5dC6rIn5qMGNqXzc7IM59aAKodkrg
 RvFuZu8R0kbLftTPq44fRIPiqw==
X-Google-Smtp-Source: ABdhPJzPs0irvwnPKXw3J2P+XJG57pLvbM7p+TMR28NCYTmMBcBStdtF8CyUECqv4poLyv9KuTCiwA==
X-Received: by 2002:a2e:9f14:: with SMTP id u20mr1035864ljk.222.1623968433429; 
 Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 15:20:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 2/7] drm/msm/dpu: don't clear IRQ register twice
Date: Fri, 18 Jun 2021 01:20:24 +0300
Message-Id: <20210617222029.463045-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already clear the IRQ status register before processing IRQs, so do
not clear the register again. Especially do not clear the IRQ status
_after_ processing the IRQ as this way we can loose the event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 2437b0c7c073..28e9b0d448db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -120,21 +120,6 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = DPU_IRQ_REG(irq_idx);
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off, DPU_IRQ_MASK(irq_idx));
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @arg:		private data of callback handler
@@ -203,8 +188,6 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 
 			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
 
-			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
-
 			/*
 			 * When callback finish, clear the irq_status
 			 * with the matching mask. Once irq_status
-- 
2.30.2

