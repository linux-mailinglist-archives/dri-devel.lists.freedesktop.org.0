Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544E985857
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B9310E7E8;
	Wed, 25 Sep 2024 11:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ltwwJQqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACB110E7E8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:41:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso1013432666b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727264505; x=1727869305; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i9ff9XMFKPX/jx3fqY4EMZVFriUnoClzLhAQaLL8JHM=;
 b=ltwwJQqHugP2gahzAUiqjckzZEs6stQDugk9dr6UYVeWWa+xTLoerdhd+fdz4Wc6wg
 g+LXv3aoD/4lRpdXgCLdlSVYGPLYsHQzLnPOKZimX6WF9ry7qP2tw/xYOSBnomqk6mJw
 HGCEMdYt2kXsNmuTRj+G8PuhTFUpAacWqdHXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727264505; x=1727869305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9ff9XMFKPX/jx3fqY4EMZVFriUnoClzLhAQaLL8JHM=;
 b=pl2weLGbr5NfJfbwzq6nhCzVTb/Hbljqdl0TgQlSEryDn1ZdQ1+W9mgg7oJgHqmMuz
 bTlmLx5cob4RiUDoaNmDGF0dt2KLeYAqV9iP2vTnQXADnW11RSh36pHrPRe4tMGzyk09
 HXhfRZEL3y6HnrSa8GtejLxuLlHZTj2R1N43v9Ozj/oFjbVKbTAvnAL2FMhD31EFbz/B
 CqQzaU135qujvrgzACQpRACdcop6Y26jxy/jeVf7g9pZ5/lhUGF5wQ5jzezM0+f31mU6
 vFN73af3XqHSafySwruecm9ZySE8IKtueQnee/CIqHXl6tzBgDSwiXfyIC67g5gNvSIY
 I0Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBzIakzjqhlPIJgp6BPykNqV238u9DrjPBg/DDMkYmFbZTnswTXJ7jdv3yrWWjtzx5HwW4sNBeh00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL120VbHDZ0nwHFO9+SZbxapuUawrxjUyaF/fJmup0869iZhev
 o5d2gyXyL6knLvqXEqVMJDEpZxqFjdVjJu9oaI3Mp9ypICJpK4HkWq4P9Z0qkHg=
X-Google-Smtp-Source: AGHT+IHT5ASzADjuFW8XhdvLaWUa4CsUc5SXB/Eo7UQTF/pRyM5Bb/nRID44pJj84V7aRzEGmPQSBA==
X-Received: by 2002:a17:907:36cb:b0:a86:7e7f:69ab with SMTP id
 a640c23a62f3a-a93a0384070mr231277466b.15.1727264504403; 
 Wed, 25 Sep 2024 04:41:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a939313463bsm199047366b.196.2024.09.25.04.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:41:43 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:41:41 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 00/28] Introduce GPU SVM and Xe SVM implementation
Message-ID: <ZvP29bOKrJTWDmeC@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <ZvKDUR3mSMEnQYeM@phenom.ffwll.local>
 <ZvMUtdUcsJEDBsbu@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvMUtdUcsJEDBsbu@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Tue, Sep 24, 2024 at 07:36:21PM +0000, Matthew Brost wrote:
