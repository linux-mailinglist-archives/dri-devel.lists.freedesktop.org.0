Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8039855F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EB66EC24;
	Wed,  2 Jun 2021 09:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2134D6EC23;
 Wed,  2 Jun 2021 09:37:06 +0000 (UTC)
IronPort-SDR: +4vmjtdcHivywMuLfJ/JBV6TYm5O8bYVFOlkvMoeLeqIUnHyF5vBRcBF23qmVDd23FVF02N4Fl
 AcCRtdyZ1RTw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="183427550"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="183427550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 02:37:05 -0700
IronPort-SDR: xlJE9KM5keKPu/iJcmLvBKWqIPJyBYkZ3F3U8YL8vDo4/O3Drb+TTZ5ztYAj0+x5EuT61+g+Rd
 CdQyHVsBfyZQ==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="447334848"
Received: from klim31-mobl1.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.150.164])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 02:37:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem/mman: only allow WC for lmem
Date: Wed,  2 Jun 2021 10:36:36 +0100
Message-Id: <20210602093636.167070-1-matthew.auld@intel.com>
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

For dgfx where we now have lmem and ttm, we can only support single mmap
mode for the lifetime of the object, and for lmem objects this should be
WC, so reject all other mapping modes for mmap_offset, including if the
object can be placed in both smem and lmem.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index fd1c9714f8d8..32f88f236771 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -689,6 +689,10 @@ __assign_mmap_offset(struct drm_file *file,
 		goto out;
 	}
 
+	if (mmap_type != I915_MMAP_TYPE_WC &&
+	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL))
+		return -ENODEV;
+
 	mmo = mmap_offset_attach(obj, mmap_type, file);
 	if (IS_ERR(mmo)) {
 		err = PTR_ERR(mmo);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 2be6109d0093..d4b0da8ed969 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -403,6 +403,28 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
 	return 0;
 }
 
+/**
+ * i915_gem_object_placements_contain_type - Check whether the object can be
+ * placed at certain memory type
+ * @obj: Pointer to the object
+ * @type: The memory type to check
+ *
+ * Return: True if the object can be placed in @type. False otherwise.
+ */
+bool i915_gem_object_placements_contain_type(struct drm_i915_gem_object *obj,
+					     enum intel_memory_type type)
+{
+	unsigned int i;
+
+	/* TODO: consider maybe storing as a mask when doing gem_create_ext */
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
index 2ebd79537aea..4d6ea9e07df0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -12,6 +12,7 @@
 #include <drm/drm_device.h>
 
 #include "display/intel_frontbuffer.h"
+#include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_vma_types.h"
@@ -587,6 +588,9 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
 
 bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
 
+bool i915_gem_object_placements_contain_type(struct drm_i915_gem_object *obj,
+					     enum intel_memory_type type);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
-- 
2.26.3

