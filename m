Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6E8CA8BA
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DE10E42B;
	Tue, 21 May 2024 07:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGkAWLLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2810E36B;
 Tue, 21 May 2024 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275854; x=1747811854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAlFHQG/ojcxP6rO5lLkzNxc8pffryoGxkDQaxaOrCE=;
 b=RGkAWLLhH/fLYYlffXRQOpvEdYbQbLv7G48twU6tV90LWRcUD2L2RHVk
 FOeOB9GALzoZcyL7y8kzSB7d5r6ACNfY50Yz0PzBBLgJCgbhqp9Utpuoi
 c7WYCS9dNSvy4zT5O19OTKdb+ROCwxNseHlQirTMGK0+AujuhguR/+W1J
 DHg4gYwFygJjCRvjIIjBUb1rGyuQcyELUTHQTyTi1ynpNnIuDZfcjzTBT
 iUvgjjH/jOXFU/OrjqFOIj4sKuBAk0Jdj90ZFSxX2wniUYOiKcUn7ywCZ
 YjlEmDlDTBmp66LTdhhvRxIuWvufqXVeh4HyDlkYSkTNTc1CNUYWQoAtS A==;
X-CSE-ConnectionGUID: iqXrmbecQA6nT5t4dFc2gQ==
X-CSE-MsgGUID: lFhYJUMvTMS+WFoqqfTQPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393494"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393494"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:32 -0700
X-CSE-ConnectionGUID: ds2JA6p1Rr+YnQFys+gRJA==
X-CSE-MsgGUID: DIOcA92ZTOiAE1sy7DhxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336794"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 16/21] drm/exec: Introduce an evict mode
Date: Tue, 21 May 2024 09:16:34 +0200
Message-ID: <20240521071639.77614-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Locking for eviction is in some way different from locking for
submission:

1) We can't lock objects that are already locked for submission,
hence DRM_EXEC_IGNORE_DUPLICATES must be unset.
2) We must be able to re-lock objects locked for eviction,
either for submission or for yet another eviction, in
particular objects sharing a single resv must be considered.
3) There is no point to keep a contending object after the
transaction restart. We don't know whether we actually want to use
it again.

So introduce a drm_exec evict mode, and for now instead of
explicitly setting it using a function call or implement separate
locking functions that use evict mode, assume evict mode if
there is a snapshot registered. This can easily be changed later.

To keep track of resvs locked for eviction, use a pointer set
implemented by an xarray. This is probably not the most efficient
data structure but used as an easy-to-implement first approach.
If the set is empty (evict mode never used), the performance-
and memory usage impact will be very small.

TODO: Probably want to implement the set using an open addressing
hash table.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 77 ++++++++++++++++++++++++++++++++++----
 include/drm/drm_exec.h     | 15 ++++++++
 2 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 9eea5d0d3a98..ea79d96f5439 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -65,6 +65,10 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 
 	drm_gem_object_put(exec->prelocked);
 	exec->prelocked = NULL;
+
+	/* garbage collect */
+	xa_destroy(&exec->resv_set);
+	xa_init(&exec->resv_set);
 }
 
 /**
@@ -92,6 +96,8 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
 	exec->snap = NULL;
+	exec->drop_contended = false;
+	xa_init(&exec->resv_set);
 }
 EXPORT_SYMBOL(drm_exec_init);
 
@@ -110,6 +116,7 @@ void drm_exec_fini(struct drm_exec *exec)
 		drm_gem_object_put(exec->contended);
 		ww_acquire_fini(&exec->ticket);
 	}
+	xa_destroy(&exec->resv_set);
 }
 EXPORT_SYMBOL(drm_exec_fini);
 
@@ -139,6 +146,30 @@ bool drm_exec_cleanup(struct drm_exec *exec)
 }
 EXPORT_SYMBOL(drm_exec_cleanup);
 
+static unsigned long drm_exec_resv_to_key(const struct dma_resv *resv)
+{
+	return (unsigned long)resv / __alignof__(typeof(*resv));
+}
+
+static void
+drm_exec_resv_set_erase(struct drm_exec *exec, unsigned long key)
+{
+	if (xa_load(&exec->resv_set, key))
+		xa_erase(&exec->resv_set, key);
+}
+
+static bool drm_exec_in_evict_mode(struct drm_exec *exec)
+{
+	return !!exec->snap;
+}
+
+static void drm_exec_set_evict_mode(struct drm_exec *exec,
+				    struct drm_exec_snapshot *snap)
+{
+	exec->snap = snap;
+	exec->flags &= ~DRM_EXEC_IGNORE_DUPLICATES;
+}
+
 /* Track the locked object in the array */
 static int drm_exec_obj_locked(struct drm_exec *exec,
 			       struct drm_gem_object *obj,
@@ -161,6 +192,14 @@ static int drm_exec_obj_locked(struct drm_exec *exec,
 	drm_gem_object_get(obj);
 	exec->objects[exec->num_objects++] = obj;
 
+	/*
+	 * Errors here are not fatal, It means the object we locked
+	 * for eviction can't be locked again. If that is problematic
+	 * we may need to reconsider this.
+	 */
+	if (drm_exec_in_evict_mode(exec))
+		(void)xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),
+			       obj->resv, gfp | __GFP_NOWARN);
 	return 0;
 }
 
