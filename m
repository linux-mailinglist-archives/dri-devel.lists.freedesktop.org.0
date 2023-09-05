Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921C792139
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A3E10E476;
	Tue,  5 Sep 2023 08:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88BE10E472;
 Tue,  5 Sep 2023 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693904348; x=1725440348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CY1547bCm+hDYrfUpX8fl4I5MjXMcs3kvbI95A16rtk=;
 b=CBh/yKUOkub+OHmnD72JgPGlhfI3p8/U8c2OsFAKNS85Vd+Y8WD/1SZS
 3p8ciuDRJqxDWcTWz4qclmoS9+dmHQnpArvl3ApSZOHL3cRZx8nYsIuSZ
 sogH4+WnDnBMV0Y66LYYR/WcgOHVezq/vfk0qdbo0XZ172culdG+a2HM0
 7IVnxeXH/yDsmZ6WVYF50vS+UgttoikmT4YCUbBmb76LX4FbZV/ZWmGoE
 ELTZSJE3p0H41OcDKVrpVWjWCO2UepRJqKkAJ6avjJnuu6+gq99U+db7d
 YYn4rdtiKzwAfKBzHppvT1x1IUtIbtZi9ArLAv+o+WJi0AiC3+hPHLGAH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="407732486"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407732486"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 01:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="744203617"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="744203617"
Received: from chenxi4-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.154])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 01:59:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/drm_exec: Work around a WW mutex lockdep oddity
Date: Tue,  5 Sep 2023 10:58:32 +0200
Message-ID: <20230905085832.2103-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If *any* object of a certain WW mutex class is locked, lockdep will
consider *all* mutexes of that class as locked. Also the lock allocation
tracking code will apparently register only the address of the first
mutex locked in a sequence.
This has the odd consequence that if that first mutex is unlocked and
its memory then freed, the lock alloc tracking code will assume that memory
is freed with a held lock in there.

For now, work around that for drm_exec by releasing the first grabbed
object lock last.

Related lock alloc tracking warning:
[  322.660067] =========================
[  322.660070] WARNING: held lock freed!
[  322.660074] 6.5.0-rc7+ #155 Tainted: G     U           N
[  322.660078] -------------------------
[  322.660081] kunit_try_catch/4981 is freeing memory ffff888112adc000-ffff888112adc3ff, with a lock still held there!
[  322.660089] ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
[  322.660104] 2 locks held by kunit_try_catch/4981:
[  322.660108]  #0: ffffc9000343fe18 (reservation_ww_class_acquire){+.+.}-{0:0}, at: test_early_put+0x22f/0x490 [drm_exec_test]
[  322.660123]  #1: ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
[  322.660135]
               stack backtrace:
[  322.660139] CPU: 7 PID: 4981 Comm: kunit_try_catch Tainted: G     U           N 6.5.0-rc7+ #155
[  322.660146] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
[  322.660152] Call Trace:
[  322.660155]  <TASK>
[  322.660158]  dump_stack_lvl+0x57/0x90
[  322.660164]  debug_check_no_locks_freed+0x20b/0x2b0
[  322.660172]  slab_free_freelist_hook+0xa1/0x160
[  322.660179]  ? drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
[  322.660186]  __kmem_cache_free+0xb2/0x290
[  322.660192]  drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
[  322.660200]  drm_exec_fini+0xf/0x1c0 [drm_exec]
[  322.660206]  test_early_put+0x289/0x490 [drm_exec_test]
[  322.660215]  ? __pfx_test_early_put+0x10/0x10 [drm_exec_test]
[  322.660222]  ? __kasan_check_byte+0xf/0x40
[  322.660227]  ? __ksize+0x63/0x140
[  322.660233]  ? drmm_add_final_kfree+0x3e/0xa0 [drm]
[  322.660289]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[  322.660294]  ? lockdep_hardirqs_on+0x7d/0x100
[  322.660301]  ? __pfx_kunit_try_run_case+0x10/0x10 [kunit]
[  322.660310]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
[  322.660319]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
[  322.660328]  kthread+0x2e7/0x3c0
[  322.660334]  ? __pfx_kthread+0x10/0x10
[  322.660339]  ret_from_fork+0x2d/0x70
[  322.660345]  ? __pfx_kthread+0x10/0x10
[  322.660349]  ret_from_fork_asm+0x1b/0x30
[  322.660358]  </TASK>
[  322.660818]     ok 8 test_early_put

Cc: Christian König <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c |  2 +-
 include/drm/drm_exec.h     | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ff69cf0fb42a..5d2809de4517 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -56,7 +56,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	struct drm_gem_object *obj;
 	unsigned long index;
 
-	drm_exec_for_each_locked_object(exec, index, obj) {
+	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
 	}
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index e0462361adf9..55764cf7c374 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -51,6 +51,20 @@ struct drm_exec {
 	struct drm_gem_object *prelocked;
 };
 
+/**
+ * drm_exec_obj() - Return the object for a give drm_exec index
+ * @exec: Pointer to the drm_exec context
+ * @index: The index.
+ *
+ * Return: Pointer to the locked object corresponding to @index if
+ * index is within the number of locked objects. NULL otherwise.
+ */
+static inline struct drm_gem_object *
+drm_exec_obj(struct drm_exec *exec, unsigned long index)
+{
+	return index < exec->num_objects ? exec->objects[index] : NULL;
+}
+
 /**
  * drm_exec_for_each_locked_object - iterate over all the locked objects
  * @exec: drm_exec object
@@ -59,10 +73,23 @@ struct drm_exec {
  *
  * Iterate over all the locked GEM objects inside the drm_exec object.
  */
-#define drm_exec_for_each_locked_object(exec, index, obj)	\
-	for (index = 0, obj = (exec)->objects[0];		\
-	     index < (exec)->num_objects;			\
-	     ++index, obj = (exec)->objects[index])
+#define drm_exec_for_each_locked_object(exec, index, obj)		\
+	for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
+
+/**
+ * drm_exec_for_each_locked_object_reverse - iterate over all the locked
+ * objects in reverse locking order
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object in
+ * reverse locking order. Note that @index may go below zero and wrap,
+ * but that will be caught by drm_exec_object(), returning a NULL object.
+ */
+#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
+	for ((index) = (exec)->num_objects - 1;				\
+	     ((obj) = drm_exec_obj(exec, index)); --(index))
 
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
-- 
2.41.0

