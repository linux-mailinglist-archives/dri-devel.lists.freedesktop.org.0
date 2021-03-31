Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425AC350A03
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 00:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DCB6EB92;
	Wed, 31 Mar 2021 22:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4306EB8E;
 Wed, 31 Mar 2021 22:13:13 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id l76so276925pga.6;
 Wed, 31 Mar 2021 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sYnXbCaJ1X4N5krOujp9YshPiKe4TdK5L4EckjnzvM=;
 b=pwz88OBvYt2br0+b4+cotoAWsMgFjyx3D4xp9+ifNTL1xRSNFPbHvWZ8KAB1PYzOMi
 GNKVl+FwYiNBcQCYTj1sT6kYGsuz/KDsJH16fWxVhkVXWx6pt350mv+9MsWSWumunP0b
 uybmKhMWN1+IOWTTBGzWxcfivjlLAx7l7ADtaoDByCVO1ORsnQJBOzxPkGM6v4cfExUN
 hjciKyFjSDyRvItdTtd6NwuBviTWOVBQSNv6Qnr7EM3q3CMC6hbp1gTXW0TxwbUlS+H9
 6xl3tzhGDh7KrWwNRo6EGlJ1hUPB+S8C7qSg7jMsr0xhKG1IEK/6nnQGIwjsXKEv57yY
 WdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sYnXbCaJ1X4N5krOujp9YshPiKe4TdK5L4EckjnzvM=;
 b=LjPG7E73Znc1tJY61J3bdZc5CYYlYm9RUIO94LW11kZXntHubKjIObuRbz8CHrhTuR
 OE08APlsPpV9gEgs3/3+G1Y2HBV5obMfIBmMjOqum0npL8lItoP6HrMUMtqCSf5OkPsL
 2wBCIA4DKnyP+BEoOAGRsu4UQxlNZkMG4gu3KkifO6JMLIPKx02dbX3qwhH9LOMfKQlM
 4MrkThMMe7SBrzFiZedh2LAMM0pSy2/dZNHCWOP0BVO8+JYg8FTeQEeNbXQ+9FB+nHJV
 LunqvQjl0Q06Ho1Zo4IXr8b2t/mn7Hb9cJfHxNGXGG5VyeG3PcT0CFVR2jkCD7Qg6kvh
 s7IQ==
X-Gm-Message-State: AOAM530eVGA7iJWikBmL1wodNlMi2A4D3MXkkQ21HhxSyVtmEjlJr5bG
 PqRhq03RSFcECHnkOfSCiv9Eh46WbfSi4Q==
X-Google-Smtp-Source: ABdhPJzURWwRi4NYH6E1auWnJvO22WQV0NPISUQDNJ1JW9OdAVw0kbzCDQLQk8WIZ/XQyzgA+QBtpA==
X-Received: by 2002:aa7:9a95:0:b029:1f3:4169:ccf2 with SMTP id
 w21-20020aa79a950000b02901f34169ccf2mr4811338pfi.14.1617228791924; 
 Wed, 31 Mar 2021 15:13:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w15sm3096114pfn.84.2021.03.31.15.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 15:13:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
Date: Wed, 31 Mar 2021 15:16:27 -0700
Message-Id: <20210331221630.488498-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
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

When the system is under heavy memory pressure, we can end up with lots
of concurrent calls into the shrinker.  Keeping a running tab on what we
can shrink avoids grabbing a lock in shrinker->count(), and avoids
shrinker->scan() getting called when not profitable.

Also, we can keep purged objects in their own list to avoid re-traversing
them to help cut down time in the critical section further.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c          |  1 +
 drivers/gpu/drm/msm/msm_drv.h          |  2 ++
 drivers/gpu/drm/msm/msm_gem.c          | 16 +++++++++++--
 drivers/gpu/drm/msm/msm_gem.h          | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 17 +-------------
 5 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f9fa0189a07..3462b0ea14c6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -476,6 +476,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
+	INIT_LIST_HEAD(&priv->inactive_purged);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a1264cfcac5e..3ead5755f695 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -188,6 +188,8 @@ struct msm_drm_private {
 	 */
 	struct list_head inactive_willneed;  /* inactive + !shrinkable */
 	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
+	struct list_head inactive_purged;    /* inactive +  purged */
+	int shrinkable_count;                /* write access under mm_lock */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9d10739c4eb2..74a92eedc992 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -719,6 +719,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
+	mark_unpurgable(msm_obj);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
@@ -790,6 +791,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	might_sleep();
 	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+	WARN_ON(msm_obj->dontneed);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
@@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	mutex_lock(&priv->mm_lock);
 	WARN_ON(msm_obj->active_count != 0);
 
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
+
 	list_del_init(&msm_obj->mm_list);
-	if (msm_obj->madv == MSM_MADV_WILLNEED)
+	if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
-	else
+	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
+		mark_purgable(msm_obj);
+	} else {
+		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
+	}
 
 	mutex_unlock(&priv->mm_lock);
 }
@@ -971,6 +981,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	mutex_lock(&priv->mm_lock);
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7a9107cf1818..0feabae75d3d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -50,6 +50,11 @@ struct msm_gem_object {
 	 */
 	uint8_t madv;
 
+	/**
+	 * Is object on inactive_dontneed list (ie. counted in priv->shrinkable_count)?
+	 */
+	bool dontneed : 1;
+
 	/**
 	 * count of active vmap'ing
 	 */
@@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
+static inline void mark_purgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (WARN_ON(msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
+	msm_obj->dontneed = true;
+}
+
+static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (WARN_ON(!msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
+	WARN_ON(priv->shrinkable_count < 0);
+	msm_obj->dontneed = false;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d5248be746f..7db8375f2430 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -14,22 +14,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct msm_gem_object *msm_obj;
-	unsigned long count = 0;
-
-	mutex_lock(&priv->mm_lock);
-
-	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
-		if (!msm_gem_trylock(&msm_obj->base))
-			continue;
-		if (is_purgeable(msm_obj))
-			count += msm_obj->base.size >> PAGE_SHIFT;
-		msm_gem_unlock(&msm_obj->base);
-	}
-
-	mutex_unlock(&priv->mm_lock);
-
-	return count;
+	return priv->shrinkable_count;
 }
 
 static unsigned long
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
