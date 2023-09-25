Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03017AD8F9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 15:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A534B10E170;
	Mon, 25 Sep 2023 13:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAAF10E170;
 Mon, 25 Sep 2023 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648193; x=1727184193;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Amh1cqR7EdYfABvcvMAydN4Tvisfj9yIiI1zDuOLH9o=;
 b=QU2eN998W417uJRZhViDrgBThi6nZU33IecDrig0PJNabF819x8dFV0b
 ufgthvrqaiu1yfyzt+l67IO5IGKIzHqWOdYfyEwPR9tp9HbJZeWcQsCcY
 QDkh1dnpwE6ld+TX1nivS+ZUGXqKfx2HEEXw+R+LZBuBbnJPLmEHhv2d3
 Uy6H64OpnLRULJbFfUSooFqEBL4eYDxpLn1mBPzVO8jCf2CxlIzktQLOW
 U36y+eo4sgK+loMHSwcENYieneW4jcjN2pwhFs+xejqllAJE3qEl7iddJ
 6KRm2wQzqr6DV5823hoiyts8HNmuSrhRBKlhOxYMfPCpjYcdi6PfLEbbV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445360521"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="445360521"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079201284"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="1079201284"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.144])
 ([10.213.8.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:23:11 -0700
Message-ID: <7d041873-82f0-77f4-f8f6-5aa5799d41b7@intel.com>
Date: Mon, 25 Sep 2023 15:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt
 aware
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230922123541.23822-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230922123541.23822-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.09.2023 14:35, Nirmoy Das wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Where applicable, use for_each_gt instead of to_gt in the
> i915_gem_shrinker functions to make them apply to more than just the
> primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
> requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
> VMAs from all GTs.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 44 ++++++++++++--------
>   1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 214763942aa2..3ef1fd32f80a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -14,6 +14,7 @@
>   #include <linux/vmalloc.h>
>   
>   #include "gt/intel_gt_requests.h"
> +#include "gt/intel_gt.h"
>   
>   #include "i915_trace.h"
>   
> @@ -119,7 +120,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>   	intel_wakeref_t wakeref = 0;
>   	unsigned long count = 0;
>   	unsigned long scanned = 0;
> -	int err = 0;
> +	int err = 0, i = 0;
> +	struct intel_gt *gt;
>   
>   	/* CHV + VTD workaround use stop_machine(); need to trylock vm->mutex */
>   	bool trylock_vm = !ww && intel_vm_no_concurrent_access_wa(i915);
> @@ -147,9 +149,11 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>   	 * what we can do is give them a kick so that we do not keep idle
>   	 * contexts around longer than is necessary.
>   	 */
> -	if (shrink & I915_SHRINK_ACTIVE)
> -		/* Retire requests to unpin all idle contexts */
> -		intel_gt_retire_requests(to_gt(i915));
> +	if (shrink & I915_SHRINK_ACTIVE) {
> +		for_each_gt(gt, i915, i)
> +			/* Retire requests to unpin all idle contexts */
> +			intel_gt_retire_requests(to_gt(i915));


to_gt(...) -> gt ?


> +	}
>   
>   	/*
>   	 * As we may completely rewrite the (un)bound list whilst unbinding
> @@ -389,6 +393,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>   	struct i915_vma *vma, *next;
>   	unsigned long freed_pages = 0;
>   	intel_wakeref_t wakeref;
> +	struct intel_gt *gt;
> +	int i;
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>   		freed_pages += i915_gem_shrink(NULL, i915, -1UL, NULL,
> @@ -397,24 +403,26 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>   					       I915_SHRINK_VMAPS);
>   
>   	/* We also want to clear any cached iomaps as they wrap vmap */
> -	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
> -	list_for_each_entry_safe(vma, next,
> -				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
> -		unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
> -		struct drm_i915_gem_object *obj = vma->obj;
> -
> -		if (!vma->iomap || i915_vma_is_active(vma))
> -			continue;
> +	for_each_gt(gt, i915, i) {
> +		mutex_lock(&gt->ggtt->vm.mutex);
> +		list_for_each_entry_safe(vma, next,
> +					 &gt->ggtt->vm.bound_list, vm_link) {
> +			unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
> +			struct drm_i915_gem_object *obj = vma->obj;
> +
> +			if (!vma->iomap || i915_vma_is_active(vma))
> +				continue;
>   
> -		if (!i915_gem_object_trylock(obj, NULL))
> -			continue;
> +			if (!i915_gem_object_trylock(obj, NULL))
> +				continue;
>   
> -		if (__i915_vma_unbind(vma) == 0)
> -			freed_pages += count;
> +			if (__i915_vma_unbind(vma) == 0)
> +				freed_pages += count;
>   
> -		i915_gem_object_unlock(obj);
> +			i915_gem_object_unlock(obj);
> +		}
> +		mutex_unlock(&gt->ggtt->vm.mutex);
>   	}
> -	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);


This seems correct.

With 1st stanza fixed:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   
>   	*(unsigned long *)ptr += freed_pages;
>   	return NOTIFY_DONE;

