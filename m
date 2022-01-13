Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5E48D9DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531E10E23C;
	Thu, 13 Jan 2022 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15110E22B;
 Thu, 13 Jan 2022 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642085006; x=1673621006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JTga5T9902wPhLUvhbpV+gw1e9iovsxVL4IrVjgBlRo=;
 b=bCPGsfP8PpzDsq8GYGSRL3CnHyPG8CDlE4Mr5d2tp6uw7wfh3jMr1CnF
 nkZF1NzuKNllb+Ca+QN8O5FeA2hc/36gQ+GiTO/Y5gaz/y08+9vJR3jVZ
 oH0yy2vEwO9gqvNxjiihG/2Q5AAggbJdeLbFX/vFrO9DqMPV14toHMeMd
 svQOf0/2eT6wEs21VMVah7UXlDdQnDPXYQUiHIYGu/Z1YeESazcLIwQb7
 92T7VC5F7PvLqU47OXkYzplZNf1692gh0kGxppsjelqLRSR79wolaltF9
 rIZWUZyFX0wcH7aSO+zm7j0r92MMzzlSRfznpoWUnE9m4we+dYQs1U6rY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268372665"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="268372665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:43:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="670531169"
Received: from inechita-mobl2.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:43:24 -0800
Message-ID: <e6e2e00e-bbbb-6f58-869d-a2cba234321d@linux.intel.com>
Date: Thu, 13 Jan 2022 15:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 3/6] drm/i915: Add object locking to
 i915_gem_evict_for_node and i915_gem_evict_something, v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
 <20220113114500.2039439-4-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220113114500.2039439-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/22 12:44, Maarten Lankhorst wrote:
