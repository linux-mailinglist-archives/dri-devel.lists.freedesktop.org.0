Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEA198DC0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7E06E5AB;
	Tue, 31 Mar 2020 07:57:00 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81C66E5AB
 for <dri-devel@freedesktop.org>; Tue, 31 Mar 2020 07:56:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585641418; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Fi234FD+AfbWUw+RlwttLk79MCRgOUQ7otJmTUpYaOk=;
 b=pghIzJszGLF/5GWC2D42qxLZ5n3+xy4DQCF2YFu/xiGkBn8ir/5DWGhq6M4jdU/CaVt5CYII
 uAToaft2f8lzg3C04l6c4j7MVMo9T7+FWal4+u/aWdAWbxgP3ZMIk8qtK4lcTS1SnlpgHhAa
 B6JhxeLuGsxR1bGz5sQCZJVp0aA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7bd.7f65577e5b90-smtp-out-n01;
 Tue, 31 Mar 2020 07:56:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AFE5BC44798; Tue, 31 Mar 2020 07:56:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 86765C0451C;
 Tue, 31 Mar 2020 07:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86765C0451C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] drm: msm: scale DDR BW along with GPU frequency
Date: Tue, 31 Mar 2020 13:25:51 +0530
Message-Id: <1585641353-23229-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
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
Cc: saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 mka@chromium.org, sibis@codeaurora.org, viresh.kumar@linaro.org,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support to parse the OPP tables attached the GPU device,
the main opp table and the DDR bandwidth opp table. Additionally, vote
for the GPU->DDR bandwidth when setting the GPU frequency by querying
the linked DDR BW opp to the GPU opp.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 41 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 44 +++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++
 3 files changed, 84 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd37..489d9b6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -100,6 +100,40 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }

+void a6xx_gmu_set_icc_vote(struct msm_gpu *gpu, unsigned long gpu_freq)
+{
+	struct dev_pm_opp *gpu_opp, *ddr_opp;
+	struct opp_table **tables = gpu->opp_tables;
+	unsigned long peak_bw;
+
+	if (!gpu->opp_tables[GPU_DDR_OPP_TABLE_INDEX])
+		goto done;
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		goto done;
+
+	ddr_opp = dev_pm_opp_xlate_required_opp(tables[GPU_OPP_TABLE_INDEX],
+					    tables[GPU_DDR_OPP_TABLE_INDEX],
+					    gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+
+	if (IS_ERR_OR_NULL(ddr_opp))
+		goto done;
+
+	peak_bw = dev_pm_opp_get_bw(ddr_opp, NULL);
+	dev_pm_opp_put(ddr_opp);
+
+	icc_set_bw(gpu->icc_path, 0, peak_bw);
+	return;
+done:
+	/*
+	 * If there is a problem, for now leave it at max so that the
+	 * performance is nominal.
+	 */
+	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+}
+
 static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -128,11 +162,8 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)

 	gmu->freq = gmu->gpu_freqs[index];

-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	if (gpu->icc_path)
+		a6xx_gmu_set_icc_vote(gpu, gmu->freq);
 }

 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2d13694..bbbcc7a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -882,7 +882,7 @@ static int adreno_get_pwrlevels(struct device *dev,
 {
 	unsigned long freq = ULONG_MAX;
 	struct dev_pm_opp *opp;
-	int ret;
+	int ret, i;

 	gpu->fast_rate = 0;

@@ -890,9 +890,29 @@ static int adreno_get_pwrlevels(struct device *dev,
 	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
 		ret = adreno_get_legacy_pwrlevels(dev);
 	else {
-		ret = dev_pm_opp_of_add_table(dev);
-		if (ret)
-			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
+		int count = of_count_phandle_with_args(dev->of_node,
+				"operating-points-v2", NULL);
+
+		count = min(count, GPU_DDR_OPP_TABLE_INDEX + 1);
+		count = max(count, 1);
+
+		for (i = 0; i < count; i++) {
+			ret = dev_pm_opp_of_add_table_indexed(dev, i);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "Add OPP table %d: failed %d\n",
+						i, ret);
+				goto err;
+			}
+
+			gpu->opp_tables[i] =
+				dev_pm_opp_get_opp_table_indexed(dev, i);
+			if (!gpu->opp_tables[i]) {
+				DRM_DEV_ERROR(dev, "Get OPP table failed index %d\n",
+						i);
+				ret = -EINVAL;
+				goto err;
+			}
+		}
 	}

 	if (!ret) {
@@ -919,12 +939,24 @@ static int adreno_get_pwrlevels(struct device *dev,
 		gpu->icc_path = NULL;

 	return 0;
+err:
+	for (; i >= 0; i--) {
+		if (gpu->opp_tables[i]) {
+			dev_pm_opp_put_opp_table(gpu->opp_tables[i]);
+			gpu->opp_tables[i] = NULL;
+		}
+	}
+
+	dev_pm_opp_remove_table(dev);
+	return ret;
 }

 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
+	int ret = 0;
+
 	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -945,7 +977,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,

 	adreno_gpu_config.nr_rings = nr_rings;

-	adreno_get_pwrlevels(&pdev->dev, gpu);
+	ret = adreno_get_pwrlevels(&pdev->dev, gpu);
+	if (ret)
+		return ret;

 	pm_runtime_set_autosuspend_delay(&pdev->dev,
 		adreno_gpu->info->inactive_period);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..5b98b48 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -66,6 +66,12 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
 };

+/* opp table indices */
+enum {
+	GPU_OPP_TABLE_INDEX,
+	GPU_DDR_OPP_TABLE_INDEX,
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -113,6 +119,9 @@ struct msm_gpu {

 	struct icc_path *icc_path;

+	/* gpu/ddr opp tables */
+	struct opp_table *opp_tables[2];
+
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
