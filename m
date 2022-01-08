Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB448853F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 19:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6CB10F2B7;
	Sat,  8 Jan 2022 18:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5A10F2B2;
 Sat,  8 Jan 2022 18:09:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso10921629pjb.1; 
 Sat, 08 Jan 2022 10:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=Dadc/cXPO0Uubd/3MkatQs1U4WERUA3XCupDgrJmGVsJIwvpDXnqEeetn63+ka7T6Z
 QJYYtuWQ5Gyrir8ulQHyjWOX0EnHqHvClV0uivmDk7DPOB7iZRL6wlcZIglDpjtOJ1su
 +W99NY5LlfFCa7TGy62ZQFZTX88A0anOL/loyhDqYjjitMGy92fcAVjzSMnBVdlt7yDE
 94MyLMx/eNiHmh8ipu6YCC6PkDl1WMt9c9uXODNhAR5deTV37UvygLEdopJp7mibuvN6
 knAv7q0CKzIOYCT7fetCaRQb7VFAyZT45H84lTcSs7ZqxIxoj3u2UdaLqu3DiBYylpPp
 iPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=v8m1bCe6MSTkQVdmofVW3V0nJn5uYDOvN91V7qIcNniz5lZIyitJnWEU6nk4Qs5+0B
 sGXvK8eJq05/tRBO988F0OmO5CRWZdt7TzKrFfvbTgkmVEFUoR0eXvXcSP6bh2AA3x+H
 9nC67C7Xw8/2OK+6wUYe+nLogfTPXVUYd4IQwRZ7taTQH6x1Uaq+LENCPTjmtiOC1/l6
 wEVNsdbQYglWE7xKKmlE3LGkEive83eREZhPgSgaUzaLpuiew2H1pC60VJL4AVvj3jy8
 eCXp/yIhOnSpfwlF66XD2d42psOPeGzZKngNEYVf31efqCfew6oxhL0OFFvESnJstadm
 RAlg==
X-Gm-Message-State: AOAM532NKnqTmW0RBLp3hLEszOlTWrFv6ApNkvB5QZhAnCWZchPYJjFP
 SXfBchbX4NJ3H0TtYPf6Oou5EPJqfxs=
X-Google-Smtp-Source: ABdhPJx4ZDShbND64UCj+uvq1tWaXe/Sn2QWDwmlo3FJc5MoNWsmz0nVsKR3UQiVl1O+Xbl8i6SO9g==
X-Received: by 2002:a17:902:e749:b0:148:f083:3905 with SMTP id
 p9-20020a170902e74900b00148f0833905mr68561286plf.136.1641665369257; 
 Sat, 08 Jan 2022 10:09:29 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id ng7sm2564668pjb.41.2022.01.08.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:09:28 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm/gpu: Cancel idle/boost work on suspend
Date: Sat,  8 Jan 2022 10:09:11 -0800
Message-Id: <20220108180913.814448-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108180913.814448-1-robdclark@gmail.com>
References: <20220108180913.814448-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With system suspend using pm_runtime_force_suspend() we can't rely on
the pm_runtime_get_if_in_use() trick to deal with devfreq callbacks
after (or racing with) suspend.  So flush any pending idle or boost
work in the suspend path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 62405e980925..9bf319be11f6 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -133,6 +133,18 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 }
 
+static void cancel_idle_work(struct msm_gpu_devfreq *df)
+{
+	hrtimer_cancel(&df->idle_work.timer);
+	kthread_cancel_work_sync(&df->idle_work.work);
+}
+
+static void cancel_boost_work(struct msm_gpu_devfreq *df)
+{
+	hrtimer_cancel(&df->boost_work.timer);
+	kthread_cancel_work_sync(&df->boost_work.work);
+}
+
 void msm_devfreq_cleanup(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
@@ -152,7 +164,12 @@ void msm_devfreq_resume(struct msm_gpu *gpu)
 
 void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
-	devfreq_suspend_device(gpu->devfreq.devfreq);
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
+	devfreq_suspend_device(df->devfreq);
+
+	cancel_idle_work(df);
+	cancel_boost_work(df);
 }
 
 static void msm_devfreq_boost_work(struct kthread_work *work)
@@ -196,7 +213,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	/*
 	 * Cancel any pending transition to idle frequency:
 	 */
-	hrtimer_cancel(&df->idle_work.timer);
+	cancel_idle_work(df);
 
 	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
 
-- 
2.33.1

