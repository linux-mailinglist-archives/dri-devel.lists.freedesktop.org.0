Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF313485666
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 17:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F0E10FF51;
	Wed,  5 Jan 2022 16:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3E10FF4B;
 Wed,  5 Jan 2022 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641398628; x=1672934628;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ohL8om2Ku1tRSDFkto1TEuKqTzpXA48915Bna77Zsk=;
 b=ighBMSG+hXiSdZCm1T4jngWKIpNY+H6+U7bDtu0lCY72legJEmmdI1O3
 jPRS6m78QbcCwMLgV5FkdomIxePayGsPLAEyV57s76crKdNxM3qkM8W1q
 BujVnNp/oCSuo1grQp4Z8q0oFEfl5Tta+6I3z1RKvGmdppYB04WtoRAj0
 FfM9AcZMLAa3mq6rUSRhTy8r+/f09HJIrJ3iXySGwTI9MC9+sC3rscr6m
 YyDikQMdpznbQqaalsGX7umSau99T5jma/tmurhB5t0LUA8M9Vpt0eLXI
 g+Qtm+/A1dpi5Bfeed3VCQuh4JyTCizOMBZZnn01vE1MkiE4Gyn04NKRx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241290461"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="241290461"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 08:03:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="488615421"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.213])
 ([10.249.254.213])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 08:03:45 -0800
Message-ID: <16587098a6539cea5403712a806b4bf9b4964440.camel@linux.intel.com>
Subject: Re: [PATCH v5 4/6] drm/i915: Use vma resources for async unbinding
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 05 Jan 2022 17:03:42 +0100
In-Reply-To: <f022f46f-555f-ec83-49a9-df771e46127c@intel.com>
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
 <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
 <f022f46f-555f-ec83-49a9-df771e46127c@intel.com>
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

On Wed, 2022-01-05 at 15:52 +0000, Matthew Auld wrote:
> On 04/01/2022 12:51, Thomas Hellström wrote:
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
> > v4:
> > - Take cache coloring into account when searching for vma resources
> >    pending unbind. (Matthew Auld)
> > v5:
> > - Fix timeout and error check in
> > i915_vma_resource_bind_dep_await().
> > - Avoid taking a reference on the object for async binding if
> >    async unbind capable.
> > - Fix braces around a single-line if statement.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> <snip>
> 
> > @@ -434,12 +439,30 @@ int i915_vma_bind(struct i915_vma *vma,
> >   
> >         bind_flags &= ~vma_flags;
> >         if (bind_flags == 0) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return 0;
> >         }
> >   
> >         GEM_BUG_ON(!atomic_read(&vma->pages_count));
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
> > +       if (ret) {
> > +               i915_vma_resource_free(vma_res);
> > +               return ret;
> > +       }
> > +
> >         if (vma->resource || !vma_res) {
> >                 /* Rebinding with an additional I915_VMA_*_BIND */
> >                 GEM_WARN_ON(!vma_flags);
> > @@ -452,9 +475,11 @@ int i915_vma_bind(struct i915_vma *vma,
> >         if (work && bind_flags & vma->vm->bind_async_flags) {
> >                 struct dma_fence *prev;
> >   
> > -               work->vma = vma;
> > +               work->vma_res = i915_vma_resource_get(vma-
> > >resource);
> >                 work->cache_level = cache_level;
> >                 work->flags = bind_flags;
> > +               if (vma->obj->mm.rsgt)
> > +                       work->rsgt = i915_refct_sgt_get(vma->obj-
> > >mm.rsgt);
> 
> Hmmm, at a glance I would have expected this to use the vma->pages. I
> think with the GGTT the vma will often create its own sg layout which
> != 
> obj->mm.sgt. IIUC the async unbind will still call vma_unbind_pages 
> which might nuke the vma sgt? Or is something else going on here?
> 

Yes, the binding code is only using vma_res->pages, which should have
been copied from vma->pages, and keeps a reference to the rsgt just in
case we do an async unbind.

However good point we should refuse async unbind for now if vma_res-
>pages != &rsgt->table, because the former might otherwise be nuked
before the async unbind actually happens. Will fix that for next
version.

/Thomas




