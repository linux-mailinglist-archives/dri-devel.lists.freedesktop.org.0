Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F277EA3F97A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A486C10EAC6;
	Fri, 21 Feb 2025 15:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eu41Ynur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844C10EAC6;
 Fri, 21 Feb 2025 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153257; x=1771689257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zI0CgkJN8PhMuLw7NBSP5eBEt5JvbKKdnyarZw+8Zvg=;
 b=eu41YnurlZnT5FjDFN/2JmNk0MytvEV/jDVp58+6LMGu6grIBPpSx4Nz
 DGvCOL4VPytFKpdHKgRe36ukpw1nS7NBGenbydfTS5clE+90ycU/WG+Dh
 GmM4htW7OrYpI3WKnanbKKGm5tHceO+G4kTmbJYQvK8e9stu8g188pFV8
 Xz8burXIXyOPSQEkXboqMPblbOVoI5LnN+FgI7FcrGybfM23KMDpUHmuT
 KgEifpFI0yoTvBHjij4n2qxAMjLsiaLuk2hWiPQJ94IzbCMaHCBQn+Bjw
 qaOS8bXN8Jef5tUOM4w+00Gmd/UPhT+wppzKIRSfdT85vPIIKu5vH5iu+ w==;
X-CSE-ConnectionGUID: Lt2WHZnhTr6fknqNM+XCgg==
X-CSE-MsgGUID: O4KzuMtHShmrfmCFZU83cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51190872"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51190872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:17 -0800
X-CSE-ConnectionGUID: v3FUSx+QQi+6lIF8mvTM3A==
X-CSE-MsgGUID: PF2Ni3ZqT9KKCvUyYg59uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152595573"
Received: from dut4432lnl.fm.intel.com ([10.105.10.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:17 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 3/4] tests/intel/xe_query: Exercise reset count in reset stats
Date: Fri, 21 Feb 2025 15:54:13 +0000
Message-ID: <20250221155414.13961-4-jonathan.cavitt@intel.com>
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

Extend the reset stats query tests to exercise the reset count value.
Assert that the reset count increases when an engine reset occurs.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_query.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9862ea87d9..1a9a583a9a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1161,6 +1161,57 @@ static void test_query_reset_stats(int fd)
 	free(qrs);
 }
 
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
 igt_main
 {
 	const struct {
@@ -1179,6 +1230,7 @@ igt_main
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-oa-units", test_query_oa_units },
 		{ "query-reset-stats", test_query_reset_stats },
+		{ "query-reset-stats-reset", test_query_reset_stats_reset },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

