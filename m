Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7EE78D6A9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EB010E173;
	Wed, 30 Aug 2023 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A410E173
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:53:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CB7A6607236;
 Wed, 30 Aug 2023 15:53:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693407210;
 bh=+CXRkfhbyS9bgX+ZquBfGcBhKXsBPsdwdwrHJ2PxEog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lQdx5YUmnAsnb4fd6OjSgm/DXKxY4qyfZRR0NRswZw/0V18luMx9pM6AbGOy8QMsE
 7MZbAnjb1ddZe4uwWham9N7USP3sG0zd3L9e575viEiqFNVx+QcCO+MGHhl8r/g4kO
 NyFrgNgArI1JQqI6KUHjDN70AwIUM0yKrwTA17S3veiz1IX2k0snQFhFhmuir4Lp1p
 /otXWm5RW4jo0H8pW1gSEHy+AqLwHog/THepuXUq6nYrbX0rsIsT9WnJJpVjsglv/F
 SheasufzPQ4OBhv4twVpWOCJaFlU+F78tT3EZxXHSwSzNRy4XHNpgJN3KPpXTsqMc+
 BX/FVxg73mSsg==
Date: Wed, 30 Aug 2023 16:53:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 08/15] drm/panthor: Add the MMU/VM logical block
Message-ID: <20230830165326.02f20ea0@collabora.com>
In-Reply-To: <c539fda5-93b2-167f-e2fd-b0487898ee9d@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-9-boris.brezillon@collabora.com>
 <aa0d660b-861e-c330-840b-5603fd4b4a38@arm.com>
 <20230829173317.523177f8@collabora.com>
 <c539fda5-93b2-167f-e2fd-b0487898ee9d@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023 15:12:43 +0100
Steven Price <steven.price@arm.com> wrote:

> On 29/08/2023 16:33, Boris Brezillon wrote:
> > On Mon, 14 Aug 2023 16:53:09 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >>> +
> >>> +/**
> >>> + * struct panthor_vm_op_ctx - VM operation context
> >>> + *
> >>> + * With VM operations potentially taking place in a dma-signaling path, we
> >>> + * need to make sure everything that might require resource allocation is
> >>> + * pre-allocated upfront. This is what this operation context is far.
> >>> + *
> >>> + * We also collect resources that have been freed, so we can release them
> >>> + * asynchronously, and let the VM_BIND scheduler process the next VM_BIND
> >>> + * request.
> >>> + */
> >>> +struct panthor_vm_op_ctx {
> >>> +	/** @rsvd_page_tables: Pages reserved for the MMU page table update. */
> >>> +	struct {
> >>> +		/** @count: Number of pages reserved. */
> >>> +		u32 count;
> >>> +
> >>> +		/** @ptr: Point to the first unused page in the @pages table. */
> >>> +		u32 ptr;
> >>> +
> >>> +		/**
> >>> +		 * @page: Array of pages that can be used for an MMU page table update.
> >>> +		 *
> >>> +		 * After an VM operation, there might be free pages left in this array.
> >>> +		 * They should be returned to the pt_cache as part of the op_ctx cleanup.
> >>> +		 */
> >>> +		void **pages;
> >>> +	} rsvd_page_tables;    
> >>
> >> Two questions:
> >>
> >> 1) Would a mempool simplify the implementation? It looks like a
> >> reasonable match.  
> > 
> > Not sure what you mean by mempool,  
> 
> See include/linux/mempool.h

Oh, okay.

> 
> > but I'm using a kmem_cache here for
> > all page table allocations. The pages that are passed to
> > panthor_vm_op_ctx::rsvd_page_tables::pages are allocated from this
> > pool. It's just that for each VM operation we pre-allocate page-tables,
> > and release those that were not used when the operation is done (we
> > over-allocate for the worst case scenario).  
> 
> The mempool could, potentially, replace the rsvd_page_tables structure.
> The kmem_cache you would still want as that's per-driver.

Need to have a closer look at the API to make my mind, but at first
glance it seems to be overkill for what I initially had in mind.

