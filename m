Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C788E3B9375
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 16:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4476EB2A;
	Thu,  1 Jul 2021 14:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373A36EB2A;
 Thu,  1 Jul 2021 14:38:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208363561"
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="208363561"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 07:38:22 -0700
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="420426097"
Received: from dfdonlon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.173])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 07:38:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: use consistent CPU mappings for pin_map users
Date: Thu,  1 Jul 2021 15:36:48 +0100
Message-Id: <20210701143650.1094468-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For discrete, users of pin_map() needs to obey the same rules at the TTM
backend, where we map system only objects as WB, and everything else as
WC. The simplest for now is to just force the correct mapping type as
per the new rules for discrete.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 34 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 +++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 22 ++++++++++++--
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 547cc9dad90d..52ffd057259e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -625,6 +625,40 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 	return obj->ops->migrate(obj, mr);
 }
 
+/**
+ * i915_gem_object_placement_possible - Check whether the object can be
+ * placed at certain memory type
+ * @obj: Pointer to the object
+ * @type: The memory type to check
+ *
+ * Return: True if the object can be placed in @type. False otherwise.
+ */
+bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
+					enum intel_memory_type type)
+{
+	unsigned int i;
+
+	if (!obj->mm.n_placements) {
+		switch(type) {
+		case INTEL_MEMORY_LOCAL:
+			return i915_gem_object_has_iomem(obj);
+		case INTEL_MEMORY_SYSTEM:
+			return i915_gem_object_has_pages(obj);
+		default:
+			/* Ignore stolen for now */
+			GEM_BUG_ON(1);
+			return false;
+		}
+	}
+
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		if (obj->mm.placements[i]->type == type)
+			return true;
+	}
+
+	return false;
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
 	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d423d8cac4f2..8be4fadeee48 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -12,6 +12,7 @@
 #include <drm/drm_device.h>
 
 #include "display/intel_frontbuffer.h"
+#include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_gem_ww.h"
@@ -607,6 +608,9 @@ bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
 int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
 				   unsigned int flags);
 
+bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
+					enum intel_memory_type type);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index f2f850e31b8e..810a157a18f8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -321,8 +321,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	dma_addr_t addr;
 	void *vaddr;
 
-	if (type != I915_MAP_WC)
-		return ERR_PTR(-ENODEV);
+	GEM_BUG_ON(type != I915_MAP_WC);
 
 	if (n_pfn > ARRAY_SIZE(stack)) {
 		/* Too big for stack -- allocate temporary array instead */
@@ -374,6 +373,25 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	}
 	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
 
+	/*
+	 * For discrete our CPU mappings needs to be consistent in order to
+	 * function correctly on !x86. When mapping things through TTM, we use
+	 * the same rules to determine the caching type.
+	 *
+	 * Internal users of lmem are already expected to get this right, so no
+	 * fudging needed there.
+	 */
+	if (i915_gem_object_placement_possible(obj, INTEL_MEMORY_LOCAL)) {
+		if (type != I915_MAP_WC && !obj->mm.n_placements) {
+			ptr = ERR_PTR(-ENODEV);
+			goto err_unpin;
+		}
+
+		type = I915_MAP_WC;
+	} else if (IS_DGFX(to_i915(obj->base.dev))) {
+		type = I915_MAP_WB;
+	}
+
 	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
 	if (ptr && has_type != type) {
 		if (pinned) {
-- 
2.26.3

