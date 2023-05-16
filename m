Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D2704508
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 08:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8D110E2E5;
	Tue, 16 May 2023 06:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406F310E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:16:52 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id C9B0E16218B;
 Tue, 16 May 2023 08:16:47 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684217808; bh=5+dfcBD+TwbPUiCcaKNHWAOIkDQHRfATYXlvrdti8OA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=5UPIq/z+OUqaP+JPjeGxOLfpmEEZ1mCIM9dXnWq/3cMp2973pAR7l3vJxe3pW48cI
 UBXtvlBXQj/SjwRZLpeJFzYPtM3L2ur6bqkbwg/6NCE0CLOhTREkAC+SGhdVGiuan8
 +lj5aQva6D10E41Su/t7NOalzPg09XOC895iXqqB8o/cDpI3d3eRIO1IQGlZbJnB4X
 HVv/OfXGfhGRVT5UUMB5iPXJBprCMU4emU3rh4TcKebcU0iDlUOZ6ca0GW/7UyAM0q
 Asg3R57xW1KJPJ2h/oSG3kN0CGLmD8suo9GjGysOQq06k4h5+fF+UDDBgM7GJx+yJh
 by4ASJkAzeIqA==
Date: Tue, 16 May 2023 08:16:45 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Message-ID: <20230516081645.7ba2924c@meshulam.tesarici.cz>
In-Reply-To: <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
 <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "open list:DMA
 MAPPING HELPERS" <iommu@lists.linux.dev>, Borislav Petkov <bp@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Mon, 15 May 2023 19:43:52 +0000
"Michael Kelley (LINUX)" <mikelley@microsoft.com> wrote:

> From: Petr Tesarik <petrtesarik@huaweicloud.com> Sent: Tuesday, May 9, 2023 2:18 AM
> > 
> > The software IO TLB was designed with the assumption that it is not
> > used much, especially on 64-bit systems, so a small fixed memory
> > area (currently 64 MiB) is sufficient to handle the few cases which
> > still require a bounce buffer. However, these cases are not so rare
> > in some circumstances.
> > 
> > First, if SEV is active, all DMA must be done through shared
> > unencrypted pages, and SWIOTLB is used to make this happen without
> > changing device drivers. The software IO TLB size is increased to 6%
> > of total memory in sev_setup_arch(), but that is more of an
> > approximation. The actual requirements may vary depending on which
> > drivers are used and the amount of I/O.  
> 
> FWIW, I don't think the approach you have implemented here will be
> practical to use for CoCo VMs (SEV, TDX, whatever else).  The problem
> is that dma_direct_alloc_pages() and dma_direct_free_pages() must
> call dma_set_decrypted() and dma_set_encrypted(), respectively.  In CoCo
> VMs, these calls are expensive because they require a hypercall to the host,
> and the operation on the host isn't trivial either.  I haven't measured the
> overhead, but doing a hypercall on every DMA map operation and on
> every unmap operation has long been something we thought we must
> avoid.  The fixed swiotlb bounce buffer space solves this problem by
> doing set_decrypted() in batch at boot time, and never
> doing set_encrypted().

I know. For performance, alloc() and free() on each DMA map/unmap is
not ideal even without CoCo. I have already tested some code locally
to keep buffers around after unmap, effectively creating a per-device
pool as described below. Right now, I don't have SEV-capable hardware
for testing, but on bare metal, this pool brought performance back to
that of fixed swiotlb buffers, for some scenarios making it even better.

However, these per-device pools add more complexity, so I decided to
start with a smaller patch series that can be reviewed more easily. If
there is no objection in general, I'll send the second part with the
per-device pools.

