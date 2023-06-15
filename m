Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70573236A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865B10E578;
	Thu, 15 Jun 2023 23:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD7A10E580
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f764e9295dso6261e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871305; x=1689463305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fGKcpEvkgmqH8JrPvfpYm9khdGtKckmhAQlZimMOlwM=;
 b=An+srEX/8jDgXDMne86tgg/E+Eo0hDOXuPddzJ1e18eYDduiONyapUeLscJgIPzsVu
 2j3/f1OlFDPFP3pyK1fKBprhQ6FPHncNxQT6wZLu9eRiPRIp6R5tPxnrJbJNZY3FZ0Ih
 8+vl/gjj7zakgnPtJegSJEEwcH8jXTwlyBEtpLB0U7pdGrkV2qX5QNL/S0zKLPUrznsh
 6UE+Xj0sSz+J2QH+glur4HDDxR13EAAWSB/J4+907g22kbTGLWmRc4i8UfcXJEhT2JPF
 hHwlcwa/089oR9Syah1/5vKdtIRw9uUN3Psko4UVMyVdhMzJX9dKe7A3OViHZEAZB9MR
 BsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871305; x=1689463305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGKcpEvkgmqH8JrPvfpYm9khdGtKckmhAQlZimMOlwM=;
 b=Pbilm2IocFlO/lWahrLy92ugWh9/cJi3NzEjSyFU7tPl7mFmP+0t4yhaz4kWq2ZgEJ
 gT4WDl0hDe2jtW+5rHsXP0AKmPoCDpw2NmOfThfkamfaHWYB2F5XC6nGWFUbmGWfAdVm
 wUjVwQ+qgANBfxtJ5Byrp6lr2xPUTPkTWybw29Uqg0RxLnK67Ujf/4Ja6TUATzhj2j2F
 scZToib15418FI4O8ooy+nVASNtygz/l3txM6RtqFMq8+L25OepI5iEJaRx35g4OTiMA
 OdsPNOROa4mS4UOOT2256wqiWic2czhOWLStS1ks5WuiJg3+B15NZiL+BqcRX9JJqLC8
 MHLA==
X-Gm-Message-State: AC+VfDzffwEL5xbppHZWBOikailYjsBi/3LlMeyr5gfGDbZROgiYBrxj
 UMya3S1urlHI/UbQjaO+VR86OQ==
X-Google-Smtp-Source: ACHHUZ6FCyMtk9JyV2iTtox/5DCg87uU52C6Kat5Kgn9n9SHVeLA0tXNf8uY+t5aOWUaocLYaOaAQg==
X-Received: by 2002:a05:6512:b0e:b0:4e0:a426:6ddc with SMTP id
 w14-20020a0565120b0e00b004e0a4266ddcmr137459lfu.0.1686871305658; 
 Thu, 15 Jun 2023 16:21:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:59 +0200
Subject: [PATCH v9 18/20] drm/msm/a6xx: Use adreno_is_aXYZ macros in
 speedbin matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-18-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=4358;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CAqNqmWtpAnvqWY7hFQMZF9pqR7q8thwLVZflMn/w4Q=;
 b=/7J9MKJRkhAK/FnRoKsqPJODxigozx8KvlLPv76KA0Lz2GaJzru1C5oXlC8NCiVVpfpl1z5ES
 0WNZTrqbAzWBbBNdi+pfhjhfGbwg4YOcQxbPAJj7t8LX8tzMaF8Bp+3
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

Before transitioning to using per-SoC and not per-Adreno speedbin
fuse values (need another patchset to land elsewhere), a good
improvement/stopgap solution is to use adreno_is_aXYZ macros in
place of explicit revision matching. Do so to allow differentiating
between A619 and A619_holi.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 15 ++++++++++++---
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d0ba0844079c..d7139eae0f73 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2269,23 +2269,23 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
+static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
+	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_is_7c3(adreno_gpu))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_is_a640(adreno_gpu))
 		val = a640_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_is_a650(adreno_gpu))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
@@ -2298,7 +2298,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	return (1 << val);
 }
 
-static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
+static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_gpu)
 {
 	u32 supp_hw;
 	u32 speedbin;
@@ -2317,7 +2317,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 		return ret;
 	}
 
-	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
+	supp_hw = fuse_to_supp_hw(dev, adreno_gpu, speedbin);
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
@@ -2438,7 +2438,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
+	ret = a6xx_set_supported_hw(&pdev->dev, adreno_gpu);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 3a8af5fdaea8..d8c9e8cc3753 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -279,10 +279,9 @@ static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 630);
 }
 
-static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
+static inline int adreno_is_a640(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 640) ||
-		adreno_is_revn(gpu, 680);
+	return adreno_is_revn(gpu, 640);
 }
 
 static inline int adreno_is_a650(const struct adreno_gpu *gpu)
@@ -301,6 +300,11 @@ static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 660);
 }
 
+static inline int adreno_is_a680(const struct adreno_gpu *gpu)
+{
+	return adreno_is_revn(gpu, 680);
+}
+
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 690);
@@ -328,6 +332,11 @@ static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
 		adreno_is_a660_family(gpu);
 }
 
+static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
+}
+
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);

-- 
2.41.0

