Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453856C75C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 08:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEEC10EC64;
	Sat,  9 Jul 2022 06:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF8510EC77;
 Sat,  9 Jul 2022 06:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657346419; x=1688882419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=wJCaw3CiF0MD4eKDCyob1ussNDvrGgARTORwyELixQI=;
 b=E9J1ust4U08lWioh28u1HXHKvQidz52xohF55cQEb/MooVO1Jber6Fw9
 FErZwfqifBiI7BsFE7BXieGgYBI+2jIJv6ZzlMn9JvWiZAyf0LG2FMoZq
 SjgJGeMJJkXHYq0G5S/iyPt9nIWj/UEDXcFsSJGn+znOqHOIMo9oyQqQE 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jul 2022 23:00:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 23:00:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 23:00:18 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 23:00:12 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/7] drm/msm: Fix cx collapse issue during recovery
Date: Sat, 9 Jul 2022 11:29:31 +0530
Message-ID: <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Douglas
 Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
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

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c         |  2 --
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4d50110..7ed347c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
 
-	gpu->funcs->pm_suspend(gpu);
-	gpu->funcs->pm_resume(gpu);
+	/*
+	 * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
+	 * First drop the usage count from all active submits
+	 */
+	for (i = gpu->active_submits; i > 0; i--)
+		pm_runtime_put(&gpu->pdev->dev);
+
+	/* And the final one from recover worker */
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	for (i = gpu->active_submits; i > 0; i--)
+		pm_runtime_get(&gpu->pdev->dev);
+
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	msm_gpu_hw_init(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18c1544..aa6f34f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -422,9 +422,7 @@ static void recover_worker(struct kthread_work *work)
 		/* retire completed submits, plus the one that hung: */
 		retire_submits(gpu);
 
-		pm_runtime_get_sync(&gpu->pdev->dev);
 		gpu->funcs->recover(gpu);
-		pm_runtime_put_sync(&gpu->pdev->dev);
 
 		/*
 		 * Replay all remaining submits starting with highest priority
-- 
2.7.4