> 
> >>
> >> 2) Does it really make sense to have a separate pool of memory for every
> >> operation? Instead of having a separate pool for each operation, it
> >> would be possible to just keep track of the total number needed for all
> >> outstanding operations. Then a single (per device or maybe per-VM if
> >> necessary) mempool could be resized to ensure it has the right amount of
> >> space.  
> > 
> > The pool is per-driver (see the global pt_cache). rsvd_page_tables just
> > holds pages needed for a specific VM operation. To be more specific, it
> > holds pages for the worst case (page table tree is empty, except for the
> > root page table).  
> 
> What I'm wondering is to we need to keep the pages for each operation in
> separate pools.

I was not really considering it a pool, more a set of pages that will
be used by the VM operation, some of them being returned to the
kmem_cache pool if we end up using less (over-provisioning). If we have
a mempool, say, at the VM level, that means we have 2 levels of caching:
the kmem_cache itself, and the mempool attached to the VM. Is there any
benefit here? Do we expect kmem_cache to be too slow for fast/already
allocated pages?

I do see how over-provisioning can cause us to allocate a lot of pages
that end up being unused, but I fail to see how VM/device level caching
would solve that, because we still have to dequeue some operations to
return pages to the intermediate pool, at which point, we've already
lost, because already queued operations reserved the amount of pages
they thought they needed for the worst case scenario.
Operations being queued after that can pick from the returned pages of
course, but that's already the case right now, because we return pages
to the kmem_cache as soon as we're done executing a VM operation.

The only thing that might help is limiting the number of in-flight
VM_BIND jobs per VM (or globally), and then have the submit path return
EBUSY or EGAIN so the userspace driver knows it has to retry at a later
time.

> So instead of having a rsvd_page_tables for each
> operation, can we have one global one which is sized appropriately for
> all operations that are in flight for the device? The operations are
> serialized so there's no contention. Or at least a per-VM pool if we can
> operate on multiple VMs at once.

We can operate on multiple VMs at once (VM is basically your VkDevice,
AKA the logical device), but I'm not too worried about the
synchronization that would be incurred by the caching at the
panthor_device level. I'm just curious to know what value it would add.
I'm also worried that it makes the reservation logic more complex:
we need to track what's still reserved and how many pages can be
re-used because they were never reclaimed by the VM operation that had
reserved it. Also didn't check how mempool plays with memory reclaim,
but if the memory in a mempool is not reclaimable, that might be
another problem.

To sum-up, I'd really like to refrain adding an intermediate cache
until the per-driver kmem cache is proven to be too slow.

> 
> >>
> >> I'm also a little wary that the VM_BIND infrastructure could potentially
> >> be abused to trigger a large amount of kernel allocation as it allocates
> >> up-front for the worst case but those pages are not charged to the
> >> process (AFAICT). But I haven't fully got my head round that yet.  
> > 
> > Yep, that's problematic, indeed. I considered allocating page tables
> > as GEM objects, but the overhead of a GEM object is quite big
> > (hundreds of bytes of meta-data) compared to the size of a page table
> > (4k), and kmem_cache was just super convenient for this page table
> > cache :-).  
> 
> I think page tables as GEM objects is likely to be overkill,

I agree it's overkill/not easy to interface with io_pgtbl, but there
was one aspect I was interested in, more than the memory accounting:
being able to reclaim page tables the same way we reclaim regular GEMs,
which would simplify the shrinker/reclaim logic. After discussing it
with Robin, I realized it was pretty much useless, because reclaiming
the GEM will also teardown all VM mappings, which will return the page
table memory to the kmem_cache, and then the kmem_cache layer can
reclaim it.

> we
> obviously also have to be careful not to allow user space to get access
> to the contents - whereas GEM objects are usually to provide user space
> access ;).

GEMs can be hidden to userspace if we want. We are the ones in control
of the mmap() (I think there's a BO flag for preventing users access
already).

> I'm not sure quite what the best solution here is, clearly one
> 'solution' is to just cap the number of outstanding VM_BINDs.

I think that'd make sense.

