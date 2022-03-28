Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F994E9F40
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D710EB28;
	Mon, 28 Mar 2022 18:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0310E75D;
 Mon, 28 Mar 2022 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648493796; x=1680029796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4vd/1TQQvTHsIJIOmjDa+rLkCttcbGry7bi283SPHUI=;
 b=Bzx+p8k7MBSDNOF2+wb7ndZ2fWc+jdGLaiW6x+Gc9OwJGOXL348tgGig
 O0V8HudhfzItutOoN0A1KzsTckJt7nhxHZAuz2rU0FVKfyVTDGhs25HfY
 7eTvZyCzWXAQUVCkDhBOODSWi8MJjK8Lc/igvHr2RlysLQyL4NpsUXQI5
 A85aXHIH/d/eObMze5iazAaCxBxEObBD6ESuN2s5l7pWfpy0AZ0EkPjBA
 Ab7yYbWaBumu3edADTVrkGANmGqS4MYguAkyW2/Ll5LrJvIgIHUdiASG3
 An83WJtIlYjt4BerjWZIwQXG7vRLwf2WmBmAjbb0ywvLEln6iA8u7KRfB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="256656247"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="256656247"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:56:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563912221"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 11:56:32 -0700
Date: Tue, 29 Mar 2022 00:27:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 8/9] drm/i915/gem: Add extra pages in ttm_tt for ccs
 data
Message-ID: <20220328185711.GB19751@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-9-ramalingam.c@intel.com>
 <ece35a9e-a8e7-b007-9d99-4902ce0a3a93@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ece35a9e-a8e7-b007-9d99-4902ce0a3a93@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-24 at 17:28:08 +0100, Thomas Hellström wrote:
> 
> On 3/21/22 23:44, Ramalingam C wrote:
> > On Xe-HP and later devices, dedicated compression control state (CCS)
> > stored in local memory is used for each surface, to support the
> > 3D and media compression formats.
> > 
> > The memory required for the CCS of the entire local memory is 1/256 of
> > the local memory size. So before the kernel boot, the required memory
> > is reserved for the CCS data and a secure register will be programmed
> > with the CCS base address
> > 
> > So when an object is allocated in local memory, dont need to explicitly
> > allocate the space for ccs data. But when the obj is evicted into the
> > smem, to hold the compression related data along with the obj extra space
> > is needed in smem. i.e obj_size + (obj_size/256).
> > 
> > Hence when a smem pages are allocated for an obj with lmem placement
> > possibility we create with the extra pages required for the ccs data for
> > the obj size.
> > 
> > v2:
> >    Used imperative wording [Thomas]
> > v3:
> >    Inflate the pages only when obj's placement is lmem only
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Christian Koenig <christian.koenig@amd.com>
> > cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> > Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 29 ++++++++++++++++++++++++-
> >   1 file changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index 3b9f99c765c4..0305a150b9d4 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -20,6 +20,7 @@
> >   #include "gem/i915_gem_ttm.h"
> >   #include "gem/i915_gem_ttm_move.h"
> >   #include "gem/i915_gem_ttm_pm.h"
> > +#include "gt/intel_gpu_commands.h"
> >   #define I915_TTM_PRIO_PURGE     0
> >   #define I915_TTM_PRIO_NO_PAGES  1
> > @@ -262,12 +263,33 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
> >   	.release = i915_ttm_tt_release
> >   };
> > +static inline bool
> > +i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
> > +{
> > +	bool lmem_placement = false;
> > +	int i;
> > +
> > +	for (i = 0; i < obj->mm.n_placements; i++) {
> > +		/* Compression is not allowed for the objects with smem placement */
> > +		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
> > +			return false;
> > +		if (!lmem_placement &&
> > +		    obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
> > +			lmem_placement = true;
> > +	}
> > +
> > +	return lmem_placement;
> > +}
> > +
> >   static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> >   					 uint32_t page_flags)
> >   {
> > +	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
> > +						     bdev);
> >   	struct ttm_resource_manager *man =
> >   		ttm_manager_type(bo->bdev, bo->resource->mem_type);
> >   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> > +	unsigned long ccs_pages = 0;
> >   	enum ttm_caching caching;
> >   	struct i915_ttm_tt *i915_tt;
> >   	int ret;
> > @@ -290,7 +312,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> >   		i915_tt->is_shmem = true;
> >   	}
> > -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> > +	if (HAS_FLAT_CCS(i915) && i915_gem_object_needs_ccs_pages(obj))
> > +		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
> > +						      NUM_BYTES_PER_CCS_BYTE),
> > +					 PAGE_SIZE);
> > +
> > +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, ccs_pages);
> >   	if (ret)
> >   		goto err_free;
> 
> Since we need to respin could we add (in __i915_ttm_get_pages())
> 
> /* Verify that gem never sees inflated system pages. Keep that local to ttm
> */GEM_BUG_ON(bo->ttm && ((obj->base.size >> PAGE_SHIFT) <
> bo->ttm->num_pages))
Adding this gem warn on in next ver.

Ram
> 
> /Thomas
> 
> 
> 
