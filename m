Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB714325F1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763B6EE44;
	Mon, 18 Oct 2021 18:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE156EA6A;
 Mon, 18 Oct 2021 18:06:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="251786676"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="251786676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="526358767"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/9] drm/i915: expand on the kernel-doc for cache_dirty
Date: Mon, 18 Oct 2021 18:45:06 +0100
Message-Id: <20211018174508.2137279-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018174508.2137279-1-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
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

Add some details around non-LLC platforms and cflushing, when dealing
with the flush-on-acquire, which is potentially security sensitive.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 11 ++++++++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 27 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1231224728e4..9c323666bd7c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1933,6 +1933,17 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		 *   !(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ)
 		 * but gcc's optimiser doesn't handle that as well and emits
 		 * two jumps instead of one. Maybe one day...
+		 *
+		 * FIXME: There is also sync flushing in set_pages(), which
+		 * serves a different purpose(some of the time at least).
+		 *
+		 * We should consider:
+		 *
+		 *   1. Rip out the async flush code.
+		 *
+		 *   2. Or make the sync flushing use the async clflush path
+		 *   using mandatory fences underneath. Currently the below
+		 *   async flush happens after we bind the object.
 		 */
 		if (unlikely(obj->cache_dirty & ~obj->cache_coherent)) {
 			if (i915_gem_clflush_object(obj, 0))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 7c3da4e3e737..da85169006d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -427,6 +427,33 @@ struct drm_i915_gem_object {
 	 * can freely bypass the CPU cache when touching the pages with the GPU,
 	 * where the kernel is completely unaware. On such platform we need
 	 * apply the sledgehammer-on-acquire regardless of the @cache_coherent.
+	 *
+	 * Special care is taken on non-LLC platforms, to prevent potential
+	 * information leak. The driver currently ensures:
+	 *
+	 *   1. All userspace objects, by default, have @cache_level set as
+	 *   I915_CACHE_NONE. The only exception is userptr objects, where we
+	 *   instead force I915_CACHE_LLC, but we also don't allow userspace to
+	 *   ever change the @cache_level for such objects. Another special case
+	 *   is dma-buf, which doesn't rely on @cache_dirty,  but there we
+	 *   always do a forced flush when acquiring the pages, if there is a
+	 *   chance that the pages can be read directly from main memory with
+	 *   the GPU.
+	 *
+	 *   2. All I915_CACHE_NONE objects have @cache_dirty initially true.
+	 *
+	 *   3. All swapped-out objects(i.e shmem) have @cache_dirty set to
+	 *   true.
+	 *
+	 *   4. The @cache_dirty is never freely reset before the initial
+	 *   flush, even if userspace adjusts the @cache_level through the
+	 *   i915_gem_set_caching_ioctl.
+	 *
+	 *   5. All @cache_dirty objects(including swapped-in) are initially
+	 *   flushed with a synchronous call to drm_clflush_sg in
+	 *   __i915_gem_object_set_pages. The @cache_dirty can be freely reset
+	 *   at this point. All further asynchronous clfushes are never security
+	 *   critical, i.e userspace is free to race against itself.
 	 */
 	unsigned int cache_dirty:1;
 
-- 
2.26.3

