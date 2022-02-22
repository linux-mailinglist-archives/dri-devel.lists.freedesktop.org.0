Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C14C04C5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B831010E33E;
	Tue, 22 Feb 2022 22:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B1C10E33E;
 Tue, 22 Feb 2022 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645569621; x=1677105621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aOcHdsNwT3IVXEpVUBQTLSqHamJKibtdqp8+cpHpkz8=;
 b=l9nBAJi4vZaxBmQ9dQhav6NHOEYC8iuOmIrGxAnHnGkyiOSrTMB7cdG1
 UQpBslEyI0wW6NVjna9IdVtuIbmStYYV5uD/zk/rd55JKO+fNCUAnhcw0
 CJWNCn2ZOiND1vYxl1LgcrtrzpMe2Sg1+YInZ9KAcEeGVvSa8jNmuGGBO
 /9sZshabaHT5By+yBSWe57juozlwn6WE/h6QbiHbR7hPHHBkP4KdLzENM
 r0nOSMLTqzjpP2gSVKgq/G7C4DltgsaJdp1s6WoispKoYUJtuMcAPVtPf
 VUrkGp19rCNgeCYwpwdbklL/0Ljbvraw8CilPiy3oqLUg/E6UzO/AiTY8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235340682"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="235340682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:40:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="505701953"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:40:20 -0800
Date: Tue, 22 Feb 2022 14:40:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [PATCH v10 6/6] drm/i915/gt: replace cache_clflush_range
Message-ID: <YhVmU3XTQ6/Sp4Qa@mdroper-desk1.amr.corp.intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
 <20220210183636.1187973-7-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210183636.1187973-7-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 10:36:36AM -0800, Michael Cheng wrote:
> Replace all occurrence of cache_clflush_range with drm_clflush_virt_range.
> This will prevent compile errors on non-x86 platforms.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c                 | 12 ++++++------
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c                  |  2 +-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c                |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    |  2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index c43e724afa9f..d0999e92621b 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -444,11 +444,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>  				pd = pdp->entry[gen8_pd_index(idx, 2)];
>  			}
>  
> -			clflush_cache_range(vaddr, PAGE_SIZE);
> +			drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  			vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
>  		}
>  	} while (1);
> -	clflush_cache_range(vaddr, PAGE_SIZE);
> +	drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  
>  	return idx;
>  }
> @@ -532,7 +532,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>  			}
>  		} while (rem >= page_size && index < I915_PDES);
>  
> -		clflush_cache_range(vaddr, PAGE_SIZE);
> +		drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  
>  		/*
>  		 * Is it safe to mark the 2M block as 64K? -- Either we have
> @@ -548,7 +548,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>  					      I915_GTT_PAGE_SIZE_2M)))) {
>  			vaddr = px_vaddr(pd);
>  			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
> -			clflush_cache_range(vaddr, PAGE_SIZE);
> +			drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  			page_size = I915_GTT_PAGE_SIZE_64K;
>  
>  			/*
> @@ -569,7 +569,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>  				for (i = 1; i < index; i += 16)
>  					memset64(vaddr + i, encode, 15);
>  
> -				clflush_cache_range(vaddr, PAGE_SIZE);
> +				drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  			}
>  		}
>  
> @@ -617,7 +617,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>  
>  	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
>  	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
> -	clflush_cache_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
> +	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
>  }
>  
>  static int gen8_init_scratch(struct i915_address_space *vm)
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 11b864fd68a5..67dd4b1fc185 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2823,7 +2823,7 @@ static void execlists_sanitize(struct intel_engine_cs *engine)
>  	sanitize_hwsp(engine);
>  
>  	/* And scrub the dirty cachelines for the HWSP */
> -	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
> +	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
>  
>  	intel_engine_reset_pinned_contexts(engine);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 0d6bbc8c57f2..9b594be9102f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -255,7 +255,7 @@ fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
>  	void *vaddr = __px_vaddr(p);
>  
>  	memset64(vaddr, val, count);
> -	clflush_cache_range(vaddr, PAGE_SIZE);
> +	drm_clflush_virt_range(vaddr, PAGE_SIZE);
>  }
>  
>  static void poison_scratch_page(struct drm_i915_gem_object *scratch)
> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> index 48e6e2f87700..bd474a5123cb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> @@ -90,7 +90,7 @@ write_dma_entry(struct drm_i915_gem_object * const pdma,
>  	u64 * const vaddr = __px_vaddr(pdma);
>  
>  	vaddr[idx] = encoded_entry;
> -	clflush_cache_range(&vaddr[idx], sizeof(u64));
> +	drm_clflush_virt_range(&vaddr[idx], sizeof(u64));
>  }
>  
>  void
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..89020706adc4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3573,7 +3573,7 @@ static void guc_sanitize(struct intel_engine_cs *engine)
>  	sanitize_hwsp(engine);
>  
>  	/* And scrub the dirty cachelines for the HWSP */
> -	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
> +	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
>  
>  	intel_engine_reset_pinned_contexts(engine);
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
