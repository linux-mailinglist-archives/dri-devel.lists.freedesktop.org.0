Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8B2C67EA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0936EDEF;
	Fri, 27 Nov 2020 14:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A80C6EDED;
 Fri, 27 Nov 2020 14:29:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134295-1500050 for multiple; Fri, 27 Nov 2020 14:29:09 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-147-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-147-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 146/162] drm/i915/pm: suspend and restore
 ppgtt mapping
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:29:09 +0000
Message-ID: <160648734917.2925.16972729779198821893@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:07:02)
> From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> 
> During suspend we will lose all page tables as they are allocated in
> LMEM. In-order to  make sure that the contexts do not access the
> corrupted page table after we restore, we are evicting all vma's that
> are bound to vm's. This includes kernel vm.
> 
> During resume, we are restoring the page tables back to scratch page.
> 
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> Cc: CQ Tang <cq.tang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c  |  13 ++++
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h  |   2 +
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c |   4 +
>  drivers/gpu/drm/i915/i915_drv.c       | 102 +++++++++++++++++++++++---
>  4 files changed, 112 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index b6fcebeef02a..704cab807e0b 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -775,3 +775,16 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
>         kfree(ppgtt);
>         return ERR_PTR(err);
>  }
> +
> +void gen8_restore_ppgtt_mappings(struct i915_address_space *vm)
> +{
> +       const unsigned int count = gen8_pd_top_count(vm);
> +       int i;
> +
> +       for (i = 1; i <= vm->top; i++)
> +               fill_px(vm->scratch[i], vm->scratch[i - 1]->encode);
> +
> +       fill_page_dma(px_base(i915_vm_to_ppgtt(vm)->pd),
> +                     vm->scratch[vm->top]->encode, count);
> +}
> +
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> index 76a08b9c1f5c..3fa4b95aaabd 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> @@ -6,8 +6,10 @@
>  #ifndef __GEN8_PPGTT_H__
>  #define __GEN8_PPGTT_H__
>  
> +struct i915_address_space;
>  struct intel_gt;
>  
> +void gen8_restore_ppgtt_mappings(struct i915_address_space *vm);
>  struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> index 34a02643bb75..9b3eacd12a7e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> @@ -9,6 +9,8 @@
>  #include "intel_gtt.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_region.h"
>  #include "gen6_ppgtt.h"
>  #include "gen8_ppgtt.h"
>  
> @@ -317,3 +319,5 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
>         ppgtt->vm.vma_ops.set_pages   = ppgtt_set_pages;
>         ppgtt->vm.vma_ops.clear_pages = clear_pages;
>  }
> +
> +
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index e8c4931fc818..7115f4db5043 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -64,6 +64,7 @@
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_mman.h"
> +#include "gt/gen8_ppgtt.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_rc6.h"
> @@ -1136,13 +1137,13 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
>  
>                                 mutex_unlock(&mem->objects.lock);
>  
> -                               if (in_suspend)
> -                                       i915_gem_object_unbind(obj, 0);
> -
>                                 if (in_suspend) {
>                                         obj->swapto = NULL;
>                                         obj->evicted = false;
>                                         obj->do_swapping = true;
> +
> +                                       i915_gem_object_unbind(obj, 0);
> +
>                                         ret = __i915_gem_object_put_pages(obj);
>                                         obj->do_swapping = false;
>                                         if (ret) {
> @@ -1176,6 +1177,43 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
>         return ret;
>  }
>  
> +static int i915_gem_suspend_ppgtt_mappings(struct drm_i915_private *i915)
> +{
> +       struct i915_gem_context *ctx, *cn;
> +       int ret;
> +
> +       spin_lock(&i915->gem.contexts.lock);
> +       list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {

Wrong list. Bad starting point from GEM.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
