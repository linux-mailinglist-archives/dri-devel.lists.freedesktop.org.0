Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6A9686B7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0495C10E2BA;
	Mon,  2 Sep 2024 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NwhKjj4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1394810E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:53:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so34371405e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725277997; x=1725882797; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L1YmdHPMtFc5UeZxJDx+XreTZWObEMh3B4d924jL/dU=;
 b=NwhKjj4kV4RNXsniqlQKkjeX854iXMtBgVue5aFrpmD5jSU96yzTF/GGsrFdxLWnme
 nlvc+I/Dkym3mW+HHS3hgebVXsrT5kHXXj1Nf5fdvBKD0AoK63gUu1jbHeVQAQoncRQM
 2h0YYCJlOwY3FCI7J7Fy2j14/VBMNwExdiWd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725277997; x=1725882797;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1YmdHPMtFc5UeZxJDx+XreTZWObEMh3B4d924jL/dU=;
 b=FMERrvQhy2wY8yaYyJwUp0n2CVPEpY92OkWThFi2B2H4BqChGW+HcOhZXaVeuhX+Gm
 xKTjWF2gO3toBsZIE+UPVyi19nLgsLGdakHqWRY+/QB4wdEczvbyMrOoIRyHGi/4aIzJ
 33hAvQZ9Y7u5JtaeojgKuSuKv5SbiFnWTaPYoSItXXc79iUsrzeeq7EZnFt7u7KSL1yv
 unGSQKz97oyh2fZaLlQ80mfclb+msZQrQEbc3njkJztHLfGS26DrPNUAUZTiMfbgaZGT
 rZ3ADvLEaKKeOPikUhNunyd04tTUhiG3k4eAkr9ciI9M7gpIlseZ01/Nu5vZLXm8vhI8
 IUQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3BM3XqQWf5SbloahSu0uvorYwKJlBErllwGD71K40OfQH6aasmucmpOw+OSolZp5yTENtWwhSGa4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8KOweZvRmKWHoP/1qFYkF+QDMO/XtGoWHTYPscN/fPrS/jE3q
 SZUmJpC3Jbs/4wSc6q6+oRQueKl7MV+XdYgDAuZn5FaUjrUlCMaw3p48pLw1e6k=
X-Google-Smtp-Source: AGHT+IFw75WrKLC44g/Lo76Hz8UbFbozyFBdmd97W7hVrzCVaYzCAzGDk1/+AvdjF0IRXXdndP0s5A==
X-Received: by 2002:a5d:6345:0:b0:374:b9d7:5120 with SMTP id
 ffacd0b85a97d-374bf05765bmr4491791f8f.23.1725277997186; 
 Mon, 02 Sep 2024 04:53:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bba57bb20sm112971905e9.4.2024.09.02.04.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:53:16 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:53:14 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtWnKvaV964EA6mq@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <ZtBDJCfWxaEOqILc@phenom.ffwll.local>
 <ZtCvcVu3SZsManOw@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtCvcVu3SZsManOw@DUT025-TGLU.fm.intel.com>
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

On Thu, Aug 29, 2024 at 05:27:13PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 11:45:08AM +0200, Daniel Vetter wrote:
> > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> > > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > > sharing of memory between the CPU and GPU, enhancing performance and
> > > flexibility in GPU computing tasks.
> > > 
> > > The patch adds the necessary infrastructure for SVM, including data
> > > structures and functions for managing SVM ranges and notifiers. It also
> > > provides mechanisms for allocating, deallocating, and migrating memory
> > > regions between system RAM and GPU VRAM.
> > > 
> > > This mid-layer is largely inspired by GPUVM.
> > > 
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Still not sure I've got the right race that you paper over with
> > mmap_write_lock, but I spotted a few things, commments inline.
> > 
> 
> I've replied to this issue several times, let's table the
> mmap_write_lock issue in this reply - a lot of other things to get
> through. Current thinking is try to add a range->migrate_lock like AMD
> which I state here [1]. Let's continue discussing the mmap lock issue
> there if possible.

Yeah I wrote replies as I read code, so there's a bit a mess from my side
here. Apologies for that.

> [1] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169

Some more replies below that I think we haven't covered anywhere else yet.

