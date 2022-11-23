Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0457636951
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 19:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCDE10E23F;
	Wed, 23 Nov 2022 18:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5910E214;
 Wed, 23 Nov 2022 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669229668; x=1700765668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BezJs16gFnfHzepGfGCLKiT17WjzzvvgqoxItc7WdnQ=;
 b=Nr0f4iKDhLQ4XVDWHVH9a/tRmkaCfwPMkjRAdSVBW36ScHbjhER1i3gK
 eWLPvB51wo1AP3/qODoPkT3N0n3ifmy++1I4Gco57elSWBt1FRXu95Iaj
 fEzGtRHKP2JLSU0OWX0B+Xb1nRO9HQKAkCy8KsqvEkHry5q7k+2wyK4ks
 YwNc3b8EynRwQTVZyKXzbK5nYseR6qpox3Na28W5NPmd0xUt4fcjGhIM8
 eMSePTdMuAG9GyegxPADTkItmKzm1Fh82laZBjGt4bue8JpWa9u1SDM9C
 5mOAIKa4Z02UxHeEMUmtmydESjOA45zLFw/qACKipvoaHWb05mFzhmFEd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="297499091"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="297499091"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 10:54:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="710694785"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="710694785"
Received: from ekemppi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.32.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 10:54:24 -0800
Date: Wed, 23 Nov 2022 19:54:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915: Introduce guard pages to
 i915_vma
Message-ID: <Y35sXXLiAmwulDRU@ashyti-mobl2.lan>
References: <20221122185737.96459-1-andi.shyti@linux.intel.com>
 <20221122185737.96459-3-andi.shyti@linux.intel.com>
 <a579e9a5-0bd4-d439-3193-64dc52e05997@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a579e9a5-0bd4-d439-3193-64dc52e05997@linux.intel.com>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

[...]

> > @@ -768,6 +768,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >   	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
> >   	GEM_BUG_ON(!is_power_of_2(alignment));
> > +	guard = vma->guard; /* retain guard across rebinds */
> > +	guard = ALIGN(guard, alignment);
> 
> Why does guard area needs the same alignment as the requested mapping? What about the fact on 32-bit builds guard is 32-bit and alignment u64?

I guess this just to round up/down guard to something, not
necessarily to that alignment.

Shall I remove it?

[...]

> > @@ -777,6 +780,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >   	if (flags & PIN_ZONE_4G)
> >   		end = min_t(u64, end, (1ULL << 32) - I915_GTT_PAGE_SIZE);
> >   	GEM_BUG_ON(!IS_ALIGNED(end, I915_GTT_PAGE_SIZE));
> > +	GEM_BUG_ON(2 * guard > end);
> 
> End is the size of relevant VA area at this point so what and why is this checking?

I think because we want to make sure the padding is at least not
bigger that the size. What is actually wrong with this.

[...]

> > @@ -855,6 +869,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >   	GEM_BUG_ON(!i915_gem_valid_gtt_space(vma, color));
> >   	list_move_tail(&vma->vm_link, &vma->vm->bound_list);
> > +	vma->guard = guard;
> 
> unsigned long into u32 - what guarantees no truncation?

we are missing here this part above:

	guard = vma->guard; /* retain guard across rebinds */
	if (flags & PIN_OFFSET_GUARD) {
		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
	}

that should make sure that we fit into 32 bits.

[...]

> > @@ -197,14 +197,15 @@ struct i915_vma {
> >   	struct i915_fence_reg *fence;
> >   	u64 size;
> > -	u64 display_alignment;
> >   	struct i915_page_sizes page_sizes;
> >   	/* mmap-offset associated with fencing for this vma */
> >   	struct i915_mmap_offset	*mmo;
> > +	u32 guard; /* padding allocated around vma->pages within the node */
> >   	u32 fence_size;
> >   	u32 fence_alignment;
> > +	u32 display_alignment;
> 
> u64 -> u32 for display_alignment looks unrelated change.
> 
> ./display/intel_fb_pin.c:       vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
> ./gem/i915_gem_domain.c:        vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
> 
> These two sites need to be changed not to use u64.
> 
> Do this part in a separate patch?

Right! will remove it.

> >   	/**
> >   	 * Count of the number of times this vma has been opened by different
> 
> Regards,

Thanks,
Andi

> Tvrtko
