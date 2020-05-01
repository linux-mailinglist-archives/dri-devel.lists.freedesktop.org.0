Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D426E1C1E04
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 21:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F846ED3D;
	Fri,  1 May 2020 19:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4C66ED41
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 19:43:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588362226; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8MTWVNBp7jmyXYFX7PHfvSnL9tpX1AfSD1FL7Ijrg/8=;
 b=pjn+eRwQLYUMtlcbZ7cTMBv+a7UuqAA99Nmcr/Whb7Uik9OaSsvh5OpcKCl2MbHEyik8/2x/
 214CaZYw+Yz72dRZNKhRRcS0lhvPsovM3buQzW56JDLUsWwvvjZ4rldVGfIk0uktJ+QO1sB2
 IF37cfzFbB9k18fIkvfAydSi5e0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eac7be6.7f3533487298-smtp-out-n01;
 Fri, 01 May 2020 19:43:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57C7AC44788; Fri,  1 May 2020 19:43:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 639C4C433CB;
 Fri,  1 May 2020 19:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 639C4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3] drm/msm: Check for powered down HW in the devfreq callbacks
Date: Fri,  1 May 2020 13:43:26 -0600
Message-Id: <20200501194326.14593-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, stable@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 dri-devel@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Writing to the devfreq sysfs nodes while the GPU is powered down can
result in a system crash (on a5xx) or a nasty GMU error (on a6xx):

 $ /sys/class/devfreq/5000000.gpu# echo 500000000 > min_freq
  [  104.841625] platform 506a000.gmu: [drm:a6xx_gmu_set_oob]
	*ERROR* Timeout waiting for GMU OOB set GPU_DCVS: 0x0

Despite the fact that we carefully try to suspend the devfreq device when
the hardware is powered down there are lots of holes in the governors that
don't check for the suspend state and blindly call into the devfreq
callbacks that end up triggering hardware reads in the GPU driver.

Call pm_runtime_get_if_in_use() in the gpu_busy() and gpu_set_freq()
callbacks to skip the hardware access if it isn't active.

v3: Only check pm_runtime_get_if_in_use() for == 0 per Eric Anholt
v2: Use pm_runtime_get_if_in_use() per Eric Anholt

Cc: stable@vger.kernel.org
Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 724024a2243a..662d02289533 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1404,6 +1404,10 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 {
 	u64 busy_cycles, busy_time;
 
+	/* Only read the gpu busy if the hardware is already active */
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
+		return 0;
+
 	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
 			REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
 
@@ -1412,6 +1416,8 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 
 	gpu->devfreq.busy_cycles = busy_cycles;
 
+	pm_runtime_put(&gpu->pdev->dev);
+
 	if (WARN_ON(busy_time > ~0LU))
 		return ~0LU;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c4e71abbdd53..34607a98cc7c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -108,6 +108,13 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret;
 
+	/*
+	 * This can get called from devfreq while the hardware is idle. Don't
+	 * bring up the power if it isn't already active
+	 */
+	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
+		return;
+
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
 
 	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
@@ -134,6 +141,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	 * for now leave it at max so that the performance is nominal.
 	 */
 	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	pm_runtime_put(gmu->dev);
 }
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 68af24150de5..2c09d2c21773 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -810,6 +810,11 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	u64 busy_cycles, busy_time;
 
+
+	/* Only read the gpu busy if the hardware is already active */
+	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
+		return 0;
+
 	busy_cycles = gmu_read64(&a6xx_gpu->gmu,
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
@@ -819,6 +824,8 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 
 	gpu->devfreq.busy_cycles = busy_cycles;
 
+	pm_runtime_put(a6xx_gpu->gmu.dev);
+
 	if (WARN_ON(busy_time > ~0LU))
 		return ~0LU;
 
-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
