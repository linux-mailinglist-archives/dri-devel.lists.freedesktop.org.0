Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DB45AE57
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 22:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42526E069;
	Tue, 23 Nov 2021 21:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D96E069
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 21:21:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637702513; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SoFVEGV8Kukf9zVQuD0jpmBuK7b6XIEhclUvus1EKHs=;
 b=Y4rNC/yL2i6aoGv++q4xgvE4gK2QfUdNfPOt3bQELKuDxWVe3bWjiWPXYa/AV/1n4VAuSDlB
 YuVD1hswE7fb2gXPueuCKzIHSimJi+KQICIkKD78eHDmdvPVLmHFDy3TbPMAlG0z1UAkTaD2
 yj89zY8AcQc9GrRTCpgrac9jAQ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 619d5b71df12ba53c40dae64 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:21:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6330EC4360D; Tue, 23 Nov 2021 21:21:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 264C2C43619;
 Tue, 23 Nov 2021 21:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 264C2C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 5/6] drm/msm: Add a module param to force coredump
Date: Wed, 24 Nov 2021 02:47:54 +0530
Message-Id: <20211124024436.v2.5.I7e56690d7d94973520d4f4b7d9441e2b39ac2224@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a module param "force_gpu_coredump" to force coredump on relatively
harmless gpu hw errors.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 33 ++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 38 +++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
 3 files changed, 54 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750e..1861e9a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -14,6 +14,7 @@
 #include "a5xx_gpu.h"
 
 extern bool hang_debug;
+extern bool force_gpu_coredump;
 static void a5xx_dump(struct msm_gpu *gpu);
 
 #define GPU_PAS_ID 13
@@ -1237,11 +1238,6 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
 		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE, REG_A5XX_CP_IB2_BASE_HI),
 		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
-
-	/* Turn off the hangcheck timer to keep it from bothering us */
-	del_timer(&gpu->hangcheck_timer);
-
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 #define RBBM_ERROR_MASK \
@@ -1255,6 +1251,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 {
 	u32 status = gpu_read(gpu, REG_A5XX_RBBM_INT_0_STATUS);
+	bool coredump = false;
 
 	/*
 	 * Clear all the interrupts except RBBM_AHB_ERROR - if we clear it
@@ -1264,20 +1261,30 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
 
 	/* Pass status to a5xx_rbbm_err_irq because we've already cleared it */
-	if (status & RBBM_ERROR_MASK)
+	if (status & RBBM_ERROR_MASK) {
 		a5xx_rbbm_err_irq(gpu, status);
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A5XX_RBBM_INT_0_MASK_CP_HW_ERROR)
+	if (status & A5XX_RBBM_INT_0_MASK_CP_HW_ERROR) {
 		a5xx_cp_err_irq(gpu);
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A5XX_RBBM_INT_0_MASK_MISC_HANG_DETECT)
+	if (status & A5XX_RBBM_INT_0_MASK_MISC_HANG_DETECT) {
 		a5xx_fault_detect_irq(gpu);
+		coredump = true;
+	}
 
-	if (status & A5XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
+	if (status & A5XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS) {
 		a5xx_uche_err_irq(gpu);
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A5XX_RBBM_INT_0_MASK_GPMU_VOLTAGE_DROOP)
+	if (status & A5XX_RBBM_INT_0_MASK_GPMU_VOLTAGE_DROOP) {
 		a5xx_gpmu_err_irq(gpu);
+		coredump |= force_gpu_coredump;
+	}
 
 	if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
 		a5xx_preempt_trigger(gpu);
@@ -1287,6 +1294,12 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 	if (status & A5XX_RBBM_INT_0_MASK_CP_SW)
 		a5xx_preempt_irq(gpu);
 
+	if (coredump) {
+		/* Turn off the hangcheck timer to keep it from bothering us */
+		del_timer(&gpu->hangcheck_timer);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6c2edce..f96587f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -15,6 +15,8 @@
 
 #define GPU_PAS_ID 13
 
+extern bool force_gpu_coredump;
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1354,40 +1356,54 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE, REG_A6XX_CP_IB2_BASE_HI),
 		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
-
-	/* Turn off the hangcheck timer to keep it from bothering us */
-	del_timer(&gpu->hangcheck_timer);
-
-	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
+	bool coredump = false;
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
 
-	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT) {
 		a6xx_fault_detect_irq(gpu);
+		coredump = true;
+	}
 
-	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR)
+	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
 		dev_err_ratelimited(&gpu->pdev->dev, "CP | AHB bus error\n");
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
+	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR) {
 		a6xx_cp_hw_err_irq(gpu);
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW)
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW) {
 		dev_err_ratelimited(&gpu->pdev->dev, "RBBM | ATB ASYNC overflow\n");
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW)
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW) {
 		dev_err_ratelimited(&gpu->pdev->dev, "RBBM | ATB bus overflow\n");
+		coredump |= force_gpu_coredump;
+	}
 
-	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
+	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS) {
 		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
+		coredump |= force_gpu_coredump;
+	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
 		msm_gpu_retire(gpu);
 
+	if (coredump) {
+		/* Turn off the hangcheck timer to keep it from bothering us */
+		del_timer(&gpu->hangcheck_timer);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2a6ce76..a159cb9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,6 +20,10 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
+bool force_gpu_coredump = false;
+MODULE_PARM_DESC(snapshot_debugbus, "Force gpu coredump on hw errors which are usually harmless");
+module_param_named(force_gpu_coredump, force_gpu_coredump, bool, 0600);
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

