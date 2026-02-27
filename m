Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLenEK+VoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:01:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D51B76B5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74C610EB36;
	Fri, 27 Feb 2026 13:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9yeWToA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4510EB35;
 Fri, 27 Feb 2026 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772197286; x=1803733286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ban2oT8oQ2d+7YZbeJ3M0DPentQs/jjeGWdse6aDDTQ=;
 b=S9yeWToARu1IWZY+gGOTezu0n4L37kBJOQ0LJCgZWEyDhXKdRjC7Ne9N
 m1KnpfnnPNhwXUWqory7E2C5EOspKsq1uT8AfwS1xdenKGc1+3l9DU8kU
 c182yM/LgdVWkE6HfOlzxHfvYFZWXI8c1EPsUnS9OlGLPoTzsq7kwZnz8
 pa/tpfXSdTTy/Vu1fbGtqyeEoDasfV1mT+xiggqQp6BokSAtjiDH+loSO
 k4+tFU3hjmP6g0XwuzObc9O1ewbYWSiRmHFbsxIbPu6+/qelVyUa+NTVa
 oSD5qI2NMTB/6NM9EhkTw1TD+b7UK909LaLlxMOsCyael7BcG0sW2WIZS A==;
X-CSE-ConnectionGUID: VaVP4x4eTvugl/yQfyfW8w==
X-CSE-MsgGUID: b1hlVreSQfC0GIEvD0mgaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72478436"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="72478436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:01:25 -0800
X-CSE-ConnectionGUID: S0HLL5kiRjuxG3YnLxLGIw==
X-CSE-MsgGUID: qvPrrxY5QmeBwBy5is4dLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221393790"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:01:24 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [CI] gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware
 assertions
Date: Fri, 27 Feb 2026 18:30:38 +0530
Message-ID: <20260227130037.53615-2-sanjay.kumar.yadav@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[amd.com:query timed out,intel.com:query timed out];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[arunpravin.paneerselvam.amd.com:query timed out,christian.koenig.amd.com:query timed out,sanjay.kumar.yadav.intel.com:query timed out,matthew.auld.intel.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,amd.com:email]
X-Rspamd-Queue-Id: DD1D51B76B5
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
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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

