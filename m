Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241D2D0E34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F45E6E573;
	Mon,  7 Dec 2020 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5E6E573
 for <dri-devel@freedesktop.org>; Mon,  7 Dec 2020 10:42:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607337756; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BGNdc2vD2EMhLU2qHKPdKYLk6stKVPG2SBXK5CBPJB4=;
 b=Qzn2W4H0dMyiKprKl/nDz+vm12qUuABJbh6gEE50u3fPh0eLV6ZD0vVIkMDuiszcv6xtMAY9
 GcChxjxVK9Z2zhJEBNIPtQprDdBC309YO6tSGLqojlI8pIhSDtN++QdCeWiFBBcKHyL2o7Yh
 DMKowA0rj1v1dN58IDRJuf0/AT0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fce070aae7b105766e3384b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 10:42:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A6411C43461; Mon,  7 Dec 2020 10:42:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D6F4C433CA;
 Mon,  7 Dec 2020 10:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D6F4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] drm/msm: Add speed-bin support to a618 gpu
Date: Mon,  7 Dec 2020 16:12:07 +0530
Message-Id: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, mka@chromium.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs support different max frequencies depending on the platform.
To identify the correct variant, we should check the gpu speedbin
fuse value. Add support for this speedbin detection to a6xx family
along with the required fuse details for a618 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
Changes from v2:
	1. Made the changes a6xx specific to save space.
Changes from v1:
	1. Added the changes to support a618 sku to the series.
	2. Avoid failing probe in case of an unsupported sku. (Rob)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 74 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1306618..6304578 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,10 +10,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
 
+const u32 a618_speedbins[] = {0, 169, 174};
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1208,6 +1211,10 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	if (a6xx_gpu->opp_table)
+		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
+
 	kfree(a6xx_gpu);
 }
 
@@ -1264,6 +1271,67 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
+static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
+{
+	int i;
+
+	if (revn == 618) {
+		for (i = 0; i < ARRAY_SIZE(a618_speedbins); i++) {
+			if (fuse == a618_speedbins[i])
+				return  (1 << i);
+		}
+	}
+
+	DRM_DEV_ERROR(dev,
+			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
+			fuse);
+	return ~0U;
+}
+
+static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
+		u32 revn)
+{
+
+	struct opp_table *opp_table;
+	struct nvmem_cell *cell;
+	u32 supp_hw = ~0U;
+	void *buf;
+
+	cell = nvmem_cell_get(dev, "speed_bin");
+	/*
+	 * -ENOENT means that the platform doesn't support speedbin which is
+	 * fine
+	 */
+	if (PTR_ERR(cell) == -ENOENT)
+		return 0;
+	else if (IS_ERR(cell)) {
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	buf = nvmem_cell_read(cell, NULL);
+	if (IS_ERR(buf)) {
+		nvmem_cell_put(cell);
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
+
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+done:
+	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	a6xx_gpu->opp_table = opp_table;
+	return 0;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1325,6 +1393,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
+	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
+	if (ret) {
+		a6xx_destroy(&(a6xx_gpu->base.base));
+		return ERR_PTR(ret);
+	}
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e793d32..ce0610c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -33,6 +33,8 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
+
+	struct opp_table *opp_table;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
