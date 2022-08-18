Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2E598DC3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E36D10EE54;
	Thu, 18 Aug 2022 20:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB9710EBA4;
 Thu, 18 Aug 2022 20:22:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IHwD3Z026476;
 Thu, 18 Aug 2022 20:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=vsNgve5Q42Gju10FlJL2q3pdvo4ynGf9dM+n4ShJtJU=;
 b=pSDt2KMatPYgiQRwX5lXqPHpaAFH1HlOP52JVpCxvVBcrPdPbgCEC8uU238Q7PwMNigd
 v3acXqRPRY8SF2v6FM3I5KYSL+00+Q1km+QFA0i9pYTpmoiQhAOOww09bd1pd0SM1w4i
 WISEnzzpjJ6+IaNAp8vCdTuAKWRevfTLIWa56l34JTzu5NcuaVWCHwbU4atGbQ3pwOW3
 eXI+OZmoJpmpILiom3WaXbwJDqJSj0sdZfjms0SgQo75zXkxYSm+Jco4QrLiCdgMc4GV
 gNqXPM5jrTezo25uAysNY4GaoOzIsfR7odCpfPJPzsgwc6ZVkttTS5f8/0LevbhvomT1 WA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j181xmjjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 20:22:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IKMqfF020559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 20:22:52 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 18 Aug 2022 13:22:47 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 4/7] drm/msm: Fix cx collapse issue during recovery
Date: Fri, 19 Aug 2022 01:52:12 +0530
Message-ID: <20220819015030.v5.4.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660854135-1667-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660854135-1667-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ms_BKxr1H8_vkXmIfHzR6vIye1pCERrN
X-Proofpoint-ORIG-GUID: Ms_BKxr1H8_vkXmIfHzR6vIye1pCERrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180074
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Douglas Anderson <dianders@chromium.org>,
 David Airlie <airlied@linux.ie>, Matthias Kaehlcke <mka@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some hardware logic under CX domain. For a successful
recovery, we should ensure cx headswitch collapses to ensure all the
stale states are cleard out. This is especially true to for a6xx family
where we can GMU co-processor.

Currently, cx doesn't collapse due to a devlink between gpu and its
smmu. So the *struct gpu device* needs to be runtime suspended to ensure
that the iommu driver removes its vote on cx gdsc.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v4)

Changes in v4:
- Keep active_submit lock across the suspend & resume (Rob)
- Clear gpu->active_submits to silence a WARN() during runpm suspend (Rob)

Changes in v3:
- Simplied the pm refcount drop since we have just a single refcount now
for all active submits

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c         |  4 +---
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 42ed9a3..0c8f19e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1193,7 +1193,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	int i;
+	int i, active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1210,8 +1210,34 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
 
-	gpu->funcs->pm_suspend(gpu);
-	gpu->funcs->pm_resume(gpu);
+	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
+
+	/* active_submit won't change until we make a submission */
+	mutex_lock(&gpu->active_lock);
+	active_submits = gpu->active_submits;
+
+	/*
+	 * Temporarily clear active_submits count to silence a WARN() in the
+	 * runtime suspend cb
+	 */
+	gpu->active_submits = 0;
+
+	/* Drop the rpm refcount from active submits */
+	if (active_submits)
+		pm_runtime_put(&gpu->pdev->dev);
+
+	/* And the final one from recover worker */
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	pm_runtime_use_autosuspend(&gpu->pdev->dev);
+
+	if (active_submits)
+		pm_runtime_get(&gpu->pdev->dev);
+
+	pm_runtime_get_sync(&gpu->pdev->dev);
+
+	gpu->active_submits = active_submits;
+	mutex_unlock(&gpu->active_lock);
 
 	msm_gpu_hw_init(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 1945efb..07e55a6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -426,9 +426,7 @@ static void recover_worker(struct kthread_work *work)
 		/* retire completed submits, plus the one that hung: */
 		retire_submits(gpu);
 
-		pm_runtime_get_sync(&gpu->pdev->dev);
 		gpu->funcs->recover(gpu);
-		pm_runtime_put_sync(&gpu->pdev->dev);
 
 		/*
 		 * Replay all remaining submits starting with highest priority
@@ -445,7 +443,7 @@ static void recover_worker(struct kthread_work *work)
 		}
 	}
 
-	pm_runtime_put_sync(&gpu->pdev->dev);
+	pm_runtime_put(&gpu->pdev->dev);
 
 	mutex_unlock(&gpu->lock);
 
-- 
2.7.4

