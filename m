Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C965AFD0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015710E30A;
	Mon,  2 Jan 2023 10:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8710E309;
 Mon,  2 Jan 2023 10:49:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302AG7PT028684; Mon, 2 Jan 2023 10:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=vP4cwRcWki3cMWzaww8+zSXXB5DIbu/Yv3Swnz6JckQ=;
 b=icnaEWB+Eldb29GhObMhfkpRDc/saV9xSGYAOzOXr4PnChCf7/ARncsIrUMcNBGrmY9z
 BVQt8oDLGPcZ5m+MceDKFjg+u068DvwvD26O8l6B0WjtZluh66iQvIi7eO8+sGFJFlFj
 o7r500e04f7I94Z71/gsepHeR060tR7SDrswSrloJUCkxx1MlTSe0UrUL/Cqz1jlIYgW
 LS2C5JFE/fxrMTb9oBfuTI3wJiujrE8gOV32Nb6vLTXICqlcsLXg+An0mP3MnNulb9CI
 jBYt4GBGSWWNu8srcIr2F5qjQPHpyYuTkDGztF0eAkn4dbyFnZmTwv7W2YYbFeSxKo++ Jg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtd61avtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 10:49:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 302AnIBl007505
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Jan 2023 10:49:18 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 2 Jan 2023 02:49:12 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 5/5] drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc
 collapse
Date: Mon, 2 Jan 2023 16:18:31 +0530
Message-ID: <20230102161757.v5.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FnKxYPAyC9cKh-vTeEIjMl9zcOCYDZ3c
X-Proofpoint-ORIG-GUID: FnKxYPAyC9cKh-vTeEIjMl9zcOCYDZ3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_06,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020098
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

As per the recommended recovery sequence of adreno gpu, cx gdsc should
collapse at hardware before it is turned back ON. This helps to clear
out the stale states in hardware before it is reinitialized. Use the
genpd notifier along with the newly introduced
dev_pm_genpd_synced_poweroff() api to ensure that cx gdsc has collapsed
before we turn it back ON.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---

(no changes since v2)

Changes in v2:
- Select PM_GENERIC_DOMAINS from Kconfig

 drivers/gpu/drm/msm/Kconfig           |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3c9dfdb0b328..74f5916f5ca5 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -28,6 +28,7 @@ config DRM_MSM
 	select SYNC_FILE
 	select PM_OPP
 	select NVMEM
+	select PM_GENERIC_DOMAINS
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1580d0090f35..c03830957c26 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1507,6 +1507,17 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
 }
 
+static int cxpd_notifier_cb(struct notifier_block *nb,
+			unsigned long action, void *data)
+{
+	struct a6xx_gmu *gmu = container_of(nb, struct a6xx_gmu, pd_nb);
+
+	if (action == GENPD_NOTIFY_OFF)
+		complete_all(&gmu->pd_gate);
+
+	return 0;
+}
+
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1640,6 +1651,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto detach_cxpd;
 	}
 
+	init_completion(&gmu->pd_gate);
+	complete_all(&gmu->pd_gate);
+	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
+
 	/*
 	 * Get a link to the GX power domain to reset the GPU in case of GMU
 	 * crash
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 5a42dd4dd31f..0bc3eb443fec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -4,8 +4,10 @@
 #ifndef _A6XX_GMU_H_
 #define _A6XX_GMU_H_
 
+#include <linux/completion.h>
 #include <linux/iopoll.h>
 #include <linux/interrupt.h>
+#include <linux/notifier.h>
 #include "msm_drv.h"
 #include "a6xx_hfi.h"
 
@@ -90,6 +92,10 @@ struct a6xx_gmu {
 	bool initialized;
 	bool hung;
 	bool legacy; /* a618 or a630 */
+
+	/* For power domain callback */
+	struct notifier_block pd_nb;
+	struct completion pd_gate;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4b16e75dfa50..dd618b099110 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1258,6 +1259,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int i, active_submits;
 
 	adreno_dump_info(gpu);
@@ -1290,6 +1292,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gpu->active_submits = 0;
 
+	reinit_completion(&gmu->pd_gate);
+	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
+	dev_pm_genpd_synced_poweroff(gmu->cxpd);
+
 	/* Drop the rpm refcount from active submits */
 	if (active_submits)
 		pm_runtime_put(&gpu->pdev->dev);
@@ -1297,6 +1303,11 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* And the final one from recover worker */
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
+		DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
+
+	dev_pm_genpd_remove_notifier(gmu->cxpd);
+
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
-- 
2.7.4

