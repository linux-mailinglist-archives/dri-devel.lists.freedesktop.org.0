Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE14292FB9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850936EAA0;
	Mon, 19 Oct 2020 20:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7ED6EAA0;
 Mon, 19 Oct 2020 20:45:43 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t18so434363plo.1;
 Mon, 19 Oct 2020 13:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=heNnLATWWWZ7SExL62Bdg0BvXOx79+g5dVu5lFw7nAE=;
 b=cPdWqqA+q9J617UXy1CtehpGWRzBmdxD9pwj+TufvgDL2pCVBVuXdytjYDdayd9d56
 /OD/dS1jTghH0XVEFFCVo5gNhHbUdh1b1V9d4Uof7RwPWeku7jaDeGKAWStQeiw1VhQH
 pMBD9vRXMcUTL9UNb+xUXh/g/EpzNlDJhMx7E9JNEwPQKdHvRDMf47qZvWlAaOJuFcvH
 a93V+1RguqjDKuzxYAGFIrGQGp6gqCK7O+6g8/5JYq57nZWBdTdPQQOdOt9E0D40YjFH
 x3xkW4BcRd4TdvKggd1rQTdjSK4LXIkLSLNwDOOyscWstlPlWXmIeDfI/0YcNDbfCNmj
 zDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=heNnLATWWWZ7SExL62Bdg0BvXOx79+g5dVu5lFw7nAE=;
 b=ikzpfcylaaWdwbfdHuBje41S5WqKZR7PFfMGrDtWP6lnKkQdSnwCYnjHjh6xGFLzf9
 GhBupDfheMvXVUL9sCBFevUie29sid8f/RvMiDjDxwh2cQoivCfaVy5ZVdUO76zphzCk
 GzaujYuvISHEp9rIoUBshLDw3pAYRP+CX4n+ONQ/2N3AbnFsHsQWHoRAGnXtAITjsR/+
 YE6rXyo6GyhnkZXbf5nbvbYC/xecPZ/stP9ZgtpNvYpzS8kldnTwqV7xwO2kSu7A5iyj
 AbpWT0661GXy0x0nHluObz0DYotdZeTSbvR+BOyDZzGJyCGzcBzs7tJ6tengseQNzQho
 T2qA==
X-Gm-Message-State: AOAM532+YMsDJHNyLjPzzlX2WRZ9esDSWrovaJOkSbGgKihKOfO4dmSS
 lu4gVqBaQdFNZxvG13oC9XtQLp1I0PvVww==
X-Google-Smtp-Source: ABdhPJxKfRVbe06HVzfhNhHxlfx+9V1bH7przPUm2ipBmERFnvcD/Zo2UFNehmDliVI8xcU24nOpHw==
X-Received: by 2002:a17:90a:8c17:: with SMTP id
 a23mr1203055pjo.112.1603140342852; 
 Mon, 19 Oct 2020 13:45:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 az18sm332262pjb.35.2020.10.19.13.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/23] drm/msm/gem: Move locking in shrinker path
Date: Mon, 19 Oct 2020 13:46:07 -0700
Message-Id: <20201019204636.139997-7-robdclark@gmail.com>
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

Move grabbing the bo lock into shrinker, with a msm_gem_trylock() to
skip over bo's that are already locked.  This gets rid of the nested
lock classes.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 24 +++++----------------
 drivers/gpu/drm/msm/msm_gem.h          | 29 ++++++++++----------------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 27 +++++++++++++++++-------
 3 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e0d8d739b068..1195847714ba 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -17,8 +17,6 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
-static void msm_gem_vunmap_locked(struct drm_gem_object *obj);
-
 
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
@@ -693,20 +691,19 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	return (madv != __MSM_MADV_PURGED);
 }
 
-void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
+void msm_gem_purge(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
-	mutex_lock_nested(&msm_obj->lock, subclass);
-
 	put_iova(obj);
 
-	msm_gem_vunmap_locked(obj);
+	msm_gem_vunmap(obj);
 
 	put_pages(obj);
 
@@ -724,11 +721,9 @@ void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
 			0, (loff_t)-1);
-
-	msm_gem_unlock(obj);
 }
 
-static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
+void msm_gem_vunmap(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
@@ -741,15 +736,6 @@ static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }
 
-void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-
-	mutex_lock_nested(&msm_obj->lock, subclass);
-	msm_gem_vunmap_locked(obj);
-	msm_gem_unlock(obj);
-}
-
 /* must be called before _move_to_active().. */
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive)
@@ -986,7 +972,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
-		msm_gem_vunmap_locked(obj);
+		msm_gem_vunmap(obj);
 		put_pages(obj);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d55d5401a2d2..c5232b8da794 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -162,6 +162,13 @@ msm_gem_lock(struct drm_gem_object *obj)
 	mutex_lock(&msm_obj->lock);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	return mutex_trylock_recursive(&msm_obj->lock) == MUTEX_TRYLOCK_SUCCESS;
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
@@ -190,6 +197,7 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
 			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
@@ -197,27 +205,12 @@ static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 {
+	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
-/* The shrinker can be triggered while we hold objA->lock, and need
- * to grab objB->lock to purge it.  Lockdep just sees these as a single
- * class of lock, so we use subclasses to teach it the difference.
- *
- * OBJ_LOCK_NORMAL is implicit (ie. normal mutex_lock() call), and
- * OBJ_LOCK_SHRINKER is used by shrinker.
- *
- * It is *essential* that we never go down paths that could trigger the
- * shrinker for a purgable object.  This is ensured by checking that
- * msm_obj->madv == MSM_MADV_WILLNEED.
- */
-enum msm_gem_lock {
-	OBJ_LOCK_NORMAL,
-	OBJ_LOCK_SHRINKER,
-};
-
-void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass);
-void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass);
+void msm_gem_purge(struct drm_gem_object *obj);
+void msm_gem_vunmap(struct drm_gem_object *obj);
 void msm_gem_free_work(struct work_struct *work);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 482576d7a39a..2dc0ffa925b4 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -52,8 +52,11 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 		return 0;
 
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_purgeable(msm_obj))
 			count += msm_obj->base.size >> PAGE_SHIFT;
+		msm_gem_unlock(&msm_obj->base);
 	}
 
 	if (unlock)
@@ -78,10 +81,13 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_purgeable(msm_obj)) {
-			msm_gem_purge(&msm_obj->base, OBJ_LOCK_SHRINKER);
+			msm_gem_purge(&msm_obj->base);
 			freed += msm_obj->base.size >> PAGE_SHIFT;
 		}
+		msm_gem_unlock(&msm_obj->base);
 	}
 
 	if (unlock)
@@ -107,15 +113,20 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		return NOTIFY_DONE;
 
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+		if (!msm_gem_trylock(&msm_obj->base))
+			continue;
 		if (is_vunmapable(msm_obj)) {
-			msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKER);
-			/* since we don't know any better, lets bail after a few
-			 * and if necessary the shrinker will be invoked again.
-			 * Seems better than unmapping *everything*
-			 */
-			if (++unmapped >= 15)
-				break;
+			msm_gem_vunmap(&msm_obj->base);
+			unmapped++;
 		}
+		msm_gem_unlock(&msm_obj->base);
+
+		/* since we don't know any better, lets bail after a few
+		 * and if necessary the shrinker will be invoked again.
+		 * Seems better than unmapping *everything*
+		 */
+		if (++unmapped >= 15)
+			break;
 	}
 
 	if (unlock)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
