Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE391D2DA2
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 12:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94516E320;
	Thu, 14 May 2020 10:55:03 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9896EB26
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 10:54:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589453702; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=i5bT/lSoj20wxLGfb854PRMP73kCw2vCVIWNO6lYNXY=;
 b=jT1kHkbN04LKnhVeq8AegK/+rbJH0iCCUysCcBrakSFceRIAulzYU4kMpPI83jQFE+WYPFhb
 c/f9/1PqH2kwFj47HUndJ/EE5Om2wdbohw3LYECD9prv15zTJeyDmxmtAMjdjboErbH9MMkP
 gU+q9gDjFxY7jOEAHveBt8NVEBA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd2376.7f6a89c62b58-smtp-out-n01;
 Thu, 14 May 2020 10:54:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C1B8C44795; Thu, 14 May 2020 10:54:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CF6EC44793;
 Thu, 14 May 2020 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CF6EC44793
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Date: Thu, 14 May 2020 16:24:17 +0530
Message-Id: <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 georgi.djakov@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch changes the plumbing to send the devfreq recommended opp rather
than the frequency. Also consolidate and rearrange the code in a6xx to set
the GPU frequency and the icc vote in preparation for the upcoming
changes for GPU->DDR scaling votes.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 62 +++++++++++++++++++----------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c         |  3 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  3 +-
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd37..2d8124b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -100,17 +100,30 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }

-static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
+void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 {
-	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	struct msm_gpu *gpu = &adreno_gpu->base;
-	int ret;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 perf_index;
+	unsigned long gpu_freq;
+	int ret = 0;
+
+	gpu_freq = dev_pm_opp_get_freq(opp);
+
+	if (gpu_freq == gmu->freq)
+		return;
+
+	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
+		if (gpu_freq == gmu->gpu_freqs[perf_index])
+			break;
+
+	gmu->current_perf_index = perf_index;

 	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);

 	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
-		((3 & 0xf) << 28) | index);
+			((3 & 0xf) << 28) | perf_index);

 	/*
 	 * Send an invalid index as a vote for the bus bandwidth and let the
@@ -126,7 +139,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);

-	gmu->freq = gmu->gpu_freqs[index];
+	gmu->freq = gmu->gpu_freqs[perf_index];

 	/*
 	 * Eventually we will want to scale the path vote with the frequency but
@@ -135,25 +148,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
 }

-void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
-{
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	u32 perf_index = 0;
-
-	if (freq == gmu->freq)
-		return;
-
-	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
-		if (freq == gmu->gpu_freqs[perf_index])
-			break;
-
-	gmu->current_perf_index = perf_index;
-
-	__a6xx_gmu_set_freq(gmu, perf_index);
-}
-
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -708,6 +702,19 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	a6xx_gmu_rpmh_off(gmu);
 }

+static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
+{
+	struct dev_pm_opp *gpu_opp;
+	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		return;
+
+	a6xx_gmu_set_freq(gpu, gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -759,8 +766,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_MASK, ~A6XX_HFI_IRQ_MASK);
 	enable_irq(gmu->hfi_irq);

-	/* Set the GPU to the current freq */
-	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
+	a6xx_gmu_set_initial_freq(gpu, gmu);

 	/*
 	 * "enable" the GX power domain which won't actually do anything but it
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7239b8b..03ba60d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -63,7 +63,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);

-void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
+void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);

 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18f3a5c..f703da0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -13,7 +13,6 @@

 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
-#include <linux/pm_opp.h>
 #include <linux/devfreq.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
@@ -34,7 +33,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);

 	if (gpu->funcs->gpu_set_freq)
-		gpu->funcs->gpu_set_freq(gpu, (u64)*freq);
+		gpu->funcs->gpu_set_freq(gpu, opp);
 	else
 		clk_set_rate(gpu->core_clk, *freq);

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..cf0dc6d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -9,6 +9,7 @@

 #include <linux/clk.h>
 #include <linux/interconnect.h>
+#include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>

 #include "msm_drv.h"
@@ -63,7 +64,7 @@ struct msm_gpu_funcs {
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
-	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 };

 struct msm_gpu {
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
