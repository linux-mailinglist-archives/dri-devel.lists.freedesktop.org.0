Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B450F6534D1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DD110E46F;
	Wed, 21 Dec 2022 17:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5FF10E471;
 Wed, 21 Dec 2022 17:14:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLGVCMK029628; Wed, 21 Dec 2022 17:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=JOi45431cZzzS6s+RmRyMUekC+2CBKs4MDjZPHDKvzc=;
 b=TwOwvpQ0F89/bUq3YNSwEzxReDlwgTCNkHAokWOVC5cedAXP8/UDLYPNcyWAIyqjuZHb
 OylYyJdM/RuTwHC9lAeEBpZa4oZWNYIm10Ft0lWb8+baxSNqNj6GIslgBq2hfgrrBFX7
 yKBK0EfGkGChysSiay8d1Xm0pJBoFmpN/5IA/aULqsdFrbdz3G5M3v1khPYEbPgEECRL
 ROJUfdAERuJTdoBvL/zQcPlCQfYCt6BbLYmOHii1ga4ezqhtBoKu09d2bq86QQt7g3kh
 yFWY/6v5/emN9+nzZluFZ5RUFDam4Dzl0gZDTzpUdh44IQ08x8280EKQXK7xgM39qOo0 JQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm5r2g2xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHEkgK022915
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:46 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:41 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 4/5] drm/msm/a6xx: Remove cx gdsc polling using 'reset'
Date: Wed, 21 Dec 2022 22:44:02 +0530
Message-ID: <20221221224338.v4.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lSfkGd-okmyiW7_Ov6zsMv9Ss0j3X1g0
X-Proofpoint-ORIG-GUID: lSfkGd-okmyiW7_Ov6zsMv9Ss0j3X1g0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_09,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210144
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused 'reset' interface which was supposed to help to ensure
that cx gdsc has collapsed during gpu recovery. This is was not enabled
so far due to missing gpucc driver support. Similar functionality using
genpd framework will be implemented in the upcoming patch.

This effectively reverts commit 1f6cca404918
("drm/msm/a6xx: Ensure CX collapse during gpu recovery").

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v3)

Changes in v3:
- Updated commit msg (Philipp)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
 drivers/gpu/drm/msm/msm_gpu.c         | 4 ----
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 36c8fb699b56..4b16e75dfa50 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/reset.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1298,9 +1297,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* And the final one from recover worker */
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
-	/* Call into gpucc driver to poll for cx gdsc collapse */
-	reset_control_reset(gpu->cx_collapse);
-
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 30ed45af76ad..97e1319d4577 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -16,7 +16,6 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
-#include <linux/reset.h>
 #include <linux/sched/task.h>
 
 /*
@@ -933,9 +932,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
-	gpu->cx_collapse = devm_reset_control_get_optional_exclusive(&pdev->dev,
-			"cx_collapse");
-
 	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 651786bc55e5..fa9e34d02c91 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -13,7 +13,6 @@
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
-#include <linux/reset.h>
 
 #include "msm_drv.h"
 #include "msm_fence.h"
@@ -282,9 +281,6 @@ struct msm_gpu {
 	bool hw_apriv;
 
 	struct thermal_cooling_device *cooling;
-
-	/* To poll for cx gdsc collapse during gpu recovery */
-	struct reset_control *cx_collapse;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.7.4

