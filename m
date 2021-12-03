Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3E467CBE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 18:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040077B05F;
	Fri,  3 Dec 2021 17:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA87B05F;
 Fri,  3 Dec 2021 17:42:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="236961736"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="236961736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:42:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="501270784"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:42:03 -0800
Date: Fri, 3 Dec 2021 23:15:18 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/8] drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
Message-ID: <20211203174518.GE27873@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-3-matthew.auld@intel.com>
 <20211203165915.GB26974@intel.com>
 <bf75ead5-fa0a-2be8-6d70-7f57c57dfb9d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf75ead5-fa0a-2be8-6d70-7f57c57dfb9d@intel.com>
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

On 2021-12-03 at 17:31:11 +0000, Matthew Auld wrote:
> On 03/12/2021 16:59, Ramalingam C wrote:
> > On 2021-12-03 at 12:24:20 +0000, Matthew Auld wrote:
> > > If this is LMEM then we get a 32 entry PT, with each PTE pointing to
> > > some 64K block of memory, otherwise it's just the usual 512 entry PT.
> > > This very much assumes the caller knows what they are doing.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 50 ++++++++++++++++++++++++++--
> > >   1 file changed, 48 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > index bd3ca0996a23..312b2267bf87 100644
> > > --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > @@ -728,13 +728,56 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
> > >   		gen8_pdp_for_page_index(vm, idx);
> > >   	struct i915_page_directory *pd =
> > >   		i915_pd_entry(pdp, gen8_pd_index(idx, 2));
> > > +	struct i915_page_table *pt = i915_pt_entry(pd, gen8_pd_index(idx, 1));
> > >   	gen8_pte_t *vaddr;
> > > -	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
> > > +	GEM_BUG_ON(pt->is_compact);
> > 
> > Do we have compact PT for smem with 64k pages?
> 
> It's technically possible but we don't bother trying to support it in the
> driver.
Ok.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> > 
> > > +
> > > +	vaddr = px_vaddr(pt);
> > >   	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
> > >   	clflush_cache_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
> > >   }
> > > +static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
> > > +					    dma_addr_t addr,
> > > +					    u64 offset,
> > > +					    enum i915_cache_level level,
> > > +					    u32 flags)
> > > +{
> > > +	u64 idx = offset >> GEN8_PTE_SHIFT;
> > > +	struct i915_page_directory * const pdp =
> > > +		gen8_pdp_for_page_index(vm, idx);
> > > +	struct i915_page_directory *pd =
> > > +		i915_pd_entry(pdp, gen8_pd_index(idx, 2));
> > > +	struct i915_page_table *pt = i915_pt_entry(pd, gen8_pd_index(idx, 1));
> > > +	gen8_pte_t *vaddr;
> > > +
> > > +	GEM_BUG_ON(!IS_ALIGNED(addr, SZ_64K));
> > > +	GEM_BUG_ON(!IS_ALIGNED(offset, SZ_64K));
> > > +
> > > +	if (!pt->is_compact) {
> > > +		vaddr = px_vaddr(pd);
> > > +		vaddr[gen8_pd_index(idx, 1)] |= GEN12_PDE_64K;
> > > +		pt->is_compact = true;
> > > +	}
> > > +
> > > +	vaddr = px_vaddr(pt);
> > > +	vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, flags);
> > > +}
> > > +
> > > +static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
> > > +				       dma_addr_t addr,
> > > +				       u64 offset,
> > > +				       enum i915_cache_level level,
> > > +				       u32 flags)
> > > +{
> > > +	if (flags & PTE_LM)
> > > +		return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
> > > +						       level, flags);
> > > +
> > > +	return gen8_ppgtt_insert_entry(vm, addr, offset, level, flags);
> > Matt,
> > 
> > Is this call for gen8_*** is for insertion of smem PTE entries on the
> > 64K capable platforms like DG2?
> 
> Yeah, this just falls back to the generic 512 entry layout for the PT.
> 
> > 
> > Ram
> > 
> > > +}
> > > +
> > >   static int gen8_init_scratch(struct i915_address_space *vm)
> > >   {
> > >   	u32 pte_flags;
> > > @@ -937,7 +980,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> > >   	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
> > >   	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
> > > -	ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
> > > +	if (HAS_64K_PAGES(gt->i915))
> > > +		ppgtt->vm.insert_page = xehpsdv_ppgtt_insert_entry;
> > > +	else
> > > +		ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
> > >   	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
> > >   	ppgtt->vm.clear_range = gen8_ppgtt_clear;
> > >   	ppgtt->vm.foreach = gen8_ppgtt_foreach;
> > > -- 
> > > 2.31.1
> > > 
