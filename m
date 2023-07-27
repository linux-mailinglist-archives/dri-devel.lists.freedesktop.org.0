Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E15765DEA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77110E609;
	Thu, 27 Jul 2023 21:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031AE10E607;
 Thu, 27 Jul 2023 21:22:48 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68706b39c4cso503420b3a.2; 
 Thu, 27 Jul 2023 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690492968; x=1691097768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axIy3Rca2QfM0C9hEzlec+etM4W6UePiA7KJJTh2OkA=;
 b=LgIjozM1Uyg2bT4r5wPkfUE6W+GvPKS/w9BVSZJVUmPPRwq6LO6nm6l9MbgfhoMMuC
 DP2Q3ea/KkswMfOTfJ78wtL77CqYIrqxNqKZUBIi9L2HP93xarqpOl41BayQoFQJaNar
 DxUzhRiaPtcO1aCzU0XCav0VgkiY5BMNoXioNq4OTkHC8qsCXRMYQT12V4/oKVni/S6q
 0p3MDSLO3VlINWJGRHT/5XjIJ0eEu1hAYyJLCu2nbE463gdHDqFIrIACjWo1Y4mlD1/m
 KNNsOSzerLgiI6n5ubzrkzGKQiB8zJJ4TkXFy6tlGSF6y8iVlVgvTyHnIFH3THqK6W9F
 mADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492968; x=1691097768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axIy3Rca2QfM0C9hEzlec+etM4W6UePiA7KJJTh2OkA=;
 b=MWboKxYfUg3vrkzCXpMhBKU5emtZA6EUxNSiWyMFhYg308EJ/ClJVnNiEjV6aHTIow
 wSzqLTZPFz9Xw0DwysKEDVVJof5Fi3vutwxWB+wlXzKX1NVy4A0LCTjyaPPfWBfCSgSW
 ZbQrppTiz1CVWUdC9MRezxUIiGsS3sgNrYOvnFz0hiWyfRkTOOrViC5o7dSYgNREhWrZ
 kVRO7VwBCOqJhNfUTCrTziZwL9xJZdhSQ99eMO8qPTdheXqYv0at4yjtjAOVEIcVNhAN
 NmWrT0hBIHW3PLNWF9YTywWKWDjrJ216xnhmojc8CJS5xzQq88827dH8qAoM6MjUZ0mQ
 ItVQ==
X-Gm-Message-State: ABy/qLYL3ZRd+VTxSGoH91B0jdE0ZZtVvw1SotAaPh8SEF5cWCjUbtxj
 4wCxOBsxefeRzyC2IS2JqvshWysyg6g=
X-Google-Smtp-Source: APBJJlH7YiZYm/Vwmtw3rcot9NbVZnPbQjFgltrXRgf4FeAr4TtCZ+MFouwajIK8cLS4/MzDV+jOfQ==
X-Received: by 2002:a05:6a20:3d87:b0:126:a5e3:3927 with SMTP id
 s7-20020a056a203d8700b00126a5e33927mr317087pzi.8.1690492967798; 
 Thu, 27 Jul 2023 14:22:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 c29-20020a63725d000000b005348af1b84csm1973987pgn.74.2023.07.27.14.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:22:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/13] drm/msm/adreno: Remove redundant gmem size param
Date: Thu, 27 Jul 2023 14:20:07 -0700
Message-ID: <20230727212208.102501-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Even in the ocmem case, the allocated ocmem buffer size should match the
requested size.

v2: Move stray hunk to previous patch, make OCMEM size mismatch an error
    condition.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 -
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..50ee03bc94b4 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -205,7 +205,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 		A2XX_MH_INTERRUPT_MASK_MMU_PAGE_FAULT);
 
 	for (i = 3; i <= 5; i++)
-		if ((SZ_16K << i) == adreno_gpu->gmem)
+		if ((SZ_16K << i) == adreno_gpu->info->gmem)
 			break;
 	gpu_write(gpu, REG_A2XX_RB_EDRAM_INFO, i);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a99310b68793..f0803e94ebe5 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -749,7 +749,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_HI, 0x00000000);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_LO,
-		0x00100000 + adreno_gpu->gmem - 1);
+		0x00100000 + adreno_gpu->info->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
 	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b3ada1e7b598..edbade75020f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1270,7 +1270,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
 
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX,
-			0x00100000 + adreno_gpu->gmem - 1);
+			0x00100000 + adreno_gpu->info->gmem - 1);
 	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e3cd9ff6ff1d..ef98d51d237f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -320,7 +320,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = adreno_gpu->info->revn;
 		return 0;
 	case MSM_PARAM_GMEM_SIZE:
-		*value = adreno_gpu->gmem;
+		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
 		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
@@ -1041,14 +1041,16 @@ int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
 		return PTR_ERR(ocmem);
 	}
 
-	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
+	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->info->gmem);
 	if (IS_ERR(ocmem_hdl))
 		return PTR_ERR(ocmem_hdl);
 
 	adreno_ocmem->ocmem = ocmem;
 	adreno_ocmem->base = ocmem_hdl->addr;
 	adreno_ocmem->hdl = ocmem_hdl;
-	adreno_gpu->gmem = ocmem_hdl->len;
+
+	if (WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem))
+		return -ENOMEM;
 
 	return 0;
 }
@@ -1097,7 +1099,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->gmem = adreno_gpu->info->gmem;
 	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6830c3776c2d..aaf09c642dc6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,6 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
 	const struct adreno_info *info;
-	uint32_t gmem;  /* actual gmem size */
 	uint32_t revn;  /* numeric revision name */
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
-- 
2.41.0

