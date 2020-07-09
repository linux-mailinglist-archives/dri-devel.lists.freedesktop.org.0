Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D221A868
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 22:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7E06EB27;
	Thu,  9 Jul 2020 20:01:46 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C56EB27
 for <dri-devel@freedesktop.org>; Thu,  9 Jul 2020 20:01:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594324905; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WKQ8aVxRdqyA6YydgtYHyA6JBUgmK/HI6AY+VY0akjo=;
 b=DOMg4Jn8jpNZV8j03JZZsdHbdLmKRI+62MSR8sHM3Cqk9d6KCBkHF3Fbsq2341RMFRCGEpjl
 0JW8wUzgMsL6M1YQ0nFAn+8ZdtYejO/tw3iJGHjov1+L7TOH53pYXD3MBIQH4hHuBCWfjVw2
 KQn4eHcbBW6UgSCsn5Z5HdLknkQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f07777b0082b27848913536 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:00:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8EDDFC43387; Thu,  9 Jul 2020 20:00:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29345C433A0;
 Thu,  9 Jul 2020 20:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29345C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/7] drm: msm: a6xx: send opp instead of a frequency
Date: Fri, 10 Jul 2020 01:30:22 +0530
Message-Id: <1594324828-9571-3-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, jonathan@marek.ca, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, sibis@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sharat Masetty <smasetty@codeaurora.org>

This patch changes the plumbing to send the devfreq recommended opp rather
than the frequency. Also consolidate and rearrange the code in a6xx to set
the GPU frequency and the icc vote in preparation for the upcoming
changes for GPU->DDR scaling votes.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 73 ++++++++++++++++-------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c         |  3 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  3 +-
 4 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 21e77d6..233afea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -103,17 +103,31 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
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
+	gmu->freq = gmu->gpu_freqs[perf_index];
 
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
 
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
-		((3 & 0xf) << 28) | index);
+			((3 & 0xf) << 28) | perf_index);
 
 	/*
 	 * Send an invalid index as a vote for the bus bandwidth and let the
@@ -136,38 +150,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
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
-	gmu->freq = gmu->gpu_freqs[perf_index];
-
-	/*
-	 * This can get called from devfreq while the hardware is idle. Don't
-	 * bring up the power if it isn't already active
-	 */
-	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
-		return;
-
-	if (gmu->legacy)
-		__a6xx_gmu_set_freq(gmu, perf_index);
-	else
-		a6xx_hfi_set_freq(gmu, perf_index);
-
-	pm_runtime_put(gmu->dev);
-}
-
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -839,6 +821,19 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
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
@@ -899,7 +894,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	/* Set the GPU to the current freq */
 	if (gmu->legacy)
-		__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
+		a6xx_gmu_set_initial_freq(gpu, gmu);
 	else
 		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
 
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
index a22d306..82eb727 100644
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
index 429cb40..0db117a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/interconnect.h>
+#include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 
 #include "msm_drv.h"
@@ -61,7 +62,7 @@ struct msm_gpu_funcs {
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
-	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 	struct msm_gem_address_space *(*create_address_space)
 		(struct msm_gpu *gpu, struct platform_device *pdev);
 };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
