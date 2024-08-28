Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6894962D98
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3001810E592;
	Wed, 28 Aug 2024 16:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h+qDCJrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329D10E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:25:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so4327155e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724862321; x=1725467121; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sr0w7wuPZHVWNdrJWqMn13rDz36uOmC+yQyUXT1q4jA=;
 b=h+qDCJrzRWhm65SkaGvcrR03gmRVNvCE+QZ9WTYEYyVXNc2MLFD07em9K4MOGz5ijb
 TjZCHUr98Wz0kPKKRTDhb9OhRPOX54wVnbr2OJ9/LQtMYH2DEbYdzITyCst3dw7k9uxe
 bEV6a0f52JjJ9RItYwBSq9MaK8P75R72FS/t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724862321; x=1725467121;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sr0w7wuPZHVWNdrJWqMn13rDz36uOmC+yQyUXT1q4jA=;
 b=sgZ1LihqDTiWxif8c/ssfqonac8JSv8CtLtEgzBEjZb8MTuA1xV5auSFJBBDVKl3NQ
 lPebw3Hv+fPMD5ORpM4UHEU1sLWQCqCd7pwEdlmpKA9GRT/ahFbJWaunTe6DzAsiwGgs
 fKPt8n/KJfbz4dRbV8fSRtCm93pPwIVVgqS6XBphmdlK4PbEMawZntjQT09nTRn+4rZW
 et/JmJqFDMAAdMoGoC5nFxzO0zwiStEUUvaeArthOG29b5zciHfd+HOQCIgdzhLmYwnD
 9V9hzIxW6atybQSh5Un5gxXp20lKdwZHE4ZHsUj86lFAJnyyTy5prFm7KyqtnGuA70z1
 lpsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6heX7xrmmsEreg+C0UDW/EQjLnToS2Nu/+ZbAfKS/YPgrDS+Gr4dC2qif6Viam/dW8cIQXlTSbUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnQO5SY0JT8ifq9OuGcPX82dp+ABu2G4pIdLNoVrV9nVQ3ThjD
 JiFZLp0Rp8TTITFAQVJ/o3DlMSSbw+oCVu4uNla3NIRYEmHfT34pOLxDIBZ8Pso=
X-Google-Smtp-Source: AGHT+IERDYg7QCsIyAwNGhweUgaFLe3NbVnfYMAG0cHv31FCObudNJwUosvJnTS9GBP88YTd/ol6Ag==
X-Received: by 2002:a05:600c:3145:b0:426:6667:bbbe with SMTP id
 5b1f17b1804b1-42bb0257a2fmr1902115e9.9.1724862320806; 
 Wed, 28 Aug 2024 09:25:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b36145asm175205f8f.107.2024.08.28.09.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:25:20 -0700 (PDT)
Date: Wed, 28 Aug 2024 18:25:18 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Zs9Pbnt0LObX0XDw@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
 <c1d455a7-f682-43ac-8bbd-af0727954d5d@amd.com>
 <Zs9FtNM/UVSSCAhR@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs9FtNM/UVSSCAhR@DUT025-TGLU.fm.intel.com>
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

