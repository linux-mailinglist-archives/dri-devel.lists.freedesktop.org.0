Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B279596884B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B039010E2E8;
	Mon,  2 Sep 2024 13:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YzjwDpzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E1010E2E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:02:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42bbe809b06so23649265e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725282156; x=1725886956; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/hTlVpluWZVbPVSyBVOmertxka/Mx4Twr8Kv26ww/Mo=;
 b=YzjwDpzn7ClY5WHWOLag+ek6wOTTOacBIgdCTAR2P2420yXLR3asoSDKgFVnycD+xA
 3uhE+W5bors4Ml4EvvvmkjPNp+qfery63NZeryZ7TX8tkXapXQAkWCU6Y126nZFqNe76
 YTq2hnw7NySLUGH/eNeEjoNw9VA6AaLW7c33U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725282156; x=1725886956;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/hTlVpluWZVbPVSyBVOmertxka/Mx4Twr8Kv26ww/Mo=;
 b=Ny/0zqes207rLc2Z1rzR+0B/p1i0L/Fb/GiaiuhglYGYev5mDC6DWUKTw+549HJEnU
 MjM6erB8MNFrTZHskaL2KjsCK4/OmFW2pAvHoPBLAilHQgKi2EaMdzoPylU0eyS/t6wE
 C0gVG7eYEOkfkeTwXracDVNG+3PDmJorvPjrwxO3n1IHQWnRRvcX8MMwq9SxNlHhnaGu
 6ozrFLpPGxk0rUqLxftCl+4FbLBn/GFiA1fr72mIDsZ4/ISE0JF5T8erz9K54NniZ0Ww
 N+xsX4s0NnNia6Yzg1HwEzoChUxJn3Ev2FFBAleQlqZpBE/3C9gHP6L4PSzfCN46UqGG
 gecQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYh98P0+/uk/oepzmuVEAWTfZ3nx7rXkLu384QTaQJOIlE5M6yfg6veDw3+u1f2g269gOV22cPTmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1dsOiy2JpDKN8e0ufhM+tEECOa74syG5s52YcziHGyGpEDa5Q
 OVRp1w3eiCy21v98iCEDx2sUs+NCqmHoKdpcMgUQwWb0egwtZWsacgCqWsGtiys=
X-Google-Smtp-Source: AGHT+IHvOaNa1Ku49X21TyNlKIlF0Tegjp8HVvGdTc2rRH6JMbmyTLPm3HNg35NBojjDTSASiHJPrw==
X-Received: by 2002:a05:600c:4694:b0:42b:a2fd:3e25 with SMTP id
 5b1f17b1804b1-42bb27bdc3dmr95961775e9.37.1725282156147; 
 Mon, 02 Sep 2024 06:02:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba641db07sm170513455e9.34.2024.09.02.06.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:02:35 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:02:33 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtW3aaUCqxeLdV2I@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <ZtDsmzQ9qC7icNtm@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtDsmzQ9qC7icNtm@DUT025-TGLU.fm.intel.com>
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