> On Tue, Sep 24, 2024 at 11:16:01AM +0200, Simona Vetter wrote:
> > On Tue, Aug 27, 2024 at 07:48:33PM -0700, Matthew Brost wrote:
> > > Continuation of SVM work by Oak Zeng [1][2] based on community feedback.
> > > Introduces GPU SVM layer and new Xe uAPI. Supports GPU page faults for
> > > system allocations (e.g., malloc), runtime allocations (e.g., binding a
> > > BO), migration to and from VRAM, and unified eviction (BO and SVM VRAM
> > > allocations can evict each other). Fully tested; more on this below.
> > > 
> > > The patch breakdown is as follows:
> > > 
> > > 1. Preparation patches already on the list [3].
> > > 	- Patches 1-3.
> > > 	- Please refrain from reviewing these here.	
> > > 2. New migrate layer functionality
> > > 	- Patch 4.
> > > 	- Required for eviction to avoid locking inversion between
> > > 	  dma-resv and mmap lock.
> > > 3. GPU SVM.
> > > 	- Patch 5.
> > > 	- This is what needs community review.
> > > 	- Inspired by GPUVM.
> > > 	- Kernel doc should explain design principles.
> > > 	- There is certainly room for optimization of the implementation
> > > 	  and improvements with existing core MM interaction. Pulling in
> > > 	  pending DMA mapping work [4] and additional core MM support
> > > 	  for SVM is also likely desired. However, this serves as a good
> > > 	  starting point for any SVM discussions and could be used as a
> > > 	  stepping stone to future core MM work.
> > > 3. Basic SVM support in Xe (i.e., SRAM backing only).
> > > 	- Patches 6-15.
> > > 	- The uAPI in the patch could benefit from community input.
> > > 4. SVM VRAM migration support in Xe.
> > > 	- Patches 16-23.
> > > 	- Using TMM BOs for SVM VRAM allocations could use community
> > > 	  input. Patch 23 has a detailed explaination of this design
> > > 	  choice in the commit message.
> > > 5. SVM eviction support in Xe.
> > > 	- Patch 24.
> > > 	- Should work with exhaustive eviction [5] when it merges.
> > > 6. Xe SVM debug / tuning.
> > > 	- Patch 25-28.
> > > 
> > > Kernel documentation and commit messages are relatively light, aside
> > > from GPU SVM and uAPI patches as this is an RFC.
> > > 
> > > Testing has been conducted quite thoroughly with new IGT [6]. Various
> > > system allocation types (malloc, mmap, mmap flags, huge pages, different
> > > sizes, different alignments), mixing runtime allocations, unmapping
> > > corners, invalid faults, and eviction have been tested. Testing scales
> > > from single thread to multiple threads and multiple processes. Tests
> > > pass on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> > > 
> > > 1. Multiple GPU support.
> > > 	- This is likely to follow or occur in parallel to this work.
> > > 2. Userptr unification with GPU SVM.
> > > 	- This is essentially designed in my head (likely involving a
> > > 	  few new GPU SVM layer functions) but would require some fairly
> > > 	  invasive changes to Xe KMD to test out. Therefore, I would
> > > 	  like GPU SVM to be reviewed first before proceeding with these
> > > 	  changes.
> > > 3. Madvise and prefetch IOCTLs
> > > 	- This is likely to follow or occur in parallel to this work.
> > > 
> > > Given the size of the series, I have pushed a GitLab branch for
> > > reference [7].
> > > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/series/128910/
> > > [2] https://patchwork.freedesktop.org/series/132229/
> > > [3] https://patchwork.freedesktop.org/series/137805/
> > > [4] https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
> > > [5] https://patchwork.freedesktop.org/series/133643/
> > > [6] https://patchwork.freedesktop.org/patch/610942/?series=137545&rev=2
> > > [7] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/tree/post?ref_type=heads
> > 
> > Ok rather late, I wanted to type this up 2 weeks ago or so, but alas here
> > it is finally. I think with all the experiments and discussions I have
> 
> Thanks for putting this together and all the initial reviews.
> 
> > fairly clear understanding of the really tricky parts of svm (thanks a lot
> > to Matt for all the work done). From my side the key points, sorted
> > roughly in how important I think they are:
> > 
> 
> I've read this through and pretty much agree with everything here 
> so won't have a detailed response to everything as there isn't much to
> say aside from I agree. A few minor comments below.
> 
> > 1. migrate_to_ram path
> > 
> > I think this is the absolute center piece of making sure we're aligned
> > with core mm and don't suffer from deadlocks or livelocks fundamental to
> > the gpusvm library design. So this part imo needs to be solid for the
> > first version we merge. But of course any core mm changes Matt prototyped
> > shouldn't gate merging the drm side since they're nicely decoupled, we
> > only need those to validate the design in testing.
> > 
> > I think the key points are:
> > 
> > - we rely on the migration pte, temporary page references and page lock
> >   only, which with the core mm changes Matt worked on gives us guaranteed
> >   reliable migration back to system memory. And we need that, or svm
> >   essentially becomes unusable as a concept.
> > 
> > - we need to support partial migration, including the worst case fallback
> >   of only migrating that single page core mm managed to trylock for us
> >   while holding the pagetable lock.
> > 
> >   Since we have guaranteed migration back to system memory we can make the
> >   assumption on the gpu fault handling side that we will only ever handle
> >   ranges that are entirely in vram (by throwing any partial migrations
> >   out). Needs a retry loop for that in the gpu fault side, but I no logner
> >   see an issue with that assumption on the gpu fault side otherwise, so
> >   not needed for merging or even later until we have a driver that
> >   requires partial vram support.
> > 
> 
> I think pretty quickly we will add partial vram support / mixed mappings
> but likely will not be in initial merge.
> 
> > - no other driver locks related to that memory range in any way are
> >   allowed, and ideally we also test with the forced fallback to mmap_read
> >   lock in do_swap_page removed, i.e. calling migrate_to_ram with only
> >   holding the read vma lock. Of course driver locks for blitting are
> >   allowed, it's only locks related to managing physical memory which are
> >   problematic and could result in deadlocks.
> > 
> > - the drm side must uphold the guarantee of not having elevated page
> >   references whithout holding the page lock. Otherwise there's a race and
> >   we cannot guarantee migratione to sram.
> > 
> > - also through the try_to_migrate maze we'll hit our own gpu pte
> >   invalidate paths, so there's some requirements there too. But I've put
> >   the discussion for that at the very bottom, since most of the gpu pte
> >   locking questions are imo not that important, and definitely not
> >   important for the first version we merge.
> > 
> > Everything else below I think we can sort out post merge and just need
> > rough alignment on the design.
> > 
> > 2. eviction
> > 
> > Requirements much like migrate_to_ram, because otherwise we break the
> > migration gurantee:
> > 
> > - Only looking at physical memory datastructures and locks, no looking at
> >   mm/vma structs or relying on those being locked. We rely entirely on
> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> > 
> > - Partial migration needs to work to make sure we can get out of any
> >   low memory bind.
> > 
> > 3. gpu fault side
> > 
> > - We can only rely on mmap_read for hmm_range_fault. And ideally should
> >   assume that's not held anywhere else since with per-vma locking I'd
> >   expect the mm/vma locking will move into hmm_range_fault. This also
> >   means no looking at vma beyond just passing it around as currently
> >   needed by core mm functions.
> > 
> > - Big retry loop to handle all races with the mmu notifier under the gpu
> >   pagetable locks/mmu notifier range lock/whatever we end up calling
> >   those. Races (especially against concurrent eviction/migrate_to_ram)
> >   should _not_ be handled on the fault side by trying to hold locks
> >   instead.
> > 
> > - Long term I think we need to be able to handle concurrent faults, even
> >   on hw where there's only one gpu fault handling queue. For performance
> >   we absolutely want to prefault aggressively, and that likely happens
> >   through cpu ioctls that are entirely independent from the gpu fault
> >   handling.
> > 
> 
> I agree the long term goal is handle concurrent GPU faults and with a
> bit of finer grained locking in Xe I have already made this work. The
> biggest part which needs to be parallel is migration code which is
> taking up roughly 98% of time in the GPU fault handler for a 2M fault
> with a split of 90% in migrate_vma_* function and 8% in the copy job.
> I've seen tests which mirrors multiple EUs from the same process taking
> concurrent GPU faults have large gains in perf. Also the CPU fault
> handler is concurrent so it makes a bit of sense that GPU faults are
> concurrent too.
> 
> GPU faults being concurrent should also enable concurrent prefetches
> from CPU IOCTLs which also is likely desired.
> 
> I'm not going to include this or any of the other optimizations I have
> worked on in what I try to merge initially though as I want to keep this
> as simple as possible and also don't want to throw more code at the list
> until a working baseline is in.
> 
> >   Short term enough (driver-side) locking to make sure this doesn't go
> >   boom is enough, I think just some design goal documentation here on how
> >   to achieve that is all we need.
> > 
> > 4. physical memory to virtual backpointer
> > 
> > No. Doesn't work :-) Also it's only used in in the eviction/migrate_to_ram
> > path and I think Matt already fixed this all anyway.
> > 
> > 5. gpu pagetable locking
> > 
> > Or mmu notifier range locking or whatever you want to call it. Like on the
> > cpu side this should _only_ protect the pagetable entries and additional
> > for us mmu notifier seqno tracking, nothing else.
> > 
> > Any races due to concurrent eviction/migrate_to_ram/gpu fault/prefault
> > need to be handled by retrying outside of holding the pagetable locks. If
> > we try to impose additional consistency guarantees we'll fall over and
> > have a livelock/deadlock fight with core mm in migrate_to_ram. This part
> > is required I think for the first version, but we already need that anyway
> > to make migrate_to_ram work properly.
> > 
> > For the actual data structure/locking design I think anything on the
> > design line between a single global lock and the radix tree over-the-top
> > scalable per-pagetable (spin)lock design of the core mm is fine.
> > 
> 
> I've seen the bind step in servicing GPU faults take barely any amount
> of time so having the GPU page tables protected by the VM's dma-resv
> lock seems fine in Xe. This really is up to each driver how it wants to
> handle this too.

