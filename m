Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77457A4FD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7693690FF7;
	Tue, 19 Jul 2022 17:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01890FDA;
 Tue, 19 Jul 2022 17:19:01 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id f65so14053247pgc.12;
 Tue, 19 Jul 2022 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Nc8381KvCAKtcJgWAO7GB/O/Xk1BB4fgkOydTh0/AI=;
 b=gt2tQwC5bzf/qcbScBJr6Zme3YEkkMDqsRBB+9qiT87SxE5UpI/cw4fDADwqQLzBCp
 QQlOUoFGo4A3nKbM38qu0s02N2bd+nKkcd1Iv5dkuSnaMyT+syetA474yDliMMIqDsC6
 l6cNNIxg1cJ+F/sz8VlS6et/UrMCF+KuTiMvh5s9yZHhv11pobWJBDygnVsHEi47RD8y
 3OxBGnlb5rSUt4tCSyJG2v8wkrz6FUsLubi1rSD1yC/Q1F6voRsJwmpa5bUsRT0x/H9T
 4deUrPoyKP3XbihbYYAMq2jqpAPPJOZMLbEeBjMf7Tch/fFt6PEQ68/51yQRhRZvlMor
 cndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Nc8381KvCAKtcJgWAO7GB/O/Xk1BB4fgkOydTh0/AI=;
 b=aAbVHtYic7cUDJ2asM9cxcNK6BW0SfBYfFveAbbSFBM+0QF1JqizGFvymVJeYgzb1c
 ax/yCincFeVhrKM00BofwD2b8m2pwfATLMG4Hn6oz9IbI5D9iJS6ylFtSo1N6IVm7Wq8
 nSkpC5PgCceBVfweMZTSi9/CVSFAQnp03RsmN1fyL4ZPJroGJnW9wWJifRE/bCQy+WtH
 RQJomPDvxPG53UUT3nEma5svP0/NcCqnjr/2y2ZR0/39n6zD472LG+cziP5h1BJOuLmN
 LNK0sq5bnsQMFzH62l9E4DcR2T+aGhq0sXAjxxU1aQ548p74dMTuIQlqWgjapP6xtgJP
 Q6Mw==
X-Gm-Message-State: AJIora97FOBT2Wj3Q+XpIoUhW6LonP1yBVv3FPEwhNRedpW9GlnlWA56
 V3DxlB4juQAv2O5pDCvwb8nrirTQba8=
X-Google-Smtp-Source: AGRyM1skM6TaEVXDz/2XoGPGh1uhTOwfqQaMiefDkdOg1gRJTJTybhtVV3/vZmJoSbyP/Jot8vJ1+g==
X-Received: by 2002:a63:8741:0:b0:419:f886:4f9d with SMTP id
 i62-20020a638741000000b00419f8864f9dmr16938377pge.612.1658251139946; 
 Tue, 19 Jul 2022 10:18:59 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a627b14000000b0052ab912b0fasm11734482pfc.2.2022.07.19.10.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/13] drm/msm/gem: Remove active refcnt
Date: Tue, 19 Jul 2022 10:18:52 -0700
Message-Id: <20220719171900.289265-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

At this point the pinned refcnt is sufficient, and the shrinker is
already prepared to encounter objects which are still active according
to fences attached to the resv.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 45 ++--------------------------
 drivers/gpu/drm/msm/msm_gem.h        | 14 ++-------
 drivers/gpu/drm/msm/msm_gem_submit.c | 22 ++------------
 3 files changed, 8 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 407b18a24dc4..209438744bab 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -734,8 +734,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	/* If the obj is inactive, we might need to move it
 	 * between inactive lists
 	 */
-	if (msm_obj->active_count == 0)
-		update_lru(obj);
+	update_lru(obj);
 
 	msm_gem_unlock(obj);
 
@@ -788,7 +787,6 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(is_unevictable(msm_obj));
 	GEM_WARN_ON(!msm_obj->evictable);
-	GEM_WARN_ON(msm_obj->active_count);
 
 	/* Get rid of any iommu mapping(s): */
 	put_iova_spaces(obj, false);
@@ -813,37 +811,6 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }
 
