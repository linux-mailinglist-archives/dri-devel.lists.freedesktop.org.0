Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017343CE95
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D4D6E5C8;
	Wed, 27 Oct 2021 16:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8606E5A9;
 Wed, 27 Oct 2021 16:19:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291038180"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="291038180"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="597417902"
Received: from shetherx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.218.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/4] drm/i915/clflush: fixup handling of cache_dirty
Date: Wed, 27 Oct 2021 17:18:10 +0100
Message-Id: <20211027161813.3094681-1-matthew.auld@intel.com>
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

In theory if clflush_work_create() somehow fails here, and we don't yet
have mm.pages populated then we end up resetting cache_dirty, which is
likely wrong, since that will potentially skip the flush-on-acquire, if
it was needed.

It looks like intel_user_framebuffer_dirty() can arrive here before the
pages are populated.

v2(Thomas):
  - Move setting cache_dirty out of the async portion, also add a
    comment for why that should still be safe.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index f0435c6feb68..47586a8a1b73 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -109,12 +109,20 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 						I915_FENCE_GFP);
 		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
 		dma_fence_work_commit(&clflush->base);
+		/*
+		 * We must have successfully populated the pages(since we are
+		 * holding a pin on the pages as per the flush worker) to reach
+		 * this point, which must mean we have already done the required
+		 * flush-on-acquire, hence resetting cache_dirty here should be
+		 * safe.
+		 */
+		obj->cache_dirty = false;
 	} else if (obj->mm.pages) {
 		__do_clflush(obj);
+		obj->cache_dirty = false;
 	} else {
 		GEM_BUG_ON(obj->write_domain != I915_GEM_DOMAIN_CPU);
 	}
 
-	obj->cache_dirty = false;
 	return true;
 }
-- 
2.26.3

