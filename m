Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15FB7656CB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381C910E5A2;
	Thu, 27 Jul 2023 15:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B02E10E5A7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:05:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99357737980so140328466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690470299; x=1691075099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znblpuRy3gZou2cx35uTcthh3ry6mTJP1E2s5bnB1uo=;
 b=g5uasyJk2efqx40d3W7Wxitt4aN614ferr2JlR3TLvc0zcPMnaiwYWXaUFR3eboGDB
 TlNURqQekQ7yau1hidoTmd5frqo2scXAMmdg2vOAo79OuB6rYRA0G4DgbOUkrHYjz1as
 wNLnVxvbUreIIMqML2rSng8lQzCksSR5nKPFZfSu7lu/9Cjka/fD+cBoLM137R27It9a
 4FRQmL1hH8HkuWwIrJgbI1wQyBwO2bcSSG3qlPVKrmMg4bRS//VLd8AMcYxjg97relim
 JKWrjb2FXW9a1BSTUDx+xmdr8FzQY1c+ALRouGsxWYoIOsLs72qd8PygOBn2zoQLuKA8
 /uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470299; x=1691075099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znblpuRy3gZou2cx35uTcthh3ry6mTJP1E2s5bnB1uo=;
 b=PjlcVclp07zsYBkGC3qdeTet6F2F6eKutoAYotyBHIOs/qlJQMjOLB1kqNPh34/eAy
 CazWu2JNIrqS9sw/6sY/ic3Pc2Q+Kr58Hpx6PrIHAM5ame1wwFm8UtTp71ajSY4RopeH
 x9npdvaz3NLjKSl51Ov7rJjlU3l0GZQBd3wnN/p6YJdwYh0Yh1sbA59/fEJmESl+gUr7
 0IO0THs+vwe9LY4ZLSBZPNTUSN3adq/Hnn2cX+ZckMxGd92b7H1wtY9zrzbk5gjphWvH
 MEYKZ9bTOgp8v5hOHV1RsoFDvtyZSlBbuYeDs9GMB6QH/B4O2xCPTIRAwMItXO4uzH2w
 8/5w==
X-Gm-Message-State: ABy/qLbnAXZDKY7Ky2tR9N9ExplmdLFoDoWf2H8xglRf1+WQd33z61hm
 LA4lZA0YZDO+gPbLTxtgpn2r9A==
X-Google-Smtp-Source: APBJJlEq2OTOISI/OGf6Yw57VSvpZajPAa5e6l34/L2S7Z732SwvD0nraHFeA361clercDFTfyPA5g==
X-Received: by 2002:a17:906:3118:b0:994:555a:e49f with SMTP id
 24-20020a170906311800b00994555ae49fmr2126869ejx.31.1690470299513; 
 Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/4] drm/msm/dpu: move several IRQ-related defines
Date: Thu, 27 Jul 2023 18:04:53 +0300
Message-Id: <20230727150455.1489575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
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

In preparation of slighly changing IRQ numbering, move DPU_IRQ_REG()
macro to the dpu_hw_interrupts.h header. Also split the DPU_IRQ_MASK()
macro into local DPU_IRQ_MASK() and the global DPU_IRQ_OFFSET() macros.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 01a9ccfcd54b..eaae7f11f57f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index e2b00dd32619..3a988a4e4f33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
 
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
-- 
2.39.2