On Wed, Aug 28, 2024 at 03:43:48PM +0000, Matthew Brost wrote:
> On Wed, Aug 28, 2024 at 04:46:24PM +0200, Christian König wrote:
> > Am 28.08.24 um 16:31 schrieb Daniel Vetter:
> > > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > > +		if (!ctx->mmap_locked) {
> > > > +			/*
> > > > +			 * XXX: HMM locking document indicates only a read-lock
> > > > +			 * is required but there apears to be a window between
> > > > +			 * the MMU_NOTIFY_MIGRATE event triggered in a CPU fault
> > > > +			 * via migrate_vma_setup and the pages actually moving
> > > > +			 * in migrate_vma_finalize in which this code can grab
> > > > +			 * garbage pages. Grabbing the write-lock if the range
> > > > +			 * is attached to vram appears to protect against this
> > > > +			 * race.
> > > > +			 */
> 
> Thanks the comments, replying to both of you inline.
> 
> > > This one is really scary, since it means the entire migrate pte trickery
> > > is essentially completely busted. Grabbing the mmap write lock just means
> > > you block out pretty much everything interesting from concurrently
> > > happening.
> > > 
> > > My gut feeling says we need to figure out what's happening here, because
> > > this looks a bit too fundamental to me.
> 
> I agree. I haven’t looked into this issue for a couple of months but
> really need to understand what is going on.
> 
> I should have mentioned this in the cover letter: the goal of this
> series was to produce something for review that is stable and supports
> UMDs/user applications. It was not intended to be presented as a final
> solution. This issue certainly falls into the category of "needs to be
> understood and requires a proper fix."
> 
> One open question I have is whether the test case that triggers this
> issue is even defined behavior. The test creates concurrent access
> between the GPU and CPU to the same memory address, resulting in GPU and
> CPU faults racing against each other. It’s possible that this is
> undefined behavior, so data corruption might be acceptable—i.e., the
> kernel can’t crash, but incorrect results might be permissible.

Yes this is supposed to be defined, at least from an hmm pov. And core mm/
is ridiculous in how many races it allows, especially around concurrent
fault handling.

It is ofc really slow if every fault results in a migration, but that's a
matter of the application setting stupid memory migration hints for the
gpu.

> e.g. This is the only defined usage model:
> 
> alloc_memory();
> start_compute_kernel();
> sync_on_compute_kernel_completion();
> read_memory();
> 
> Hopefully, in the next week or so, I'll be heavily engaging with the UMD
> teams. Development can then start, and applications will be running soon
> after. This will allow us to address issues like this, collect data on
> memory usage, and verify some of the assumptions I've made, such as
> optimizing for 2M+ allocations.
> 
> > 
> > I think I have at least a high level understanding what's going on here,
> > Felix and especially Philip should know more of the details.
> > 
> 
> I meant to reach out to AMD for issues like this. So, Felix
> (felix.kuehling@amd.com) and Philip (Philip.Yang@amd.com) would be good
> contacts?
> 
> > In general grabbing the mm_lock to protect PTEs from changing is completely
> > nonsense. The mm_lock is to protect the VMAs and *not* the PTEs!
> > 
> 
> Thanks for the hint. I believe that in the AMD implementation, I noticed
> some additional locks for migration, which might be how you mitigated
> this issue.

Yeah, so in general hold mmap_reading is indeed pure magic thinking for
preventing pte changes, like Christian points out. It doesn't stop
invalidates, and with the per vma locking it also doesn't stop new valid
ptes from being inserted at least for anon memory.

Except migration pte entries that point at vram pages are special, and are
_only_ resolved while holding mmap_read. Which means holding mmap_write
for the case of looking up our own vram pages with hmm_range_fault
actually prevents issues. And so this duct-tape of holding mmap_write very
much looks like a working hack to plug any races against concurrently
ongoing migrations to system memory due to cpu faults.

An even more fun corner case is multiple concurrent cpu faults on the same
vram page. fork gets you that, or maybe a bit more reasonable mremap with
MREMAP_DONTUNMAP | MREMAP_MAYMOVE. I think just hammer the same va with
multiple threads along isn't enough, it's better to have a private va for
each thread pointing at the same anon memory page, so that you can get
more parallel faults due to finely grained pte locking.

Would be a good testcase to add, if you don't have it yet.

> I must say it is a bit unfortunate that the HMM locking documentation
> doesn’t mention this. I believe the documentation needs additional
> information, which I can add once we finalize the solution.

Yeah, at least from my very cursory lock you don't have enough locking.
I've written an in-depth reply to patch 23 with the high-level summary of
my thoughts.

Cheers, Sima

> 
> Matt 
> 
> > Even with the write side of the mm_lock taken it is perfectly possible that
> > PTE change. It's just less likely.
> > 
> > We run into multiple issues before we figured out this important distinction
> > as well.
> > 
> > Christian.
> > 
> > > -Sima
> > > 
> > > 
> > > > +			if (vram_pages)
> > > > +				mmap_write_lock(mm);
> > > > +			else
> > > > +				mmap_read_lock(mm);
> > > > +		}
> > > > +		err = hmm_range_fault(&hmm_range);
> > > > +		if (!ctx->mmap_locked) {
> > > > +			if (vram_pages)
> > > > +				mmap_write_unlock(mm);
> > > > +			else
> > > > +				mmap_read_unlock(mm);
> > > > +		}
> > > > +
> > > > +		if (err == -EBUSY) {
> > > > +			if (time_after(jiffies, timeout))
> > > > +				break;
> > > > +
> > > > +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > > > +			continue;
> > > > +		}
> > > > +		break;
> > > > +	}
> > > > +	if (!ctx->mmap_locked)
> > > > +		mmput(mm);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	pages = (struct page **)pfns;
> > > > +
> > > > +	if (ctx->prefault) {
> > > > +		range->pages = pages;
> > > > +		goto set_seqno;
> > > > +	}
> > > > +
> > > > +map_pages:
> > > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > > +
> > > > +		for (i = 0; i < npages; ++i) {
> > > > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > > > +
> > > > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				goto err_free;
> > > > +			}
> > > > +		}
> > > > +
> > > > +		/* Do not race with notifier unmapping pages */
> > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > +		range->flags.has_vram_pages = true;
> > > > +		range->pages = pages;
> > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > +			err = -EAGAIN;
> > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +		}
> > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > +	} else {
> > > > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > > > +
> > > > +		for_each_dma_page(i, j, npages, order) {
> > > > +			if (WARN_ON_ONCE(i && order !=
> > > > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				npages = i;
> > > > +				goto err_unmap;
> > > > +			}
> > > > +			order = hmm_pfn_to_map_order(pfns[i]);
> > > > +
> > > > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > > > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				npages = i;
> > > > +				goto err_unmap;
> > > > +			}
> > > > +
> > > > +			set_page_dirty_lock(pages[j]);
> > > > +			mark_page_accessed(pages[j]);
> > > > +
> > > > +			dma_addr[j] = dma_map_page(gpusvm->drm->dev,
> > > > +						   pages[j], 0,
> > > > +						   PAGE_SIZE << order,
> > > > +						   DMA_BIDIRECTIONAL);
> > > > +			if (dma_mapping_error(gpusvm->drm->dev, dma_addr[j])) {
> > > > +				err = -EFAULT;
> > > > +				npages = i;
> > > > +				goto err_unmap;
> > > > +			}
> > > > +		}
> > > > +
> > > > +		/* Huge pages, reduce memory footprint */
> > > > +		if (order) {
> > > > +			dma_addr = kmalloc_array(j, sizeof(*dma_addr),
> > > > +						 GFP_KERNEL);
> > > > +			if (dma_addr) {
> > > > +				for (i = 0; i < j; ++i)
> > > > +					dma_addr[i] = (dma_addr_t)pfns[i];
> > > > +				kvfree(pfns);
> > > > +				kfree_mapping = true;
> > > > +			} else {
> > > > +				dma_addr = (dma_addr_t *)pfns;
> > > > +			}
> > > > +		}
> > > > +
> > > > +		/* Do not race with notifier unmapping pages */
> > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > +		range->order = order;
> > > > +		range->flags.kfree_mapping = kfree_mapping;
> > > > +		range->flags.has_dma_mapping = true;
> > > > +		range->dma_addr = dma_addr;
> > > > +		range->vram_allocation = NULL;
> > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > +			err = -EAGAIN;
> > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +		}
> > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > +	}
> > > > +
> > > > +	if (err == -EAGAIN)
> > > > +		goto retry;
> > > > +set_seqno:
> > > > +	range->notifier_seq = hmm_range.notifier_seq;
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_unmap:
> > > > +	for_each_dma_page(i, j, npages, order)
> > > > +		dma_unmap_page(gpusvm->drm->dev,
> > > > +			       (dma_addr_t)pfns[j],
> > > > +			       PAGE_SIZE << order, DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > +	if (alloc_pfns)
> > > > +		kvfree(pfns);
> > > > +err_out:
> > > > +	return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> > > > + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> > > > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> > > > + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> > > > + * security model.
> > > > + */
> > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > +				  struct drm_gpusvm_range *range,
> > > > +				  const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > +	if (ctx->in_notifier)
> > > > +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > > > +	else
> > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > +
> > > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +
> > > > +	if (!ctx->in_notifier)
> > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migration_put_page - Put a migration page
> > > > + * @page: Pointer to the page to put
> > > > + *
> > > > + * This function unlocks and puts a page.
> > > > + */
> > > > +static void drm_gpusvm_migration_put_page(struct page *page)
> > > > +{
> > > > +	unlock_page(page);
> > > > +	put_page(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migration_put_pages - Put migration pages
> > > > + * @npages: Number of pages
> > > > + * @migrate_pfn: Array of migrate page frame numbers
> > > > + *
> > > > + * This function puts an array of pages.
> > > > + */
> > > > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > > > +					   unsigned long *migrate_pfn)
> > > > +{
> > > > +	unsigned long i;
> > > > +
> > > > +	for (i = 0; i < npages; ++i) {
> > > > +		if (!migrate_pfn[i])
> > > > +			continue;
> > > > +
> > > > +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> > > > +		migrate_pfn[i] = 0;
> > > > +	}
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> > > > + * @page: Pointer to the page
> > > > + * @zdd: Pointer to the GPU SVM zone device data
> > > > + *
> > > > + * This function associates the given page with the specified GPU SVM zone
> > > > + * device data and initializes it for zone device usage.
> > > > + */
> > > > +static void drm_gpusvm_get_vram_page(struct page *page,
> > > > +				     struct drm_gpusvm_zdd *zdd)
> > > > +{
> > > > +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> > > > +	zone_device_page_init(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> > > > + * @dev: The device for which the pages are being mapped
> > > > + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> > > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > > + * @npages: Number of pages to map
> > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > + *
> > > > + * This function maps pages of memory for migration usage in GPU SVM. It
> > > > + * iterates over each page frame number provided in @migrate_pfn, maps the
> > > > + * corresponding page, and stores the DMA address in the provided @dma_addr
> > > > + * array.
> > > > + *
> > > > + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> > > > + */
> > > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > > +					dma_addr_t *dma_addr,
> > > > +					long unsigned int *migrate_pfn,
> > > > +					unsigned long npages,
> > > > +					enum dma_data_direction dir)
> > > > +{
> > > > +	unsigned long i;
> > > > +
> > > > +	for (i = 0; i < npages; ++i) {
> > > > +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > > > +
> > > > +		if (!page)
> > > > +			continue;
> > > > +
> > > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > > +			return -EFAULT;
> > > > +
> > > > +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> > > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > > +			return -EFAULT;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> > > > + * @dev: The device for which the pages were mapped
> > > > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > > > + * @npages: Number of pages to unmap
> > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > + *
> > > > + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> > > > + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> > > > + * if it's valid and not already unmapped, and unmaps the corresponding page.
> > > > + */
> > > > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > > > +					   dma_addr_t *dma_addr,
> > > > +					   unsigned long npages,
> > > > +					   enum dma_data_direction dir)
> > > > +{
> > > > +	unsigned long i;
> > > > +
> > > > +	for (i = 0; i < npages; ++i) {
> > > > +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> > > > +			continue;
> > > > +
> > > > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > > > +	}
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + *                   failure of this function.
> > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation. The caller
> > > > + *                   should hold a reference to the VRAM allocation, which
> > > > + *                   should be dropped via ops->vram_allocation or upon the
> > > > + *                   failure of this function.
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function migrates the specified GPU SVM range to VRAM. It performs the
> > > > + * necessary setup and invokes the driver-specific operations for migration to
> > > > + * VRAM. Upon successful return, @vram_allocation can safely reference @range
> > > > + * until ops->vram_release is called which only upon successful return.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > +			       struct drm_gpusvm_range *range,
> > > > +			       void *vram_allocation,
> > > > +			       const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > +	u64 start = range->va.start, end = range->va.end;
> > > > +	struct migrate_vma migrate = {
> > > > +		.start		= start,
> > > > +		.end		= end,
> > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > > > +	};
> > > > +	struct mm_struct *mm = gpusvm->mm;
> > > > +	unsigned long i, npages = npages_in_range(start, end);
> > > > +	struct vm_area_struct *vas;
> > > > +	struct drm_gpusvm_zdd *zdd = NULL;
> > > > +	struct page **pages;
> > > > +	dma_addr_t *dma_addr;
> > > > +	void *buf;
> > > > +	int err;
> > > > +
> > > > +	if (!range->flags.migrate_vram)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram ||
> > > > +	    !gpusvm->ops->copy_to_sram)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	if (!ctx->mmap_locked) {
> > > > +		if (!mmget_not_zero(mm)) {
> > > > +			err = -EFAULT;
> > > > +			goto err_out;
> > > > +		}
> > > > +		mmap_write_lock(mm);
> > > > +	}
> > > > +
> > > > +	mmap_assert_locked(mm);
> > > > +
> > > > +	vas = vma_lookup(mm, start);
> > > > +	if (!vas) {
> > > > +		err = -ENOENT;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > > +		err = -EINVAL;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	if (!vma_is_anonymous(vas)) {
> > > > +		err = -EBUSY;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > +	if (!buf) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > +
> > > > +	zdd = drm_gpusvm_zdd_alloc(range);
> > > > +	if (!zdd) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_free;
> > > > +	}
> > > > +
> > > > +	migrate.vma = vas;
> > > > +	migrate.src = buf;
> > > > +	migrate.dst = migrate.src + npages;
> > > > +
> > > > +	err = migrate_vma_setup(&migrate);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	/*
> > > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > > > +	 * always an error. Need to revisit possible cases and how to handle. We
> > > > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > > > +	 */
> > > > +
> > > > +	if (!migrate.cpages) {
> > > > +		err = -EFAULT;
> > > > +		goto err_free;
> > > > +	}
> > > > +
> > > > +	if (migrate.cpages != npages) {
> > > > +		err = -EBUSY;
> > > > +		goto err_finalize;
> > > > +	}
> > > > +
> > > > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, npages,
> > > > +					     migrate.dst);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +					   migrate.src, npages, DMA_TO_DEVICE);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	for (i = 0; i < npages; ++i) {
> > > > +		struct page *page = pfn_to_page(migrate.dst[i]);
> > > > +
> > > > +		pages[i] = page;
> > > > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > > > +		drm_gpusvm_get_vram_page(page, zdd);
> > > > +	}
> > > > +
> > > > +	err = gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	/* Upon success bind vram allocation to range and zdd */
> > > > +	range->vram_allocation = vram_allocation;
> > > > +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/* Owns ref */
> > > > +
> > > > +err_finalize:
> > > > +	if (err)
> > > > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > +	migrate_vma_pages(&migrate);
> > > > +	migrate_vma_finalize(&migrate);
> > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > +				       DMA_TO_DEVICE);
> > > > +err_free:
> > > > +	if (zdd)
> > > > +		drm_gpusvm_zdd_put(zdd);
> > > > +	kvfree(buf);
> > > > +err_mmunlock:
> > > > +	if (!ctx->mmap_locked) {
> > > > +		mmap_write_unlock(mm);
> > > > +		mmput(mm);
> > > > +	}
> > > > +err_out:
> > > > +	return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a VM area
> > > > + * @vas: Pointer to the VM area structure, can be NULL
> > > > + * @npages: Number of pages to populate
> > > > + * @src_mpfn: Source array of migrate PFNs
> > > > + * @mpfn: Array of migrate PFNs to populate
> > > > + * @addr: Start address for PFN allocation
> > > > + *
> > > > + * This function populates the SRAM migrate page frame numbers (PFNs) for the
> > > > + * specified VM area structure. It allocates and locks pages in the VM area for
> > > > + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> > > > + * alloc_page for allocation.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
> > > > +						unsigned long npages,
> > > > +						unsigned long *src_mpfn,
> > > > +						unsigned long *mpfn, u64 addr)
> > > > +{
> > > > +	unsigned long i;
> > > > +
> > > > +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > > > +		struct page *page;
> > > > +
> > > > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > > +			continue;
> > > > +
> > > > +		if (vas)
> > > > +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > > +		else
> > > > +			page = alloc_page(GFP_HIGHUSER);
> > > > +
> > > > +		if (!page)
> > > > +			return -ENOMEM;
> > > > +
> > > > +		lock_page(page);
> > > > +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + *
> > > > + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap lock and
> > > > + * migration done via migrate_device_* functions. Fallback path as it is
> > > > + * preferred to issue migrations with mmap lock.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> > > > +				    struct drm_gpusvm_range *range)
> > > > +{
> > > > +	unsigned long npages;
> > > > +	struct page **pages;
> > > > +	unsigned long *src, *dst;
> > > > +	dma_addr_t *dma_addr;
> > > > +	void *buf;
> > > > +	int i, err = 0;
> > > > +
> > > > +	npages = npages_in_range(range->va.start, range->va.end);
> > > > +
> > > > +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > +	if (!buf) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_out;
> > > > +	}
> > > > +	src = buf;
> > > > +	dst = buf + (sizeof(*src) * npages);
> > > > +	dma_addr = buf + (2 * sizeof(*src) * npages);
> > > > +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > > > +
> > > > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_allocation,
> > > > +					     npages, src);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	err = migrate_device_vma_range(gpusvm->mm,
> > > > +				       gpusvm->device_private_page_owner, src,
> > > > +				       npages, range->va.start);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	err = drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, dst, 0);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +					   dst, npages, DMA_BIDIRECTIONAL);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	for (i = 0; i < npages; ++i)
> > > > +		pages[i] = migrate_pfn_to_page(src[i]);
> > > > +
> > > > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +err_finalize:
> > > > +	if (err)
> > > > +		drm_gpusvm_migration_put_pages(npages, dst);
> > > > +	migrate_device_pages(src, dst, npages);
> > > > +	migrate_device_finalize(src, dst, npages);
> > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > +				       DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > +	kvfree(buf);
> > > > +err_out:
> > > > +
> > > > +	return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @vas: Pointer to the VM area structure
> > > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > > + * @start: Start address of the migration range
> > > > + * @end: End address of the migration range
> > > > + *
> > > > + * This internal function performs the migration of the specified GPU SVM range
> > > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > > > + * invokes the driver-specific operations for migration to SRAM.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +					struct vm_area_struct *vas,
> > > > +					struct page *page,
> > > > +					u64 start, u64 end)
> > > > +{
> > > > +	struct migrate_vma migrate = {
> > > > +		.vma		= vas,
> > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > +		.fault_page	= page,
> > > > +	};
> > > > +	unsigned long npages;
> > > > +	struct page **pages;
> > > > +	dma_addr_t *dma_addr;
> > > > +	void *buf;
> > > > +	int i, err = 0;
> > > > +
> > > > +	mmap_assert_locked(gpusvm->mm);
> > > > +
> > > > +	/* Corner where VMA area struct has been partially unmapped */
> > > > +	if (start < vas->vm_start)
> > > > +		start = vas->vm_start;
> > > > +	if (end > vas->vm_end)
> > > > +		end = vas->vm_end;
> > > > +
> > > > +	migrate.start = start;
> > > > +	migrate.end = end;
> > > > +	npages = npages_in_range(start, end);
> > > > +
> > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > +	if (!buf) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_out;
> > > > +	}
> > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > +
> > > > +	migrate.vma = vas;
> > > > +	migrate.src = buf;
> > > > +	migrate.dst = migrate.src + npages;
> > > > +
> > > > +	err = migrate_vma_setup(&migrate);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	/* Raced with another CPU fault, nothing to do */
> > > > +	if (!migrate.cpages)
> > > > +		goto err_free;
> > > > +
> > > > +	err = drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> > > > +						   migrate.src, migrate.dst,
> > > > +						   start);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +					   migrate.dst, npages,
> > > > +					   DMA_BIDIRECTIONAL);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +	for (i = 0; i < npages; ++i)
> > > > +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > > > +
> > > > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > > > +	if (err)
> > > > +		goto err_finalize;
> > > > +
> > > > +err_finalize:
> > > > +	if (err)
> > > > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > +	migrate_vma_pages(&migrate);
> > > > +	migrate_vma_finalize(&migrate);
> > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > +				       DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > +	kvfree(buf);
> > > > +err_out:
> > > > +	mmap_assert_locked(gpusvm->mm);
> > > > +
> > > > +	return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to SRAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function initiates the migration of the specified GPU SVM range to
> > > > + * SRAM. It performs necessary checks and invokes the internal migration
> > > > + * function for actual migration.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +			       struct drm_gpusvm_range *range,
> > > > +			       const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > +	u64 start = range->va.start, end = range->va.end;
> > > > +	struct mm_struct *mm = gpusvm->mm;
> > > > +	struct vm_area_struct *vas;
> > > > +	int err;
> > > > +	bool retry = false;
> > > > +
> > > > +	if (!ctx->mmap_locked) {
> > > > +		if (!mmget_not_zero(mm)) {
> > > > +			err = -EFAULT;
> > > > +			goto err_out;
> > > > +		}
> > > > +		if (ctx->trylock_mmap) {
> > > > +			if (!mmap_read_trylock(mm))  {
> > > > +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> > > > +				goto err_mmput;
> > > > +			}
> > > > +		} else {
> > > > +			mmap_read_lock(mm);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	mmap_assert_locked(mm);
> > > > +
> > > > +	/*
> > > > +	 * Loop required to find all VMA area structs for the corner case when
> > > > +	 * VRAM backing has been partially unmapped from MM's address space.
> > > > +	 */
> > > > +again:
> > > > +	vas = find_vma(mm, start);
> > > > +	if (!vas) {
> > > > +		if (!retry)
> > > > +			err = -ENOENT;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	if (end <= vas->vm_start || start >= vas->vm_end) {
> > > > +		if (!retry)
> > > > +			err = -EINVAL;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	err = __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, end);
> > > > +	if (err)
> > > > +		goto err_mmunlock;
> > > > +
> > > > +	if (vas->vm_end < end) {
> > > > +		retry = true;
> > > > +		start = vas->vm_end;
> > > > +		goto again;
> > > > +	}
> > > > +
> > > > +	if (!ctx->mmap_locked) {
> > > > +		mmap_read_unlock(mm);
> > > > +		/*
> > > > +		 * Using mmput_async as this function can be called while
> > > > +		 * holding a dma-resv lock, and a final put can grab the mmap
> > > > +		 * lock, causing a lock inversion.
> > > > +		 */
> > > > +		mmput_async(mm);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_mmunlock:
> > > > +	if (!ctx->mmap_locked)
> > > > +		mmap_read_unlock(mm);
> > > > +err_mmput:
> > > > +	if (!ctx->mmap_locked)
> > > > +		mmput_async(mm);
> > > > +err_out:
> > > > +	return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
> > > > + * @page: Pointer to the page
> > > > + *
> > > > + * This function is a callback used to put the GPU SVM zone device data
> > > > + * associated with a page when it is being released.
> > > > + */
> > > > +static void drm_gpusvm_page_free(struct page *page)
> > > > +{
> > > > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > > > + * @vmf: Pointer to the fault information structure
> > > > + *
> > > > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > > > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > > > + * the internal migration function to migrate the range back to RAM.
> > > > + *
> > > > + * Returns:
> > > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > > + */
> > > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > > +{
> > > > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > > > +	int err;
> > > > +
> > > > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > > > +					   vmf->vma, vmf->page,
> > > > +					   zdd->range->va.start,
> > > > +					   zdd->range->va.end);
> > > > +
> > > > +	return err ? VM_FAULT_SIGBUS : 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > > > + */
> > > > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> > > > +	.page_free = drm_gpusvm_page_free,
> > > > +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> > > > +};
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
> > > > + *
> > > > + * Returns:
> > > > + * Pointer to the GPU SVM device page map operations structure.
> > > > + */
> > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > > > +{
> > > > +	return &drm_gpusvm_pagemap_ops;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
> > > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > > + * @start: Start address
> > > > + * @end: End address
> > > > + *
> > > > + * Returns:
> > > > + * True if GPU SVM has mapping, False otherwise
> > > > + */
> > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
> > > > +{
> > > > +	struct drm_gpusvm_notifier *notifier;
> > > > +
> > > > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > > > +		struct drm_gpusvm_range *range = NULL;
> > > > +
> > > > +		drm_gpusvm_for_each_range(range, notifier, start, end)
> > > > +			return true;
> > > > +	}
> > > > +
> > > > +	return false;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > > new file mode 100644
> > > > index 000000000000..0ea70f8534a8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > > @@ -0,0 +1,415 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __DRM_GPUSVM_H__
> > > > +#define __DRM_GPUSVM_H__
> > > > +
> > > > +#include <linux/kref.h>
> > > > +#include <linux/mmu_notifier.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +struct dev_pagemap_ops;
> > > > +struct drm_device;
> > > > +struct drm_gpusvm;
> > > > +struct drm_gpusvm_notifier;
> > > > +struct drm_gpusvm_ops;
> > > > +struct drm_gpusvm_range;
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > > > + *
> > > > + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> > > > + * These operations are provided by the GPU driver to manage SVM ranges and
> > > > + * perform operations such as migration between VRAM and system RAM.
> > > > + */
> > > > +struct drm_gpusvm_ops {
> > > > +	/**
> > > > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > > > +	 *
> > > > +	 * This function shall allocate a GPU SVM notifier.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> > > > +	 */
> > > > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > > > +
> > > > +	/**
> > > > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > > > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > > > +	 *
> > > > +	 * This function shall free a GPU SVM notifier.
> > > > +	 */
> > > > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > > > +
> > > > +	/**
> > > > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 *
> > > > +	 * This function shall allocate a GPU SVM range.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> > > > +	 */
> > > > +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> > > > +
> > > > +	/**
> > > > +	 * @range_free: Free a GPU SVM range (optional)
> > > > +	 * @range: Pointer to the GPU SVM range to be freed
> > > > +	 *
> > > > +	 * This function shall free a GPU SVM range.
> > > > +	 */
> > > > +	void (*range_free)(struct drm_gpusvm_range *range);
> > > > +
> > > > +	/**
> > > > +	 * @vram_release: Release VRAM allocation (optional)
> > > > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > +	 *
> > > > +	 * This function shall release VRAM allocation and expects to drop a
> > > > +	 * reference to VRAM allocation.
> > > > +	 */
> > > > +	void (*vram_release)(void *vram_allocation);
> > > > +
> > > > +	/**
> > > > +	 * @populate_vram_pfn: Populate VRAM PFN (required for migration)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > +	 * @npages: Number of pages to populate
> > > > +	 * @pfn: Array of page frame numbers to populate
> > > > +	 *
> > > > +	 * This function shall populate VRAM page frame numbers (PFN).
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code on failure.
> > > > +	 */
> > > > +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> > > > +				 void *vram_allocation,
> > > > +				 unsigned long npages,
> > > > +				 unsigned long *pfn);
> > > > +
> > > > +	/**
> > > > +	 * @copy_to_vram: Copy to VRAM (required for migration)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 * @pages: Pointer to array of VRAM pages (destination)
> > > > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > > +	 * @npages: Number of pages to copy
> > > > +	 *
> > > > +	 * This function shall copy pages to VRAM.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code on failure.
> > > > +	 */
> > > > +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> > > > +			    struct page **pages,
> > > > +			    dma_addr_t *dma_addr,
> > > > +			    unsigned long npages);
> > > > +
> > > > +	/**
> > > > +	 * @copy_to_sram: Copy to system RAM (required for migration)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 * @pages: Pointer to array of VRAM pages (source)
> > > > +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> > > > +	 * @npages: Number of pages to copy
> > > > +	 *
> > > > +	 * This function shall copy pages to system RAM.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code on failure.
> > > > +	 */
> > > > +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> > > > +			    struct page **pages,
> > > > +			    dma_addr_t *dma_addr,
> > > > +			    unsigned long npages);
> > > > +
> > > > +	/**
> > > > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > +	 * @notifier: Pointer to the GPU SVM notifier
> > > > +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> > > > +	 *
> > > > +	 * This function shall invalidate the GPU page tables. It can safely
> > > > +	 * walk the notifier range RB tree/list in this function. Called while
> > > > +	 * holding the notifier lock.
> > > > +	 */
> > > > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > > +			   struct drm_gpusvm_notifier *notifier,
> > > > +			   const struct mmu_notifier_range *mmu_range);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> > > > + *
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @notifier: MMU interval notifier
> > > > + * @interval: Interval for the notifier
> > > > + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
> > > > + * @root: Cached root node of the RB tree containing ranges
> > > > + * @range_list: List head containing of ranges in the same order they appear in
> > > > + *              interval tree. This is useful to keep iterating ranges while
> > > > + *              doing modifications to RB tree.
> > > > + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> > > > + *                 removed
> > > > + *
> > > > + * This structure represents a GPU SVM notifier.
> > > > + */
> > > > +struct drm_gpusvm_notifier {
> > > > +	struct drm_gpusvm *gpusvm;
> > > > +	struct mmu_interval_notifier notifier;
> > > > +	struct {
> > > > +		u64 start;
> > > > +		u64 end;
> > > > +	} interval;
> > > > +	struct {
> > > > +		struct rb_node node;
> > > > +		struct list_head entry;
> > > > +		u64 __subtree_last;
> > > > +	} rb;
> > > > +	struct rb_root_cached root;
> > > > +	struct list_head range_list;
> > > > +	struct {
> > > > +		u32 removed : 1;
> > > > +	} flags;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > > > + *
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @notifier: Pointer to the GPU SVM notifier
> > > > + * @refcount: Reference count for the range
> > > > + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
> > > > + * @va: Virtual address range
> > > > + * @notifier_seq: Notifier sequence number of the range's pages
> > > > + * @pages: Pointer to the array of pages (if backing store is in VRAM)
> > > > + * @dma_addr: DMA address array (if backing store is SRAM and DMA mapped)
> > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
> > > > + * @flags.migrate_vram: Flag indicating whether the range can be migrated to VRAM
> > > > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > > > + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> > > > + * @flags.has_vram_pages: Flag indicating if the range has vram pages
> > > > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> > > > + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact allocation based
> > > > + *                       on @order which releases via kfree
> > > > + *
> > > > + * This structure represents a GPU SVM range used for tracking memory ranges
> > > > + * mapped in a DRM device.
> > > > + */
> > > > +struct drm_gpusvm_range {
> > > > +	struct drm_gpusvm *gpusvm;
> > > > +	struct drm_gpusvm_notifier *notifier;
> > > > +	struct kref refcount;
> > > > +	struct {
> > > > +		struct rb_node node;
> > > > +		struct list_head entry;
> > > > +		u64 __subtree_last;
> > > > +	} rb;
> > > > +	struct {
> > > > +		u64 start;
> > > > +		u64 end;
> > > > +	} va;
> > > > +	unsigned long notifier_seq;
> > > > +	union {
> > > > +		struct page **pages;
> > > > +		dma_addr_t *dma_addr;
> > > > +	};
> > > > +	void *vram_allocation;
> > > > +	u16 order;
> > > > +	struct {
> > > > +		/* All flags below must be set upon creation */
> > > > +		u16 migrate_vram : 1;
> > > > +		/* All flags below must be set / cleared under notifier lock */
> > > > +		u16 unmapped : 1;
> > > > +		u16 partial_unmap : 1;
> > > > +		u16 has_vram_pages : 1;
> > > > +		u16 has_dma_mapping : 1;
> > > > +		u16 kfree_mapping : 1;
> > > > +	} flags;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm - GPU SVM structure
> > > > + *
> > > > + * @name: Name of the GPU SVM
> > > > + * @drm: Pointer to the DRM device structure
> > > > + * @mm: Pointer to the mm_struct for the address space
> > > > + * @device_private_page_owner: Device private pages owner
> > > > + * @mm_start: Start address of GPU SVM
> > > > + * @mm_range: Range of the GPU SVM
> > > > + * @notifier_size: Size of individual notifiers
> > > > + * @ops: Pointer to the operations structure for GPU SVM
> > > > + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> > > > + *               Entries should be powers of 2 in descending order.
> > > > + * @num_chunks: Number of chunks
> > > > + * @notifier_lock: Read-write semaphore for protecting notifier operations
> > > > + * @zdd_wq: Workqueue for deferred work on zdd destruction
> > > > + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> > > > + * @notifier_list: list head containing of notifiers in the same order they
> > > > + *                 appear in interval tree. This is useful to keep iterating
> > > > + *                 notifiers while doing modifications to RB tree.
> > > > + *
> > > > + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> > > > + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> > > > + *
> > > > + * No reference counting is provided, as this is expected to be embedded in the
> > > > + * driver VM structure along with the struct drm_gpuvm, which handles reference
> > > > + * counting.
> > > > + */
> > > > +struct drm_gpusvm {
> > > > +	const char *name;
> > > > +	struct drm_device *drm;
> > > > +	struct mm_struct *mm;
> > > > +	void *device_private_page_owner;
> > > > +	u64 mm_start;
> > > > +	u64 mm_range;
> > > > +	u64 notifier_size;
> > > > +	const struct drm_gpusvm_ops *ops;
> > > > +	const u64 *chunk_sizes;
> > > > +	int num_chunks;
> > > > +	struct rw_semaphore notifier_lock;
> > > > +	struct workqueue_struct *zdd_wq;
> > > > +	struct rb_root_cached root;
> > > > +	struct list_head notifier_list;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > > > + *
> > > > + * @mmap_locked: mmap lock is locked
> > > > + * @trylock_mmap: trylock mmap lock, used to avoid locking inversions
> > > > + *                (e.g.dma-revs -> mmap lock)
> > > > + * @in_notifier: entering from a MMU notifier
> > > > + * @read_only: operating on read-only memory
> > > > + * @vram_possible: possible to use VRAM
> > > > + * @prefault: prefault pages
> > > > + *
> > > > + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > > > + */
> > > > +struct drm_gpusvm_ctx {
> > > > +	u32 mmap_locked :1;
> > > > +	u32 trylock_mmap :1;
> > > > +	u32 in_notifier :1;
> > > > +	u32 read_only :1;
> > > > +	u32 vram_possible :1;
> > > > +	u32 prefault :1;
> > > > +};
> > > > +
> > > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > > +		    const char *name, struct drm_device *drm,
> > > > +		    struct mm_struct *mm, void *device_private_page_owner,
> > > > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > > > +		    const struct drm_gpusvm_ops *ops,
> > > > +		    const u64 *chunk_sizes, int num_chunks);
> > > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > > > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> > > > +				u64 gpuva_start, u64 gpuva_end,
> > > > +				const struct drm_gpusvm_ctx *ctx);
> > > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > > +			     struct drm_gpusvm_range *range);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > > > +
> > > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > > +				  struct drm_gpusvm_range *range);
> > > > +
> > > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > > +			       struct drm_gpusvm_range *range,
> > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > +				  struct drm_gpusvm_range *range,
> > > > +				  const struct drm_gpusvm_ctx *ctx);
> > > > +
> > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > +			       struct drm_gpusvm_range *range,
> > > > +			       void *vram_allocation,
> > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +			       struct drm_gpusvm_range *range,
> > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > +
> > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > > > +
> > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > + *
> > > > + * Abstract client usage GPU SVM notifier lock, take lock
> > > > + */
> > > > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > > > +	down_read(&(gpusvm__)->notifier_lock)
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > + *
> > > > + * Abstract client usage GPU SVM notifier lock, drop lock
> > > > + */
> > > > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > > > +	up_read(&(gpusvm__)->notifier_lock)
> > > > +
> > > > +/**
> > > > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> > > > + * @range: a pointer to the current GPU SVM range
> > > > + *
> > > > + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> > > > + *         current range is the last one or if the input range is NULL.
> > > > + */
> > > > +static inline struct drm_gpusvm_range *
> > > > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > > > +{
> > > > +	if (range && !list_is_last(&range->rb.entry,
> > > > +				   &range->notifier->range_list))
> > > > +		return list_next_entry(range, rb.entry);
> > > > +
> > > > +	return NULL;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> > > > + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> > > > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> > > > + * @notifier__: Pointer to the GPU SVM notifier
> > > > + * @start__: Start address of the range
> > > > + * @end__: End address of the range
> > > > + *
> > > > + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> > > > + * to use while holding the driver SVM lock or the notifier lock.
> > > > + */
> > > > +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> > > > +	for ((range__) = (range__) ?:					\
> > > > +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> > > > +	     (range__) && (range__->va.start < (end__));		\
> > > > +	     (range__) = __drm_gpusvm_range_next(range__))
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> > > > + * @range: Pointer to the GPU SVM range structure.
> > > > + * @mmu_range: Pointer to the MMU notifier range structure.
> > > > + *
> > > > + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> > > > + * if the range partially falls within the provided MMU notifier range.
> > > > + */
> > > > +static inline void
> > > > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > > > +			      const struct mmu_notifier_range *mmu_range)
> > > > +{
> > > > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > > > +
> > > > +	range->flags.unmapped = true;
> > > > +	if (range->va.start < mmu_range->start ||
> > > > +	    range->va.end > mmu_range->end)
> > > > +		range->flags.partial_unmap = true;
> > > > +}
> > > > +
> > > > +#endif /* __DRM_GPUSVM_H__ */
> > > > -- 
> > > > 2.34.1
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