I think if we go to a more fine-grained approach it'd make sense to have
this common, especially if we go with something more radix-tree based.
It's quick tricky to get right in the more extreme cases (*shudders
looking at cpu pgtable walking code), and with mmu notifier seqno handling
there's some additional complexity. And for drivers which don't need that
fine-grained approach it shouldn't hurt.

Also with pagetable lock here I meant the one you're also taking from the
mmu notifier invalidate callback, so unless I'm completely lost that's not
the dma_resv lock of the vm. That is iirc what you call "driver lock" and
I think for initial merging your current approach is entirely fine. It
would also need some changes for concurrent gpu pte (pre-)fault handling,
but that's not what I'm talking about here directly.

> > The design here with 3 levels (mmu notifer, range, struct page) wouldn't
> > be my first choice, but clearly fits on that line so imo is fine for
> > initial merging. We might want to make sure that the range locking (I
> > guess mostly relevant for the invalidate side, drivers don't see much
> > else) is somewhat abstracted so we can easily change that post-merge, but
> > not required imo at all.
> > 
> > For consensus documentation I'd recommend a todo or design documentation
> > patch, where we put down both the current design and why it's like that,
> > and some of the longer term goals. Then get that acked (imo needs at least
> > one other driver that's seriously interested in this, plus I think an ack
> > from Danilo for gpuvm interactions), then merge that. SVM is tricky enough
> > that I think this would be really useful to make sure we're not
> > unecessarily stuck in limbo.
> >
> 
> I'll include a TODO or design documentation in the next rev.
>  
> > From my side again I think the only part we really have to get right from
> > the start is migrate_to_ram. And I'm confident we've got that now really
> > solid.
> > 
> 
> I think most of all 5 points will be addressed in my next rev. Anything
> that isn't falls into an 'optimization we can do later' category which
> the design should be coded in a way these optimizations can easily be
> added.

