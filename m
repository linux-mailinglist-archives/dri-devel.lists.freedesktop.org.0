Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D60A3D38DF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 12:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9A6FA9F;
	Fri, 23 Jul 2021 10:38:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024006FA9F
 for <dri-devel@freedesktop.org>; Fri, 23 Jul 2021 10:38:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627036716; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=v7tmRSfLGtC3m5GcBKH7ZiYevjGaMrzqFRWmNjL0x3k=;
 b=vRyiAEPmTHcdPncllnBTh5OFQ/xX1SfsfRhzh8nLcvDZWXlaDGIqpr8eIQn+hqBBxjH9RIY6
 +tL+MMZ7lwYXzmTO/1VKjy/zVh9xFL8kB2EJ14eZHuGznC01yflgOb3Oqlde8sQvgFy66zS7
 QXlJEAl8kRWA9pZ8qN7z45bjOcc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60fa9c1ab653fbdadda3e6c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 10:38:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7CF88C4338A; Fri, 23 Jul 2021 10:38:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F067C433F1;
 Fri, 23 Jul 2021 10:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F067C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/a6xx: Fix llcc configuration for a660 gpu
Date: Fri, 23 Jul 2021 16:08:07 +0530
Message-Id: <1627036688-1426-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: dianders@chromium.org, jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net, mka@chromium.org,
 dri-devel@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing scache_cntl0 register programing which is required for
a660 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 46 ++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9c5e461..183b9f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1383,13 +1383,13 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	u32 cntl1_regval = 0;
+	u32 gpu_scid, cntl1_regval = 0;
 
 	if (IS_ERR(a6xx_gpu->llc_mmio))
 		return;
 
 	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
-		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+		gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
 
 		gpu_scid &= 0x1f;
 		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
@@ -1409,26 +1409,34 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 		}
 	}
 
-	if (cntl1_regval) {
+	if (!cntl1_regval)
+		return;
+
+	/*
+	 * Program the slice IDs for the various GPU blocks and GPU MMU
+	 * pagetables
+	 */
+	if (!a6xx_gpu->have_mmu500) {
+		a6xx_llc_write(a6xx_gpu,
+			REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
+
 		/*
-		 * Program the slice IDs for the various GPU blocks and GPU MMU
-		 * pagetables
+		 * Program cacheability overrides to not allocate cache
+		 * lines on a write miss
 		 */
-		if (a6xx_gpu->have_mmu500)
-			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0),
-				cntl1_regval);
-		else {
-			a6xx_llc_write(a6xx_gpu,
-				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
-
-			/*
-			 * Program cacheability overrides to not allocate cache
-			 * lines on a write miss
-			 */
-			a6xx_llc_rmw(a6xx_gpu,
-				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
-		}
+		a6xx_llc_rmw(a6xx_gpu,
+			REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
+		return;
 	}
+
+	gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
+
+	/* On A660, the SCID programming for UCHE traffic is done in
+	 * A6XX_GBIF_SCACHE_CNTL0[14:10]
+	 */
+	if (adreno_is_a660(adreno_gpu))
+		gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
+			(1 << 8), (gpu_scid << 10) | (1 << 8));
 }
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

