Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68B38FA38
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5E6E83A;
	Tue, 25 May 2021 05:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3176E831;
 Tue, 25 May 2021 05:48:41 +0000 (UTC)
IronPort-SDR: n7+Aah0X8H4PahvjrCVdsfkVw610ujFJ+l1aIyD0zz2vInekqynnZVyf6jG+5HHY+Mrz99vhaQ
 KvqsexLKzsAg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005458"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:40 -0700
IronPort-SDR: 9R5gZ3GIasqkaeT8MmeJ9m+eXt3Z5qPmof56yERDYShGVrnu9q6JaYgLsTe2zo6Hlt+A+Iz2zi
 QpROcj1XsfBA==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231795"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 14/17] drm/i915/pxp: User interface for Protected buffer
Date: Mon, 24 May 2021 22:48:00 -0700
Message-Id: <20210525054803.7387-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Gupta Anshuman <Anshuman.Gupta@intel.com>,
 Huang Sean Z <sean.z.huang@intel.com>,
 Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Kondapally Kalyan <kalyan.kondapally@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

This api allow user mode to create Protected buffers. Only contexts
marked as protected are allowed to operate on protected buffers.

We only allow setting the flags at creation time.

All protected objects that have backing storage will be considered
invalid when the session is destroyed and they won't be usable anymore.

Given that the PXP HW supports multiple modes (but we currently only
care about one), a flag variable has been reserved in the structure
used in the create_ext ioctl for possible future updates.

This is a rework of the original code by Bommu Krishnaiah. I've kept
authorship unchanged since significant chunks have not been modified.

v2: split context changes, fix defines and improve documentation (Chris),
    add object invalidation logic
v3: fix spinlock definition and usage, only validate objects when
    they're first added to a context lut, only remove them once (Chris),
    make protected context flag not mandatory in protected object execbuf
    to avoid abuse (Lionel)
v4: rebase to new gem_create_ext

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
Cc: Kondapally Kalyan <kalyan.kondapally@intel.com>
Cc: Gupta Anshuman <Anshuman.Gupta@intel.com>
Cc: Huang Sean Z <sean.z.huang@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 26 ++++++++++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 ++++++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 13 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 41 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h          | 13 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  5 +++
 include/uapi/drm/i915_drm.h                   | 33 ++++++++++++++-
 9 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 548ddf39d853..c14be3882c35 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -6,6 +6,7 @@
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
 #include "i915_trace.h"
@@ -99,7 +100,11 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 
 	GEM_BUG_ON(size != obj->base.size);
 
+	if (obj->user_flags & I915_GEM_OBJECT_PROTECTED)
+		intel_pxp_object_add(obj);
+
 	trace_i915_gem_object_create(obj);
+
 	return 0;
 }
 
@@ -344,8 +349,29 @@ static int ext_set_placements(struct i915_user_extension __user *base,
 	return set_placements(&ext, data);
 }
 
+static int ext_set_protected(struct i915_user_extension __user *base, void *data)
+{
+	struct drm_i915_gem_create_ext_protected_content ext;
+	struct create_ext *ext_data = data;
+
+	if (copy_from_user(&ext, base, sizeof(ext)))
+		return -EFAULT;
+
+	if (ext.flags)
+		return -EINVAL;
+
+	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
+		return -ENODEV;
+
+	ext_data->vanilla_object->user_flags |= I915_GEM_OBJECT_PROTECTED;
+
+	return 0;
+}
+
+
 static const i915_user_extension_fn create_extensions[] = {
 	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
+	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index c08e28847064..5dd813d04a9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -839,6 +839,21 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 		if (unlikely(!obj))
 			return ERR_PTR(-ENOENT);
 
+		/*
+		 * If the user has opted-in for protected-object tracking, make
+		 * sure the object encryption can be used.
+		 * We only need to do this when the object is first used with
+		 * this context, because the context itself will be banned when
+		 * the protected objects become invalid.
+		 */
+		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
+		    i915_gem_object_is_protected(obj)) {
+			if (!intel_pxp_is_active(&vm->gt->pxp))
+				return ERR_PTR(-ENODEV);
+			if (!i915_gem_object_has_valid_protection(obj))
+				return ERR_PTR(-ENOEXEC);
+		}
+
 		vma = i915_vma_instance(obj, vm, NULL);
 		if (IS_ERR(vma)) {
 			i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 28144410df86..b47fa0a7b25a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -25,6 +25,7 @@
 #include <linux/sched/mm.h>
 
 #include "display/intel_frontbuffer.h"
+#include "pxp/intel_pxp.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
@@ -70,6 +71,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 	INIT_LIST_HEAD(&obj->lut_list);
 	spin_lock_init(&obj->lut_lock);
 
+	INIT_LIST_HEAD(&obj->pxp_link);
+
 	spin_lock_init(&obj->mmo.lock);
 	obj->mmo.offsets = RB_ROOT;
 
@@ -232,6 +235,9 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 			spin_unlock(&obj->vma.lock);
 		}
 
+		if (i915_gem_object_has_valid_protection(obj))
+			intel_pxp_object_remove(obj);
+
 		__i915_gem_object_free_mmaps(obj);
 
 		GEM_BUG_ON(!list_empty(&obj->lut_list));
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2ebd79537aea..61b101560352 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -288,6 +288,18 @@ i915_gem_object_never_mmap(const struct drm_i915_gem_object *obj)
 	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_NO_MMAP);
 }
 
