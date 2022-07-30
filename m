Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB45859C0
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C7D10E1B9;
	Sat, 30 Jul 2022 09:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F2610E3BE;
 Sat, 30 Jul 2022 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659174082; x=1690710082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=burYLZ2wEq5G7eIec0n1L7h1e9hZ66FpmzZiqkY+HqM=;
 b=opppkFuQB62NHFHdX6kc68JB0/FBmbgBTdO+BiTJ5prjtNltkDp981lp
 6JhghijxXUKmtVB096jT/DeLv+x39jwIBDXpcWNr5o+U8BO3OAz5qOo/q
 VXRwCMa6kats8Mt/qdG3fXUGRKLX9uRSPRKjFBtjJVpDUD7yaumQd8dI2 A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jul 2022 02:41:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 02:41:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:20 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:15 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/8] drm/msm: Take single rpm refcount on behalf of all
 submits
Date: Sat, 30 Jul 2022 15:10:45 +0530
Message-ID: <20220730150952.v3.2.Ifee853f6d8217a0fdacc459092bbc9e81a8a7ac7@changeid>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Matthias
 Kaehlcke <mka@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of separate refcount for each submit, take single rpm refcount
on behalf of all the submits. This makes it easier to drop the rpm
refcount during recovery in an upcoming patch.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/msm_gpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c8cd9bf..e1dd3cc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -663,11 +663,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	mutex_lock(&gpu->active_lock);
 	gpu->active_submits--;
 	WARN_ON(gpu->active_submits < 0);
-	if (!gpu->active_submits)
+	if (!gpu->active_submits) {
 		msm_devfreq_idle(gpu);
-	mutex_unlock(&gpu->active_lock);
+		pm_runtime_put_autosuspend(&gpu->pdev->dev);
+	}
 
-	pm_runtime_put_autosuspend(&gpu->pdev->dev);
+	mutex_unlock(&gpu->active_lock);
 
 	msm_gem_submit_put(submit);
 }
@@ -756,14 +757,17 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	/* Update devfreq on transition from idle->active: */
 	mutex_lock(&gpu->active_lock);
-	if (!gpu->active_submits)
+	if (!gpu->active_submits) {
+		pm_runtime_get(&gpu->pdev->dev);
 		msm_devfreq_active(gpu);
+	}
 	gpu->active_submits++;
 	mutex_unlock(&gpu->active_lock);
 
 	gpu->funcs->submit(gpu, submit);
 	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
+	pm_runtime_put(&gpu->pdev->dev);
 	hangcheck_timer_reset(gpu);
 }
 
-- 
2.7.4

