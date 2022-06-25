Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E055AD1C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0B810ED12;
	Sat, 25 Jun 2022 22:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99710ED0F;
 Sat, 25 Jun 2022 22:55:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so8929254pjm.4; 
 Sat, 25 Jun 2022 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeMYgqPNjsyamzteMz4JJUbia+3HcpDgXI4+3iGYjqA=;
 b=XWwFhgsw0jy62ylwdGasi1YuRV0M1drEnIN3jNSmD9WAonjLsfbEA7hU4DteE1FAeW
 Ie+6qGqPtOARntKNsgRJstxzfWVM5MQyk4m8nh6cpAVhH2w7H2xiE7T/pzZpxCkUYcwu
 HEpM19RcB2tvIpKM1F8yvJqbid6mn8GN+sDQw/8i43aIqe28cYZzM8dSEvOYylmhX39/
 t++myIfjITFWjSFJnrXu9VlSpUSHJ6JAYcpCxCSmLwwacVXTR4WUtVQF1ach9Fszoz02
 tDq2kecCKTSUmI7ttzeMQoNIHRGkig8MqjZWHv6voqVmloRrqV3tyQ2VEHIMFDEfJ6+b
 ck1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AeMYgqPNjsyamzteMz4JJUbia+3HcpDgXI4+3iGYjqA=;
 b=AL2fyBZRDlyOX2amUcl7cG2dQZ6MG2scigpCI753KKh8WDsbMKSfKbHBVBdJJ8e5h/
 BpwFhS56jb/pr1xeCSjW5kWixfzPR7OPSVZU90snsQQuSem4YNk4AfBs9V8xRcCP/RU4
 uzfbrxvCN3MMj6KP/wGuFfuPMZyResWtlIU0bb/o/5DcfnUbu4iY7tr4fYC0a4Kyx1Ni
 +56tLl0o9COsFAYhbq/u+7VZh2Cw4okq6dBNp3/wdIV9iL660dZUXAuhUDeiz3bxy/qd
 mVFTDp9uQ8XcVWhn3ncS+rBBH7NhsqgMRxyvDNtjULnU+Zii3P012akjxlb4M/qgjLp+
 sngA==
X-Gm-Message-State: AJIora+e4+HCy1ZIygsAB8U7IX4R+E3Z4IsvxuV0FOyPfVhfB9EzE/Tg
 CJG131L3ph9gKheiLObaVzkt0XpUcWE=
X-Google-Smtp-Source: AGRyM1uvN7jJWa72gLy8ORBxW7G7eO/yFia+/uzSAqKPQMxlZ0yrLk+uyqWxPtfpepGB0y9z20z9ug==
X-Received: by 2002:a17:902:d2d1:b0:16a:1dd9:4d3d with SMTP id
 n17-20020a170902d2d100b0016a1dd94d3dmr6372390plc.18.1656197727296; 
 Sat, 25 Jun 2022 15:55:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170902c20900b0015e8d4eb1dfsm4205062pll.41.2022.06.25.15.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/15] drm/gem: Add LRU/shrinker helper
Date: Sat, 25 Jun 2022 15:54:46 -0700
Message-Id: <20220625225454.81039-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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

All LRUs that the object can be moved between must share a single lock.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem.c | 183 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  56 ++++++++++++
 2 files changed, 239 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..684db28cc71c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -165,6 +165,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 		obj->resv = &obj->_resv;
 
 	drm_vma_node_reset(&obj->vma_node);
+	INIT_LIST_HEAD(&obj->lru_node);
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
@@ -951,6 +952,7 @@ drm_gem_object_release(struct drm_gem_object *obj)
 
 	dma_resv_fini(&obj->_resv);
 	drm_gem_free_mmap_offset(obj);
+	drm_gem_lru_remove(obj);
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
@@ -1274,3 +1276,184 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
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
+static void
+lru_remove(struct drm_gem_object *obj)
+{
+	obj->lru->count -= obj->size >> PAGE_SHIFT;
+	WARN_ON(obj->lru->count < 0);
+	list_del(&obj->lru_node);
+	obj->lru = NULL;
+}
+
+/**
+ * drm_gem_lru_remove - remove object from whatever LRU it is in
+ *
+ * If the object is currently in any LRU, remove it.
+ *
+ * @obj: The GEM object to remove from current LRU
+ */
+void
+drm_gem_lru_remove(struct drm_gem_object *obj)
+{
+	struct drm_gem_lru *lru = obj->lru;
+
+	if (!lru)
+		return;
+
+	mutex_lock(lru->lock);
+	lru_remove(obj);
+	mutex_unlock(lru->lock);
+}
+EXPORT_SYMBOL(drm_gem_lru_remove);
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
+	if (obj->lru)
+		lru_remove(obj);
+
+	lru->count += obj->size >> PAGE_SHIFT;
+	list_add_tail(&obj->lru_node, &lru->list);
+	obj->lru = lru;
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
+	struct drm_gem_object *obj;
+	unsigned freed = 0;
+
+	drm_gem_lru_init(&still_in_lru, lru->lock);
+
+	mutex_lock(lru->lock);
+
+	while (freed < nr_to_scan) {
+		obj = list_first_entry_or_null(&lru->list, typeof(*obj), lru_node);
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
+			 * pages, we expect the driver to have moved the object
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
+	list_for_each_entry (obj, &still_in_lru.list, lru_node)
+		obj->lru = lru;
+	list_splice_tail(&still_in_lru.list, &lru->list);
+	lru->count += still_in_lru.count;
+
+	mutex_unlock(lru->lock);
+
+	return freed;
+}
+EXPORT_SYMBOL(drm_gem_lru_scan);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 87cffc9efa85..f13a9080af37 100644
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
@@ -420,4 +469,11 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
+void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
+void drm_gem_lru_remove(struct drm_gem_object *obj);
+void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
+void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
+unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
+			       bool (*shrink)(struct drm_gem_object *obj));
+
 #endif /* __DRM_GEM_H__ */
-- 
2.36.1

