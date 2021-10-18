Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B7432577
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 19:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286436E9FF;
	Mon, 18 Oct 2021 17:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A60A6EA35;
 Mon, 18 Oct 2021 17:49:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225785003"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="225785003"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="526358732"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 6/9] drm/i915/shmem: ensure flush during swap-in on non-LLC
Date: Mon, 18 Oct 2021 18:45:05 +0100
Message-Id: <20211018174508.2137279-6-matthew.auld@intel.com>
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

On non-LLC platforms, force the flush-on-acquire if this is ever
swapped-in. Our async flush path is not trust worthy enough yet(and
happens in the wrong order), and with some tricks it's conceivable for
userspace to change the cache-level to I915_CACHE_NONE after the pages
are swapped-in, and since execbuf binds the object before doing the
async flush, there is a potential race window.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index cf11aa7e08a0..d77da59fae04 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -286,6 +286,8 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				struct sg_table *pages,
 				bool needs_clflush)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
 	GEM_BUG_ON(obj->mm.madv == __I915_MADV_PURGED);
 
 	if (obj->mm.madv == I915_MADV_DONTNEED)
@@ -297,6 +299,16 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 		drm_clflush_sg(pages);
 
 	__start_cpu_write(obj);
+	/*
+	 * On non-LLC platforms, force the flush-on-acquire if this is ever
+	 * swapped-in. Our async flush path is not trust worthy enough yet(and
+	 * happens in the wrong order), and with some tricks it's conceivable
+	 * for userspace to change the cache-level to I915_CACHE_NONE after the
+	 * pages are swapped-in, and since execbuf binds the object before doing
+	 * the async flush, we have a race window.
+	 */
+	if (!HAS_LLC(i915))
+		obj->cache_dirty = true;
 }
 
 void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_table *pages)
-- 
2.26.3

