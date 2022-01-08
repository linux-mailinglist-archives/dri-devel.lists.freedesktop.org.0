Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5248850C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 18:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D49A10E2C3;
	Sat,  8 Jan 2022 17:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E757D10E2A0;
 Sat,  8 Jan 2022 17:43:00 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so16493871pjf.3; 
 Sat, 08 Jan 2022 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ICsCpVLEUVmCQJoR3FiShTO8fbKm/U8/ekB8Jz2QGI=;
 b=duIxRD681jGxbZtbxAjkijAXRws7Isk96YI5RuN3WdFwU9EujJxBKG23k1pSyf0pZ+
 /WS3RW3lU/vBXb/tvdlwr5E1Q7oOV+ASKijQzKHBXOlXKeYuMntlhI8Kip2ionkmF0Fm
 DrIi14tTcrOW4e4xnafjG+563wh0f+L28TF7OQnukQygOjqsz+rUZoFdNFqtjlQ3z4ks
 CodP9E7op8jf4izk5Hfb0WlffjmvbX6+ctUmBm+Q2y3fQ5xFB8bjNEypj/AcZQ4A8M9B
 bXTNnNHxgyCnDNHhHM0X/4IwgGD1mOFO3JBurQSblJrDAXg42KU13TGk/EFF0OsI1Tto
 prEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ICsCpVLEUVmCQJoR3FiShTO8fbKm/U8/ekB8Jz2QGI=;
 b=BhMPESdRFZtrR7+bUoxSuCbIPt35WAgu4TmFpTKChWYZ+4pz5Oer8Sl7HCT2LupOOI
 dQt4mFCCJQSd5Oh2F7i2+AnWU9NAiTa8tSapSe/Y6/CzWv3S8hn/1hZMP/mWE8q5UcXE
 NctW5thkoDX1xtmFxd8fIOx4lJ4ENibbExUfK1FcZjfjOeWoFWu446ZZ0JbtlyOXBJe0
 CqYXKMHyjE15Zq/Dzzpu/hpp9fkyxftfqDQrXfIeHcPLyTEPn0IHB+fChrEpfNEO+Flg
 dQfs7eqJ1zW5FRzEVfzdkHu8tWr5UxZNU/+I3j8TTJo775YYLr732BvJhhocxVEa22wS
 5sbA==
X-Gm-Message-State: AOAM533HNWSEColQJ6NpigHFl0ZzT5W4u5vK2Kw3NTV+Xn0HoasdqRQo
 Dbd2XgCQ1FXmbxgg9I/3kLQAAr3QlVE=
X-Google-Smtp-Source: ABdhPJzekASgi4oEnbLVoWwPftexK59nXAM7GtBGPgWq3ZioqjNjB0ehb3p1uMfrNvHhTeEtAkhfcQ==
X-Received: by 2002:a17:902:6948:b0:149:f187:e601 with SMTP id
 k8-20020a170902694800b00149f187e601mr12161547plt.81.1641663779948; 
 Sat, 08 Jan 2022 09:42:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z13sm2032943pgi.75.2022.01.08.09.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:42:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/gpu: Cancel idle/boost work on suspend
Date: Sat,  8 Jan 2022 09:42:47 -0800
Message-Id: <20220108174249.811872-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108174249.811872-1-robdclark@gmail.com>
References: <20220108174249.811872-1-robdclark@gmail.com>
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

v2: s/ret/remaining [sboyd], and switch to using active_submits count
    to ensure we aren't racing with submit cleanup (and devfreq idle
    work getting scheduled, etc)

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

