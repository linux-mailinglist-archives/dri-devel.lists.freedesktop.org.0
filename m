Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DE467C6E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 18:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F472CCD;
	Fri,  3 Dec 2021 17:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1320772CCD;
 Fri,  3 Dec 2021 17:22:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="237241374"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="237241374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:22:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="460105675"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:21:59 -0800
Date: Fri, 3 Dec 2021 22:55:14 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 3/8] drm/i915/gtt: add gtt mappable plumbing
Message-ID: <20211203172514.GA27873@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211203122426.2859679-4-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: bob.beckett@collabora.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-03 at 12:24:21 +0000, Matthew Auld wrote:
> With object clearing/copying we need to be able to modify the PTEs on
> the fly via some batch buffer, which means we need to be able to map the
> paging structures(or at the very least the PT, but being able to also
> map the PD might also be useful at some point) into the GTT. And since
> the paging structures must reside in LMEM on discrete, we need to ensure
> that these objects have correct physical alignment, as per any min page
> restrictions, like on DG2. This is potentially costly, but this should
> be limited to the special migrate_vm, which only needs to a few fixed
> sized windows.

Matt,

Just a thought. instead of classifying whole ppgtt as VM_GTT_MAPPABLE
and rounding up the pt size to min_page_size,
could we just add size of pt as parameter into i915_vm_alloc_pt_stash
and alloc_pt, which can be used for vm->alloc_pt_dma() instead of
I915_GTT_PAGE_SIZE_4K.

But PT for a smem entries also needs to be 64k aligned to be mapped into
the GTT right? So no advantage of having the pt_stash level physical
alignment..

Any thoughts on this line?

