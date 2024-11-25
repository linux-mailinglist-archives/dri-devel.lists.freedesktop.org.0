Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C927E9D8A6C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488F210E6AD;
	Mon, 25 Nov 2024 16:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Cnuf99e9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10E010E6AD;
 Mon, 25 Nov 2024 16:33:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAThuE030525;
 Mon, 25 Nov 2024 16:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NXwZ4NQeg2R83ST+/G9mV5EeOQPsGKzHl8DwiBSaPf0=; b=Cnuf99e9dIiuKCMx
 ByPZG/MFdvpLc0f1xFzZXNZfgNCzYXgZAQtz/nVVhE+ZxqYY5nvS7KY9zWxgM9We
 FaA2fCzLZrDtk9+p6Mf5rbBMTM3+a8naxhrBOPFC2kcJCUYkRhTVP+GgXQ+O20rN
 VphgkWc7tZ+RVISW2f15sELf6AJkqG0dZIc92wDBkchrdSTgBAWSd/rNTbHgfezX
 9yQQjzbuRJOcIreTNx8oRk7CY8d1eX8xznNPflsIG8DyvxmplMfv9shFephqONJY
 XkTAscM6iiwf+HSFz/aP4NJpWb2MkkYMmNNBjpfMJCA3PwL86l7wHQ7SZYV4h0F9
 svOKRQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd5pu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 16:33:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APGXXjT012170
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 16:33:33 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 08:33:29 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Mon, 25 Nov 2024 22:03:00 +0530
Subject: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
In-Reply-To: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552405; l=3061;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=0b9nQ9EfEGB7VdwrbTXtga4eH63LhXyAMy4kiO4tCFM=;
 b=+SJGYWgq9yxKiYn3ZSxrnMbKX777dwuVlseoMW1ZaZkAjZldfdlIFzAGeJTVAkDl1JU4RKR83
 6gYmD9886rPBbAaSRxJhHcnK64UHEe3NrbOszN6vIKa789eyuabTTII
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Gdpj4VDYfPMOG0uBDiVDZ3KD8-5yWVkY
X-Proofpoint-GUID: Gdpj4VDYfPMOG0uBDiVDZ3KD8-5yWVkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=924
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250138
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

There are a few chipsets which don't have system cache a.k.a LLC.
Currently, the assumption in the driver is that the system cache
availability correlates with the presence of GMU or RPMH, which
is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
with a full blown GMU, but doesnot have a system cache. So,
introduce an Adreno Quirk flag to check support for system cache
instead of using gmu_wrapper flag.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a..5e389f6b8b8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = (SZ_128K + SZ_4K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..a8b928d0f320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
 {
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
-		return;
-
 	llcc_slice_putd(a6xx_gpu->llc_slice);
 	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
 }
@@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
-	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..398be2218110 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -57,6 +57,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_NO_SYSCACHE		BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.45.2