> 
> >>  
> >>> +
> >>> +	/** @flags: Combination of drm_panthor_vm_bind_op_flags. */
> >>> +	u32 flags;
> >>> +
> >>> +	/** @va: Virtual range targeted by the VM operation. */
> >>> +	struct {
> >>> +		/** @addr: Start address. */
> >>> +		u64 addr;
> >>> +
> >>> +		/** @range: Range size. */
> >>> +		u64 range;
> >>> +	} va;
> >>> +
> >>> +	/**
> >>> +	 * @returned_vmas: List of panthor_vma objects returned after a VM operation.
> >>> +	 *
> >>> +	 * For unmap operations, this will contain all VMAs that were covered by the
> >>> +	 * specified VA range.
> >>> +	 *
> >>> +	 * For map operations, this will contain all VMAs that previously mapped to
> >>> +	 * the specified VA range.
> >>> +	 *
> >>> +	 * Those VMAs, and the resources they point to will be released as part of
> >>> +	 * the op_ctx cleanup operation.
> >>> +	 */
> >>> +	struct list_head returned_vmas;
> >>> +
> >>> +	/** @map: Fields specific to a map operation. */
> >>> +	struct {
> >>> +		/** @gem: GEM object information. */
> >>> +		struct {
> >>> +			/** @obj: GEM object to map. */
> >>> +			struct drm_gem_object *obj;
> >>> +
> >>> +			/** @offset: Offset in the GEM object. */
> >>> +			u64 offset;
> >>> +		} gem;
> >>> +
> >>> +		/**
> >>> +		 * @sgt: sg-table pointing to pages backing the GEM object.
> >>> +		 *
> >>> +		 * This is gathered at job creation time, such that we don't have
> >>> +		 * to allocate in ::run_job().
> >>> +		 */
> >>> +		struct sg_table *sgt;
> >>> +
> >>> +		/**
> >>> +		 * @prev_vma: Pre-allocated VMA object to deal with a remap situation.
> >>> +		 *
> >>> +		 * If the map request covers a region that's inside another VMA, the
> >>> +		 * previous VMA will be split, requiring instantiation of a maximum of
> >>> +		 * two new VMA objects.
> >>> +		 */
> >>> +		struct panthor_vma *prev_vma;
> >>> +
> >>> +		/**
> >>> +		 * @new_vma: The new VMA object that will be inserted to the VA tree.
> >>> +		 */
> >>> +		struct panthor_vma *new_vma;
> >>> +
> >>> +		/**
> >>> +		 * @next_vma: Pre-allocated VMA object to deal with a remap situation.
> >>> +		 *
> >>> +		 * See @prev_vma.
> >>> +		 */
> >>> +		struct panthor_vma *next_vma;    
> >>
> >> It's probably premature optimization, but it feels like having a cache
> >> of these VMA structures might be an idea.  
> > 
> > If it's needed, I'll probably go for a kmem_cache, but I need to
> > check if it's worth it first (if the closest kmalloc cache is
> > significantly biffer than the struct size).
> >   
> >> I'm also struggling to
> >> understand how both a new prev and new next VMA are needed - but I
> >> haven't dug into the GPU VA manager.  
> > 
> > prev/next are for mapping splits: an object is already mapped, and a new
> > object is mapped in the middle of this pre-existing mapping. In that
> > case, we need 2 vma object for the preceeding and succeeding mappings,
> > since the old mapping object will be released.
> > 
> > new_vma is for the new mapping.  
> 
> Yeah, looking into the GPU VA manager I see now. My problem was that I
> assumed in the case of a split one of the original mappings would simply
> be resized, so you'd only need one new VMA (plus the one being added).
> But AFAICT that resize doesn't happen and instead new VMA are created.

Yes. On the other hand, if we have a kmem_cache for panthor_vma
objects, that shouldn't make a big difference.

