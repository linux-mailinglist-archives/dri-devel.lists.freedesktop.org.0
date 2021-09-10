Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908D406898
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925DF89177;
	Fri, 10 Sep 2021 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6AF89177
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:40:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="282047557"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="282047557"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 01:40:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="697007365"
Received: from gjanssen-mobl5.ger.corp.intel.com (HELO [10.249.254.69])
 ([10.249.254.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 01:40:53 -0700
Message-ID: <363f7eea81dbdfec69fa8586a7b04e5d383bc551.camel@linux.intel.com>
Subject: Re: i915 ttm_tt shmem backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Matthew Auld <matthew.william.auld@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Date: Fri, 10 Sep 2021 10:40:50 +0200
In-Reply-To: <8129207c-bfb6-a710-c051-0f1befa55807@gmail.com>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
 <ffab32dacece7fe3bb155f1ce2873d9e603f9f09.camel@linux.intel.com>
 <8129207c-bfb6-a710-c051-0f1befa55807@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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

On Fri, 2021-09-10 at 10:25 +0200, Christian König wrote:
> 
> 
> Am 10.09.21 um 10:08 schrieb Thomas Hellström:
> > Perhaps some background and goal is worth mentioning here.
> > 
> > 
> > On Thu, 2021-09-09 at 17:56 +0100, Matthew Auld wrote:
> > > On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
> > > <Christian.Koenig@amd.com> wrote:
> > > > Hi Matthew,
> > > > 
> > > > this doesn't work, I've already tried something similar.
> > > > 
> > > > TTM uses the reverse lookup functionality when migrating BOs
> > > > between system and device memory. And that doesn't seem to work
> > > > with pages from a shmem file.
> > > Hmm, what do you mean by reverse lookup functionality? Could you
> > > please point out where that is in the TTM code?
> > I think this is in unmap_mapping_range() where, if we use
> > VM_MIXEDMAP,
> > there is a reverse lookup on the PTEs that point to real pages. Now
> > that we move over to VM_PFNMAP, that problem should go away since
> > core
> > vm never has a page to investigate. Probably this is why things
> > works
> > on non-TTM i915 GEM.
> 
> Yeah, that was really likely the root problem. I didn't kept 
> investigating after realizing that my approach wouldn't work.
> 
> > @Christian: Some background here:
> > First I think that there might be things like the above that will
> > pose
> > problems, and we may or may not be able to overcome those but more
> > importantly is that we agree with you that *if* we make it work, it
> > is
> > something that you as a maintainer of TTM can accept from a design-
> > and
> > maintainabiltiy point of view.
> > 
> > The approach would be similar to the buddy allocator, we adapt some
> > driver code to TTM in a way that it may be reused with other
> > drivers,
> > and if other drivers are interested, we'd assist in moving to core
> > TTM.
> > In essence it'd be a TTM shmem page pool with full shrinking
> > ability
> > for cached pages only.
> > 
> > What we're really after here is the ability to shrink that doesn't
> > regress much w r t the elaborate shrinker that's in i915 today that
> > is
> > power management aware and is also able to start shmem writebacks
> > to
> > avoid shmem just caching the pages instead of giving them back to
> > the
> > system (IIRC it was partly the lack of this that blocked earlier
> > TTM
> > shrinking efforts).
> > 
> > And since it doesn't really matter whether the shrinker sits in
> > core
> > TTM or in a driver, I think a future goal might be a set of TTM
> > shrinker helpers that makes sure we shrink the right TTM object,
> > and
> > perhaps a simple implementation that is typically used by simple
> > drivers and other drivers can build on that for a more elaborate
> > power-
> > management aware shrinker.
> 
> That's understandable, but I think not necessary what we should aim
> for 
> in the long term.
> 
> First of all I would really like to move more of the functionality
> from 
> ttm_pool.c into the core memory management, especially handling of 
> uncached and write combined memory.
> 
> That's essentially completely architecture dependent and currently 
> implemented extremely awkward. Either Daniels suggestion of having a 
> GFP_WC or Christophs approach of moving all this into the DMA API is
> the 
> way to go here.
> 
> As long as i915 has no interest in USWC support implementing their
> own 
> shmemfile backend sounds fine to me, but I have strong doubt that
> this 
> will be of use to anybody else.

OK. Sounds fine. In situations where we use WC system memory we will
use what's in TTM today. BTW on the shrinking approach for WC pages,
does the Christoph's DMA API solution envision some kind of support for
this?

/Thomas

> 
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > ________________________________
> > > > Von: Matthew Auld <matthew.william.auld@gmail.com>
> > > > Gesendet: Donnerstag, 9. September 2021 16:56
> > > > An: Christian König <ckoenig.leichtzumerken@gmail.com>; Koenig,
> > > > Christian <Christian.Koenig@amd.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; ML
> > > > dri-
> > > > devel <dri-devel@lists.freedesktop.org>
> > > > Betreff: i915 ttm_tt shmem backend
> > > > 
> > > > Hi Christian,
> > > > 
> > > > We are looking into using shmem as a ttm_tt backend in i915 for
> > > > cached
> > > > system memory objects. We would also like to make such objects
> > > > visible
> > > > to the i915-gem shrinker, so that they may be swapped out or
> > > > discarded
> > > > when under memory pressure.
> > > > 
> > > > One idea for handling this is roughly something like:
> > > > - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
> > > > - Skip the ttm_pages_allocated accounting on such objects,
> > > > similar
> > > > to
> > > > how FLAG_SG is already handled.
> > > > - Skip all the page->mapping and page->index related bits, like
> > > > in
> > > > tt_add_mapping, since it looks like these are set and used by
> > > > shmem.
> > > > Not sure what functionally this might break, but looks like
> > > > it's
> > > > maybe
> > > > only driver specific?
> > > > - Skip calling into ttm_bo_swap_out/in and just have
> > > > ttm_populate/unpopulate handle this directly for such objects.
> > > > - Make such objects visible to the i915-gem shrinker.
> > > > 
> > > > Does this approach look acceptable?
> > 
> 


