Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83574199B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F70A10E399;
	Wed, 28 Jun 2023 20:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865710E39A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f957a45b10so118370e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984534; x=1690576534;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sX61xLzrSqpunz5ev7NdqhGboO2e1ygKVlT8rjAfgIw=;
 b=CKlYnjbhvmTX5qxXcW486aoyEsOIGjb6TgKAKUMd4xm9mgYeCF3Isk8/IbA364cL9z
 2eF54eO3/ge5Ua/6l3tHvGFnwZDP3BsVlihmENcF5HCI6SAbImPBQ2K/NxNNefSGydz0
 eig1dL2XxLXGcWsHZLuLJbViXuiueTsnsbbNswb1Bcfj/yKtMJ9mxkq4TiOGlE6UTaZ0
 5X3WOOm5U4U4RGE0+gYxzrlWDXpjx/tAkTHb3tgbG8jkOMHIrAZYMt6q0qGrTN+3RuMF
 9HuIL9KVnzpD05afFiOTPM+cGPl6iCScOamGlqZtVe8GaGR04E7AUGF8H9GPWe06Gq4W
 QyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984534; x=1690576534;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sX61xLzrSqpunz5ev7NdqhGboO2e1ygKVlT8rjAfgIw=;
 b=G12Fn3FB3/1ZLV2rcE+EoQPvYbidaM5Ye0gb60BZlbJKepBe9ezX5HM8Esc365jpZ7
 Tfo3elsFu+3C7+ahd2b7QtF/q5G+l67y39deGq5WOKE8GJ4wrDxHr1NEIj3E87eTD6Vn
 EIDKceqqU0o8wR7/zvEaGxG6VrxZj3807h5QBuBmv6/LH2MXZ29WZF7oznLmowaAE1Ix
 O7N9B2KB5YTLPngKBAg0usTQMSi2CbXr+fGQu++MjKx8MBoMtP4fz87PgMb7S2uXBfS/
 4fDyaU7euVNcOdmc3oOSDDTpC8ij0fHYlcequCZ/GlhU6y5I1Gh5Yz5W2WuZT6kgpkYB
 9HNQ==
X-Gm-Message-State: AC+VfDyWyJZCaXpy/kOb+favs3hMTiu28NYw6j36ybMJBGqOlKa3tVZx
 5pDwrbbaSUu4gPznLr1bU/VPgA==
X-Google-Smtp-Source: ACHHUZ4mbDR4q/0SPRJDfw23h+iHYX5F18pGLnfkI1JO4yYJUyJY/kwbBvEWvex+U59sYliIjS1DdQ==
X-Received: by 2002:a05:6512:3f1d:b0:4fa:ce08:a9d0 with SMTP id
 y29-20020a0565123f1d00b004face08a9d0mr8697767lfa.57.1687984534316; 
 Wed, 28 Jun 2023 13:35:34 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:06 +0200
Subject: [PATCH 06/14] drm/msm/a6xx: Move LLC accessors to the common
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-6-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=2053;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3i7Z22FP2QVKu6xop0YI/VspQ/V2L4DBdczgpDJONsc=;
 b=r4Q1pP42KzKhFjKsyVrb/P+HQX12W0EiaS/EiByIjNmqcHcX7aVTaUVQS+18tL0ZQKrQvVoWY
 uruPmivoCPwBWUKURF/S4An4Dnrod1wUsjYRXHU00JAzDBsnv3jqobc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move these wrappers in preparation for use in a6xx_gmu.c

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ---------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a70e36178058..c1c76fe288b2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1735,21 +1735,6 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	return IRQ_HANDLED;
 }
 
-static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
-{
-	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
-}
-
-static u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
-{
-	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
-}
-
-static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
-{
-	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
-}
-
 static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
 {
 	llcc_slice_deactivate(a6xx_gpu->llc_slice);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c788b06e72da..39d1f1f5a6d1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -62,6 +62,21 @@ static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 	return true;
 }
 
+static inline void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
+{
+	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
+}
+
+static inline u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+{
+	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
+}
+
+static inline void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
+{
+	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
+}
+
 #define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
 		((_ring)->id * sizeof(uint32_t)))
 

-- 
2.41.0