@@ -184,6 +223,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
+	if (exec->drop_contended)
+		goto error_unlock;
+
 	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (unlikely(ret))
 		goto error_unlock;
@@ -245,10 +287,19 @@ int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	}
 
 	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
-		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket)
-			return (exec->flags & DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
-		else
+		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket) {
+			unsigned long key = drm_exec_resv_to_key(obj->resv);
+
+			if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
+			    xa_load(&exec->resv_set, key)) {
+				if (!drm_exec_in_evict_mode(exec))
+					drm_exec_resv_set_erase(exec, key);
+				return 0;
+			}
+			return -EALREADY;
+		} else {
 			return -EBUSY;
+		}
 	}
 
 	ret = drm_exec_obj_locked(exec, obj, GFP_ATOMIC | __GFP_NOWARN);
@@ -288,12 +339,20 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	if (unlikely(ret == -EDEADLK)) {
 		drm_gem_object_get(obj);
 		exec->contended = obj;
+		exec->drop_contended = drm_exec_in_evict_mode(exec);
 		return -EDEADLK;
 	}
 
-	if (unlikely(ret == -EALREADY) &&
-	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
-		return 0;
+	if (unlikely(ret == -EALREADY)) {
+		unsigned long key = drm_exec_resv_to_key(obj->resv);
+
+		if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
+		    xa_load(&exec->resv_set, key)) {
+			if (!drm_exec_in_evict_mode(exec))
+				drm_exec_resv_set_erase(exec, key);
+			return 0;
+		}
+	}
 
 	if (unlikely(ret))
 		return ret;
@@ -324,6 +383,7 @@ void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 
 	for (i = exec->num_objects; i--;) {
 		if (exec->objects[i] == obj) {
+			drm_exec_resv_set_erase(exec, drm_exec_resv_to_key(obj->resv));
 			dma_resv_unlock(obj->resv);
 			for (++i; i < exec->num_objects; ++i)
 				exec->objects[i - 1] = exec->objects[i];
@@ -415,12 +475,14 @@ void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
 		if (index + 1 == snap->num_locked)
 			break;
 
+		xa_erase(&exec->resv_set, drm_exec_resv_to_key(obj->resv));
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
 		exec->objects[index] = NULL;
 	}
 
 	exec->num_objects = snap->num_locked;
+	exec->flags = snap->flags;
 
 	if (!exec->prelocked)
 		exec->prelocked = snap->prelocked;
@@ -443,8 +505,9 @@ void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
 	snap->prelocked = exec->prelocked;
 	if (snap->prelocked)
 		drm_gem_object_get(snap->prelocked);
+	snap->flags = exec->flags;
 	snap->saved_snap = exec->snap;
-	exec->snap = snap;
+	drm_exec_set_evict_mode(exec, snap);
 }
 EXPORT_SYMBOL(drm_exec_snapshot);
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 0ce4d749511b..0b6d5ac0c092 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -5,6 +5,7 @@
 
 #include <linux/compiler.h>
 #include <linux/ww_mutex.h>
+#include <linux/xarray.h>
 
 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
 #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
@@ -53,6 +54,17 @@ struct drm_exec {
 	 * @snap: Pointer to the last snapshot taken or NULL if none.
 	 */
 	struct drm_exec_snapshot *snap;
+
+	/**
+	 * @resv_set: Set of pointers to locked objects in evict mode.
+	 */
+	struct xarray resv_set;
+
+	/**
+	 * @drop_contended: Drop the contended object after WW transaction
+	 * relaxation.
+	 */
+	bool drop_contended;
 };
 
 /**
@@ -67,6 +79,9 @@ struct drm_exec_snapshot {
 
 	/** @num_locked: Number of locked objects at snapshot time. */
 	unsigned long num_locked;
+
+	/** @flags: The drm_exec flags at snapshot time. */
+	u32 flags;
 };
 
 int drm_exec_handle_contended(struct drm_exec *exec);
-- 
2.44.0

