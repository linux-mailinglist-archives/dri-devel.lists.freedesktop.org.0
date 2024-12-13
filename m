Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B879F0B97
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 12:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFB010EFE2;
	Fri, 13 Dec 2024 11:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Eeot40Q5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36810E1CA;
 Fri, 13 Dec 2024 11:47:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD45wNU017909;
 Fri, 13 Dec 2024 11:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9c00TPaXGjBylzxiLMEcOn
 3RbRS5qc4bVq+xO45pylg=; b=Eeot40Q5wmo1PGnv2zbIOoBAmCssMTuEYsOLts
 cc1Ay4iLb+EIIV2PW449tFd2pCFldDBQ3b6mYXcmKigSQSklc9/bl7cflmdH3BFN
 DAch3MAr5LNnxcZuR8KmCYzK9bCv/+wMtJk/ZcMo0FecfhKWQOxmgU/40nLSWiD8
 E4AiY2pJg097o2d3FXQ6hjYykGRJ1eZCpXVwZsNh1Vg/qGwyTo14W04bcJMXcdPu
 t37z1P0a6sMtibbz3aSd6AaVX4oEStL1bINqO5y5Xf9ZSb3cUB0af/Zwmq0Mk/pq
 6JToUlZHzCwj1FbnvT7Ow7a1OQUv3ZJ/yRF/A9/udpEl5Otg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn15x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 11:47:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBl4WK005852
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 11:47:04 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:46:59 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 17:16:42 +0530
Subject: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKEeXGcC/22OS47DIBBEr2Kxnh51g0M+q7nHKAsbmoQFtgPYS
 hT57sFkMyNl+UqqV/UUiaPnJE7NU0RefPLjUEB9NcJcu+HC4G1hIVG2hIqg0yThMs2Q5mkaYwa
 rlUJHe4vkRKlNkZ2/V+Xv+c2Rb3Mx53co+i4xmDEEn0+NjQFCCjDwPcO2AkSArdiqV5/yGB/13
 EK1W38QfvixEBD01vHBaXtUqH/KqPGD+S5TVbfIPwq5+6CQgNDvjVEH1khH+q9Y1/UFAFwqHTA
 BAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734090419; l=8706;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=OTRC5Fyb0neX+liac7A7duCulOjj1fW/TglbaZF/dy4=;
 b=K3xaEKGV1zR9O0xrfWcJMAgeJpbuULJ6PrzjndBtRp64dt4u53zv6qz+0NqqS1wfM1vbIj2t8
 99HOQjGUoWsBWHej+KX7KiVox7+HyYRvgG97wHT5OPPoSBYDuJBgGc5
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KY7nX912bdl5xQpOpS22KBbSodRrs8aQ
X-Proofpoint-ORIG-GUID: KY7nX912bdl5xQpOpS22KBbSodRrs8aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130082
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jie Zhang <quic_jiezh@quicinc.com>

Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
of A615 GPU.

A612 has a new IP called Reduced Graphics Management Unit or RGMU
which is a small state machine which helps to toggle GX GDSC
(connected to CX rail) to implement IFPC feature. It doesn't support
any other features of a full fledged GMU like clock control, resource
voting to rpmh etc. So we need linux clock driver support like other
gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
Since there is no benefit with enabling RGMU at the moment, RGMU is
entirely skipped in this patch.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Mesa support is already available for A612. Verified Glmark2 with
weston.

Some dependencies for the devicetree change are not yet available
in the mailing lists. I will send it out as a separate patch later.
---
Changes in v3:
- Drop the NO_SYSCACHE quirk patch (Konrad/Rob)
- Use the new "qcom,adreno-rgmu" compatible string (Konrad)
- Link to v2: https://lore.kernel.org/r/20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com

Changes in v2:
- Added a new quirk to check LLC support (new patch). This helps to
correct LLC handling in A612's patch.
- Rebased on msm-next tip
- Captured R-b from Konrad
- Link to v1: https://lore.kernel.org/r/20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 15 ++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 47 ++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 11 ++++++--
 3 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a..234083b69844 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -704,6 +704,21 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010200),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000022,
+			.prim_fifo_threshold = 0x00080000,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
 		.family = ADRENO_6XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..630932693951 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -504,15 +504,26 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
 	else if (adreno_is_a702(adreno_gpu))
 		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
-	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+	if (adreno_is_a612(adreno_gpu))
+		cgc_delay = 0x11;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x111;
+	else
+		cgc_delay = 0x10111;
+
+	if (adreno_is_a612(adreno_gpu))
+		cgc_hyst = 0x55;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x555;
+	else
+		cgc_delay = 0x5555;
 
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
@@ -600,6 +611,9 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
+	if (adreno_is_a612(gpu))
+		gpu->ubwc_config.highest_bank_bit = 13;
+
 	if (adreno_is_a618(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
 
@@ -1165,7 +1179,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	if (adreno_is_a610(adreno_gpu)) {
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
 	} else if (adreno_is_a702(adreno_gpu)) {
@@ -1199,7 +1213,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Enable fault detection */
 	if (adreno_is_a730(adreno_gpu) ||
-	    adreno_is_a740_family(adreno_gpu))
+	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
 	else if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
@@ -1863,8 +1877,8 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
 {
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	/* A612 is actually not a gmu-wrapper and has LLCC */
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
 		return;
 
 	llcc_slice_putd(a6xx_gpu->llc_slice);
@@ -1876,8 +1890,8 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	/* A612 is actually not a gmu-wrapper and has LLCC */
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
 		return;
 
 	/*
@@ -2081,6 +2095,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (!ret)
 		msm_devfreq_resume(gpu);
 
+	if (adreno_is_a612(&a6xx_gpu->base))
+		a6xx_llc_activate(a6xx_gpu);
+
 	return ret;
 }
 
@@ -2120,6 +2137,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	if (adreno_is_a612(&a6xx_gpu->base))
+		a6xx_llc_deactivate(a6xx_gpu);
+
 	msm_devfreq_suspend(gpu);
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
@@ -2475,7 +2495,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
-	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
+	/* We do not support RGMU at the moment, so assume it is a gmu wrapper for now */
+	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper") ||
+		of_device_is_compatible(node, "qcom,adreno-rgmu");
 
 	adreno_gpu->base.hw_apriv =
 		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
@@ -2485,11 +2507,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		  config->info->family == ADRENO_7XX_GEN2 ||
 		  config->info->family == ADRENO_7XX_GEN3;
 
-	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
-
 	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
 	if (ret) {
-		a6xx_llc_slices_destroy(a6xx_gpu);
 		kfree(a6xx_gpu);
 		return ERR_PTR(ret);
 	}
@@ -2508,6 +2527,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
+
 	/*
 	 * For now only clamp to idle freq for devices where this is known not
 	 * to cause power supply issues:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..61b9141a63ab 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -420,6 +420,11 @@ static inline int adreno_is_a610(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 610);
 }
 
+static inline int adreno_is_a612(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06010200;
+}
+
 static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
@@ -489,9 +494,9 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-
-	/* TODO: A612 */
-	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+	return adreno_is_a610(gpu) ||
+	       adreno_is_a612(gpu) ||
+	       adreno_is_a702(gpu);
 }
 
 /* TODO: 615/616 */

---
base-commit: f4a867a46862c1743501bbe8c813238456ec8699
change-id: 20241031-a612-gpu-support-d6330f17d01f

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