Just quickly read through your comments and aside from the pagetable
locking one (which I think is just a bit unclarity, not disagrement) I all
agree on all of them.
-Sima

> Matt
> 
> > Oh also you need userspace ofc :-)
> > 
> > Cheers, Sima
> > 
> > > Matthew Brost (28):
> > >   dma-buf: Split out dma fence array create into alloc and arm functions
> > >   drm/xe: Invalidate media_gt TLBs in PT code
> > >   drm/xe: Retry BO allocation
> > >   mm/migrate: Add migrate_device_vma_range
> > >   drm/gpusvm: Add support for GPU Shared Virtual Memory
> > >   drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
> > >   drm/xe: Add SVM init / fini to faulting VMs
> > >   drm/xe: Add dma_addr res cursor
> > >   drm/xe: Add SVM range invalidation
> > >   drm/gpuvm: Add DRM_GPUVA_OP_USER
> > >   drm/xe: Add (re)bind to SVM page fault handler
> > >   drm/xe: Add SVM garbage collector
> > >   drm/xe: Add unbind to SVM garbage collector
> > >   drm/xe: Do not allow system allocator VMA unbind if the GPU has
> > >     bindings
> > >   drm/xe: Enable system allocator uAPI
> > >   drm/xe: Add migrate layer functions for SVM support
> > >   drm/xe: Add SVM device memory mirroring
> > >   drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
> > >   drm/xe: Update PT layer to understand ranges in VRAM
> > >   drm/xe: Add Xe SVM populate_vram_pfn vfunc
> > >   drm/xe: Add Xe SVM vram_release vfunc
> > >   drm/xe: Add BO flags required for SVM
> > >   drm/xe: Add SVM VRAM migration
> > >   drm/xe: Basic SVM BO eviction
> > >   drm/xe: Add SVM debug
> > >   drm/xe: Add modparam for SVM notifier size
> > >   drm/xe: Add modparam for SVM prefault
> > >   drm/gpusvm: Ensure all pages migrated upon eviction
> > > 
> > >  drivers/dma-buf/dma-fence-array.c    |   78 +-
> > >  drivers/gpu/drm/xe/Makefile          |    4 +-
> > >  drivers/gpu/drm/xe/drm_gpusvm.c      | 2213 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/drm_gpusvm.h      |  415 +++++
> > >  drivers/gpu/drm/xe/xe_bo.c           |   54 +-
> > >  drivers/gpu/drm/xe/xe_bo.h           |    2 +
> > >  drivers/gpu/drm/xe/xe_bo_types.h     |    3 +
> > >  drivers/gpu/drm/xe/xe_device_types.h |    8 +
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |   17 +-
> > >  drivers/gpu/drm/xe/xe_migrate.c      |  150 ++
> > >  drivers/gpu/drm/xe/xe_migrate.h      |   10 +
> > >  drivers/gpu/drm/xe/xe_module.c       |    7 +
> > >  drivers/gpu/drm/xe/xe_module.h       |    2 +
> > >  drivers/gpu/drm/xe/xe_pt.c           |  456 +++++-
> > >  drivers/gpu/drm/xe/xe_pt.h           |    3 +
> > >  drivers/gpu/drm/xe/xe_pt_types.h     |    2 +
> > >  drivers/gpu/drm/xe/xe_res_cursor.h   |   50 +-
> > >  drivers/gpu/drm/xe/xe_svm.c          |  775 +++++++++
> > >  drivers/gpu/drm/xe/xe_svm.h          |   70 +
> > >  drivers/gpu/drm/xe/xe_tile.c         |    5 +
> > >  drivers/gpu/drm/xe/xe_vm.c           |  286 +++-
> > >  drivers/gpu/drm/xe/xe_vm.h           |   15 +-
> > >  drivers/gpu/drm/xe/xe_vm_types.h     |   44 +
> > >  include/drm/drm_gpuvm.h              |    5 +
> > >  include/linux/dma-fence-array.h      |    6 +
> > >  include/linux/migrate.h              |    3 +
> > >  include/uapi/drm/xe_drm.h            |   19 +-
> > >  mm/migrate_device.c                  |   53 +
> > >  28 files changed, 4615 insertions(+), 140 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> > >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