> In Microsoft's first implementation of bounce buffering for SEV-SNP VMs,
> we created custom bounce buffer code separate from swiotlb.  This code
> did similar what you've done, but maintained a per-device pool of allocated
> buffers that could be reused, rather than freeing the memory (and marking
> the memory encrypted again) on every DMA unmap operation.  (The pool
> was actually per-VMBus channel, but VMBus channels are per-device, so
> the effect was the same.)  The reusable pool avoided most of the calls to
> set_decrypted()/set_encrypted() and made it practical from a performance
> standpoint.  But of course, the pool could grow arbitrarily large, so there
> was additional complexity to decay and trim the pool size.  LKML feedback
> early on was to use swiotlb instead, which made sense, but at the cost of
> needing to figure out the appropriate fixed size of the swiotlb, and likely
> over-provisioning to avoid running out of bounce buffer space.
> 
> Now we're considering again a more dynamic approach, which is good, but
> we're encountering the same problems.
> 
> See https://lore.kernel.org/linux-hyperv/20210228150315.2552437-1-ltykernel@gmail.com/
> for this historical example.

Thanks for the pointer. I'll definitely have a look!

Petr T

> Michael
> 
> > 
> > Second, some embedded devices have very little RAM, so 64 MiB is not
> > negligible. Sadly, these are exactly the devices that also often
> > need a software IO TLB. Although minimum swiotlb size can be found
> > empirically by extensive testing, it would be easier to allocate a
> > small swiotlb at boot and let it grow on demand.
> > 
> > Growing the SWIOTLB data structures at run time is impossible. The
> > whole SWIOTLB region is contiguous in physical memory to allow
> > combining adjacent slots and also to ensure that alignment
> > constraints can be met. The SWIOTLB is too big for the buddy
> > allocator (cf. MAX_ORDER). More importantly, even if a new SWIOTLB
> > could be allocated (e.g. from CMA), it cannot be extended in-place
> > (because surrounding pages may be already allocated for other
> > purposes), and there is no mechanism for relocating already mapped
> > bounce buffers: The DMA API gets only the address of a buffer, and
> > the implementation (direct or IOMMU) checks whether it belongs to
> > the software IO TLB.
> > 
> > It is possible to allocate multiple smaller struct io_tlb_mem
> > instances. However, they would have to be stored in a non-constant
> > container (list or tree), which needs synchronization between
> > readers and writers, creating contention in a hot path for all
> > devices, not only those which need software IO TLB.
> > 
> > Another option is to allocate a very large SWIOTLB at boot, but
> > allow migrating pages to other users (like CMA does). This approach
> > might work, but there are many open issues:
> > 
> > 1. After a page is migrated away from SWIOTLB, it must not be used
> >    as a (direct) DMA buffer. Otherwise SWIOTLB code would have to
> >    check which pages have been migrated to determine whether a given
> >    buffer address belongs to a bounce buffer or not, effectively
> >    introducing all the issues of multiple SWIOTLB instances.
> > 
> > 2. Unlike SWIOTLB, CMA cannot be used from atomic contexts, and that
> >    for many different reasons. This might be changed in theory, but
> >    it would take a lot of investigation and time. OTOH improvement
> >    to the SWIOTLB is needed now.
> > 
> > 3. If SWIOTLB is implemented separately from CMA and not as its
> >    part, users have to solve the dilemma of how to distribute
> >    precious DMA-able memory between them.
> > 
> > The present patch is a simplistic solution. Bounce buffers are
> > allocated using the non-coherent DMA API, removing the need to
> > implement a new custom allocator. These buffers are then tracked in
> > a per-device linked list, reducing the impact on devices that do not
> > need the SWIOTLB.
> > 
> > Analysis of real-world I/O patterns has shown that the same buffer
> > is typically looked up repeatedly (for further sync operations, or
> > to be unmapped). The most recently used bounce buffer is therefore
> > always moved to the beginning of the list. The list performed better
> > than a maple tree when tested with fio against a QEMU SATA drive
> > backed by a RAM block device in the host (4 cores, 16 iodepth).
> > Other scenarios are also likely to benefit from this MRU order but
> > have not been tested.
> > 
> > Operations on the list are serialized with a spinlock. It is
> > unfortunately not possible to use an RCU list, because quiescent
> > state is not guaranteed to happen before an asynchronous event (e.g.
> > hardware interrupt) on another CPU. If that CPU used an old version
> > of the list, it would fail to copy data to and/or from the newly
> > allocated bounce buffer.
> > 
> > Last but not least, bounce buffers are never allocated dynamically
> > if the SWIOTLB is in fact a DMA restricted pool, because that would
> > defeat the purpose of a restricted pool.
> > 
> > Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > ---
> >  include/linux/device.h  |   8 ++
> >  include/linux/swiotlb.h |   8 +-
> >  kernel/dma/swiotlb.c    | 252 ++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 259 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 472dd24d4823..d1d2b8557b30 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -510,6 +510,12 @@ struct device_physical_location {
> >   * @dma_mem:	Internal for coherent mem override.
> >   * @cma_area:	Contiguous memory area for dma allocations
> >   * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
> > + * @dma_io_tlb_dyn_lock:
> > + *		Spinlock to protect the list of dynamically allocated bounce
> > + *		buffers.
> > + * @dma_io_tlb_dyn_slots:
> > + *		Dynamically allocated bounce buffers for this device.
> > + *		Not for driver use.
> >   * @archdata:	For arch-specific additions.
> >   * @of_node:	Associated device tree node.
> >   * @fwnode:	Associated device node supplied by platform firmware.
> > @@ -615,6 +621,8 @@ struct device {
> >  #endif
> >  #ifdef CONFIG_SWIOTLB
> >  	struct io_tlb_mem *dma_io_tlb_mem;
> > +	spinlock_t dma_io_tlb_dyn_lock;
> > +	struct list_head dma_io_tlb_dyn_slots;
> >  #endif
> >  	/* arch specific additions */
> >  	struct dev_archdata	archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 281ecc6b9bcc..6aada6ac31e2 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -114,6 +114,8 @@ struct io_tlb_mem {
> >  };
> >  extern struct io_tlb_mem io_tlb_default_mem;
> > 
> > +bool is_swiotlb_dyn(struct device *dev, phys_addr_t paddr);
> > +
> >  /**
> >   * is_swiotlb_fixed() - check if a physical address belongs to a swiotlb slot
> >   * @mem:	relevant swiotlb pool
> > @@ -147,7 +149,9 @@ static inline bool is_swiotlb_buffer(struct device *dev,
> > phys_addr_t paddr)
> >  {
> >  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> > 
> > -	return mem && is_swiotlb_fixed(mem, paddr);
> > +	return mem &&
> > +		(is_swiotlb_fixed(mem, paddr) ||
> > +		 is_swiotlb_dyn(dev, paddr));
> >  }
> > 
> >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > @@ -164,6 +168,8 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
> >  static inline void swiotlb_dev_init(struct device *dev)
> >  {
> >  	dev->dma_io_tlb_mem = &io_tlb_default_mem;
> > +	spin_lock_init(&dev->dma_io_tlb_dyn_lock);
> > +	INIT_LIST_HEAD(&dev->dma_io_tlb_dyn_slots);
> >  }
> > 
> >  void swiotlb_init(bool addressing_limited, unsigned int flags);
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 96ba93be6772..612e1c2e9573 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -68,6 +68,22 @@ struct io_tlb_slot {
> >  	unsigned int list;
> >  };
> > 
> > +/**
> > + * struct io_tlb_dyn_slot - dynamically allocated swiotlb slot
> > + * @node:	node in the per-device list
> > + * @orig_addr:	physical address of the original DMA buffer
> > + * @alloc_size:	total size of the DMA buffer
> > + * @page:	first page of the bounce buffer
> > + * @dma_addr:	DMA address of the bounce buffer
> > + */
> > +struct io_tlb_dyn_slot {
> > +	struct list_head node;
> > +	phys_addr_t orig_addr;
> > +	size_t alloc_size;
> > +	struct page *page;
> > +	dma_addr_t dma_addr;
> > +};
> > +
> >  static bool swiotlb_force_bounce;
> >  static bool swiotlb_force_disable;
> > 
> > @@ -466,6 +482,191 @@ void __init swiotlb_exit(void)
> >  	memset(mem, 0, sizeof(*mem));
> >  }
> > 
> > +/**
> > + * lookup_dyn_slot_locked() - look up a dynamically allocated bounce buffer
> > + * @dev:	device which has mapped the buffer
> > + * @paddr:	physical address within the bounce buffer
> > + *
> > + * Walk through the list of bounce buffers dynamically allocated for @dev,
> > + * looking for a buffer which contains @paddr.
> > + *
> > + * Context: Any context. Expects dma_io_tlb_dyn_lock lock to be held.
> > + * Return:
> > + *   Address of a &struct io_tlb_dyn_slot, or %NULL if not found.
> > + */
> > +static struct io_tlb_dyn_slot *lookup_dyn_slot_locked(struct device *dev,
> > +						      phys_addr_t paddr)
> > +{
> > +	struct io_tlb_dyn_slot *slot;
> > +
> > +	list_for_each_entry(slot, &dev->dma_io_tlb_dyn_slots, node) {
> > +		phys_addr_t start = page_to_phys(slot->page);
> > +		phys_addr_t end = start + slot->alloc_size - 1;
> > +
> > +		if (start <= paddr && paddr <= end)
> > +			return slot;
> > +	}
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * lookup_dyn_slot() - look up a dynamically allocated bounce buffer
> > + * @dev:	device which has mapped the buffer
> > + * @paddr:	physical address within the bounce buffer
> > + *
> > + * Search for a dynamically allocated bounce buffer which contains
> > + * @paddr. If found, the buffer is moved to the beginning of the linked
> > + * list. Use lookup_dyn_slot_locked() directly where this behavior is not
> > + * required/desired.
> > + *
> > + * Context: Any context. Takes and releases dma_io_tlb_dyn_lock.
> > + * Return:
> > + *   Address of a &struct io_tlb_dyn_slot, or %NULL if not found.
> > + */
> > +static struct io_tlb_dyn_slot *lookup_dyn_slot(struct device *dev,
> > +					       phys_addr_t paddr)
> > +{
> > +	struct io_tlb_dyn_slot *slot;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> > +	slot = lookup_dyn_slot_locked(dev, paddr);
> > +	list_move(&slot->node, &dev->dma_io_tlb_dyn_slots);
> > +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> > +	return slot;
> > +}
> > +
> > +/**
> > + * is_swiotlb_dyn() - check if a physical address belongs to a dynamically
> > + *                    allocated bounce buffer
> > + * @dev:	device which has mapped the buffer
> > + * @paddr:	physical address within the bounce buffer
> > + *
> > + * Check whether there is a dynamically allocated bounce buffer which
> > + * contains @paddr. If found, the buffer is moved to the beginning of
> > + * the MRU list.
> > + *
> > + * Return:
> > + * * %true if @paddr points into a dynamically allocated bounce buffer
> > + * * %false otherwise
> > + */
> > +bool is_swiotlb_dyn(struct device *dev, phys_addr_t paddr)
> > +{
> > +	return !!lookup_dyn_slot(dev, paddr);
> > +}
> > +
> > +/**
> > + * swiotlb_dyn_bounce() - copy a dynamically allocated buffer from or back
> > + *                        to the original dma location
> > + * @dev:	device which has mapped the buffer
> > + * @tlb_addr:	physical address inside the bounce buffer
> > + * @size:	size of the region to be copied
> > + * @dir:	direction of the data transfer
> > + *
> > + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> > + * This function works only for dynamically allocated bounce buffers.
> > + */
> > +static void swiotlb_dyn_bounce(struct device *dev, phys_addr_t tlb_addr,
> > +		size_t size, enum dma_data_direction dir)
> > +{
> > +	struct io_tlb_dyn_slot *slot = lookup_dyn_slot(dev, tlb_addr);
> > +	unsigned int tlb_offset;
> > +	unsigned char *vaddr;
> > +
> > +	if (!slot)
> > +		return;
> > +
> > +	tlb_offset = tlb_addr - page_to_phys(slot->page);
> > +	vaddr = page_address(slot->page) + tlb_offset;
> > +
> > +	swiotlb_copy(dev, slot->orig_addr, vaddr, size, slot->alloc_size,
> > +		     tlb_offset, dir);
> > +}
> > +
> > +/**
> > + * swiotlb_dyn_map() - allocate a bounce buffer dynamically
> > + * @dev:	device which maps the buffer
> > + * @orig_addr:	address of the original buffer
> > + * @alloc_size:	total size of the original buffer
> > + * @alloc_align_mask:
> > + *		required physical alignment of the I/O buffer
> > + * @dir:	direction of the data transfer
> > + * @attrs:	optional DMA attributes for the map operation
> > + *
> > + * Allocate a new bounce buffer using DMA non-coherent API. This function
> > + * assumes that there is a fallback allocation scheme if the allocation
> > + * fails. In fact, it always fails for buffers smaller than a page and
> > + * for address constraints that are not (yet) correctly handled by
> > + * dma_direct_alloc_pages().
> > + *
> > + * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
> > + */
> > +static phys_addr_t swiotlb_dyn_map(struct device *dev, phys_addr_t orig_addr,
> > +		size_t alloc_size, unsigned int alloc_align_mask,
> > +		enum dma_data_direction dir, unsigned long attrs)
> > +{
> > +	struct io_tlb_dyn_slot *slot;
> > +	unsigned long flags;
> > +	gfp_t gfp;
> > +
> > +	/* Allocation has page granularity. Avoid small buffers. */
> > +	if (alloc_size < PAGE_SIZE)
> > +		goto err;
> > +
> > +	/* DMA direct does not deal with physical address constraints. */
> > +	if (alloc_align_mask || dma_get_min_align_mask(dev))
> > +		goto err;
> > +
> > +	gfp = (attrs & DMA_ATTR_MAY_SLEEP) ? GFP_NOIO : GFP_NOWAIT;
> > +	slot = kmalloc(sizeof(*slot), gfp | __GFP_NOWARN);
> > +	if (!slot)
> > +		goto err;
> > +
> > +	slot->orig_addr = orig_addr;
> > +	slot->alloc_size = alloc_size;
> > +	slot->page = dma_direct_alloc_pages(dev, PAGE_ALIGN(alloc_size),
> > +					    &slot->dma_addr, dir,
> > +					    gfp | __GFP_NOWARN);
> > +	if (!slot->page)
> > +		goto err_free_slot;
> > +
> > +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> > +	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
> > +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> > +
> > +	return page_to_phys(slot->page);
> > +
> > +err_free_slot:
> > +	kfree(slot);
> > +err:
> > +	return (phys_addr_t)DMA_MAPPING_ERROR;
> > +}
> > +
> > +/**
> > + * swiotlb_dyn_unmap() - unmap a dynamically allocated bounce buffer
> > + * @dev:	device which mapped the buffer
> > + * @tlb_addr:	physical address of the bounce buffer
> > + * @dir:	direction of the data transfer
> > + *
> > + * Release all resources associated with a dynamically allocated bounce
> > + * buffer.
> > + */
> > +static void swiotlb_dyn_unmap(struct device *dev, phys_addr_t tlb_addr,
> > +			      enum dma_data_direction dir)
> > +{
> > +	struct io_tlb_dyn_slot *slot;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> > +	slot = lookup_dyn_slot_locked(dev, tlb_addr);
> > +	list_del(&slot->node);
> > +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> > +
> > +	dma_direct_free_pages(dev, slot->alloc_size, slot->page,
> > +			      slot->dma_addr, dir);
> > +	kfree(slot);
> > +}
> > +
> >  /*
> >   * Return the offset into a iotlb slot required to keep the device happy.
> >   */
> > @@ -474,11 +675,19 @@ static unsigned int swiotlb_align_offset(struct device *dev,
> > u64 addr)
> >  	return addr & dma_get_min_align_mask(dev) & (IO_TLB_SIZE - 1);
> >  }
> > 
> > -/*
> > - * Bounce: copy the swiotlb buffer from or back to the original dma location
> > +/**
> > + * swiotlb_fixed_bounce() - copy a fixed-slot swiotlb buffer from or back
> > + *                          to the original dma location
> > + * @dev:	device which has mapped the buffer
> > + * @tlb_addr:	physical address inside the bounce buffer
> > + * @size:	size of the region to be copied
> > + * @dir:	direction of the data transfer
> > + *
> > + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> > + * This function works only for fixed bounce buffers.
> >   */
> > -static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
> > -			   enum dma_data_direction dir)
> > +static void swiotlb_fixed_bounce(struct device *dev, phys_addr_t tlb_addr,
> > +				 size_t size, enum dma_data_direction dir)
> >  {
> >  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> >  	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
> > @@ -574,6 +783,25 @@ static void swiotlb_copy(struct device *dev, phys_addr_t
> > orig_addr,
> >  	}
> >  }
> > 
> > +/**
> > + * swiotlb_bounce() - copy the swiotlb buffer from or back to the original
> > + * dma location
> > + * @dev:	device which has mapped the buffer
> > + * @tlb_addr:	physical address inside the bounce buffer
> > + * @size:	size of the region to be copied
> > + * @dir:	direction of the data transfer
> > + *
> > + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> > + */
> > +static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
> > +			   enum dma_data_direction dir)
> > +{
> > +	if (is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
> > +		swiotlb_fixed_bounce(dev, tlb_addr, size, dir);
> > +	else
> > +		swiotlb_dyn_bounce(dev, tlb_addr, size, dir);
> > +}
> > +
> >  static inline phys_addr_t slot_addr(phys_addr_t start, phys_addr_t idx)
> >  {
> >  	return start + (idx << IO_TLB_SHIFT);
> > @@ -834,8 +1062,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev,
> > phys_addr_t orig_addr,
> >  		return (phys_addr_t)DMA_MAPPING_ERROR;
> >  	}
> > 
> > -	tlb_addr = swiotlb_fixed_map(dev, orig_addr, alloc_size,
> > -				     alloc_align_mask, attrs);
> > +	tlb_addr = (phys_addr_t)DMA_MAPPING_ERROR;
> > +	if (!is_swiotlb_for_alloc(dev))
> > +		tlb_addr = swiotlb_dyn_map(dev, orig_addr, alloc_size,
> > +					   alloc_align_mask, dir, attrs);
> > +	if (tlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
> > +		tlb_addr = swiotlb_fixed_map(dev, orig_addr, alloc_size,
> > +					     alloc_align_mask, attrs);
> > 
> >  	if (tlb_addr == (phys_addr_t)DMA_MAPPING_ERROR) {
> >  		if (!(attrs & DMA_ATTR_NO_WARN))
> > @@ -919,7 +1152,10 @@ void swiotlb_tbl_unmap_single(struct device *dev,
> > phys_addr_t tlb_addr,
> >  	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
> >  		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
> > 
> > -	swiotlb_release_slots(dev, tlb_addr);
> > +	if (is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
> > +		swiotlb_release_slots(dev, tlb_addr);
> > +	else
> > +		swiotlb_dyn_unmap(dev, tlb_addr, dir);
> >  }
> > 
> >  void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
> > @@ -1089,7 +1325,7 @@ bool swiotlb_free(struct device *dev, struct page *page,
> > size_t size)
> >  {
> >  	phys_addr_t tlb_addr = page_to_phys(page);
> > 
> > -	if (!is_swiotlb_buffer(dev, tlb_addr))
> > +	if (!is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
> >  		return false;
> > 
> >  	swiotlb_release_slots(dev, tlb_addr);
> > --
> > 2.25.1  
> 

