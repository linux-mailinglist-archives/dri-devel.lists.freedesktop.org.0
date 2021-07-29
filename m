Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6763DA7A3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162A66EDC2;
	Thu, 29 Jul 2021 15:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67406EDCC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:31:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627572687; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4H3jYkElAs1QyW2ncrox+PElUWZ1CeNfk5nXkU3IPbw=;
 b=YNyllDqFGnpJScYmkHFFzcAAUHWH2Ml5kSWu3vaIr5sWmUYYs3yQqqJBao98cvkWS311lEwO
 WRfK/88IGenXthMHNlu/ABqm9Ze8P0hQWJzcR9G1fwllreK23goGcOCYM00GiKGHTM65M3Fo
 Z5F5eaneqChj8epZ/TKhezsSO8s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6102c9b7e81205dd0a943216 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 15:31:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16ECAC43217; Thu, 29 Jul 2021 15:31:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D8AD6C4338A;
 Thu, 29 Jul 2021 15:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8AD6C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH] drm/msm: Introduce Adreno Features
Date: Thu, 29 Jul 2021 21:00:40 +0530
Message-Id: <20210729205906.RFC.1.I5645753650f32d9b469d6183a5fd8e5e65a7b7a4@changeid>
X-Mailer: git-send-email 2.7.4
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a feature flag in gpulist to easily identify the capabilities
of each gpu revision. This will help to avoid a lot of adreno_is_axxx()
check when we add new features. In the current patch, HW APRIV feature
is converted to a feature flag.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
This patch is rebased on top of the below series:
https://patchwork.freedesktop.org/series/93192/

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 ------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  9 +++++++++
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1881e09..b28305b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1765,7 +1765,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct adreno_info *info;
 	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
@@ -1781,17 +1780,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = NULL;
 
-	/*
-	 * We need to know the platform type before calling into adreno_gpu_init
-	 * so that the hw_apriv flag can be correctly set. Snoop into the info
-	 * and grab the revision number
-	 */
-	info = adreno_info(config->rev);
-
-	if (info && (info->revn == 650 || info->revn == 660 ||
-			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
-		adreno_gpu->base.hw_apriv = true;
-
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7b9d605..44321ec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -276,6 +276,7 @@ static const struct adreno_info gpulist[] = {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
 		.name = "A650",
+		.features = ADRENO_APRIV,
 		.fw = {
 			[ADRENO_FW_SQE] = "a650_sqe.fw",
 			[ADRENO_FW_GMU] = "a650_gmu.bin",
@@ -289,6 +290,7 @@ static const struct adreno_info gpulist[] = {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
 		.name = "A660",
+		.features = ADRENO_APRIV,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
@@ -301,6 +303,7 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
 		.name = "Adreno 7c Gen 3",
+		.features = ADRENO_APRIV,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9f5a302..e8acadf5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
+	if (ADRENO_FEAT(adreno_gpu, ADRENO_APRIV))
+		adreno_gpu->base.hw_apriv = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 50b4d53..61797c3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -35,6 +35,11 @@ enum adreno_quirks {
 	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
 };
 
+enum adreno_features {
+	/* ADRENO has HW APRIV feature */
+	ADRENO_APRIV,
+};
+
 struct adreno_rev {
 	uint8_t  core;
 	uint8_t  major;
@@ -63,6 +68,7 @@ struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
 	const char *name;
+	u32 features;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
 	enum adreno_quirks quirks;
@@ -388,6 +394,9 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 	return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);
 }
 
+#define ADRENO_FEAT(adreno_gpu, feature) \
+	(adreno_gpu->info->features & (1 << feature))
+
 /*
  * Given a register and a count, return a value to program into
  * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

