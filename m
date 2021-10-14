Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D642E18D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FC6E1D5;
	Thu, 14 Oct 2021 18:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFD56E1D5;
 Thu, 14 Oct 2021 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1/IU3zzvNtZ8I2cOxrDjZM+5f1zuXePR+7Z+lyREdJs=; b=BM9dmieAAA8LE4gmJ0k+mXHUvl
 +wvMf0d1KWjAXoRhtD87kn6N/ii/WDzd32yi2jIQXv741l0o2NmgJhQIWSllMrpHsikcO1M9/t8OC
 ivjYqf+UACw/tUWnQKua+AAJy1Wf+jtOoO71EjCAVQdX2J+uTX9NRLpDQuQk5kXN7Cpo7FBaScrXv
 FjiTLrMrPT97C1e2L+ov9yOBuQJ6nXqY06zN8UCRtm52yVv/fbvEA+Ea7m2QXGzqLAbz75jezONPd
 0s9t4qFrCKlUm9FQz9GvcC0xqc9vcJ9kiyYY0vLQZonDO0enCltv/6iQjmQhLxDG7v5dEpQSSkLKT
 GS1klIBw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mb5h6-008WfV-3P; Thu, 14 Oct 2021 18:43:30 +0000
Date: Thu, 14 Oct 2021 19:43:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jglisse@redhat.com, apopple@nvidia.com,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <YWh6PL7nvh4DqXCI@casper.infradead.org>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014170634.GV2744544@nvidia.com>
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


It would probably help if you cc'd Dan on this.
As far as I know he's the only person left who cares about GUP on DAX.

On Thu, Oct 14, 2021 at 02:06:34PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 14, 2021 at 10:39:28AM -0500, Alex Sierra wrote:
> > From: Ralph Campbell <rcampbell@nvidia.com>
> > 
> > ZONE_DEVICE struct pages have an extra reference count that complicates the
> > code for put_page() and several places in the kernel that need to check the
> > reference count to see that a page is not being used (gup, compaction,
> > migration, etc.). Clean up the code so the reference count doesn't need to
> > be treated specially for ZONE_DEVICE.
> > 
> > Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> > Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> > v2:
> > AS: merged this patch in linux 5.11 version
> > 
> > v5:
> > AS: add condition at try_grab_page to check for the zone device type, while
> > page ref counter is checked less/equal to zero. In case of device zone, pages
> > ref counter are initialized to zero.
> > 
> > v7:
> > AS: fix condition at try_grab_page added at v5, is invalid. It supposed
> > to fix xfstests/generic/413 test, however, there's a known issue on
> > this test where DAX mapped area DIO to non-DAX expect to fail.
> > https://patchwork.kernel.org/project/fstests/patch/1489463960-3579-1-git-send-email-xzhou@redhat.com
> > This condition was removed after rebase over patch series
> > https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
> >  fs/dax.c                               |  4 +-
> >  include/linux/dax.h                    |  2 +-
> >  include/linux/memremap.h               |  7 +--
> >  include/linux/mm.h                     | 11 ----
> >  lib/test_hmm.c                         |  2 +-
> >  mm/internal.h                          |  8 +++
> >  mm/memcontrol.c                        |  6 +--
> >  mm/memremap.c                          | 69 +++++++-------------------
> >  mm/migrate.c                           |  5 --
> >  mm/page_alloc.c                        |  3 ++
> >  mm/swap.c                              | 45 ++---------------
> >  13 files changed, 46 insertions(+), 120 deletions(-)
> 
> Has anyone tested this with FSDAX? Does get_user_pages() on fsdax
> backed memory still work?
> 
> What refcount value does the struct pages have when they are installed
> in the PTEs? Remember a 0 refcount will make all the get_user_pages()
> fail.
> 
> I'm looking at the call path starting in ext4_punch_hole() and I would
> expect to see something manipulating the page ref count before
> the ext4_break_layouts() call path gets to the dax_page_unused() test.
> 
> All I see is we go into unmap_mapping_pages() - that would normally
> put back the page references held by PTEs but insert_pfn() has this:
> 
> 	if (pfn_t_devmap(pfn))
> 		entry = pte_mkdevmap(pfn_t_pte(pfn, prot));
> 
> And:
> 
> static inline pte_t pte_mkdevmap(pte_t pte)
> {
> 	return pte_set_flags(pte, _PAGE_SPECIAL|_PAGE_DEVMAP);
> }
> 
> Which interacts with vm_normal_page():
> 
> 		if (pte_devmap(pte))
> 			return NULL;
> 
> To disable that refcounting?
> 
> So... I have a feeling this will have PTEs pointing to 0 refcount
> pages? Unless FSDAX is !pte_devmap which is not the case, right?
> 
> This seems further confirmed by this comment:
> 
> 	/*
> 	 * If we race get_user_pages_fast() here either we'll see the
> 	 * elevated page count in the iteration and wait, or
> 	 * get_user_pages_fast() will see that the page it took a reference
> 	 * against is no longer mapped in the page tables and bail to the
> 	 * get_user_pages() slow path.  The slow path is protected by
> 	 * pte_lock() and pmd_lock(). New references are not taken without
> 	 * holding those locks, and unmap_mapping_pages() will not zero the
> 	 * pte or pmd without holding the respective lock, so we are
> 	 * guaranteed to either see new references or prevent new
> 	 * references from being established.
> 	 */
> 
> Which seems to explain this scheme relies on unmap_mapping_pages() to
> fence GUP_fast, not on GUP_fast observing 0 refcounts when it should
> stop.
> 
> This seems like it would be properly fixed by using normal page
> refcounting for PTEs - ie stop using special for these pages?
> 
> Does anyone know why devmap is pte_special anyhow?
> 
> > +void free_zone_device_page(struct page *page)
> > +{
> > +	switch (page->pgmap->type) {
> > +	case MEMORY_DEVICE_PRIVATE:
> > +		free_device_page(page);
> > +		return;
> > +	case MEMORY_DEVICE_FS_DAX:
> > +		/* notify page idle */
> > +		wake_up_var(&page->_refcount);
> > +		return;
> 
> It is not for this series, but I wonder if we should just always call
> ops->page_free and have free_device_page() logic in that callback for
> the non-fs-dax cases?
> 
> For instance where is the mem_cgroup_charge() call to pair with the
> mem_cgroup_uncharge() in free_device_page()?
> 
> Isn't cgroup charging (or not) the responsibility of the "allocator"
> eg the pgmap_ops owner?
> 
> Jason
