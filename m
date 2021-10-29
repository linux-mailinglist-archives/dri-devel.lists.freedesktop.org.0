Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A843F8C3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616B66E0FB;
	Fri, 29 Oct 2021 08:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32688071;
 Fri, 29 Oct 2021 08:22:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230571131"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="230571131"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:22:11 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="448038483"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:22:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 2/4] drm/i915: Update error capture code to avoid using the
 current vma state
Date: Fri, 29 Oct 2021 10:21:54 +0200
Message-Id: <20211029082156.194003-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029082156.194003-1-thomas.hellstrom@linux.intel.com>
References: <20211029082156.194003-1-thomas.hellstrom@linux.intel.com>
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

With asynchronous migrations, the vma state may be several migrations
ahead of the state that matches the request we're capturing.
Address that by introducing an i915_vma_snapshot structure that
can be used to snapshot relevant state at request submission.
In order to make sure we access the correct memory, the snapshots take
references on relevant sg-tables and memory regions.

Also move the capture list allocation out of the fence signaling
critical path and use the CONFIG_DRM_I915_CAPTURE_ERROR define to
avoid compiling in members and functions used for error capture
when they're not used.

Finally, Introducing lockdep annotation means we will be start seeing
lockdep splats in the capture code. This is because typically the
capture code runs in the fence signalling critical path. These splats
and the associated deadlocks will be worked around in an upcoming patch.

Splats look like these:

[  234.842048] WARNING: possible circular locking dependency detected
[  234.842050] 5.15.0-rc7+ #20 Tainted: G     U  W
[  234.842052] ------------------------------------------------------
[  234.842054] gem_exec_captur/1180 is trying to acquire lock:
[  234.842056] ffffffffa3e51c00 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x4d/0x330
[  234.842063]
               but task is already holding lock:
[  234.842064] ffffffffa3f57620 (dma_fence_map){++++}-{0:0}, at: i915_vma_snapshot_resource_pin+0x27/0x30 [i915]
[  234.842138]
               which lock already depends on the new lock.

[  234.842140]
               the existing dependency chain (in reverse order) is:
[  234.842142]
               -> #2 (dma_fence_map){++++}-{0:0}:
[  234.842145]        __dma_fence_might_wait+0x41/0xa0
[  234.842149]        dma_resv_lockdep+0x1dc/0x28f
[  234.842151]        do_one_initcall+0x58/0x2d0
[  234.842154]        kernel_init_freeable+0x273/0x2bf
[  234.842157]        kernel_init+0x16/0x120
[  234.842160]        ret_from_fork+0x1f/0x30
[  234.842163]
               -> #1 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
[  234.842166]        fs_reclaim_acquire+0x6d/0xd0
[  234.842168]        __kmalloc_node+0x51/0x3a0
[  234.842171]        alloc_cpumask_var_node+0x1b/0x30
[  234.842174]        native_smp_prepare_cpus+0xc7/0x292
[  234.842177]        kernel_init_freeable+0x160/0x2bf
[  234.842179]        kernel_init+0x16/0x120
[  234.842181]        ret_from_fork+0x1f/0x30
[  234.842184]
               -> #0 (fs_reclaim){+.+.}-{0:0}:
[  234.842186]        __lock_acquire+0x1161/0x1dc0
[  234.842189]        lock_acquire+0xb5/0x2b0
[  234.842192]        fs_reclaim_acquire+0xa1/0xd0
[  234.842193]        __kmalloc+0x4d/0x330
[  234.842196]        i915_vma_coredump_create+0x78/0x5b0 [i915]
[  234.842253]        intel_engine_coredump_add_vma+0x36/0xe0 [i915]
[  234.842307]        __i915_gpu_coredump+0x290/0x5e0 [i915]
[  234.842365]        i915_capture_error_state+0x57/0xa0 [i915]
[  234.842415]        intel_gt_handle_error+0x348/0x3e0 [i915]
[  234.842462]        intel_gt_debugfs_reset_store+0x3c/0x90 [i915]
[  234.842504]        simple_attr_write+0xc1/0xe0
[  234.842507]        full_proxy_write+0x53/0x80
[  234.842509]        vfs_write+0xbc/0x350
[  234.842513]        ksys_write+0x58/0xd0
[  234.842514]        do_syscall_64+0x38/0x90
[  234.842516]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  234.842519]
               other info that might help us debug this:

[  234.842521] Chain exists of:
                 fs_reclaim --> mmu_notifier_invalidate_range_start --> dma_fence_map

[  234.842526]  Possible unsafe locking scenario:

[  234.842528]        CPU0                    CPU1
[  234.842529]        ----                    ----
[  234.842531]   lock(dma_fence_map);
[  234.842532]                                lock(mmu_notifier_invalidate_range_start);
[  234.842535]                                lock(dma_fence_map);
[  234.842537]   lock(fs_reclaim);
[  234.842539]
                *** DEADLOCK ***

[  234.842540] 4 locks held by gem_exec_captur/1180:
[  234.842543]  #0: ffff9007812d9460 (sb_writers#17){.+.+}-{0:0}, at: ksys_write+0x58/0xd0
[  234.842547]  #1: ffff900781d9ecb8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write+0x3a/0xe0
[  234.842552]  #2: ffffffffc11913a8 (capture_mutex){+.+.}-{3:3}, at: i915_capture_error_state+0x1a/0xa0 [i915]
[  234.842602]  #3: ffffffffa3f57620 (dma_fence_map){++++}-{0:0}, at: i915_vma_snapshot_resource_pin+0x27/0x30 [i915]
[  234.842656]
               stack backtrace:
