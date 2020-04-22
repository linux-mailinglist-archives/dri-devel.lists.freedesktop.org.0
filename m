Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD41B4F52
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAF06E0EB;
	Wed, 22 Apr 2020 21:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5BD6E120
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:45 +0000 (UTC)
IronPort-SDR: ZKINPEGTKi/nmHu3k8C6HBCylloWh7iv+EVMZXKsc+U9o0ldCksz48r2smswOh2QApKtLjcCiP
 569nsh4Etg4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:45 -0700
IronPort-SDR: iz5BuYVBcPUHiO3F++Ks8CuIAPAvTcuZpraltypHYDXzwOX1gXXLi7n6Z9uIsOE/AFJiesZUeq
 4rmNtE2+HwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208541"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:44 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/dmabuf Introduce dmabuf mmap to LMEM
Date: Wed, 22 Apr 2020 17:25:19 -0400
Message-Id: <20200422212519.36276-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422212519.36276-1-michael.j.ruhl@intel.com>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
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
 Brian Welty <brian.welty@intel.com>, jianxin.xiong@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915 GEM dmabuf mmap interface assumes all BOs are SHMEM. When
the BO is backed by LMEM, this assumption doesn't work so well.

Introduce the dmabuf mmap interface to LMEM by adding the appropriate
VMA faulting mechanism.

Update dmabuf to allow for LMEM backed BOs by leveraging the gem_mman
path.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
CC: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 103 ++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   8 ++
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  10 +-
 4 files changed, 118 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 988778cc8539..72d312d04421 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -11,6 +11,8 @@
 #include <linux/scatterlist.h>
 
 #include "i915_drv.h"
+#include "i915_gem_lmem.h"
+#include "i915_gem_mman.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
@@ -169,7 +171,41 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
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
+	err = i915_gem_update_vma_info(mmo, vma);
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
@@ -177,17 +213,21 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (obj->base.size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
 
-	if (!obj->base.filp)
-		return -ENODEV;
+	/* shmem */
+	if (obj->base.filp) {
+		ret = call_mmap(obj->base.filp, vma);
+		if (ret)
+			return ret;
+		fput(vma->vm_file);
+		vma->vm_file = get_file(obj->base.filp);
 
-	ret = call_mmap(obj->base.filp, vma);
-	if (ret)
-		return ret;
+		return 0;
+	}
 
-	fput(vma->vm_file);
-	vma->vm_file = get_file(obj->base.filp);
+	if (i915_gem_object_is_lmem(obj))
+		return i915_gem_dmabuf_update_vma(obj, vma);
 
-	return 0;
+	return -ENODEV;
 }
 
 static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_direction direction)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index b39c24dae64e..70b00c41f6d3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -549,10 +549,10 @@ insert_mmo(struct drm_i915_gem_object *obj, struct i915_mmap_offset *mmo)
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
@@ -626,7 +626,7 @@ __assign_mmap_offset(struct drm_file *file,
 		goto out;
 	}
 
-	mmo = mmap_offset_attach(obj, mmap_type, file);
+	mmo = i915_gem_mmap_offset_attach(obj, mmap_type, file);
 	if (IS_ERR(mmo)) {
 		err = PTR_ERR(mmo);
 		goto out;
@@ -795,56 +795,21 @@ static struct file *mmap_singleton(struct drm_i915_private *i915)
 	return file;
 }
 
-/*
- * This overcomes the limitation in drm_gem_mmap's assignment of a
- * drm_gem_object as the vma->vm_private_data. Since we need to
- * be able to resolve multiple mmap offsets which could be tied
- * to a single gem object.
- */
-int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+int i915_gem_update_vma_info(struct i915_mmap_offset *mmo,
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
-	if (i915_gem_object_is_readonly(obj)) {
-		if (vma->vm_flags & VM_WRITE) {
-			i915_gem_object_put(obj);
+	if (i915_gem_object_is_readonly(mmo->obj)) {
+		if (vma->vm_flags & VM_WRITE)
 			return -EINVAL;
-		}
+
 		vma->vm_flags &= ~VM_MAYWRITE;
 	}
 
-	anon = mmap_singleton(to_i915(dev));
-	if (IS_ERR(anon)) {
-		i915_gem_object_put(obj);
+	anon = mmap_singleton(to_i915(mmo->obj->base.dev));
+	if (IS_ERR(anon))
 		return PTR_ERR(anon);
-	}
 
 	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_private_data = mmo;
@@ -889,6 +854,50 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
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
+	err = i915_gem_update_vma_info(mmo, vma);
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
index 862e01b7cb69..c9721b968d3c 100644
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
@@ -28,4 +30,10 @@ void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
 
+struct i915_mmap_offset *
+i915_gem_mmap_offset_attach(struct drm_i915_gem_object *obj,
+			    enum i915_mmap_type mmap_type,
+			    struct drm_file *file);
+int i915_gem_update_vma_info(struct i915_mmap_offset *mmo,
+			     struct vm_area_struct *vma);
 #endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ef7abcb3f4ee..777f82f60079 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -572,7 +572,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 	if (IS_ERR(obj))
 		return false;
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
 	i915_gem_object_put(obj);
 
 	return PTR_ERR_OR_ZERO(mmo) == expected;
@@ -675,7 +675,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 		goto out;
 	}
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
 	if (IS_ERR(mmo)) {
 		pr_err("Unable to insert object into reclaimed hole\n");
 		err = PTR_ERR(mmo);
@@ -850,7 +850,7 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
@@ -978,7 +978,7 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
@@ -1144,7 +1144,7 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 	if (!can_mmap(obj, type))
 		return 0;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
+	mmo = i915_gem_mmap_offset_attach(obj, type, NULL);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
 
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
