Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F757218A2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542F10E168;
	Sun,  4 Jun 2023 16:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90C510E163
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:07 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b1acd41ad2so29970101fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896086; x=1688488086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/cqM9viGLTu192wkMsov0ajiNjj+NmmxiCOn9iYik4=;
 b=ZQr/SJnzBw4GJ1037RBft6IVlthK93fqC9cCzRRDk+6tKIggaOecfstBNDmtDPCaOK
 FdAn+nOs+WpxbgS6KFmL9AVDJ81wMDlAuTDtGGJ7C6ouu8lMN99kcJEZ6VFVpdEDORZY
 s1Ndv0fYNcqAmgUpBv9IDXGIXsRLyOWCALMHJEaXmsfWonfWaGQCTmpzl/ew/LOBT2xY
 DP9KnGk+a5Zw3+Pbl6A9q2x14X0wiAo0kRUL944u1ChO2BA639mI8zNGYgsA716JqD3C
 tSBhF/J5eGaUZ7ttTlizLWJeUOIvJG8VdxBMMCHUl5yh8IjSPmRwfr3JpCatiwpc91vJ
 P/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896086; x=1688488086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/cqM9viGLTu192wkMsov0ajiNjj+NmmxiCOn9iYik4=;
 b=eCntq0S7YOlG+B8hpK1cOJCWBcN4n+xDoEgzuhB+Xc1wSlElPVlEMw88Ekg2Gxs3U8
 Tov0fyEOUhjsWbGI2ebXieNDHjyUM+X/Z8q++VznzUUnLtAV1TiXn5eUHqpQU6+yIHpA
 JsJXgeAd5G+b7ioelhLj8EVNXRdSJmqssvHG12sRkQzPUtZACk09RImpR3lWSPkqW4LN
 B3BpydyDsxQCcdp6MPG2b7J4e4nhqitZNNsssau7WcWcrqUM+oJ0S7UfZbB3Q9y+YEtr
 4BzGI576rRBZ3kwZkbHSsujXdnvxOAp6LmWtgrq0gLTQA8kC4wW0BbR5J7fNPTChM65c
 KazA==
X-Gm-Message-State: AC+VfDwmme5lHCsktyzz69biqUJRtUnYkeXPuzQ/7yglnfdnwWbi3Slb
 av0FwYPB+Z8abtrMQrFfRW6kMQ==
X-Google-Smtp-Source: ACHHUZ4Lox8qsngdtwvWe7KEHgFClGgkaSyNQiJ8jBQkx46A8dWTpU6cvSvK7q3wF3CNCS5L9ra3mw==
X-Received: by 2002:a19:a413:0:b0:4f6:2199:57b4 with SMTP id
 q19-20020a19a413000000b004f6219957b4mr1001377lfc.47.1685896085934; 
 Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 6/8] drm/msm/dpu: move several IRQ-related defines
Date: Sun,  4 Jun 2023 19:27:58 +0300
Message-Id: <20230604162800.1048327-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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
index 9eeeb046db15..3bc0e6f704a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -178,8 +178,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 06c7bedd5c0a..41f2dff7d689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -42,6 +42,8 @@ enum dpu_hw_intr_reg {
 };
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
 
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
-- 
2.39.2

