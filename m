Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496CA1B2825
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1F96E971;
	Tue, 21 Apr 2020 13:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D9B6E96C;
 Tue, 21 Apr 2020 13:38:05 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p8so6765406pgi.5;
 Tue, 21 Apr 2020 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v0LWS4aSBQ6f+C+jRFU323OD19Hb/ZVMLJf3ysSfdoI=;
 b=KALhDd0+/d0t1Lbkkq2TR0BkC+yXac5Y4ORExj/vYmOP0qkpMJrxn7CV1a81a6/7yq
 EyjpD1hvr6tbsRsyuAz6x3657MOgqUNrfactadVGVnBzomfp1ISqE4lOHL3Cs7tHzuBl
 hgy/8xIcrY9NkY8R/pcl4RRiQ5USpaH61uLEe55OAtn9Rm2lmPRwfaf6Q+Vv7b1jthgx
 UADnIPJrn5ZmLODYC9zLC+FkqB4c5Z8z6oqh0ypren5bAmAm+H/TWDgLWn5qnkhcO/ns
 Rd1NAjTr5dSjLsNYqQ/PN70dVTn0/czrXlirkZ+8cPb5SUYzIXB+c3ZIHziAv5gdVT+U
 2+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v0LWS4aSBQ6f+C+jRFU323OD19Hb/ZVMLJf3ysSfdoI=;
 b=OQVC0jeejMu8C4SfJHts5aAbEZ8qhsutqWg7X0br2hmG80BzR1bzV8dCpvrc3tEwzC
 aowFSTaD+OerTKW4QcXXo9uiZi5kwOh+0/ynppC2hHI4QjgysbefxXXFqURCbYDeS1dx
 whtaPDpmUII6tBTaqjcqA73yCHwE7q8cMpU217KgKgrhOlBLd3/IbUsICrspMR/WKAS3
 zI3RX/qwCLoamyX3SIplDkuoTZsdTV0/NuHt0XoampJXmgOIIg2xOl9JQ3PnSIMs14se
 duN8zETZ75/3ZOVwVHjos56IpUhnwcRBAc5lXSaq5EzToNp32IXrtGU0YQLUEOK1h2fQ
 HrVg==
X-Gm-Message-State: AGi0PuaY4lnMCTPg79zt7J2riUFV/ZekwsoPGBM94iY0KnZgAE3RwNGQ
 vkKC8musNNibx2iN8rE4ymTVY/jVBLOlGw==
X-Google-Smtp-Source: APiQypKmoRjzwGLM4+U3hHEM3LcYXy/ZwxmaXtOkSpyqVRwiMHWVHr6T1mIajKjyJyS4h6yTizAdTw==
X-Received: by 2002:a63:64e:: with SMTP id 75mr20745554pgg.342.1587476284658; 
 Tue, 21 Apr 2020 06:38:04 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:38:04 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/10] drm/lima: enable runtime pm
Date: Tue, 21 Apr 2020 21:35:51 +0800
Message-Id: <20200421133551.31481-11-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable runtime pm by default so GPU suspend when idle
for 200ms. This value can be changed by
autosuspend_delay_ms in device's power sysfs dir.

On Allwinner H3 lima_device_resume takes ~40us and
lima_device_suspend takes ~20us.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c   | 21 ++++++++++++----
 drivers/gpu/drm/lima/lima_sched.c | 41 +++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 639d1cd3268a..aadddf0fd6f0 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -405,6 +405,12 @@ static int lima_pdev_probe(struct platform_device *pdev)
 		goto err_out2;
 	}
 