Ram

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c     |  4 ++--
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c |  2 +-
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c            |  2 +-
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c            |  3 ++-
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h            |  1 +
>  drivers/gpu/drm/i915/gt/intel_ggtt.c            |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c              |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c             |  7 +++++++
>  drivers/gpu/drm/i915/gt/intel_gtt.h             |  9 +++++++++
>  drivers/gpu/drm/i915/gt/intel_migrate.c         |  4 +++-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c           | 17 ++++++++++++-----
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c    |  2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c            |  2 +-
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c   |  4 ++--
>  14 files changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ebd775cb1661..b394954726b0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1559,7 +1559,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  	} else if (HAS_FULL_PPGTT(i915)) {
>  		struct i915_ppgtt *ppgtt;
>  
> -		ppgtt = i915_ppgtt_create(&i915->gt, 0);
> +		ppgtt = i915_ppgtt_create(&i915->gt, 0, 0);
>  		if (IS_ERR(ppgtt)) {
>  			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
>  				PTR_ERR(ppgtt));
> @@ -1742,7 +1742,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags)
>  		return -EINVAL;
>  
> -	ppgtt = i915_ppgtt_create(&i915->gt, 0);
> +	ppgtt = i915_ppgtt_create(&i915->gt, 0, 0);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index bd8dc1a28022..c1b86c7a4754 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1764,7 +1764,7 @@ int i915_gem_huge_page_mock_selftests(void)
>  	mkwrite_device_info(dev_priv)->ppgtt_type = INTEL_PPGTT_FULL;
>  	mkwrite_device_info(dev_priv)->ppgtt_size = 48;
>  
> -	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
> +	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0, 0);
>  	if (IS_ERR(ppgtt)) {
>  		err = PTR_ERR(ppgtt);
>  		goto out_unlock;
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index c0d149f04949..778472e563aa 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -443,7 +443,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
>  
>  	mutex_init(&ppgtt->flush);
>  
> -	ppgtt_init(&ppgtt->base, gt, 0);
> +	ppgtt_init(&ppgtt->base, gt, 0, 0);
>  	ppgtt->base.vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen6_pte_t));
>  	ppgtt->base.vm.top = 1;
>  
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 312b2267bf87..dfca803b4ff1 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -912,6 +912,7 @@ gen8_alloc_top_pd(struct i915_address_space *vm)
>   *
>   */
>  struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> +				     unsigned long vm_flags,
>  				     unsigned long lmem_pt_obj_flags)
>  {
>  	struct i915_ppgtt *ppgtt;
> @@ -921,7 +922,7 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>  	if (!ppgtt)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ppgtt_init(ppgtt, gt, lmem_pt_obj_flags);
> +	ppgtt_init(ppgtt, gt, vm_flags, lmem_pt_obj_flags);
>  	ppgtt->vm.top = i915_vm_is_4lvl(&ppgtt->vm) ? 3 : 2;
>  	ppgtt->vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen8_pte_t));
>  
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> index f541d19264b4..c0af12593576 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> @@ -13,6 +13,7 @@ struct intel_gt;
>  enum i915_cache_level;
>  
>  struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> +				     unsigned long vm_flags,
>  				     unsigned long lmem_pt_obj_flags);
>  
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 47f88f031749..938af60fd32f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -661,7 +661,7 @@ static int init_aliasing_ppgtt(struct i915_ggtt *ggtt)
>  	struct i915_ppgtt *ppgtt;
>  	int err;
>  
> -	ppgtt = i915_ppgtt_create(ggtt->vm.gt, 0);
> +	ppgtt = i915_ppgtt_create(ggtt->vm.gt, 0, 0);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 510cda6a163f..991a514a1dc3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -484,7 +484,7 @@ static void intel_gt_fini_scratch(struct intel_gt *gt)
>  static struct i915_address_space *kernel_vm(struct intel_gt *gt)
>  {
>  	if (INTEL_PPGTT(gt->i915) > INTEL_PPGTT_ALIASING)
> -		return &i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY)->vm;
> +		return &i915_ppgtt_create(gt, 0, I915_BO_ALLOC_PM_EARLY)->vm;
>  	else
>  		return i915_vm_get(&gt->ggtt->vm);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 5447615fc6f3..d9bf53dc1d85 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -18,6 +18,13 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
>  {
>  	struct drm_i915_gem_object *obj;
>  
> +	if (vm->vm_flags & I915_VM_GTT_MAPPABLE) {
> +		struct intel_memory_region *mr =
> +			vm->i915->mm.regions[INTEL_REGION_LMEM];
> +
> +		sz = max_t(int, sz, mr->min_page_size);
> +	}
> +
>  	/*
>  	 * To avoid severe over-allocation when dealing with min_page_size
>  	 * restrictions, we override that behaviour here by allowing an object
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index cbc0b5266cb4..eee97b46a1f9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -266,6 +266,13 @@ struct i915_address_space {
>  	u8 pd_shift;
>  	u8 scratch_order;
>  
> +/*
> + * Paging structures are going to accessed via the GTT itself, and therefore
> + * might need special alignment.
> + */
> +#define I915_VM_GTT_MAPPABLE BIT(0)
> +	unsigned long vm_flags;
> +
>  	/* Flags used when creating page-table objects for this vm */
>  	unsigned long lmem_pt_obj_flags;
>  
> @@ -543,6 +550,7 @@ i915_page_dir_dma_addr(const struct i915_ppgtt *ppgtt, const unsigned int n)
>  }
>  
>  void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
> +		unsigned long vm_flags,
>  		unsigned long lmem_pt_obj_flags);
>  
>  int i915_ggtt_probe_hw(struct drm_i915_private *i915);
> @@ -562,6 +570,7 @@ static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>  int i915_ppgtt_init_hw(struct intel_gt *gt);
>  
>  struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt,
> +				     unsigned long vm_flags,
>  				     unsigned long lmem_pt_obj_flags);
>  
>  void i915_ggtt_suspend_vm(struct i915_address_space *vm);
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 2d3188a398dd..d553b76b1168 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -78,7 +78,9 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
>  	 * TODO: Add support for huge LMEM PTEs
>  	 */
>  
> -	vm = i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY);
> +	vm = i915_ppgtt_create(gt,
> +			       I915_VM_GTT_MAPPABLE,
> +			       I915_BO_ALLOC_PM_EARLY);
>  	if (IS_ERR(vm))
>  		return ERR_CAST(vm);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> index b8238f5bc8b1..1218024dfd57 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> @@ -156,20 +156,25 @@ int i915_ppgtt_init_hw(struct intel_gt *gt)
>  }
>  
>  static struct i915_ppgtt *
> -__ppgtt_create(struct intel_gt *gt, unsigned long lmem_pt_obj_flags)
> +__ppgtt_create(struct intel_gt *gt,
> +	       unsigned long vm_flags,
> +	       unsigned long lmem_pt_obj_flags)
>  {
> -	if (GRAPHICS_VER(gt->i915) < 8)
> +	if (GRAPHICS_VER(gt->i915) < 8) {
> +		WARN_ON_ONCE(vm_flags);
>  		return gen6_ppgtt_create(gt);
> -	else
> -		return gen8_ppgtt_create(gt, lmem_pt_obj_flags);
> +	} else {
> +		return gen8_ppgtt_create(gt, vm_flags, lmem_pt_obj_flags);
> +	}
>  }
>  
>  struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt,
> +				     unsigned long vm_flags,
>  				     unsigned long lmem_pt_obj_flags)
>  {
>  	struct i915_ppgtt *ppgtt;
>  
> -	ppgtt = __ppgtt_create(gt, lmem_pt_obj_flags);
> +	ppgtt = __ppgtt_create(gt, vm_flags, lmem_pt_obj_flags);
>  	if (IS_ERR(ppgtt))
>  		return ppgtt;
>  
> @@ -301,6 +306,7 @@ int ppgtt_set_pages(struct i915_vma *vma)
>  }
>  
>  void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
> +		unsigned long vm_flags,
>  		unsigned long lmem_pt_obj_flags)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -309,6 +315,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
>  	ppgtt->vm.i915 = i915;
>  	ppgtt->vm.dma = i915->drm.dev;
>  	ppgtt->vm.total = BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
> +	ppgtt->vm.vm_flags = vm_flags;
>  	ppgtt->vm.lmem_pt_obj_flags = lmem_pt_obj_flags;
>  
>  	dma_resv_init(&ppgtt->vm._resv);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index e5ad4d5a91c0..8c299189e9cb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1600,7 +1600,7 @@ static int igt_reset_evict_ppgtt(void *arg)
>  	if (INTEL_PPGTT(gt->i915) < INTEL_PPGTT_FULL)
>  		return 0;
>  
> -	ppgtt = i915_ppgtt_create(gt, 0);
> +	ppgtt = i915_ppgtt_create(gt, 0, 0);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 6c804102528b..d726eee3aba5 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1386,7 +1386,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
>  	enum intel_engine_id i;
>  	int ret;
>  
> -	ppgtt = i915_ppgtt_create(&i915->gt, I915_BO_ALLOC_PM_EARLY);
> +	ppgtt = i915_ppgtt_create(&i915->gt, 0, I915_BO_ALLOC_PM_EARLY);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index fdb4bf88293b..3bcd2bb85d10 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -155,7 +155,7 @@ static int igt_ppgtt_alloc(void *arg)
>  	if (!HAS_PPGTT(dev_priv))
>  		return 0;
>  
> -	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
> +	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0, 0);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> @@ -1083,7 +1083,7 @@ static int exercise_ppgtt(struct drm_i915_private *dev_priv,
>  	if (IS_ERR(file))
>  		return PTR_ERR(file);
>  
> -	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
> +	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0, 0);
>  	if (IS_ERR(ppgtt)) {
>  		err = PTR_ERR(ppgtt);
>  		goto out_free;
> -- 
> 2.31.1
> 
