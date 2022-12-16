Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FDB64EFF9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 18:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BDD10E0AC;
	Fri, 16 Dec 2022 17:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEFC10E0AC;
 Fri, 16 Dec 2022 17:03:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGGgdUw018661; Fri, 16 Dec 2022 17:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ntXrIWy3g7F8DOKpf/KfcLsGQUh9U4PLzvddY3yOycw=;
 b=Wcg7CqR1HkySpS0RZSKx4TansrIx/aVeieFpalXOFwmx4cp2wzmt/UrigRXsX303vKg+
 jqPEghsu09SB93ub1DaE+1llRGjW53OHXPiOdsn4V2UPuyj5MnvDVCgywN+U+fKZ16hl
 wwLX4BoQWDRD21pUbEsjTZTVSsrsXTlvrYKXYAh79P8Fq+6beINLsJlbyA/c5bdXoXZx
 zJvkoz9xs0G10V7DVZiksyy0N3W7SrkUEZPPze0xDL7le8/OK5LgO3AkTxMgqf2o/ZgD
 Sye1oWDRkWlmrbKdB39zlydhaZPuiP3W5GAHapkSEuDIXRlQBAksNGgpMXPoPJ+yaQtQ Yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mgvecr33y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 17:03:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGH3Xv9014718
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 17:03:33 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 16 Dec 2022 09:03:28 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] drm/msm/a6xx: Avoid gx gbit halt during rpm suspend
Date: Fri, 16 Dec 2022 22:33:14 +0530
Message-ID: <20221216223253.1.Ice9c47bfeb1fddb8dc377a3491a043a3ee7fca7d@changeid>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _6cMaQZsCremYi6FIwuGooSqXmvm_tJ0
X-Proofpoint-ORIG-GUID: _6cMaQZsCremYi6FIwuGooSqXmvm_tJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160148
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
Cc: linux-kernel@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the downstream driver, gx gbif halt is required only during
recovery sequence. So lets avoid it during regular rpm suspend.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  7 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..870252bef23f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -876,7 +876,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 #define GBIF_CLIENT_HALT_MASK             BIT(0)
 #define GBIF_ARB_HALT_MASK                BIT(1)
 
-static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
+static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu,
+		bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
@@ -889,9 +890,11 @@ static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
 		return;
 	}
 
-	/* Halt the gx side of GBIF */
-	gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
-	spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+	if (gx_off) {
+		/* Halt the gx side of GBIF */
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
+		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+	}
 
 	/* Halt new client requests on GBIF */
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
@@ -929,7 +932,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu);
+	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
@@ -1083,7 +1086,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 			return;
 		}
 
-		a6xx_bus_clear_pending_transactions(adreno_gpu);
+		a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
 
 		/* tell the GMU we want to slumber */
 		ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e495d8e192db..cdce27adbd03 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1270,6 +1270,12 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	if (hang_debug)
 		a6xx_dump(gpu);
 
+	/*
+	 * To handle recovery specific sequences during the rpm suspend we are
+	 * about to trigger
+	 */
+	a6xx_gpu->hung = true;
+
 	/* Halt SQE first */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
@@ -1312,6 +1318,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->active_lock);
 
 	msm_gpu_hw_init(gpu);
+	a6xx_gpu->hung = false;
 }
 
 static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab853f61db63..eea2e60ce3b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -32,6 +32,7 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
+	bool hung;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
-- 
2.7.4