+static inline bool
+i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
+{
+	return obj->user_flags & I915_GEM_OBJECT_PROTECTED;
+}
+
+static inline bool
+i915_gem_object_has_valid_protection(const struct drm_i915_gem_object *obj)
+{
+	return i915_gem_object_is_protected(obj) && !list_empty(&obj->pxp_link);
+}
+
 static inline bool
 i915_gem_object_is_framebuffer(const struct drm_i915_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 0727d0c76aa0..a698ad0ef7f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -167,6 +167,11 @@ struct drm_i915_gem_object {
 	} mmo;
 
 	I915_SELFTEST_DECLARE(struct list_head st_link);
+	/**
+	 * @user_flags: small set of booleans set by the user
+	 */
+	unsigned long user_flags;
+#define I915_GEM_OBJECT_PROTECTED BIT(0)
 
 	unsigned long flags;
 #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
@@ -294,6 +299,14 @@ struct drm_i915_gem_object {
 		bool dirty:1;
 	} mm;
 
+	/*
+	 * When the PXP session is invalidated, we need to mark all protected
+	 * objects as invalid. To easily do so we add them all to a list. The
+	 * presence on the list is used to check if the encryption is valid or
+	 * not.
+	 */
+	struct list_head pxp_link;
+
 	/** Record of address bit 17 of each page at last unbind. */
 	unsigned long *bit_17;
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 2291c68fd3a0..e6a59eb05eae 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -69,6 +69,9 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	if (!HAS_PXP(gt->i915))
 		return;
 
+	spin_lock_init(&pxp->lock);
+	INIT_LIST_HEAD(&pxp->protected_objects);
+
 	/*
 	 * we'll use the completion to check if there is a termination pending,
 	 * so we start it as completed and we reinit it when a termination
@@ -177,11 +180,49 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
 	intel_pxp_irq_disable(pxp);
 }
 
+int intel_pxp_object_add(struct drm_i915_gem_object *obj)
+{
+	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
+
+	if (!intel_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	if (!list_empty(&obj->pxp_link))
+		return -EEXIST;
+
+	spin_lock_irq(&pxp->lock);
+	list_add(&obj->pxp_link, &pxp->protected_objects);
+	spin_unlock_irq(&pxp->lock);
+
+	return 0;
+}
+
+void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
+{
+	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
+
+	if (!intel_pxp_is_enabled(pxp))
+		return;
+
+	spin_lock_irq(&pxp->lock);
+	list_del_init(&obj->pxp_link);
+	spin_unlock_irq(&pxp->lock);
+}
+
 void intel_pxp_invalidate(struct intel_pxp *pxp)
 {
 	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct drm_i915_gem_object *obj, *tmp;
 	struct i915_gem_context *ctx, *cn;
 
+	/* delete objects that have been used with the invalidated session */
+	spin_lock_irq(&pxp->lock);
+	list_for_each_entry_safe(obj, tmp, &pxp->protected_objects, pxp_link) {
+		if (i915_gem_object_has_pages(obj))
+			list_del_init(&obj->pxp_link);
+	}
+	spin_unlock_irq(&pxp->lock);
+
 	/* ban all contexts marked as protected */
 	spin_lock_irq(&i915->gem.contexts.lock);
 	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 1f9871e64096..3500d7896058 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -9,6 +9,8 @@
 #include "gt/intel_gt_types.h"
 #include "intel_pxp_types.h"
 
+struct drm_i915_gem_object;
+
 static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
 {
 	return container_of(pxp, struct intel_gt, pxp);
@@ -33,6 +35,9 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 int intel_pxp_start(struct intel_pxp *pxp);
+
+int intel_pxp_object_add(struct drm_i915_gem_object *obj);
+void intel_pxp_object_remove(struct drm_i915_gem_object *obj);
 void intel_pxp_invalidate(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
@@ -47,6 +52,14 @@ static inline int intel_pxp_start(struct intel_pxp *pxp)
 {
 	return 0;
 }
+
+static inline int intel_pxp_object_add(struct drm_i915_gem_object *obj)
+{
+	return 0;
+}
+static inline void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
+{
+}
 #endif
 
 #endif /* __INTEL_PXP_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index b3ae49dd73a8..cc510416eac6 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -7,7 +7,9 @@
 #define __INTEL_PXP_TYPES_H__
 
 #include <linux/completion.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -43,6 +45,9 @@ struct intel_pxp {
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
 #define PXP_INVAL_REQUIRED       BIT(2)
+
+	spinlock_t lock; /* protects the objects list */
+	struct list_head protected_objects;
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 3cc33fcbf520..d39b8cb4bfc5 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1768,7 +1768,7 @@ struct drm_i915_gem_context_param {
 	__u64 value;
 };
 
-/*
+/**
  * Context SSEU programming
  *
  * It may be necessary for either functional or performance reason to configure
@@ -2669,8 +2669,12 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
 	 * struct drm_i915_gem_create_ext_memory_regions.
+	 *
+	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
+	 * struct drm_i915_gem_create_ext_protected_content.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
+#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
 	__u64 extensions;
 };
 
@@ -2728,6 +2732,33 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_protected_content - The
+ * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
+ *
+ * If this extension is provided, buffer contents are expected to be
+ * protected by PXP encryption and requires decryption for scan out
+ * and processing. This is only possible on platforms that have PXP enabled,
+ * on all other scenarios ysing this extension will cause the ioctl to fail
+ * and return -ENODEV. The flags parameter is reserved for future expansion and
+ * must currently be set to zero.
+ *
+ * The buffer contents are considered invalid after a PXP session teardown.
+ *
+ * The encryption is guaranteed to be processed correctly only if the object
+ * is submitted with a context created using the
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
+ * at submission time on the validity of the objects involved, which can lead to
+ * the following errors being returned from the execbuf ioctl:
+ *
+ * -ENODEV: PXP session not currently active
+ * -ENOEXEC: buffer has become invalid after a teardown event
+ */
+struct drm_i915_gem_create_ext_protected_content {
+	struct i915_user_extension base;
+	__u32 flags;
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.29.2

