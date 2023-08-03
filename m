Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6176E32D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2362510E5CA;
	Thu,  3 Aug 2023 08:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DA210E5CA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:32:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c4e426714so19323066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691051567; x=1691656367;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pAuYs/QLB03KHLO4kdZKV+yQgSaaMVS+owEl2g8UVew=;
 b=OinXHeMd1J3TBhjnEJAorVBhcxGC5qSG+hUjMeuzVE2EC54SfmvGt85V16q8/E8TSw
 C8cd8MuV27mKRQyCSQhqjtXbu32WTMV4vfCmNe+LVfa8/Lo960ImVgJEZdZw6FZD8tWe
 gCqCMOQqzxfv1l/nuNvquFsqVViEZfSMEKRzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051567; x=1691656367;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pAuYs/QLB03KHLO4kdZKV+yQgSaaMVS+owEl2g8UVew=;
 b=CPXOvH42uF18eUKl/fZ8xK4yDWWevomK5H1MaEMjqjHjrO5qyCSdYC0qVah/93HuIs
 VrA0cTzNod7IdeMq6aR1Fn6TMa+uAX+GIJYIuBVN5NJBw8Zf+FbI4v53XKj5jbul2WzR
 b8ipH3GCMl5kVudrRBQFQsc5h0593Z/+HIeF2FhtX38cLqZL6t5jnkuGej98+1KqiZv9
 ZiCKyGsShTPQsOF0MC3ufdD7cMpX2/SwZxhrn4b+dcfhSUNS3W8wHouLsCmLau2XkWg1
 EDiUEg2PUjiwc5ZJ88jXvjLDifZlHCvWdgoc1jSq/pQtKGyr1ZBA3HBFcwN56or2Hs0h
 IBOQ==
X-Gm-Message-State: ABy/qLZolgIl386ukH+KbNOoM19rk19QuPaKk9SicZfhP0n9etGHUw9X
 YM9jQkkPfS7O/m2/PUS7BHLfhw==
X-Google-Smtp-Source: APBJJlEzpqwQtx1kmMczULPSvuYG77OrcY8I3p5ckaYrRJ+QUk4Nz+w0rmrKMaE9Kfm2V17UDeA/SQ==
X-Received: by 2002:a17:906:11a:b0:993:f349:c989 with SMTP id
 26-20020a170906011a00b00993f349c989mr10926795eje.7.1691051567156; 
 Thu, 03 Aug 2023 01:32:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170906135800b009930308425csm10124169ejb.31.2023.08.03.01.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:32:46 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:32:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 2/3] udmabuf: Replace pages when there is
 FALLOC_FL_PUNCH_HOLE in memfd
Message-ID: <ZMtmLAL5XucMtJDV@phenom.ffwll.local>
Mail-Followup-To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-3-vivek.kasireddy@intel.com>
 <ZMpOwgUgYLplUc1j@phenom.ffwll.local>
 <IA0PR11MB7185DFC97B8234F4F46B42F9F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185DFC97B8234F4F46B42F9F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 08:24:07AM +0000, Kasireddy, Vivek wrote:
> Hi Daniel,
> 
> > 
> > On Tue, Jul 18, 2023 at 01:28:57AM -0700, Vivek Kasireddy wrote:
> > > When a hole is punched in the memfd or when a page is replaced for
> > > any reason, the udmabuf driver needs to get notified in order to
> > > update its list of pages with the new page. To accomplish this, we
> > > first identify the vma ranges where pages associated with a given
> > > udmabuf are mapped to and then register a handler for update_mapping
> > > mmu notifier for receiving mapping updates.
> > >
> > > Once we get notified about a new page faulted in at a given offset
> > > in the mapping (backed by shmem or hugetlbfs), the list of pages
> > > is updated and we also zap the relevant PTEs associated with the
> > > vmas that have mmap'd the udmabuf fd.
> > >
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Mike Kravetz <mike.kravetz@oracle.com>
> > > Cc: Hugh Dickins <hughd@google.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Dongwon Kim <dongwon.kim@intel.com>
> > > Cc: Junxiao Chang <junxiao.chang@intel.com>
> > > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > 
> > I think the long thread made it clear already, so just for the record:
> > This wont work. udmabuf is very intentionally about pin_user_page
> > semantics, if you change the underlying mapping, you get to keep all the
> > pieces.
> > 
> > The _only_ way to make this work by implementing the dma_buf move
> > notification infrastructure, and most importers can't cope with such
> > dynamic dma-buf. And so most likely will not solve your use-case.
> Right, we do have to call move_notify() at some point to let the importers
> know about the backing memory changes but as you suggest, unfortunately,
> most importers don't handle moves. However, I guess I could try implementing
> it in i915 and also add a helper in GEM.
> 
> > 
> > Everything else races in a fundamental and unfixable way.
> I think there might still be some options to address this use-case in a safe
> and race-free way particularly given the fact that with udmabuf driver,
> the writes and reads do not occur simultaneously. We use DMA fences
> in both the Host and Guest to ensure this synchronization.

