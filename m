Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2463D9252
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EAC6EB29;
	Wed, 28 Jul 2021 15:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C626E925;
 Wed, 28 Jul 2021 15:50:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="273770704"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="273770704"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 08:50:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="437818759"
Received: from sdrogers-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.245.248])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 08:50:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: fixup igt_shrink_thp
Date: Wed, 28 Jul 2021 16:50:13 +0100
Message-Id: <20210728155013.1741657-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the object might still be active here, the shrink_all will simply
ignore it, which blows up in the test, since the pages will still be
there. Currently THP is disabled which should result in the test being
skipped, but if we ever re-enable THP we might start seeing the failure.
Fix this by forcing I915_SHRINK_ACTIVE.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index a094f3ce1a90..7a67e880b562 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1575,7 +1575,10 @@ static int igt_shrink_thp(void *arg)
 	 * Now that the pages are *unpinned* shrink-all should invoke
 	 * shmem to truncate our pages.
 	 */
-	i915_gem_shrink_all(i915);
+	i915_gem_shrink(NULL, i915, -1UL, NULL,
+			I915_SHRINK_BOUND |
+			I915_SHRINK_UNBOUND |
+			I915_SHRINK_ACTIVE);
 	if (i915_gem_object_has_pages(obj)) {
 		pr_err("shrink-all didn't truncate the pages\n");
 		err = -EINVAL;
-- 
2.26.3

