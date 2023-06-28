Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EA74198D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D984B10E394;
	Wed, 28 Jun 2023 20:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1177110E399
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso84171e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984533; x=1690576533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xtpQvzp4RpyUG/PwqaST+5tYMMgpC5C6Y/5Ihh3AMLQ=;
 b=eRUCKRekrZjHJpsZkazD1CQsku0JiP3yeQQhB5BhMUaety7kgG4AFhrlgwRlP8ji1x
 XgQwJiAJXpDIkcYmuS+KUQSeskxt788EsBO1/wZY3cLqaGdcE9yS3s2Q4QWsQtbbOlkw
 rfZMnSrOe96vQqCsOmmsWuzaTAPQFWa2xCj6wSHhxjglkqhVEOpGAJzRh7+DL1imZvAN
 79/7I/UnYL9PytvoGdwQUjQB+wN7OwOWwahkR6SpKab4ldhjozV0n2NlDyz+zJwb9yB9
 BfjkhHZAISphtlDFA5MjK3kacWO2eq9TJUF3lQ2f/qlLxqjo5E/FX9I1mDM/xbYlh/n2
 o9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984533; x=1690576533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtpQvzp4RpyUG/PwqaST+5tYMMgpC5C6Y/5Ihh3AMLQ=;
 b=gbV//9I6L3WTQOUXG2fskufEN1Fg4sxJBiWyOxEKaQIN7G5kw3rOGcQJuvocpYdt2C
 3m9rgCpNclgrfkyW1MbrusmpunykUy/jEHSecFe6hVrm/znK4HeHk1q4SF210/4zw9fU
 xpQhVkB25OfulrP8C6XB3mJDvtv6FwjfKXrbGT+PixHV5oRpj+Motr5/7PlkxchEghZl
 +HlfFnoLIimjzAbq6+wCqEnU512vd3vD1LExqADnmV7htM83Oo8r2XsfFccJDwQPCWMq
 odz+AI/R1pSfCtajQP2XC+DogxH+4kjojegfheNXXp9aXlpz4tRPKudGJ2/lrp5v3b0Y
 v34w==
X-Gm-Message-State: AC+VfDz4rtDITaS4zUksKmuI9LrRLk3WIo8Go3FWstWXf9rSaoGssF8j
 Evxu5SqOGD/HOovNN6dJvQm+qQ==
X-Google-Smtp-Source: ACHHUZ4uGYGv5RouOZ7IOh/HeB4Lh6M5iGT2Ode+APGSuhS8itbLrgq/rOdeNAb5HXfybgd6tpS7Bw==
X-Received: by 2002:a05:6512:3d8b:b0:4fa:5e76:7ad4 with SMTP id
 k11-20020a0565123d8b00b004fa5e767ad4mr9970258lfv.10.1687984532977; 
 Wed, 28 Jun 2023 13:35:32 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:05 +0200
Subject: [PATCH 05/14] drm/msm/a6xx: Introduce a6xx_llc_read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-5-a7f4496e0c12@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=909;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+c+we8nCMly7yIkJ6dm5RdbFwSno59/Ex2lT1jIgyL0=;
 b=EXC4gaMs7g1fnr8cXfio+6LPLGT4COF/g31FpebXZDdZ8J1XKs2kcr74BVY+zK0BoOUiw9mvT
 P1Ilely/ODtBXuhV0Rf+KSVfXzQKUvdj0LNK/KbYosjeKMVEq2kYOHb
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

Add a helper that does exactly what it says on the can, it'll be
required for A7xx.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 488c69cf08d3..a70e36178058 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1740,6 +1740,11 @@ static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
 	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
 }
 
+static u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+{
+	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
+}
+
 static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
 {
 	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));

-- 
2.41.0

