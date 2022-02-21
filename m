Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AF4BDA55
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E910E4D5;
	Mon, 21 Feb 2022 14:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6910E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:41:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645454523; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BdElcJhAtd0SHlk7/nwV/XC8Ozqhp8zXEd4QJlJq/JQ=;
 b=IyixfCe90Td3oSxazW3VH0K5LjpVntJjicV4EF2J6tuVrEcmXTi37GY2/7N8SLmIV8TP/2n9
 0+FUynn+ewZFnSNSuFUDqrmI8O3TYM5rifg5EG+YTKjMTMmlk9cogfQSrT7V8cbP53f8EFiv
 +t2VQsxOYqNVdp0R2IKe2GJnWJo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6213a4a33047cf1c0ab4cc3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 14:41:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8D16C4361B; Mon, 21 Feb 2022 14:41:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B76DC4360C;
 Mon, 21 Feb 2022 14:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6B76DC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/5] drm/msm/adreno: Expose speedbin to userspace
Date: Mon, 21 Feb 2022 20:11:01 +0530
Message-Id: <20220221201039.4.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
identify the sku.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f308a3f..e2728be3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1774,7 +1773,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 	u32 speedbin;
 	int ret;
 
-	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
+	ret = adreno_read_speedbin(dev, &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 158bbf7..2934c34 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -14,6 +14,7 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/nvmem-consumer.h>
 #include <soc/qcom/ocmem.h>
 #include "adreno_gpu.h"
 #include "a6xx_gpu.h"
@@ -242,10 +243,12 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
 		return 0;
 	case MSM_PARAM_CHIP_ID:
-		*value = adreno_gpu->rev.patchid |
-				(adreno_gpu->rev.minor << 8) |
-				(adreno_gpu->rev.major << 16) |
-				(adreno_gpu->rev.core << 24);
+		*value = (uint64_t) adreno_gpu->rev.patchid |
+				(uint64_t) (adreno_gpu->rev.minor << 8) |
+				(uint64_t) (adreno_gpu->rev.major << 16) |
+				(uint64_t) (adreno_gpu->rev.core << 24);
+		if (!adreno_gpu->info->revn)
+			*value |= ((uint64_t) adreno_gpu->speedbin) << 32;
 		return 0;
 	case MSM_PARAM_MAX_FREQ:
 		*value = adreno_gpu->base.fast_rate;
@@ -921,6 +924,11 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+{
+	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+}
+
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
@@ -932,6 +940,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_rev *rev = &config->rev;
 	const char *gpu_name;
 	static char name[8];
+	u32 speedbin;
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -939,6 +948,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
+	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
+		speedbin = 0xffff;
+	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
+
 	gpu_name = adreno_gpu->info->name;
 	if (!gpu_name) {
 		sprintf(name, "%d.%d.%d.%d", rev->core, rev->major, rev->minor,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cffabe7..e2a7150 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -80,6 +80,7 @@ struct adreno_gpu {
 	const struct adreno_info *info;
 	uint32_t gmem;  /* actual gmem size */
 	uint32_t revn;  /* numeric revision name */
+	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
 	/* interesting register offsets to dump: */
@@ -324,6 +325,8 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 
 void adreno_set_llc_attributes(struct iommu_domain *iommu);
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
-- 
2.7.4

