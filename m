Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA397765E0B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9710E60F;
	Thu, 27 Jul 2023 21:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC1D10E616;
 Thu, 27 Jul 2023 21:23:29 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b9cdef8619so9347975ad.0; 
 Thu, 27 Jul 2023 14:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690493009; x=1691097809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPbNEZlAId0uvVt0OCkmGhZxCx80cF5kxGPs9mgTiiQ=;
 b=H4koQbzQ/IM1czgcvUBYzfK1cdMkqnAQGhMBbiDP6336999sRyYdh4OF4IzZKykYcO
 EKI5wNnOppNg8V5PrQ/ahhtyporuIQ7TBnLST8+6j96kjQxJGYBsMaRwh/6edO7iCD9b
 AXJvZN9bOxA4viemMXPlXTSG8CDm1FCVDv89eVPadu4vFU+ZzgC7nTrcuqKS/hPW51Ta
 Vt7UXiKmmcGPb/Q5EjYLpSpP8W5Flblbp4Nzf6bivVHFUD+hG8uSSBLOUKZ5MIzJG/XZ
 gx/3klzWBARH1TfBIVI9vqkgVd4AH+pMBsGiHpIS1i1NBfYTfM8r/AsG9qsJOLfCu3rp
 yXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690493009; x=1691097809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPbNEZlAId0uvVt0OCkmGhZxCx80cF5kxGPs9mgTiiQ=;
 b=TwaBEyBMsVLCVEeWJlHKxngBfhAysCxVpucrjmSrrJPQEIFiz9ON1sU2etbWYhIBC3
 v+Uo1kyTwnw1f5m6JSxSxYJ/zLZg1Yeye3/66pd1nc1dp8POTrXuIKeUcBgQcNlP6Wew
 /m8tGmzQN7PDPtrXzJnfncdz20FWtd2TSsw43wxuiONKgPABy6jaTNq13+uS88zhEmcK
 M//jiYMjTeSA/2qiwhCED3w2C//TF2+NOCF3ZxNUX1Qj6z0qswUOqftJlQw9VbIduBxo
 qGp60pmYN37haL7fLtpFYCVymnzCFI0hgEo17CfvSXNZ8T5yb81SmcKfsoJZc8xSR/Tw
 zi7w==
X-Gm-Message-State: ABy/qLY5ZrcGdoiSx3zSeuFsd3gKEU6PFJ521VCppmIlvXwKr49I+CDm
 EEFy7wH3941cxRINosLiwWVYGfe/8NY=
X-Google-Smtp-Source: APBJJlHChNUDO6BYKXoWD4Y5g+l49f/a5Ek+/k0H9EGD+vjwAAPJR+i18FDYBNj9CGsavsHA3e+Wcw==
X-Received: by 2002:a17:902:760b:b0:1bb:86d7:4eb1 with SMTP id
 k11-20020a170902760b00b001bb86d74eb1mr454950pll.39.1690493008786; 
 Thu, 27 Jul 2023 14:23:28 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170902ceca00b001b872695c1csm2060762plg.256.2023.07.27.14.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:23:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/msm/adreno: Move adreno info to config
Date: Thu, 27 Jul 2023 14:20:16 -0700
Message-ID: <20230727212208.102501-12-robdclark@gmail.com>
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
 Guru Das Srinagesh <quic_gurus@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Let's just stash it in adreno_platform_config rather than looking it up
in N different places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 15 +++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  3 +--
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a81a6459c656..9be3260c8033 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2316,7 +2316,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct adreno_info *info;
 	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
@@ -2341,20 +2340,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
 
-	/*
-	 * We need to know the platform type before calling into adreno_gpu_init
-	 * so that the hw_apriv flag can be correctly set. Snoop into the info
-	 * and grab the revision number
-	 */
-	info = adreno_info(config->rev);
-	if (!info)
-		return ERR_PTR(-EINVAL);
-
-	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
+	adreno_gpu->base.hw_apriv =
+		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, info);
+	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7448f299b77c..332cb804a45d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -508,7 +508,7 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
 		_rev_match(rev1.patchid, rev2.patchid);
 }
 
-const struct adreno_info *adreno_info(struct adreno_rev rev)
+static const struct adreno_info *adreno_info(struct adreno_rev rev)
 {
 	int i;
 
@@ -659,13 +659,14 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	priv->gpu_pdev = to_platform_device(dev);
 
 	info = adreno_info(config.rev);
-
 	if (!info) {
 		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
 			ADRENO_CHIPID_ARGS(config.rev));
 		return -ENXIO;
 	}
 
+	config.info = info;
+
 	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a775b4d82735..865ff4c1eaf6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1079,7 +1079,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	int ret;
 
 	adreno_gpu->funcs = funcs;
-	adreno_gpu->info = adreno_info(config->rev);
+	adreno_gpu->info = config->info;
 	adreno_gpu->rev = *rev;
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c6fd6f9016d3..81a1396e124d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -130,8 +130,6 @@ struct adreno_info {
  */
 #define ADRENO_SPEEDBINS(tbl...) (struct adreno_speedbin[]) { tbl {SHRT_MAX, 0} }
 
-const struct adreno_info *adreno_info(struct adreno_rev rev);
-
 struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
@@ -185,6 +183,7 @@ struct adreno_ocmem {
 /* platform config data (ie. from DT, or pdata) */
 struct adreno_platform_config {
 	struct adreno_rev rev;
+	const struct adreno_info *info;
 };
 
 #define ADRENO_IDLE_TIMEOUT msecs_to_jiffies(1000)
-- 
2.41.0

