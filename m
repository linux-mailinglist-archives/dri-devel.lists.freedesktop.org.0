Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8B7486993
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67810E7F3;
	Thu,  6 Jan 2022 18:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3951410E7F7;
 Thu,  6 Jan 2022 18:15:11 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id m1so3179165pfk.8;
 Thu, 06 Jan 2022 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=F09yhVw/miHkBPbi4ZUlYr4v+8jysbgt9gi1ewGjNnREmk2R3F7tVzYoSF1tvXfNWH
 unH8PPBeS0TlZp1ZTjWad/PIvqEPdCPWEcvhtXCGPZOzzqwfVq6OXC+LJa1xWijbJPqz
 rwunzxgZsmSP7FEWW9+2s4ldMauj+40newsjGyEzwiHXWbbFYVBBcTBlyI4d5W88lA6D
 O/cIXoglEpASRbpBcm4M6576cHGNv7JcqSXq/WwRYI8n1nEXxwXa/2cFUxB0AHSDKHkj
 8OQIf89HIKCwH+u34JrNSIRCUv+m+DNeFxN2/N4xh6yOSUMzPK1uCcV3EnM+uD35I59y
 b+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=jUsTp547c0UC4xJ1R5QYfxnalYHi0iFWmOVQ9w7mVCYAbCwhvLZsY8ACv5pk+tH3e5
 oWVNjgA1Yp6OX7b5n0ffRlqsCZVW7NwdEJZbS/scRBalRjC6Ho3Y/QzCbr727nkdQkqu
 sGrqVhogM4Lk1ikqQAgaHwYFvQR7aLXKJSAXr1+UmxqziuH3W+RAZT73TsQvt4uxBtbf
 /7Xf4DP5o/qhUpM8r1P/oI+CrVvmiL6a3FhRWU7m4IcmTLJxPqVTODuqWboG10Ixzvq+
 r5t/GNfyHUWEYRp0vjIBc/BSlaX2iAwE4U7EyQ35Z1kA7DomX2qlGZ8t8pwGf9aXQYQT
 tdMQ==
X-Gm-Message-State: AOAM531WCmbEX6qxF0pDxhkUMsJnnX8lvLeTgYd7xScdK5XCjBnm10PV
 80+M+yV2DmSvxPCaWGf8DCMy7a5Crtg=
X-Google-Smtp-Source: ABdhPJwv7sVVNoZY8rfrc22AsxIsf7vwBPn1hePxXkzE5xqw9FRXjuAwrmj4inJU3E0t7U24/NgRsA==
X-Received: by 2002:a65:4c81:: with SMTP id m1mr54128291pgt.427.1641492910079; 
 Thu, 06 Jan 2022 10:15:10 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id c11sm3359333pfv.85.2022.01.06.10.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:15:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/gpu: Cancel idle/boost work on suspend
Date: Thu,  6 Jan 2022 10:14:47 -0800
Message-Id: <20220106181449.696988-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106181449.696988-1-robdclark@gmail.com>
References: <20220106181449.696988-1-robdclark@gmail.com>
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

