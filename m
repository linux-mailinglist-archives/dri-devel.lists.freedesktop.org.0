Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3B4798A1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 05:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16F10EB69;
	Sat, 18 Dec 2021 04:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC36D10EB69;
 Sat, 18 Dec 2021 04:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639802684; x=1671338684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zHcriWDLQt29cwpk07Ft9aikF1Gm3xVGIOfBiZ/jFII=;
 b=NZSnWYJPB7Ey7LfDxLIw/2P1uE3sEcDV1EFRjBVACJZIQnklkHwMmGnH
 qPB0kj5Lugl5Ti9Q72BigehaLUbarMHUXhOTsDkWwskuYmj0OktESgxdC
 3xLUBIvk0rBKXN4eb0JDTwIhZrq6h70nfa17f9UIAhAVj5WwfgoFqpSp8
 BBAG+WrgE9aiu3ikpWnTzYhIX2PfdCEaa+IdtvZvGfXhO5ySbQK6HcYyI
 bl5pbclXjAPRNcjQc1EyGFd1wmVlUXlK9AM710cXhSI3m7ne2PXpWTwel
 e7UtBo8ZHqvwp5rynGdaQ+WTJrCebDTL0+THmABKjoHdtWODNGOvmlmq9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="326177850"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="326177850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:44:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="507020579"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:44:43 -0800
Date: Fri, 17 Dec 2021 20:44:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 11/16] drm/i915/gem: Use to_gt() helper for GGTT
 accesses
