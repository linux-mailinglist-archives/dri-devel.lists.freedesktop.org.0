Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04B3B432D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 14:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361DA6ED91;
	Fri, 25 Jun 2021 12:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA4F6E138;
 Fri, 25 Jun 2021 12:29:24 +0000 (UTC)
IronPort-SDR: uA9JRwMBxxcd6t/O0cgBQWZf5w4tYlegKp687j2/9KZ9L3DMjyMJxI8YfPjzhJsCeibYqRszKg
 2q6TlhDqePIw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204651942"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="204651942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 05:29:23 -0700
IronPort-SDR: Zzr4R56rSB12nsbF7Z/QVWmTlz86jKzrFTr3RQhFlfP83U3HS8XlR71etHFfDa1qG8lH/NZE1j
 nkj9NOga0nfA==
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="488165493"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.15.48])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 05:29:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gem: only allow WC for lmem
Date: Fri, 25 Jun 2021 13:27:50 +0100
Message-Id: <20210625122751.590289-1-matthew.auld@intel.com>
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

This is already the case for our kernel internal mappings, and since we
now only support a single mode this should always be WC if the object
can be placed in lmem.

v2: rebase and also update set_domain

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  6 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  9 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 ++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 073822100da7..d0c91697bb22 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -571,6 +571,12 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	if (READ_ONCE(obj->write_domain) == read_domains)
 		goto out_unpin;
 
+	if (i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL) &&
+	    read_domains != I915_GEM_DOMAIN_WC) {
+		err = -EINVAL;
+		goto out_unpin;
+	}
+
 	if (read_domains & I915_GEM_DOMAIN_WC)
 		err = i915_gem_object_set_to_wc_domain(obj, write_domain);
 	else if (read_domains & I915_GEM_DOMAIN_GTT)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a90f796e85c0..f3586b36dd53 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -688,6 +688,15 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
 	    !i915_gem_object_has_iomem(obj))
 		return -ENODEV;
 
+	/*
+	 * Note that even if the object can also be placed in smem then we still
+	 * map as WC here, since we can only support a single mode. On DG1 this
+	 * sucks since we can't turn off snooping for this case.
+	 */
+	if (mmap_type != I915_MMAP_TYPE_WC &&
+	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL))
+		return -ENODEV;
+
 	mmo = mmap_offset_attach(obj, mmap_type, file);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 07e8ff9a8aae..326956c18f76 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -513,6 +513,27 @@ bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
 	return obj->mem_flags & I915_BO_FLAG_IOMEM;
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
index ea3224a480c4..e1daa58bc225 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -12,6 +12,7 @@
 #include <drm/drm_device.h>
 
 #include "display/intel_frontbuffer.h"
+#include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_gem_ww.h"
@@ -597,6 +598,9 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
 
 bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
 
+bool i915_gem_object_placements_contain_type(struct drm_i915_gem_object *obj,
+					     enum intel_memory_type type);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
-- 
2.26.3

