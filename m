Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B565911B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256E10E27F;
	Thu, 29 Dec 2022 19:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D7710E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m6so18363377lfj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2XgrhNnjMtMnZg+chXpHXUewoPXnncH9a6l9JUQxT4=;
 b=WxgQhyUbRXosLxUQBoea0k/Uj0esZXkuBGuSncBfc6tymtB14cSfB1o/xocRE4d0vy
 PcStPVA9LEEvn5FaMfePhU4ygdknG3wt924f05JtrMQfplpXl+ERnGOveS+P4qW9l5xy
 tP3vfCpqMDmjKuSrTa7G55ZoyMwHFLPycuiseAGnBfG0z0EbmVujgh8BxfF6RrOOWhK0
 ZRFp0PbuBbezObj2hkFqdtIJCgCXTlkF0rKlDkThYoj0hzRT0XOTqi2iwbOopgyPeUej
 GlI5RJIQAclUuZ7cf6zWrwhijm+54iI3FVqrEDhlWjyqGOpvjCtdfhn4FHX9ltlMHLFK
 9gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2XgrhNnjMtMnZg+chXpHXUewoPXnncH9a6l9JUQxT4=;
 b=PhnHg+hOZUpDJwYckbbJAOIZWeG44BSK9NGZxf/rdIlji/NiIrGz3RzND3gR4WrFyh
 9vnqp960Tct/LyXxCIUA93kI5oF0WNBNYjvzga57jj0atrH4n/+3jRP62akAwvZunl9U
 9qiEBWzF0SMTNbXoHOSpJ+V5tumFiOsaBnTKuxP6NogasZVLKCzxgznaRx6k3J6g2VFX
 gSBVzEFYAWVUQkN2wA3iORE8uKth/MK7Sf8orXw8B08azzEHgYOC93leHaP4LRiMmAxf
 SSZ9OthAHrCRIL76iWukfhfYuK+duENySip0YU1wj+HJfRSVGCtjXocp7IxRD9e8Ajv2
 ZhyQ==
X-Gm-Message-State: AFqh2kpjXGdEfQ9BxDAB8iIFw4Caj1AuzAvmfftOs5tKiImfMlD2h+M8
 gD0Pyg++ihgWGrYjWv6WGO++Bg==
X-Google-Smtp-Source: AMrXdXubzJtiMIABJMG6kmlzaDS1b6GjAupEN4ByPdhfl08o9GKqHlgf1KibZl8ApiQiqmkZZ3pfLA==
X-Received: by 2002:a05:6512:2247:b0:4b5:7338:e2c7 with SMTP id
 i7-20020a056512224700b004b57338e2c7mr9220507lfu.53.1672341558078; 
 Thu, 29 Dec 2022 11:19:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 20/27] drm/msm/dpu: populate SmartDMA features in hw catalog
Date: Thu, 29 Dec 2022 21:18:49 +0200
Message-Id: <20221229191856.3508092-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2196e205efa5..61e95fb21403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,13 +21,16 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -42,6 +45,7 @@
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.39.0