Message-ID: <Yb1nOvhiQIVopeEU@mdroper-desk1.amr.corp.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-12-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214193346.21231-12-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 09:33:41PM +0200, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 19 ++++++++++---------
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  6 +++---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  8 +++++---
>  drivers/gpu/drm/i915/gem/i915_gem_tiling.c    | 15 ++++++++-------
>  .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_mman.c    | 19 ++++++++++---------
>  .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
>  11 files changed, 42 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index babfecb17ad1..e5b0f66ea1fe 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -174,7 +174,7 @@ i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
>  
>  	vm = ctx->vm;
>  	if (!vm)
> -		vm = &ctx->i915->ggtt.vm;
> +		vm = &to_gt(ctx->i915)->ggtt->vm;
>  	vm = i915_vm_get(vm);
>  
>  	return vm;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index ec7c4a29a720..3078611d5bfe 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1106,7 +1106,7 @@ static inline struct i915_ggtt *cache_to_ggtt(struct reloc_cache *cache)
>  {
>  	struct drm_i915_private *i915 =
>  		container_of(cache, struct i915_execbuffer, reloc_cache)->i915;
> -	return &i915->ggtt;
> +	return to_gt(i915)->ggtt;
>  }
>  
>  static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer *eb)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 1ca5c062974e..a9effb34d7ed 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -295,7 +295,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  	struct drm_device *dev = obj->base.dev;
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct intel_runtime_pm *rpm = &i915->runtime_pm;
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	bool write = area->vm_flags & VM_WRITE;
>  	struct i915_gem_ww_ctx ww;
>  	intel_wakeref_t wakeref;
> @@ -388,16 +388,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  	assert_rpm_wakelock_held(rpm);
>  
>  	/* Mark as being mmapped into userspace for later revocation */
> -	mutex_lock(&i915->ggtt.vm.mutex);
> +	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
>  	if (!i915_vma_set_userfault(vma) && !obj->userfault_count++)
> -		list_add(&obj->userfault_link, &i915->ggtt.userfault_list);
> -	mutex_unlock(&i915->ggtt.vm.mutex);
> +		list_add(&obj->userfault_link, &to_gt(i915)->ggtt->userfault_list);
> +	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
>  
>  	/* Track the mmo associated with the fenced vma */
>  	vma->mmo = mmo;
>  
>  	if (CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
> -		intel_wakeref_auto(&i915->ggtt.userfault_wakeref,
> +		intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref,
>  				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
>  
>  	if (write) {
> @@ -512,7 +512,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
>  	 * wakeref.
>  	 */
>  	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> -	mutex_lock(&i915->ggtt.vm.mutex);
> +	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
>  
>  	if (!obj->userfault_count)
>  		goto out;
> @@ -530,7 +530,7 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
>  	wmb();
>  
>  out:
> -	mutex_unlock(&i915->ggtt.vm.mutex);
> +	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
>  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>  }
>  
> @@ -733,13 +733,14 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>  			  u32 handle,
>  			  u64 *offset)
>  {
> +	struct drm_i915_private *i915 = to_i915(dev);
>  	enum i915_mmap_type mmap_type;
>  
>  	if (HAS_LMEM(to_i915(dev)))
>  		mmap_type = I915_MMAP_TYPE_FIXED;
>  	else if (boot_cpu_has(X86_FEATURE_PAT))
>  		mmap_type = I915_MMAP_TYPE_WC;
> -	else if (!i915_ggtt_has_aperture(&to_i915(dev)->ggtt))
> +	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  		return -ENODEV;
>  	else
>  		mmap_type = I915_MMAP_TYPE_GTT;
> @@ -787,7 +788,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  
>  	switch (args->flags) {
>  	case I915_MMAP_OFFSET_GTT:
> -		if (!i915_ggtt_has_aperture(&i915->ggtt))
> +		if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  			return -ENODEV;
>  		type = I915_MMAP_TYPE_GTT;
>  		break;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index ac56124760e1..6da68b38f00f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -23,7 +23,7 @@ void i915_gem_suspend(struct drm_i915_private *i915)
>  {
>  	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
>  
> -	intel_wakeref_auto(&i915->ggtt.userfault_wakeref, 0);
> +	intel_wakeref_auto(&to_gt(i915)->ggtt->userfault_wakeref, 0);
>  	flush_workqueue(i915->wq);
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 05a1ba2f2e7b..793fbf3da46b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -403,9 +403,9 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>  					       I915_SHRINK_VMAPS);
>  
>  	/* We also want to clear any cached iomaps as they wrap vmap */
> -	mutex_lock(&i915->ggtt.vm.mutex);
> +	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
>  	list_for_each_entry_safe(vma, next,
> -				 &i915->ggtt.vm.bound_list, vm_link) {
> +				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
>  		unsigned long count = vma->node.size >> PAGE_SHIFT;
>  
>  		if (!vma->iomap || i915_vma_is_active(vma))
> @@ -414,7 +414,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>  		if (__i915_vma_unbind(vma) == 0)
>  			freed_pages += count;
>  	}
> -	mutex_unlock(&i915->ggtt.vm.mutex);
> +	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
>  
>  	*(unsigned long *)ptr += freed_pages;
>  	return NOTIFY_DONE;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index ba90ab47d838..4bbf37c1089a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -71,7 +71,7 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>  static int i915_adjust_stolen(struct drm_i915_private *i915,
>  			      struct resource *dsm)
>  {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  	struct resource *r;
>  
> @@ -579,6 +579,7 @@ i915_pages_create_for_stolen(struct drm_device *dev,
>  
>  static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct sg_table *pages =
>  		i915_pages_create_for_stolen(obj->base.dev,
>  					     obj->stolen->start,
> @@ -586,7 +587,7 @@ static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
>  	if (IS_ERR(pages))
>  		return PTR_ERR(pages);
>  
> -	dbg_poison(&to_i915(obj->base.dev)->ggtt,
> +	dbg_poison(to_gt(i915)->ggtt,
>  		   sg_dma_address(pages->sgl),
>  		   sg_dma_len(pages->sgl),
>  		   POISON_INUSE);
> @@ -599,9 +600,10 @@ static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
>  static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
>  					     struct sg_table *pages)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	/* Should only be called from i915_gem_object_release_stolen() */
>  
> -	dbg_poison(&to_i915(obj->base.dev)->ggtt,
> +	dbg_poison(to_gt(i915)->ggtt,
>  		   sg_dma_address(pages->sgl),
>  		   sg_dma_len(pages->sgl),
>  		   POISON_FREE);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> index ef4d0f7dc118..c3d432e314c9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> @@ -181,7 +181,8 @@ static int
>  i915_gem_object_fence_prepare(struct drm_i915_gem_object *obj,
>  			      int tiling_mode, unsigned int stride)
>  {
> -	struct i915_ggtt *ggtt = &to_i915(obj->base.dev)->ggtt;
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct i915_vma *vma, *vn;
>  	LIST_HEAD(unbind);
>  	int ret = 0;
> @@ -336,7 +337,7 @@ i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
>  	struct drm_i915_gem_object *obj;
>  	int err;
>  
> -	if (!dev_priv->ggtt.num_fences)
> +	if (!to_gt(dev_priv)->ggtt->num_fences)
>  		return -EOPNOTSUPP;
>  
>  	obj = i915_gem_object_lookup(file, args->handle);
> @@ -362,9 +363,9 @@ i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
>  		args->stride = 0;
>  	} else {
>  		if (args->tiling_mode == I915_TILING_X)
> -			args->swizzle_mode = to_i915(dev)->ggtt.bit_6_swizzle_x;
> +			args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_x;
>  		else
> -			args->swizzle_mode = to_i915(dev)->ggtt.bit_6_swizzle_y;
> +			args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_y;
>  
>  		/* Hide bit 17 swizzling from the user.  This prevents old Mesa
>  		 * from aborting the application on sw fallbacks to bit 17,
> @@ -419,7 +420,7 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
>  	struct drm_i915_gem_object *obj;
>  	int err = -ENOENT;
>  
> -	if (!dev_priv->ggtt.num_fences)
> +	if (!to_gt(dev_priv)->ggtt->num_fences)
>  		return -EOPNOTSUPP;
>  
>  	rcu_read_lock();
> @@ -435,10 +436,10 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
>  
>  	switch (args->tiling_mode) {
>  	case I915_TILING_X:
> -		args->swizzle_mode = dev_priv->ggtt.bit_6_swizzle_x;
> +		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_x;
>  		break;
>  	case I915_TILING_Y:
> -		args->swizzle_mode = dev_priv->ggtt.bit_6_swizzle_y;
> +		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_y;
>  		break;
>  	default:
>  	case I915_TILING_NONE:
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> index 75947e9dada2..c08f766e6e15 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> @@ -543,7 +543,7 @@ static bool has_bit17_swizzle(int sw)
>  
>  static bool bad_swizzling(struct drm_i915_private *i915)
>  {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  
>  	if (i915->quirks & QUIRK_PIN_SWIZZLED_PAGES)
>  		return true;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 45398adda9c8..250fe3ba6def 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -1374,7 +1374,7 @@ static int igt_ctx_readonly(void *arg)
>  		goto out_file;
>  	}
>  
> -	vm = ctx->vm ?: &i915->ggtt.alias->vm;
> +	vm = ctx->vm ?: &to_gt(i915)->ggtt->alias->vm;
>  	if (!vm || !vm->has_read_only) {
>  		err = 0;
>  		goto out_file;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 743e6ab2c40b..743a098facf2 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -307,7 +307,7 @@ static int igt_partial_tiling(void *arg)
>  	int tiling;
>  	int err;
>  
> -	if (!i915_ggtt_has_aperture(&i915->ggtt))
> +	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  		return 0;
>  
>  	/* We want to check the page mapping and fencing of a large object
> @@ -320,7 +320,7 @@ static int igt_partial_tiling(void *arg)
>  
>  	obj = huge_gem_object(i915,
>  			      nreal << PAGE_SHIFT,
> -			      (1 + next_prime_number(i915->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
> +			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> @@ -366,10 +366,10 @@ static int igt_partial_tiling(void *arg)
>  		tile.tiling = tiling;
>  		switch (tiling) {
>  		case I915_TILING_X:
> -			tile.swizzle = i915->ggtt.bit_6_swizzle_x;
> +			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
>  			break;
>  		case I915_TILING_Y:
> -			tile.swizzle = i915->ggtt.bit_6_swizzle_y;
> +			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
>  			break;
>  		}
>  
> @@ -440,7 +440,7 @@ static int igt_smoke_tiling(void *arg)
>  	IGT_TIMEOUT(end);
>  	int err;
>  
> -	if (!i915_ggtt_has_aperture(&i915->ggtt))
> +	if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  		return 0;
>  
>  	/*
> @@ -457,7 +457,7 @@ static int igt_smoke_tiling(void *arg)
>  
>  	obj = huge_gem_object(i915,
>  			      nreal << PAGE_SHIFT,
> -			      (1 + next_prime_number(i915->ggtt.vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
> +			      (1 + next_prime_number(to_gt(i915)->ggtt->vm.total >> PAGE_SHIFT)) << PAGE_SHIFT);
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> @@ -486,10 +486,10 @@ static int igt_smoke_tiling(void *arg)
>  			break;
>  
>  		case I915_TILING_X:
> -			tile.swizzle = i915->ggtt.bit_6_swizzle_x;
> +			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_x;
>  			break;
>  		case I915_TILING_Y:
> -			tile.swizzle = i915->ggtt.bit_6_swizzle_y;
> +			tile.swizzle = to_gt(i915)->ggtt->bit_6_swizzle_y;
>  			break;
>  		}
>  
> @@ -856,6 +856,7 @@ static int wc_check(struct drm_i915_gem_object *obj)
>  
>  static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	bool no_map;
>  
>  	if (obj->ops->mmap_offset)
> @@ -864,7 +865,7 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
>  		return false;
>  
>  	if (type == I915_MMAP_TYPE_GTT &&
> -	    !i915_ggtt_has_aperture(&to_i915(obj->base.dev)->ggtt))
> +	    !i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>  		return false;
>  
>  	i915_gem_object_lock(obj, NULL);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> index 740ee8086a27..fe0a890775e2 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
> @@ -43,7 +43,7 @@ static int igt_gem_huge(void *arg)
>  
>  	obj = huge_gem_object(i915,
>  			      nreal * PAGE_SIZE,
> -			      i915->ggtt.vm.total + PAGE_SIZE);
> +			      to_gt(i915)->ggtt->vm.total + PAGE_SIZE);
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
