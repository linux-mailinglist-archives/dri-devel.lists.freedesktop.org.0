Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22BD250851
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF406E471;
	Mon, 24 Aug 2020 18:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108D46E526;
 Mon, 24 Aug 2020 18:43:16 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id q93so77398pjq.0;
 Mon, 24 Aug 2020 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AC5ImHpMp+jWX/ACOy7SaY7mRdOd/yQkd8IlsbOtJsk=;
 b=RH9L9oVy2h913LfHW6P+XO6u/MxMzMTUUsKJBGwDeDZ9Uoa57fZQ79YUlceINIegKm
 cJ7uxcs8YDHSJGwqtSFLLOWy2gX+azFPc1o1cC/2qICmgIWp7bV7WLvZbEkdUhduGh9i
 JMUtHVmr44iTsqMBUpv22v4RVQpvoDYnFFmbLWceeO1FOEML4ttF+kMzKQ/ob4Tzi6aV
 fBCFbZT254UHAzBt1wdSzepOSQDg49je32TL2yCKf3ypfg6T6r7XY85LlHW7auDAoxH0
 VL4vS0bYuIm+n0VP/BBp9plgvmYcYWOph1jUZEqfcTQDqOEXU/51yNd01ojYzNfbH8dS
 JHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AC5ImHpMp+jWX/ACOy7SaY7mRdOd/yQkd8IlsbOtJsk=;
 b=M9LyeUjR4f7c6rNpQiMoynitBP/JbrUVLY6Xt2ggJvwns/4KTFdp+I/SDg5kTe54Yo
 1fSzP8bH9Xeglhpqbu/O+CMx7MXLgFiLGzfdqmnVBnauqpHdhc/0EI3aKyCnBHVbN5Sf
 lIwHHb5KN195ZLNA+FNNwXQJpnuAHZjd6RqNpNikNZRjEbtgZO7vupW14MADG5KZ2NS9
 aLsgwgcbt2GP0uks4YDqeP19ty3f/57mkLo4hTmvVDPeuncVOZ4w7xT9qra5Fg4u9MJ1
 6hw4Y7GRrS9hacOazVIDBp6zCN4XkEeDjUdVeGorZcIzSlGh1t0e/y3DKpDMxR5RFY3s
 sN4Q==
X-Gm-Message-State: AOAM531UzG76KIzE7sJkNqk4vxYzNz2kkqSw3mQdiNjOnZi3MIdjWXev
 aOVEObMOANC+oqEhect5A01ONcm98qZ9ZvPj
X-Google-Smtp-Source: ABdhPJx44Gr61vM4CtpKXIdAOMWPg+XX5qMK442F+uOYSHCSUwT2vUJvhYx/tuN9h9j1jJ6/5O8fSQ==
X-Received: by 2002:a17:90b:4c03:: with SMTP id
 na3mr509206pjb.29.1598294593422; 
 Mon, 24 Aug 2020 11:43:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id r186sm13557644pfr.162.2020.08.24.11.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:43:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 20/20] drm/msm: show process names in gem_describe
Date: Mon, 24 Aug 2020 11:37:54 -0700
Message-Id: <20200824183825.1778810-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>, Joerg Roedel <jroedel@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In $debugfs/gem we already show any vma(s) associated with an object.
Also show process names if the vma's address space is a per-process
address space.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c     |  2 +-
 drivers/gpu/drm/msm/msm_gem.c     | 25 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gem.h     |  5 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.c     |  8 +++++---
 drivers/gpu/drm/msm/msm_gpu.h     |  2 +-
 6 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e963f707852..7143756b7e83 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
+	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3cb7aeb93fd3..76a6c5271e57 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -842,11 +842,28 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list)
-			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
-				vma->aspace != NULL ? vma->aspace->name : NULL,
-				vma->iova, vma->mapped ? "mapped" : "unmapped",
+		list_for_each_entry(vma, &msm_obj->vmas, list) {
+			const char *name, *comm;
+			if (vma->aspace) {
+				struct msm_gem_address_space *aspace = vma->aspace;
+				struct task_struct *task =
+					get_pid_task(aspace->pid, PIDTYPE_PID);
+				if (task) {
+					comm = kstrdup(task->comm, GFP_KERNEL);
+				} else {
+					comm = NULL;
+				}
+				name = aspace->name;
+			} else {
+				name = comm = NULL;
+			}
+			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
+				name, comm ? ":" : "", comm ? comm : "",
+				vma->aspace, vma->iova,
+				vma->mapped ? "mapped" : "unmapped",
 				vma->inuse);
+			kfree(comm);
+		}
 
 		seq_puts(m, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9c573c4269cb..7b1c7a5f8eef 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -24,6 +24,11 @@ struct msm_gem_address_space {
 	spinlock_t lock; /* Protects drm_mm node allocation/removal */
 	struct msm_mmu *mmu;
 	struct kref kref;
+
+	/* For address spaces associated with a specific process, this
+	 * will be non-NULL:
+	 */
+	struct pid *pid;
 };
 
 struct msm_gem_vma {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 29cc1305cf37..80a8a266d68f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -17,6 +17,7 @@ msm_gem_address_space_destroy(struct kref *kref)
 	drm_mm_takedown(&aspace->mm);
 	if (aspace->mmu)
 		aspace->mmu->funcs->destroy(aspace->mmu);
+	put_pid(aspace->pid);
 	kfree(aspace);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 951850804d77..ac8961187a73 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -825,10 +825,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu)
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
 {
 	struct msm_gem_address_space *aspace = NULL;
-
 	if (!gpu)
 		return NULL;
 
@@ -836,8 +835,11 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu)
 	 * If the target doesn't support private address spaces then return
 	 * the global one
 	 */
-	if (gpu->funcs->create_private_address_space)
+	if (gpu->funcs->create_private_address_space) {
 		aspace = gpu->funcs->create_private_address_space(gpu);
+		if (!IS_ERR(aspace))
+			aspace->pid = get_pid(task_pid(task));
+	}
 
 	if (IS_ERR_OR_NULL(aspace))
 		aspace = msm_gem_address_space_get(gpu->aspace);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4052a18e18c2..59f26bd0fe42 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -298,7 +298,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu);
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
