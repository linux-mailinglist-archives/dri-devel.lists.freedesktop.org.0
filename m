Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3929D061
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 15:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655916E532;
	Wed, 28 Oct 2020 14:37:02 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81C6E532
 for <dri-devel@freedesktop.org>; Wed, 28 Oct 2020 14:36:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603895820; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kOcg0WYKaIRshihN1c1cKYUb+IAy+ds7gbPfrP+HBck=;
 b=cDVBGZ5H1y5JXy+8mQT9vfpzY+5M0pWAoILKC/Z43i8/ATbqLMGNgs8xfTHy0ZEo5QrvPE26
 ngLDds5pIIxf1NPiQqeOrAS7hW2KtPexbcc7LVVOKM+MvknPh5PKTlD5aJJb+x5gdBJqDWiW
 l8F0Fp3rcjE8V5Cdhqyg7OYGqjg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f9981ac2ef825cbc22a7997 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 14:35:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 67F29C43387; Wed, 28 Oct 2020 14:35:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10B6DC433C9;
 Wed, 28 Oct 2020 14:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10B6DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: Fix duplicate gpu node in icc summary
Date: Wed, 28 Oct 2020 20:05:11 +0530
Message-Id: <1603895711-23755-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
References: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_pm_opp_of_add_table() api initializes the icc nodes for gpu
indirectly. So we can avoid using of_icc_get() api in the common
probe path. To improve this, move of_icc_get() to target specific code
where it is required.

This patch helps to fix duplicate gpu node listed in the interconnect
summary from the debugfs.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
Changes in v2:
	1. Minor updates (Jordan)

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 21 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 20 ++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 +-------------------------------
 3 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index f29c77d..93da668 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -519,6 +519,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct icc_path *ocmem_icc_path;
+	struct icc_path *icc_path;
 	int ret;
 
 	if (!pdev) {
@@ -566,13 +568,28 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		goto fail;
 	}
 
+	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
+	ret = IS_ERR(icc_path);
+	if (ret)
+		goto fail;
+
+	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
+	ret = IS_ERR(ocmem_icc_path);
+	if (ret) {
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			goto fail;
+		ocmem_icc_path = NULL;
+	}
+
+
 	/*
 	 * Set the ICC path to maximum speed for now by multiplying the fastest
 	 * frequency by the bus width (8). We'll want to scale this later on to
 	 * improve battery life.
 	 */
-	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
-	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
 
 	return gpu;
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 2b93b33..c0be3a0 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -648,6 +648,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct icc_path *ocmem_icc_path;
+	struct icc_path *icc_path;
 	int ret;
 
 	if (!pdev) {
@@ -694,13 +696,27 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 		goto fail;
 	}
 
+	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
+	ret = IS_ERR(icc_path);
+	if (ret)
+		goto fail;
+
+	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
+	ret = IS_ERR(ocmem_icc_path);
+	if (ret) {
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			goto fail;
+		ocmem_icc_path = NULL;
+	}
+
 	/*
 	 * Set the ICC path to maximum speed for now by multiplying the fastest
 	 * frequency by the bus width (8). We'll want to scale this later on to
 	 * improve battery life.
 	 */
-	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
-	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
 
 	return gpu;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index fd8f491..ddbd863 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -899,7 +899,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	int ret;
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -918,37 +917,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
-	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
+	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
-	if (ret)
-		return ret;
-
-	/*
-	 * The legacy case, before "interconnect-names", only has a
-	 * single interconnect path which is equivalent to "gfx-mem"
-	 */
-	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
-		gpu->icc_path = of_icc_get(dev, NULL);
-	} else {
-		gpu->icc_path = of_icc_get(dev, "gfx-mem");
-		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	}
-
-	if (IS_ERR(gpu->icc_path)) {
-		ret = PTR_ERR(gpu->icc_path);
-		gpu->icc_path = NULL;
-		return ret;
-	}
-
-	if (IS_ERR(gpu->ocmem_icc_path)) {
-		ret = PTR_ERR(gpu->ocmem_icc_path);
-		gpu->ocmem_icc_path = NULL;
-		/* allow -ENODATA, ocmem icc is optional */
-		if (ret != -ENODATA)
-			return ret;
-	}
-
-	return 0;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
