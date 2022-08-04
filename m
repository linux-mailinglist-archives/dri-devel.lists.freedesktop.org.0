Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED758992D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 10:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31CA12B7D6;
	Thu,  4 Aug 2022 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86AE8F24E;
 Thu,  4 Aug 2022 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659601088; x=1691137088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yQan3K3MzfFlco62xGlbqgCcc6m4f4EY80JPF0pTQKo=;
 b=iPy+FLyUQp9FK3McfCq60svqU05OWF6uXIdHc4GdrFRwTWLodkT02whN
 mhjsxqdZCY22mwQvcK2BcarP7KWeX4HB04wWVCaOm919qALCSRzpGQ1sH
 gPSjgjelpXF4irhjr7I2GUe1vIwh4OqsBf+FVf1xfrDNT/c59318F1Jt2
 WJLO6Oj5CT2Yo3Ebc/d+f55o8Dv8uJYcDUgcR5Le2sN/lCiN/GlcU0rlf
 bOrs+71geb8Z3EqLb+45HUOMi/HtCoN0HGiB/U3CY33P4zXfInlsPz2JF
 gbRLxelBK9xTl9UtNOEAeCfrXXNHi1OuBiUb/EsTVOHAO4oArpJWVeGHu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="270253082"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="270253082"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 01:18:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="603135791"
Received: from fzoltan-mobl1.ger.corp.intel.com (HELO [10.213.220.160])
 ([10.213.220.160])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 01:18:03 -0700
Message-ID: <aa323022-f54c-23e2-92b9-87191209177e@linux.intel.com>
Date: Thu, 4 Aug 2022 09:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] drm/i915: pass a pointer for tlb seqno at
 vma_invalidate_tlb()
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
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
 Michael Cheng <michael.cheng@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/08/2022 08:37, Mauro Carvalho Chehab wrote:
> WRITE_ONCE() should happen at the original var, not on a local
> copy of it.
> 
> Fixes: 5d36acb7198b ("drm/i915/gt: Batch TLB invalidations")

Cc: stable I think, since the above one was. So both hit 5.21 (or 6.1) 
together.

Regards,

Tvrtko

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/3] at: https://lore.kernel.org/all/cover.1659598090.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c | 2 +-
>   drivers/gpu/drm/i915/i915_vma.c       | 6 +++---
>   drivers/gpu/drm/i915/i915_vma.h       | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> index 2da6c82a8bd2..6ee8d1127016 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> @@ -211,7 +211,7 @@ void ppgtt_unbind_vma(struct i915_address_space *vm,
>   
>   	vm->clear_range(vm, vma_res->start, vma_res->vma_size);
>   	if (vma_res->tlb)
> -		vma_invalidate_tlb(vm, *vma_res->tlb);
> +		vma_invalidate_tlb(vm, vma_res->tlb);
>   }
>   
>   static unsigned long pd_count(u64 size, int shift)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 84a9ccbc5fc5..260371716490 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1308,7 +1308,7 @@ I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
>   	return err;
>   }
>   
> -void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
> +void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
>   {
>   	/*
>   	 * Before we release the pages that were bound by this vma, we
> @@ -1318,7 +1318,7 @@ void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
>   	 * the most recent TLB invalidation seqno, and if we have not yet
>   	 * flushed the TLBs upon release, perform a full invalidation.
>   	 */
> -	WRITE_ONCE(tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
> +	WRITE_ONCE(*tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
>   }
>   
>   static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
> @@ -1971,7 +1971,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
>   			dma_fence_put(unbind_fence);
>   			unbind_fence = NULL;
>   		}
> -		vma_invalidate_tlb(vma->vm, vma->obj->mm.tlb);
> +		vma_invalidate_tlb(vma->vm, &vma->obj->mm.tlb);
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 5048eed536da..33a58f605d75 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -213,7 +213,7 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
>   			u64 size, u64 alignment, u64 flags);
>   void __i915_vma_set_map_and_fenceable(struct i915_vma *vma);
>   void i915_vma_revoke_mmap(struct i915_vma *vma);
> -void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb);
> +void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb);
>   struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async);
>   int __i915_vma_unbind(struct i915_vma *vma);
>   int __must_check i915_vma_unbind(struct i915_vma *vma);
