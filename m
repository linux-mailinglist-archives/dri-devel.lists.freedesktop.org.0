Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00E8292FC0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADDD6EA79;
	Mon, 19 Oct 2020 20:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AB36EAA8;
 Mon, 19 Oct 2020 20:45:51 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id lw2so467885pjb.3;
 Mon, 19 Oct 2020 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6HwhZIRiDDg4MAhg4l7o5fOiIxWG5h//YWiYG/NHwI=;
 b=Qi3EEB0rT7iBNy3/EeF7SHg3FV9UI9fZwTdvjf9WASTT+XvP56VXlknaxN61aD8CPG
 mW46TEHp8vZ/BZ2OpAryj4dUw4/Rfei2z+hx1G3Xe4tdnALL4MpqUhtzl0ZWCT0Pgy8B
 nn1pSCwDqrBp0eS1pPYQNi46f4hs73Jc4kOFDWC0uw7n8jD66lUPd87fJSh/WOARrH4P
 iLjAr8FG/hBFbz+qeLHXPzH8+oCgdD16eHvwyzDM6/50K4ZBqOm9ELqhkidcndz6MhTs
 s2RzVonjMgwadVsb6XcExH839085/+E8+uKVdjgGgDhBC9l1TxvuUHfK4yd0MLao8mvm
 5UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6HwhZIRiDDg4MAhg4l7o5fOiIxWG5h//YWiYG/NHwI=;
 b=UIr0Dl8geO443lnSOV4KaMmFGRops5ueUEp/oVjpCohZPUaU9fIyq3H/kcxSm+erJl
 xQEM4A+U95UF0EHyVjV/LOfoZnU9hKZl44kld/i1MvsTyg2oVLERaKkmneVrfMtPbmh4
 XuAdNHu7rZz284EUyF1Z6mbiFupjwp+jbZbOXM0aWEO1tuF4bA0T96RsLeS48fflub8z
 bU59qJCYSgHdJ0JZJN28ZQO24a9u7xmzejW4eb25dGDLnrtYfudwdEHV7cxgr1UkTmEC
 J4yR72t99sE8H+RvUZeJM0XluMOrpuaw0+T5lq9Eg6fLLmHGMxehLUaXpL2KP0GGWxmB
 dB5g==
X-Gm-Message-State: AOAM530vPFcL9f/+gNaFGyngT2pV7GUwTEKHQTSY7b9egjfqvIgk5xks
 HF4EjTJDkADLci9cYSTGHz0KIgWWZ6S38w==
X-Google-Smtp-Source: ABdhPJx8MFIA2RSrbfU9YKZCefXDzRsQoLGiHC1GD4EHQ+7wMBfcZ/2foeAPDmlYD5TXsqccpVOUhA==
X-Received: by 2002:a17:902:b68d:b029:d3:e6e4:3d99 with SMTP id
 c13-20020a170902b68db02900d3e6e43d99mr1672814pls.62.1603140350092; 
 Mon, 19 Oct 2020 13:45:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z16sm611183pfr.116.2020.10.19.13.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/23] drm/msm/gem: Switch over to obj->resv for locking
Date: Mon, 19 Oct 2020 13:46:10 -0700
Message-Id: <20201019204636.139997-10-robdclark@gmail.com>
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

This also converts the special msm_gem_get_vaddr_active() to expect the
lock to already be held.  There are two call-sites for this, one already
has the lock held, so it is more straightforward to just open-code the
locking for the other caller.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 12 ++----------
 drivers/gpu/drm/msm/msm_gem.h        | 16 +++++-----------
 drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++++----
 drivers/gpu/drm/msm/msm_gpu.c        | 14 ++++++++++++--
 drivers/gpu/drm/msm/msm_rd.c         |  2 +-
 5 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1195847714ba..6abcf9fe480d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -644,13 +644,7 @@ void *msm_gem_get_vaddr(struct drm_gem_object *obj)
  */
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj)
 {
-	void *ret;
-
-	msm_gem_lock(obj);
-	ret = get_vaddr(obj, __MSM_MADV_PURGED);
-	msm_gem_unlock(obj);
-
-	return ret;
+	return get_vaddr(obj, __MSM_MADV_PURGED);
 }
 
 void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
@@ -976,9 +970,9 @@ static void free_object(struct msm_gem_object *msm_obj)
 		put_pages(obj);
 	}
 
