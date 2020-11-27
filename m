Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F322C6512
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9036ECC3;
	Fri, 27 Nov 2020 12:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2446ECC0;
 Fri, 27 Nov 2020 12:10:23 +0000 (UTC)
IronPort-SDR: JRzc9IItv7aPsUa3Vt25HYjhpKto8QcymowjBLveFLKc+lEEpilqP+1NVJeGgVHt1Mj59r0n73
 zCzhUyuVDYVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092764"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092764"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:23 -0800
IronPort-SDR: X5MAOQBWiosZ5dIo1IS3PmfLThEN0xrM9CbuJV8yLSo8qQHyIqQ21O0pchjzKVJLa0rcFWSajc
 3FsFAF+7yk3w==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029340"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 095/162] drm/i915/dg1: Introduce dmabuf mmap to LMEM
Date: Fri, 27 Nov 2020 12:06:11 +0000
Message-Id: <20201127120718.454037-96-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Brian Welty <brian.welty@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>

The i915 GEM dmabuf mmap interface assumes all BOs are SHMEM. When
the BO is backed by LMEM, this assumption doesn't work so well.

Introduce the dmabuf mmap interface to LMEM by adding the appropriate
VMA faulting mechanism and update dmabuf to allow for LMEM backed BOs by
leveraging the gem_mman path.

Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  59 +++++++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 102 ++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   9 ++
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  12 +--
 4 files changed, 118 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 018d02cc4af5..85528eeaacbc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -10,6 +10,7 @@
 
 #include "i915_drv.h"
 #include "i915_gem_lmem.h"
+#include "i915_gem_mman.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
@@ -105,7 +106,41 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *
 	i915_gem_object_unpin_map(obj);
 }
 
-static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
+/**
+ * i915_gem_dmabuf_update_vma - Setup VMA information for exported LMEM
+ * objects
+ * @obj: valid LMEM object
+ * @vma: va;od vma
+ *
+ * NOTE: on success, the final _object_put() will be done by the VMA
+ * vm_close() callback.
+ */
+static int i915_gem_dmabuf_update_vma(struct drm_i915_gem_object *obj,
+				      struct vm_area_struct *vma)
+{
+	struct i915_mmap_offset *mmo;
+	int err;
+
+	i915_gem_object_get(obj);
+	mmo = i915_gem_mmap_offset_attach(obj, I915_MMAP_TYPE_WC, NULL);
+	if (IS_ERR(mmo)) {
+		err = PTR_ERR(mmo);
+		goto out;
+	}
+
+	err = i915_gem_update_vma_info(obj, mmo, vma);
+	if (err)
+		goto out;
+
+	return 0;
+
+out:
+	i915_gem_object_put(obj);
+	return err;
+}
+
+static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf,
+				struct vm_area_struct *vma)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 	int ret;
@@ -113,16 +148,20 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (obj->base.size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
 
-	if (!obj->base.filp)
-		return -ENODEV;
+	/* shmem */
+	if (obj->base.filp) {
+		ret = call_mmap(obj->base.filp, vma);
+		if (ret)
+			return ret;
 
-	ret = call_mmap(obj->base.filp, vma);
-	if (ret)
-		return ret;
+		vma_set_file(vma, obj->base.filp);
+		return 0;
+	}
 
-	vma_set_file(vma, obj->base.filp);
+	if (i915_gem_object_is_lmem(obj))
+		return i915_gem_dmabuf_update_vma(obj, vma);
 
-	return 0;
+	return -ENODEV;
 }
 
 static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_direction direction)
@@ -254,10 +293,6 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 			 */
 			return &i915_gem_object_get(obj)->base;
 		}
-
-		/* not our device, but still a i915 object? */
-		if (i915_gem_object_is_lmem(obj))
-			return ERR_PTR(-ENOTSUPP);
 	}
 
 	/* need to attach */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 4e8a05c35252..33ccd4d665d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -620,10 +620,10 @@ insert_mmo(struct drm_i915_gem_object *obj, struct i915_mmap_offset *mmo)
 	return mmo;
 }
 
-static struct i915_mmap_offset *
-mmap_offset_attach(struct drm_i915_gem_object *obj,
-		   enum i915_mmap_type mmap_type,
-		   struct drm_file *file)
+struct i915_mmap_offset *
+i915_gem_mmap_offset_attach(struct drm_i915_gem_object *obj,
+			    enum i915_mmap_type mmap_type,
+			    struct drm_file *file)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_mmap_offset *mmo;
@@ -696,7 +696,7 @@ __assign_mmap_offset(struct drm_file *file,
 		goto out;
 	}
 
-	mmo = mmap_offset_attach(obj, mmap_type, file);
+	mmo = i915_gem_mmap_offset_attach(obj, mmap_type, file);
 	if (IS_ERR(mmo)) {
 		err = PTR_ERR(mmo);
 		goto out;
@@ -867,56 +867,22 @@ static struct file *mmap_singleton(struct drm_i915_private *i915)
 	return file;
 }
 
