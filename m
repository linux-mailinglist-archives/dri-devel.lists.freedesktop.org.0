Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F741A383
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 01:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620F6E056;
	Mon, 27 Sep 2021 23:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828E6E054;
 Mon, 27 Sep 2021 23:00:22 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mi2-20020a17090b4b4200b0019f1349df1dso119221pjb.0; 
 Mon, 27 Sep 2021 16:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rbLOO10kE7IzUzgrNCp18mct+mNdp/gWXsyE0YgXgA=;
 b=I62cA8quqW9adN9QhJVpPFvFlzGroeNfhwxgIjahjW4W1zokWRtF3RBXmvV9qpzKZR
 KlzsEK2U7EJLFR6aeVm31MQUvxnvInsreHPjdbiDeguDnkPWr6mS+gDqVZrT+K7G/1U/
 AYSIcE6rq2wkMze3oMZ2PgeGY1Asqh2ELq6vE/IrEzb/QctT5XxBgkXApJU+0tHb5MEG
 rWjZLC6bz7PVqlgd35/BR0XJFGZgBIdKSmB5wSZrDs8a/HB4VHVCWaGw3wCIVSfTNnKo
 kaOM2AMiQlYk1/9bp9KCKk6okR2sORxBnPgvotwNc5hECpKhsDhPnfQfR2nUOO4ywO5o
 Tpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rbLOO10kE7IzUzgrNCp18mct+mNdp/gWXsyE0YgXgA=;
 b=MVNeGKKXMdb2rPQUeNeiBQNv57vhpL5tO1WSjZmPSpFTWPhEFRIczMkNV4h4Tv58uW
 l8V43/ERXaUz33DWcL39OkPGrm4kpzRevHoJ+NVoevMUjmHEIo2EyIfjzC/10TBWlB/G
 PyvPR2DIvr/PKca5Bx/+9MLLLo4yHDAa+MeWnd2oi5SxmFW9t/g+oAI9kD6Ef43GKozb
 ZEDdA24el/myCDnzHLB1wv6jpMTlrjSrr7utcROdvBi64LMqUh6F+QlaPyRnyB4PRc2U
 TGtmGrRivXdEi8CCUSF+JT6KML/pbd/byJ6OyrjNqqqDuxovYiZ8ZXVZ/WOB9SP3xAa7
 EbCg==
X-Gm-Message-State: AOAM530Lhv/CqfWlVsQ8fcofsr1Q+q0XQo9vZS3XnDYy4VPo5A99oUlm
 yLgZMi72E8hWDR/UKTASVhT33Gt2/lI=
X-Google-Smtp-Source: ABdhPJzuknYifE3KPt5cVuBI+RL/qmqMB1RznGFPDXHlgg/SO4wWp2Q/1kzjyHxtcauARjqGVJ7rGg==
X-Received: by 2002:a17:90a:728b:: with SMTP id
 e11mr1729887pjg.107.1632783621244; 
 Mon, 27 Sep 2021 16:00:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 23sm20582922pfw.97.2021.09.27.16.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 16:00:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/devfreq: Add 1ms delay before clamping freq
Date: Mon, 27 Sep 2021 16:04:54 -0700
Message-Id: <20210927230455.1066297-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927230455.1066297-1-robdclark@gmail.com>
References: <20210927230455.1066297-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Add a short delay before clamping to idle frequency on active->idle
transition.  It takes ~0.5ms to increase the freq again on the next
idle->active transition, so this helps avoid extra freq transitions
on workloads that bounce between CPU and GPU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note that this sort of re-introduces the theoretical race solved
by [1].. but that should not be a problem with something along the
lines of [2]. 

[1] https://patchwork.freedesktop.org/patch/455910/?series=95111&rev=1
[2] https://patchwork.freedesktop.org/patch/455928/?series=95119&rev=1

 drivers/gpu/drm/msm/msm_gpu.h         |  7 +++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 38 +++++++++++++++++++++------
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 32a859307e81..2fcb6c195865 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -120,6 +120,13 @@ struct msm_gpu_devfreq {
 	 * it is inactive.
 	 */
 	unsigned long idle_freq;
+
+	/**
+	 * idle_work:
+	 *
+	 * Used to delay clamping to idle freq on active->idle transition.
+	 */
+	struct msm_hrtimer_work idle_work;
 };
 
 struct msm_gpu {
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 15b64f35c0f6..36e1930ee26d 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -96,8 +96,12 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.get_cur_freq = msm_devfreq_get_cur_freq,
 };
 
+static void msm_devfreq_idle_work(struct kthread_work *work);
+
 void msm_devfreq_init(struct msm_gpu *gpu)
 {
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
 	/* We need target support to do devfreq */
 	if (!gpu->funcs->gpu_busy)
 		return;
@@ -113,25 +117,27 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	msm_devfreq_profile.freq_table = NULL;
 	msm_devfreq_profile.max_state = 0;
 
-	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
+	df->devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
 			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
 			NULL);
 
-	if (IS_ERR(gpu->devfreq.devfreq)) {
+	if (IS_ERR(df->devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
-		gpu->devfreq.devfreq = NULL;
+		df->devfreq = NULL;
 		return;
 	}
 
-	devfreq_suspend_device(gpu->devfreq.devfreq);
+	devfreq_suspend_device(df->devfreq);
 
-	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
-			gpu->devfreq.devfreq);
+	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node, df->devfreq);
 	if (IS_ERR(gpu->cooling)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev,
 				"Couldn't register GPU cooling device\n");
 		gpu->cooling = NULL;
 	}
+
+	msm_hrtimer_work_init(&df->idle_work, gpu->worker, msm_devfreq_idle_work,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 }
 
 void msm_devfreq_cleanup(struct msm_gpu *gpu)
@@ -179,6 +185,11 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	unsigned int idle_time;
 	unsigned long target_freq = df->idle_freq;
 
+	/*
+	 * Cancel any pending transition to idle frequency:
+	 */
+	hrtimer_cancel(&df->idle_work.timer);
+
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -209,9 +220,12 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	mutex_unlock(&df->devfreq->lock);
 }
 
-void msm_devfreq_idle(struct msm_gpu *gpu)
+
+static void msm_devfreq_idle_work(struct kthread_work *work)
 {
-	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	struct msm_gpu_devfreq *df = container_of(work,
+			struct msm_gpu_devfreq, idle_work.work);
+	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
 	unsigned long idle_freq, target_freq = 0;
 
 	/*
@@ -229,3 +243,11 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 
 	mutex_unlock(&df->devfreq->lock);
 }
+
+void msm_devfreq_idle(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
+	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
+			       HRTIMER_MODE_ABS);
+}
-- 
2.31.1

