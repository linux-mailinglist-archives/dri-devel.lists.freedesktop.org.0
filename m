Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73BF43CE9A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0DF6E8C7;
	Wed, 27 Oct 2021 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C826E7D0;
 Wed, 27 Oct 2021 16:19:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291038211"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="291038211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="597417913"
Received: from shetherx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.218.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 3/4] drm/i915: move cpu_write_needs_clflush
Date: Wed, 27 Oct 2021 17:18:12 +0100
Message-Id: <20211027161813.3094681-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211027161813.3094681-1-matthew.auld@intel.com>
References: <20211027161813.3094681-1-matthew.auld@intel.com>
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

Move it next to its partner in crime; gpu_write_needs_clflush. For
better readability lets keep gpu vs cpu at least in the same file.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 12 ++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 ++-------------
 drivers/gpu/drm/i915/i915_gem.c            |  2 +-
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index b684a62bf3b0..d30d5a699788 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -22,6 +22,18 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 		 obj->cache_level == I915_CACHE_WT);
 }
 
+bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
+{
+	if (obj->cache_dirty)
+		return false;
+
+	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
+		return true;
+
+	/* Currently in use by HW (display engine)? Keep flushed. */
+	return i915_gem_object_is_framebuffer(obj);
+}
+
 static void
 flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a5479ac7a4ad..de0c8145cc4c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -522,6 +522,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
 void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
 void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj);
+bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj);
 
 int __must_check
 i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write);
@@ -542,23 +543,11 @@ void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
 void __i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 
-static inline bool cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
-{
-	if (obj->cache_dirty)
-		return false;
-
-	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
-		return true;
-
-	/* Currently in use by HW (display engine)? Keep flushed. */
-	return i915_gem_object_is_framebuffer(obj);
-}
-
 static inline void __start_cpu_write(struct drm_i915_gem_object *obj)
 {
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	if (cpu_write_needs_clflush(obj))
+	if (i915_gem_cpu_write_needs_clflush(obj))
 		obj->cache_dirty = true;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 981e383d1a5d..d0e642c82064 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -764,7 +764,7 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 	 * perspective, requiring manual detiling by the client.
 	 */
 	if (!i915_gem_object_has_struct_page(obj) ||
-	    cpu_write_needs_clflush(obj))
+	    i915_gem_cpu_write_needs_clflush(obj))
 		/* Note that the gtt paths might fail with non-page-backed user
 		 * pointers (e.g. gtt mappings when moving data between
 		 * textures). Fallback to the shmem path in that case.
-- 
2.26.3