> Because we will start to require the obj->resv lock for unbinding,
> ensure these shrinker functions also take the lock.
Perhaps "vma eviction utilities" rather than "shrinker functions"?
>
> This requires some function signature changes, to ensure that the
> ww context is passed around, but is mostly straightforward.
>
> Previously this was split up into several patches, but reworking
> should allow for easier bisection.
>
> Changes since v1:
> - Handle dead objects better.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
>   drivers/gpu/drm/i915/gvt/aperture_gm.c        |  2 +-
>   drivers/gpu/drm/i915/i915_gem_evict.c         | 67 +++++++++++++++++--
>   drivers/gpu/drm/i915/i915_gem_evict.h         |  2 +
>   drivers/gpu/drm/i915/i915_gem_gtt.c           |  8 ++-
>   drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +
>   drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>   drivers/gpu/drm/i915/i915_vma.c               |  9 +--
>   .../gpu/drm/i915/selftests/i915_gem_evict.c   | 17 ++---
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  6 +-
>   11 files changed, 91 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index a1b2761bc16e..da7f54b6fa38 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -506,7 +506,7 @@ static int ggtt_reserve_guc_top(struct i915_ggtt *ggtt)
>   	GEM_BUG_ON(ggtt->vm.total <= GUC_GGTT_TOP);
>   	size = ggtt->vm.total - GUC_GGTT_TOP;
>   
> -	ret = i915_gem_gtt_reserve(&ggtt->vm, &ggtt->uc_fw, size,
> +	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, &ggtt->uc_fw, size,
>   				   GUC_GGTT_TOP, I915_COLOR_UNEVICTABLE,
>   				   PIN_NOEVICT);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 4a20ba63446c..c078d3f55815 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1383,7 +1383,7 @@ static int evict_vma(void *data)
>   	complete(&arg->completion);
>   
>   	mutex_lock(&vm->mutex);
> -	err = i915_gem_evict_for_node(vm, &evict, 0);
> +	err = i915_gem_evict_for_node(vm, NULL, &evict, 0);
>   	mutex_unlock(&vm->mutex);
>   
>   	return err;
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> index 0d6d59871308..c08098a167e9 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -63,7 +63,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
>   
>   	mutex_lock(&gt->ggtt->vm.mutex);
>   	mmio_hw_access_pre(gt);
> -	ret = i915_gem_gtt_insert(&gt->ggtt->vm, node,
> +	ret = i915_gem_gtt_insert(&gt->ggtt->vm, NULL, node,
>   				  size, I915_GTT_PAGE_SIZE,
>   				  I915_COLOR_UNEVICTABLE,
>   				  start, end, flags);
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 370eb7238d1c..2367902f6ac1 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -38,6 +38,11 @@ I915_SELFTEST_DECLARE(static struct igt_evict_ctl {
>   	bool fail_if_busy:1;
>   } igt_evict_ctl;)
>   
> +static bool dying_vma(struct i915_vma *vma)
> +{
> +	return !kref_read(&vma->obj->base.refcount);
> +}
> +
>   static int ggtt_flush(struct intel_gt *gt)
>   {
>   	/*
> @@ -50,8 +55,37 @@ static int ggtt_flush(struct intel_gt *gt)
>   	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>   }
>   
> +static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
> +{
> +	/*
> +	 * We add the extra refcount so the object doesn't drop to zero until
> +	 * after ungrab_vma(), this way trylock is always paired with unlock.
> +	 */
> +	if (i915_gem_object_get_rcu(vma->obj)) {
> +		if (!i915_gem_object_trylock(vma->obj, ww)) {
> +			i915_gem_object_put(vma->obj);
> +			return false;
> +		}
> +	} else {
> +		/* Dead objects don't need pins */
> +		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> +	}
> +
> +	return true;
> +}
> +
> +static void ungrab_vma(struct i915_vma *vma)
> +{
> +	if (dying_vma(vma))
> +		return;
> +
> +	i915_gem_object_unlock(vma->obj);
> +	i915_gem_object_put(vma->obj);
> +}
> +
>   static bool
>   mark_free(struct drm_mm_scan *scan,
> +	  struct i915_gem_ww_ctx *ww,
>   	  struct i915_vma *vma,
>   	  unsigned int flags,
>   	  struct list_head *unwind)
> @@ -59,6 +93,9 @@ mark_free(struct drm_mm_scan *scan,
>   	if (i915_vma_is_pinned(vma))
>   		return false;
>   
> +	if (!grab_vma(vma, ww))
> +		return false;
> +
>   	list_add(&vma->evict_link, unwind);
>   	return drm_mm_scan_add_block(scan, &vma->node);
>   }
> @@ -105,6 +142,7 @@ static int evict_dead(struct i915_vma *vma)
>    */
>   int
>   i915_gem_evict_something(struct i915_address_space *vm,
> +			 struct i915_gem_ww_ctx *ww,
>   			 u64 min_size, u64 alignment,
>   			 unsigned long color,
>   			 u64 start, u64 end,
> @@ -177,7 +215,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   			continue;
>   		}
>   
> -		if (mark_free(&scan, vma, flags, &eviction_list))
> +		if (mark_free(&scan, ww, vma, flags, &eviction_list))
>   			goto found;
>   	}
>   
> @@ -185,6 +223,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>   		ret = drm_mm_scan_remove_block(&scan, &vma->node);
>   		BUG_ON(ret);
> +		ungrab_vma(vma);
>   	}
>   
>   	/*
> @@ -229,10 +268,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   	 * of any of our objects, thus corrupting the list).
>   	 */
>   	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
> -		if (drm_mm_scan_remove_block(&scan, &vma->node))
> +		if (drm_mm_scan_remove_block(&scan, &vma->node)) {
>   			__i915_vma_pin(vma);
> -		else
> +		} else {
>   			list_del(&vma->evict_link);
> +			ungrab_vma(vma);
> +		}
>   	}
>   
>   	/* Unbinding will emit any required flushes */
> @@ -241,16 +282,20 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   		__i915_vma_unpin(vma);
>   		if (ret == 0)
>   			ret = __i915_vma_unbind(vma);
> +		ungrab_vma(vma);
>   	}
>   
>   	while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
>   		vma = container_of(node, struct i915_vma, node);
>   
>   		/* If we find any non-objects (!vma), we cannot evict them */
> -		if (vma->node.color != I915_COLOR_UNEVICTABLE)
> +		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
> +		    grab_vma(vma, ww)) {
>   			ret = __i915_vma_unbind(vma);
> -		else
> -			ret = -ENOSPC; /* XXX search failed, try again? */
> +			ungrab_vma(vma);
> +		} else {
> +			ret = -ENOSPC;
> +		}
>   	}
>   
>   	return ret;
> @@ -268,6 +313,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>    * memory in e.g. the shrinker.
>    */
>   int i915_gem_evict_for_node(struct i915_address_space *vm,
> +			    struct i915_gem_ww_ctx *ww,
>   			    struct drm_mm_node *target,
>   			    unsigned int flags)
>   {
> @@ -340,6 +386,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>   			break;
>   		}
>   
> +		if (!grab_vma(vma, ww)) {
> +			ret = -ENOSPC;
> +			break;
> +		}
> +
>   		/*
>   		 * Never show fear in the face of dragons!
>   		 *
> @@ -357,6 +408,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>   		__i915_vma_unpin(vma);
>   		if (ret == 0)
>   			ret = __i915_vma_unbind(vma);
> +
> +		ungrab_vma(vma);
>   	}
>   
>   	return ret;
> @@ -398,7 +451,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>   		LIST_HEAD(locked_eviction_list);
>   
>   		list_for_each_entry(vma, &vm->bound_list, vm_link) {
> -			if (!kref_read(&vma->obj->base.refcount)) {
> +			if (dying_vma(vma)) {
>   				ret = evict_dead(vma);
>   				if (ret)
>   					break;
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i915_gem_evict.h
> index f5b7a9100609..e593c530f9bd 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.h
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.h
> @@ -13,11 +13,13 @@ struct i915_address_space;
>   struct i915_gem_ww_ctx;
>   
>   int __must_check i915_gem_evict_something(struct i915_address_space *vm,
> +					  struct i915_gem_ww_ctx *ww,
>   					  u64 min_size, u64 alignment,
>   					  unsigned long color,
>   					  u64 start, u64 end,
>   					  unsigned flags);
>   int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
> +					 struct i915_gem_ww_ctx *ww,
>   					 struct drm_mm_node *node,
>   					 unsigned int flags);
>   int i915_gem_evict_vm(struct i915_address_space *vm,
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index b7094ca48047..022543f9bf32 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -94,6 +94,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>    * asked to wait for eviction and interrupted.
>    */
>   int i915_gem_gtt_reserve(struct i915_address_space *vm,
> +			 struct i915_gem_ww_ctx *ww,
>   			 struct drm_mm_node *node,
>   			 u64 size, u64 offset, unsigned long color,
>   			 unsigned int flags)
> @@ -118,7 +119,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
>   	if (flags & PIN_NOEVICT)
>   		return -ENOSPC;
>   
> -	err = i915_gem_evict_for_node(vm, node, flags);
> +	err = i915_gem_evict_for_node(vm, ww, node, flags);
>   	if (err == 0)
>   		err = drm_mm_reserve_node(&vm->mm, node);
>   
> @@ -185,6 +186,7 @@ static u64 random_offset(u64 start, u64 end, u64 len, u64 align)
>    * asked to wait for eviction and interrupted.
>    */
>   int i915_gem_gtt_insert(struct i915_address_space *vm,
> +			struct i915_gem_ww_ctx *ww,
>   			struct drm_mm_node *node,
>   			u64 size, u64 alignment, unsigned long color,
>   			u64 start, u64 end, unsigned int flags)
> @@ -270,7 +272,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>   	 */
>   	offset = random_offset(start, end,
>   			       size, alignment ?: I915_GTT_MIN_ALIGNMENT);
> -	err = i915_gem_gtt_reserve(vm, node, size, offset, color, flags);
> +	err = i915_gem_gtt_reserve(vm, ww, node, size, offset, color, flags);
>   	if (err != -ENOSPC)
>   		return err;
>   
> @@ -278,7 +280,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>   		return -ENOSPC;
>   
>   	/* Randomly selected placement is pinned, do a search */
> -	err = i915_gem_evict_something(vm, size, alignment, color,
> +	err = i915_gem_evict_something(vm, ww, size, alignment, color,
>   				       start, end, flags);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
> index c9b0ee5e1d23..e4938aba3fe9 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
> @@ -16,6 +16,7 @@
>   
>   struct drm_i915_gem_object;
>   struct i915_address_space;
> +struct i915_gem_ww_ctx;
>   
>   int __must_check i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>   					    struct sg_table *pages);
> @@ -23,11 +24,13 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   			       struct sg_table *pages);
>   
>   int i915_gem_gtt_reserve(struct i915_address_space *vm,
> +			 struct i915_gem_ww_ctx *ww,
>   			 struct drm_mm_node *node,
>   			 u64 size, u64 offset, unsigned long color,
>   			 unsigned int flags);
>   
>   int i915_gem_gtt_insert(struct i915_address_space *vm,
> +			struct i915_gem_ww_ctx *ww,
>   			struct drm_mm_node *node,
>   			u64 size, u64 alignment, unsigned long color,
>   			u64 start, u64 end, unsigned int flags);
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index 31a105bc1792..c97323973f9b 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -197,7 +197,7 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
>   	drm_info(&dev_priv->drm,
>   		 "balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
>   		 start, end, size / 1024);
> -	ret = i915_gem_gtt_reserve(&ggtt->vm, node,
> +	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, node,
>   				   size, start, I915_COLOR_UNEVICTABLE,
>   				   0);
>   	if (!ret)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 8477cae5f877..900cd4d9ebde 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -713,7 +713,8 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
>    * 0 on success, negative error code otherwise.
>    */
>   static int
> -i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> +i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> +		u64 size, u64 alignment, u64 flags)
>   {
>   	unsigned long color;
>   	u64 start, end;
> @@ -765,7 +766,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>   		    range_overflows(offset, size, end))
>   			return -EINVAL;
>   
> -		ret = i915_gem_gtt_reserve(vma->vm, &vma->node,
> +		ret = i915_gem_gtt_reserve(vma->vm, ww, &vma->node,
>   					   size, offset, color,
>   					   flags);
>   		if (ret)
> @@ -804,7 +805,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>   				size = round_up(size, I915_GTT_PAGE_SIZE_2M);
>   		}
>   
> -		ret = i915_gem_gtt_insert(vma->vm, &vma->node,
> +		ret = i915_gem_gtt_insert(vma->vm, ww, &vma->node,
>   					  size, alignment, color,
>   					  start, end, flags);
>   		if (ret)
> @@ -1452,7 +1453,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   		goto err_unlock;
>   
>   	if (!(bound & I915_VMA_BIND_MASK)) {
> -		err = i915_vma_insert(vma, size, alignment, flags);
> +		err = i915_vma_insert(vma, ww, size, alignment, flags);
>   		if (err)
>   			goto err_active;
>   
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index 7c075c16a573..15b4e5631070 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -117,7 +117,7 @@ static int igt_evict_something(void *arg)
>   
>   	/* Everything is pinned, nothing should happen */
>   	mutex_lock(&ggtt->vm.mutex);
> -	err = i915_gem_evict_something(&ggtt->vm,
> +	err = i915_gem_evict_something(&ggtt->vm, NULL,
>   				       I915_GTT_PAGE_SIZE, 0, 0,
>   				       0, U64_MAX,
>   				       0);
> @@ -132,11 +132,12 @@ static int igt_evict_something(void *arg)
>   
>   	/* Everything is unpinned, we should be able to evict something */
>   	mutex_lock(&ggtt->vm.mutex);
> -	err = i915_gem_evict_something(&ggtt->vm,
> +	err = i915_gem_evict_something(&ggtt->vm, NULL,
>   				       I915_GTT_PAGE_SIZE, 0, 0,
>   				       0, U64_MAX,
>   				       0);
>   	mutex_unlock(&ggtt->vm.mutex);
> +

Stray newline?

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


