Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A445790C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359006E86C;
	Fri, 19 Nov 2021 22:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C036E82D;
 Fri, 19 Nov 2021 22:47:03 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id gt5so8983080pjb.1;
 Fri, 19 Nov 2021 14:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twAeZpCGMlzIF/Drja25nuGjpzU60u3HE0bcTGTxQkc=;
 b=nzo2vH9tzLMozmpK5sJ7x295U707HHj8eWE6FCK4D8Wx+D6V85FBkg+FmgcQyFNcY0
 +bl/9l4f9eo7rrHmLI/1B+tauBlmquFAgLapIm+urE4nPu/8PM7AVAuBWzzc1wOOErhN
 Jiwr9RH0OqZTOQyy8O1padVS/DekGYfDMtEQAxg24AAwR5vXD2WhKxWVmt1FXFOBK4YO
 h4qbjS/iGN4wDrhCq1NK2GmNEwT6YFTLwu3iBWAS/3CCX0NipMbOEHCgHPTEW9kPDmUh
 5/ZGTPGwQZpif7sXM6mYrw1R6z27Z3T1uih3LYCWaKhRKdrTO/KISH1QF5oURMQiQUtg
 rr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twAeZpCGMlzIF/Drja25nuGjpzU60u3HE0bcTGTxQkc=;
 b=FlxHCApF4XWvmEEcwR7+xMJdOEbTEhdZmp1mxdCyos/F0jb2tPoJ6k3AGyQ9gTSqIG
 dr7JtvF54/KFn2kLC0eovrwXo1JodVGWsOwuR63VdSIZKfnsw/wCQg4tWn/xw+A4nKRI
 tuLzUySieiwRLDcqCrOXZHZ9eEASVIJt33xLEtE6Wzx+J41lqBptTajCAguh3RImq4TT
 twcM4QLAZvczFpfFoVeoEGz4rxVEuwMhBfiXJICSHX+Gn9fS8bbJvUxjaldi2ptiKaa8
 1jDKHjSzRxGl50gQrNs+oRHbD0K6kRRYJ5clkqf9AF/Iv+YaaC1Wf2Kj66gwZLAusVYA
 iZhA==
X-Gm-Message-State: AOAM532IPbqxTQnoJVrdprl6HrgqZVL+hwn0+HrXaVGOZSfSyPKwPoKS
 6P8eb8JTWTTtssY29CsWShSqBr25sQE=
X-Google-Smtp-Source: ABdhPJxQeAAh5IaDEkXwR6H8PD8Mm7hi7ZmwS7C2h2xA50THKZdMhAGvvjMOBlH/y7f24YhpGX96Cg==
X-Received: by 2002:a17:90b:1e4f:: with SMTP id
 pi15mr3972773pjb.181.1637362022447; 
 Fri, 19 Nov 2021 14:47:02 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id k2sm687206pfc.9.2021.11.19.14.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:47:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
Date: Fri, 19 Nov 2021 14:51:57 -0800
Message-Id: <20211119225157.984706-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
References: <20211119225157.984706-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Re-work the boost and idle clamping to use PM QoS requests instead, so
they get aggreggated with other requests (such as cooling device).

