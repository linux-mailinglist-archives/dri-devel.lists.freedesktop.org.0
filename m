Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA9563C8B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60363112641;
	Fri,  1 Jul 2022 22:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD98311258C;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tb0MvdXQWUgfg3I07VLT4piGIJ61G90o5PBPvD39px4=;
 b=iQ7FtPE+3Z18DieelYjtl+gNZcf+Z1uQF23DUtBwxQ1ut1vKKzcQ+TUV
 FLPFjoHSy2v9uM89xE0S6JLU6RDQCsdrJ43cvU/tAiNk5b/Q5ReSdPfbV
 qTPVb+Hf44dn/opo0uI0eip/bOg8QhiSeLNDUtt9+UXdv5GKlqtpRKtaO
 VMxq33/HMSSfmndpoJEoIdUBtqtexQHe7dy2LrH7z/al/EyTzBsfYK8bz
 d0XLrWpycj5b2dvOiQxyIjXfOF3Ako/0qiGS2yWlEGiLxdbcyrFSgwy4x
 l1Nx9Y93qNsWIzHXyjY76LnZIGHyf0wwADCAMbZzsIWD1PXqLq9xyQ8Xv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789055"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789055"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645109"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Date: Fri,  1 Jul 2022 15:50:53 -0700
Message-Id: <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For persistent (vm_bind) vmas of userptr BOs, handle the user
page pinning by using the i915_gem_object_userptr_submit_init()
/done() functions

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 67 +++++++++++++++++++
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 16 +++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  1 +
 4 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
index 2079f5ca9010..bf13dd6d642e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
@@ -22,6 +22,7 @@
 #include "i915_gem_vm_bind.h"
 #include "i915_trace.h"
 
+#define __EXEC3_USERPTR_USED		BIT_ULL(34)
 #define __EXEC3_HAS_PIN			BIT_ULL(33)
 #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
 #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
@@ -147,10 +148,36 @@ static void eb_scoop_unbound_vmas(struct i915_address_space *vm)
 	spin_unlock(&vm->vm_rebind_lock);
 }
 
+static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *last_vma = NULL;
+	struct i915_vma *vma;
+	int err;
+
+	assert_vm_bind_held(vm);
+
+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
+		if (i915_gem_object_is_userptr(vma->obj)) {
+			err = i915_gem_object_userptr_submit_init(vma->obj);
+			if (err)
+				return err;
+
+			last_vma = vma;
+		}
+	}
+
+	if (last_vma)
+		eb->args->flags |= __EXEC3_USERPTR_USED;
+
+	return 0;
+}
+
 static int eb_lookup_vmas(struct i915_execbuffer *eb)
 {
 	unsigned int i, current_batch = 0;
 	struct i915_vma *vma;
+	int err = 0;
 
 	for (i = 0; i < eb->num_batches; i++) {
 		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
@@ -163,6 +190,10 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 
 	eb_scoop_unbound_vmas(eb->context->vm);
 
+	err = eb_lookup_persistent_userptr_vmas(eb);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -358,15 +389,51 @@ static void eb_persistent_vmas_move_to_active(struct i915_execbuffer *eb)
 
 static int eb_move_to_gpu(struct i915_execbuffer *eb)
 {
+	int err = 0, j;
+
 	assert_vm_bind_held(eb->context->vm);
 	assert_vm_priv_held(eb->context->vm);
 
 	eb_persistent_vmas_move_to_active(eb);
 
+#ifdef CONFIG_MMU_NOTIFIER
+	if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
+		struct i915_vma *vma;
+
+		assert_vm_bind_held(eb->context->vm);
+		assert_vm_priv_held(eb->context->vm);
+
+		read_lock(&eb->i915->mm.notifier_lock);
+		list_for_each_entry(vma, &eb->context->vm->vm_bind_list,
+				    vm_bind_link) {
+			if (!i915_gem_object_is_userptr(vma->obj))
+				continue;
+
+			err = i915_gem_object_userptr_submit_done(vma->obj);
+			if (err)
+				break;
+		}
+
+		read_unlock(&eb->i915->mm.notifier_lock);
+	}
+#endif
+
+	if (unlikely(err))
+		goto err_skip;
+
 	/* Unconditionally flush any chipset caches (for streaming writes). */
 	intel_gt_chipset_flush(eb->gt);
 
 	return 0;
+
+err_skip:
+	for_each_batch_create_order(eb, j) {
+		if (!eb->requests[j])
+			break;
+
+		i915_request_set_error_once(eb->requests[j], err);
+	}
+	return err;
 }
 
 static int eb_request_submit(struct i915_execbuffer *eb,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 1a8efa83547f..cae282b91618 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -263,6 +263,12 @@ int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		goto put_obj;
 	}
 
+	if (i915_gem_object_is_userptr(obj)) {
+		ret = i915_gem_object_userptr_submit_init(obj);
+		if (ret)
+			goto put_obj;
+	}
+
 	ret = i915_gem_vm_bind_lock_interruptible(vm);
 	if (ret)
 		goto put_obj;
@@ -295,6 +301,16 @@ int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 	/* Make it evictable */
 	__i915_vma_unpin(vma);
 
+#ifdef CONFIG_MMU_NOTIFIER
+	if (i915_gem_object_is_userptr(obj)) {
+		write_lock(&vm->i915->mm.notifier_lock);
+		ret = i915_gem_object_userptr_submit_done(obj);
+		write_unlock(&vm->i915->mm.notifier_lock);
+		if (ret)
+			goto out_ww;
+	}
+#endif
+
 	list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 	i915_vm_bind_it_insert(vma, &vm->va);
 	if (!obj->priv_root)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 55d5389b2c6c..4ab3bda644ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -295,6 +295,7 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	GEM_BUG_ON(IS_ERR(vm->root_obj));
 	INIT_LIST_HEAD(&vm->vm_rebind_list);
 	spin_lock_init(&vm->vm_rebind_lock);
+	INIT_LIST_HEAD(&vm->invalidate_link);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index fe5485c4a1cd..f9edf11c144f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -267,6 +267,7 @@ struct i915_address_space {
 	struct list_head vm_bound_list;
 	struct list_head vm_rebind_list;
 	spinlock_t vm_rebind_lock;   /* Protects vm_rebind_list */
+	struct list_head invalidate_link;
 	/* va tree of persistent vmas */
 	struct rb_root_cached va;
 	struct list_head non_priv_vm_bind_list;
-- 
2.21.0.rc0.32.g243a4c7e27