> > > + * 2) Garbage Collector.
> > > + *
> > > + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> > > + *					struct drm_gpusvm_range *range)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx = {};
> > > + *
> > > + *		assert_driver_svm_locked(gpusvm);
> > > + *
> > > + *		// Partial unmap, migrate any remaining VRAM pages back to SRAM
> > > + *		if (range->flags.partial_unmap)
> > > + *			drm_gpusvm_migrate_to_sram(gpusvm, range, &ctx);
> > 
> > Note that the migration back to sram isn't guaranteed to succeed, so you
> > might be still stuck with partially migrated range. This might be a case
> > where hmm gives you vram pfns, but the range you have doesn't have any
> > vram allocation anymore because you droppped it here. Not sure tbh.
> >
> 
> Hmm isn't the picture here nor will a VMA once the
> drm_gpusvm_evict_to_sram path is always taken as discussed here [2]. I
> might have a corner case BO refcounting / TTM resource lookup bug in
> somewhere in here which needs to be resolved though (e.g. eviction
> racing with this code path), will try to close on that.
> 
> [2] https://patchwork.freedesktop.org/patch/610955/?series=137870&rev=1#comment_1111164

So maybe my understanding is wrong, but from my reading of the device
migration code the exact same non-guarantees as for the sram2sram
migration code apply:

- There's no guarantee the page/folio doesn't have an elevated refcount,
  which makes the migration fail (in try_to_migrate, where it checks for
  surplus refcounts).

- There's no guarantee you'll get the page/folio lock, which makes the
  migration fail. Worse the core mm seems to use a fallback to per-page
  locking as it's extremely crude "get out of deadlocks due to acquiring
  multiple page locks" card.

> > > +map_pages:
> > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > +
> > > +		for (i = 0; i < npages; ++i) {
> > > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > > +
> > > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > +				err = -EOPNOTSUPP;
> > > +				goto err_free;
> > > +			}
> > > +		}
> > 
> > You can't do the above, because the pfn you get from hmm come with zero
> > guarantees, you neither hold a page reference nor the page lock. The only
> > thing you can do is grab the pagetable lock (or mmu notifier locks) and
> > check it's still valid, before you can touch any state. I think the
> > range->vram_allocation is probably always valid since you clean that up
> > under the same lock/thread, but there's good chances the vram allocation
> > is otherwise already gone for good. Or you get an inconsistent snapshot.
> > 
> 
> I haven't seen this pop in my testing yet which is fairly thorough. My
> thinking was migration always being enforced at range grainularity we'd
> never get mixed mappings from the core as migration is completely under
> control of the driver. Maybe I'm not understanding what you are saying
> here...

