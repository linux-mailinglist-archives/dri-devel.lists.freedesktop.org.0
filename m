Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B895818F4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FB1963CE;
	Tue, 26 Jul 2022 17:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC753963C6;
 Tue, 26 Jul 2022 17:50:38 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f65so13742757pgc.12;
 Tue, 26 Jul 2022 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Nc8381KvCAKtcJgWAO7GB/O/Xk1BB4fgkOydTh0/AI=;
 b=YwNbZp5iud2bS72ealuZiJl9wSFHGsZXH5PVlJpmq1myH0uYxYqgC3fPdzv8NSLtyI
 OVIQ6BeaXH/sMlixAHd2cNC5RILFNeLJGGGwr1FLDPbWwh/hxWwxNigheiLWtsS/koIW
 GjOSQeJt738Ey/5CbDlxIAb4Xc4E9EJg4WaB8XZs25VG4MFZToKtU4eCr5OKT0Emkgu2
 bRhU7wtqr6fczpiA9NYzenUDKwAqFZsIh2EqGFJya6OlYxNelaWAb4VJirQnRDIjgvJz
 tW6kZ0PIPjdwxPiKf8nM4+U4h8UcRFxVsxj6ZijA1XRlVmo7dwn56DJRtHvFj3Df9R+o
 GoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Nc8381KvCAKtcJgWAO7GB/O/Xk1BB4fgkOydTh0/AI=;
 b=NzDdJHyg+Vlv4HoiUQgtiAILq6luB5AgWNs/1CRcWtiLsCfRdtWuTF/F2D3Q3thFhE
 SbtUiB37XJwVpjJpeHl9IsFs3Jy5gANfdh4BUKZ0nCy2ArTTEtMDsznTErnkMkq9077J
 YJjueuKsgW37ZL/T6x36lE8frQ/ZIGFU5foRPMjbA8b1SybVOQh8HvqgaMokjDVWKF7m
 sW8wk9e3mXwsqHgF6uuzDg7flJAMZi4fiHLDG1aBrNA2CQMNO//C6EtYqiLZCvfZme+f
 hmxBpE7VTl7TOzXZio1qoC4qYwX6ClxtflRXWyt1SyodNQWHPjaswZb+Jz83ytNO75c2
 q2Yg==
X-Gm-Message-State: AJIora8jJuu33NdTml6yLSZY5fM/gnUJR5iDN01zN9t9lItH072ss57l
 N2azjcLXpam0zQvWYNkjFzESe7lOY+k=
X-Google-Smtp-Source: AGRyM1tFf+CulgVeCTNfyuNvXrdRKrkTWDpy6Txt0S7v/Z3TVNPdJbCbHmpTI0QHSeYHEdPY7PcMag==
X-Received: by 2002:a05:6a00:3006:b0:52a:ca34:7e43 with SMTP id
 ay6-20020a056a00300600b0052aca347e43mr18747989pfb.10.1658857837752; 
 Tue, 26 Jul 2022 10:50:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ne16-20020a17090b375000b001f3009a5ccfsm708098pjb.54.2022.07.26.10.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/15] drm/msm/gem: Remove active refcnt
Date: Tue, 26 Jul 2022 10:50:32 -0700
Message-Id: <20220726175043.1027731-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

