Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62A9139C5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 13:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0A10E0B4;
	Sun, 23 Jun 2024 11:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YK1s+NYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2DC10E0B4;
 Sun, 23 Jun 2024 11:08:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NAkVm0006797;
 Sun, 23 Jun 2024 11:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 utwM85t19qCF0W2e9Tp7ba1WSNe0ZIIlB4SwNDtMFJI=; b=YK1s+NYkWEPZLg9h
 OpmYLnJFWyBjza9/u4UrLHPe+o5Rw2x01DqQfGc5NzKszaEPbBrHseiz5w+8Qi7c
 JI6LwVk/PlrwXm7gL97wUBE2XN6FiKrmesya76ViXEoVKjdVTwl4x3qiVWmThPWb
 GPhqEgztBmiguRCLMT6GBW6PIBNlm8FiWk1VY4kmKgGGTCk6iREyqApBNVGF8Czt
 LN+409JrPNp73hnRMoQvvaPEuWhktU76zsIgUDzGC5E0DFLWvF9FuwxHFkJv5+qi
 aHpBKPL/j5A8Mh92qJhxbT8khN4JyaC/LAHoAExYN0BkP+GlWb0kFSH43Ks61p8Z
 VJ9U1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu11mh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 11:08:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45NB8lnA004579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 11:08:47 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 04:08:43 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
Date: Sun, 23 Jun 2024 16:36:29 +0530
Message-ID: <20240623110753.141400-3-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: v_hQ6YAoL2UkTICleV_hBZB5TfoR4EkI
X-Proofpoint-ORIG-GUID: v_hQ6YAoL2UkTICleV_hBZB5TfoR4EkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=949 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230088
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

Add support in drm/msm driver for the Adreno X185 gpu found in
Snapdragon X1 Elite chipset.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..168a4bddfaf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	 */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
 
+	if (adreno_is_x185(adreno_gpu)) {
+		chipid = 0x7050001;
 	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
-	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
+	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
 		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
 		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
 
@@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
-	if (IS_ERR(sec))
-		return PTR_ERR(sec);
+	/*
+	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
+	 * to regular mx rail if it is missing
+	 */
+	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
+	if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(sec)) {
+		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+		if (IS_ERR(sec))
+			return PTR_ERR(sec);
+	}
 
 	sec_count >>= 1;
 	if (!sec_count)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..97837f7f2a40 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
 		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
-	} else if (adreno_is_a730(adreno_gpu) ||
-		   adreno_is_a740(adreno_gpu) ||
-		   adreno_is_a750(adreno_gpu)) {
+	} else if (adreno_is_a7xx(adreno_gpu)) {
 		regs = a730_protect;
 		count = ARRAY_SIZE(a730_protect);
 		count_max = 48;
@@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
 	/* Set weights for bicubic filtering */
-	if (adreno_is_a650_family(adreno_gpu)) {
+	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
 		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
 			0x3fe05ff4);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..139c7d828749 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen70500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen70500_gmu.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.hwcg = a740_hwcg,
+		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..d9ea8e0f6ad5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43051401;
 }
 
+static inline int adreno_is_x185(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43050c01;
+}
+
 static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
-- 
2.45.1

