Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1685A68E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19C10E3B2;
	Mon, 19 Feb 2024 14:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB4D310E39D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:54:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1768FEC;
 Mon, 19 Feb 2024 06:55:32 -0800 (PST)
Received: from [10.57.67.95] (unknown [10.57.67.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FF7C3F762;
 Mon, 19 Feb 2024 06:54:50 -0800 (PST)
Message-ID: <33ce3e11-57fd-4d6d-b441-18f681942b90@arm.com>
Date: Mon, 19 Feb 2024 14:54:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] drm/panthor: Add the MMU/VM logical block
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Grant Likely <grant.likely@linaro.org>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
 <20240218214131.3035480-8-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240218214131.3035480-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2024 21:41, Boris Brezillon wrote:
> MMU and VM management is related and placed in the same source file.
> 
> Page table updates are delegated to the io-pgtable-arm driver that's in
> the iommu subsystem.
> 
> The VM management logic is based on drm_gpuva_mgr, and is assuming the
> VA space is mostly managed by the usermode driver, except for a reserved
> portion of this VA-space that's used for kernel objects (like the heap
> contexts/chunks).
> 
> Both asynchronous and synchronous VM operations are supported, and
> internal helpers are exposed to allow other logical blocks to map their
> buffers in the GPU VA space.
> 
> There's one VM_BIND queue per-VM (meaning the Vulkan driver can only
> expose one sparse-binding queue), and this bind queue is managed with
> a 1:1 drm_sched_entity:drm_gpu_scheduler, such that each VM gets its own
> independent execution queue, avoiding VM operation serialization at the
> device level (things are still serialized at the VM level).
> 
> The rest is just implementation details that are hopefully well explained
> in the documentation.
> 
> v5:
> - Fix a double panthor_vm_cleanup_op_ctx() call
> - Fix a race between panthor_vm_prepare_map_op_ctx() and
>   panthor_vm_bo_put()
> - Fix panthor_vm_pool_destroy_vm() kernel doc
> - Fix paddr adjustment in panthor_vm_map_pages()
> - Fix bo_offset calculation in panthor_vm_get_bo_for_va()
> 
> v4:
> - Add an helper to return the VM state
> - Check drmm_mutex_init() return code
> - Remove the VM from the AS reclaim list when panthor_vm_active() is
>   called
> - Count the number of active VM users instead of considering there's
>   at most one user (several scheduling groups can point to the same
>   vM)
> - Pre-allocate a VMA object for unmap operations (unmaps can trigger
>   a sm_step_remap() call)
> - Check vm->root_page_table instead of vm->pgtbl_ops to detect if
>   the io-pgtable is trying to allocate the root page table
> - Don't memset() the va_node in panthor_vm_alloc_va(), make it a
>   caller requirement
> - Fix the kernel doc in a few places
> - Drop the panthor_vm::base offset constraint and modify
>   panthor_vm_put() to explicitly check for a NULL value
> - Fix unbalanced vm_bo refcount in panthor_gpuva_sm_step_remap()
> - Drop stale comments about the shared_bos list
> - Patch mmu_features::va_bits on 32-bit builds to reflect the
>   io_pgtable limitation and let the UMD know about it
> 
> v3:
> - Add acks for the MIT/GPL2 relicensing
> - Propagate MMU faults to the scheduler
> - Move pages pinning/unpinning out of the dma_signalling path
> - Fix 32-bit support
> - Rework the user/kernel VA range calculation
> - Make the auto-VA range explicit (auto-VA range doesn't cover the full
>   kernel-VA range on the MCU VM)
> - Let callers of panthor_vm_alloc_va() allocate the drm_mm_node
>   (embedded in panthor_kernel_bo now)
> - Adjust things to match the latest drm_gpuvm changes (extobj tracking,
>   resv prep and more)
> - Drop the per-AS lock and use slots_lock (fixes a race on vm->as.id)
> - Set as.id to -1 when reusing an address space from the LRU list
> - Drop misleading comment about page faults
> - Remove check for irq being assigned in panthor_mmu_unplug()
> 
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Stev

