Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE65A3F97F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8911410EACF;
	Fri, 21 Feb 2025 15:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQUPcnXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8710EAC9;
 Fri, 21 Feb 2025 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153258; x=1771689258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GM9VgOPos4phqkalJB74EWdm75V8sdJk+DMXLCJV2I=;
 b=EQUPcnXKY+DqVJpQEzoOeSjPK3c85bTVVCudK97w5azQJb1+ch2ApQKh
 /9uNzMc05nr5CtOEXBygdfi2ugSF3OCGRQxrgxXFz7PeVti+FfMb39KnB
 OFYgj/Q418aJxE3S5WcWD7/aBwkO+4qqpgyEvG2QumWB2gj8GvkZREoXI
 WIPBJW1AQgXsRVkdHZXA+NhJcIyiUbFSzg9her2Y98klhKx6HZVtnS4zH
 xhRO10sL6nfmzkOjLPSzs6bxlX09YNAbqxRWHYqPm8oJd7iBDH2AocUqV
 slwYoCbaD4FS+VJL4V2cTmOWo5NhzuaV7Iasj0Hb3Zs99U+gajBrguhel g==;
X-CSE-ConnectionGUID: gl9Cu+NsREaX3XhHwx6hBw==
X-CSE-MsgGUID: uj04zdTRSYic2autl5BrCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51190878"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51190878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:18 -0800
X-CSE-ConnectionGUID: k4+x0/cLQvGaN4nQ9f+AHQ==
X-CSE-MsgGUID: LtaI7y+1TzmdshoJkOgfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152595576"
Received: from dut4432lnl.fm.intel.com ([10.105.10.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:18 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 4/4] tests/intel/xe_query: Exercise ban count in reset stats
Date: Fri, 21 Feb 2025 15:54:14 +0000
Message-ID: <20250221155414.13961-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221155414.13961-1-jonathan.cavitt@intel.com>
References: <20250221155414.13961-1-jonathan.cavitt@intel.com>
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

Extend the reset stats query tests to exercise the ban count value.
Assert that the ban count increases when a pagefault occurs.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_query.c | 202 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1a9a583a9a..cb4ebd8d6a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1212,6 +1212,207 @@ test_query_reset_stats_reset(int fd)
 	igt_assert_lt(resets1, resets2);
 }
 
+static void gen_pf(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	uint64_t sync_addr = 0x101a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[1];
+	uint32_t bind_exec_queues[1];
+	size_t bo_size, sync_size;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint32_t data;
+	} *data;
+	uint64_t *exec_sync;
+	int i, b;
+	int map_fd = -1;
+	int n_exec_queues = 1;
+	int n_execs = 64;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*exec_sync) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
+
+#define	MAP_ADDRESS	0x00007fadeadbe000
+	data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+		    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+		    MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+	memset(data, 0, bo_size);
+
+#define EXEC_SYNC_ADDRESS	0x00007fbdeadbe000
+	exec_sync = mmap((void *)EXEC_SYNC_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		bind_exec_queues[i] = 0;
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(data), addr,
+				 bo_size, sync, 1);
+
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(exec_sync), sync_addr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		b = 0;
+
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		if (i + 1 != n_execs) {
+			/*
+			 * Wait for exec completion and check data as
+			 * userptr will likely change to different
+			 * physical memory on next mmap call triggering
+			 * an invalidate.
+			 */
+			xe_wait_ufence(fd, &exec_sync[i],
+				       USER_FENCE_VALUE, exec_queues[e],
+				       NSEC_PER_SEC);
+			igt_assert_eq(data[i].data, 0xc0ffee);
+			data = mmap((void *)MAP_ADDRESS, bo_size,
+				    PROT_READ | PROT_WRITE, MAP_SHARED |
+				    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+
+	for (i = n_execs - 1; i < n_execs; i++) {
+		int64_t timeout = NSEC_PER_SEC;
+
+		igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &timeout), 0);
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, sync_addr, sync_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+	}
+
+	munmap(exec_sync, sync_size);
+	xe_vm_destroy(fd, vm);
+	if (map_fd != -1)
+		close(map_fd);
+}
+
+/**
+ * SUBTEST: query-reset-stats-bans
+ * Description: Assert reset stats query tracks exec queue bans
+ *
+ * SUBTEST: multigpu-query-reset-stats-bans
+ * Description: Assert reset stats query tracks exec queue bans for all GPU devices
+ * Sub-category: MultiGPU
+ */
+static void
+test_query_reset_stats_bans(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_reset_stats *qrs;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_RESET_STATS,
+		.size = 0,
+		.data = 0,
+	};
+	u64 bans1, bans2;
+
+	igt_skip_on(!query_reset_stats_supported(fd));
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qrs = malloc(query.size);
+	igt_assert(qrs);
+
+	query.data = to_user_pointer(qrs);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	bans1 = qrs->ban_count;
+	free(qrs);
+
+	query.size = 0;
+	query.data = 0;
+
+	xe_for_each_engine(fd, hwe)
+		gen_pf(fd, hwe);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qrs = malloc(query.size);
+	igt_assert(qrs);
+
+	query.data = to_user_pointer(qrs);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	bans2 = qrs->ban_count;
+	free(qrs);
+
+	/**
+	 * There is a limit to the number of bans that can be saved to the
+	 * ban list, so if that limit was already reached before now, assert
+	 * the list did not get any smaller.
+	 */
+	if (bans1 == MAX_BAN_COUNT)
+		igt_assert_eq(bans1, bans2);
+	else
+		igt_assert_lt(bans1, bans2);
+}
+
 igt_main
 {
 	const struct {
@@ -1231,6 +1432,7 @@ igt_main
 		{ "query-oa-units", test_query_oa_units },
 		{ "query-reset-stats", test_query_reset_stats },
 		{ "query-reset-stats-reset", test_query_reset_stats_reset },
+		{ "query-reset-stats-bans", test_query_reset_stats_bans },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

