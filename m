Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE15A7652
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001D10E1DC;
	Wed, 31 Aug 2022 06:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D5410E1D6;
 Wed, 31 Aug 2022 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926444; x=1693462444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IU9LjsqiDl5b+PcETaX+pFTGrMZ7Zck1asCNMpODq8c=;
 b=btpr6Iug+S84fVqzQ/Uu1fwMHgeY+iszFuHu5jwud8S5tbXTeR6CdXgc
 TW1gwXFKCIRmLBrzAkeUewmtMmNiGq07njjU4bj/lsXehhHPwp+zVO/Yq
 KvWK6zf6EK4IHNFywxty5CAJ7yKEIMIS+yKtbKAV8gfIwoagPj685yqC3
 mgV00KQkixjGK+4xjLwi/JslScsIA5TOAY4XrKyz+saaw/gj4fQNJmfcR
 9Zzw7UlVZMdtjAM+Diol+nev/MkgfK3omZh+a4/vQhwW/93MUwGItrL5R
 NGwEMQ7gRVJzNTBID29o1Pdn6VXOGpfuvu3qD17qwis1J2nry1BfYQYfV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295385398"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="295385398"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:14:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="673222966"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:14:03 -0700
Date: Tue, 30 Aug 2022 23:13:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [RFC PATCH v3 05/17] drm/i915: Support for VM private BOs
Message-ID: <20220831061343.GC10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-6-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220827194403.6495-6-andi.shyti@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 09:43:51PM +0200, Andi Shyti wrote:
>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Each VM creates a root_obj and shares it with all of its private objects
>to use it as dma_resv object. This has a performance advantage as it
>requires a single dma_resv object update for all private BOs vs list of
>dma_resv objects update for shared BOs, in the execbuf path.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_object_types.h   | 3 +++
> drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c | 9 +++++++++
> drivers/gpu/drm/i915/gt/intel_gtt.c                | 4 ++++
> drivers/gpu/drm/i915/gt/intel_gtt.h                | 2 ++
> drivers/gpu/drm/i915/i915_vma.c                    | 1 +
> drivers/gpu/drm/i915/i915_vma_types.h              | 2 ++
> 6 files changed, 21 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>index 9f6b14ec189a2..46308dcf39e99 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>@@ -241,6 +241,9 @@ struct drm_i915_gem_object {
>
> 	const struct drm_i915_gem_object_ops *ops;
>
>+	/* For VM private BO, points to root_obj in VM. NULL otherwise */
>+	struct drm_i915_gem_object *priv_root;
>+
> 	struct {
> 		/**
> 		 * @vma.lock: protect the list/tree of vmas
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>index dadd1d4b1761b..9ff929f187cfd 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>@@ -93,6 +93,7 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>
> 	if (!list_empty(&vma->vm_bind_link)) {
> 		list_del_init(&vma->vm_bind_link);
>+		list_del_init(&vma->non_priv_vm_bind_link);
> 		i915_vm_bind_it_remove(vma, &vma->vm->va);
>
> 		/* Release object */
>@@ -219,6 +220,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		goto put_obj;
> 	}
>
>+	if (obj->priv_root && obj->priv_root != vm->root_obj) {
>+		ret = -EINVAL;
>+		goto put_obj;
>+	}
>+
> 	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
> 	if (ret)
> 		goto put_obj;
>@@ -244,6 +250,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>
> 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
> 		i915_vm_bind_it_insert(vma, &vm->va);
>+		if (!obj->priv_root)
>+			list_add_tail(&vma->non_priv_vm_bind_link,
>+				      &vm->non_priv_vm_bind_list);
>
> out_ww:
> 		if (ret == -EDEADLK) {
>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>index cb188377b7bd9..c4f75826213ae 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>@@ -177,6 +177,7 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
> void i915_address_space_fini(struct i915_address_space *vm)
> {
> 	drm_mm_takedown(&vm->mm);
>+	i915_gem_object_put(vm->root_obj);
> 	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
> 	mutex_destroy(&vm->vm_bind_lock);
> }
>@@ -292,6 +293,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
> 	INIT_LIST_HEAD(&vm->vm_bind_list);
> 	INIT_LIST_HEAD(&vm->vm_bound_list);
> 	mutex_init(&vm->vm_bind_lock);
>+	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>+	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
>+	GEM_BUG_ON(IS_ERR(vm->root_obj));
> }
>
> void *__px_vaddr(struct drm_i915_gem_object *p)
>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>index 06a259475816b..9a2665e4ec2e5 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>@@ -267,6 +267,8 @@ struct i915_address_space {
> 	struct list_head vm_bound_list;
> 	/* @va: tree of persistent vmas */
> 	struct rb_root_cached va;
>+	struct list_head non_priv_vm_bind_list;
>+	struct drm_i915_gem_object *root_obj;
>
> 	/* Global GTT */
> 	bool is_ggtt:1;
>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>index 092ae4309d8a1..239346e0c07f2 100644
>--- a/drivers/gpu/drm/i915/i915_vma.c
>+++ b/drivers/gpu/drm/i915/i915_vma.c
>@@ -236,6 +236,7 @@ vma_create(struct drm_i915_gem_object *obj,
> 	mutex_unlock(&vm->mutex);
>
> 	INIT_LIST_HEAD(&vma->vm_bind_link);
>+	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
> 	return vma;
>
> err_unlock:
>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>index f746fecae85ed..de5534d518cdd 100644
>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>@@ -291,6 +291,8 @@ struct i915_vma {
>
> 	/** @vm_bind_link: node for the vm_bind related lists of vm */
> 	struct list_head vm_bind_link;
>+	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
>+	struct list_head non_priv_vm_bind_link;
>
> 	/** Interval tree structures for persistent vma */
>

I am not seeing the upai part to allow user to specify an object as private.

Niranjana

>-- 
>2.34.1
>
