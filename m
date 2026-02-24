Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOkiDtinnWmgQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:30:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E2187AFF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3C1882B5;
	Tue, 24 Feb 2026 13:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVkcpego";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653E4882B5;
 Tue, 24 Feb 2026 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939795; x=1803475795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dnXe+zMV4lY5Rqmk/6dLGLUhbkuoijeuhmF8kMqqK8c=;
 b=GVkcpegovcMjB6z125gzCFSgka21M7K4Pydn9AM+psLNFAa4MVR6SdTO
 /mhUniBPJLrECw2Ju4izqKZIXawOLgPNW/rXDpKGSQSSeRdm42J0BKLxW
 M+ICH9x0kTMurrmCZ4Evh2saeD3+TsXX4tNVMXT1hwxQuqDfz4x482vTQ
 LpmReUCwv2UTulh3OzVUYtFNMCBO3Cp1sTgLmj6eU5hPMjEHBfn11Fqn5
 fz7xYXoKHFluW0MGmAa8nLwond4VCz+ZS7LrcCqwVmvwaaNsuY5PWNz46
 xZ6E3yTUTsYRH1+H2Q2e3yQySMRD8UeJLn7jCZiG5fcJt2Iv32j/Dvapx Q==;
X-CSE-ConnectionGUID: iYqS/ZxTS7yd/9IISfGPKg==
X-CSE-MsgGUID: hDr5afEXQESPahXo8IGAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60529114"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60529114"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:29:55 -0800
X-CSE-ConnectionGUID: LgRxnY5cQRGgiS8ZA1Uifg==
X-CSE-MsgGUID: BWLVqQ6sTgqr1c6ZaugyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220419166"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:29:53 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware
 assertions
Date: Tue, 24 Feb 2026 18:55:05 +0530
Message-ID: <20260224132506.2631528-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 969E2187AFF
X-Rspamd-Action: no action

Introduce gpu_buddy_assert(), a small helper that wraps WARN_ON() and,
when CONFIG_KUNIT is enabled, also calls kunit_fail_current_test() so
that any active KUnit test is marked as failed. In non-KUnit builds
the macro reduces to WARN_ON(), preserving existing behaviour.

Stringify the asserted condition in the failure message to make it easy
to identify which assertion fired. Leave the WARN_ON() in
gpu_buddy_block_trim() unchanged, as it returns -EINVAL and the caller
already observes the failure via the return code.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/buddy.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index b27761246d4b..da5a1222f46b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -3,8 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <kunit/test-bug.h>
-
+#include <linux/bug.h>
 #include <linux/export.h>
 #include <linux/kmemleak.h>
 #include <linux/module.h>
@@ -12,6 +11,28 @@
 
 #include <linux/gpu_buddy.h>
 
+/**
+ * gpu_buddy_assert - assert a condition in the buddy allocator
+ * @condition: condition expected to be true
+ *
+ * When CONFIG_KUNIT is enabled, evaluates @condition and, if false, triggers
+ * a WARN_ON() and also calls kunit_fail_current_test() so that any running
+ * kunit test is properly marked as failed. The stringified condition is
+ * included in the failure message for easy identification.
+ *
+ * When CONFIG_KUNIT is not enabled, this reduces to WARN_ON() so production
+ * builds retain the same warning semantics as before.
+ */
+#if IS_ENABLED(CONFIG_KUNIT)
+#include <kunit/test-bug.h>
+#define gpu_buddy_assert(condition) do {						\
+	if (WARN_ON(!(condition)))						\
+		kunit_fail_current_test("gpu_buddy_assert(" #condition ")");	\
+} while (0)
+#else
+#define gpu_buddy_assert(condition) WARN_ON(!(condition))
+#endif
+
 static struct kmem_cache *slab_blocks;
 
 static unsigned int
@@ -268,8 +289,8 @@ static int __force_merge(struct gpu_buddy *mm,
 				if (!gpu_buddy_block_is_free(buddy))
 					continue;
 
-				WARN_ON(gpu_buddy_block_is_clear(block) ==
-					gpu_buddy_block_is_clear(buddy));
+				gpu_buddy_assert(gpu_buddy_block_is_clear(block) !=
+						 gpu_buddy_block_is_clear(buddy));
 
 				/*
 				 * Advance to the next node when the current node is the buddy,
@@ -415,8 +436,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
 		start = gpu_buddy_block_offset(mm->roots[i]);
 		__force_merge(mm, start, start + size, order);
 
-		if (WARN_ON(!gpu_buddy_block_is_free(mm->roots[i])))
-			kunit_fail_current_test("buddy_fini() root");
+		gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]));
 
 		gpu_block_free(mm, mm->roots[i]);
 
@@ -424,7 +444,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
 		size -= root_size;
 	}
 
-	WARN_ON(mm->avail != mm->size);
+	gpu_buddy_assert(mm->avail == mm->size);
 
 	for_each_free_tree(i)
 		kfree(mm->free_trees[i]);
@@ -541,7 +561,7 @@ static void __gpu_buddy_free_list(struct gpu_buddy *mm,
 {
 	struct gpu_buddy_block *block, *on;
 
-	WARN_ON(mark_dirty && mark_clear);
+	gpu_buddy_assert(!(mark_dirty && mark_clear));
 
 	list_for_each_entry_safe(block, on, objects, link) {
 		if (mark_clear)
-- 
2.52.0