-/*
- * This overcomes the limitation in drm_gem_mmap's assignment of a
- * drm_gem_object as the vma->vm_private_data. Since we need to
- * be able to resolve multiple mmap offsets which could be tied
- * to a single gem object.
- */
-int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+int i915_gem_update_vma_info(struct drm_i915_gem_object *obj,
+			     struct i915_mmap_offset *mmo,
+			     struct vm_area_struct *vma)
 {
-	struct drm_vma_offset_node *node;
-	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
-	struct drm_i915_gem_object *obj = NULL;
-	struct i915_mmap_offset *mmo = NULL;
 	struct file *anon;
 
-	if (drm_dev_is_unplugged(dev))
-		return -ENODEV;
-
-	rcu_read_lock();
-	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
-	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
-						  vma->vm_pgoff,
-						  vma_pages(vma));
-	if (node && drm_vma_node_is_allowed(node, priv)) {
-		/*
-		 * Skip 0-refcnted objects as it is in the process of being
-		 * destroyed and will be invalid when the vma manager lock
-		 * is released.
-		 */
-		mmo = container_of(node, struct i915_mmap_offset, vma_node);
-		obj = i915_gem_object_get_rcu(mmo->obj);
-	}
-	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
-	rcu_read_unlock();
-	if (!obj)
-		return node ? -EACCES : -EINVAL;
-
 	if (i915_gem_object_is_readonly(obj)) {
-		if (vma->vm_flags & VM_WRITE) {
-			i915_gem_object_put(obj);
+		if (vma->vm_flags & VM_WRITE)
 			return -EINVAL;
-		}
+
 		vma->vm_flags &= ~VM_MAYWRITE;
 	}
 
-	anon = mmap_singleton(to_i915(dev));
-	if (IS_ERR(anon)) {
-		i915_gem_object_put(obj);
+	anon = mmap_singleton(to_i915(obj->base.dev));
+	if (IS_ERR(anon))
 		return PTR_ERR(anon);
-	}
 
 	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_private_data = mmo;
@@ -962,6 +928,50 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	return 0;
 }
 
+/*
+ * This overcomes the limitation in drm_gem_mmap's assignment of a
+ * drm_gem_object as the vma->vm_private_data. Since we need to
+ * be able to resolve multiple mmap offsets which could be tied
+ * to a single gem object.
+ */
+int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_vma_offset_node *node;
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+	struct drm_i915_gem_object *obj = NULL;
+	struct i915_mmap_offset *mmo = NULL;
+	int err;
+
+	if (drm_dev_is_unplugged(dev))
+		return -ENODEV;
+
+	rcu_read_lock();
+	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
+	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
+						  vma->vm_pgoff,
+						  vma_pages(vma));
+	if (node && drm_vma_node_is_allowed(node, priv)) {
+		/*
+		 * Skip 0-refcnted objects as it is in the process of being
+		 * destroyed and will be invalid when the vma manager lock
+		 * is released.
+		 */
+		mmo = container_of(node, struct i915_mmap_offset, vma_node);
+		obj = i915_gem_object_get_rcu(mmo->obj);
+	}
+	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
+	rcu_read_unlock();
+	if (!obj)
+		return node ? -EACCES : -EINVAL;
+
+	err = i915_gem_update_vma_info(obj, mmo, vma);
+	if (err)
+		i915_gem_object_put(obj);
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_gem_mman.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 7c5ccdf59359..dfd19da0b3e7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -10,6 +10,8 @@
 #include <linux/mm_types.h>
 #include <linux/types.h>
 
+#include "gem/i915_gem_object_types.h"
+
 struct drm_device;
 struct drm_file;
 struct drm_i915_gem_object;
@@ -31,4 +33,11 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
 void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
 
+struct i915_mmap_offset *
+i915_gem_mmap_offset_attach(struct drm_i915_gem_object *obj,
+			    enum i915_mmap_type mmap_type,
+			    struct drm_file *file);
+int i915_gem_update_vma_info(struct drm_i915_gem_object *obj,
+			     struct i915_mmap_offset *mmo,
+			     struct vm_area_struct *vma);
 #endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 85fff8bed08c..5701549b5d13 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -583,7 +583,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 	if (IS_ERR(obj))
 		return false;
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
 	i915_gem_object_put(obj);
 
 	return PTR_ERR_OR_ZERO(mmo) == expected;
@@ -686,7 +686,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 		goto out;
 	}
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
 	if (IS_ERR(mmo)) {
 		pr_err("Unable to insert object into reclaimed hole\n");
 		err = PTR_ERR(mmo);
@@ -860,7 +860,7 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
@@ -996,7 +996,7 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 	if (!can_mmap(obj, type) || !can_access(obj))
 		return 0;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
@@ -1109,7 +1109,7 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
@@ -1285,7 +1285,7 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 	if (!can_mmap(obj, type))
 		return 0;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
