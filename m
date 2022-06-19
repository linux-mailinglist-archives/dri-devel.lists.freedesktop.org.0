Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F9550C82
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 20:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844DA10EB87;
	Sun, 19 Jun 2022 18:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8998610EB87;
 Sun, 19 Jun 2022 18:20:28 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id go6so3526002pjb.0;
 Sun, 19 Jun 2022 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9P6Uwhk4lhIbmks8A5vMCm1KO+jVgWZwXx0N6QZ5t04=;
 b=KQfUV5LBjddO+uv/f7u1l5J63AiboIEK8ytUCpq9/cUYGKOJ1sGRDObfK1lnKG8OWu
 jmLJqCRjO2jmK3IxiuczOD9ne08Iz5ECPAz7s9slc7TwLbcEz/d74SELfZYL3+MBAKNo
 lepVoHPvABpp6GNUx9xayCqoSq7uOiaVr2JYgAAo7kpsjWdSl7ym6X4kIBdrrUjC6IAz
 v3eN4/dd4RoGTo3ZtZw4MGGWbeAUgnB8fwDmBkygphQD0fsKaNqACT3IpmlwxFyGz6dV
 bXeKDuX1eN6oTrUJ0gQ3AbKlins1WtqFjwqGftjxGxGO8sw6oxzLDybvLpEB5WNFSuwG
 h77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9P6Uwhk4lhIbmks8A5vMCm1KO+jVgWZwXx0N6QZ5t04=;
 b=yCWEP4PeU85LZxPmz75TLqUIj4sSXZb5aDaAalFZks2nyhjPWmeB2MACXGzVXRU5zi
 IqYang8dO2632MZgkSzGzodDxBy0j36cKxQkchbW7lAXC+tp9koyaqTQ1rIXd+ld8b5W
 mCW+ZNVgJB6LH7RcR9WbvqRecmasluSq22kFd9Ixw2S0o6xLOTXICNYurIer+74MTVyq
 8Qdz9BvsqRs7zZC29JdCJ9VqIw6+2vq7OrZxeKquv4g12sIj6nmEbXkTAPinBhWuV/V0
 rt2bfRzyTy71LPzqwz+QyXF+q4NknmiW26+zCrbOSRz/xKwKzjwtGhwOLx0mDEB1sYMW
 moPw==
X-Gm-Message-State: AJIora/HBwpo0MsDmnRds+J/reY0TBIO8Q3tOwxvswMXi/ZGadyv9Tsn
 iFjxTt2UY8TgNVA5f7zhdiqAUXu4GsM=
X-Google-Smtp-Source: AGRyM1uWVAKbik9ekW7FpqyAOaegy5JFdAP5oGwFfcYBh8MY7d2kUGYkDdybN1eZtpaD3MPfqyjL5A==
X-Received: by 2002:a17:902:d707:b0:168:9a6a:936d with SMTP id
 w7-20020a170902d70700b001689a6a936dmr20099132ply.92.1655662827294; 
 Sun, 19 Jun 2022 11:20:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a637c06000000b003fbfd5e4ddcsm2551807pgc.75.2022.06.19.11.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:20:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/gem: Add LRU/shrinker helper
Date: Sun, 19 Jun 2022 11:20:35 -0700
Message-Id: <20220619182035.3545006-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a simple LRU helper to assist with driver's shrinker implementation.
It handles tracking the number of backing pages associated with a given
LRU, and provides a helper to implement shrinker_scan.

A driver can use multiple LRU instances to track objects in various
states, for example a dontneed LRU for purgeable objects, a willneed LRU
for evictable objects, and an unpinned LRU for objects without backing
pages.

All LRUs that the object can be moved between should share a single
lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
The rough idea was to have something that was usable both by GEM shmem
helper as well as drivers not using GEM shmem helpers.  It diverges from
the latest iteration of GEM shmem shrinker support[1] in a couple of
ways, mostly where I think the shmem helpers are going in the wrong
direction:

1. This tracks pages per LRU, so that count_objects does not need to do
   list iteration or acquire locks.
