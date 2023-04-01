Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664BE6D3082
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093089B57;
	Sat,  1 Apr 2023 11:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47E10E279
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y20so32269419lfj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3t7r7bLVwjp/X6e/KXxPlx/bh+Wro5dlHvpo45E2bD8=;
 b=NzTTRlRpvSvd16aS7cfgXLXxn/VD6g15U66cUvuHNj/mkhrI31h47gpcs5JDa9zAyf
 7B0429QCo2GmJstv8PJaHIiTncclak+/Z834BaE2fn0D0MsfjH1tbnNbIwPnnHk+Ph5s
 2unRZrF+7UQMgp06TP/hx2fcP///KlSy/IVic3Y8zpU5oEmcZ5Nq5dY6v5XrjYA8565W
 5MVWAcmpT2iFanFvwQqAi12WwFKTs3S1KAVRI+yezPCRmKLwO5FGok4S6t0ZASQXDS7t
 sOViDv/3BUARwZjSGJqsj9fre4VLBzdPYrKobqcfqSGkCwLMfjti8ALB45aSsK52dv8W
 IvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3t7r7bLVwjp/X6e/KXxPlx/bh+Wro5dlHvpo45E2bD8=;
 b=4PLTiwsYelCG4Ovj35toKzhvNh62ybRCgPe1APLr2Ur928u/DZqYI+3uqmlzCpO7al
 JXSql4gvkQJoU6sPqWaGvRo5XKCEA1xRFrdKpa8xQVZUqY2ZBRgnQN4FaBzFvvATE+N3
 JeKEHq4elU70q/EBrTks7r0HaqQx9xK+db20cRyzgfTzSGdMjb5ijJglx1jsMhuJZPA0
 1JQZk9B8rmJJ6XrGKG+Y56Nw6nxgeJUCOHeuvQrwnd+PxDfVczgN86FXr67HVi/CzJcG
 07rog2NzGQMq4CTDQ5rExxaGARLz5Rqcrl3MrmGXd9j0b5iREIhEfSwKxHWGz1K0hILC
 MSag==
X-Gm-Message-State: AAQBX9e+3ppEmFaUfRR6SUX++uTzn7a44GjkQCd0Pa4Ppan7LWq/P+fp
 T/3GxL0uBy5jG8196NtZKVVR9A==
X-Google-Smtp-Source: AKy350apwp8LZNOX+NjRELJXLuyxbsgElCG+OnYocrrllHGjWJbsC8myznrgiGiOB3UJ8dFGwrMCrg==
X-Received: by 2002:ac2:5681:0:b0:4e9:7931:809f with SMTP id
 1-20020ac25681000000b004e97931809fmr8406119lfr.61.1680350119467; 
 Sat, 01 Apr 2023 04:55:19 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:48 +0200
Subject: [PATCH v6 11/15] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-11-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GlBHlCM6IP2T9JuCr/p39vVMngHALy1yw+oNEFq+abw=;
 b=1srYItYyKpbnbLOrCsUkFcPV2ifiY+QFxZcM9gGrY2W3+aX7blDqJ1grHogrgrtAf4y/EGWrwTQT
 ddWcdZWcBSuHMOOXdiCeqSwta+70o8OsTBf539wegN+BQCdaErzD
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b2c604a66007..389a1f7251fe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1202,6 +1202,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1219,7 +1221,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.0

