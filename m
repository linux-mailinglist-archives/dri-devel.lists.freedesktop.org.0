Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D941A382
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 01:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8BA6E051;
	Mon, 27 Sep 2021 23:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308E86E04B;
 Mon, 27 Sep 2021 23:00:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id q23so17225475pfs.9;
 Mon, 27 Sep 2021 16:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8u5UvW/bs2AG/23Wc+qj287W4ZDu/GIHbSg6LDpE3s=;
 b=LdZ2iVzgYEHv5fZiJktawsL/sPM7CD7eXdBLfDl1rSPdkNceGh9gL5Wul/rUWfaFrP
 9LkjyvUIcOc+5L9N4Pajg0/7UW9omPLPciHUL+h+5CvFyct44LniQEM9GwXDqJq+2elO
 QUip93YzU8x5zZhNdNj3vr1lcUm5syAsQ8q6tLy/2P431eHsMlWL5m7HJ8oTRLgl3eha
 8E79JKAB9wLShfFdK1g/4yyEfAbkjhO86wQ5xRGCIE2oHFcdxIssGl15QYw4m1+52+7V
 dzqdHvjCDjkxEGivd54cjNU+GoErtA5DKXWcq71Bmc8uCnlr8fgu/WB5sHlrgP5foRgr
 bg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8u5UvW/bs2AG/23Wc+qj287W4ZDu/GIHbSg6LDpE3s=;
 b=m0h9lxxTd136AlB/VTOwwsXhW4jmsyJD2LV2iZ+fDP0tn9pmNR40yq8ngmZ5T34ExW
 6B4DafBTbkk91SIxa5ElkOgZsxxEub1/BZ12IcDRz9/5XN+IXrUYHPCMHxaR7crDqvNi
 Pr791XJgmov50mXZoGDZg4cqLPJi9r3lLi5KbY4kG2OHsYW8Ya2NXLNQN06XpJx7TeRW
 xgGVLMNyXdrUW+8K1whsB/7fnc2C4TO2TL+QtakLjdj/WUlHnH7ufOhAdUhKWrQYvMCX
 6boubTOGAvegIm7ykv7fenn6UBWXMYkozbxb5hsDCuvzdG3g2OFEHoUkxFq08N095Efm
 hp+w==
X-Gm-Message-State: AOAM5325GnbcvGkcvn73Mm4A5xaS/dWyvOinL+uuAoPcVfjMaeu726dC
 l/cje4RxG0Ul07HzciGHCJB2O3Ben84=
X-Google-Smtp-Source: ABdhPJzUNjAmApUqj/61/f/TyKtVJu2imw/JbkcuRNum1JG6XcKuaUX116zHdaYeYmoW55c0fEmHtg==
X-Received: by 2002:a62:6d07:0:b0:446:c141:7d2d with SMTP id
 i7-20020a626d07000000b00446c1417d2dmr2363539pfc.28.1632783618903; 
 Mon, 27 Sep 2021 16:00:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id v7sm17840567pff.195.2021.09.27.16.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 16:00:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Add hrtimer + kthread_work helper
Date: Mon, 27 Sep 2021 16:04:53 -0700
Message-Id: <20210927230455.1066297-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

Before open-coding this a 2nd time, add a helper.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 21 ++++++---------------
 drivers/gpu/drm/msm/msm_drv.c    | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h    |  3 +--
 4 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index fab09e7c6efc..27c9ae563f2f 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -116,20 +116,10 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	trace_msm_atomic_async_commit_finish(crtc_mask);
 }
 
-static enum hrtimer_restart msm_atomic_pending_timer(struct hrtimer *t)
-{
-	struct msm_pending_timer *timer = container_of(t,
-			struct msm_pending_timer, timer);
-
-	kthread_queue_work(timer->worker, &timer->work);
-
-	return HRTIMER_NORESTART;
-}
-
 static void msm_atomic_pending_work(struct kthread_work *work)
 {
 	struct msm_pending_timer *timer = container_of(work,
-			struct msm_pending_timer, work);
+			struct msm_pending_timer, work.work);
 
 	msm_atomic_async_commit(timer->kms, timer->crtc_idx);
 }
@@ -139,8 +129,6 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 {
 	timer->kms = kms;
 	timer->crtc_idx = crtc_idx;
-	hrtimer_init(&timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	timer->timer.function = msm_atomic_pending_timer;
 
 	timer->worker = kthread_create_worker(0, "atomic-worker-%d", crtc_idx);
 	if (IS_ERR(timer->worker)) {
@@ -149,7 +137,10 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		return ret;
 	}
 	sched_set_fifo(timer->worker->task);
-	kthread_init_work(&timer->work, msm_atomic_pending_work);
+
+	msm_hrtimer_work_init(&timer->work, timer->worker,
+			      msm_atomic_pending_work,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
 
 	return 0;
 }
@@ -258,7 +249,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 			vsync_time = kms->funcs->vsync_time(kms, async_crtc);
 			wakeup_time = ktime_sub(vsync_time, ms_to_ktime(1));
 
-			hrtimer_start(&timer->timer, wakeup_time,
+			msm_hrtimer_queue_work(&timer->work, wakeup_time,
 					HRTIMER_MODE_ABS);
 		}
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 938765ad7109..624078b3adf2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -200,6 +200,35 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 or)
 	msm_writel(val | or, addr);
 }
 
+static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
+{
+	struct msm_hrtimer_work *work = container_of(t,
+			struct msm_hrtimer_work, timer);
+
+	kthread_queue_work(work->worker, &work->work);
+
+	return HRTIMER_NORESTART;
+}
+
+void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
+			    ktime_t wakeup_time,
+			    enum hrtimer_mode mode)
+{
+	hrtimer_start(&work->timer, wakeup_time, mode);
+}
+
+void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
+			   struct kthread_worker *worker,
+			   kthread_work_func_t fn,
+			   clockid_t clock_id,
+			   enum hrtimer_mode mode)
+{
+	hrtimer_init(&work->timer, clock_id, mode);
+	work->timer.function = msm_hrtimer_worktimer;
+	work->worker = worker;
+	kthread_init_work(&work->work, fn);
+}
+
 static irqreturn_t msm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..de062450add4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -488,6 +488,28 @@ void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 void msm_rmw(void __iomem *addr, u32 mask, u32 or);
 
+/**
+ * struct msm_hrtimer_work - a helper to combine an hrtimer with kthread_work
+ *
+ * @timer: hrtimer to control when the kthread work is triggered
+ * @work:  the kthread work
+ * @worker: the kthread worker the work will be scheduled on
+ */
+struct msm_hrtimer_work {
+	struct hrtimer timer;
+	struct kthread_work work;
+	struct kthread_worker *worker;
+};
+
+void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
+			    ktime_t wakeup_time,
+			    enum hrtimer_mode mode);
+void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
+			   struct kthread_worker *worker,
+			   kthread_work_func_t fn,
+			   clockid_t clock_id,
+			   enum hrtimer_mode mode);
+
 struct msm_gpu_submitqueue;
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index de2bc3467bb5..6a42b819abc4 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -136,8 +136,7 @@ struct msm_kms;
  * shortly before vblank to flush pending async updates.
  */
 struct msm_pending_timer {
-	struct hrtimer timer;
-	struct kthread_work work;
+	struct msm_hrtimer_work work;
 	struct kthread_worker *worker;
 	struct msm_kms *kms;
 	unsigned crtc_idx;
-- 
2.31.1