-void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
-
-	might_sleep();
-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
-	GEM_WARN_ON(msm_obj->dontneed);
-
-	if (msm_obj->active_count++ == 0) {
-		mutex_lock(&priv->mm_lock);
-		if (msm_obj->evictable)
-			mark_unevictable(msm_obj);
-		list_move_tail(&msm_obj->mm_list, &gpu->active_list);
-		mutex_unlock(&priv->mm_lock);
-	}
-}
-
-void msm_gem_active_put(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	might_sleep();
-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-
-	if (--msm_obj->active_count == 0) {
-		update_lru(obj);
-	}
-}
-
 static void update_lru(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
@@ -851,9 +818,6 @@ static void update_lru(struct drm_gem_object *obj)
 
 	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 
-	if (msm_obj->active_count != 0)
-		return;
-
 	mutex_lock(&priv->mm_lock);
 
 	if (msm_obj->dontneed)
@@ -926,7 +890,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	stats->all.count++;
 	stats->all.size += obj->size;
 
-	if (is_active(msm_obj)) {
+	if (msm_gem_active(obj)) {
 		stats->active.count++;
 		stats->active.size += obj->size;
 	}
@@ -954,7 +918,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	}
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08llx %p",
-			msm_obj->flags, is_active(msm_obj) ? 'A' : 'I',
+			msm_obj->flags, msm_gem_active(obj) ? 'A' : 'I',
 			obj->name, kref_read(&obj->refcount),
 			off, msm_obj->vaddr);
 
@@ -1037,9 +1001,6 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
-	/* object should not be on active list: */
-	GEM_WARN_ON(is_active(msm_obj));
-
 	put_iova_spaces(obj, true);
 
 	if (obj->import_attach) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 6fe521ccda45..420ba49bf21a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -138,7 +138,6 @@ struct msm_gem_object {
 
 	char name[32]; /* Identifier to print for the debugfs files */
 
-	int active_count;
 	int pin_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
@@ -171,8 +170,6 @@ void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
 void msm_gem_put_vaddr_locked(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
-void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
-void msm_gem_active_put(struct drm_gem_object *obj);
 bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
@@ -245,12 +242,6 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 	return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
 }
 
-static inline bool is_active(struct msm_gem_object *msm_obj)
-{
-	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
-	return msm_obj->active_count;
-}
-
 /* imported/exported objects are not purgeable: */
 static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
@@ -391,9 +382,8 @@ struct msm_gem_submit {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID	0x8000	/* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED	0x4000	/* obj lock is held */
-#define BO_ACTIVE	0x2000	/* active refcnt is held */
-#define BO_OBJ_PINNED	0x1000	/* obj (pages) is pinned and on active list */
-#define BO_VMA_PINNED	0x0800	/* vma (virtual address) is pinned */
+#define BO_OBJ_PINNED	0x2000	/* obj (pages) is pinned and on active list */
+#define BO_VMA_PINNED	0x1000	/* vma (virtual address) is pinned */
 		uint32_t flags;
 		union {
 			struct msm_gem_object *obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 16c662808522..adf358fb8e9d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -243,17 +243,13 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	if (flags & BO_OBJ_PINNED)
 		msm_gem_unpin_locked(obj);
 
-	if (flags & BO_ACTIVE)
-		msm_gem_active_put(obj);
-
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
 }
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	unsigned cleanup_flags = BO_VMA_PINNED | BO_OBJ_PINNED |
-				 BO_ACTIVE | BO_LOCKED;
+	unsigned cleanup_flags = BO_VMA_PINNED | BO_OBJ_PINNED | BO_LOCKED;
 	submit_cleanup_bo(submit, i, cleanup_flags);
 
 	if (!(submit->bos[i].flags & BO_VALID))
@@ -358,18 +354,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	submit->valid = true;
 
-	/*
-	 * Increment active_count first, so if under memory pressure, we
-	 * don't inadvertently evict a bo needed by the submit in order
-	 * to pin an earlier bo in the same submit.
-	 */
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-
-		msm_gem_active_get(obj, submit->gpu);
-		submit->bos[i].flags |= BO_ACTIVE;
-	}
-
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		struct msm_gem_vma *vma;
@@ -521,7 +505,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED | BO_ACTIVE;
+		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -540,7 +524,7 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 
 		msm_gem_lock(obj);
 		/* Note, VMA already fence-unpinned before submit: */
-		submit_cleanup_bo(submit, i, BO_OBJ_PINNED | BO_ACTIVE);
+		submit_cleanup_bo(submit, i, BO_OBJ_PINNED);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
-- 
2.36.1

