Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD37938DC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE69B10E5C1;
	Wed,  6 Sep 2023 09:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17A410E5C4;
 Wed,  6 Sep 2023 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993869; x=1725529869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0LiL6j2H7g+1uLIOL4Mqaz9i+xRnNyJ9avg5ksWEiFM=;
 b=iq4PX1Rb26VV/OXGf+CyYgskgx7Jv7j4+Re57e5hn2sKb0BzeYqmfJ3Z
 wPC9+v2naY9DJpQw5IG9C6WQJ/Bzy8gw6lUb75u6meYnzlhGpsXzXX+s7
 P7vXXX/k0epCeM83i/+rOND++k5/hH4HQBUKTQAZkrq+0rbYojHcakLsX
 IH+4RlTVGzKUM7dwbN+vOclefllPLzfkBszC/2mmYHLXfdezvBPhZk2zh
 /5e02tqLExkSsvbqxKUvea4Q61oEofBSL1mIe7mrDHe6hY5+vAjm9vkXz
 XmsCq9FBi2Mk1jHti7z3tVElDuDCdA/as9qgyvi2JdQctjk912jOKWOm/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357331495"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="357331495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806948111"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806948111"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:51:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/drm_exec: Work around a WW mutex lockdep oddity
Date: Wed,  6 Sep 2023 11:50:39 +0200
Message-ID: <20230906095039.3320-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
References: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
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
mutex of a given class locked in a sequence.
This has the odd consequence that if that first mutex is unlocked while
other mutexes of the same class remain locked and then its memory then
freed, the lock alloc tracking code will incorrectly assume that memory
is freed with a held lock in there.

For now, work around that for drm_exec by releasing the first grabbed
object lock last.

v2:
- Fix a typo (Danilo Krummrich)
- Reword the commit message a bit.
- Add a Fixes: tag

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
Fixes: 09593216bff1 ("drm: execution context for GEM buffers v7")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
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
index e0462361adf9..b5bf0b6da791 100644
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
+ * but that will be caught by drm_exec_obj(), returning a NULL object.
+ */
+#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
+	for ((index) = (exec)->num_objects - 1;				\
+	     ((obj) = drm_exec_obj(exec, index)); --(index))
 
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
-- 
2.41.0

