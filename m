Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586F4BC9DC
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145F10E13A;
	Sat, 19 Feb 2022 18:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741CA10E13A;
 Sat, 19 Feb 2022 18:32:54 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l8so9678979pls.7;
 Sat, 19 Feb 2022 10:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho+ShHSlRTiwiHcCktxOaPTKqD2bl9+yC4MofqkpwpY=;
 b=giFCShna2q/R17eoMXv6LwCithIiEpJbvhl6Yx4tbCRFrA0ZXvwkd15ms6ZHmqWWzz
 YA+aQbQw2a3dX2rvOWIfHsGHB/SFrIZQX8k6Z7zJrSMkmLH6gSgvHDBfZwvNtvZZOnSJ
 EEysyM5S2RGNWrnbM+8BbFy3b+098oK9ljiAhrQBEgfCSL0rKCgUsDFYE2+bWzMAGtwi
 agEco/RtWHtzPiHo17M9MIbtYUjzkJ6v7he4nWl1b414Yq113hsgDeH/bm+kk8HXBksm
 /ZGR1/U/YiQRXGKp7a9oU69Mw7sPhrKghOvxpneJmrov+mafQZ8vxePwG53Fe2EMtFEV
 7i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho+ShHSlRTiwiHcCktxOaPTKqD2bl9+yC4MofqkpwpY=;
 b=kHAJ95hepwefrMCVzI/ekXq3TNBUZQOpeswMB3oW5tvI4Z8lKYvn/mwo/VkAic4uFE
 ARQA20uKYEWjaBcD/qiMh+OgnBdGEUcxJw7FuO+n0IqaKrr5/jj1d9YCwgtw0J/HwkV6
 l7lV62TodoPQZh/w3nUmQX+cLmfae0xBxrKg5yq8GdHontIa3u8Z5y20J1qz4vzjXcn2
 viT3G2/bWjndOE3wrBn5XwsXg2Huh+2GTgQiD1J3tNJ9V3i55JY1i/FzaPFuxkr8tXyU
 tOojwQvNvKDXsaVt9rrkXXcbGNG3GDc7KFmGC3CDqZZQ1KWDrV6HtK81jmdiP+6F+f5E
 V3tg==
X-Gm-Message-State: AOAM530RcoXOG0sEqi2tl+Yq8BJAB7r2OPP/szfZglLFlBHLW437xRSv
 Q/xL0DrKJ4D9i2uznOT6WqS8OM3WqM8=
X-Google-Smtp-Source: ABdhPJzcLjLhI9T6Bv/5mPlgmypgthYLZzt+55Wz3I3DeyDSYTitxUVAdEplMyFb1VFIugqIWtpX4A==
X-Received: by 2002:a17:902:b60e:b0:14d:7a55:2efb with SMTP id
 b14-20020a170902b60e00b0014d7a552efbmr12623201pls.124.1645295573393; 
 Sat, 19 Feb 2022 10:32:53 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id h5sm7428494pfi.18.2022.02.19.10.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 10:32:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
Date: Sat, 19 Feb 2022 10:33:10 -0800
Message-Id: <20220219183310.557435-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid going down devfreq paths on devices where devfreq is not
initialized.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 9bf319be11f6..26a3669a97b3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -83,12 +83,17 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 static void msm_devfreq_boost_work(struct kthread_work *work);
 static void msm_devfreq_idle_work(struct kthread_work *work);
 
+static bool has_devfreq(struct msm_gpu *gpu)
+{
+	return !!gpu->funcs->gpu_busy;
+}
+
 void msm_devfreq_init(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
 	/* We need target support to do devfreq */
-	if (!gpu->funcs->gpu_busy)
+	if (!has_devfreq(gpu))
 		return;
 
 	dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
@@ -149,6 +154,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	devfreq_cooling_unregister(gpu->cooling);
 	dev_pm_qos_remove_request(&df->boost_freq);
 	dev_pm_qos_remove_request(&df->idle_freq);
@@ -156,16 +164,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
 
 void msm_devfreq_resume(struct msm_gpu *gpu)
 {
-	gpu->devfreq.busy_cycles = 0;
-	gpu->devfreq.time = ktime_get();
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
-	devfreq_resume_device(gpu->devfreq.devfreq);
+	if (!has_devfreq(gpu))
+		return;
+
+	df->busy_cycles = 0;
+	df->time = ktime_get();
+
+	devfreq_resume_device(df->devfreq);
 }
 
 void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	devfreq_suspend_device(df->devfreq);
 
 	cancel_idle_work(df);
@@ -185,6 +201,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	uint64_t freq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	freq = get_freq(gpu);
 	freq *= factor;
 
@@ -207,7 +226,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	struct devfreq_dev_status status;
 	unsigned int idle_time;
 
-	if (!df->devfreq)
+	if (!has_devfreq(gpu))
 		return;
 
 	/*
@@ -253,7 +272,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
-	if (!df->devfreq)
+	if (!has_devfreq(gpu))
 		return;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-- 
2.34.1

