Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0B3D2FBE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EBC6F480;
	Thu, 22 Jul 2021 22:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96EF6F480;
 Thu, 22 Jul 2021 22:17:48 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id f1so977855plt.7;
 Thu, 22 Jul 2021 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+4yPSI4Sw52ZnxaUpGPC1NtBGa97BfMQZfa8dht1vc=;
 b=ebId3pQafrdJYrg5tLuaZQHdo1QsTXSkY+0KtXY1FpWofozX4wfj2bTQui7qcPtgUh
 Esg9UvUZcuUDC7DNrxQLgZJS5nqtjgx/CsFPe/klY+nG0eAw4KDAjsDAZXBbAg4Pu1Fb
 I8xZ+LbLu8Fju+P+yKf0+cTYd1QNtekC3Vbvg2yDNHshs0PAiN1Ii9LUNAse9rt+RIHr
 +z9X2TpxRKPBSo/TlC9s6jT917MWl150wkdEeAukH79ySaVz5cLtU54K8urEK2m/by1k
 faVAm3mOyRZ47hBUiUBLFByDHWJCjhCmCRjELzQy0UgMeoiuZ90tcEf8Jak1oFDxaArD
 WztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+4yPSI4Sw52ZnxaUpGPC1NtBGa97BfMQZfa8dht1vc=;
 b=f3dOn/qYny1BYE33r+FzxTTYzuxC11gm98Z11VjSqYiDTQrx1LJLii2AP2V05Pn9EU
 1KtfqF7V/R9LITeJXbtT2vIhyjioItTCxsiS5ihPUQ/Nku95eqx/IJvPEIwC1UASX2if
 ELC86TIUfJMcjauYkOS7YTd2WUWVc8bYee2rFq5Hh50mdGXucMeNkSnHttIzKvUdKXQQ
 ZYNhTHE/SHyhYkjyS/cEuz9kDDj5+kNYfw5Rrz1ZTpT0AYvtYP90dBMhlHdNj0sq97Pn
 r7E9NgxSd9hPGXyqEwQdzJ3VuE2oReGUpJ4rKwl4fhWryr03UvBUra0uSytj9WyavOpw
 FS2A==
X-Gm-Message-State: AOAM531uS38R88OKPQUUBOhgQcvuqfXyWxSYUCL/3Sca1dr9QYVUWSba
 /SpKEXmDdj24OWd5/wrlMPusiw+4MSbnww==
X-Google-Smtp-Source: ABdhPJxQuPnhfr+lsj16reAJBxco2WCHD35phGKUb5+VmUZIahKiyZz6hFYSKJKG4OIKeePCz6RS7A==
X-Received: by 2002:a62:1c14:0:b029:34a:70f5:40da with SMTP id
 c20-20020a621c140000b029034a70f540damr1799546pfc.37.1626992267863; 
 Thu, 22 Jul 2021 15:17:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 85sm31841316pfz.76.2021.07.22.15.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 15:17:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm: Devfreq tuning
Date: Thu, 22 Jul 2021 15:21:41 -0700
Message-Id: <20210722222145.1759900-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722222145.1759900-1-robdclark@gmail.com>
References: <20210722222145.1759900-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This adds a few things to try and make frequency scaling better match
the workload:

1) Longer polling interval to avoid whip-lashing between too-high and
   too-low frequencies in certain workloads, like mobile games which
   throttle themselves to 30fps.

   Previously our polling interval was short enough to let things
   ramp down to minimum freq in the "off" frame, but long enough to
   not react quickly enough when rendering started on the next frame,
   leading to uneven frame times.  (Ie. rather than a consistent 33ms
   it would alternate between 16/33/48ms.)

2) Awareness of when the GPU is active vs idle.  Since we know when
   the GPU is active vs idle, we can clamp the frequency down to the
   minimum while it is idle.  (If it is idle for long enough, then
   the autosuspend delay will eventually kick in and power down the
   GPU.)

   Since devfreq has no knowledge of powered-but-idle, this takes a
   small bit of trickery to maintain a "fake" frequency while idle.
   This, combined with the longer polling period allows devfreq to
   arrive at a reasonable "active" frequency, while still clamping
   to minimum freq when idle to reduce power draw.

