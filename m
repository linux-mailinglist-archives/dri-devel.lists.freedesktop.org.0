Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF25859D7
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F68510EF6B;
	Sat, 30 Jul 2022 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8543D10E476;
 Sat, 30 Jul 2022 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659174099; x=1690710099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kapmk1TSxsuqJu2Jmg3cD+1eM1kpd48XieGg2BZn+oA=;
 b=vRWo+bktKG2J42YLJl4WF8wqZvH0nPXlBymPXvoi1/lZ3S1xWsPxHCD3
 vdveVDxuoEW6CbZU//YObsacDB3INNQxuEf4QmTdi+fu1YQrtp0NUIZ83
 cCKOyAXfy8mZg2pBfmNlvEGSJ2pFBV5/QF0j5NQVH7+nM6T9gJecPb1as s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 30 Jul 2022 02:41:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 02:41:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:37 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:32 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 5/8] drm/msm/a6xx: Ensure CX collapse during gpu recovery
Date: Sat, 30 Jul 2022 15:10:48 +0530
Message-ID: <20220730150952.v3.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
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
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because there could be transient votes from other drivers/tz/hyp which
may keep the cx gdsc enabled, we should poll until cx gdsc collapses.
We can use the reset framework to poll for cx gdsc collapse from gpucc
clk driver.

This feature requires support from the platform's gpucc driver.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v3:
- Use reset interface from gpucc driver to poll for cx gdsc collapse
  https://patchwork.freedesktop.org/series/106860/

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.c         | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1b049c5..721d5e6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/reset.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1224,6 +1225,9 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* And the final one from recover worker */
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	/* Call into gpucc driver to poll for cx gdsc collapse */
+	reset_control_reset(gpu->cx_collapse);
+
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 07e55a6..4a57627 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -14,6 +14,7 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
+#include <linux/reset.h>
 #include <linux/sched/task.h>
 
 /*
@@ -903,6 +904,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
+	gpu->cx_collapse = devm_reset_control_get_optional(&pdev->dev,
+			"cx_collapse");
+
 	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6def008..ab59fd2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -13,6 +13,7 @@
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 
 #include "msm_drv.h"
 #include "msm_fence.h"
@@ -268,6 +269,9 @@ struct msm_gpu {
 	bool hw_apriv;
 
 	struct thermal_cooling_device *cooling;
+
+	/* To poll for cx gdsc collapse during gpu recovery */
+	struct reset_control *cx_collapse;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.7.4

