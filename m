Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46446D655E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C53F10E6CA;
	Tue,  4 Apr 2023 14:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA63010E6CA;
 Tue,  4 Apr 2023 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680618728; x=1712154728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fn2JE3+jY7vUoChF7LSeUz2W63B9J5JepalNewiJki0=;
 b=QNhmDwjydgTWU7158Q0qWE3paOZg2i7LvDuoL5DXb0QKocXuD6uHAAzM
 FiU681PJic0jp9ZZKmJx5L7J/wG/SbS+MDzPY+Kl9OD62dOaQ5pKAlhpk
 u3imtJOkJC4CT/8Xu5tKaI37ShrBnde60KDDwHNekc+3ZsoaCvG6Whxle
 0bMa6oEQOCQHppAJd65sUtAWc+5ZHxFYZDDKf0uGvx7un5lWl6fFWVcuy
 QeGUQ231PBDiPCNgug6LmiESY+TRc0OOrPFowbmHD37sDNVvzj5VyzC1v
 uHvlA8IGiJxRC7PW1KkQEwulBk+y/7mBcBA/9hdZLThBbPKUmBchSRN/7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="404960814"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="404960814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688918138"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688918138"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:12 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Add a function to mmap framebuffer obj
Date: Tue,  4 Apr 2023 16:30:58 +0200
Message-Id: <20230404143100.10452-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230404143100.10452-1-nirmoy.das@intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement i915_gem_fb_mmap() to enable fb_ops.fb_mmap()
callback for i915's framebuffer objects.

v2: add a comment why i915_gem_object_get() needed(Andi).
v3: mmap also ttm objects.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 137 +++++++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h |   2 +-
 2 files changed, 93 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index d3c1dee16af2..3dbacdf0911a 100644
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
 
@@ -1043,6 +1005,91 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
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
+	/* handle ttm object */
+	if (obj->ops->mmap_ops) {
+		/*
+		 * ttm fault handler, ttm_bo_vm_fault_reserved() uses fake offset
+		 * to calculate page offset so set that up.
+		 */
+		vma->vm_pgoff += drm_vma_node_start(&obj->base.vma_node);
+	} else {
+		/* handle stolen and smem objects */
+		mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
+		mmo = mmap_offset_attach(obj, mmap_type, NULL);
+		if (!mmo)
+			return -ENODEV;
+	}
+
+	/*
+	 * When we install vm_ops for mmap we are too late for
+	 * the vm_ops->open() which increases the ref_count of
+	 * this obj and then it gets decreased by the vm_ops->close().
+	 * To balance this increase the obj ref_count here.
+	 */
+	obj = i915_gem_object_get(obj);
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

