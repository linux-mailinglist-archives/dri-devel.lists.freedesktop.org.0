Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12596886D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FDF10E2F9;
	Mon,  2 Sep 2024 13:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SSFIVcRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009B10E2F3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:06:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42bbe809b06so23687135e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725282360; x=1725887160; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HXdsl6ny5pUe4Du4fYdr1RolydXqWmJVtsW6zLPsr2U=;
 b=SSFIVcRxfHH7wYdHx1mV5E2NdlVEZ7QpTmUCvqHfzpUhhmohK6raQ5NeqtAARd62Ys
 EKravBDQXCodKts1dvWSgd6nFDh2YPmP1KpJRQios84Bd+eYVJeg69QyI3dZdT+0a9it
 ds6wHCuyvmPNtP6UyBnONa8G3YUUZrgAOaHKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725282360; x=1725887160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXdsl6ny5pUe4Du4fYdr1RolydXqWmJVtsW6zLPsr2U=;
 b=kQKNqnPJDrbj9yqsaJ+XTNvCCVBcjaKJV4T4XOmaFhndWYtD5tKvvH4+a5bnWmVju2
 ED8WL55ITsrr/bpsTbnjzWnI/wvM1SolYV7Cr+evSSLPHSe3rd5j6PF/i+X/6n86dXOd
 9IGV3FhUUyKnsrMEzV5sZbIJ6GqPVcnJOHflIlDu9RcSRyMcyRYdFXeqUWhzlsjiyuLr
 q4ZpDVYajyoHm/aDERa7SG3vs90tQgGKX20UD7wQkyXKvDp7bt08CJAWJdLFP4UvATed
 iyF+FWedzdEdqW+kUtF4z6dVkE6BCjSJ5kJVTg8mHGhm285Cv7/Zk+0/zyRo5/ftxgbd
 F/1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy7aE57XsZb1x/hK5avX33M0HStGiRbhgzyEIxK98piwU0//R0hQyKpHZzBW/66tZEd1r+rAIKq+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/2SmDg0AcDbDtxJrCM0I1CDr2enunXbkaMktrBEKHizihTIRZ
 TA38SfWvtFz2MexP/AwK+OVKDENCFbEuQB9WV+2bWFbTZ2MZfDXZS2IhXyGWAzk=
X-Google-Smtp-Source: AGHT+IFwKnL3/4bAg3Js7ct0TuHYR7CskRAGq+xKCA5Do3ABnpYvnKIVk9N0z2g/cwpzFndhrfAX8A==
X-Received: by 2002:a05:600c:4694:b0:42b:a2fd:3e25 with SMTP id
 5b1f17b1804b1-42bb27bdc3dmr96044675e9.37.1725282360100; 
 Mon, 02 Sep 2024 06:06:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c4059811sm5246121f8f.4.2024.09.02.06.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:05:59 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:05:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 24/28] drm/xe: Basic SVM BO eviction
Message-ID: <ZtW4NTS5tbXx9wCr@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-25-matthew.brost@intel.com>
 <ZtBKHT_vuNfE5Y5j@phenom.ffwll.local>
 <ZtCaDBtsInEif/E2@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtCaDBtsInEif/E2@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 03:55:56PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 12:14:53PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 27, 2024 at 07:48:57PM -0700, Matthew Brost wrote:
> > > Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
> > > lock.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 35 +++++++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_svm.c      |  2 ++
> > >  drivers/gpu/drm/xe/xe_svm.h      | 13 ++++++++++++
> > >  4 files changed, 52 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index ad804b6f9e84..ae71fcbe5380 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -25,6 +25,7 @@
> > >  #include "xe_pm.h"
> > >  #include "xe_preempt_fence.h"
> > >  #include "xe_res_cursor.h"
> > > +#include "xe_svm.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > @@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > >  static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > >  			   struct ttm_placement *placement)
> > >  {
> > > +	struct xe_bo *bo;
> > > +
> > >  	if (!xe_bo_is_xe_bo(tbo)) {
> > >  		/* Don't handle scatter gather BOs */
> > >  		if (tbo->type == ttm_bo_type_sg) {
> > > @@ -261,6 +264,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > >  		return;
> > >  	}
> > >  
> > > +	bo = ttm_to_xe_bo(tbo);
> > > +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
> > > +		*placement = sys_placement;
> > > +		return;
> > > +	}
> > > +
> > >  	/*
> > >  	 * For xe, sg bos that are evicted to system just triggers a
> > >  	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> > > @@ -758,6 +767,17 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > >  		}
> > >  	}
> > >  
> > > +	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) &&
> > > +	    new_mem->mem_type == XE_PL_SYSTEM) {
> > > +		ret = xe_svm_range_evict(bo->range);
> > > +		if (!ret) {
> > > +			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
> > > +			ttm_bo_move_null(ttm_bo, new_mem);
> > > +		}
> > > +
> > > +		goto out;
> > > +	}
> > > +
> > >  	if (!move_lacks_source &&
> > >  	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> > >  	     (mem_type_is_vram(old_mem_type) &&
> > > @@ -1096,6 +1116,19 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > >  	}
> > >  }
> > >  
> > > +static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
> > > +				    const struct ttm_place *place)
> > > +{
> > > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > > +
> > > +	/* Do not evict SVMs before having a binding */
> > > +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC &&
> > > +	    !xe_svm_range_has_vram_binding(bo->range))
> > > +		return false;
> > > +
> > > +	return ttm_bo_eviction_valuable(ttm_bo, place);
> > > +}
> > > +
> > >  const struct ttm_device_funcs xe_ttm_funcs = {
> > >  	.ttm_tt_create = xe_ttm_tt_create,
> > >  	.ttm_tt_populate = xe_ttm_tt_populate,
> > > @@ -1106,7 +1139,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
> > >  	.io_mem_reserve = xe_ttm_io_mem_reserve,
> > >  	.io_mem_pfn = xe_ttm_io_mem_pfn,
> > >  	.release_notify = xe_ttm_bo_release_notify,
> > > -	.eviction_valuable = ttm_bo_eviction_valuable,
> > > +	.eviction_valuable = xe_bo_eviction_valuable,
> > >  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> > >  };
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 2ed558ac2264..4523b033417c 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -16,6 +16,7 @@
> > >  #include "xe_ggtt_types.h"
> > >  
> > >  struct xe_device;
> > > +struct xe_svm_range;
> > >  struct xe_vm;
> > >  
> > >  #define XE_BO_MAX_PLACEMENTS	3
> > > @@ -47,6 +48,8 @@ struct xe_bo {
> > >  	struct ttm_bo_kmap_obj kmap;
> > >  	/** @pinned_link: link to present / evicted list of pinned BO */
> > >  	struct list_head pinned_link;
> > > +	/** @range: SVM range for BO */
> > > +	struct xe_svm_range *range;
> > >  #ifdef CONFIG_PROC_FS
> > >  	/**
> > >  	 * @client: @xe_drm_client which created the bo
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index fd8987e0a506..dc9810828c0a 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -531,6 +531,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > >  			  range->base.va.start, ttm_bo_type_device,
> > >  			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > >  			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
> > > +	if (!IS_ERR(bo))
> > > +		bo->range = range;
> > >  	xe_vm_unlock(vm);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 3f432483a230..b9cf0e2500da 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -46,6 +46,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> > >  	return range->base.flags.has_dma_mapping;
> > >  }
> > >  
> > > +static inline bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> > > +{
> > > +	return xe_svm_range_in_vram(range) && range->tile_present;
> > > +}
> > > +
> > > +static inline int xe_svm_range_evict(struct xe_svm_range *range)
> > > +{
> > > +	struct drm_gpusvm_ctx ctx = { .trylock_mmap = true, };
> > 
> > So even trying to acquire an mmap lock for eviction is I think a design
> > bug for svm memory ranges. It's a bunch of physical memory, you have no
> > idea how many mm/vma map it and which one you pick as the special one is
> > fairly arbitrary.
> > 
> 
> Let me drop whole trylock this and just evict via
> drm_gpusvm_evict_to_sram / migrate_device_vma_range which does not
> require the mmap. I add this code very recently per Matt Auld suggestion
> and agree it makes the try locking unnecessary.
> 
> > So dont, eviction should entirely ignore va/mm issues at the top level
> > like the migrate_device_range function does (maybe we need a
> > scatter-gather version of that instead of just a range.
> > 
> 
> I needed to add migrate_device_vma_range (might be a bad name) as VRAM
> may be non-continuous pfns when memory pressure exists where as
> migrate_device_range only supports continuous pfns.

Ah, I think that's another fallout of tying vram allocations and
management too closely to the gpusvm->mm va layout. Makes sense under the
assumptions of your design at least.

So I think we can file that under the large discussion item of per
page/folio or per-range gpusvm design.
-Sima

> > That function internally makes sure you're in sync with any vma/vm by:
> > - installing migration ptes everywhere, which does the mmu_notifer dance
> > - locking the pages to prevent other concurrent migration or other fun
> >   stuff from happening
> > - then restore ptes to something sensisble when it's all done
> > 
> > And it does that by looping over _all_ possible mappings of a page with
> > the rmap_walk infrastructure.
> > 
> > The only reason when we need the mmap lock (or vma lock or whatever) is if
> > we need to be coherent with other concurrent mm updates of a specific mm.
> > That should only be the case when migrating to vram, where the gpusvm->mm
> > is the special one, and when migrating to sram due to cpu faults, where
> > the vmf->vma->mm is special (and might at best have a tenous relationship
> > to the gpusvm->mm). But that's the only cases where a specific mm and vma
> > have any relevance to svm vram allocations.
> > 
> 
> Thanks for the info.
> 
> Matt
> 
> > -Sima
> > 
> > > +
> > > +	return drm_gpusvm_migrate_to_sram(range->base.gpusvm, &range->base,
> > > +					  &ctx);
> > > +}
> > > +
> > >  #define xe_svm_notifier_lock(vm__)	\
> > >  	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> > >  
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
