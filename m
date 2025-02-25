Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD57BA44411
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADECC10E715;
	Tue, 25 Feb 2025 15:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSzw6nbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367E610E710;
 Tue, 25 Feb 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740496470; x=1772032470;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a6fcKRCcSMKDXJTwwhzfzELOJTwdCx1MKrczazoy5rg=;
 b=QSzw6nbAO7oAld7zzBF4Rep7kLZQhe/HqnnIsA5pc/6pGZe2Ldtd5eZQ
 5jEsJbT6GEe6QZDUjI8CUoRCn2yioOwwDg40TlPmZdU8xKEW85kmKInVm
 Ajw8dzmjdUWb2wpKUJE9alnjnOvxI10FixTBN+3zhwDfQbjL3ynyMKbsc
 nrmxPH55cCunASVLm71ym//tP78VZ3k7juebzSGfw7jEYQvf3XBs65L1d
 bN1A7bK1CU06vUWchsJ6JAOzNqhtMyHRq6YyPQSdELyaGyktyuBxwiUmq
 X7ZMWvxOaLKGndtKi+MPXV1tbHI4rBe5xL6gfnuCOiWF9VEBZ6PJshaRM A==;
X-CSE-ConnectionGUID: fDaPsva0T62OnXjNkjCJ/w==
X-CSE-MsgGUID: eeL6x7PHS0eyLwUdbCmuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="28895078"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="28895078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:14:29 -0800
X-CSE-ConnectionGUID: OBfwnLxGQyWcIS2sI1waJw==
X-CSE-MsgGUID: Th7LyYslS9moIfJjVKgUEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116909801"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:14:26 -0800
Message-ID: <bf92727d-8d06-4fd4-9908-cfce46a8afb0@intel.com>
Date: Tue, 25 Feb 2025 15:14:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/32] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-7-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250225044311.3178695-7-matthew.brost@intel.com>
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

On 25/02/2025 04:42, Matthew Brost wrote:
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
> v5:
>   - Select Kconfig deps (CI)
>   - Set device to NULL in __drm_gpusvm_migrate_to_ram (Matt Auld, G.G.)
>   - Drop Thomas's SoB (Thomas)
>   - Add drm_gpusvm_range_start/end/size helpers (Thomas)
>   - Add drm_gpusvm_notifier_start/end/size helpers (Thomas)
>   - Absorb drm_pagemap name changes (Thomas)
>   - Fix driver lockdep assert (Thomas)
>   - Move driver lockdep assert to static function (Thomas)
>   - Assert mmap lock held in drm_gpusvm_migrate_to_devmem (Thomas)
>   - Do not retry forever on eviction (Thomas)
> v6:
>   - Fix drm_gpusvm_get_devmem_page alignment (Checkpatch)
>   - Modify Kconfig (CI)
>   - Compile out lockdep asserts (CI)
> 
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/Kconfig      |    9 +
>   drivers/gpu/drm/Makefile     |    1 +
>   drivers/gpu/drm/drm_gpusvm.c | 2236 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_gpusvm.h     |  507 ++++++++
>   4 files changed, 2753 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>   create mode 100644 include/drm/drm_gpusvm.h
> 

<snip>

> +/**
> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: MMU interval notifier
> + * @itree: Interval tree node for the notifier (inserted in GPU SVM)
> + * @entry: List entry to fast interval tree traversal
> + * @root: Cached root node of the RB tree containing ranges
> + * @range_list: List head containing of ranges in the same order they appear in
> + *              interval tree. This is useful to keep iterating ranges while
> + *              doing modifications to RB tree.

Build is failing here. I think just missing:

+ * @flags: ....

> + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> + *                 removed
> + *
> + * This structure represents a GPU SVM notifier.
> + */
> +struct drm_gpusvm_notifier {
> +	struct drm_gpusvm *gpusvm;
> +	struct mmu_interval_notifier notifier;
> +	struct interval_tree_node itree;
> +	struct list_head entry;
> +	struct rb_root_cached root;
> +	struct list_head range_list;
> +	struct {
> +		u32 removed : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
> + * @entry: List entry to fast interval tree traversal
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @dma_addr: Device address array
> + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> + *            Note this is assuming only one drm_pagemap per range is allowed.

Same here:

+ * @flags: ....

> + * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> + * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> + *
> + * This structure represents a GPU SVM range used for tracking memory ranges
> + * mapped in a DRM device.
> + */