2. Does not acquire object_name_lock, to avoid serializing multiple
   threads hitting the shrinker more than otherwise necessary.
3. Does not track if we hit lock contention.  Without grabbing
   object_name_lock, I think this is unnecessary.  And either way it
   is probably better to let shrink_slab() move on to trying other
   shrinkers in the system.  It will generally try again afterwards
   if necessary.

The expected usage is:

static unsigned long
msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
{
	struct msm_drm_private *priv =
		container_of(shrinker, struct msm_drm_private, shrinker);
	unsigned count = priv->dontneed.count;

	if (can_swap())
		count += priv->willneed.count;

	return count;
}

static unsigned long
msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
{
	struct msm_drm_private *priv =
		container_of(shrinker, struct msm_drm_private, shrinker);
	unsigned long freed;

	freed = drm_gem_lru_scan(&priv->dontneed, sc->nr_to_scan, purge);

	if (can_swap() && freed < sc->nr_to_scan) {
		freed += drm_gem_lru_scan(&priv->willneed,
					  sc->nr_to_scan - freed,
					  evict);
	}

	return (freed > 0) ? freed : SHRINK_STOP;
}

[1] https://lore.kernel.org/all/20220526235040.678984-18-dmitry.osipenko@collabora.com/

 drivers/gpu/drm/drm_gem.c | 150 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  55 ++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..b453463a2cdf 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1274,3 +1274,153 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 	ww_acquire_fini(acquire_ctx);
 }
 EXPORT_SYMBOL(drm_gem_unlock_reservations);
+
+/**
+ * drm_gem_lru_init - initialize a LRU
+ *
+ * @lru: The LRU to initialize
+ * @lock: The lock protecting the LRU
+ */
+void
+drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
+{
+	lru->lock = lock;
+	lru->count = 0;
+	INIT_LIST_HEAD(&lru->list);
+}
+EXPORT_SYMBOL(drm_gem_lru_init);
+
+/**
+ * drm_gem_lru_move_tail - move the object to the tail of the LRU
+ *
+ * If the object is already in this LRU it will be moved to the
+ * tail.  Otherwise it will be removed from whichever other LRU
+ * it is in (if any) and moved into this LRU.
+ *
+ * @lru: The LRU to move the object into.
+ * @obj: The GEM object to move into this LRU
+ */
+void
+drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj)
+{
+	mutex_lock(lru->lock);
+	drm_gem_lru_move_tail_locked(lru, obj);
+	mutex_unlock(lru->lock);
+}
+EXPORT_SYMBOL(drm_gem_lru_move_tail);
+
+/**
+ * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
+ *
+ * If the object is already in this LRU it will be moved to the
+ * tail.  Otherwise it will be removed from whichever other LRU
+ * it is in (if any) and moved into this LRU.
+ *
+ * Call with LRU lock held.
+ *
+ * @lru: The LRU to move the object into.
+ * @obj: The GEM object to move into this LRU
+ */
+void
+drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
+{
+	WARN_ON(!mutex_is_locked(lru->lock));
+
+	if (obj->lru) {
+		obj->lru->count -= obj->size >> PAGE_SHIFT;
+		list_del(&obj->lru_node);
+	}
+
+	lru->count += obj->size >> PAGE_SHIFT;
+	list_add_tail(&obj->lru_node, &lru->list);
+}
+EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
+
+/**
+ * drm_gem_lru_scan - helper to implement shrinker.scan_objects
+ *
+ * If the shrink callback succeeds, it is expected that the driver
+ * move the object out of this LRU.
+ *
+ * If the LRU possibly contain active buffers, it is the responsibility
+ * of the shrink callback to check for this (ie. dma_resv_test_signaled())
+ * or if necessary block until the buffer becomes idle.
+ *
+ * @lru: The LRU to scan
+ * @nr_to_scan: The number of pages to try to reclaim
+ * @shrink: Callback to try to shrink/reclaim the object.
+ */
+unsigned long
+drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
+		 bool (*shrink)(struct drm_gem_object *obj))
+{
+	struct drm_gem_lru still_in_lru;
+	unsigned freed = 0;
+
+	drm_gem_lru_init(&still_in_lru, lru->lock);
+
+	mutex_lock(lru->lock);
+
+	while (freed < nr_to_scan) {
+		struct drm_gem_object *obj = list_first_entry_or_null(
+				&lru->list, typeof(*obj), lru_node);
+
+		if (!obj)
+			break;
+
+		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
+
+		/*
+		 * If it's in the process of being freed, gem_object->free()
+		 * may be blocked on lock waiting to remove it.  So just
+		 * skip it.
+		 */
+		if (!kref_get_unless_zero(&obj->refcount))
+			continue;
+
+		/*
+		 * Now that we own a reference, we can drop the lock for the
+		 * rest of the loop body, to reduce contention with other
+		 * code paths that need the LRU lock
+		 */
+		mutex_unlock(lru->lock);
+
+		/*
+		 * Note that this still needs to be trylock, since we can
+		 * hit shrinker in response to trying to get backing pages
+		 * for this obj (ie. while it's lock is already held)
+		 */
+		if (!dma_resv_trylock(obj->resv))
+			goto tail;
+
+		if (shrink(obj)) {
+			freed += obj->size >> PAGE_SHIFT;
+
+			/*
+			 * If we succeeded in releasing the object's backing
+			 * pages, we expect the driver to move moved the object
+			 * out of this LRU
+			 */
+			WARN_ON(obj->lru == &still_in_lru);
+			WARN_ON(obj->lru == lru);
+		}
+
+		dma_resv_unlock(obj->resv);
+
+tail:
+		drm_gem_object_put(obj);
+		mutex_lock(lru->lock);
+	}
+
+	/*
+	 * Move objects we've skipped over out of the temporary still_in_lru
+	 * back into this LRU
+	 */
+	list_splice_tail(&still_in_lru.list, &lru->list);
+	lru->count += still_in_lru.count;
+
+	mutex_unlock(lru->lock);
+
+	return freed;
+}
+EXPORT_SYMBOL(drm_gem_lru_scan);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 87cffc9efa85..f9310d0b997a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -174,6 +174,41 @@ struct drm_gem_object_funcs {
 	const struct vm_operations_struct *vm_ops;
 };
 