This does have the minor side-effect that devfreq sysfs min_freq/
max_freq files now reflect the boost and idle clamping, as they show
(despite what they are documented to show) the aggregated min/max freq.
Fixing that in devfreq does not look straightforward after considering
that OPPs can be dynamically added/removed.  However writes to the
sysfs files still behave as expected.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.h         | 33 +++++++----
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 82 ++++++++++++++-------------
 2 files changed, 66 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 59cdd00b69d0..96d8d37dd5b7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -87,6 +87,21 @@ struct msm_gpu_devfreq {
 	/** devfreq: devfreq instance */
 	struct devfreq *devfreq;
 
+	/**
+	 * idle_constraint:
+	 *
+	 * A PM QoS constraint to limit max freq while the GPU is idle.
+	 */
+	struct dev_pm_qos_request idle_freq;
+
+	/**
+	 * boost_constraint:
+	 *
+	 * A PM QoS constraint to boost min freq for a period of time
+	 * until the boost expires.
+	 */
+	struct dev_pm_qos_request boost_freq;
+
 	/**
 	 * busy_cycles:
 	 *
@@ -103,22 +118,19 @@ struct msm_gpu_devfreq {
 	ktime_t idle_time;
 
 	/**
-	 * idle_freq:
+	 * idle_work:
 	 *
-	 * Shadow frequency used while the GPU is idle.  From the PoV of
-	 * the devfreq governor, we are continuing to sample busyness and
-	 * adjust frequency while the GPU is idle, but we use this shadow
-	 * value as the GPU is actually clamped to minimum frequency while
-	 * it is inactive.
+	 * Used to delay clamping to idle freq on active->idle transition.
 	 */
-	unsigned long idle_freq;
+	struct msm_hrtimer_work idle_work;
 
 	/**
-	 * idle_work:
+	 * boost_work:
 	 *
-	 * Used to delay clamping to idle freq on active->idle transition.
+	 * Used to reset the boost_constraint after the boost period has
+	 * elapsed
 	 */
-	struct msm_hrtimer_work idle_work;
+	struct msm_hrtimer_work boost_work;
 };
 
 struct msm_gpu {
@@ -498,6 +510,7 @@ void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
 void msm_devfreq_suspend(struct msm_gpu *gpu);
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
 void msm_devfreq_active(struct msm_gpu *gpu);
 void msm_devfreq_idle(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 7285041c737e..ff668e431cee 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -9,6 +9,7 @@
 
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/units.h>
 
 /*
  * Power Management:
@@ -22,15 +23,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
-	/*
-	 * If the GPU is idle, devfreq is not aware, so just ignore
-	 * it's requests
-	 */
-	if (gpu->devfreq.idle_freq) {
-		gpu->devfreq.idle_freq = *freq;
-		return 0;
-	}
-
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
@@ -48,9 +40,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 static unsigned long get_freq(struct msm_gpu *gpu)
 {
-	if (gpu->devfreq.idle_freq)
-		return gpu->devfreq.idle_freq;
-
 	if (gpu->funcs->gpu_get_freq)
 		return gpu->funcs->gpu_get_freq(gpu);
 
@@ -88,6 +77,7 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.get_cur_freq = msm_devfreq_get_cur_freq,
 };
 
+static void msm_devfreq_boost_work(struct kthread_work *work);
 static void msm_devfreq_idle_work(struct kthread_work *work);
 
 void msm_devfreq_init(struct msm_gpu *gpu)
@@ -98,6 +88,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	if (!gpu->funcs->gpu_busy)
 		return;
 
+	dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
+			       DEV_PM_QOS_MAX_FREQUENCY,
+			       PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
+	dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
+			       DEV_PM_QOS_MIN_FREQUENCY, 0);
+
 	msm_devfreq_profile.initial_freq = gpu->fast_rate;
 
 	/*
@@ -128,13 +124,19 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 		gpu->cooling = NULL;
 	}
 
+	msm_hrtimer_work_init(&df->boost_work, gpu->worker, msm_devfreq_boost_work,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	msm_hrtimer_work_init(&df->idle_work, gpu->worker, msm_devfreq_idle_work,
 			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 }
 
 void msm_devfreq_cleanup(struct msm_gpu *gpu)
 {
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
 	devfreq_cooling_unregister(gpu->cooling);
+	dev_pm_qos_remove_request(&df->boost_freq);
+	dev_pm_qos_remove_request(&df->idle_freq);
 }
 
 void msm_devfreq_resume(struct msm_gpu *gpu)
@@ -150,12 +152,35 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
 
+static void msm_devfreq_boost_work(struct kthread_work *work)
+{
+	struct msm_gpu_devfreq *df = container_of(work,
+			struct msm_gpu_devfreq, boost_work.work);
+
+	dev_pm_qos_update_request(&df->boost_freq, 0);
+}
+
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long freq;
+
+	freq = get_freq(gpu);
+	freq *= factor;
+	freq /= HZ_PER_KHZ;
+
+	dev_pm_qos_update_request(&df->boost_freq, freq);
+
+	msm_hrtimer_queue_work(&df->boost_work,
+			       ms_to_ktime(msm_devfreq_profile.polling_ms),
+			       HRTIMER_MODE_REL);
+}
+
 void msm_devfreq_active(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	struct devfreq_dev_status status;
 	unsigned int idle_time;
-	unsigned long target_freq = df->idle_freq;
 
 	if (!df->devfreq)
 		return;
@@ -165,12 +190,6 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	 */
 	hrtimer_cancel(&df->idle_work.timer);
 
-	/*
-	 * Hold devfreq lock to synchronize with get_dev_status()/
-	 * target() callbacks
-	 */
-	mutex_lock(&df->devfreq->lock);
-
 	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
 
 	/*
@@ -179,20 +198,17 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	 * the governor to ramp up the freq.. so give some boost
 	 */
 	if (idle_time > msm_devfreq_profile.polling_ms) {
-		target_freq *= 2;
+		msm_devfreq_boost(gpu, 2);
 	}
 
-	df->idle_freq = 0;
-
-	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+	dev_pm_qos_update_request(&df->idle_freq,
+				  PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
 
 	/*
 	 * Reset the polling interval so we aren't inconsistent
 	 * about freq vs busy/total cycles
 	 */
 	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
-
-	mutex_unlock(&df->devfreq->lock);
 }
 
 
@@ -201,26 +217,14 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu_devfreq *df = container_of(work,
 			struct msm_gpu_devfreq, idle_work.work);
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
-	unsigned long idle_freq, target_freq = 0;
 
 	if (!df->devfreq)
 		return;
 
-	/*
-	 * Hold devfreq lock to synchronize with get_dev_status()/
-	 * target() callbacks
-	 */
-	mutex_lock(&df->devfreq->lock);
-
-	idle_freq = get_freq(gpu);
-
-	if (gpu->clamp_to_idle)
-		msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
-
 	df->idle_time = ktime_get();
-	df->idle_freq = idle_freq;
 
-	mutex_unlock(&df->devfreq->lock);
+	if (gpu->clamp_to_idle)
+		dev_pm_qos_update_request(&df->idle_freq, 0);
 }
 
 void msm_devfreq_idle(struct msm_gpu *gpu)
-- 
2.33.1