> 
> >>  
> >>> +	} map;
> >>> +};
> >>> +  
> > 
> > [...]
> >   
> >>> +/**
> >>> + * panthor_vm_active() - Flag a VM as active
> >>> + * @VM: VM to flag as active.
> >>> + *
> >>> + * Assigns an address space to a VM so it can be used by the GPU/MCU.
> >>> + *
> >>> + * Return: 0 on success, a negative error code otherwise.
> >>> + */
> >>> +int panthor_vm_active(struct panthor_vm *vm)
> >>> +{
> >>> +	struct panthor_device *ptdev = vm->ptdev;
> >>> +	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
> >>> +	int ret = 0, as, cookie;
> >>> +	u64 transtab, transcfg;
> >>> +
> >>> +	if (!drm_dev_enter(&ptdev->base, &cookie))
> >>> +		return -ENODEV;
> >>> +
> >>> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> >>> +
> >>> +	as = vm->as.id;
> >>> +	if (as >= 0) {
> >>> +		u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
> >>> +
> >>> +		if (ptdev->mmu->as.faulty_mask & mask) {
> >>> +			/* Unhandled pagefault on this AS, the MMU was
> >>> +			 * disabled. We need to re-enable the MMU after
> >>> +			 * clearing+unmasking the AS interrupts.
> >>> +			 */
> >>> +			gpu_write(ptdev, MMU_INT_CLEAR, mask);
> >>> +			ptdev->mmu->as.faulty_mask &= ~mask;
> >>> +			gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
> >>> +			goto out_enable_as;
> >>> +		}
> >>> +
> >>> +		goto out_unlock;
> >>> +	}
> >>> +
> >>> +	/* Check for a free AS */
> >>> +	if (vm->for_mcu) {
> >>> +		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
> >>> +		as = 0;
> >>> +	} else {
> >>> +		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
> >>> +	}
> >>> +
> >>> +	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
> >>> +		struct panthor_vm *lru_vm;
> >>> +
> >>> +		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
> >>> +						  struct panthor_vm,
> >>> +						  as.lru_node);
> >>> +		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
> >>> +			ret = -EBUSY;
> >>> +			goto out_unlock;
> >>> +		}
> >>> +
> >>> +		list_del_init(&lru_vm->as.lru_node);
> >>> +		as = lru_vm->as.id;    
> >>
> >> Should this not set lru_vm->as.id = -1, so that the code knows the VM no
> >> longer has an address space?  
> > 
> > Good catch!
> >   
> >>  
> >>> +	} else {
> >>> +		set_bit(as, &ptdev->mmu->as.alloc_mask);
> >>> +	}
> >>> +
> >>> +	/* Assign the free or reclaimed AS to the FD */
> >>> +	vm->as.id = as;
> >>> +	ptdev->mmu->as.slots[as].vm = vm;
> >>> +
> >>> +out_enable_as:
> >>> +	transtab = cfg->arm_lpae_s1_cfg.ttbr;
> >>> +	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> >>> +		   AS_TRANSCFG_PTW_RA |
> >>> +		   AS_TRANSCFG_ADRMODE_AARCH64_4K;
> >>> +	if (ptdev->coherent)
> >>> +		transcfg |= AS_TRANSCFG_PTW_SH_OS;
> >>> +
> >>> +	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> >>> +
> >>> +out_unlock:
> >>> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> >>> +	drm_dev_exit(cookie);
> >>> +	return ret;
> >>> +}
> >>> +  
> > 
> > [...]
> >   
> >>> +
> >>> +static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> >>> +{
> >>> +	status = panthor_mmu_fault_mask(ptdev, status);
> >>> +	while (status) {
> >>> +		u32 as = ffs(status | (status >> 16)) - 1;
> >>> +		u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
> >>> +		u32 new_int_mask;
> >>> +		u64 addr;
> >>> +		u32 fault_status;
> >>> +		u32 exception_type;
> >>> +		u32 access_type;
> >>> +		u32 source_id;
> >>> +
> >>> +		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
> >>> +		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
> >>> +		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
> >>> +
> >>> +		/* decode the fault status */
> >>> +		exception_type = fault_status & 0xFF;
> >>> +		access_type = (fault_status >> 8) & 0x3;
> >>> +		source_id = (fault_status >> 16);
> >>> +
> >>> +		/* Page fault only */    
> >>
> >> This comment makes no sense - it looks like it's copied over from panfrost.  
> > 
> > Uh, it made sense before I dropped map/alloc-on-fault :-).  
> 
> :)
> 
> >>
> >> If I understand correctly we don't (currently) support growing on page
> >> fault - and it's not really needed now the MCU can handle the tiler heaps.  
> > 
> > Exaclty. Map/alloc on fault is a bit challenging because of the whole
> > 'we have to guarantee that a job is done in finite time, and we must
> > make sure fence signaling is not blocked on allocation'. Given
> > drm_gem_get_pages() doesn't do non-blocking allocations, I thought it'd
> > be preferable to postpone map-on-fault until we actually decide we need
> > it. Note that i915 seems to have some sort of non-blocking page
> > allocator in shmem_sg_alloc_table()[1].  
> 
> Agreed, the intention is definitely to move away from map/alloc-on-fault
> - handling page faults from the GPU on the CPU is expensive even without
> the can-of-worms of fence signalling.

Yeah, I agree, but I'd bet on Khronos members being inventive enough
to come with a use case for this map/alloc-on-fault feature :-).
Anyway, that's not something we have to worry about just yet.
