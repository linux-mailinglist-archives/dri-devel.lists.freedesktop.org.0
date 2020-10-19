Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB211292FD9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613E6EABD;
	Mon, 19 Oct 2020 20:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46236EABD;
 Mon, 19 Oct 2020 20:46:09 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x13so669748pfa.9;
 Mon, 19 Oct 2020 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvN5SUIFveAI0zNeWeKf81AuIGKhvHUdYM1O7AZtY9w=;
 b=hPmHco/U9VNlWr9x9hBn/2DTJqe0MiSOpnxHUr3h5foy0bStDdyI3asawh8+Z6TSE6
 1KO7WoRJPc1bb2NhV7AKp3nq0Ew1lK5KIWXKyjHyNQ4uXp0n6wwZF7ksc5s2eLCKMkX3
 tn3Nd/roCRU7jFayXw/pnZiSVDSbniJiifeJvRXc7SZjGM71UPQjKOzv0SeEe+nIT2mK
 XVuFobA0t3Xx9y2sUIvwVL+8iBYNVC9F3au7ZgqFnXjAEvV2mNQ+71jkvtDglv0MaLCR
 N2O+s3CsLcWKYne+zrs2zDrNAWMQmj5i7rP+7CrX5+zxMNeUUVXCHSuW/h+BoIEBLAv/
 omWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvN5SUIFveAI0zNeWeKf81AuIGKhvHUdYM1O7AZtY9w=;
 b=DzV/9XRA+kUFaFYIvfXNhwx6Yq5UUEP7a2h8iv7mPqFfedvAUm3zZ1VwmUfZtbzMm/
 kwymtfLDLG3ZLThsTR7JvVRF4c8C/nGYzaWMglXgfEUW2fqZxcdwjgPKpIprnX476htT
 P8e9icj0Ru3fY5n8b128OpeugxsKuKLlsB8Ln5qmBXuIdYcHf5wk1jvBQXEK4S5Gd9Ps
 IcjBiY0ETzKcvqRQ5sk+Lm3zapGIVYVuaqrzCb0a7MGS8dQCzn5nL8XeHDYrdjNQMgzL
 H9H1VAcb7IEPoTjTIzS40RPiuuvAoL4a36k/K4SA6X5dMbiuu7cL3OPwjKWob63x0mWv
 ufQA==
X-Gm-Message-State: AOAM532Mk5z3mC7mGJ33BiusigLId+3rOBHZzl4UZooc/MZr4WJGT9Sv
 hrK8zSVJV6NClL8STfNUwCBJ0IRJ1brYaA==
X-Google-Smtp-Source: ABdhPJwOx1HPpvbUzBgm3xEaswV42HXqlHJA/MYNvKLgxnfY+1bYkFIpmUJl4O84XKg/hDg75jHM+g==
X-Received: by 2002:a63:1805:: with SMTP id y5mr1322308pgl.174.1603140368587; 
 Mon, 19 Oct 2020 13:46:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k206sm666585pfd.126.2020.10.19.13.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 16/23] drm/msm: Refcount submits
Date: Mon, 19 Oct 2020 13:46:17 -0700
Message-Id: <20201019204636.139997-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Before we remove dev->struct_mutex from the retire path, we have to deal
with the situation of a submit retiring before the submit ioctl returns.

To deal with this, ring->submits will hold a reference to the submit,
which is dropped when the submit is retired.  And the submit ioctl path
holds it's own ref, which it drops when it is done with the submit.

Also, add to submit list *after* getting/pinning bo's, to prevent badness
in case the completed fence is corrupted, and retire_worker mistakenly
believes the submit is done too early.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.h        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7431d68ea102..7e6fb4af4964 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
 bool msm_use_mmu(struct drm_device *dev);
 
-void msm_gem_submit_free(struct msm_gem_submit *submit);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f0608d96ef03..2f289c436ddd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -213,6 +213,7 @@ void msm_gem_free_work(struct work_struct *work);
  * lasts for the duration of the submit-ioctl.
  */
 struct msm_gem_submit {
+	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
@@ -249,6 +250,18 @@ struct msm_gem_submit {
 	} bos[];
 };
 
+void __msm_gem_submit_destroy(struct kref *kref);
+
+static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
+{
+	kref_get(&submit->ref);
+}
+
+static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
+{
+	kref_put(&submit->ref, __msm_gem_submit_destroy);
+}
+
 /* helper to determine of a buffer in submit should be dumped, used for both
  * devcoredump and debugfs cmdstream dumping:
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c078b58d9c10..d784e97f233f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return NULL;
 
+	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
@@ -60,14 +61,13 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	return submit;
 }
 
-void msm_gem_submit_free(struct msm_gem_submit *submit)
+void __msm_gem_submit_destroy(struct kref *kref)
 {
+	struct msm_gem_submit *submit =
+			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
 	dma_fence_put(submit->fence);
-	spin_lock(&submit->ring->submit_lock);
-	list_del(&submit->node);
-	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -841,8 +841,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	if (ret)
-		msm_gem_submit_free(submit);
+	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 1d6f3dc3fe78..bcd9b4fa98b2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -722,7 +722,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
-	msm_gem_submit_free(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_del(&submit->node);
+	spin_unlock(&ring->submit_lock);
+
+	msm_gem_submit_put(submit);
 }
 
 static void retire_submits(struct msm_gpu *gpu)
@@ -796,10 +801,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = ++ring->seqno;
 
-	spin_lock(&ring->submit_lock);
-	list_add_tail(&submit->node, &ring->submits);
-	spin_unlock(&ring->submit_lock);
-
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
 	update_sw_cntrs(gpu);
@@ -826,6 +827,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_active_get(drm_obj, gpu);
 	}
 
+	/*
+	 * ring->submits holds a ref to the submit, to deal with the case
+	 * that a submit completes before msm_ioctl_gem_submit() returns.
+	 */
+	msm_gem_submit_get(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_add_tail(&submit->node, &ring->submits);
+	spin_unlock(&ring->submit_lock);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
