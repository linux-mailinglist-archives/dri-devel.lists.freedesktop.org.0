Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08D70A7DC
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D9610E17E;
	Sat, 20 May 2023 12:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF1310E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso2662484e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585200; x=1687177200;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jEG7D8dDSqo05e8UhKgqNHGqbXe0pvKNUFpleUKYXVg=;
 b=I+Q3ewZykqObWHuKmqMPuJPGa3NjNoeRSIFQSrxfdGMyJ8QZus7o1u2rIwOciol6ij
 7lO60fSX2PeeqP+aSOVKvs0jToT8xNMFRS1Q233kBQGg+VCxzdBLRr6lCuDl8g4BNLZ2
 oiMIH+/WEQYkpTA5dog0TVx2LnYQCHCLprTjwZjY9gbieHYUzkui909KCXd+FlfDGSX0
 Av0XYR0qJZhBAIZjBXR9foRILwwsqAwWRHZ4BbevSgVyob/kTKLAwfwd/zfjoPWhYPf7
 6sPgR8TtZ58hq2+mit63Q8Jzu54ObT3rbMCw6XPnA9NruJSRxIAhteVSG67+B+sQ4hTS
 aGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585200; x=1687177200;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEG7D8dDSqo05e8UhKgqNHGqbXe0pvKNUFpleUKYXVg=;
 b=UVpr1F1xI8Z4Bxb0yRwJM+ZC+QyFa7SummPMbAIZJGQw1tHK6BAJ+rrfvLBx1ODhN3
 s4AVB3DvDI0UeJvVvvZXLqgeV3RhuMkwFOiDQFOC96tX85ojfbYoGeO+y01ozJa3vvGM
 EINBWNEJZEIQNPkbXatnRB5Kw2JfISDpViFiTANmCR7rmTaJcCCBnVJQQ3YU/bzyf7A8
 bIg5OJ6IP64fPJEaHbaHdV8SrF9GnSPqdqCcsaDM/7QtM7LpmmPcEy8tu44q6t0NsX3c
 +Mo94B5NR+Y3f0S9+732aYzjIQHNpWEhHuJQmbf88d0f1iPuUqcufJ+IGER/s1w7xAeM
 xWtA==
X-Gm-Message-State: AC+VfDwu6+9Wyeb34IR2UWwdQgBLAo32R9NV/jXvJPuIZmETjOveRK3o
 cd13wKYQnhiaAOHN5vJVZkf/og==
X-Google-Smtp-Source: ACHHUZ4Gs+fVbgITqcw+rliR2PEwd5WYSfQWfpcD1Pe4CNQyANny3sRLpUXp92PtuAZoJk3qkE7rvg==
X-Received: by 2002:ac2:4430:0:b0:4f3:a99c:fbbe with SMTP id
 w16-20020ac24430000000b004f3a99cfbbemr1824929lfl.14.1684585200406; 
 Sat, 20 May 2023 05:20:00 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:48 +0200
Subject: [PATCH v7 08/18] drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt
 on hw init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-8-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1283;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JTiDWY7uw1D1PMKchNdprqbjJGR71Zsm7TruEBGJMeY=;
 b=4fROckR5rLH3nc9STYL54zMi3UHMYli5trCboT4r1jFi+HW8CMYFLBcgvzFiaAFA1KSk3V9o3
 dc8cPUDGdU4DS+0RsJGbbtpgR27R2+TdgG433dly6u3cehfgmM1p2Yh
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0.

This is typically done automatically on successful GX collapse, but in
case that fails, we should take care of it.

Also, add a memory barrier to ensure it's gone through before jumping
to further initialization.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 083ccb5bcb4e..dfde5fb65eed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1003,8 +1003,12 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 

-- 
2.40.1

