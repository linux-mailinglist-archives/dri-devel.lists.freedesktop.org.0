Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53D3A13FE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 14:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACEF89CCB;
	Wed,  9 Jun 2021 12:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233F389CB8;
 Wed,  9 Jun 2021 12:15:03 +0000 (UTC)
IronPort-SDR: mFw/mOY5A/TkivdYlDtyKXcwqbsGNzYcL6NeCM4xJ4NvDnrPs4Lrw+puVpWGzugrrroQYyOZEV
 jbGZcZJyKkiw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192167988"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="192167988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:15:00 -0700
IronPort-SDR: +tc7uyAjgI3A/3AjsGjEV93za3312+NOv4b6IbqOEThxtPS2kj+7/tLlhzDgd4UeGjdj7mMx/Z
 fGWLFJdBoGcQ==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419259781"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:14:58 -0700
Subject: Re: [PATCH v2 7/9] drm/i915/gt: Pipelined page migration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-8-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <718575f5-d681-c904-f607-43351d25b01a@intel.com>
Date: Wed, 9 Jun 2021 13:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 07:34, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If we pipeline the PTE updates and then do the copy of those pages
> within a single unpreemptible command packet, we can submit the copies
> and leave them to be scheduled without having to synchronously wait
> under a global lock. In order to manage migration, we need to
> preallocate the page tables (and keep them pinned and available for use
> at any time), causing a bottleneck for migrations as all clients must
> contend on the limited resources. By inlining the ppGTT updates and
> performing the blit atomically, each client only owns the PTE while in
> use, and so we can reschedule individual operations however we see fit.
> And most importantly, we do not need to take a global lock on the shared
> vm, and wait until the operation is complete before releasing the lock
> for others to claim the PTE for themselves.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Add a TODO for huge LMEM ptes (Pointed out by Matthew Auld)
> - Use intel_engine_destroy_pinned_context() to properly take the pinned
>    context timeline off the engine list. (CI warning).
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/gt/intel_engine.h        |   1 +
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 544 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_migrate.h       |  45 ++
>   drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
>   drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 291 ++++++++++
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>   9 files changed, 901 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 16a5a006cf7c..95bd38e84625 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -108,6 +108,7 @@ gt-y += \
>   	gt/intel_gtt.o \
>   	gt/intel_llc.o \
>   	gt/intel_lrc.o \
> +	gt/intel_migrate.o \
>   	gt/intel_mocs.o \
>   	gt/intel_ppgtt.o \
>   	gt/intel_rc6.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 36ea9eb52bb5..62f7440bc111 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -188,6 +188,7 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>   #define I915_GEM_HWS_PREEMPT_ADDR	(I915_GEM_HWS_PREEMPT * sizeof(u32))
>   #define I915_GEM_HWS_SEQNO		0x40
>   #define I915_GEM_HWS_SEQNO_ADDR		(I915_GEM_HWS_SEQNO * sizeof(u32))
> +#define I915_GEM_HWS_MIGRATE		(0x42 * sizeof(u32))
>   #define I915_GEM_HWS_SCRATCH		0x80
>   
>   #define I915_HWS_CSB_BUF0_INDEX		0x10
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 2694dbb9967e..1c3af0fc0456 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -123,8 +123,10 @@
>   #define   MI_SEMAPHORE_SAD_NEQ_SDD	(5 << 12)
>   #define   MI_SEMAPHORE_TOKEN_MASK	REG_GENMASK(9, 5)
>   #define   MI_SEMAPHORE_TOKEN_SHIFT	5
> +#define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>   #define MI_STORE_DWORD_IMM	MI_INSTR(0x20, 1)
>   #define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
> +#define MI_STORE_QWORD_IMM_GEN8 (MI_INSTR(0x20, 3) | REG_BIT(21))
>   #define   MI_MEM_VIRTUAL	(1 << 22) /* 945,g33,965 */
>   #define   MI_USE_GGTT		(1 << 22) /* g4x+ */
>   #define MI_STORE_DWORD_INDEX	MI_INSTR(0x21, 1)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> new file mode 100644
> index 000000000000..70776316863d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -0,0 +1,544 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_context.h"
> +#include "intel_gpu_commands.h"
> +#include "intel_gt.h"
> +#include "intel_gtt.h"
> +#include "intel_migrate.h"
> +#include "intel_ring.h"
> +
> +struct insert_pte_data {
> +	u64 offset;
> +	bool is_lmem;
> +};
> +
> +#define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> +
> +static bool engine_supports_migration(struct intel_engine_cs *engine)
> +{
> +	if (!engine)
> +		return false;
> +
> +	/*
> +	 * We need the ability to prevent aribtration (MI_ARB_ON_OFF),
> +	 * the ability to write PTE using inline data (MI_STORE_DATA)
> +	 * and of course the ability to do the block transfer (blits).
> +	 */
> +	GEM_BUG_ON(engine->class != COPY_ENGINE_CLASS);
> +
> +	return true;
> +}
> +
> +static void insert_pte(struct i915_address_space *vm,
> +		       struct i915_page_table *pt,
> +		       void *data)
> +{
> +	struct insert_pte_data *d = data;
> +
> +	vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
> +			d->is_lmem ? PTE_LM : 0);
> +	d->offset += PAGE_SIZE;
> +}
> +
> +static struct i915_address_space *migrate_vm(struct intel_gt *gt)
> +{
> +	struct i915_vm_pt_stash stash = {};
> +	struct i915_ppgtt *vm;
> +	int err;
> +	int i;
> +
> +	/*
> +	 * We construct a very special VM for use by all migration contexts,
> +	 * it is kept pinned so that it can be used at any time. As we need
> +	 * to pre-allocate the page directories for the migration VM, this
> +	 * limits us to only using a small number of prepared vma.
> +	 *
> +	 * To be able to pipeline and reschedule migration operations while
> +	 * avoiding unnecessary contention on the vm itself, the PTE updates
> +	 * are inline with the blits. All the blits use the same fixed
> +	 * addresses, with the backing store redirection being updated on the
> +	 * fly. Only 2 implicit vma are used for all migration operations.
> +	 *
> +	 * We lay the ppGTT out as:
> +	 *
> +	 *	[0, CHUNK_SZ) -> first object
> +	 *	[CHUNK_SZ, 2 * CHUNK_SZ) -> second object
> +	 *	[2 * CHUNK_SZ, 2 * CHUNK_SZ + 2 * CHUNK_SZ >> 9] -> PTE
> +	 *
> +	 * By exposing the dma addresses of the page directories themselves
> +	 * within the ppGTT, we are then able to rewrite the PTE prior to use.
> +	 * But the PTE update and subsequent migration operation must be atomic,
> +	 * i.e. within the same non-preemptible window so that we do not switch
> +	 * to another migration context that overwrites the PTE.
> +	 *
> +	 * TODO: Add support for huge LMEM PTEs
> +	 */
> +
> +	vm = i915_ppgtt_create(gt);
> +	if (IS_ERR(vm))
> +		return ERR_CAST(vm);
> +
> +	if (!vm->vm.allocate_va_range || !vm->vm.foreach) {
> +		err = -ENODEV;
> +		goto err_vm;
> +	}
> +
> +	/*
> +	 * Each engine instance is assigned its own chunk in the VM, so
> +	 * that we can run multiple instances concurrently
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(gt->engine_class[COPY_ENGINE_CLASS]); i++) {
> +		struct intel_engine_cs *engine;
> +		u64 base = (u64)i << 32;
> +		struct insert_pte_data d = {};
> +		struct i915_gem_ww_ctx ww;
> +		u64 sz;
> +
> +		engine = gt->engine_class[COPY_ENGINE_CLASS][i];
> +		if (!engine_supports_migration(engine))
> +			continue;
> +
> +		/*
> +		 * We copy in 8MiB chunks. Each PDE covers 2MiB, so we need
> +		 * 4x2 page directories for source/destination.
> +		 */
> +		sz = 2 * CHUNK_SZ;
> +		d.offset = base + sz;
> +
> +		/*
> +		 * We need another page directory setup so that we can write
> +		 * the 8x512 PTE in each chunk.
> +		 */
> +		sz += (sz >> 12) * sizeof(u64);

That was quite the mind warp.

> +
> +		err = i915_vm_alloc_pt_stash(&vm->vm, &stash, sz);
> +		if (err)
> +			goto err_vm;
> +
> +		for_i915_gem_ww(&ww, err, true) {
> +			err = i915_vm_lock_objects(&vm->vm, &ww);
> +			if (err)
> +				continue;
> +			err = i915_vm_map_pt_stash(&vm->vm, &stash);
> +			if (err)
> +				continue;
> +
> +			vm->vm.allocate_va_range(&vm->vm, &stash, base, base + sz);

I think here we meant:
allocate_va_range(.., base, sz)

Otherwise this might explode for instance > 0? Since the preallocated 
stash is too small.

> +		}
> +		i915_vm_free_pt_stash(&vm->vm, &stash);
> +		if (err)
> +			goto err_vm;
> +
> +		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
> +		d.is_lmem = i915_gem_object_is_lmem(vm->vm.scratch[0]);
> +		vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
> +	}
> +
> +	return &vm->vm;
> +
> +err_vm:
> +	i915_vm_put(&vm->vm);
> +	return ERR_PTR(err);
> +}
> +
