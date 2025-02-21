Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B92BA3F97D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CFC10EACB;
	Fri, 21 Feb 2025 15:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZC9cd3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8E10EAC1;
 Fri, 21 Feb 2025 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153257; x=1771689257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3CCZcQ88N7xM0mUkD6/JYIoCM034YA+KexUX3QUBvHQ=;
 b=iZC9cd3z/4GOoFAhhyKTmoTiOLvv9+06l4m43NM5OEARjufdbqRw+AVa
 xTKnThH0J0/DbCrJsYZ6GlLU2rUhzVZ9MSUmIz4u+xSgqsV36OIl9vyKQ
 1STnkgIQQhHA39UBJ9PGzXQPVTPS1jlXP/VRQz0m1HqRAWFcl+TeWLCcl
 nKxFa//2Hn/F/f9iJevdlV9IdYvjQjmhWD34Kx7q+rIuGUWFqwzM8OsHB
 USAy2+HiIrlL7c/T69eI/0vISNTfpkxdw46o6kW4solOd3C5ObFH6xItL
 LCwo7j9YmppWczX3vaMmhaY5LP1kEh7MeETKQqmqtZ2qtDgWgZxD9SIP4 w==;
X-CSE-ConnectionGUID: 0wc284wXSJmU71t4YhJR4g==
X-CSE-MsgGUID: sBh41qxOSWWmmw3OW65Qxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51190869"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51190869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:17 -0800
X-CSE-ConnectionGUID: m3vMS1DNRWeUyA8Xstv0GQ==
X-CSE-MsgGUID: MT3cSLx/QTCkRltLZ0MCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152595569"
Received: from dut4432lnl.fm.intel.com ([10.105.10.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:16 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 2/4] tests/intel/xe_query: Implement reset stats query test
Date: Fri, 21 Feb 2025 15:54:12 +0000
Message-ID: <20250221155414.13961-3-jonathan.cavitt@intel.com>
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

Add initial test to xe query test suite that exercises the reset stats
query.  The new test outputs the results of the query.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_query.c | 85 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1566680e7a..9862ea87d9 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1077,6 +1077,90 @@ static void test_query_oa_units(int fd)
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
 igt_main
 {
 	const struct {
@@ -1094,6 +1178,7 @@ igt_main
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-oa-units", test_query_oa_units },
+		{ "query-reset-stats", test_query_reset_stats },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