+	pm_runtime_set_active(ldev->dev);
+	pm_runtime_mark_last_busy(ldev->dev);
+	pm_runtime_set_autosuspend_delay(ldev->dev, 200);
+	pm_runtime_use_autosuspend(ldev->dev);
+	pm_runtime_enable(ldev->dev);
+
 	/*
 	 * Register the DRM device with the core and the connectors with
 	 * sysfs.
@@ -413,17 +419,16 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out3;
 
-	platform_set_drvdata(pdev, ldev);
-
 	if (sysfs_create_bin_file(&ldev->dev->kobj, &lima_error_state_attr))
 		dev_warn(ldev->dev, "fail to create error state sysfs\n");
 
 	return 0;
 
 err_out3:
-	lima_device_fini(ldev);
-err_out2:
+	pm_runtime_disable(ldev->dev);
 	lima_devfreq_fini(ldev);
+err_out2:
+	lima_device_fini(ldev);
 err_out1:
 	drm_dev_put(ddev);
 err_out0:
@@ -437,10 +442,16 @@ static int lima_pdev_remove(struct platform_device *pdev)
 	struct drm_device *ddev = ldev->ddev;
 
 	sysfs_remove_bin_file(&ldev->dev->kobj, &lima_error_state_attr);
-	platform_set_drvdata(pdev, NULL);
+
 	drm_dev_unregister(ddev);
+
+	/* stop autosuspend to make sure device is in active state */
+	pm_runtime_set_autosuspend_delay(ldev->dev, -1);
+	pm_runtime_disable(ldev->dev);
+
 	lima_devfreq_fini(ldev);
 	lima_device_fini(ldev);
+
 	drm_dev_put(ddev);
 	lima_sched_slab_fini();
 	return 0;
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index eb46db0717cd..a15fd037ded7 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -4,6 +4,7 @@
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/pm_runtime.h>
 
 #include "lima_devfreq.h"
 #include "lima_drv.h"
@@ -194,13 +195,36 @@ static struct dma_fence *lima_sched_dependency(struct drm_sched_job *job,
 	return NULL;
 }
 
+static int lima_pm_busy(struct lima_device *ldev)
+{
+	int ret;
+
+	/* resume GPU if it has been suspended by runtime PM */
+	ret = pm_runtime_get_sync(ldev->dev);
+	if (ret < 0)
+		return ret;
+
+	lima_devfreq_record_busy(&ldev->devfreq);
+	return 0;
+}
+
+static void lima_pm_idle(struct lima_device *ldev)
+{
+	lima_devfreq_record_idle(&ldev->devfreq);
+
+	/* GPU can do auto runtime suspend */
+	pm_runtime_mark_last_busy(ldev->dev);
+	pm_runtime_put_autosuspend(ldev->dev);
+}
+
 static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 {
 	struct lima_sched_task *task = to_lima_task(job);
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
+	struct lima_device *ldev = pipe->ldev;
 	struct lima_fence *fence;
 	struct dma_fence *ret;
-	int i;
+	int i, err;
 
 	/* after GPU reset */
 	if (job->s_fence->finished.error < 0)
@@ -209,6 +233,13 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	fence = lima_fence_create(pipe);
 	if (!fence)
 		return NULL;
+
+	err = lima_pm_busy(ldev);
+	if (err < 0) {
+		dma_fence_put(&fence->base);
+		return NULL;
+	}
+
 	task->fence = &fence->base;
 
 	/* for caller usage of the fence, otherwise irq handler
@@ -216,8 +247,6 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	 */
 	ret = dma_fence_get(task->fence);
 
-	lima_devfreq_record_busy(&pipe->ldev->devfreq);
-
 	pipe->current_task = task;
 
 	/* this is needed for MMU to work correctly, otherwise GP/PP
@@ -388,6 +417,7 @@ static void lima_sched_timedout_job(struct drm_sched_job *job)
 {
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
 	struct lima_sched_task *task = to_lima_task(job);
+	struct lima_device *ldev = pipe->ldev;
 
 	if (!pipe->error)
 		DRM_ERROR("lima job timeout\n");
@@ -413,7 +443,7 @@ static void lima_sched_timedout_job(struct drm_sched_job *job)
 	pipe->current_vm = NULL;
 	pipe->current_task = NULL;
 
-	lima_devfreq_record_idle(&pipe->ldev->devfreq);
+	lima_pm_idle(ldev);
 
 	drm_sched_resubmit_jobs(&pipe->base);
 	drm_sched_start(&pipe->base, true);
@@ -485,6 +515,7 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
 void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 {
 	struct lima_sched_task *task = pipe->current_task;
+	struct lima_device *ldev = pipe->ldev;
 
 	if (pipe->error) {
 		if (task && task->recoverable)
@@ -495,6 +526,6 @@ void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 		pipe->task_fini(pipe);
 		dma_fence_signal(task->fence);
 
-		lima_devfreq_record_idle(&pipe->ldev->devfreq);
+	        lima_pm_idle(ldev);
 	}
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