On Thu, Aug 29, 2024 at 09:48:11PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 11:24:26AM +0200, Christian König wrote:
> >    Am 28.08.24 um 18:06 schrieb Daniel Vetter:
> > 
> 
> A lot to unpack here. Will try to address as much as I can in this
> single reply to both of you (Daniel, Christian).
> 
> > On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
> > 
> > Migration is implemented with range granularity, with VRAM backing being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >   advantage over a BO.
> > 
> > This one I'm not understanding.
> >
> >    Adding Arun as well. I couldn't understand it fully either, but maybe
> >    it's because the buddy allocator is more optimized for higher orders of
> >    allocations?
> > 
> 
> As currently written BO VRAM allocation resolves to a DRM buddy
> allocation. Unless there is memory pressure this is likely 1 buddy block
> if the allocation is aligned (SVM should basically also be doing aligned
> allocations which the common case of 2M at a time).
> 
> It was suggested in earlier revs by a colleague of mine allocating
> directly from DRM buddy pool provided a benefit wrt to freeing a page at
> a time. It doesn't given even if you bypass a BO most likely you are
> going to get 1 buddy block which is larger than a page. In either case
> you need to ref count the allocation or do some wild spliting algorithm
> (I don't want to that). Or alternatively write a new buddy allocator
> which easily code with freeing a page at a time (I don't want to that).
> 
> Lastly, the common case for getting dev_pagemap_ops.page_free is going
> to be consecutive calls spanning the entire allocation (e.g. eviction or
> CPU fault which triggers migration).
> 
> > 
> > 
> > - DRM buddy allocations do not solve locking inversion problems between
> >   mmap lock and dma-resv locks.
> > 
> > Which mmap -> dma_resv inversion? I've seen a lot ... I guess it also
> > matters hugely which migration path we're in, i.e. opportunistic
> > migration, cpu fault where we have to migrate or die, or when we run out
> > of vram and need to evict stuff to make space.
> > 
> >    Mhm I think the locking order between mmap lock and dma-resv lock is
> >    well defined since dma_resv_lockdep() was added.
> >
> 
> Yes. Also solved the inversion issue by using migrate_device_*. At one
> point had trylocking of mmap lock (still kinda there) but have agreed
> based on Daniel's feedback to rip the out.
>  
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> >   evict each other).
> > 
> > So core mm handles this by just roughly equally shrinking everything.
> > Seems to work, and it has a pile of object shrinkers, and the page lru is
> > also split into page cache and anon memory.
> > 
> > I think you need to put in more justification that unified eviction is
> > required than just stating it, because a look at mm/ gives a very well
> > established counterexample.
> > 
> > 
> > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> >   require a dma-resv.
> > 
> > So from the TTM side we need exhaustive eviction, or at least something a
> > bit more exhaustive than what ttm currently has. Note that i915-gem also
> > never really got to perfect exhaustive eviction, it's just a pile better
> > than ttm right now.
> > 
> >    Please define what exhaustive eviction should mean? I think I know what
> >    it is and I have been pushing TTM into the direction of solving this
> >    for years.
> >    The last missing puzzle piece is to use drm_exec for TTM evictions, but
> >    apart from that everything should work now.
> >    Regards,
> >    Christian.
> 
> I think Thomas has defined this in his replies. He also touches on our
> SVM design allows mixing user BO mappings and SVM mappings within the
> same VM. These need to be able to fairly evict each other. A dma-resv
> lock provides a level of fairness and ensure forward progress once a
> flavor of his series lands.
> 
> Also worth nothing in addition to user BOs, we have kernel BOs (for page
> table, user exec queues, etc...) in Xe which absolutely need to be able
> to evict something or the application dies.
> 
> > 
> > Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
> 
> Page LRU isn't used for device pages from my understanding.

Yeah, we'd need to manage that ourselves. We could use exactly what the
core mm is doing, I haven't found anything that prohibits that. I think
core mm simply doesn't maintain zone device lru because it's not involved
in any device side access.

> > eviction is going to win because the shrinkers can only trylock dma_resv.
> > So this part works. It actually works so well on the system memory side
> > that if we're not careful we can trigger oom, because we're too good at
> > getting at all the memory.
> > 
> > SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
> > don't see why, because the idea is that thanks to gpu and cpu page faults,
> > you can always get out of a pinch by just trashing everything for a while
> > and migrating the handfull of available pages a lot.
> > 
> > 
> > - Likely allocation size is 2M which makes of size of BO (872)
> >   acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> > 
> > Except it requires that you hold dma_resv, which brings in all kinds of
> > pain. And for eviction we really don't need a lot of synchronization, so a
> 
> Yes, but I think I have solved all those issues wrt to dma-resv.
> 
> What is really the alternative here? Teaching TTM to evict non-BO SVM
> allocations? Writing an SVM VRAM allocator which ends up looking also
> exactly like TTM and teaching it to evict TTM BOs? The later case we'd
> still need to grab dma-lock...

Yup.

> Do we write a new page based buddy allocator and wire that to TTM if SVM
> could possibly be used?

Well rebase it on top of a page array, like the buddy allocator in core mm
would be my first idea.

> This would be tons of code and not really sure what ROI is here.
> 
> > lot of that locking is not needed, unlike the case where we have a cpu
> > fault, where we absolutely need mmap_lock and all that to make sure we
> > fault in the right page.
> > 
> > But for eviction we only need to throw out some pages, if we're not
> > entirely precise with picking the right ones (or have no idea into which
> > vma they're all currently mapped into) it doesn't matter. That's why
> > migrate_device_pages doesn't care about any of that at all, it doesn't
> > need to by design. But by bo backing memory you drag in all that stuff
> > that's causing headacheds for eviction.
> > 
> > The only thing migration tries to do is remove all pte, and if that
> > succeeds, move the page. Specialized for the gpusvm case, looking at mm/
> > code as cheat sheet, we need roughly:
> > 
> > - reverse mapping structure like anon_vma. Except gpusvm can assume that
> >   there's currently only one gpu side mapping, so we can just stuff the
> >   gpusvm an va_address into the page, and protect it with the page lock.
> > 
> > - we need pagetable locks, so that we can manipulate pagetables (well
> >   specifically make ptes invalid) without taking any other locks.
> > 
> > - everyone else inserting or removing ptes for svm mappings also needs to
> >   lock the page, or we have races. This might be the hmm_range_fault races
> >   you're seeing when allowing vram pages, since I don't think there's
> >   anything else stopping the page lookup otherwise from succeeding.
> 
> AMD looks take the range->migration_mutex to prevent races.
> 
> > 
> > - we might also need to stuff migrate ptes into the gpu side, like the cpu
> >   does, to hold up refaults before the migration has finished. But I think
> >   those are only needed for anon memory in sram because there's no other
> >   way to find the right page than swap pte entries, of which migration
> >   entries are a special case.
> > 
> > - core code also expects us to handle the page refcount correctly for svm
> >   device memory, so we can't free the pages like normal bo pages either
> >   directly to drm_buddy.
> > 
> > Now typing this all up will look an awful lot like what you have, with the
> > dma_resv lock serving as the page lock and the pagetable lock. The only
> 
> dma_resv is indeed one of locks we need for page table updates (binds)
> as we allocate TTM BOs for page tables and we install fences for binds
> in dma-resv slots (certainly for non-SVM, might be able to drop that for
> SVM).

So the way this is solved on the core mm side is with two tricks:

- Page faults race entirely, and races are only resolved at pte insertion
  time when you acquire the pagetable lock. If there's anything else than
  a page-not-present pte, you've raced and bail out.

- Pagetables are allocated upfront, with the same trick: If someone else
  was faster, you bail out. Pagetables are never reclaimed for core mm
  code, so that avoids someone else nuking it meanwhile. At least while
  the vma mapping stays valid.

  I'm not sure we can entirely emulate that design with gpusvm.

And yeah there would be a substantial difference in code between the bo
and the svm world.

> > reason is that these locks are much smaller and nest within all the other
> > stuff going on and so avoid the inversion issues.
> > 
> > So one annoying part is that this is a lot of pointlessly looking typing.
> > The other is that it's full of races, because core mm really is yolo all
> > the way down. So lots of ways you lock the wrong page and fun stuff like
> > that, but the few cases that matter work:
> > 
> > - svm fault handling with hmm_range fault retries with mmu notifiers. Note
> >   that we need to have vram pages locked and the notifier retrie needs to
> >   be under the pagetable lock, or there's room to escape. At least that's
> >   what I came up with last time I thought it all through.

Correction: at fault time core mm does not lock pages. Just elevated
refcount is enough.

> We grab the gpusvm->notifier lock just be committing the bind and check
> for retry. If we need to retry we completely unwind all locks and
> restart the GPU fault.

Yeah core mm does the same.
  
> > - migrate_to_ram: it will hold a page reference which we know was the
> >   valid vram page when the cpu pte was locked, but it might not be it
> >   anymore. So we have to lock the page and check whether it's still gpu
> >   mapped, and if not retry the entire fault since most likey another
> >   migrate_to_ram has succeed meanwhile in parallel.
> > 
> > - for eviction we don't care, we might actually be migrating a page no one
> >   even wants anymore.
> > 
> > Now I think you can get all this done with the dma_resv lock and maybe the
> > bo refcount. But it does involve a tremendous amount of headaches and
> 
> I don't the headaches are too bad...
> 
> > impendence mismatch, because that's not how page faults and migrations
> > work in core mm.
> 
> Agree there is a bit of impendence mismatch but see above I can't really
> think of a better solution without thousands of lines of new code and
> invavise changes across the subsystem.
> 
> What I have in place appears to work with very little code changes to Xe
> and none to TTM. AMD also landed on a BO likely for similar reasons I
> have laid out.

My understanding of the history is that large chunks of the gpusvm
features where retrofitted, without updating the design. So I'm not
putting that much weight on amdkfd as a good solution, it's just the
obvious incremental solution.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
