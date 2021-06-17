Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1BA3AB581
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 16:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0696E89D;
	Thu, 17 Jun 2021 14:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84BB6E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 14:09:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a1so10545983lfr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HxVxCNncfl7sobKYPc3WOH+hS+AyXpqE4qRLACNBDX8=;
 b=RG06X/tJrgCg+FrkuxXBXDuRBfW7ZdVciZaTP19z/4bhsGpNUZ8zXzcWuo91+cv02F
 nkJre9ZPDwR1bypTclkOZj7feawbil9LLIAbuRM4gdpAAwl6j104VhSYYTPJKSekGXHt
 RCULRxYc6nTQdsciK5XeNuhmiKAGLnFzqvmQjlyCrOX+0zyLf4mkg1XZ7vXvrLQinZNE
 W4ME8Vs0/oORhvwgse/bXx7kJdy4CqnoyPXpH8/zmwzu6tqB75cfHoSUYmPg/0OjELzh
 tTPCDg3rKESV1jiAE28hWkwq5Y6TWkR6/DQfPuM2GVJ8lebb02ASxNgyTDopPXzQDoDZ
 Q28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxVxCNncfl7sobKYPc3WOH+hS+AyXpqE4qRLACNBDX8=;
 b=EwLkc/0KCrDA7peKLHW7KTIsyw8YWE9JxH0P0lWS2/IrsUel5AgtEyOfAk6pYYlVh6
 jp8R6w3UEryfcVJ2bs5i3gFRjEytrFzVeLkYMzEaMi6+J5VK0gcRYh7hG8VKYGKNu19R
 DdKyOcBC5Z2DKx1i5b3rx9n853TrqfRH6TqADo7QH6atdYapYN8w+/DfUOMI2bz2qORT
 Yw1zEI1SHRtNMhfw2/NgmD3E5Q9BTtv8VY/kFv7NXRyz/X7foBrr/YbZZujZInWzSyu2
 c723pgKmEfvA/NWb35Yr5sm9San7beJWbLyL7CLcUsJYav1x4DbQ6JwEBjj0CQYUEBzp
 dt+g==
X-Gm-Message-State: AOAM533bAhfFrMp7BHNe2CosA4KipE/QQnxfKWlg6CemOOW9TfF1jsaa
 4+AHRo8Q0XNTTWean+AobJiAvw==
X-Google-Smtp-Source: ABdhPJz85Hl6Hdni9SW5sjuXFNjJ4wAq3ZwSkvQ0MbsTbY3BfJO7BeInf5/zbpBTaO6qNHH0lqaLkQ==
X-Received: by 2002:a19:c3d1:: with SMTP id t200mr3442592lff.220.1623938952229; 
 Thu, 17 Jun 2021 07:09:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 07:09:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/7] drm/msm/dpu: don't clear IRQ register twice
Date: Thu, 17 Jun 2021 17:09:03 +0300
Message-Id: <20210617140908.412298-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
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
index 8e890f981afd..17ad78d49948 100644
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

