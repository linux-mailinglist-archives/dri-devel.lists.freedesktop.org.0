Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284798CA8BF
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FDB10E426;
	Tue, 21 May 2024 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAuNj7bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4C810E36B;
 Tue, 21 May 2024 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275853; x=1747811853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yyCTWfTCAT0eL5il2694dnzuOZVup9F3xSYAIXXUQEI=;
 b=MAuNj7bMEPCh5zSn4ydwep7bElih6xwJuVQkVApS7DOB7avtMXQHFRmP
 73m2OCSwAtOvzb8HAVwqgHh/Qn/Ntb35qDdnkO/o8dNDoCGm+ZH9uprlY
 THIaYvFgbNtF74Db58BlBVjnTXG6sXwMeeLS/tNo/JZ4LgFZmsQcbARcD
 Blig2sU/GpOWs6w1rhjDaBvUhNaQ/iPKUiL3zolrGB5qhhOsWB4U2S269
 eoIwIjRDV0lYAoHMVeFEA+mZy//qHixbSn6DcQlf/ezTTH6/anFo3i9fj
 9fb1e6MqiqImo6+uzlpRbmLRVVSD7l5kuxo5bJQSnrdwMfcJkJjSgZImi A==;
X-CSE-ConnectionGUID: co0rktWqTbqUrKO/EU2fVw==
X-CSE-MsgGUID: +VzAhy16Qu2jwb+9ktGppQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393490"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:32 -0700
X-CSE-ConnectionGUID: FZK3yX4LRkqnQxWI1laz1Q==
X-CSE-MsgGUID: /eCxpIRkSS2B0m1cz4vmog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336787"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 15/21] drm/exec: Add a snapshot capability
Date: Tue, 21 May 2024 09:16:33 +0200
Message-ID: <20240521071639.77614-16-thomas.hellstrom@linux.intel.com>
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

When validating a buffer object for submission, we might need to lock
a number of object for eviction to make room for the validation.

This makes it pretty likely that validation will eventually succeed,
since eventually the validating process will hold most dma_resv locks
of the buffer objects residing in the memory type being validated for.

However, once validation of a single object has succeeded it might not
be beneficial to hold on to those locks anymore, and the validator
would want to drop the locks of all objects taken during validation.

Introduce a drm_exec snapshot functionality that can be used to
record the locks held at a certain time, and a restore functionality
that restores the drm_exec state to the snapshot by dropping all
locks.

Snapshots can be nested if needed.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 55 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_exec.h     | 23 +++++++++++++++-
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 1383680ffa4a..9eea5d0d3a98 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -57,6 +57,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	struct drm_gem_object *obj;
 	unsigned long index;
 
+	WARN_ON(exec->snap);
 	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
@@ -90,6 +91,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 	exec->num_objects = 0;
 	exec->contended = DRM_EXEC_DUMMY;
 	exec->prelocked = NULL;
+	exec->snap = NULL;
 }
 EXPORT_SYMBOL(drm_exec_init);
 
@@ -301,7 +303,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		goto error_unlock;
 
 	return 0;
-
 error_unlock:
 	dma_resv_unlock(obj->resv);
 	return ret;
@@ -395,5 +396,57 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 }
 EXPORT_SYMBOL(drm_exec_prepare_array);
 
+/**
+ * drm_exec_restore() - Restore the drm_exec state to the point of a snapshot.
+ * @exec: The drm_exec object with the state.
+ * @snap: The snapshot state.
+ *
+ * Restores the drm_exec object by means of unlocking and dropping references
+ * to objects locked after the snapshot.
+ */
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
+{
+	struct drm_gem_object *obj;
+	unsigned int index;
+
+	exec->snap = snap->saved_snap;
+
+	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
+		if (index + 1 == snap->num_locked)
+			break;
+
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+		exec->objects[index] = NULL;
+	}
+
+	exec->num_objects = snap->num_locked;
+
+	if (!exec->prelocked)
+		exec->prelocked = snap->prelocked;
+	else
+		drm_gem_object_put(snap->prelocked);
+}
+EXPORT_SYMBOL(drm_exec_restore);
+
+/**
+ * drm_exec_snapshot() - Take a snapshot of the drm_exec state
+ * @exec: The drm_exec object with the state.
+ * @snap: The snapshot state.
+ *
+ * Records the @exec state in @snap. The @snap object is typically allocated
+ * in the stack of the caller.
+ */
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
+{
+	snap->num_locked = exec->num_objects;
+	snap->prelocked = exec->prelocked;
+	if (snap->prelocked)
+		drm_gem_object_get(snap->prelocked);
+	snap->saved_snap = exec->snap;
+	exec->snap = snap;
+}
+EXPORT_SYMBOL(drm_exec_snapshot);
+
 MODULE_DESCRIPTION("DRM execution context");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index ea0f2117ee0c..0ce4d749511b 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -19,7 +19,6 @@ struct drm_exec {
 	 * @flags: Flags to control locking behavior
 	 */
 	u32                     flags;
-
 	/**
 	 * @ticket: WW ticket used for acquiring locks
 	 */
@@ -49,6 +48,25 @@ struct drm_exec {
 	 * @prelocked: already locked GEM object due to contention
 	 */
 	struct drm_gem_object *prelocked;
+
+	/**
+	 * @snap: Pointer to the last snapshot taken or NULL if none.
+	 */
+	struct drm_exec_snapshot *snap;
+};
+
+/**
+ * struct drm_exec_snapshot - drm_exec snapshot information
+ */
+struct drm_exec_snapshot {
+	/** @saved_snap: Pointer to the previous snapshot or NULL. */
+	struct drm_exec_snapshot *saved_snap;
+
+	/** @prelocked: Refcounted pointer to the prelocked object at snapshot time. */
+	struct drm_gem_object *prelocked;
+
+	/** @num_locked: Number of locked objects at snapshot time. */
+	unsigned long num_locked;
 };
 
 int drm_exec_handle_contended(struct drm_exec *exec);
@@ -160,5 +178,8 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
+
 
 #endif
-- 
2.44.0

