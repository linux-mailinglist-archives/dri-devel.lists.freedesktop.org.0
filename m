Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1373D38E3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 12:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E086F445;
	Fri, 23 Jul 2021 10:38:49 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F24D6F445
 for <dri-devel@freedesktop.org>; Fri, 23 Jul 2021 10:38:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627036728; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=8OEWI6ySBoC2gfFN+pFic2zYM17gkNkjMXDyqkKeMME=;
 b=xX6x1667JyNWl88ecSW6lOxh6mBk4Q2fsFbRsQrMi4sm11+MLDZrOYPc+n0Zl5aVA6YQRuFF
 p1lJvZDuHgeVSYUkE+LGfIExJwGEFBIRwy5aSh1wG2hLduZuK3LgyRiH7G/hStCr8hTryeMu
 nXNTtdQo8QHfMCJlBktcpOntCTo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60fa9c1d1dd16c8788c60078 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 10:38:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 15A0DC4338A; Fri, 23 Jul 2021 10:38:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A212DC433D3;
 Fri, 23 Jul 2021 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A212DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu
Date: Fri, 23 Jul 2021 16:08:08 +0530
Message-Id: <1627036688-1426-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627036688-1426-1-git-send-email-akhilpo@codeaurora.org>
References: <1627036688-1426-1-git-send-email-akhilpo@codeaurora.org>
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

This patch adds support for the gpu found in the Snapdragon 7c Gen 3
compute platform. This gpu is similar to the exisiting a660 gpu with
minor delta in the programing sequence. As the Adreno GPUs are moving
away from a numeric chipid based naming scheme to a string, it was
decided to use 0x06030500 as the gpu id of this gpu to communicate
to the userspace driver.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 20 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 ++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 12 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 11 ++++++++--
 7 files changed, 90 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b349692..332301f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -933,6 +933,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
+	clk_set_rate(gmu->hub_clk, 150000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
 		pm_runtime_put(gmu->gxpd);
@@ -1094,6 +1095,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 
 int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct msm_gpu *gpu = &a6xx_gpu->base.base;
 
@@ -1117,9 +1119,22 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	 * domain. Usually the GMU does this but only if the shutdown sequence
 	 * was successful
 	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
+	if (!IS_ERR_OR_NULL(gmu->gxpd)) {
+		/*
+		 * Toggle the loop_en bit, across disabling the gx gdsc,
+		 * with a delay of 10 XO cycles before disabling gx
+		 * gdsc. This is to prevent CPR measurements from
+		 * failing.
+		 */
+		if (adreno_is_a660(adreno_gpu))
+			gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 0);
+
 		pm_runtime_put_sync(gmu->gxpd);
 
+		if (adreno_is_a660(adreno_gpu))
+			gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 1);
+	}
+
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 
 	pm_runtime_put_sync(gmu->dev);
@@ -1393,6 +1408,9 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
 	gmu->core_clk = msm_clk_bulk_get_clock(gmu->clocks,
 		gmu->nr_clocks, "gmu");
 
+	gmu->hub_clk = msm_clk_bulk_get_clock(gmu->clocks,
+		gmu->nr_clocks, "hub");
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 71dfa600..3c74f64 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -66,6 +66,7 @@ struct a6xx_gmu {
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
 	struct clk *core_clk;
+	struct clk *hub_clk;
 
 	/* current performance index set externally */
 	int current_perf_index;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 8115892..d46733f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -479,5 +479,7 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
 
+#define REG_A6XX_GPU_CPR_FSM_CTL				0x0000c001
+
 
 #endif /* A6XX_GMU_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 183b9f9..c0882536 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -694,6 +694,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		uavflagprd_inv = 2;
 	}
 
+	if (adreno_is_7c3(adreno_gpu)) {
+		lower_bit = 1;
+		amsbc = 1;
+		rgb565_predicator = 1;
+		uavflagprd_inv = 2;
+	}
+
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
@@ -950,10 +957,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
 	*/
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640(adreno_gpu))
+	if (adreno_is_a640(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
+	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
@@ -993,8 +1000,9 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a660(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
-		/* Set dualQ + disable afull for A660 GPU but not for A635 */
-		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
+		/* Set dualQ + disable afull for A660 GPU but not for 7c3 */
+		if (!adreno_is_7c3(adreno_gpu))
+			gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
 	}
 
 	/* Enable expanded apriv for targets that support it */
@@ -1780,7 +1788,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	 */
 	info = adreno_info(config->rev);
 
-	if (info && (info->revn == 650 || info->revn == 660))
+	if (info && (info->revn == 650 || info->revn == 660
+			|| info->revn == ADRENO_REV_7C3))
 		adreno_gpu->base.hw_apriv = true;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 9194337..1451c2b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -382,6 +382,36 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
+static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	/*
+	 * Send a single "off" entry just to get things running
+	 * TODO: bus scaling
+	 */
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x07;
+
+	msg->ddr_cmds_addrs[0] = 0x50004;
+	msg->ddr_cmds_addrs[1] = 0x50000;
+	msg->ddr_cmds_addrs[2] = 0x50088;
+
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
+
+	/*
+	 * These are the CX (CNOC) votes - these are used by the GMU but the
+	 * votes are known and fixed for the target
+	 */
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x01;
+
+	msg->cnoc_cmds_addrs[0] = 0x5006c;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+}
 static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
@@ -432,6 +462,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		a640_build_bw_table(&msg);
 	else if (adreno_is_a650(adreno_gpu))
 		a650_build_bw_table(&msg);
+	else if (adreno_is_7c3(adreno_gpu))
+		adreno_7c3_build_bw_table(&msg);
 	else if (adreno_is_a660(adreno_gpu))
 		a660_build_bw_table(&msg);
 	else
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6dad801..063b847 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -300,6 +300,18 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
+	}, {
+		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.revn = ADRENO_REV_7C3,
+		.name = "Adreno 7c Gen 3",
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.hwcg = a660_hwcg,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 8dbe0d1..679bc59 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -247,15 +247,22 @@ static inline int adreno_is_a650(struct adreno_gpu *gpu)
        return gpu->revn == 650;
 }
 
+#define ADRENO_REV_7C3	0x06030500
+static inline int adreno_is_7c3(struct adreno_gpu *gpu)
+{
+       return gpu->revn == ADRENO_REV_7C3;
+}
+
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 660;
+       return gpu->revn == 660 || gpu->revn == ADRENO_REV_7C3;
 }
 
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
+       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660
+	       || gpu->revn == ADRENO_REV_7C3;
 }
 
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

