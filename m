Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B7436088
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899806EC42;
	Thu, 21 Oct 2021 11:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C236EC35;
 Thu, 21 Oct 2021 11:44:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292476721"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="292476721"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:44:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="568287266"
Received: from lmirabel-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.195.77])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:44:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/4] drm/i915: stop setting cache_dirty on discrete
Date: Thu, 21 Oct 2021 12:44:10 +0100
Message-Id: <20211021114410.2437099-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211021114410.2437099-1-matthew.auld@intel.com>
References: <20211021114410.2437099-1-matthew.auld@intel.com>
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

Should not be needed. Even with non-coherent display, we should be using
device local-memory there, and not system memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 10 ++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  7 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index d30d5a699788..26532c07d467 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -18,18 +18,28 @@
 
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
+	if (IS_DGFX(i915))
+		return false;
+
 	return !(obj->cache_level == I915_CACHE_NONE ||
 		 obj->cache_level == I915_CACHE_WT);
 }
 
 bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
 	if (obj->cache_dirty)
 		return false;
 
 	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
 		return true;
 
+	if (IS_DGFX(i915))
+		return false;
+
 	/* Currently in use by HW (display engine)? Keep flushed. */
 	return i915_gem_object_is_framebuffer(obj);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 1e426a42a36c..170c74a2e46d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -114,18 +114,21 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
 	obj->cache_level = cache_level;
 
 	if (cache_level != I915_CACHE_NONE)
 		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
 				       I915_BO_CACHE_COHERENT_FOR_WRITE);
-	else if (HAS_LLC(to_i915(obj->base.dev)))
+	else if (HAS_LLC(i915))
 		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
 	else
 		obj->cache_coherent = 0;
 
 	obj->cache_dirty =
-		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
+		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
+		!IS_DGFX(i915);
 }
 
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8eb1c3a6fc9c..76530ca265de 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -26,6 +26,7 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 
 	/* Make the pages coherent with the GPU (flushing any swapin). */
 	if (obj->cache_dirty) {
+		WARN_ON_ONCE(IS_DGFX(i915));
 		obj->write_domain = 0;
 		if (i915_gem_object_has_struct_page(obj))
 			drm_clflush_sg(pages);
-- 
2.26.3

