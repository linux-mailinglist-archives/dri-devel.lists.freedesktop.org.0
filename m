Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89321A870
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 22:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19986EB2A;
	Thu,  9 Jul 2020 20:01:54 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58F86EB29
 for <dri-devel@freedesktop.org>; Thu,  9 Jul 2020 20:01:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594324913; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bqbhhXc7jaWK+WmuMAOg+VaUT4Uprel4aRwgMdfA4Jk=;
 b=J9XRO5vAumydmR68Krc/gyFuEEoWKmfmIlQKUF69x72rp45Zp8KPPyNOoF5qypOZCGU5/oEh
 Q7rkXBECF6URX5JrqKbCfbJ00Dt00psnIXtaN50Mzuk/9gc3vjLaAm8mnLgt0VR9VdiBoPcO
 G8RCpVTOT3I7Fk1Q+L+F2DuR5g4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5f077784bca1ed3155d732f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:01:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5FACBC43391; Thu,  9 Jul 2020 20:01:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49882C43387;
 Thu,  9 Jul 2020 20:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49882C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
Date: Fri, 10 Jul 2020 01:30:24 +0530
Message-Id: <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
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

This patches replaces the previously used static DDR vote and uses
dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
GPU frequency. Also since the icc path voting is handled completely
in the opp driver, remove the icc_path handle and its usage in the
drm driver.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b547339..6fbfd7d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -123,7 +123,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
-		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+		dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 		return;
 	}
 
@@ -149,11 +149,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
@@ -840,6 +836,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
+{
+	struct dev_pm_opp *gpu_opp;
+	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		return;
+
+	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -864,7 +873,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	/* Set the bus quota to a reasonable value for boot */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
+	a6xx_gmu_set_initial_bw(gpu, gmu);
 
 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
@@ -1040,7 +1049,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
-	icc_set_bw(gpu->icc_path, 0, 0);
+	dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
 
 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
