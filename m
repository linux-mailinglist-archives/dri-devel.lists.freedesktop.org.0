Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A613B1A68
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89E46E0DC;
	Wed, 23 Jun 2021 12:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F69289BF0;
 Wed, 23 Jun 2021 12:44:35 +0000 (UTC)
IronPort-SDR: hdN2jj0O9GRBOp9rzC/Dinz518IVW9diRnim95kSQdxph1bpiFSXMRwXj7tNxa1JPW/Ey3IJa7
 T5JCBM2dkA0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="292879213"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="292879213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:44:34 -0700
IronPort-SDR: EB+UvefkRVQnwNHLyD/WjA1S0aYBMu7XmXaFAFi93zSVXsTzSDaPY9JUpIRjFRI6JKYjhxIlDw
 jHsbGI0RzPcw==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="453021619"
Received: from asortkjx-mobl.ger.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:44:33 -0700
Message-ID: <d0624cc5f8d689d325cc9ec0c5b53cfacf109fa5.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 23 Jun 2021 14:44:30 +0200
In-Reply-To: <dcb9729d-fd1c-900e-bb6e-38eb2cf208d2@intel.com>
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
 <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
 <dcb9729d-fd1c-900e-bb6e-38eb2cf208d2@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-06-23 at 13:25 +0100, Matthew Auld wrote:
> On 23/06/2021 12:51, Thomas Hellström wrote:
> > 
> > On 6/23/21 1:26 PM, Matthew Auld wrote:
> > > The min_page_size is only needed for pages inserted into the GTT,
> > > and
> > > for our paging structures we only need at most 4K bytes, so
> > > simply
> > > ignore the min_page_size restrictions here, otherwise we might
> > > see some
> > > severe overallocation on some devices.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
> > > b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > index 084ea65d59c0..61e8a8c25374 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > @@ -16,7 +16,7 @@ struct drm_i915_gem_object
> > > *alloc_pt_lmem(struct 
> > > i915_address_space *vm, int sz)
> > >   {
> > >       struct drm_i915_gem_object *obj;
> > > -    obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
> > > +    obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz,
> > > sz, 0);
> > >       /*
> > >        * Ensure all paging structures for this vm share the same
> > > dma-resv
> > >        * object underneath, with the idea that one object_lock()
> > > will 
> > > lock
> > 
> > I think for this one the new gt migration code might break, because
> > there we insert even PT pages into the GTT, so it might need a
> > special 
> > interface? Ram is looking at supporter larger GPU PTE sizes with
> > that 
> > code..
> 
> For DG1 at least we don't need this. But yeah we can always just pass
> along the page size when allocating the stash I guess, if we need 
> something special for migration?
> 
> But when we need to support huge PTEs for stuff other than DG1, then 
> it's still a pile of work I assume, since we still need all the
> special 
> PTE insertion routines specifically for insert_pte() which will
> differ 
> wildly between generations, also each has quite different
> restrictions 
> wrt min physical alignment of lmem, whether you can mix 64K/4K PTEs
> in 
> the same 2M va range, whether 4K PTEs are even supported for lmem
> etc.
> 
> Not sure if it's simpler to go with mapping all of lmem upfront with
> the 
> flat-ppGTT? Maybe that sidesteps some of these issues? At least for
> the 
> physical alignment of paging structures that would no longer be a
> concern.

Yes, that might be the simplest way forward.

/Thomas




> 
> > 
> > /Thomas
> > 
> > 
> > 


