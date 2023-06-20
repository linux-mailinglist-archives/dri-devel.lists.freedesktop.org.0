Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5F7377EB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 01:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93310E19C;
	Tue, 20 Jun 2023 23:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F610E19C;
 Tue, 20 Jun 2023 23:23:28 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5607a458c3fso371996eaf.1; 
 Tue, 20 Jun 2023 16:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687303407; x=1689895407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQPW4f/LsCTRG/TC/Qk0tweR9P27380Naz/b+1bcnRM=;
 b=GRA9RdPILqNbQpEUkyI93Ieiw0hVrhYITgaLXFTL31MclGSW3CxOvwQg93kW0mCvzv
 B+HDV8CezwYx5GLVF7WqFByvLbl5qcMntNJ9QyN9z1O1objkbpj4Oyf8Gn66Tz74ulKV
 3KfWAB8O83JHYh4EOlJ7GL+jGjn19vsjyWzhdxwQ/+yMGThjRy0I5EAapMNGI5RGTJfo
 qlp+6v5ylKzwtbZcSW86AyLCbJavDh/YJ4O+Zv9Qe/i08Tr4sqJKogP96umAf5uvLRrs
 yTPkIH3R/O2KXn8PHnBwZ2RzwK/eSzuoZroOZGFezPZ36+m78lDxNwySziQ1upcaOJjv
 Evgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687303407; x=1689895407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQPW4f/LsCTRG/TC/Qk0tweR9P27380Naz/b+1bcnRM=;
 b=DONfX8v2tTa7TxEsqMV9S85zSMM3FMnIiMVoAUbNq44+2tAHkCed88cbXA0NhR+FAl
 bBpbYQ6+DSd9Qvn6ilxse/BMoEzK1QXg2a/b3Z7OMRerDJqPNLP7+l6GQNrqPe86iE4T
 DhidYWGONMqdi3WUMe/NzF/Tvf+geY1qlVoLVKKOVHiN37nnYy4U7VhsxCSkjbtbNuB/
 ppJHy6sa6mvfg4Zx+7apRRR/SNauWufQevNKjhE/nQ1wJSESrI8tJz7zNEhh+BDWv/vw
 qlFN0pTen4rFG22Ge4uZgvuvvSsBWTOwbfRiY8TO6umdpJdzuxD/BRX+VMiJAUKjD26I
 tWGQ==
X-Gm-Message-State: AC+VfDyZ6P20d/1xfq7HJl0RAIX0+h4L2u3Sq7AvqlStMMlLkGNLYJIK
 2oCgARVjJpLUGAu0sQzkX40fWfCjc30=
X-Google-Smtp-Source: ACHHUZ7O7KQsBg5nTDWYWiySKDAhnR4odpATrJDFoLwhofjREtLaUKMta2cUGddBrfNVrrQF8k1fdQ==
X-Received: by 2002:a9d:7b53:0:b0:6b2:14a4:98df with SMTP id
 f19-20020a9d7b53000000b006b214a498dfmr1963241oto.3.1687303406629; 
 Tue, 20 Jun 2023 16:23:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d820:8c49:24df:1730])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a9d6d0c000000b006b396f8029csm1428266otp.20.2023.06.20.16.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 16:23:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v3] drm/msm/a2xx: Call adreno_gpu_init() earlier
Date: Tue, 20 Jun 2023 20:23:19 -0300
Message-Id: <20230620232319.991918-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dmitry.baryshkov@linaro.org, Fabio Estevam <festevam@denx.de>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonathan@marek.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The adreno_is_a20x() and adreno_is_a225() functions rely on the
GPU revision, but such information is retrieved inside adreno_gpu_init(),
which is called afterwards.

Fix this problem by caling adreno_gpu_init() earlier, so that
the GPU information revision is available when adreno_is_a20x()
and adreno_is_a225() run.

Tested on a imx53-qsb board.

Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Hi,

This error has been exposed by a recent commit in linux-next:

cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")

, but the error has been present since the very first a2xx commit.

Changes since v2:
- Call adreno_gpu_init() earlier.

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..ad4570d60abf 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -540,6 +540,10 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = perfcntrs;
 	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
 
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	if (ret)
+		goto fail;
+
 	if (adreno_is_a20x(adreno_gpu))
 		adreno_gpu->registers = a200_registers;
 	else if (adreno_is_a225(adreno_gpu))
@@ -547,10 +551,6 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->registers = a220_registers;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
-	if (ret)
-		goto fail;
-
 	if (!gpu->aspace) {
 		dev_err(dev->dev, "No memory protection without MMU\n");
 		if (!allow_vram_carveout) {
-- 
2.34.1

