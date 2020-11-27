Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C52C66E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68E56EDBB;
	Fri, 27 Nov 2020 13:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FC36EDBA;
 Fri, 27 Nov 2020 13:35:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133517-1500050 for multiple; Fri, 27 Nov 2020 13:35:42 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-102-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-102-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 101/162] drm/i915/gtt/dg1: add PTE_LM
 plumbing for PPGTT
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:35:42 +0000
Message-ID: <160648414221.2925.764003601534306071@build.alporthouse.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:17)
> For the PTEs we get an LM bit, to signal whether the page resides in
> SMEM or LMEM.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c  | 35 ++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_gtt.h   |  3 +++
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c |  4 +++
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index e2f1dfc48d43..b6fcebeef02a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/log2.h>
>  
> +#include "gem/i915_gem_lmem.h"
>  #include "gen8_ppgtt.h"
>  #include "i915_scatterlist.h"
>  #include "i915_trace.h"
> @@ -50,6 +51,21 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>         return pte;
>  }
>  
> +static u64 gen12_pte_encode(dma_addr_t addr,
> +                           enum i915_cache_level level,
> +                           u32 flags)
> +{
> +       gen8_pte_t pte = addr | _PAGE_PRESENT | _PAGE_RW;
> +
> +       if (unlikely(flags & PTE_READ_ONLY))
> +               pte &= ~_PAGE_RW;
> +
> +       if (flags & PTE_LM)
> +               pte |= GEN12_PPGTT_PTE_LM;
> +
> +       return pte;
> +}
> +
>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
>  {
>         struct drm_i915_private *i915 = ppgtt->vm.i915;
> @@ -365,7 +381,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>                       u32 flags)
>  {
>         struct i915_page_directory *pd;
> -       const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +       const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);

We don't need the vfunc, since that flag will not be sent for gen8.

That bit test will be cheaper than the retpoline.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