+/**
+ * struct drm_gem_lru - A simple LRU helper
+ *
+ * A helper for tracking GEM objects in a given state, to aid in
+ * driver's shrinker implementation.  Tracks the count of pages
+ * for lockless &shrinker.count_objects, and provides
+ * &drm_gem_lru_scan for driver's &shrinker.scan_objects
+ * implementation.
+ */
+struct drm_gem_lru {
+	/**
+	 * @lock:
+	 *
+	 * Lock protecting movement of GEM objects between LRUs.  All
+	 * LRUs that the object can move between should be protected
+	 * by the same lock.
+	 */
+	struct mutex *lock;
+
+	/**
+	 * @count:
+	 *
+	 * The total number of backing pages of the GEM objects in
+	 * this LRU.
+	 */
+	long count;
+
+	/**
+	 * @list:
+	 *
+	 * The LRU list.
+	 */
+	struct list_head list;
+};
+
 /**
  * struct drm_gem_object - GEM buffer object
  *
@@ -312,6 +347,20 @@ struct drm_gem_object {
 	 *
 	 */
 	const struct drm_gem_object_funcs *funcs;
+
+	/**
+	 * @lru_node:
+	 *
+	 * List node in a &drm_gem_lru.
+	 */
+	struct list_head lru_node;
+
+	/**
+	 * @lru:
+	 *
+	 * The current LRU list that the GEM object is on.
+	 */
+	struct drm_gem_lru *lru;
 };
 
 /**
@@ -420,4 +469,10 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
+void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
+void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
+void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
+unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
+			       bool (*shrink)(struct drm_gem_object *obj));
+
 #endif /* __DRM_GEM_H__ */
-- 
2.36.1

