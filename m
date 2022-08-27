Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F85A39CF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CA10ED3D;
	Sat, 27 Aug 2022 19:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C686710ED34;
 Sat, 27 Aug 2022 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629551; x=1693165551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o9lyCbybBko0QkDW5kVWW4v4cWEpuFQatY7Z9pbwono=;
 b=GBoEevGD5YrApaaseFz1Vu6QoHvwhxxmIfo73SbqCwBEn40EVMClC4Kp
 PVzMwzX8LU2vJwl4YB81CqzhD3TPrRUBw8p9YZCVp3qWHnYdZqaY71nkt
 gUnjI9qQjGVHEQI84drJo8KkmsaaU3KJq/cGE6Bla40Zq/00dKCgUVPtu
 cLaQUmHw79XquHOFbTZJznhY00Kx0g8KYX3kI4XFf1VR02AMylf3LAu8A
 bBHsoUtLvqwCvFHbSK+4/hAM/6spKx3H7KRbAe1/vCfJBkARvtQJQl5hx
 iHlKE+UUKtbmy6k+Pfdvmydvs20Xg1gRpW+GjXJp5GdV8vFJZIXh1HsXn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="356401157"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="356401157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="561789200"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:47 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 05/17] drm/i915: Support for VM private BOs
Date: Sat, 27 Aug 2022 21:43:51 +0200
Message-Id: <20220827194403.6495-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Each VM creates a root_obj and shares it with all of its private objects
to use it as dma_resv object. This has a performance advantage as it
requires a single dma_resv object update for all private BOs vs list of
dma_resv objects update for shared BOs, in the execbuf path.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c | 9 +++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c                | 4 ++++
 drivers/gpu/drm/i915/gt/intel_gtt.h                | 2 ++
 drivers/gpu/drm/i915/i915_vma.c                    | 1 +
 drivers/gpu/drm/i915/i915_vma_types.h              | 2 ++
 6 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 9f6b14ec189a2..46308dcf39e99 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -241,6 +241,9 @@ struct drm_i915_gem_object {
 
 	const struct drm_i915_gem_object_ops *ops;
 
+	/* For VM private BO, points to root_obj in VM. NULL otherwise */
+	struct drm_i915_gem_object *priv_root;
+
 	struct {
 		/**
 		 * @vma.lock: protect the list/tree of vmas
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index dadd1d4b1761b..9ff929f187cfd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -93,6 +93,7 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 
 	if (!list_empty(&vma->vm_bind_link)) {
 		list_del_init(&vma->vm_bind_link);
+		list_del_init(&vma->non_priv_vm_bind_link);
 		i915_vm_bind_it_remove(vma, &vma->vm->va);
 
 		/* Release object */
@@ -219,6 +220,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		goto put_obj;
 	}
 
+	if (obj->priv_root && obj->priv_root != vm->root_obj) {
+		ret = -EINVAL;
+		goto put_obj;
+	}
+
 	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
 	if (ret)
 		goto put_obj;
@@ -244,6 +250,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
+		if (!obj->priv_root)
+			list_add_tail(&vma->non_priv_vm_bind_link,
+				      &vm->non_priv_vm_bind_list);
 
 out_ww:
 		if (ret == -EDEADLK) {
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index cb188377b7bd9..c4f75826213ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -177,6 +177,7 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
 void i915_address_space_fini(struct i915_address_space *vm)
 {
 	drm_mm_takedown(&vm->mm);
+	i915_gem_object_put(vm->root_obj);
 	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
 	mutex_destroy(&vm->vm_bind_lock);
 }
@@ -292,6 +293,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->vm_bind_list);
 	INIT_LIST_HEAD(&vm->vm_bound_list);
 	mutex_init(&vm->vm_bind_lock);
+	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
+	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
+	GEM_BUG_ON(IS_ERR(vm->root_obj));
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 06a259475816b..9a2665e4ec2e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -267,6 +267,8 @@ struct i915_address_space {
 	struct list_head vm_bound_list;
 	/* @va: tree of persistent vmas */
 	struct rb_root_cached va;
+	struct list_head non_priv_vm_bind_list;
+	struct drm_i915_gem_object *root_obj;
 
 	/* Global GTT */
 	bool is_ggtt:1;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 092ae4309d8a1..239346e0c07f2 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -236,6 +236,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	mutex_unlock(&vm->mutex);
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
+	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index f746fecae85ed..de5534d518cdd 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -291,6 +291,8 @@ struct i915_vma {
 
 	/** @vm_bind_link: node for the vm_bind related lists of vm */
 	struct list_head vm_bind_link;
+	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
+	struct list_head non_priv_vm_bind_link;
 
 	/** Interval tree structures for persistent vma */
 
-- 
2.34.1

