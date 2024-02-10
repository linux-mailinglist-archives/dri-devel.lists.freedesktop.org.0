Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C4850370
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 09:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2E1124AC;
	Sat, 10 Feb 2024 08:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="w0GM9sFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93E1124AC
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707552128;
 bh=4p6F2FecKQshaJUvb+crm5P3vF55lTubXrhvzQVTIVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=w0GM9sFDIEDj5gB/H14B1VSK2ht6XuGauoC7lO9PnsQmQHuOuDbeVWCBFlDM9fbIM
 +McjwW24Nheu6awk9dSa+qujORTFbkNafdiCD23YP8mCyGUVUZE3Og/B2i7i4GFQ7k
 JKXWzzXr1K1UaRY7TMk+1O8oCTOlwgGstvA6Z5Di9End+njbbZv2RnPbZ7pBJynVmn
 40IrkBcVO6lR0gIMArAWrIcPKoPuDu+0vr3n0Di0lNYPsn2xjTMyMhIqe3rs6Cmcse
 rhkcVW1Qw9dIjxBktJkOcwiiLf02wjZTnncS0ivezwcNamO8Gs/Joz7TBE/LadVHxj
 UKh4szkd6T9hg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FE293780626;
 Sat, 10 Feb 2024 08:02:07 +0000 (UTC)
Date: Sat, 10 Feb 2024 09:02:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, kernel@collabora.com, Heiko Stuebner
 <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>, Grant
 Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240210090206.30e5bdec@collabora.com>
In-Reply-To: <ec4d543c-fad6-4742-b271-eac3c7a829bc@arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-8-boris.brezillon@collabora.com>
 <ec4d543c-fad6-4742-b271-eac3c7a829bc@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,

On Fri, 9 Feb 2024 16:51:46 +0000
Steven Price <steven.price@arm.com> wrote:

