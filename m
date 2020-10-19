Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E0293043
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 23:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55E6EAD4;
	Mon, 19 Oct 2020 21:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7E6EAD3;
 Mon, 19 Oct 2020 21:09:47 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b19so472429pld.0;
 Mon, 19 Oct 2020 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCZ1KWvdDSxD2uHRX+9E2D0ZqwsYUoJfE7/jZEJ9F84=;
 b=oJqXKuB+GpDFpBUtfQqyDcZd3u0jtcQyEIVN7RTXzTAgfz1ZS/oxc63ht0+tQyP8Af
 GBkY1VoPfuAtck/Sl6PH8gGimU7gLvFGCvouWsDw/3sf/bLmuyqAePmo6LVRFKA8J+vH
 BBOJmKlIwo3wrxdtrmNJORS0t1FbHDB5JJtzQBPGNUW6DOzmSumZTU4AHnVQ2+mrUyO+
 1nZM90t08iOxlbV//xoXRL9d9R1QtoUCfr7fSUcgHwrnhtzeiHrLfx+jSpRoUbcUrvct
 6a3TNA5GWbBYbQQSzHMDndPyTHizyzf8/15hVaFbC7wz1dFnH+a8LN4FJlmrB+opTb3c
 hcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCZ1KWvdDSxD2uHRX+9E2D0ZqwsYUoJfE7/jZEJ9F84=;
 b=EQpekhBEVL/0OD8OeeM8XtKleUdxuBfU0tI5vZkdVpbTUAzQveGLdgBG1KuPLEtNS/
 Tgoc8KE8zlNOXDUBquP0oQDYwRMuAf/zw4M/FQnAZ+K7yqx12Xc78sai69Sz1ki8BHzB
 9ZmelAawHGfjaDZHAf+BeqV4GMfknqofFK40QlYfzCDRnGqJA/rSAt3NFpi6L06V+kCq
 uvzU8vibOh6UPCdTmPr2Xk6673v04OEZ8FNKsaj/xaAolf9n2kjDVeBHvRguKm/YRVbU
 axt3vdjnVmkflXZGAFnG3VNHQwzHUK/A/F58G6QccXWw2QGoR2r+lcIdw3Z9j8Ywwlpr
 9XNw==
X-Gm-Message-State: AOAM533IqCQCsjtv8GM/IKA2cFRE8yxs8O935TfcOGiQt2RwW71JYsMF
 0gZC7VY4etAuHlhOroiV1f1rhHXKfsxF9g==
X-Google-Smtp-Source: ABdhPJzWpwqPKhjioG+JSQHkuy6g67waQRxTx9tkp/UhMtZA3wLeVAOcw3O8ude/cpWPukn8+DXzUg==
X-Received: by 2002:a17:90a:4e0c:: with SMTP id
 n12mr1282766pjh.78.1603141786679; 
 Mon, 19 Oct 2020 14:09:46 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z73sm669447pfc.75.2020.10.19.14.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:09:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/atomic: Convert to per-CRTC kthread_work
Date: Mon, 19 Oct 2020 14:10:53 -0700
Message-Id: <20201019211101.143327-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019211101.143327-1-robdclark@gmail.com>
References: <20201019211101.143327-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Use a SCHED_FIFO kthread_worker for async atomic commits.  We have a
hard deadline if we don't want to miss a frame.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 25 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h    |  3 ++-
 drivers/gpu/drm/msm/msm_kms.h    | 17 +++++++++++++----
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 561bfa48841c..484438f1e028 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -103,14 +103,13 @@ static enum hrtimer_restart msm_atomic_pending_timer(struct hrtimer *t)
 {
 	struct msm_pending_timer *timer = container_of(t,
 			struct msm_pending_timer, timer);
-	struct msm_drm_private *priv = timer->kms->dev->dev_private;
 
-	queue_work(priv->wq, &timer->work);
+	kthread_queue_work(timer->worker, &timer->work);
 
 	return HRTIMER_NORESTART;
 }
 
-static void msm_atomic_pending_work(struct work_struct *work)
+static void msm_atomic_pending_work(struct kthread_work *work)
 {
 	struct msm_pending_timer *timer = container_of(work,
 			struct msm_pending_timer, work);
@@ -118,14 +117,30 @@ static void msm_atomic_pending_work(struct work_struct *work)
 	msm_atomic_async_commit(timer->kms, timer->crtc_idx);
 }
 
-void msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
+int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx)
 {
 	timer->kms = kms;
 	timer->crtc_idx = crtc_idx;
 	hrtimer_init(&timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
 	timer->timer.function = msm_atomic_pending_timer;
-	INIT_WORK(&timer->work, msm_atomic_pending_work);
+
+	timer->worker = kthread_create_worker(0, "atomic-worker-%d", crtc_idx);
+	if (IS_ERR(timer->worker)) {
+		int ret = PTR_ERR(timer->worker);
+		timer->worker = NULL;
+		return ret;
+	}
+	sched_set_fifo(timer->worker->task);
+	kthread_init_work(&timer->work, msm_atomic_pending_work);
+
+	return 0;
+}
+
+void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer)
+{
+	if (timer->worker)
+		kthread_destroy_worker(timer->worker);
 }
 
 static bool can_do_async(struct drm_atomic_state *state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 5308e636a90c..f869ed67b5da 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -235,8 +235,9 @@ struct msm_pending_timer;
 
 int msm_atomic_prepare_fb(struct drm_plane *plane,
 			  struct drm_plane_state *new_state);
-void msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
+int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
+void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
 void msm_atomic_state_clear(struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 0be9e6487556..26321c13f950 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -136,7 +136,8 @@ struct msm_kms;
  */
 struct msm_pending_timer {
 	struct hrtimer timer;
-	struct work_struct work;
+	struct kthread_work work;
+	struct kthread_worker *worker;
 	struct msm_kms *kms;
 	unsigned crtc_idx;
 };
@@ -163,19 +164,27 @@ struct msm_kms {
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
-	unsigned i;
+	unsigned i, ret;
 
 	mutex_init(&kms->commit_lock);
 	kms->funcs = funcs;
 
-	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
-		msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
+	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
+		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
+		if (ret) {
+			return ret;
+		}
+	}
 
 	return 0;
 }
 
 static inline void msm_kms_destroy(struct msm_kms *kms)
 {
+	unsigned i;
+
+	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
+		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 }
 
 struct msm_kms *mdp4_kms_init(struct drm_device *dev);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
