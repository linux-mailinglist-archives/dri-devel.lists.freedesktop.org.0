Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D9406825
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133AA6E984;
	Fri, 10 Sep 2021 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B436E984
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:08:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201216909"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="201216909"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 01:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="549174291"
Received: from gjanssen-mobl5.ger.corp.intel.com (HELO [10.249.254.69])
 ([10.249.254.69])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 01:08:18 -0700
Message-ID: <ffab32dacece7fe3bb155f1ce2873d9e603f9f09.camel@linux.intel.com>
Subject: Re: i915 ttm_tt shmem backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
Date: Fri, 10 Sep 2021 10:08:16 +0200
In-Reply-To: <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
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

Perhaps some background and goal is worth mentioning here.


On Thu, 2021-09-09 at 17:56 +0100, Matthew Auld wrote:
> On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
> <Christian.Koenig@amd.com> wrote:
> > 
> > Hi Matthew,
> > 
> > this doesn't work, I've already tried something similar.
> > 
> > TTM uses the reverse lookup functionality when migrating BOs
> > between system and device memory. And that doesn't seem to work
> > with pages from a shmem file.
> 
> Hmm, what do you mean by reverse lookup functionality? Could you
> please point out where that is in the TTM code?

I think this is in unmap_mapping_range() where, if we use VM_MIXEDMAP,
there is a reverse lookup on the PTEs that point to real pages. Now
that we move over to VM_PFNMAP, that problem should go away since core
vm never has a page to investigate. Probably this is why things works
on non-TTM i915 GEM.

@Christian: Some background here:
First I think that there might be things like the above that will pose
problems, and we may or may not be able to overcome those but more
importantly is that we agree with you that *if* we make it work, it is
something that you as a maintainer of TTM can accept from a design- and
maintainabiltiy point of view.

The approach would be similar to the buddy allocator, we adapt some
driver code to TTM in a way that it may be reused with other drivers,
and if other drivers are interested, we'd assist in moving to core TTM.
In essence it'd be a TTM shmem page pool with full shrinking ability
for cached pages only.

What we're really after here is the ability to shrink that doesn't
regress much w r t the elaborate shrinker that's in i915 today that is
power management aware and is also able to start shmem writebacks to
avoid shmem just caching the pages instead of giving them back to the
system (IIRC it was partly the lack of this that blocked earlier TTM
shrinking efforts).

And since it doesn't really matter whether the shrinker sits in core
TTM or in a driver, I think a future goal might be a set of TTM
shrinker helpers that makes sure we shrink the right TTM object, and
perhaps a simple implementation that is typically used by simple
drivers and other drivers can build on that for a more elaborate power-
management aware shrinker.

/Thomas



> 
> > 
> > Regards,
> > Christian.
> > 
> > ________________________________
> > Von: Matthew Auld <matthew.william.auld@gmail.com>
> > Gesendet: Donnerstag, 9. September 2021 16:56
> > An: Christian König <ckoenig.leichtzumerken@gmail.com>; Koenig,
> > Christian <Christian.Koenig@amd.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; ML dri-
> > devel <dri-devel@lists.freedesktop.org>
> > Betreff: i915 ttm_tt shmem backend
> > 
> > Hi Christian,
> > 
> > We are looking into using shmem as a ttm_tt backend in i915 for
> > cached
> > system memory objects. We would also like to make such objects
> > visible
> > to the i915-gem shrinker, so that they may be swapped out or
> > discarded
> > when under memory pressure.
> > 
> > One idea for handling this is roughly something like:
> > - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
> > - Skip the ttm_pages_allocated accounting on such objects, similar
> > to
> > how FLAG_SG is already handled.
> > - Skip all the page->mapping and page->index related bits, like in
> > tt_add_mapping, since it looks like these are set and used by
> > shmem.
> > Not sure what functionally this might break, but looks like it's
> > maybe
> > only driver specific?
> > - Skip calling into ttm_bo_swap_out/in and just have
> > ttm_populate/unpopulate handle this directly for such objects.
> > - Make such objects visible to the i915-gem shrinker.
> > 
> > Does this approach look acceptable?