> On 22/01/2024 16:30, Boris Brezillon wrote:
> > MMU and VM management is related and placed in the same source file.
> > 
> > Page table updates are delegated to the io-pgtable-arm driver that's in
> > the iommu subsystem.
> > 
> > The VM management logic is based on drm_gpuva_mgr, and is assuming the
> > VA space is mostly managed by the usermode driver, except for a reserved
> > portion of this VA-space that's used for kernel objects (like the heap
> > contexts/chunks).
> > 
> > Both asynchronous and synchronous VM operations are supported, and
> > internal helpers are exposed to allow other logical blocks to map their
> > buffers in the GPU VA space.
> > 
> > There's one VM_BIND queue per-VM (meaning the Vulkan driver can only
> > expose one sparse-binding queue), and this bind queue is managed with
> > a 1:1 drm_sched_entity:drm_gpu_scheduler, such that each VM gets its own
> > independent execution queue, avoiding VM operation serialization at the
> > device level (things are still serialized at the VM level).
> > 
> > The rest is just implementation details that are hopefully well explained
> > in the documentation.  
> 
> panthor_vm_map_pages() looks a bit suspect (see below) and there's a
> kerneldoc header which needs updating. But generally it looks fine.
> 
> > 
> > v4:
> > - Add an helper to return the VM state
> > - Check drmm_mutex_init() return code
> > - Remove the VM from the AS reclaim list when panthor_vm_active() is
> >   called
> > - Count the number of active VM users instead of considering there's
> >   at most one user (several scheduling groups can point to the same
> >   vM)
> > - Pre-allocate a VMA object for unmap operations (unmaps can trigger
> >   a sm_step_remap() call)
> > - Check vm->root_page_table instead of vm->pgtbl_ops to detect if
> >   the io-pgtable is trying to allocate the root page table
> > - Don't memset() the va_node in panthor_vm_alloc_va(), make it a
> >   caller requirement
> > - Fix the kernel doc in a few places
> > - Drop the panthor_vm::base offset constraint and modify
> >   panthor_vm_put() to explicitly check for a NULL value
> > - Fix unbalanced vm_bo refcount in panthor_gpuva_sm_step_remap()
> > - Drop stale comments about the shared_bos list
> > - Patch mmu_features::va_bits on 32-bit builds to reflect the
> >   io_pgtable limitation and let the UMD know about it
> > 
> > v3:
> > - Add acks for the MIT/GPL2 relicensing
> > - Propagate MMU faults to the scheduler
> > - Move pages pinning/unpinning out of the dma_signalling path
> > - Fix 32-bit support
> > - Rework the user/kernel VA range calculation
> > - Make the auto-VA range explicit (auto-VA range doesn't cover the full
> >   kernel-VA range on the MCU VM)
> > - Let callers of panthor_vm_alloc_va() allocate the drm_mm_node
> >   (embedded in panthor_kernel_bo now)
> > - Adjust things to match the latest drm_gpuvm changes (extobj tracking,
> >   resv prep and more)
> > - Drop the per-AS lock and use slots_lock (fixes a race on vm->as.id)
> > - Set as.id to -1 when reusing an address space from the LRU list
> > - Drop misleading comment about page faults
> > - Remove check for irq being assigned in panthor_mmu_unplug()
> > 
> > Co-developed-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> > Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 2760 +++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_mmu.h |  102 +
> >  2 files changed, 2862 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > new file mode 100644
> > index 000000000000..d3ce29cd0662  
> 
> <snip>
> 
> > +static int
> > +panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
> > +		     struct sg_table *sgt, u64 offset, u64 size)
> > +{
> > +	struct panthor_device *ptdev = vm->ptdev;
> > +	unsigned int count;
> > +	struct scatterlist *sgl;
> > +	struct io_pgtable_ops *ops = vm->pgtbl_ops;
> > +	u64 start_iova = iova;
> > +	int ret;
> > +
> > +	if (!size)
> > +		return 0;
> > +
> > +	for_each_sgtable_dma_sg(sgt, sgl, count) {
> > +		dma_addr_t paddr = sg_dma_address(sgl);
> > +		size_t len = sg_dma_len(sgl);
> > +
> > +		if (len <= offset) {
> > +			offset -= len;
> > +			continue;
> > +		}
> > +
> > +		paddr -= offset;  
> 
> Shouldn't that be "+="?

It should definitely be +=. Will fix that in v5.

> 
> > +		len -= offset;
> > +
> > +		if (size >= 0) {  
> 
> size is unsigned... so this is always true!

I'll drop the condition.

> 
> > +			len = min_t(size_t, len, size);
> > +			size -= len;
> > +		}
> > +
> > +		drm_dbg(&ptdev->base, "map: as=%d, iova=%llx, paddr=%pad, len=%zx",
> > +			vm->as.id, iova, &paddr, len);
> > +
> > +		while (len) {
> > +			size_t pgcount, mapped = 0;
> > +			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
> > +
> > +			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
> > +					     GFP_KERNEL, &mapped);
> > +			iova += mapped;
> > +			paddr += mapped;
> > +			len -= mapped;
> > +
> > +			if (drm_WARN_ON(&ptdev->base, !ret && !mapped))
> > +				ret = -ENOMEM;
> > +
> > +			if (ret) {
> > +				/* If something failed, unmap what we've already mapped before
> > +				 * returning. The unmap call is not supposed to fail.
> > +				 */
> > +				drm_WARN_ON(&ptdev->base,
> > +					    panthor_vm_unmap_pages(vm, start_iova,
> > +								   iova - start_iova));
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		if (!size)
> > +			break;
> > +	}
> > +
> > +	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
> > +}
> > +  
> 
> <snip>
> 
> > +static void panthor_vm_destroy(struct panthor_vm *vm)
> > +{
> > +	if (!vm)
> > +		return;
> > +
> > +	vm->destroyed = true;
> > +
> > +	mutex_lock(&vm->heaps.lock);
> > +	panthor_heap_pool_destroy(vm->heaps.pool);
> > +	vm->heaps.pool = NULL;
> > +	mutex_unlock(&vm->heaps.lock);
> > +
> > +	drm_WARN_ON(&vm->ptdev->base,
> > +		    panthor_vm_unmap_range(vm, vm->base.mm_start, vm->base.mm_range));
> > +	panthor_vm_put(vm);
> > +}
> > +
> > +/**
> > + * panthor_vm_destroy() - Destroy a VM.  
>       ^^^^^^^^^^^^^^^^^^ needs updating to the new function name.
> 

And I'll fix the kernel doc.

Thanks,

Boris
