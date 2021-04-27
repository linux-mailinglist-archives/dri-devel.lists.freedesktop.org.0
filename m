Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51DC36C7E4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 16:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C847A6E974;
	Tue, 27 Apr 2021 14:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8406E974;
 Tue, 27 Apr 2021 14:42:24 +0000 (UTC)
IronPort-SDR: bm9VFmQDvzmwZ1XIBmAhY2JnmqioIv5dJcyavF69I3+3U24+Kty2IRl+2GoUm+gukSs3BOLaeu
 g2jwWu1QcIog==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="193335535"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="193335535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 07:42:24 -0700
IronPort-SDR: SkPmPGUhArW+2yCEPrPHP09HXS4qeD6qnYtm854cZXD5OpufQBncMB7+JcnfkF8n1tNvfSGiJW
 C+/aRR5p1guQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="526108798"
Received: from hdimater-mobl1.ger.corp.intel.com (HELO [10.213.224.232])
 ([10.213.224.232])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 07:42:23 -0700
Subject: Re: [PATCH v2 4/7] drm/i915/gtt/dgfx: place the PD in LMEM
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210427085417.120246-1-matthew.auld@intel.com>
 <20210427085417.120246-4-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9d7d32a0-5df6-92b3-5dce-9e98af08bc38@linux.intel.com>
Date: Tue, 27 Apr 2021 15:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210427085417.120246-4-matthew.auld@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/04/2021 09:54, Matthew Auld wrote:
> It's a requirement that for dgfx we place all the paging structures in
> device local-memory.
> 
> v2: use i915_coherent_map_type()
> v3: improve the shared dma-resv object comment
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  5 ++++-
>   drivers/gpu/drm/i915/gt/intel_gtt.c  | 30 +++++++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/intel_gtt.h  |  1 +
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index f83496836f0f..11fb5df45a0f 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -712,7 +712,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
>   	 */
>   	ppgtt->vm.has_read_only = !IS_GEN_RANGE(gt->i915, 11, 12);
>   
> -	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
> +	if (HAS_LMEM(gt->i915))
> +		ppgtt->vm.alloc_pt_dma = alloc_pt_lmem;
> +	else
> +		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
>   
>   	err = gen8_init_scratch(&ppgtt->vm);
>   	if (err)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index d386b89e2758..061c39d2ad51 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -7,10 +7,26 @@
>   
>   #include <linux/fault-inject.h>
>   
> +#include "gem/i915_gem_lmem.h"
>   #include "i915_trace.h"
>   #include "intel_gt.h"
>   #include "intel_gtt.h"
>   
> +struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
> +{
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
> +	/*
> +	 * Ensure all paging structures for this vm share the same dma-resv
> +	 * object underneath, with the idea that one object_lock() will lock
> +	 * them all at once.

Okay but I am still missing the part about why is this beneficial and 
not a downside. I suppose it is not a concept added by this patch so not 
fair to ask for explanation here anyway.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> +	 */
> +	if (!IS_ERR(obj))
> +		obj->base.resv = &vm->resv;
> +	return obj;
> +}
> +
>   struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
>   {
>   	struct drm_i915_gem_object *obj;
> @@ -19,7 +35,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
>   		i915_gem_shrink_all(vm->i915);
>   
>   	obj = i915_gem_object_create_internal(vm->i915, sz);
> -	/* ensure all dma objects have the same reservation class */
> +	/*
> +	 * Ensure all paging structures for this vm share the same dma-resv
> +	 * object underneath, with the idea that one object_lock() will lock
> +	 * them all at once.
> +	 */
>   	if (!IS_ERR(obj))
>   		obj->base.resv = &vm->resv;
>   	return obj;
> @@ -27,9 +47,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
>   
>   int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
>   {
> +	enum i915_map_type type;
>   	void *vaddr;
>   
> -	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	type = i915_coherent_map_type(vm->i915, obj, true);
> +	vaddr = i915_gem_object_pin_map_unlocked(obj, type);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   
> @@ -39,9 +61,11 @@ int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
>   
>   int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
>   {
> +	enum i915_map_type type;
>   	void *vaddr;
>   
> -	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
> +	type = i915_coherent_map_type(vm->i915, obj, true);
> +	vaddr = i915_gem_object_pin_map(obj, type);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 40e486704558..44ce27c51631 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -527,6 +527,7 @@ int setup_scratch_page(struct i915_address_space *vm);
>   void free_scratch(struct i915_address_space *vm);
>   
>   struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz);
> +struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz);
>   struct i915_page_table *alloc_pt(struct i915_address_space *vm);
>   struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
>   struct i915_page_directory *__alloc_pd(int npde);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
