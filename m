Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A6D4018B5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 11:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60189AEE;
	Mon,  6 Sep 2021 09:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3789AEE;
 Mon,  6 Sep 2021 09:17:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="305485837"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="305485837"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 02:17:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="536681514"
Received: from rcburbid-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.240.115])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 02:17:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: fixup igt_shrink_thp
Date: Mon,  6 Sep 2021 10:17:29 +0100
Message-Id: <20210906091729.2093312-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

Since the object might still be active here, the shrink_all will simply
ignore it, which blows up in the test, since the pages will still be
there. Currently THP is disabled which should result in the test being
skipped, but if we ever re-enable THP we might start seeing the failure.
Fix this by forcing I915_SHRINK_ACTIVE.

v2: Some machine in the shard runs doesn't seem to have any available
swap when running this test. Try to handle this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> #v1
---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index a094f3ce1a90..46ea1997c114 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1519,6 +1519,7 @@ static int igt_shrink_thp(void *arg)
 	struct i915_vma *vma;
 	unsigned int flags = PIN_USER;
 	unsigned int n;
+	bool should_swap;
 	int err = 0;
 
 	/*
@@ -1567,23 +1568,39 @@ static int igt_shrink_thp(void *arg)
 			break;
 	}
 	i915_gem_context_unlock_engines(ctx);
+	/*
+	 * Nuke everything *before* we unpin the pages so we can be reasonably
+	 * sure that when later checking get_nr_swap_pages() that some random
+	 * leftover object doesn't steal the remaining swap space.
+	 */
+	i915_gem_shrink(NULL, i915, -1UL, NULL,
+			I915_SHRINK_BOUND |
+			I915_SHRINK_UNBOUND |
+			I915_SHRINK_ACTIVE);
 	i915_vma_unpin(vma);
 	if (err)
 		goto out_put;
 
+
 	/*
-	 * Now that the pages are *unpinned* shrink-all should invoke
-	 * shmem to truncate our pages.
+	 * Now that the pages are *unpinned* shrinking should invoke
+	 * shmem to truncate our pages, if we have available swap.
 	 */
-	i915_gem_shrink_all(i915);
-	if (i915_gem_object_has_pages(obj)) {
-		pr_err("shrink-all didn't truncate the pages\n");
+	should_swap = get_nr_swap_pages() > 0;
+	i915_gem_shrink(NULL, i915, -1UL, NULL,
+			I915_SHRINK_BOUND |
+			I915_SHRINK_UNBOUND |
+			I915_SHRINK_ACTIVE);
+	if (should_swap == i915_gem_object_has_pages(obj)) {
+		pr_err("unexpected pages mismatch, should_swap=%s\n",
+		       yesno(should_swap));
 		err = -EINVAL;
 		goto out_put;
 	}
 
-	if (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys) {
-		pr_err("residual page-size bits left\n");
+	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
+		pr_err("unexpected residual page-size bits, should_swap=%s\n",
+		       yesno(should_swap));
 		err = -EINVAL;
 		goto out_put;
 	}
-- 
2.26.3

