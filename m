Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE7413557
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE546E9B3;
	Tue, 21 Sep 2021 14:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735C6E9B3;
 Tue, 21 Sep 2021 14:29:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="245792485"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="245792485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:21:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="549509971"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:21:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: exercise shmem_writeback with THP
Date: Tue, 21 Sep 2021 15:21:16 +0100
Message-Id: <20210921142116.3807946-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

In commit:

commit 1e6decf30af5c5c75445ed6ad4e65a26de578a03
Author: Hugh Dickins <hughd@google.com>
Date:   Thu Sep 2 14:54:43 2021 -0700

    shmem: shmem_writepage() split unlikely i915 THP

it looks THP + shmem_writeback was an unexpected combination, and ends up
hitting some BUG_ON, but it also looks like that is now fixed.

While the IGTs did eventually hit this(although not during pre-merge it
seems), it's likely worthwhile adding some explicit coverage for this
scenario in the shrink_thp selftest.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/4166
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 0827634c842c..8260a533d43f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1589,7 +1589,8 @@ static int igt_shrink_thp(void *arg)
 	i915_gem_shrink(NULL, i915, -1UL, NULL,
 			I915_SHRINK_BOUND |
 			I915_SHRINK_UNBOUND |
-			I915_SHRINK_ACTIVE);
+			I915_SHRINK_ACTIVE |
+			I915_SHRINK_WRITEBACK);
 	if (should_swap == i915_gem_object_has_pages(obj)) {
 		pr_err("unexpected pages mismatch, should_swap=%s\n",
 		       yesno(should_swap));
-- 
2.26.3

