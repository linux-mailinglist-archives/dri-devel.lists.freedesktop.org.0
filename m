Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8656C63EBBF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3110E581;
	Thu,  1 Dec 2022 09:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271610E581;
 Thu,  1 Dec 2022 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669885237; x=1701421237;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3ZFFyqC13u65gF+7FXxR4AC6QQK3MvuRJVf8HquSiAQ=;
 b=HZlC/zR0+JMo8DJYthd7fnJQAMIglsEXlM1IvN4vjEddww/95MeJjwkS
 cr8moia9VKO0NJBiswgcI7Aa98wdBBF6erNd1cxcS/byA4kaUq4mrfYzj
 mGjRNx7Zy/2r06NhJ7kN7Ik4h0NCMDymeu8EiovIPnAUrD+nbNT2FUqaP
 q0MUkE2jmkPYEWjrulYGko/xQ7HXz4do5f/AlNiNNACuDOOlOB0UwbhAe
 rD7MfUn7bk1xufxUK2AMTVGoBky/HWC5vflpxvi0pUMb+NRMP3h8UT5MA
 nCLtFllDgb0rX3FwWNFxKqXjp6OsNYhBk9dpFp/QsSJnz+hdFayvKtZlR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="295990784"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="295990784"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:00:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="818970045"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="818970045"
Received: from aguefor-mobl.ger.corp.intel.com (HELO [10.213.229.22])
 ([10.213.229.22])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:00:35 -0800
Message-ID: <ad64109a-ea0a-7d8e-8992-9ed239664b94@linux.intel.com>
Date: Thu, 1 Dec 2022 09:00:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v4 4/5] drm/i915: Refine VT-d scanout
 workaround
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
 <20221130235805.221010-5-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221130235805.221010-5-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/11/2022 23:58, Andi Shyti wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> VT-d may cause overfetch of the scanout PTE, both before and after the
> vma (depending on the scanout orientation). bspec recommends that we
> provide a tile-row in either directions, and suggests using 168 PTE,
> warning that the accesses will wrap around the ends of the GGTT.
> Currently, we fill the entire GGTT with scratch pages when using VT-d to
> always ensure there are valid entries around every vma, including
> scanout. However, writing every PTE is slow as on recent devices we
> perform 8MiB of uncached writes, incurring an extra 100ms during resume.
> 
> If instead we focus on only putting guard pages around scanout, we can
> avoid touching the whole GGTT. To avoid having to introduce extra nodes
> around each scanout vma, we adjust the scanout drm_mm_node to be smaller
> than the allocated space, and fixup the extra PTE during dma binding.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c | 13 +++++++++++
>   drivers/gpu/drm/i915/gt/intel_ggtt.c       | 25 +---------------------
>   2 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 850776a783ac7..9969e687ad857 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -17,6 +17,8 @@
>   #include "i915_gem_object.h"
>   #include "i915_vma.h"
>   
> +#define VTD_GUARD (168u * I915_GTT_PAGE_SIZE) /* 168 or tile-row PTE padding */
> +
>   static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>   {
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> @@ -424,6 +426,17 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> +	/* VT-d may overfetch before/after the vma, so pad with scratch */
> +	if (intel_scanout_needs_vtd_wa(i915)) {
> +		unsigned int guard = VTD_GUARD;
> +
> +		if (i915_gem_object_is_tiled(obj))
> +			guard = max(guard,
> +				    i915_gem_object_get_tile_row_size(obj));
> +
> +		flags |= PIN_OFFSET_GUARD | guard;
> +	}
> +
>   	/*
>   	 * As the user may map the buffer once pinned in the display plane
>   	 * (e.g. libkms for the bootup splash), we have to ensure that we
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 784d4a8c43ba9..fa96d925c2596 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -376,27 +376,6 @@ static void nop_clear_range(struct i915_address_space *vm,
>   {
>   }
>   
> -static void gen8_ggtt_clear_range(struct i915_address_space *vm,
> -				  u64 start, u64 length)
> -{
> -	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> -	unsigned int first_entry = start / I915_GTT_PAGE_SIZE;
> -	unsigned int num_entries = length / I915_GTT_PAGE_SIZE;
> -	const gen8_pte_t scratch_pte = vm->scratch[0]->encode;
> -	gen8_pte_t __iomem *gtt_base =
> -		(gen8_pte_t __iomem *)ggtt->gsm + first_entry;
> -	const int max_entries = ggtt_total_entries(ggtt) - first_entry;
> -	int i;
> -
> -	if (WARN(num_entries > max_entries,
> -		 "First entry = %d; Num entries = %d (max=%d)\n",
> -		 first_entry, num_entries, max_entries))
> -		num_entries = max_entries;
> -
> -	for (i = 0; i < num_entries; i++)
> -		gen8_set_pte(&gtt_base[i], scratch_pte);
> -}
> -
>   static void bxt_vtd_ggtt_wa(struct i915_address_space *vm)
>   {
>   	/*
> @@ -968,8 +947,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>   	ggtt->vm.cleanup = gen6_gmch_remove;
>   	ggtt->vm.insert_page = gen8_ggtt_insert_page;
>   	ggtt->vm.clear_range = nop_clear_range;
> -	if (intel_scanout_needs_vtd_wa(i915))
> -		ggtt->vm.clear_range = gen8_ggtt_clear_range;
>   
>   	ggtt->vm.insert_entries = gen8_ggtt_insert_entries;
>   
> @@ -1128,7 +1105,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>   	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
>   
>   	ggtt->vm.clear_range = nop_clear_range;
> -	if (!HAS_FULL_PPGTT(i915) || intel_scanout_needs_vtd_wa(i915))
> +	if (!HAS_FULL_PPGTT(i915))
>   		ggtt->vm.clear_range = gen6_ggtt_clear_range;
>   	ggtt->vm.insert_page = gen6_ggtt_insert_page;
>   	ggtt->vm.insert_entries = gen6_ggtt_insert_entries;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
