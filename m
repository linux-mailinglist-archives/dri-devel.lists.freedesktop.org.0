Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE325CF43
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 04:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC06EA66;
	Fri,  4 Sep 2020 02:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4336EA67
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 02:03:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599185015; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LstDX6xiLYnZhD0hGqb5VJ5fAqydLKT4PHp42tcf7eg=;
 b=KrH3idUCWR4rbb1KDZoOWlKw8ZfFfBgbB61B3v5MIMEAXlf9bQuUt9vhFTQ5bT/wg9bRjCZc
 uuCot2d1o1ftRrw2Fx4p7pXKB33AiEwk37Vb23dSF/eo627I9s7WUWVseNPs+BtCBSrSep68
 K5p5ey6zfCMITfC9/Wr0EP0B1ds=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f51a0779f3347551fcf581e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Sep 2020 02:03:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7D5E5C433AF; Fri,  4 Sep 2020 02:03:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A077EC43387;
 Fri,  4 Sep 2020 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A077EC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/4] drm/msm: Disable the RPTR shadow
Date: Thu,  3 Sep 2020 20:03:13 -0600
Message-Id: <20200904020313.1810988-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904020313.1810988-1-jcrouse@codeaurora.org>
References: <20200904020313.1810988-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable the RPTR shadow across all targets. It will be selectively
re-enabled later for targets that need it.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  7 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 27 ++-----------------------
 6 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 6021f8d9efd1..48fa49f69d6d 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -164,6 +164,11 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	gpu_write(gpu, REG_AXXX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	gpu_write(gpu, REG_AXXX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* NOTE: PM4/micro-engine firmware registers look to be the same
 	 * for a2xx and a3xx.. we could possibly push that part down to
 	 * adreno_gpu base class.  Or push both PM4 and PFP but
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 0a5ea9f56cb8..f6471145a7a6 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -211,6 +211,16 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/*
+	 * Use the default ringbuffer size and block size but disable the RPTR
+	 * shadow
+	 */
+	gpu_write(gpu, REG_AXXX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	/* Set the ringbuffer address */
+	gpu_write(gpu, REG_AXXX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* setup access protection: */
 	gpu_write(gpu, REG_A3XX_CP_PROTECT_CTRL, 0x00000007);
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index b9b26b2bf9c5..954753600625 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -267,6 +267,16 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/*
+	 * Use the default ringbuffer size and block size but disable the RPTR
+	 * shadow
+	 */
+	gpu_write(gpu, REG_A4XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	/* Set the ringbuffer address */
+	gpu_write(gpu, REG_A4XX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* Load PM4: */
 	ptr = (uint32_t *)(adreno_gpu->fw[ADRENO_FW_PM4]->data);
 	len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e718f964d590..ce3c0b5c167b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -703,8 +703,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	a5xx_preempt_hw_init(gpu);
-
 	if (!adreno_is_a510(adreno_gpu))
 		a5xx_gpmu_ucode_init(gpu);
 
@@ -712,6 +710,15 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/* Set the ringbuffer address */
+	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
+		gpu->rb[0]->iova);
+
+	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	a5xx_preempt_hw_init(gpu);
+
 	/* Disable the interrupts through the initial bringup stage */
 	gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK, A5XX_INT_MASK);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 406efaac95a7..74bc27eb4203 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -695,6 +695,13 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
+	/* Set the ringbuffer address */
+	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
+		gpu->rb[0]->iova);
+
+	gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d2dbb6968cba..459f10a3710b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -400,26 +400,6 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ring->memptrs->rptr = 0;
 	}
 
-	/*
-	 * Setup REG_CP_RB_CNTL.  The same value is used across targets (with
-	 * the excpetion of A430 that disables the RPTR shadow) - the cacluation
-	 * for the ringbuffer size and block size is moved to msm_gpu.h for the
-	 * pre-processor to deal with and the A430 variant is ORed in here
-	 */
-	adreno_gpu_write(adreno_gpu, REG_ADRENO_CP_RB_CNTL,
-		MSM_GPU_RB_CNTL_DEFAULT |
-		(adreno_is_a430(adreno_gpu) ? AXXX_CP_RB_CNTL_NO_UPDATE : 0));
-
-	/* Setup ringbuffer address - use ringbuffer[0] for GPU init */
-	adreno_gpu_write64(adreno_gpu, REG_ADRENO_CP_RB_BASE,
-		REG_ADRENO_CP_RB_BASE_HI, gpu->rb[0]->iova);
-
-	if (!adreno_is_a430(adreno_gpu)) {
-		adreno_gpu_write64(adreno_gpu, REG_ADRENO_CP_RB_RPTR_ADDR,
-			REG_ADRENO_CP_RB_RPTR_ADDR_HI,
-			rbmemptr(gpu->rb[0], rptr));
-	}
-
 	return 0;
 }
 
@@ -427,11 +407,8 @@ int adreno_hw_init(struct msm_gpu *gpu)
 static uint32_t get_rptr(struct adreno_gpu *adreno_gpu,
 		struct msm_ringbuffer *ring)
 {
-	if (adreno_is_a430(adreno_gpu))
-		return ring->memptrs->rptr = adreno_gpu_read(
-			adreno_gpu, REG_ADRENO_CP_RB_RPTR);
-	else
-		return ring->memptrs->rptr;
+	return ring->memptrs->rptr = adreno_gpu_read(
+		adreno_gpu, REG_ADRENO_CP_RB_RPTR);
 }
 
 struct msm_ringbuffer *adreno_active_ring(struct msm_gpu *gpu)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