[  234.842658] CPU: 0 PID: 1180 Comm: gem_exec_captur Tainted: G     U  W         5.15.0-rc7+ #20
[  234.842661] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
[  234.842664] Call Trace:
[  234.842666]  dump_stack_lvl+0x57/0x72
[  234.842669]  check_noncircular+0xde/0x100
[  234.842672]  ? __lock_acquire+0x3bf/0x1dc0
[  234.842675]  __lock_acquire+0x1161/0x1dc0
[  234.842678]  lock_acquire+0xb5/0x2b0
[  234.842680]  ? __kmalloc+0x4d/0x330
[  234.842683]  ? finish_task_switch.isra.0+0xf2/0x360
[  234.842686]  ? i915_vma_coredump_create+0x78/0x5b0 [i915]
[  234.842734]  fs_reclaim_acquire+0xa1/0xd0
[  234.842737]  ? __kmalloc+0x4d/0x330
[  234.842739]  __kmalloc+0x4d/0x330
[  234.842742]  i915_vma_coredump_create+0x78/0x5b0 [i915]
[  234.842793]  ? capture_vma+0xbe/0x110 [i915]
[  234.842844]  intel_engine_coredump_add_vma+0x36/0xe0 [i915]
[  234.842892]  __i915_gpu_coredump+0x290/0x5e0 [i915]
[  234.842939]  i915_capture_error_state+0x57/0xa0 [i915]
[  234.842985]  intel_gt_handle_error+0x348/0x3e0 [i915]
[  234.843032]  ? __mutex_lock+0x81/0x830
[  234.843035]  ? simple_attr_write+0x3a/0xe0
[  234.843038]  ? __lock_acquire+0x3bf/0x1dc0
[  234.843041]  intel_gt_debugfs_reset_store+0x3c/0x90 [i915]
[  234.843083]  ? _copy_from_user+0x45/0x80
[  234.843086]  simple_attr_write+0xc1/0xe0
[  234.843089]  full_proxy_write+0x53/0x80
[  234.843091]  vfs_write+0xbc/0x350
[  234.843094]  ksys_write+0x58/0xd0
[  234.843096]  do_syscall_64+0x38/0x90
[  234.843098]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  234.843101] RIP: 0033:0x7fa467480877
[  234.843103] Code: 75 05 48 83 c4 58 c3 e8 37 4e ff ff 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  234.843108] RSP: 002b:00007ffd14d79b08 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  234.843112] RAX: ffffffffffffffda RBX: 00007ffd14d79b60 RCX: 00007fa467480877
[  234.843114] RDX: 0000000000000014 RSI: 00007ffd14d79b60 RDI: 0000000000000007
[  234.843116] RBP: 0000000000000007 R08: 0000000000000000 R09: 00007ffd14d79ab0
[  234.843119] R10: ffffffffffffffff R11: 0000000000000246 R12: 0000000000000014
[  234.843121] R13: 0000000000000000 R14: 00007ffd14d79b60 R15: 0000000000000005

v4:
- Break out the capture allocation mode change to a separate patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 135 ++++++++++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 178 +++++++++++++-----
 drivers/gpu/drm/i915/i915_request.c           |  63 +++++--
 drivers/gpu/drm/i915/i915_request.h           |  18 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 137 ++++++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 +++++++++++
 9 files changed, 557 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 467872cca027..2424c19cd0bc 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -173,6 +173,7 @@ i915-y += \
 	  i915_trace_points.o \
 	  i915_ttm_buddy_manager.o \
 	  i915_vma.o \
+	  i915_vma_snapshot.o \
 	  intel_wopcm.o
 
 # general-purpose microcontroller (GuC) support
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index ea5b7b2a4d70..301eb58bebd1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -29,6 +29,7 @@
 #include "i915_gem_ioctls.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
+#include "i915_vma_snapshot.h"
 
 struct eb_vma {
 	struct i915_vma *vma;
@@ -307,11 +308,15 @@ struct i915_execbuffer {
 
 	struct eb_fence *fences;
 	unsigned long num_fences;
+#ifdef CONFIG_DRM_I915_CAPTURE_ERROR
+	struct i915_capture_list *capture_lists[MAX_ENGINE_INSTANCE + 1];
+#endif
 };
 
 static int eb_parse(struct i915_execbuffer *eb);
 static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle);
 static void eb_unpin_engine(struct i915_execbuffer *eb);
+static void eb_capture_release(struct i915_execbuffer *eb);
 
 static inline bool eb_use_cmdparser(const struct i915_execbuffer *eb)
 {
@@ -1054,6 +1059,7 @@ static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
 			i915_vma_put(vma);
 	}
 
+	eb_capture_release(eb);
 	eb_unpin_engine(eb);
 }
 
@@ -1891,36 +1897,113 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
 	return NULL;
 }
 
