Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25942974F5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045056F8F0;
	Fri, 23 Oct 2020 16:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422E26F8EC;
 Fri, 23 Oct 2020 16:50:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 10so1793103pfp.5;
 Fri, 23 Oct 2020 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/inxxNsLP/RHi0jt3kQtzdiSVyG/oJF9qir+FDcseM=;
 b=hsLeGd2HKA+sBwT2cYk7BvOcjycSvn8fR61BzoJygXTnwvt71pz3TY6gZvRNnnn5AS
 fHHiCOKREu9MdDjV17Ki2yytelTfxQav6EIq/LVZ102uJBQsVkAj9HMvfXzrACaZ6Z7t
 w/6azeOYGI9JxeipELpL/BcVs6R+wc1VpFNeHPUtOg9bmRdV8qT461rDdgHjVbp9EuYI
 WAhPU+jfYlWW9BktADmFqFJnt2DNLpr7Bn/Ghd0JlczsdoOjLBg6HuTeFuYJ6BMarUYq
 6UMkMeV0FbY9Hp000J5/st8T0JqPO0ein1EAm8hpY1NjORALt2vhIpgXuArEimUECkPb
 ziEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/inxxNsLP/RHi0jt3kQtzdiSVyG/oJF9qir+FDcseM=;
 b=fxpTAafYSunITK7TZO7U4m0+dHE0YHP1BMqBQyw68DpZyA9m8LXXLRcnnhZ60Xmlgq
 9LjGwWDZTJWuR9dbGA8WNNVp0ll17Xb8qsVFG6c+3SHxCfrSesrobb3slgZ2vhWEmjU7
 jGbo/15Cg2h6l6C841MzfSS5FJw7vbALGfdWU4DkXc0GnsDFrbMIHX1QxkQBhHARFH5I
 me8lfTVXzzuDMezuZafhc/E9gEK+5tdcHWhwWqbauDYYP+Iwk47wWDGDf88+TCMZbPod
 vptG4FcTWqHomo4iVluykfHWnbqh3+KszRXLmFXVT2eiWWjEy3UbWbmz9vuS+4FkPYo+
 HwvA==
X-Gm-Message-State: AOAM531e8h8JIUmIhunaRzKjlOUnjCgZcIjYBELQbEM3flXEWKF5uDCu
 1JLftBjp1tJvDOIOCa6sdpbrJBAH2Eg53Q==
X-Google-Smtp-Source: ABdhPJyIECV5JuG+wdj7l/Sb80evcNTjX18GWDbsijKN9hIlfFmXvSbSfDleBN+DjcRVaUBlsHzZ4A==
X-Received: by 2002:a62:5f47:0:b029:15c:e72a:4d32 with SMTP id
 t68-20020a625f470000b029015ce72a4d32mr53923pfb.67.1603471824107; 
 Fri, 23 Oct 2020 09:50:24 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ge6sm3062454pjb.29.2020.10.23.09.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/23] drm/msm/gem: Move locking in shrinker path
Date: Fri, 23 Oct 2020 09:51:07 -0700
Message-Id: <20201023165136.561680-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move grabbing the bo lock into shrinker, with a msm_gem_trylock() to
skip over bo's that are already locked.  This gets rid of the nested
lock classes.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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
index d55d5401a2d2..766ce278c74a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -162,6 +162,13 @@ msm_gem_lock(struct drm_gem_object *obj)
 	mutex_lock(&msm_obj->lock);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	return mutex_trylock(&msm_obj->lock) == 1;
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
