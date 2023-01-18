Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730F6714D0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F6C10E6C7;
	Wed, 18 Jan 2023 07:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981210E68D;
 Wed, 18 Jan 2023 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026175; x=1705562175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wnRZA+Lm3glCxsDrwjy2yIVbP8ip/mA21zKS7CGGhx8=;
 b=nlWDLj2Feh1AdubWLf8yRLSQG9y+Co3si0VD+c9EEmacDkE2a/uB3yjk
 YtotJ1xMeiTITswPHpFOX21x2P4pap+7QPgOmfWQR2RMimSXSW5QvfWUK
 rmIrQ4Xqd81hHAWg5rKeA9Y4aRiAh7SclCOZgQATKw2svKj5ZfVHNiord
 /n+o6bZSM5eg7Irl+TdYTEuuSWkfo7kxDIbTXyTWpF0+C7bh+qL+A20UV
 p783akPyMLAwutbmlm8CmfWbWExFoyVn1VBU7b9sAHA6tUsZIMb4cHRHf
 rQD40uLEhTHK+xHq4qX9Ls4F7QB6+WiOQrQdBnBdu1O1SknySzgHaYe5P w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482037"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482037"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661609976"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661609976"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:14 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 05/23] drm/i915/vm_bind: Add support to create persistent
 vma
Date: Tue, 17 Jan 2023 23:15:51 -0800
Message-Id: <20230118071609.17572-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add i915_vma_instance_persistent() to create persistent vmas.
Persistent vmas will use i915_gtt_view to support partial binding.

vma_lookup is tied to segment of the object instead of section
of VA space. Hence, it do not support aliasing. ie., multiple
mappings (at different VA) point to the same gtt_view of object.
Skip vma_lookup for persistent vmas to support aliasing.

v2: Remove unused I915_VMA_PERSISTENT definition,
    update validity check in i915_vma_compare(),
    remove unwanted is_persistent check in release_references().

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c       | 36 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.h       | 17 ++++++++++++-
 drivers/gpu/drm/i915/i915_vma_types.h |  6 +++++
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 79b2e19a299f..e43cbb5fa154 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -111,7 +111,8 @@ static void __i915_vma_retire(struct i915_active *ref)
 static struct i915_vma *
 vma_create(struct drm_i915_gem_object *obj,
 	   struct i915_address_space *vm,
-	   const struct i915_gtt_view *view)
+	   const struct i915_gtt_view *view,
+	   bool skip_lookup_cache)
 {
 	struct i915_vma *pos = ERR_PTR(-E2BIG);
 	struct i915_vma *vma;
@@ -198,6 +199,9 @@ vma_create(struct drm_i915_gem_object *obj,
 		__set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
 	}
 
+	if (skip_lookup_cache)
+		goto skip_rb_insert;
+
 	rb = NULL;
 	p = &obj->vma.tree.rb_node;
 	while (*p) {
@@ -222,6 +226,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	rb_link_node(&vma->obj_node, rb, p);
 	rb_insert_color(&vma->obj_node, &obj->vma.tree);
 
+skip_rb_insert:
 	if (i915_vma_is_ggtt(vma))
 		/*
 		 * We put the GGTT vma at the start of the vma-list, followed
@@ -301,7 +306,34 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 
 	/* vma_create() will resolve the race if another creates the vma */
 	if (unlikely(!vma))
-		vma = vma_create(obj, vm, view);
+		vma = vma_create(obj, vm, view, false);
+
+	GEM_BUG_ON(!IS_ERR(vma) && i915_vma_compare(vma, vm, view));
+	return vma;
+}
+
+/**
+ * i915_vma_create_persistent - create a persistent VMA
+ * @obj: parent &struct drm_i915_gem_object to be mapped
+ * @vm: address space in which the mapping is located
+ * @view: additional mapping requirements
+ *
+ * Creates a persistent vma.
+ *
+ * Returns the vma, or an error pointer.
+ */
+struct i915_vma *
+i915_vma_create_persistent(struct drm_i915_gem_object *obj,
+			   struct i915_address_space *vm,
+			   const struct i915_gtt_view *view)
+{
+	struct i915_vma *vma;
+
+	GEM_BUG_ON(!kref_read(&vm->ref));
+
+	vma = vma_create(obj, vm, view, true);
+	if (!IS_ERR(vma))
+		i915_vma_set_persistent(vma);
 
 	GEM_BUG_ON(!IS_ERR(vma) && i915_vma_compare(vma, vm, view));
 	return vma;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index ed5c9d682a1b..dd9951a41ff3 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -44,6 +44,10 @@ struct i915_vma *
 i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
 		  const struct i915_gtt_view *view);
+struct i915_vma *
+i915_vma_create_persistent(struct drm_i915_gem_object *obj,
+			   struct i915_address_space *vm,
+			   const struct i915_gtt_view *view);
 
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
@@ -185,6 +189,16 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
 	return i915_vm_to_ggtt(vma->vm)->pin_bias;
 }
 
+static inline bool i915_vma_is_persistent(const struct i915_vma *vma)
+{
+	return test_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
+}
+
+static inline void i915_vma_set_persistent(struct i915_vma *vma)
+{
+	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
+}
+
 static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
 {
 	i915_gem_object_get(vma->obj);
@@ -211,7 +225,8 @@ i915_vma_compare(struct i915_vma *vma,
 {
 	ptrdiff_t cmp;
 
-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
+	GEM_BUG_ON(view && !(i915_is_ggtt_or_dpt(vm) ||
+			     i915_vma_is_persistent(vma)));
 
 	cmp = ptrdiff(vma->vm, vm);
 	if (cmp)
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 77fda2244d16..be1cd76304cb 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -265,6 +265,12 @@ struct i915_vma {
 #define I915_VMA_SCANOUT_BIT	17
 #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
 
+/**
+ * I915_VMA_PERSISTENT_BIT:
+ * The vma is persistent (created with VM_BIND call).
+ */
+#define I915_VMA_PERSISTENT_BIT	19
+
 	struct i915_active active;
 
 #define I915_VMA_PAGES_BIAS 24
-- 
2.21.0.rc0.32.g243a4c7e27

