Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5847C382
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC821138AB;
	Tue, 21 Dec 2021 16:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629771138AB;
 Tue, 21 Dec 2021 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640102881; x=1671638881;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eb77f0f+WUx55OONSOq12VMu9yi5Muh63pKJQGfDI0M=;
 b=ZqBDXEeKBHyzj6JiO+fmdrdPDvaZKV0r7GDwhq4zaH+O3vT1631snvaY
 J59t7Qc2vOgVvXNq+ph1pp7LDC5zESYA1QdXCo8bVX/spOQjkjmttKlCl
 qCq13N+wnXydtDLjnosiY671JjeHR6W0yfxqWyh0x4QXDO/8JPhGk/ety
 gUvAVXpSdbrpbvr3UcDh77bl4LRuykWaAvhvrFTIcyEKVQuJUN8T+2J+3
 81q9NYoARH/XJPM75tgmQDV2iGwLXj274QFyOi/o5lz19gxh+AtXmv99z
 mMum/QjM7eoxSWU+7i0ktES6WFEgayMbphZydd5od6dRS3drb5oBZ7Z2U w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221096316"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="221096316"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 08:07:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="755852039"
Received: from arajji-mobl.ger.corp.intel.com (HELO [10.249.254.222])
 ([10.249.254.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 08:07:05 -0800
Message-ID: <6a8a85c1c60ccd865fbd5afe169649cbc6574449.camel@linux.intel.com>
Subject: Re: [PATCH v3 6/7] drm/i915: Use vma resources for async unbinding
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 21 Dec 2021 17:07:03 +0100
In-Reply-To: <a617dbed-be44-4617-1bab-e3cc298450b6@intel.com>
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
 <20211217145228.10987-7-thomas.hellstrom@linux.intel.com>
 <a617dbed-be44-4617-1bab-e3cc298450b6@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2021-12-21 at 14:02 +0000, Matthew Auld wrote:
> On 17/12/2021 14:52, Thomas Hellström wrote:
> > Implement async (non-blocking) unbinding by not syncing the vma
> > before
> > calling unbind on the vma_resource.
> > Add the resulting unbind fence to the object's dma_resv from where
> > it is
> > picked up by the ttm migration code.
> > Ideally these unbind fences should be coalesced with the migration
> > blit
> > fence to avoid stalling the migration blit waiting for unbind, as
> > they
> > can certainly go on in parallel, but since we don't yet have a
> > reasonable data structure to use to coalesce fences and attach the
> > resulting fence to a timeline, we defer that for now.
> > 
> > Note that with async unbinding, even while the unbind waits for the
> > preceding bind to complete before unbinding, the vma itself might
> > have been
> > destroyed in the process, clearing the vma pages. Therefore we can
> > only allow async unbinding if we have a refcounted sg-list and keep
> > a
> > refcount on that for the vma resource pages to stay intact until
> > binding occurs. If this condition is not met, a request for an
> > async
> > unbind is diverted to a sync unbind.
> > 
> > v2:
> > - Use a separate kmem_cache for vma resources for now to isolate
> > their
> >    memory allocation and aid debugging.
> > - Move the check for vm closed to the actual unbinding thread.
> > Regardless
> >    of whether the vm is closed, we need the unbind fence to
> > properly wait
> >    for capture.
> > - Clear vma_res::vm on unbind and update its documentation.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> <snip>
> 
> > @@ -416,6 +420,7 @@ int i915_vma_bind(struct i915_vma *vma,
> >   {
> >         u32 bind_flags;
> >         u32 vma_flags;
> > +       int ret;
> >   
> >         lockdep_assert_held(&vma->vm->mutex);
> >         GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> > @@ -424,12 +429,12 @@ int i915_vma_bind(struct i915_vma *vma,
> >         if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
> >                                               vma->node.size,
> >                                               vma->vm->total))) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return -ENODEV;
> >         }
> >   
> >         if (GEM_DEBUG_WARN_ON(!flags)) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return -EINVAL;
> >         }
> >   
> > @@ -441,12 +446,30 @@ int i915_vma_bind(struct i915_vma *vma,
> >   
> >         bind_flags &= ~vma_flags;
> >         if (bind_flags == 0) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return 0;
> >         }
> >   
> >         GEM_BUG_ON(!vma->pages);
> >   
> > +       /* Wait for or await async unbinds touching our range */
> > +       if (work && bind_flags & vma->vm->bind_async_flags)
> > +               ret = i915_vma_resource_bind_dep_await(vma->vm,
> > +                                                      &work-
> > >base.chain,
> > +                                                      vma-
> > >node.start,
> > +                                                      vma-
> > >node.size,
> > +                                                      true,
> > +                                                      GFP_NOWAIT |
> > +                                                     
> > __GFP_RETRY_MAYFAIL |
> > +                                                     
> > __GFP_NOWARN);
> > +       else
> > +               ret = i915_vma_resource_bind_dep_sync(vma->vm, vma-
> > >node.start,
> > +                                                     vma-
> > >node.size, true);
> 
> Is there nothing scary here with coloring? Say with cache coloring,
> to 
> ensure we unbind the neighbouring nodes(if they are conflicting)
> before 
> doing the bind, or is async unbinding only ever going to be used for
> the 
> ppGTT?
> 
> And then I guess there might also be memory coloring where we likely 
> need to ensure that all the unbinds within the overlapping PT(s) have
> been completed before doing the bind, since the bind will also
> increment 
> the usage count of the PT, potentially preventing it from being 
> destroyed, which will skip nuking the PDE state, AFAIK. Previously
> the 
> drm_mm node(s) would still be present, which would trigger the
> eviction. 
> Although it might be that we just end up aligning everything to 2M,
> and 
> so drop the memory coloring anyway, so maybe no need to worry about
> this 
> yet...

Hmm. This indeed sounds that there were some important considerations
left out. I was under the impression that only previously scheduled
unbinds touching the same range would have need to have finished.

Currently there's only ppGTT async unbinding, but I figure moving
forward we don't want to restrict it.

I wonder whether instead of keeping an interval tree of pending unbinds
we should keep just a single fence per VM of the last pending unbind,
and move to the RB tree as a separate optimization step if needed. That
would AFAICT keep the current semantics of all unbinds that were
scheduled before the current bind are completed before the bind. Do you
think that would be sufficient?

Thanks,
Thomas





