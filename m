Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3620A63BA8E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7DA10E395;
	Tue, 29 Nov 2022 07:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25E410E36F;
 Tue, 29 Nov 2022 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706806; x=1701242806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KupvUpajx43EB36QMrwrK+XPCd6Kyjp5RaZGV30VYY8=;
 b=M9ga8HMZSpfsK0myKFoFT3F1JnBWM0sCeggZWRlCBjQwvSzdNIVXw1DH
 xd2N/5fll9iNbuas0znmyxk2/PHMFmOuutvJMiMfxevmHJqEqH+WeoamG
 6Q4afsLsUdLlNht1uyCiWhh24x+iDYhzbrXdL41aba9Q1GqFIYAYADD4h
 ql82iPdqojJA7e2KmEFnaDpDLy4GmZBApIdu9KJyf+F6Q+UyXUaPEqoml
 x+40RdO+9QYcDMQMmeRvtTFr3lmmn9msuG7l9UltARv2uDPrZb1WEKK1m
 Ac3p7w8FCHhowB/EglzLpubdvK2OKnLithLS+3M9jJR+Ha6Yi8bhW2UFM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418329"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418329"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525563"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525563"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:42 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 04/22] drm/i915/vm_bind: Add support to create persistent
 vma
Date: Mon, 28 Nov 2022 23:26:17 -0800
Message-Id: <20221129072635.847-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
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
index 726705b10637..9462a29764eb 100644
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
index 0757977a489b..0a4662fbe6c3 100644
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
@@ -139,6 +143,16 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
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
@@ -165,7 +179,8 @@ i915_vma_compare(struct i915_vma *vma,
 {
 	ptrdiff_t cmp;
 
-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
+	GEM_BUG_ON(view && !(i915_is_ggtt_or_dpt(vm) ||
+			     i915_vma_is_persistent(vma)));
 
 	cmp = ptrdiff(vma->vm, vm);
 	if (cmp)
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index ec0f6c9f57d0..3144d71a0c3e 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -264,6 +264,12 @@ struct i915_vma {
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

