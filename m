Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9077A22C65
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 12:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9626410E0B4;
	Thu, 30 Jan 2025 11:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxMcZ8tK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178F210E03D;
 Thu, 30 Jan 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738235884; x=1769771884;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=613kyMMGMs3HHOgkG0vQJO3qbtFuDPEmnvTM0DdDPqo=;
 b=IxMcZ8tKWD3G97xV25L5i3/iAk2VuyxLI9w/KvZT593YwC5bIDMsBoaF
 otJMZK/gU92BDP69TCO1NBICiHdu//r8LNJvZnJdwEXaT9icnokN2wCLR
 nJ/f9bPhSAMf0jCilbKZS3elgkwejT1zMbw25JMe1CtxrwzUnFUfphZph
 FTeRvFW1/8HaQpR7wKRlQX8H9y0lxmcTTOlYCkT/AAM8NTbCpneHqBD+a
 UOkddyGqOJN+VOCuqKD6CipEbhWJly+pqIPamTmXtFsY9HFvEISvn396S
 bIn3IlV6ByC8+Uj5GrMwj6giY/ZJu8AAAWONwkzarJ4aCGdLznnjgRI1L w==;
X-CSE-ConnectionGUID: e3hir2ZyR2ygetCC76QYhw==
X-CSE-MsgGUID: xfOFzPSGRbeVDlR3gn0Jaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49428414"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="49428414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 03:18:03 -0800
X-CSE-ConnectionGUID: Z2DMT8g/QCiHeqGSi6CIoQ==
X-CSE-MsgGUID: 8gD6nDQAQYu9c8Vz1JE27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109281809"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 03:18:01 -0800
Message-ID: <4cdb6d9a-cf7b-4d2f-b214-c5c53f7b9714@intel.com>
Date: Thu, 30 Jan 2025 11:17:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-7-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250129195212.745731-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29/01/2025 19:51, Matthew Brost wrote:
> This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> sharing of memory between the CPU and GPU, enhancing performance and
> flexibility in GPU computing tasks.
> 
> The patch adds the necessary infrastructure for SVM, including data
> structures and functions for managing SVM ranges and notifiers. It also
> provides mechanisms for allocating, deallocating, and migrating memory
> regions between system RAM and GPU VRAM.
> 
> This is largely inspired by GPUVM.
> 
> v2:
>   - Take order into account in check pages
>   - Clear range->pages in get pages error
>   - Drop setting dirty or accessed bit in get pages (Vetter)
>   - Remove mmap assert for cpu faults
>   - Drop mmap write lock abuse (Vetter, Christian)
>   - Decouple zdd from range (Vetter, Oak)
>   - Add drm_gpusvm_range_evict, make it work with coherent pages
>   - Export drm_gpusvm_evict_to_sram, only use in BO evict path (Vetter)
>   - mmget/put in drm_gpusvm_evict_to_sram
>   - Drop range->vram_alloation variable
>   - Don't return in drm_gpusvm_evict_to_sram until all pages detached
>   - Don't warn on mixing sram and device pages
>   - Update kernel doc
>   - Add coherent page support to get pages
>   - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
>   - Add struct drm_gpusvm_vram and ops (Thomas)
>   - Update the range's seqno if the range is valid (Thomas)
>   - Remove the is_unmapped check before hmm_range_fault (Thomas)
>   - Use drm_pagemap (Thomas)
>   - Drop kfree_mapping (Thomas)
>   - dma mapp pages under notifier lock (Thomas)
>   - Remove ctx.prefault
>   - Remove ctx.mmap_locked
>   - Add ctx.check_pages
>   - s/vram/devmem (Thomas)
> v3:
>   - Fix memory leak drm_gpusvm_range_get_pages
>   - Only migrate pages with same zdd on CPU fault
>   - Loop over al VMAs in drm_gpusvm_range_evict
>   - Make GPUSVM a drm level module
>   - GPL or MIT license
>   - Update main kernel doc (Thomas)
>   - Prefer foo() vs foo for functions in kernel doc (Thomas)
>   - Prefer functions over macros (Thomas)
>   - Use unsigned long vs u64 for addresses (Thomas)
>   - Use standard interval_tree (Thomas)
>   - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)
>   - Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas)
>   - Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
>   - Newlines between functions defs in header file (Thomas)
>   - Drop shall language in driver vfunc kernel doc (Thomas)
>   - Move some static inlines from head to C file (Thomas)
>   - Don't allocate pages under page lock in drm_gpusvm_migrate_populate_ram_pfn (Thomas)
>   - Change check_pages to a threshold
> v4:
>   - Fix NULL ptr deref in drm_gpusvm_migrate_populate_ram_pfn (Thomas, Himal)
>   - Fix check pages threshold
>   - Check for range being unmapped under notifier lock in get pages (Testing)
>   - Fix characters per line
>   - Drop WRITE_ONCE for zdd->devmem_allocation assignment (Thomas)
>   - Use completion for devmem_allocation->detached (Thomas)
>   - Make GPU SVM depend on ZONE_DEVICE (CI)
>   - Use hmm_range_fault for eviction (Thomas)
>   - Drop zdd worker (Thomas)
> 
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---

<snip>

> +/**
> + * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified GPU SVM range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> +				       void *device_private_page_owner,
> +				       struct page *page,
> +				       unsigned long fault_addr,
> +				       unsigned long size)
> +{
> +	struct migrate_vma migrate = {
> +		.vma		= vas,
> +		.pgmap_owner	= device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	= page,
> +	};
> +	struct drm_gpusvm_zdd *zdd;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct device *dev;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	unsigned long start, end;
> +	void *buf;
> +	int i, err = 0;
> +
> +	start = ALIGN_DOWN(fault_addr, size);
> +	end = ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start = vas->vm_start;
> +	if (end > vas->vm_end)
> +		end = vas->vm_end;
> +
> +	migrate.start = start;
> +	migrate.end = end;
> +	npages = npages_in_range(start, end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i = 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page = migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd = page->zone_device_data;
> +	ops = zdd->devmem_allocation->ops;
> +	dev = zdd->devmem_allocation->dev;
> +
> +	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> +						  migrate.src, migrate.dst,
> +						  start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +					   DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> +				       DMA_FROM_DEVICE);

clang for me is throwing:

drivers/gpu/drm/drm_gpusvm.c:2017:7: error: variable 'dev' is used 
uninitialized whenever 'if' condition is true 
[-Werror,-Wsometimes-uninitialized]
  2017 |                 if (!page)
       |                     ^~~~~
drivers/gpu/drm/drm_gpusvm.c:2047:33: note: uninitialized use occurs here
  2047 |         drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
       |                                        ^~~
drivers/gpu/drm/drm_gpusvm.c:2017:3: note: remove the 'if' if its 
condition is always false
  2017 |                 if (!page)
       |                 ^~~~~~~~~~
  2018 |                         goto err_finalize;
       |                         ~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_gpusvm.c:1966:20: note: initialize the variable 
'dev' to silence this warning
  1966 |         struct device *dev;
       |                           ^
       |                            = NULL
1 error generated.
