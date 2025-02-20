Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BEA3E5EE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A2410E10E;
	Thu, 20 Feb 2025 20:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BECViYlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF310E10E;
 Thu, 20 Feb 2025 20:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740083869; x=1771619869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xmeMAleT2mvuWgxsLOhdcoC+j4V4DG5uaSwrr9S/Kbs=;
 b=BECViYlC5DClX3ET8JLibKDlCY6zAMfg/wJ3mu5Lw/AyCe4QROes47OJ
 yRe+SLJ/4UI3MrIOAs0x+lSR5mhzv0wyYCFisO1c24hJQRdl55cQgotTQ
 4zi7NmA2C+T6vRierytmQ+M2LHlWp6NsgDUxPKtqX1K/uCxuYVU7DGQdE
 2w11Mtkpv72nFd3Aywl4qZyRlOBuToMMdYS4SMlaCoQVAfNcPaF9jOQvf
 cIWafXaCvJRWdP8/2lpBlJlAhx+7rYpDHTpxpHxhEEs14YdKCOVAuSG9r
 CM0dPjvjEjn2xR2IrRNm99fC28yO0cgQZ3SS+euX2lBF521htRqqt1c0B Q==;
X-CSE-ConnectionGUID: 6srxCMXxSBOFqiBjbdaZCg==
X-CSE-MsgGUID: o0rAUDOTT26wnx0xvKg9mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44802250"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44802250"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:37:48 -0800
X-CSE-ConnectionGUID: TLQkhNCKRoKOBgjLJ/IK4A==
X-CSE-MsgGUID: CP3qIAGJR/mxJQD2p9Db9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152351543"
Received: from dut4086lnl.fm.intel.com ([10.105.10.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:37:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH] tests/intel/xe_query: Add per drm client reset stats tests
Date: Thu, 20 Feb 2025 20:37:47 +0000
Message-ID: <20250220203747.130371-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add tests that exercise the xe reset stats query.  The current tests
simply output the result of the tests and assert that the reset and ban
counters properly increment.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm-uapi/xe_drm.h |  50 ++++++
 tests/intel/xe_query.c    | 339 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 389 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 08e263b3b2..e4f2f0d2a6 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1729,6 +1730,55 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+#define MAX_BAN_COUNT	50
+/**
+ * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
+ * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
+ * all associated pagefault information, if relevant.
+ */
+struct drm_xe_exec_queue_ban {
+	/** @exec_queue_id: ID of banned exec queue */
+	__u32 exec_queue_id;
+	/**
+	 * @pf_found: whether or not the ban is associated with a pagefault.
+	 * If not, all pagefault data will default to 0 and will not be relevant.
+	 */
+	__u8 pf_found;
+	/** @access_type: access type of associated pagefault */
+	__u8 access_type;
+	/** @fault_type: fault type of associated pagefault */
+	__u8 fault_type;
+	/** @vfid: VFID of associated pagefault */
+	__u8 vfid;
+	/** @asid: ASID of associated pagefault */
+	__u32 asid;
+	/** @pdata: PDATA of associated pagefault */
+	__u16 pdata;
+	/** @engine_class: engine class of associated pagefault */
+	__u8 engine_class;
+	/** @engine_instance: engine instance of associated pagefault */
+	__u8 engine_instance;
+	/** @fault_addr: faulted address of associated pagefault */
+	__u64 fault_addr;
+};
+
+/**
+ * struct drm_xe_query_reset_stats - Per drm client reset stats query.
+ */
+struct drm_xe_query_reset_stats {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @reset_count: Number of times the drm client has observed an engine reset */
+	__u64 reset_count;
+	/** @ban_count: number of exec queue bans saved by the drm client */
+	__u64 ban_count;
+	/**
+	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
+	 * observed exec queue bans on the drm client.
+	 */
+	struct drm_xe_exec_queue_ban ban_list[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1566680e7a..cb4ebd8d6a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1077,6 +1077,342 @@ static void test_query_oa_units(int fd)
 	}
 }
 
+/**
+ * The reset stats query will report -EOPNOTSUPP if the kernel is
+ * configured without CONFIG_PROC_FS.  Check this before running
+ * any tests on this query.
+ */
+static bool
+query_reset_stats_supported(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_RESET_STATS,
+		.size = 0,
+		.data = 0,
+	};
+	int ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+
+	if (ret)
+		igt_assert(ret == -EOPNOTSUPP);
+	return !ret;
+}
+
+/**
+ * SUBTEST: query-reset-stats
+ * Description: Display fields for reset stats query
+ *
+ * SUBTEST: multigpu-query-reset-stats
+ * Description: Display fields for reset stats query for all GPU devices
+ * Sub-category: MultiGPU
+ */
+static void test_query_reset_stats(int fd)
+{
+	struct drm_xe_query_reset_stats *qrs;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_RESET_STATS,
+		.size = 0,
+		.data = 0,
+	};
+	struct drm_xe_exec_queue_ban *ban;
+
+	igt_skip_on(!query_reset_stats_supported(fd));
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qrs = malloc(query.size);
+	igt_assert(qrs);
+
+	query.data = to_user_pointer(qrs);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_info("reset count: %lld\n", qrs->reset_count);
+	igt_info("ban count: %lld\n", qrs->ban_count);
+
+	for (int i = 0; i < qrs->ban_count; i++) {
+		ban = &qrs->ban_list[i];
+
+		igt_info("-------------------------------\n");
+		igt_info("exec queue ban %d\n", i);
+		igt_info("-------------------------------\n");
+		igt_info("exec_queue_id: %d\n", ban->exec_queue_id);
+		if (!ban->pf_found) {
+			igt_info("no associated pagefault\n");
+			continue;
+		}
+		igt_info("pagefault associated:\n");
+		igt_info("\tASID: %d\n"
+			 "\tVFID: %d\n"
+			 "\tPDATA: 0x%04x\n"
+			 "\tFaulted Address: 0x%08x%08x\n"
+			 "\tFaultType: %d\n"
+			 "\tAccessType: %d\n"
+			 "\tEngineClass: %d %s\n"
+			 "\tEngineInstance: %d\n",
+			 ban->asid, ban->vfid, ban->pdata,
+			 upper_32_bits(ban->fault_addr),
+			 lower_32_bits(ban->fault_addr),
+			 ban->fault_type, ban->access_type,
+			 ban->engine_class,
+			 xe_engine_class_string(ban->engine_class),
+			 ban->engine_instance);
+	}
+
+	free(qrs);
+}
+
+/**
+ * SUBTEST: query-reset-stats-reset
+ * Description: Assert reset stats query tracks reset count
+ *
+ * SUBTEST: multigpu-query-reset-stats-reset
+ * Description: Assert reset stats query tracks reset count for all GPU devices
+ * Sub-category: MultiGPU
+ */
+static void
+test_query_reset_stats_reset(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_reset_stats *qrs;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_RESET_STATS,
+		.size = 0,
+		.data = 0,
+	};
+	u64 resets1, resets2;
+
+	igt_skip_on(!query_reset_stats_supported(fd));
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qrs = malloc(query.size);
+	igt_assert(qrs);
+
+	query.data = to_user_pointer(qrs);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	resets1 = qrs->reset_count;
+	free(qrs);
+
+	query.size = 0;
+	query.data = 0;
+
+	xe_for_each_engine(fd, hwe)
+		xe_force_gt_reset_sync(fd, hwe->gt_id);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qrs = malloc(query.size);
+	igt_assert(qrs);
+
+	query.data = to_user_pointer(qrs);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	resets2 = qrs->reset_count;
+	free(qrs);
+
+	igt_assert_lt(resets1, resets2);
+}
+
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
@@ -1094,6 +1430,9 @@ igt_main
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-oa-units", test_query_oa_units },
+		{ "query-reset-stats", test_query_reset_stats },
+		{ "query-reset-stats-reset", test_query_reset_stats_reset },
+		{ "query-reset-stats-bans", test_query_reset_stats_bans },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

