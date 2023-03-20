Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A16C0E42
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D010E2CF;
	Mon, 20 Mar 2023 10:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738DA10E2CF;
 Mon, 20 Mar 2023 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679306952; x=1710842952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t5tPVyvsvgXoIccFimWMEI4efqnlrI30zXvDj591hAw=;
 b=n08IvuWiMoIg38yrQ9lindl9grZNHMSbDpq23jjDxZ0j3ic/TT2SUfD8
 M3iUtHGmTERXtMu4tX3th7sUrbQQFaN8MkmgHi6GaaPUmU4zhk1nNyW8v
 3k+uAsIO5sGZrdN/0oZs9xHEG86R2Yxw6dIUZiJaGo0uZz0YhpqBSpMuX
 fPqaBiq8dRKY8mjH5y/wUr4HJLd+CSWSP9ivV7jhTaPgAKZk3wXdFN4xH
 vGZbckDrtAMlhGAC4eQXvLXrHQ3EJRrLni7k7ScL0c3pKrfabu9ccLX9v
 yP/fizNFyqiWdrNpaVZftT90R3w64t01Kfj/E8S8gVhFrE/Lk+USrPkoS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="338647846"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="338647846"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="791560712"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="791560712"
Received: from nirmoyda-desk.igk.intel.com ([10.91.214.27])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:09:10 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2: 1/3] drm/i915: Add a function to mmap framebuffer obj
Date: Mon, 20 Mar 2023 11:09:01 +0100
Message-Id: <20230320100903.23588-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement i915_gem_fb_mmap() to enable fb_ops.fb_mmap()
callback for i915's framebuffer objects.

v2: add a comment why i915_gem_object_get() needed(Andi).

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 127 +++++++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h |   2 +-
 2 files changed, 83 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index d3c1dee16af2..341e952d3510 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -927,53 +927,15 @@ static struct file *mmap_singleton(struct drm_i915_private *i915)
 	return file;
 }
 
-/*
- * This overcomes the limitation in drm_gem_mmap's assignment of a
- * drm_gem_object as the vma->vm_private_data. Since we need to
- * be able to resolve multiple mmap offsets which could be tied
- * to a single gem object.
- */
-int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+static int
+i915_gem_object_mmap(struct drm_i915_gem_object *obj,
+		     struct i915_mmap_offset *mmo,
+		     struct vm_area_struct *vma)
 {
-	struct drm_vma_offset_node *node;
-	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
-	struct drm_i915_gem_object *obj = NULL;
-	struct i915_mmap_offset *mmo = NULL;
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_device *dev = &i915->drm;
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
-		if (!node->driver_private) {
-			mmo = container_of(node, struct i915_mmap_offset, vma_node);
-			obj = i915_gem_object_get_rcu(mmo->obj);
-
-			GEM_BUG_ON(obj && obj->ops->mmap_ops);
-		} else {
-			obj = i915_gem_object_get_rcu
-				(container_of(node, struct drm_i915_gem_object,
-					      base.vma_node));
-
-			GEM_BUG_ON(obj && !obj->ops->mmap_ops);
-		}
-	}
-	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
-	rcu_read_unlock();
-	if (!obj)
-		return node ? -EACCES : -EINVAL;
-
 	if (i915_gem_object_is_readonly(obj)) {
 		if (vma->vm_flags & VM_WRITE) {
 			i915_gem_object_put(obj);
@@ -1005,7 +967,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (obj->ops->mmap_ops) {
 		vma->vm_page_prot = pgprot_decrypted(vm_get_page_prot(vma->vm_flags));
 		vma->vm_ops = obj->ops->mmap_ops;
-		vma->vm_private_data = node->driver_private;
+		vma->vm_private_data = obj->base.vma_node.driver_private;
 		return 0;
 	}
 
@@ -1043,6 +1005,81 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
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
+		if (!node->driver_private) {
+			mmo = container_of(node, struct i915_mmap_offset, vma_node);
+			obj = i915_gem_object_get_rcu(mmo->obj);
+
+			GEM_BUG_ON(obj && obj->ops->mmap_ops);
+		} else {
+			obj = i915_gem_object_get_rcu
+				(container_of(node, struct drm_i915_gem_object,
+					      base.vma_node));
+
+			GEM_BUG_ON(obj && !obj->ops->mmap_ops);
+		}
+	}
+	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
+	rcu_read_unlock();
+	if (!obj)
+		return node ? -EACCES : -EINVAL;
+
+	return i915_gem_object_mmap(obj, mmo, vma);
+}
+
+int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_device *dev = &i915->drm;
+	struct i915_mmap_offset *mmo = NULL;
+	enum i915_mmap_type mmap_type;
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+
+	if (drm_dev_is_unplugged(dev))
+		return -ENODEV;
+
+	mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
+	mmo = mmap_offset_attach(obj, mmap_type, NULL);
+	if (!mmo)
+		return -ENODEV;
+
+	/*
+	 * When we install vm_ops for mmap we are too late for
+	 * the vm_ops->open() which increases the ref_count of
+	 * this obj and then it gets decreased by the vm_ops->close().
+	 * To balance this increase the obj ref_count here.
+	 */
+	obj = i915_gem_object_get(mmo->obj);
+	return i915_gem_object_mmap(obj, mmo, vma);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_gem_mman.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 1fa91b3033b3..196417fd0f5c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -29,5 +29,5 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
 void i915_gem_object_runtime_pm_release_mmap_offset(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
-
+int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma);
 #endif
-- 
2.39.0

