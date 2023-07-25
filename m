Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F75A76189B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 14:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D539E10E10A;
	Tue, 25 Jul 2023 12:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036B010E10A;
 Tue, 25 Jul 2023 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690289117; x=1721825117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0jSyA9z1hDlFtXfNkzSAavJr9Smsg+OsIh/YJM8gN4M=;
 b=Ci1X+BnFQzX9MhyiacdK+ND7dgd1qmp2jp8i4MAwY3TsZAcik4lGhzSj
 t8NpoDtsYIgJdzdZ/bAmM/O14Mvnfn1cvnSN5Xl4J5vj1p6xpD7a8Y7D8
 M9U3MXJYIRXfoe1bfiZMRbeZU3+MFgFFD39RPnKOe+f7WVmigeSBGRy+w
 5rn6gPoC2v4QrueMrSU806ljC9tMjz95naWX/tZvpe4yhWnL2ZLoCh/M9
 ks2TXxJUgAQbN1pFFbSFnQvC88d0T9KrbV7h5WAmdCWHIgfhJZXrD2T7L
 jHK7JO9KAcrdhlP1B9i+MrkZKG5Vw6vBGGDfoZgq54ls0S4/60ssqg1/Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431511416"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431511416"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="726106705"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726106705"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:45:14 -0700
Date: Tue, 25 Jul 2023 14:45:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT
 paths of i915_vma_pin_iomap
Message-ID: <ZL/D0vd23NebU2+X@ashyti-mobl2.lan>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
 <ZL7cBvXCdtx3yzkB@ashyti-mobl2.lan>
 <d76a8009-0193-9bc9-15d1-e672cb5bd3d6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d76a8009-0193-9bc9-15d1-e672cb5bd3d6@linux.intel.com>
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
Cc: stable@vger.kernel.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > > Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
> > > added a code path which does not map via GGTT, but was still setting the
> > > ggtt write bit, and so triggering the GGTT flushing.
> > > 
> > > Fix it by not setting that bit unless the GGTT mapping path was used, and
> > > replace the flush with wmb() in i915_vma_flush_writes().
> > > 
> > > This also works for the i915_gem_object_pin_map path added in
> > > d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").
> > > 
> > > It is hard to say if the fix has any observable effect, given that the
> > > write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, but
> > > apart from code clarity, skipping the needless GGTT flushing could be
> > > beneficial on platforms with non-coherent GGTT. (See the code flow in
> > > intel_gt_flush_ggtt_writes().)
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
> > > References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
> > > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > Cc: <stable@vger.kernel.org> # v5.14+
> > > ---
> > >   drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > > index ffb425ba591c..f2b626cd2755 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
> > >   	if (err)
> > >   		goto err_unpin;
> > > -	i915_vma_set_ggtt_write(vma);
> > > +	if (!i915_gem_object_is_lmem(vma->obj) &&
> > > +	    i915_vma_is_map_and_fenceable(vma))
> > > +		i915_vma_set_ggtt_write(vma);
> > >   	/* NB Access through the GTT requires the device to be awake. */
> > >   	return page_mask_bits(ptr);
> > > @@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
> > >   {
> > >   	if (i915_vma_unset_ggtt_write(vma))
> > >   		intel_gt_flush_ggtt_writes(vma->vm->gt);
> > > +	else
> > > +		wmb(); /* Just flush the write-combine buffer. */
> > 
> > is flush the right word? Can you expand more the explanation in
> > this comment and why this point of synchronization is needed
> > here? (I am even wondering if it is really needed).
> 
> If you are hinting flush isn't the right word then I am not remembering what
> else do we use for it?
> 
> It is needed because i915_flush_writes()'s point AFAIU is to make sure CPU
> writes after i915_vma_pin_iomap() have landed in RAM. All three methods the
> latter can map the buffer are WC, therefore "flushing" of the WC buffer is
> needed for former to do something (what it promises).
> 
> Currently the wmb() is in intel_gt_flush_ggtt_writes(). But only one of the
> three mapping paths is via GGTT. So my logic is that calling it for paths
> not interacting with GGTT is confusing and not needed.
> 
> > Anyway, it looks good:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks. If you don't see a hole in my logic I can improve the comment. I
> considered it initially but then thought it is obvious enough from looking
> at the i915_vma_pin_iomap. I can comment it more.

The logic looks linear... my questions were more aiming at
confirming my understanding and improving the comment around
wmb().

Thanks,
Andi
