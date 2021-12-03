Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939A467B7D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 17:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F5734B6;
	Fri,  3 Dec 2021 16:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D723734B6;
 Fri,  3 Dec 2021 16:34:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="217694893"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="217694893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 08:34:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="513769766"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 08:34:47 -0800
Date: Fri, 3 Dec 2021 22:08:02 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/8] drm/i915/migrate: don't check the scratch page
Message-ID: <20211203163802.GA26974@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211203122426.2859679-2-matthew.auld@intel.com>
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

On 2021-12-03 at 12:24:19 +0000, Matthew Auld wrote:
> The scratch page might not be allocated in LMEM(like on DG2), so instead
> of using that as the deciding factor for where the paging structures
> live, let's just query the pt before mapping it.
> 
Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 765c6d48fe52..2d3188a398dd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -13,7 +13,6 @@
>  
>  struct insert_pte_data {
>  	u64 offset;
> -	bool is_lmem;
>  };
>  
>  #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> @@ -41,7 +40,7 @@ static void insert_pte(struct i915_address_space *vm,
>  	struct insert_pte_data *d = data;
>  
>  	vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
> -			d->is_lmem ? PTE_LM : 0);
> +			i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
>  	d->offset += PAGE_SIZE;
>  }
>  
> @@ -135,7 +134,6 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
>  			goto err_vm;
>  
>  		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
> -		d.is_lmem = i915_gem_object_is_lmem(vm->vm.scratch[0]);
>  		vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
>  	}
>  
> -- 
> 2.31.1
> 
