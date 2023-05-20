Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7970270A7D1
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B9C10E172;
	Sat, 20 May 2023 12:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9010E16B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:19:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so90841e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585194; x=1687177194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ox41uPAx3lnO302Ry1Df1WPA2I0vwUL6Eka5WZ9+II8=;
 b=xKTRQBLB985A6UkLMgvo8jKOc9UdGHdcnKvX15iYNo7ttv3waH2OlSlMOZzkLZbu3Q
 TXLrx7r00a/yTBAhGIBMyOrhLPsxdPmX7KNQUxjICXVLZGrajlaNsOUKw6XJjiwyzIoK
 zCjjTuu4HwXx88SwxVa5Njz4hT0FtsGoLxVmmwOdXJrai/Ft7W4sIFhz8HDy5vvxCX+z
 Vu46x6aXDHFgVQqk2a+8ZY0sKS2PEAAg/wqHA2nrNNwtMBzmZIticfnrv7KT7PqxJdmf
 8rwcMYa6EAfaBZ7tAjj66PhIJm0IpblvGQ8igdo01JPx1r+RbWVCJPJNKK2moniVbWAo
 vuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585194; x=1687177194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ox41uPAx3lnO302Ry1Df1WPA2I0vwUL6Eka5WZ9+II8=;
 b=dyaLAHXsNAPKUS7FTuvT18NtQKCClhfGsrVlBEr8mWJWvOkkGCkGWp2CYKoD/wmbSt
 YNQAzMr/fqdqSKRZTB4O9EjFlrGC3sY0XfVnnC5ckZ2lVyxgxTjAys9xvjOod4eh9tJ+
 us8juclvy28d+hkAAbqhJ18LRrWGtePXSlGJT5z6c13ixHjNPdojusHV7f/GNZU8475x
 HlMX+f6E7RLf4+vR1tlb1PWk1NKjj1r27WeHhjOz6B0Dj25Zcrc5clsA1GiRpqAH0WME
 gn0EihvNiStPHC32Ib4/MVzuobWnxIu9y9y7ryRK4/5mW0Y13RIPkGq2VBB1bjCKwOvN
 +E8g==
X-Gm-Message-State: AC+VfDykyOC9+0ajx2pJmvhkIX4Nsuh5DQjiE3vht5paPSCspVTFexFL
 iI9T/7OngZ57GRjim387JWtFoQ==
X-Google-Smtp-Source: ACHHUZ60Twq/k2jMIe1Odkal4KVvmTEFSyMWP2IiaRaSK03G+HdMsH2qQXqPDaCcKVj2l6zK4dxj8A==
X-Received: by 2002:ac2:41c3:0:b0:4ec:8787:d52b with SMTP id
 d3-20020ac241c3000000b004ec8787d52bmr1439371lfi.62.1684585194210; 
 Sat, 20 May 2023 05:19:54 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:19:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:44 +0200
Subject: [PATCH v7 04/18] drm/msm/a6xx: Move force keepalive vote removal
 to a6xx_gmu_force_off()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-4-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=2072;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WdDcDOyizy5IWwyMqltY5oqm/fsHIExj5zaeUB68hS4=;
 b=t5sGv9uZd2Pf7RJr+oj6zg/+W95na+EuVH9WADTPsy77xN6o4luha3OPHTWgo5tqywg26TbeM
 MMfIbD+ZI1aDAWa0ivtcPlLyHGB1ZErDOBQjDXy+cfaCe2tfNOKekLK
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

As pointed out by Akhil during the review process of GMU wrapper
introduction [1], it makes sense to move this write into the function
that's responsible for forcibly shutting the GMU off.

It is also very convenient to move this to GMU-specific code, so that
it does not have to be guarded by an if-condition to avoid calling it
on GMU wrapper targets.

Move the write to the aforementioned a6xx_gmu_force_off() to achieve
that. No effective functional change.

[1] https://lore.kernel.org/linux-arm-msm/20230501194022.GA18382@akhilpo-linux.qualcomm.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 87babbb2a19f..9421716a2fe5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -912,6 +912,12 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
+	/*
+	 * Turn off keep alive that might have been enabled by the hang
+	 * interrupt
+	 */
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+
 	/* Flush all the queues */
 	a6xx_hfi_stop(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9fb214f150dd..e34aa15156a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1274,12 +1274,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* Halt SQE first */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-	/*
-	 * Turn off keep alive that might have been enabled by the hang
-	 * interrupt
-	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
-
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
 	/* active_submit won't change until we make a submission */

-- 
2.40.1