+	msm_gem_unlock(obj);
 	drm_gem_object_release(obj);
 
-	msm_gem_unlock(obj);
 	kfree(msm_obj);
 }
 
@@ -1050,8 +1044,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	if (!msm_obj)
 		return -ENOMEM;
 
-	mutex_init(&msm_obj->lock);
-
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0b7dda312992..f0608d96ef03 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -85,7 +85,6 @@ struct msm_gem_object {
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
 	struct drm_mm_node *vram_node;
-	struct mutex lock; /* Protects resources associated with bo */
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
@@ -158,36 +157,31 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 static inline void
 msm_gem_lock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	mutex_lock(&msm_obj->lock);
+	dma_resv_lock(obj->resv, NULL);
 }
 
 static inline bool __must_check
 msm_gem_trylock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_trylock_recursive(&msm_obj->lock) == MUTEX_TRYLOCK_SUCCESS;
+	return dma_resv_trylock(obj->resv);
 }
 
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_lock_interruptible(&msm_obj->lock);
+	return dma_resv_lock_interruptible(obj->resv, NULL);
 }
 
 static inline void
 msm_gem_unlock(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	mutex_unlock(&msm_obj->lock);
+	dma_resv_unlock(obj->resv);
 }
 
 static inline bool
 msm_gem_is_locked(struct drm_gem_object *obj)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return mutex_is_locked(&msm_obj->lock);
+	return dma_resv_is_locked(obj->resv);
 }
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a9422d043bfe..50ecc8455197 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -215,7 +215,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 	struct msm_gem_object *msm_obj = submit->bos[i].obj;
 
 	if (submit->bos[i].flags & BO_PINNED)
-		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
+		msm_gem_unpin_iova_locked(&msm_obj->base, submit->aspace);
 
 	if (submit->bos[i].flags & BO_LOCKED)
 		dma_resv_unlock(msm_obj->base.resv);
@@ -318,7 +318,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		uint64_t iova;
 
 		/* if locking succeeded, pin bo: */
-		ret = msm_gem_get_and_pin_iova(&msm_obj->base,
+		ret = msm_gem_get_and_pin_iova_locked(&msm_obj->base,
 				submit->aspace, &iova);
 
 		if (ret)
@@ -377,7 +377,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	/* For now, just map the entire thing.  Eventually we probably
 	 * to do it page-by-page, w/ kmap() if not vmap()d..
 	 */
-	ptr = msm_gem_get_vaddr(&obj->base);
+	ptr = msm_gem_get_vaddr_locked(&obj->base);
 
 	if (IS_ERR(ptr)) {
 		ret = PTR_ERR(ptr);
@@ -428,7 +428,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	}
 
 out:
-	msm_gem_put_vaddr(&obj->base);
+	msm_gem_put_vaddr_locked(&obj->base);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d16489d0f3..015f6b884e2e 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -326,7 +326,9 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
+		msm_gem_lock(&obj->base);
 		ptr = msm_gem_get_vaddr_active(&obj->base);
+		msm_gem_unlock(&obj->base);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -470,14 +472,22 @@ static void recover_worker(struct work_struct *work)
 			put_task_struct(task);
 		}
 
+		/* msm_rd_dump_submit() needs bo locked to dump: */
+		for (i = 0; i < submit->nr_bos; i++)
+			msm_gem_lock(&submit->bos[i].obj->base);
+
 		if (comm && cmd) {
 			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
 				gpu->name, comm, cmd);
 
 			msm_rd_dump_submit(priv->hangrd, submit,
 				"offending task: %s (%s)", comm, cmd);
-		} else
+		} else {
 			msm_rd_dump_submit(priv->hangrd, submit, NULL);
+		}
+
+		for (i = 0; i < submit->nr_bos; i++)
+			msm_gem_unlock(&submit->bos[i].obj->base);
 	}
 
 	/* Record the crash state */
@@ -784,7 +794,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
-		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
+		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index fea30e7aa9e8..659e5cc4b40a 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -333,7 +333,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 
 	rd_write_section(rd, RD_BUFFER_CONTENTS, buf, size);
 
-	msm_gem_put_vaddr(&obj->base);
+	msm_gem_put_vaddr_locked(&obj->base);
 }
 
 /* called under struct_mutex */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
