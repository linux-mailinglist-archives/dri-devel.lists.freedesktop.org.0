Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7DA7A8DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBB110EA56;
	Thu,  3 Apr 2025 17:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSqoa1AT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92AF10EA4D;
 Thu,  3 Apr 2025 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702539; x=1775238539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BP0hpLs2me+nkjEi7CKXG8TX+mVtTdPjcMD2b4sYkCY=;
 b=NSqoa1ATUEYe71BSauFlnce44IKviGmlIC+aHu/TuObF6YTjWgKNA7Rs
 C118F7hWfu6zOab7Ae8QBhC/UZxFJXiViN+IlmwskcjGGTjx3sEhfWlQH
 wpPT0mVoCsG682eBP1SwRVZt5don7EGuQkQkcW7mzVuuDx/00VkoIjcwO
 9L5UCHpYKiLr6SGeS9A60nIRlxaCAx6MA8Zh2E90UXIb0JDO04akDbQYO
 is3pjaKMi9dMLtxSSzbPePIJKpmAIGXCFPuFcQt0BIVR+aKRMH0oU54tA
 w1AlqDoPwYrUVxkm7M/kKRuhkxsgUNcfQexBqEwrM7yDQrccuWrcam02g A==;
X-CSE-ConnectionGUID: bis+TiGzQyqWH+8RZ7yGhA==
X-CSE-MsgGUID: b1fgbddwSWKVQHCMorNJMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758514"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:59 -0700
X-CSE-ConnectionGUID: pagAfMdGT5G6s0YXr4Z10g==
X-CSE-MsgGUID: C7eM9NlXTdyc2u+cvIIszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158057932"
Received: from dut138lnl.fm.intel.com ([10.105.23.23])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:58 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com,
 ivan.briano@intel.com
Subject: [PATCH v3 4/4] tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY
 fault reporting
Date: Thu,  3 Apr 2025 17:48:56 +0000
Message-ID: <20250403174856.75458-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403174856.75458-1-jonathan.cavitt@intel.com>
References: <20250403174856.75458-1-jonathan.cavitt@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a test to xe_vm that determines if pagefaults are correctly tracked
and reported by the DRM_IOCTL_XE_VM_GET_PROPERTY.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Jianxun Zhang <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_vm.c | 159 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 536532579f..af62357894 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2359,6 +2359,10 @@ static void invalid_vm_id(int fd)
  * SUBTEST: vm-get-property-invalid-property
  * Functionality: ioctl_input_validation
  * Description: Check query with invalid property returns expected error code
+ *
+ * SUBTEST: vm-get-property-exercise
+ * Functionality: drm_xe_vm_get_property
+ * Description: Check query correctly reports pageproperty on vm
  */
 static void get_property_invalid_reserved(int fd, uint32_t vm)
 {
@@ -2399,12 +2403,162 @@ static void get_property_invalid_property(int fd, uint32_t vm)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
 }
 
+static void
+gen_pf(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	int n_exec_queues = 2;
+	int n_execs = 2;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[2];
+	uint32_t syncobjs[2];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int i, b;
+
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = !i ? addr + bo_size * 128 : addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_exec_queues;
+
+		if (!i) {
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = exec_addr;
+		if (e != i)
+			 syncobj_reset(fd, &syncobjs[e], 1);
+		xe_exec(fd, &exec);
+	}
+
+	for (i = 0; i < n_exec_queues && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_exec_queues; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+}
+
+static void print_pf(struct xe_vm_fault *fault)
+{
+	igt_debug("FAULT:\n");
+	igt_debug("address = 0x%08x%08x\n",
+		  upper_32_bits(fault->address),
+		  lower_32_bits(fault->address));
+	igt_debug("address precision = %u\n", fault->address_precision);
+	igt_debug("access type = %u\n", fault->access_type);
+	igt_debug("fault type = %u\n", fault->fault_type);
+	igt_debug("fault level = %u\n", fault->fault_level);
+	igt_debug("\n");
+}
+
+static void get_property_exercise(int fd, uint32_t vm)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct xe_vm_fault *faults, f0, f;
+	struct drm_xe_vm_get_property query = {
+		.vm_id = vm,
+		.property = DRM_XE_VM_GET_PROPERTY_FAULTS
+	};
+	int i, fault_count;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query), 0);
+
+	igt_assert_eq(query.size, 0);
+
+	xe_for_each_engine(fd, hwe)
+		gen_pf(fd, vm, hwe);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query), 0);
+	igt_assert_lt(0, query.size);
+
+	faults = malloc(query.size);
+	igt_assert(faults);
+
+	query.data = to_user_pointer(faults);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query), 0);
+
+	fault_count = query.size / sizeof(struct xe_vm_fault);
+	f0 = faults[0];
+	for (i = 0; i < fault_count; i++) {
+		f = faults[i];
+		print_pf(&f);
+		igt_assert_eq(f.address, f0.address);
+		igt_assert_eq(f.access_type, f0.access_type);
+		igt_assert_eq(f.fault_type, f0.fault_type);
+	}
+	free(faults);
+}
+
 static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
 {
 	uint32_t vm;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE ||
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	func(fd, vm);
 	xe_vm_destroy(fd, vm);
 }
@@ -2529,6 +2683,7 @@ igt_main
 		{ "invalid-vm-id", get_property_invalid_vm_id },
 		{ "invalid-size", get_property_invalid_size },
 		{ "invalid-property", get_property_invalid_property },
+		{ "exercise", get_property_exercise },
 		{ }
 	};
 
-- 
2.43.0