So one scenario is that you race (without the mmap write lock or the
migration_mutex design ofc) with another invalidate, and get a partial
view here of mixed vram and sram pages. Until you acquire the mmu notifier
lock and have made sure your pages are still valid, there's essentially no
guarantee.
> 
> > > +
> > > +		/* Do not race with notifier unmapping pages */
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +		range->flags.has_vram_pages = true;
> > > +		range->pages = pages;
> > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > +			err = -EAGAIN;
> > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > +		}
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +	} else {
> > > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > > +
> > > +		for_each_dma_page(i, j, npages, order) {
> > > +			if (WARN_ON_ONCE(i && order !=
> > > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > > +				err = -EOPNOTSUPP;
> > > +				npages = i;
> > > +				goto err_unmap;
> > > +			}
> > > +			order = hmm_pfn_to_map_order(pfns[i]);
> > > +
> > > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > +				err = -EOPNOTSUPP;
> > > +				npages = i;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			set_page_dirty_lock(pages[j]);
> > > +			mark_page_accessed(pages[j]);
> > 
> > You can't do these, because you don't hold a page reference. They're also
> > not needed because hmm_range_fault goes thorugh the full mkwrite dance,
> > which takes care of these, unlike the gup family of functions.
> >
> 
> This is a left over from our existing userpte code and it does appear to
> be incorrect. Let me remove this and fixup our userptr code while I'm at
> it.

Ack.

> > > +	vas = vma_lookup(mm, start);
> > > +	if (!vas) {
> > > +		err = -ENOENT;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > +		err = -EINVAL;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (!vma_is_anonymous(vas)) {
> > > +		err = -EBUSY;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > +		       sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err = -ENOMEM;
> > > +		goto err_mmunlock;
> > > +	}
> > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > +
> > > +	zdd = drm_gpusvm_zdd_alloc(range);
> > > +	if (!zdd) {
> > > +		err = -ENOMEM;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	migrate.vma = vas;
> > > +	migrate.src = buf;
> > > +	migrate.dst = migrate.src + npages;
> > > +
> > > +	err = migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	/*
> > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > > +	 * always an error. Need to revisit possible cases and how to handle. We
> > > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> 
> This is a bit stale, can update this comment.
> 
> > > +	 */
> > 
> > Yeah I think especially under contention partial migrations, at least back
> > to sram due to cpu faults, are pretty much expected. And you need to cope
> > somehow.
> > 
> 
> I have seen these pop if the IGT calls mlock on the memory. My thinking
> is migration to VRAM is basically optional and fallback to leaving range
> in SRAM if an error occurs rather than doing a partial migration. This
> is what currently happens so it is coped with.
> 
> If the memory is marked as must be in VRAM (NIY), well then the user
> program has done something wrong and can kill the app (akin to
> segfault).

Yeah SIGBUS for "must be in VRAM" sounds like ok semantics.

> > > +
> > > +	if (!migrate.cpages) {
> > > +		err = -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	if (migrate.cpages != npages) {
> > > +		err = -EBUSY;
> > > +		goto err_finalize;
> > > +	}

What I think is more fundamental is that I think this one here doesn't
work. For migrate_to_ram you cannot assume that you can always migrate the
entire block, I think to uphold the core mm forward progress rules we need
to allow partial migrations there. And I think your current code allows
that.

But that then means you also are stuck with partial migration state here.
That was the point I tried to make.

> > > +/**
> > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @vas: Pointer to the VM area structure
> > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > + * @start: Start address of the migration range
> > > + * @end: End address of the migration range
> > > + *
> > > + * This internal function performs the migration of the specified GPU SVM range
> > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > > + * invokes the driver-specific operations for migration to SRAM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > +					struct vm_area_struct *vas,
> > > +					struct page *page,
> > > +					u64 start, u64 end)
> > > +{
> > > +	struct migrate_vma migrate = {
> > > +		.vma		= vas,
> > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > +		.fault_page	= page,
> > > +	};
> > > +	unsigned long npages;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int i, err = 0;
> > > +
> > > +	mmap_assert_locked(gpusvm->mm);
> > 
> > That's the wrong mm, at least for the ->migrate_to_ram path. You might be
> > called on a anon mapping from a child process. That also means that the
> > vma you're looking at might have no relationship with anythign you're
> > tracking in your gpusvm.
> >
> 
> Hmm, as discussed [3] I haven't added tests with child processes yet.
> Let me do that and update the design as needed. This likely isn't
> correct as you say.
> 
> [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169 

Ack. More tests should definitely help here to figure out what's up, and
what's just me being confused.

> > > +/**
> > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > > + * @vmf: Pointer to the fault information structure
> > > + *
> > > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > > + * the internal migration function to migrate the range back to RAM.
> > > + *
> > > + * Returns:
> > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > + */
> > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > > +	int err;
> > > +
> > > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > 
> > So I think zdd->range doesn't work, because even within a single mm the
> > vma mapping a given piece of anon memory does not need to be unique, you
> > can duplicate them with mremap.
> > 
> 
> This is attached to a page, not a VMA. Both AMD and Nvidia drivers use a
> similar lookup mechanism.

Yeah the page->zone_device_data is fine. It's the zone_device_rage->range
which I think isn't ok.

> > So all you have here is the physical memory and the vma, which might or
> > might not be from the same process as gpusvm->mm.
> > 
> > Also the child process scenario means you using mmap_write on the fault
> > side doesn't stop all cpu faults migrating stuff back.
> > 
> > Somewhat aside, but I think that means amdkfd's svm_range->migration_mutex
> > is busted, because it's va based and so misses concurrently ongoing
> > different mappings moving physical storage around underneath.
> >
> 
> I think all of the above which falls into the fork() + child process
> issues which you have raise. Until I test this out I can't speak to this
> any level of confidence so I won't. Thanks for raising this issue and
> let me write test cases as discussed and educate myself. Once I do that,
> we can engage in further discussions.

I think fork + childs will still result in zdd->range being unique (albeit
confused about which mm). You need mremap of some of these mappings to
change the addresses and really cause confusion, which I /think/ (but
didn't test) is doable with a single process even and duplicating anon
memory mappings with mremap.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