3) Boost.  Because simple_ondemand needs to see a certain threshold
   of busyness to ramp up, we could end up needing multiple polling
   cycles before it reacts appropriately on interactive workloads
   (ex. scrolling a web page after reading for some time), on top
   of the already lengthened polling interval, when we see a idle
   to active transition after a period of idle time we boost the
   frequency that we return to.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c         |  8 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  9 ++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 73 ++++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 70d8610b1b73..68d2df590054 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -667,6 +667,10 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	list_del(&submit->node);
 	spin_unlock(&ring->submit_lock);
 
+	/* Update devfreq on transition from active->idle: */
+	if (atomic_dec_return(&gpu->active_submits) == 0)
+		msm_devfreq_idle(gpu);
+
 	msm_gem_submit_put(submit);
 }
 
@@ -747,6 +751,10 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	list_add_tail(&submit->node, &ring->submits);
 	spin_unlock(&ring->submit_lock);
 
+	/* Update devfreq on transition from idle->active: */
+	if (atomic_inc_return(&gpu->active_submits) == 1)
+		msm_devfreq_active(gpu);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ada15e28f251..e14edda3d778 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -84,6 +84,10 @@ struct msm_gpu_devfreq {
 	struct devfreq *devfreq;
 	u64 busy_cycles;
 	ktime_t time;
+
+	/* Time and freq of last transition to idle: */
+	ktime_t idle_time;
+	unsigned long idle_freq;
 };
 
 struct msm_gpu {
@@ -115,6 +119,9 @@ struct msm_gpu {
 	 */
 	struct list_head active_list;
 
+	/* number of in-flight submits: */
+	atomic_t active_submits;
+
 	/* does gpu need hw_init? */
 	bool needs_hw_init;
 
@@ -384,6 +391,8 @@ void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
 void msm_devfreq_suspend(struct msm_gpu *gpu);
+void msm_devfreq_active(struct msm_gpu *gpu);
+void msm_devfreq_idle(struct msm_gpu *gpu);
 
 int msm_gpu_hw_init(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e24a97be624..0a1ee20296a2 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -22,6 +22,15 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
+	/*
+	 * If the GPU is idle, devfreq is not aware, so just ignore
+	 * it's requests
+	 */
+	if (gpu->devfreq.idle_freq) {
+		gpu->devfreq.idle_freq = *freq;
+		return 0;
+	}
+
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
@@ -39,6 +48,9 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 static unsigned long get_freq(struct msm_gpu *gpu)
 {
+	if (gpu->devfreq.idle_freq)
+		return gpu->devfreq.idle_freq;
+
 	if (gpu->funcs->gpu_get_freq)
 		return gpu->funcs->gpu_get_freq(gpu);
 
@@ -69,7 +81,8 @@ static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 }
 
 static struct devfreq_dev_profile msm_devfreq_profile = {
-	.polling_ms = 10,
+	.timer = DEVFREQ_TIMER_DELAYED,
+	.polling_ms = 50,
 	.target = msm_devfreq_target,
 	.get_dev_status = msm_devfreq_get_dev_status,
 	.get_cur_freq = msm_devfreq_get_cur_freq,
@@ -130,3 +143,61 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
+
+void msm_devfreq_active(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	struct devfreq_dev_status status;
+	unsigned int idle_time;
+	unsigned long target_freq = df->idle_freq;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
+
+	/*
+	 * If we've been idle for a significant fraction of a polling
+	 * interval, then we won't meet the threshold of busyness for
+	 * the governor to ramp up the freq.. so give some boost
+	 */
+	if (idle_time > msm_devfreq_profile.polling_ms/2) {
+		target_freq *= 2;
+	}
+
+	df->idle_freq = 0;
+
+	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+
+	/*
+	 * Reset the polling interval so we aren't inconsistent
+	 * about freq vs busy/total cycles
+	 */
+	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
+
+	mutex_unlock(&df->devfreq->lock);
+}
+
+void msm_devfreq_idle(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long idle_freq, target_freq = 0;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	idle_freq = get_freq(gpu);
+
+	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+
+	df->idle_time = ktime_get();
+	df->idle_freq = idle_freq;
+
+	mutex_unlock(&df->devfreq->lock);
+}
-- 
2.31.1

