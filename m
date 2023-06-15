Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265D732351
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEFF10E579;
	Thu, 15 Jun 2023 23:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4010E575
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso11400981e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871289; x=1689463289;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FPRMcWRdPNRhm7m7rFyZkdTr39iafUGR7Em1StRoccs=;
 b=YcfgUYjVM7UOkgkcCmENJ1htERFxfeAzizRgAdyXb8MMoN+m8qs7nT5qIUfhoms1l1
 noWA5RFKINggsK7GFdC/2KHQq/kHkA1hGfNW8Fhvm9YkRxsFHUdZNIW8W2bI/2FNpFf/
 5+2d1i5FVp9BpWUHiPmtnDPjvN/NC87P+mvwDcx88fGMjHJV+k76VnCmPLiKAvChbEWA
 3/4zET4oxImGkAmfIgfiLgg8cXTle8uoafOBIw2a1IFxJFLPBFVT6IpuI/asCpMGJvR5
 P2OJM6fhh8NdRm44jV8WaIRO/EyB7BPhNshd5YZsnJj43chwbs9OrgwzzHs41dfTtjQ9
 fqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871289; x=1689463289;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPRMcWRdPNRhm7m7rFyZkdTr39iafUGR7Em1StRoccs=;
 b=Mtv2pGVcc+4QNM1QB/fqmO+QNbVS8zwdetTpNLkMTjg6YkotuKW/Wrn0/aBtshebuR
 GF1eykZYlKP4GC28BDzO1Lz3PJEVgVNhSs41XzByzE6ZW9giGkFqRBQp89beOl5qkegX
 AQmvguba7Qc5o2WboqaQ70tJ3OjA/K3/n5Zc3s7TY9SjWlPVi6p08GqxnT6N9YRcHaap
 qMsU9v287z8gzmDncxTKTDp+4raDi+BMds/qwiDFLYwlHgSeLmqlWXrt4uqY1vL8MjNm
 guyYxUWJ1p553PCvsNWtktnt55Lns0mMIQF5OHM3Au9jmjUrR3sok0L0yCJSvQ6PvtVc
 E+TA==
X-Gm-Message-State: AC+VfDzODJgA1VK5DATvLvo01Q/n3Tu7zfhQKh0gJkJbSZlDeAY7k1mP
 iUuRvqnqfd8lXYVT5hzN2XrqNA==
X-Google-Smtp-Source: ACHHUZ51XQWATY/JYl6yXAjj285muAVX1IeWAWH01KFLBe2yZmnM2C461nEnaI9MIa1ayHfiyf87Vg==
X-Received: by 2002:a19:e01e:0:b0:4f3:ac64:84d9 with SMTP id
 x30-20020a19e01e000000b004f3ac6484d9mr98518lfg.20.1686871289278; 
 Thu, 15 Jun 2023 16:21:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:48 +0200
Subject: [PATCH v9 07/20] drm/msm/a6xx: Improve
 a6xx_bus_clear_pending_transactions()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-7-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1415;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DRGqhpFzhDNQhxx5j97tqEL/ORDaa2xLNnRcBrvxk+I=;
 b=20lGkYLKlOXNgAl41BoltFryorb2un2mRZZOBZExBSXPDrbKc/bg50HjamGPBK9owpvzNnkYT
 fCj5EZeMjQoC3pscJe3/j8131yDod+0deyTgWkdnBQyvwUsFSfbsd4S
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

Unify the indentation and explain the cryptic 0xF value.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a48f4e3a754a..d5bd008c2947 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1705,17 +1705,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-#define GBIF_CLIENT_HALT_MASK             BIT(0)
-#define GBIF_ARB_HALT_MASK                BIT(1)
+#define GBIF_CLIENT_HALT_MASK		BIT(0)
+#define GBIF_ARB_HALT_MASK		BIT(1)
+#define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	if (!a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
 		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
-								0xf) == 0xf);
+				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
 		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
 
 		return;

-- 
2.41.0