-static int eb_move_to_gpu(struct i915_execbuffer *eb)
+#ifdef CONFIG_DRM_I915_CAPTURE_ERROR
+
+/* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
+static void eb_capture_stage(struct i915_execbuffer *eb)
 {
 	const unsigned int count = eb->buffer_count;
-	unsigned int i = count;
-	int err = 0, j;
+	unsigned int i = count, j;
+	struct i915_vma_snapshot *vsnap;
 
 	while (i--) {
 		struct eb_vma *ev = &eb->vma[i];
 		struct i915_vma *vma = ev->vma;
 		unsigned int flags = ev->flags;
-		struct drm_i915_gem_object *obj = vma->obj;
 
-		assert_vma_held(vma);
+		if (!(flags & EXEC_OBJECT_CAPTURE))
+			continue;
 
-		if (flags & EXEC_OBJECT_CAPTURE) {
+		vsnap = i915_vma_snapshot_alloc(GFP_KERNEL);
+		if (!vsnap)
+			continue;
+
+		i915_vma_snapshot_init(vsnap, vma, "user");
+		for_each_batch_create_order(eb, j) {
 			struct i915_capture_list *capture;
 
-			for_each_batch_create_order(eb, j) {
-				if (!eb->requests[j])
-					break;
+			capture = kmalloc(sizeof(*capture), GFP_KERNEL);
+			if (!capture)
+				continue;
 
-				capture = kmalloc(sizeof(*capture), GFP_KERNEL);
-				if (capture) {
-					capture->next =
-						eb->requests[j]->capture_list;
-					capture->vma = vma;
-					eb->requests[j]->capture_list = capture;
-				}
-			}
+			capture->next = eb->capture_lists[j];
+			capture->vma_snapshot = i915_vma_snapshot_get(vsnap);
+			eb->capture_lists[j] = capture;
+		}
+		i915_vma_snapshot_put(vsnap);
+	}
+}
+
+/* Commit once we're in the critical path */
+static void eb_capture_commit(struct i915_execbuffer *eb)
+{
+	unsigned int j;
+
+	for_each_batch_create_order(eb, j) {
+		struct i915_request *rq = eb->requests[j];
+
+		if (!rq)
+			break;
+
+		rq->capture_list = eb->capture_lists[j];
+		eb->capture_lists[j] = NULL;
+	}
+}
+
+/*
+ * Release anything that didn't get committed due to errors.
+ * The capture_list will otherwise be freed at request retire.
+ */
+static void eb_capture_release(struct i915_execbuffer *eb)
+{
+	unsigned int j;
+
+	for_each_batch_create_order(eb, j) {
+		if (eb->capture_lists[j]) {
+			i915_request_free_capture_list(eb->capture_lists[j]);
+			eb->capture_lists[j] = NULL;
 		}
+	}
+}
+
+static void eb_capture_list_clear(struct i915_execbuffer *eb)
+{
+	memset(eb->capture_lists, 0, sizeof(eb->capture_lists));
+}
+
+#else
+
+static void eb_capture_stage(struct i915_execbuffer *eb)
+{
+}
+
+static void eb_capture_commit(struct i915_execbuffer *eb)
+{
+}
+
+static void eb_capture_release(struct i915_execbuffer *eb)
+{
+}
+
+static void eb_capture_list_clear(struct i915_execbuffer *eb)
+{
+}
+
+#endif
+
+static int eb_move_to_gpu(struct i915_execbuffer *eb)
+{
+	const unsigned int count = eb->buffer_count;
+	unsigned int i = count;
+	int err = 0, j;
+
+	while (i--) {
+		struct eb_vma *ev = &eb->vma[i];
+		struct i915_vma *vma = ev->vma;
+		unsigned int flags = ev->flags;
+		struct drm_i915_gem_object *obj = vma->obj;
+
+		assert_vma_held(vma);
 
 		/*
 		 * If the GPU is not _reading_ through the CPU cache, we need
@@ -2001,6 +2084,8 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 
 	/* Unconditionally flush any chipset caches (for streaming writes). */
 	intel_gt_chipset_flush(eb->gt);
+	eb_capture_commit(eb);
+
 	return 0;
 
 err_skip:
@@ -3143,13 +3228,14 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 		}
 
 		/*
-		 * Whilst this request exists, batch_obj will be on the
-		 * active_list, and so will hold the active reference. Only when
-		 * this request is retired will the batch_obj be moved onto
-		 * the inactive_list and lose its active reference. Hence we do
-		 * not need to explicitly hold another reference here.
+		 * Not really on stack, but we don't want to call
+		 * kfree on the batch_snapshot when we put it, so use the
+		 * _onstack interface.
 		 */
-		eb->requests[i]->batch = eb->batches[i]->vma;
+		if (eb->batches[i]->vma)
+			i915_vma_snapshot_init_onstack(&eb->requests[i]->batch_snapshot,
+						       eb->batches[i]->vma,
+						       "batch");
 		if (eb->batch_pool) {
 			GEM_BUG_ON(intel_context_is_parallel(eb->context));
 			intel_gt_buffer_pool_mark_active(eb->batch_pool,
@@ -3198,6 +3284,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	eb.fences = NULL;
 	eb.num_fences = 0;
 
+	eb_capture_list_clear(&eb);
+
 	memset(eb.requests, 0, sizeof(struct i915_request *) *
 	       ARRAY_SIZE(eb.requests));
 	eb.composite_fence = NULL;
@@ -3284,6 +3372,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	ww_acquire_done(&eb.ww.ctx);
+	eb_capture_stage(&eb);
 
 	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
 	if (IS_ERR(out_fence)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index ff6753ccb129..61e44185990a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1676,14 +1676,18 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 
 static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
 {
+	struct i915_vma_snapshot *vsnap = &rq->batch_snapshot;
 	void *ring;
 	int size;
 
+	if (!i915_vma_snapshot_present(vsnap))
+		vsnap = NULL;
+
 	drm_printf(m,
 		   "[head %04x, postfix %04x, tail %04x, batch 0x%08x_%08x]:\n",
 		   rq->head, rq->postfix, rq->tail,
-		   rq->batch ? upper_32_bits(rq->batch->node.start) : ~0u,
-		   rq->batch ? lower_32_bits(rq->batch->node.start) : ~0u);
+		   vsnap ? upper_32_bits(vsnap->gtt_offset) : ~0u,
+		   vsnap ? lower_32_bits(vsnap->gtt_offset) : ~0u);
 
 	size = rq->tail - rq->head;
 	if (rq->tail < rq->head)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index bedb80057046..620c7a262ad0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2186,7 +2186,7 @@ struct execlists_capture {
 static void execlists_capture_work(struct work_struct *work)
 {
 	struct execlists_capture *cap = container_of(work, typeof(*cap), work);
-	const gfp_t gfp = GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	const gfp_t gfp = GFP_NOWAIT | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 	struct intel_engine_cs *engine = cap->rq->engine;
 	struct intel_gt_coredump *gt = cap->error->gt;
 	struct intel_engine_capture_vma *vma;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a2d7643b551..9aad7ab1f10f 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -48,6 +48,7 @@
 #include "i915_gpu_error.h"
 #include "i915_memcpy.h"
 #include "i915_scatterlist.h"
+#include "i915_vma_snapshot.h"
 
 #define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
 #define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
@@ -1009,8 +1010,7 @@ void __i915_gpu_coredump_free(struct kref *error_ref)
 
 static struct i915_vma_coredump *
 i915_vma_coredump_create(const struct intel_gt *gt,
-			 const struct i915_vma *vma,
-			 const char *name,
+			 const struct i915_vma_snapshot *vsnap,
 			 struct i915_vma_compress *compress)
 {
 	struct i915_ggtt *ggtt = gt->ggtt;
@@ -1022,10 +1022,10 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 	might_sleep();
 
-	if (!vma || !vma->pages || !compress)
+	if (!vsnap || !vsnap->pages || !compress)
 		return NULL;
 
-	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
+	num_pages = min_t(u64, vsnap->size, vsnap->obj_size) >> PAGE_SHIFT;
 	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
 	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
 	if (!dst)
@@ -1036,12 +1036,12 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 		return NULL;
 	}
 
-	strcpy(dst->name, name);
+	strcpy(dst->name, vsnap->name);
 	dst->next = NULL;
 
-	dst->gtt_offset = vma->node.start;
-	dst->gtt_size = vma->node.size;
-	dst->gtt_page_sizes = vma->page_sizes.gtt;
+	dst->gtt_offset = vsnap->gtt_offset;
+	dst->gtt_size = vsnap->gtt_size;
+	dst->gtt_page_sizes = vsnap->page_sizes;
 	dst->num_pages = num_pages;
 	dst->page_count = 0;
 	dst->unused = 0;
@@ -1051,7 +1051,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 		void __iomem *s;
 		dma_addr_t dma;
 
-		for_each_sgt_daddr(dma, iter, vma->pages) {
+		for_each_sgt_daddr(dma, iter, vsnap->pages) {
 			mutex_lock(&ggtt->error_mutex);
 			ggtt->vm.insert_page(&ggtt->vm, dma, slot,
 					     I915_CACHE_NONE, 0);
@@ -1069,11 +1069,11 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			if (ret)
 				break;
 		}
-	} else if (__i915_gem_object_is_lmem(vma->obj)) {
-		struct intel_memory_region *mem = vma->obj->mm.region;
+	} else if (vsnap->mr && vsnap->mr->type != INTEL_MEMORY_SYSTEM) {
+		struct intel_memory_region *mem = vsnap->mr;
 		dma_addr_t dma;
 
-		for_each_sgt_daddr(dma, iter, vma->pages) {
+		for_each_sgt_daddr(dma, iter, vsnap->pages) {
 			void __iomem *s;
 
 			s = io_mapping_map_wc(&mem->iomap,
@@ -1089,7 +1089,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	} else {
 		struct page *page;
 
-		for_each_sgt_page(page, iter, vma->pages) {
+		for_each_sgt_page(page, iter, vsnap->pages) {
 			void *s;
 
 			drm_clflush_pages(&page, 1);
@@ -1320,37 +1320,71 @@ static bool record_context(struct i915_gem_context_coredump *e,
 
 struct intel_engine_capture_vma {
 	struct intel_engine_capture_vma *next;
-	struct i915_vma *vma;
+	struct i915_vma_snapshot *vsnap;
 	char name[16];
+	bool lockdep_cookie;
 };
 
 static struct intel_engine_capture_vma *
-capture_vma(struct intel_engine_capture_vma *next,
-	    struct i915_vma *vma,
-	    const char *name,
-	    gfp_t gfp)
+capture_vma_snapshot(struct intel_engine_capture_vma *next,
+		     struct i915_vma_snapshot *vsnap,
+		     gfp_t gfp)
 {
 	struct intel_engine_capture_vma *c;
 
-	if (!vma)
+	if (!i915_vma_snapshot_present(vsnap))
 		return next;
 
 	c = kmalloc(sizeof(*c), gfp);
 	if (!c)
 		return next;
 
-	if (!i915_active_acquire_if_busy(&vma->active)) {
+	if (!i915_vma_snapshot_resource_pin(vsnap, &c->lockdep_cookie)) {
 		kfree(c);
 		return next;
 	}
 
-	strcpy(c->name, name);
-	c->vma = vma; /* reference held while active */
+	strcpy(c->name, vsnap->name);
+	c->vsnap = vsnap;
+	i915_vma_snapshot_get(vsnap);
 
 	c->next = next;
 	return c;
 }
 
+static struct intel_engine_capture_vma *
+capture_vma(struct intel_engine_capture_vma *next,
+	    struct i915_vma *vma,
+	    const char *name,
+	    gfp_t gfp)
+{
+	struct i915_vma_snapshot *vsnap;
+
+	if (!vma)
+		return next;
+
+	/*
+	 * If the vma isn't pinned, then the vma should be snapshotted
+	 * to a struct i915_vma_snapshot at command submission time.
+	 * Not here.
+	 */
+	GEM_WARN_ON(!i915_vma_is_pinned(vma));
+	if (!i915_vma_is_pinned(vma))
+		return next;
+
+	vsnap = i915_vma_snapshot_alloc(gfp);
+	if (!vsnap)
+		return next;
+
+	i915_vma_snapshot_init(vsnap, vma, name);
+	next = capture_vma_snapshot(next, vsnap, gfp);
+
+	/* FIXME: Replace on async unbind. */
+	i915_vma_snapshot_put(vsnap);
+
+	return next;
+}
+
 static struct intel_engine_capture_vma *
 capture_user(struct intel_engine_capture_vma *capture,
 	     const struct i915_request *rq,
@@ -1359,7 +1393,7 @@ capture_user(struct intel_engine_capture_vma *capture,
 	struct i915_capture_list *c;
 
 	for (c = rq->capture_list; c; c = c->next)
-		capture = capture_vma(capture, c->vma, "user", gfp);
+		capture = capture_vma_snapshot(capture, c->vma_snapshot, gfp);
 
 	return capture;
 }
@@ -1373,6 +1407,36 @@ static void add_vma(struct intel_engine_coredump *ee,
 	}
 }
 
+static struct i915_vma_coredump *
+create_vma_coredump(const struct intel_gt *gt, struct i915_vma *vma,
+		    const char *name, struct i915_vma_compress *compress)
+{
+	struct i915_vma_coredump *ret = NULL;
+	struct i915_vma_snapshot tmp;
+	bool lockdep_cookie;
+
+	if (!vma)
+		return NULL;
+
+	i915_vma_snapshot_init_onstack(&tmp, vma, name);
+	if (i915_vma_snapshot_resource_pin(&tmp, &lockdep_cookie)) {
+		ret = i915_vma_coredump_create(gt, &tmp, compress);
+		i915_vma_snapshot_resource_unpin(&tmp, lockdep_cookie);
+	}
+	i915_vma_snapshot_put_onstack(&tmp);
+
+	return ret;
+}
+
+static void add_vma_coredump(struct intel_engine_coredump *ee,
+			     const struct intel_gt *gt,
+			     struct i915_vma *vma,
+			     const char *name,
+			     struct i915_vma_compress *compress)
+{
+	add_vma(ee, create_vma_coredump(gt, vma, name, compress));
+}
+
 struct intel_engine_coredump *
 intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp)
 {
@@ -1406,7 +1470,7 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
 	 * as the simplest method to avoid being overwritten
 	 * by userspace.
 	 */
-	vma = capture_vma(vma, rq->batch, "batch", gfp);
+	vma = capture_vma_snapshot(vma, &rq->batch_snapshot, gfp);
 	vma = capture_user(vma, rq, gfp);
 	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
 	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
@@ -1427,30 +1491,24 @@ intel_engine_coredump_add_vma(struct intel_engine_coredump *ee,
 
 	while (capture) {
 		struct intel_engine_capture_vma *this = capture;
-		struct i915_vma *vma = this->vma;
+		struct i915_vma_snapshot *vsnap = this->vsnap;
 
 		add_vma(ee,
 			i915_vma_coredump_create(engine->gt,
-						 vma, this->name,
-						 compress));
+						 vsnap, compress));
 
-		i915_active_release(&vma->active);
+		i915_vma_snapshot_resource_unpin(vsnap, this->lockdep_cookie);
+		i915_vma_snapshot_put(vsnap);
 
 		capture = this->next;
 		kfree(this);
 	}
 
-	add_vma(ee,
-		i915_vma_coredump_create(engine->gt,
-					 engine->status_page.vma,
-					 "HW Status",
-					 compress));
+	add_vma_coredump(ee, engine->gt, engine->status_page.vma,
+			 "HW Status", compress);
 
-	add_vma(ee,
-		i915_vma_coredump_create(engine->gt,
-					 engine->wa_ctx.vma,
-					 "WA context",
-					 compress));
+	add_vma_coredump(ee, engine->gt, engine->wa_ctx.vma,
+			 "WA context", compress);
 }
 
 static struct intel_engine_coredump *
@@ -1486,17 +1544,25 @@ capture_engine(struct intel_engine_cs *engine,
 		}
 	}
 	if (rq)
-		capture = intel_engine_coredump_add_request(ee, rq,
-							    ATOMIC_MAYFAIL);
+		rq = i915_request_get_rcu(rq);
+
+	if (!rq)
+		goto no_request_capture;
+
+	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
 	if (!capture) {
-no_request_capture:
-		kfree(ee);
-		return NULL;
+		i915_request_put(rq);
+		goto no_request_capture;
 	}
 
 	intel_engine_coredump_add_vma(ee, capture, compress);
+	i915_request_put(rq);
 
 	return ee;
+
+no_request_capture:
+	kfree(ee);
+	return NULL;
 }
 
 static void
@@ -1550,10 +1616,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	 */
 	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
 	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
-	error_uc->guc_log =
-		i915_vma_coredump_create(gt->_gt,
-					 uc->guc.log.vma, "GuC log buffer",
-					 compress);
+	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
+						"GuC log buffer", compress);
 
 	return error_uc;
 }
@@ -1839,8 +1903,8 @@ void i915_vma_capture_finish(struct intel_gt_coredump *gt,
 	kfree(compress);
 }
 
-struct i915_gpu_coredump *
-i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
+static struct i915_gpu_coredump *
+__i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct i915_gpu_coredump *error;
@@ -1881,6 +1945,22 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 	return error;
 }
 
+struct i915_gpu_coredump *
+i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
+{
+	static DEFINE_MUTEX(capture_mutex);
+	int ret = mutex_lock_interruptible(&capture_mutex);
+	struct i915_gpu_coredump *dump;
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	dump = __i915_gpu_coredump(gt, engine_mask);
+	mutex_unlock(&capture_mutex);
+
+	return dump;
+}
+
 void i915_error_state_store(struct i915_gpu_coredump *error)
 {
 	struct drm_i915_private *i915;
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 820a1f38b271..24ec2a9beb2f 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -113,6 +113,10 @@ static void i915_fence_release(struct dma_fence *fence)
 	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
 		   rq->guc_prio != GUC_PRIO_FINI);
 
+	i915_request_free_capture_list(fetch_and_zero(&rq->capture_list));
+	if (i915_vma_snapshot_present(&rq->batch_snapshot))
+		i915_vma_snapshot_put_onstack(&rq->batch_snapshot);
+
 	/*
 	 * The request is put onto a RCU freelist (i.e. the address
 	 * is immediately reused), mark the fences as being freed now.
@@ -186,19 +190,6 @@ void i915_request_notify_execute_cb_imm(struct i915_request *rq)
 	__notify_execute_cb(rq, irq_work_imm);
 }
 
-static void free_capture_list(struct i915_request *request)
-{
-	struct i915_capture_list *capture;
-
-	capture = fetch_and_zero(&request->capture_list);
-	while (capture) {
-		struct i915_capture_list *next = capture->next;
-
-		kfree(capture);
-		capture = next;
-	}
-}
-
 static void __i915_request_fill(struct i915_request *rq, u8 val)
 {
 	void *vaddr = rq->ring->vaddr;
@@ -303,6 +294,37 @@ static void __rq_cancel_watchdog(struct i915_request *rq)
 		i915_request_put(rq);
 }
 
+#ifdef CONFIG_DRM_I915_CAPTURE_ERROR
+
+/**
+ * i915_request_free_capture_list - Free a capture list
+ * @capture: Pointer to the first list item or NULL
+ *
+ */
+void i915_request_free_capture_list(struct i915_capture_list *capture)
+{
+	while (capture) {
+		struct i915_capture_list *next = capture->next;
+
+		i915_vma_snapshot_put(capture->vma_snapshot);
+		capture = next;
+	}
+}
+
+#define assert_capture_list_is_null(_rq) GEM_BUG_ON((_rq)->capture_list)
+
+#define clear_capture_list(_rq) ((_rq)->capture_list = NULL)
+
+#else
+
+#define i915_request_free_capture_list(_a) do {} while (0)
+
+#define assert_capture_list_is_null(_a) do {} while (0)
+
+#define clear_capture_list(_rq) do {} while (0)
+
+#endif
+
 bool i915_request_retire(struct i915_request *rq)
 {
 	if (!__i915_request_is_complete(rq))
@@ -359,7 +381,6 @@ bool i915_request_retire(struct i915_request *rq)
 	intel_context_exit(rq->context);
 	intel_context_unpin(rq->context);
 
-	free_capture_list(rq);
 	i915_sched_node_fini(&rq->sched);
 	i915_request_put(rq);
 
@@ -829,11 +850,18 @@ static void __i915_request_ctor(void *arg)
 	i915_sw_fence_init(&rq->submit, submit_notify);
 	i915_sw_fence_init(&rq->semaphore, semaphore_notify);
 
-	rq->capture_list = NULL;
+	clear_capture_list(rq);
+	rq->batch_snapshot.present = false;
 
 	init_llist_head(&rq->execute_cb);
 }
 
+#ifdef CONFIG_DRM_I915_SELFTEST
+#define clear_batch_ptr(_rq) ((_rq)->batch = NULL)
+#else
+#define clear_batch_ptr(_a) do {} while (0)
+#endif
+
 struct i915_request *
 __i915_request_create(struct intel_context *ce, gfp_t gfp)
 {
@@ -925,10 +953,11 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	i915_sched_node_reinit(&rq->sched);
 
 	/* No zalloc, everything must be cleared after use */
-	rq->batch = NULL;
+	clear_batch_ptr(rq);
 	__rq_init_watchdog(rq);
-	GEM_BUG_ON(rq->capture_list);
+	assert_capture_list_is_null(rq);
 	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
+	GEM_BUG_ON(i915_vma_snapshot_present(&rq->batch_snapshot));
 
 	/*
 	 * Reserve space in the ring buffer for all the commands required to
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index dc359242d1ae..f439bf968517 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -40,6 +40,7 @@
 #include "i915_scheduler.h"
 #include "i915_selftest.h"
 #include "i915_sw_fence.h"
+#include "i915_vma_snapshot.h"
 
 #include <uapi/drm/i915_drm.h>
 
@@ -48,11 +49,15 @@ struct drm_i915_gem_object;
 struct drm_printer;
 struct i915_request;
 
+#ifdef CONFIG_DRM_I915_CAPTURE_ERROR
 struct i915_capture_list {
+	struct i915_vma_snapshot *vma_snapshot;
 	struct i915_capture_list *next;
-	struct i915_vma *vma;
 };
 
+void i915_request_free_capture_list(struct i915_capture_list *capture);
+#endif
+
 #define RQ_TRACE(rq, fmt, ...) do {					\
 	const struct i915_request *rq__ = (rq);				\
 	ENGINE_TRACE(rq__->engine, "fence %llx:%lld, current %d " fmt,	\
@@ -289,10 +294,12 @@ struct i915_request {
 	/** Preallocate space in the ring for the emitting the request */
 	u32 reserved_space;
 
-	/** Batch buffer related to this request if any (used for
-	 * error state dump only).
-	 */
-	struct i915_vma *batch;
+	/** Batch buffer pointer for selftest internal use. */
+	I915_SELFTEST_DECLARE(struct i915_vma *batch);
+
+	struct i915_vma_snapshot batch_snapshot;
+
+#ifdef CONFIG_DRM_I915_CAPTURE_ERROR
 	/**
 	 * Additional buffers requested by userspace to be captured upon
 	 * a GPU hang. The vma/obj on this list are protected by their
@@ -300,6 +307,7 @@ struct i915_request {
 	 * on the active_list (of their final request).
 	 */
 	struct i915_capture_list *capture_list;
+#endif
 
 	/** Time at which this request was emitted, in jiffies. */
 	unsigned long emitted_jiffies;
diff --git a/drivers/gpu/drm/i915/i915_vma_snapshot.c b/drivers/gpu/drm/i915/i915_vma_snapshot.c
new file mode 100644
index 000000000000..44985d600f96
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_vma_snapshot.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "i915_vma_snapshot.h"
+#include "i915_vma_types.h"
+#include "i915_vma.h"
+
+/**
+ * i915_vma_snapshot_init - Initialize a struct i915_vma_snapshot from
+ * a struct i915_vma.
+ * @vsnap: The i915_vma_snapshot to init.
+ * @vma: A struct i915_vma used to initialize @vsnap.
+ * @name: Name associated with the snapshot. The character pointer needs to
+ * stay alive over the lifitime of the shapsot
+ */
+void i915_vma_snapshot_init(struct i915_vma_snapshot *vsnap,
+			    struct i915_vma *vma,
+			    const char *name)
+{
+	if (!i915_vma_is_pinned(vma))
+		assert_object_held(vma->obj);
+
+	vsnap->name = name;
+	vsnap->size = vma->size;
+	vsnap->obj_size = vma->obj->base.size;
+	vsnap->gtt_offset = vma->node.start;
+	vsnap->gtt_size = vma->node.size;
+	vsnap->page_sizes = vma->page_sizes.gtt;
+	vsnap->pages = vma->pages;
+	vsnap->pages_rsgt = NULL;
+	vsnap->mr = NULL;
+	if (vma->obj->mm.rsgt)
+		vsnap->pages_rsgt = i915_refct_sgt_get(vma->obj->mm.rsgt);
+	if (vma->obj->mm.region)
+		vsnap->mr = intel_memory_region_get(vma->obj->mm.region);
+	kref_init(&vsnap->kref);
+	vsnap->vma_resource = &vma->active;
+	vsnap->onstack = false;
+	vsnap->present = true;
+}
+
+/**
+ * i915_vma_snapshot_init_onstack - Initialize a struct i915_vma_snapshot from
+ * a struct i915_vma, but avoid kfreeing it on last put.
+ * @vsnap: The i915_vma_snapshot to init.
+ * @vma: A struct i915_vma used to initialize @vsnap.
+ * @name: Name associated with the snapshot. The character pointer needs to
+ * stay alive over the lifitime of the shapsot
+ */
+void i915_vma_snapshot_init_onstack(struct i915_vma_snapshot *vsnap,
+				    struct i915_vma *vma,
+				    const char *name)
+{
+	i915_vma_snapshot_init(vsnap, vma, name);
+	vsnap->onstack = true;
+}
+
+static void vma_snapshot_release(struct kref *ref)
+{
+	struct i915_vma_snapshot *vsnap =
+		container_of(ref, typeof(*vsnap), kref);
+
+	vsnap->present = false;
+	if (vsnap->mr)
+		intel_memory_region_put(vsnap->mr);
+	if (vsnap->pages_rsgt)
+		i915_refct_sgt_put(vsnap->pages_rsgt);
+	if (!vsnap->onstack)
+		kfree(vsnap);
+}
+
+/**
+ * i915_vma_snapshot_put - Put an i915_vma_snapshot pointer reference
+ * @vsnap: The pointer reference
+ */
+void i915_vma_snapshot_put(struct i915_vma_snapshot *vsnap)
+{
+	kref_put(&vsnap->kref, vma_snapshot_release);
+}
+
+/**
+ * i915_vma_snapshot_put_onstack - Put an onstcak i915_vma_snapshot pointer
+ * reference and varify that the structure is released
+ * @vsnap: The pointer reference
+ *
+ * This function is intended to be paired with a i915_vma_init_onstack()
+ * and should be called before exiting the scope that declared or
+ * freeing the structure that embedded @vsnap to verify that all references
+ * have been released.
+ */
+void i915_vma_snapshot_put_onstack(struct i915_vma_snapshot *vsnap)
+{
+	if (!kref_put(&vsnap->kref, vma_snapshot_release))
+		GEM_BUG_ON(1);
+}
+
+/**
+ * i915_vma_snapshot_resource_pin - Temporarily block the memory the
+ * vma snapshot is pointing to from being released.
+ * @vsnap: The vma snapshot.
+ * @lockdep_cookie: Pointer to bool needed for lockdep support. This needs
+ * to be passed to the paired i915_vma_snapshot_resource_unpin.
+ *
+ * This function will temporarily try to hold up a fence or similar structure
+ * and will therefore enter a fence signaling critical section.
+ *
+ * Return: true if we succeeded in blocking the memory from being released,
+ * false otherwise.
+ */
+bool i915_vma_snapshot_resource_pin(struct i915_vma_snapshot *vsnap,
+				    bool *lockdep_cookie)
+{
+	bool pinned = i915_active_acquire_if_busy(vsnap->vma_resource);
+
+	if (pinned)
+		*lockdep_cookie = dma_fence_begin_signalling();
+
+	return pinned;
+}
+
+/**
+ * i915_vma_snapshot_resource_unpin - Unblock vma snapshot memory from
+ * being released.
+ * @vsnap: The vma snapshot.
+ * @lockdep_cookie: Cookie returned from matching i915_vma_resource_pin().
+ *
+ * Might leave a fence signalling critical section and signal a fence.
+ */
+void i915_vma_snapshot_resource_unpin(struct i915_vma_snapshot *vsnap,
+				      bool lockdep_cookie)
+{
+	dma_fence_end_signalling(lockdep_cookie);
+
+	return i915_active_release(vsnap->vma_resource);
+}
diff --git a/drivers/gpu/drm/i915/i915_vma_snapshot.h b/drivers/gpu/drm/i915/i915_vma_snapshot.h
new file mode 100644
index 000000000000..940581df4622
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_vma_snapshot.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+#ifndef _I915_VMA_SNAPSHOT_H_
+#define _I915_VMA_SNAPSHOT_H_
+
+#include <linux/kref.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+struct i915_active;
+struct i915_refct_sgt;
+struct i915_vma;
+struct intel_memory_region;
+struct sg_table;
+
+/**
+ * DOC: Simple utilities for snapshotting GPU vma metadata, later used for
+ * error capture. Vi use a separate header for this to avoid issues due to
+ * recursive header includes.
+ */
+
+/**
+ * struct i915_vma_snapshot - Snapshot of vma metadata.
+ * @size: The vma size in bytes.
+ * @obj_size: The size of the underlying object in bytes.
+ * @gtt_offset: The gtt offset the vma is bound to.
+ * @gtt_size: The size in bytes allocated for the vma in the GTT.
+ * @pages: The struct sg_table pointing to the pages bound.
+ * @pages_rsgt: The refcounted sg_table holding the reference for @pages if any.
+ * @mr: The memory region pointed for the pages bound.
+ * @kref: Reference for this structure.
+ * @vma_resource: FIXME: A means to keep the unbind fence from signaling.
+ * Temporarily while we have only sync unbinds, and still use the vma
+ * active, we use that. With async unbinding we need a signaling refcount
+ * for the unbind fence.
+ * @page_sizes: The vma GTT page sizes information.
+ * @onstack: Whether the structure shouldn't be freed on final put.
+ * @present: Whether the structure is present and initialized.
+ */
+struct i915_vma_snapshot {
+	const char *name;
+	size_t size;
+	size_t obj_size;
+	size_t gtt_offset;
+	size_t gtt_size;
+	struct sg_table *pages;
+	struct i915_refct_sgt *pages_rsgt;
+	struct intel_memory_region *mr;
+	struct kref kref;
+	struct i915_active *vma_resource;
+	u32 page_sizes;
+	bool onstack:1;
+	bool present:1;
+};
+
+void i915_vma_snapshot_init(struct i915_vma_snapshot *vsnap,
+			    struct i915_vma *vma,
+			    const char *name);
+
+void i915_vma_snapshot_init_onstack(struct i915_vma_snapshot *vsnap,
+				    struct i915_vma *vma,
+				    const char *name);
+
+void i915_vma_snapshot_put(struct i915_vma_snapshot *vsnap);
+
+void i915_vma_snapshot_put_onstack(struct i915_vma_snapshot *vsnap);
+
+bool i915_vma_snapshot_resource_pin(struct i915_vma_snapshot *vsnap,
+				    bool *lockdep_cookie);
+
+void i915_vma_snapshot_resource_unpin(struct i915_vma_snapshot *vsnap,
+				      bool lockdep_cookie);
+
+/**
+ * i915_vma_snapshot_alloc - Allocate a struct i915_vma_snapshot
+ * @gfp: Allocation mode.
+ *
+ * Return: A pointer to a struct i915_vma_snapshot if successful.
+ * NULL otherwise.
+ */
+static inline struct i915_vma_snapshot *i915_vma_snapshot_alloc(gfp_t gfp)
+{
+	return kmalloc(sizeof(struct i915_vma_snapshot), gfp);
+}
+
+/**
+ * i915_vma_snapshot_get - Take a reference on a struct i915_vma_snapshot
+ *
+ * Return: A pointer to a struct i915_vma_snapshot.
+ */
+static inline struct i915_vma_snapshot *
+i915_vma_snapshot_get(struct i915_vma_snapshot *vsnap)
+{
+	kref_get(&vsnap->kref);
+	return vsnap;
+}
+
+/**
+ * i915_vma_snapshot_present - Whether a struct i915_vma_snapshot is
+ * present and initialized.
+ *
+ * Return: true if present and initialized; false otherwise.
+ */
+static inline bool
+i915_vma_snapshot_present(const struct i915_vma_snapshot *vsnap)
+{
+	return vsnap && vsnap->present;
+}
+
+#endif
-- 
2.31.1