One more I've forgotten. You cannot combine udmabuf with move_notify, the
locking doesn't work. There's only three ways to make this happen:

- You put the mmu_notifier into each driver, which means these (usually
  called userptr memory areas) are _not_ shareable as dma-buf. Every
  driver has to set up their own userptr mapping to make this work.

- pin_user_pages, which is what udmabuf does

- You make the dma-buf export allocator specific, because then you can
  more directly tie into the locking and bypass the gup/mmu_notifer rules.
  Might need a full rewrite of the allocator though, but at least in
  theory it should be possible to have a memfd ioctl to export as a dmabuf
  (with the only requirement that it needs to be size-sealed, because
  dma-buf never change size).

Trying to pull off what you're trying to do with udmabuf either races or
deadlocks.

Cheers, Daniel

> 
> Thanks,
> Vivek
> 
> > -Daniel
> > 
> > > ---
> > >  drivers/dma-buf/udmabuf.c | 172
> > ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 172 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > > index 10c47bf77fb5..189a36c41906 100644
> > > --- a/drivers/dma-buf/udmabuf.c
> > > +++ b/drivers/dma-buf/udmabuf.c
> > > @@ -4,6 +4,8 @@
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-resv.h>
> > >  #include <linux/highmem.h>
> > > +#include <linux/rmap.h>
> > > +#include <linux/mmu_notifier.h>
> > >  #include <linux/init.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/memfd.h>
> > > @@ -30,6 +32,23 @@ struct udmabuf {
> > >  	struct sg_table *sg;
> > >  	struct miscdevice *device;
> > >  	pgoff_t *offsets;
> > > +	struct udmabuf_vma_range *ranges;
> > > +	unsigned int num_ranges;
> > > +	struct mmu_notifier notifier;
> > > +	struct mutex mn_lock;
> > > +	struct list_head mmap_vmas;
> > > +};
> > > +
> > > +struct udmabuf_vma_range {
> > > +	struct file *memfd;
> > > +	pgoff_t ubufindex;
> > > +	unsigned long start;
> > > +	unsigned long end;
> > > +};
> > > +
> > > +struct udmabuf_mmap_vma {
> > > +	struct list_head vma_link;
> > > +	struct vm_area_struct *vma;
> > >  };
> > >
> > >  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> > > @@ -42,28 +61,54 @@ static vm_fault_t udmabuf_vm_fault(struct
> > vm_fault *vmf)
> > >  	if (pgoff >= ubuf->pagecount)
> > >  		return VM_FAULT_SIGBUS;
> > >
> > > +	mutex_lock(&ubuf->mn_lock);
> > >  	pfn = page_to_pfn(ubuf->pages[pgoff]);
> > >  	if (ubuf->offsets) {
> > >  		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
> > >  	}
> > > +	mutex_unlock(&ubuf->mn_lock);
> > >
> > >  	return vmf_insert_pfn(vma, vmf->address, pfn);
> > >  }
> > >
> > > +static void udmabuf_vm_close(struct vm_area_struct *vma)
> > > +{
> > > +	struct udmabuf *ubuf = vma->vm_private_data;
> > > +	struct udmabuf_mmap_vma *mmap_vma;
> > > +
> > > +	list_for_each_entry(mmap_vma, &ubuf->mmap_vmas, vma_link) {
> > > +		if (mmap_vma->vma == vma) {
> > > +			list_del(&mmap_vma->vma_link);
> > > +			kfree(mmap_vma);
> > > +			break;
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  static const struct vm_operations_struct udmabuf_vm_ops = {
> > >  	.fault = udmabuf_vm_fault,
> > > +	.close = udmabuf_vm_close,
> > >  };
> > >
> > >  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> > *vma)
> > >  {
> > >  	struct udmabuf *ubuf = buf->priv;
> > > +	struct udmabuf_mmap_vma *mmap_vma;
> > >
> > >  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> > >  		return -EINVAL;
> > >
> > > +	mmap_vma = kmalloc(sizeof(*mmap_vma), GFP_KERNEL);
> > > +	if (!mmap_vma)
> > > +		return -ENOMEM;
> > > +
> > >  	vma->vm_ops = &udmabuf_vm_ops;
> > >  	vma->vm_private_data = ubuf;
> > >  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> > VM_DONTDUMP);
> > > +
> > > +	mmap_vma->vma = vma;
> > > +	list_add(&mmap_vma->vma_link, &ubuf->mmap_vmas);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -109,6 +154,7 @@ static struct sg_table *get_sg_table(struct device
> > *dev, struct dma_buf *buf,
> > >  	if (ret < 0)
> > >  		goto err_alloc;
> > >
> > > +	mutex_lock(&ubuf->mn_lock);
> > >  	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
> > >  		offset = ubuf->offsets ? ubuf->offsets[i] : 0;
> > >  		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, offset);
> > > @@ -116,9 +162,12 @@ static struct sg_table *get_sg_table(struct device
> > *dev, struct dma_buf *buf,
> > >  	ret = dma_map_sgtable(dev, sg, direction, 0);
> > >  	if (ret < 0)
> > >  		goto err_map;
> > > +
> > > +	mutex_unlock(&ubuf->mn_lock);
> > >  	return sg;
> > >
> > >  err_map:
> > > +	mutex_unlock(&ubuf->mn_lock);
> > >  	sg_free_table(sg);
> > >  err_alloc:
> > >  	kfree(sg);
> > > @@ -157,6 +206,9 @@ static void release_udmabuf(struct dma_buf *buf)
> > >
> > >  	for (pg = 0; pg < ubuf->pagecount; pg++)
> > >  		put_page(ubuf->pages[pg]);
> > > +
> > > +	mmu_notifier_unregister(&ubuf->notifier, ubuf->notifier.mm);
> > > +	kfree(ubuf->ranges);
> > >  	kfree(ubuf->offsets);
> > >  	kfree(ubuf->pages);
> > >  	kfree(ubuf);
> > > @@ -208,6 +260,93 @@ static const struct dma_buf_ops udmabuf_ops = {
> > >  	.end_cpu_access    = end_cpu_udmabuf,
> > >  };
> > >
> > > +static void invalidate_mmap_vmas(struct udmabuf *ubuf,
> > > +				 struct udmabuf_vma_range *range,
> > > +				 unsigned long address, unsigned long size)
> > > +{
> > > +	struct udmabuf_mmap_vma *vma;
> > > +	unsigned long start = range->ubufindex << PAGE_SHIFT;
> > > +
> > > +	start += address - range->start;
> > > +	list_for_each_entry(vma, &ubuf->mmap_vmas, vma_link) {
> > > +		zap_vma_ptes(vma->vma, vma->vma->vm_start + start,
> > size);
> > > +	}
> > > +}
> > > +
> > > +static struct udmabuf_vma_range *find_udmabuf_range(struct udmabuf
> > *ubuf,
> > > +						    unsigned long address)
> > > +{
> > > +	struct udmabuf_vma_range *range;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < ubuf->num_ranges; i++) {
> > > +		range = &ubuf->ranges[i];
> > > +		if (address >= range->start && address < range->end)
> > > +			return range;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static void update_udmabuf(struct mmu_notifier *mn, struct mm_struct
> > *mm,
> > > +			   unsigned long address, unsigned long pfn)
> > > +{
> > > +	struct udmabuf *ubuf = container_of(mn, struct udmabuf, notifier);
> > > +	struct udmabuf_vma_range *range = find_udmabuf_range(ubuf,
> > address);
> > > +	struct page *old_page, *new_page;
> > > +	pgoff_t pgoff, pgshift = PAGE_SHIFT;
> > > +	unsigned long size = 0;
> > > +
> > > +	if (!range || !pfn_valid(pfn))
> > > +		return;
> > > +
> > > +	if (is_file_hugepages(range->memfd))
> > > +		pgshift = huge_page_shift(hstate_file(range->memfd));
> > > +
> > > +	mutex_lock(&ubuf->mn_lock);
> > > +	pgoff = range->ubufindex + ((address - range->start) >> pgshift);
> > > +	old_page = ubuf->pages[pgoff];
> > > +	new_page = pfn_to_page(pfn);
> > > +
> > > +	do {
> > > +		ubuf->pages[pgoff] = new_page;
> > > +		get_page(new_page);
> > > +		put_page(old_page);
> > > +		size += PAGE_SIZE;
> > > +	} while (ubuf->pages[++pgoff] == old_page);
> > > +
> > > +	mutex_unlock(&ubuf->mn_lock);
> > > +	invalidate_mmap_vmas(ubuf, range, address, size);
> > > +}
> > > +
> > > +static const struct mmu_notifier_ops udmabuf_update_ops = {
> > > +	.update_mapping = update_udmabuf,
> > > +};
> > > +
> > > +static struct vm_area_struct *find_guest_ram_vma(struct udmabuf *ubuf,
> > > +						 struct mm_struct
> > *vmm_mm)
> > > +{
> > > +	struct vm_area_struct *vma = NULL;
> > > +	MA_STATE(mas, &vmm_mm->mm_mt, 0, 0);
> > > +	unsigned long addr;
> > > +	pgoff_t pg;
> > > +
> > > +	mas_set(&mas, 0);
> > > +	mmap_read_lock(vmm_mm);
> > > +	mas_for_each(&mas, vma, ULONG_MAX) {
> > > +		for (pg = 0; pg < ubuf->pagecount; pg++) {
> > > +			addr = page_address_in_vma(ubuf->pages[pg], vma);
> > > +			if (addr == -EFAULT)
> > > +				break;
> > > +		}
> > > +		if (addr != -EFAULT)
> > > +			break;
> > > +	}
> > > +	mmap_read_unlock(vmm_mm);
> > > +
> > > +	return vma;
> > > +}
> > > +
> > >  #define SEALS_WANTED (F_SEAL_SHRINK)
> > >  #define SEALS_DENIED (F_SEAL_WRITE)
> > >
> > > @@ -218,6 +357,7 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > >  	struct file *memfd = NULL;
> > >  	struct address_space *mapping = NULL;
> > > +	struct vm_area_struct *guest_ram;
> > >  	struct udmabuf *ubuf;
> > >  	struct dma_buf *buf;
> > >  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
> > > @@ -252,6 +392,13 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  		goto err;
> > >  	}
> > >
> > > +	ubuf->ranges = kmalloc_array(head->count, sizeof(*ubuf->ranges),
> > > +				    GFP_KERNEL);
> > > +	if (!ubuf->ranges) {
> > > +		ret = -ENOMEM;
> > > +		goto err;
> > > +	}
> > > +
> > >  	pgbuf = 0;
> > >  	for (i = 0; i < head->count; i++) {
> > >  		ret = -EBADFD;
> > > @@ -270,6 +417,8 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  			goto err;
> > >  		pgoff = list[i].offset >> PAGE_SHIFT;
> > >  		pgcnt = list[i].size   >> PAGE_SHIFT;
> > > +		ubuf->ranges[i].ubufindex = pgbuf;
> > > +		ubuf->ranges[i].memfd = memfd;
> > >  		if (is_file_hugepages(memfd)) {
> > >  			if (!ubuf->offsets) {
> > >  				ubuf->offsets = kmalloc_array(ubuf-
> > >pagecount,
> > > @@ -299,6 +448,7 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  				get_page(hpage);
> > >  				ubuf->pages[pgbuf] = hpage;
> > >  				ubuf->offsets[pgbuf++] = chunkoff <<
> > PAGE_SHIFT;
> > > +
> > >  				if (++chunkoff == maxchunks) {
> > >  					put_page(hpage);
> > >  					hpage = NULL;
> > > @@ -334,6 +484,25 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  		goto err;
> > >  	}
> > >
> > > +	guest_ram = find_guest_ram_vma(ubuf, current->mm);
> > > +	if (!guest_ram)
> > > +		goto err;
> > > +
> > > +	ubuf->notifier.ops = &udmabuf_update_ops;
> > > +	ret = mmu_notifier_register(&ubuf->notifier, current->mm);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ubuf->num_ranges = head->count;
> > > +	for (i = 0; i < ubuf->num_ranges; i++) {
> > > +		page = ubuf->pages[ubuf->ranges[i].ubufindex];
> > > +		ubuf->ranges[i].start = page_address_in_vma(page,
> > guest_ram);
> > > +		ubuf->ranges[i].end = ubuf->ranges[i].start + list[i].size;
> > > +	}
> > > +
> > > +	INIT_LIST_HEAD(&ubuf->mmap_vmas);
> > > +	mutex_init(&ubuf->mn_lock);
> > > +
> > >  	flags = 0;
> > >  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
> > >  		flags |= O_CLOEXEC;
> > > @@ -344,6 +513,9 @@ static long udmabuf_create(struct miscdevice
> > *device,
> > >  		put_page(ubuf->pages[--pgbuf]);
> > >  	if (memfd)
> > >  		fput(memfd);
> > > +	if (ubuf->notifier.mm)
> > > +		mmu_notifier_unregister(&ubuf->notifier, ubuf-
> > >notifier.mm);
> > > +	kfree(ubuf->ranges);
> > >  	kfree(ubuf->offsets);
> > >  	kfree(ubuf->pages);
> > >  	kfree(ubuf);
> > > --
> > > 2.39.2
> > >
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
