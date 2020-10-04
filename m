Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B431282D19
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C380689F89;
	Sun,  4 Oct 2020 19:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA89189F89;
 Sun,  4 Oct 2020 19:21:35 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id h6so3663778pgk.4;
 Sun, 04 Oct 2020 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvgK4u82bAyvmLcb1xV4zW9ZRosaPzo7Ro9rB88uZpw=;
 b=ofZAEfvfh8t1vznoy1eMEzfJNtT51uN1eqHEdUNZZF2XCyOISMqnMSt9iGAymBkYJ6
 OReDh6nmpyaSeoep3kHHJHmvTuVVu/cT4A/Ig81/FTn9aY78ns7Af8iuMfQkvopF0Wsg
 dYzRG8fNOWbOQQoURIBzhVdMhp+ur3eGpbwlqgIRW1EesJz90TDCM8cwpoZ/KKyFmxPi
 DJnTQ+qRG0DpWj5DXS1YLfXmWxGMyB2JDh0G9ca3MCooBUBbLA5JcpQKp88956t44m6a
 M7xuso8lV3k2U61P0RypNKvWj7ihmkcIB/dLvASEkMl/axDNPx4heJF53YNzhyygy/mk
 qcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bvgK4u82bAyvmLcb1xV4zW9ZRosaPzo7Ro9rB88uZpw=;
 b=E4FmDUY9bQd4ofxwYR8bTC9AnaHaMGqILffFPBz+0jij13n+WCLWMLvAjq6OlWZj6h
 3heb5pYJ7jYUBvV2eXbSoJmBWi3pMkem8oACeBbIDFZL4z4ZGuzECyGoqEH0xDw036bD
 1mADMgFLrA1LG0PxgTXXz3wP73J+w1aYTvJdx2+Gn/Pr0q4fcXPHddxEyeo5Ol9VBRJb
 jPB7BunBkymXyfsApCPjOA4hMtj+KheqrUVeY5vdchPF5w/a75wUOIDXyfdPg/AaWRvk
 PhG9NoSAeLZ4YvW1eWkJuzd1d5R8fH9RV22Lunx075n7zK4tzpeemoV2/I0MvFbWjkMx
 4OXw==
X-Gm-Message-State: AOAM531ajjmOYedQ4ni5sGa2/A8YK9PnzBRS68E9NHVhnN5BUPPgD7Eh
 yiQtuDA6KjBYXKp0SYOVOK6Ooe8sqoe8KI5A
X-Google-Smtp-Source: ABdhPJz09/i+2Wvqqf8XiOcUyAb17zQupk0PEwwUc6Pj2OeVvWLdUTNDay5FX1WDau4Gd0Ws7QGjBA==
X-Received: by 2002:a63:d242:: with SMTP id t2mr11411995pgi.47.1601839294703; 
 Sun, 04 Oct 2020 12:21:34 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ie13sm8103444pjb.5.2020.10.04.12.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/14] drm/msm: drop struct_mutex in madvise path
Date: Sun,  4 Oct 2020 12:21:44 -0700
Message-Id: <20201004192152.3298573-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The obj->lock is sufficient for what we need.

This *does* have the implication that userspace can try to shoot
themselves in the foot by racing madvise(DONTNEED) with submit.  But
the result will be about the same if they did madvise(DONTNEED) before
the submit ioctl, ie. they might not get want they want if they race
with shrinker.  But iova fault handling is robust enough, and userspace
is only shooting it's own foot.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c          | 11 ++------
 drivers/gpu/drm/msm/msm_gem.c          |  6 ++--
 drivers/gpu/drm/msm/msm_gem.h          | 38 ++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  4 +--
 4 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e766c1f45045..d2488816ce48 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -906,14 +906,9 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
-	if (ret)
-		return ret;
-
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj) {
-		ret = -ENOENT;
-		goto unlock;
+		return -ENOENT;
 	}
 
 	ret = msm_gem_madvise(obj, args->madv);
@@ -922,10 +917,8 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		ret = 0;
 	}
 
-	drm_gem_object_put_locked(obj);
+	drm_gem_object_put(obj);
 
-unlock:
-	mutex_unlock(&dev->struct_mutex);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5e75d644ce41..9cdac4f7228c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -639,8 +639,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	mutex_lock(&msm_obj->lock);
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
 
@@ -657,7 +655,7 @@ void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-	WARN_ON(!is_purgeable(msm_obj));
+	WARN_ON(!is_purgeable(msm_obj, subclass));
 	WARN_ON(obj->import_attach);
 
 	mutex_lock_nested(&msm_obj->lock, subclass);
@@ -749,7 +747,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
-	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+	WARN_ON(msm_gem_madv(msm_obj, OBJ_LOCK_NORMAL) != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e98a8004813b..bb8aa6b1b254 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -97,18 +97,6 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 	return atomic_read(&msm_obj->active_count);
 }
 
-static inline bool is_purgeable(struct msm_gem_object *msm_obj)
-{
-	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
-	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
-			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
-}
-
-static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
-{
-	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
-}
-
 /* The shrinker can be triggered while we hold objA->lock, and need
  * to grab objB->lock to purge it.  Lockdep just sees these as a single
  * class of lock, so we use subclasses to teach it the difference.
@@ -125,6 +113,32 @@ enum msm_gem_lock {
 	OBJ_LOCK_SHRINKER,
 };
 
+/* Use this helper to read msm_obj->madv when msm_obj->lock not held: */
+static inline unsigned
+msm_gem_madv(struct msm_gem_object *msm_obj, enum msm_gem_lock subclass)
+{
+	unsigned madv;
+
+	mutex_lock_nested(&msm_obj->lock, subclass);
+	madv = msm_obj->madv;
+	mutex_unlock(&msm_obj->lock);
+
+	return madv;
+}
+
+static inline bool
+is_purgeable(struct msm_gem_object *msm_obj, enum msm_gem_lock subclass)
+{
+	return (msm_gem_madv(msm_obj, subclass) == MSM_MADV_DONTNEED) &&
+			msm_obj->sgt && !msm_obj->base.dma_buf &&
+			!msm_obj->base.import_attach;
+}
+
+static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
+{
+	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass);
 void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index c41b84a3a484..39a1b5327267 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -54,7 +54,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	mutex_lock(&priv->mm_lock);
 
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
-		if (is_purgeable(msm_obj))
+		if (is_purgeable(msm_obj, OBJ_LOCK_SHRINKER))
 			count += msm_obj->base.size >> PAGE_SHIFT;
 	}
 
@@ -84,7 +84,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
-		if (is_purgeable(msm_obj)) {
+		if (is_purgeable(msm_obj, OBJ_LOCK_SHRINKER)) {
 			msm_gem_purge(&msm_obj->base, OBJ_LOCK_SHRINKER);
 			freed += msm_obj->base.size >> PAGE_SHIFT;
 		}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
