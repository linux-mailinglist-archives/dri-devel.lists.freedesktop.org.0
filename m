Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD23AB2F6DB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BEE10E944;
	Thu, 21 Aug 2025 11:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XuDbmp0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28410E93E;
 Thu, 21 Aug 2025 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755776225;
 bh=vTIYuqFFI4lufFZfI23A07GetKlFA8GCweCd9qK6Ro0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XuDbmp0PP5xX0tZW7+Mbj0yv6W+PwUq5hd7UoOaCmWS9ADwhLPFD6qfKWbXCa288J
 teGG1gjZW4wCb9yXtIjjal6au7K+WjHWEujL07gB6ILVMB1zz4JSdcCT4u+nbSxSLR
 hEYuxGX8uQCljyW7zOIoppotCG67ajl9llCITO8jIr9dQRaOeFYdFJldcrY0uS07X7
 mVzkxhHKy4BgNqd2HR/UO5Fg8qRK7Ms6T1o092SiM5J4Nhlh1sRQ3wuv/KVvwgJfgr
 HKg3Wv+TYlORHLF5KW7kagiAWgQPlaj7NtQ5sBJbEPhjKfs1JzPqmkV0B4xP5rdkHr
 9ahW0JG6F3moQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EA87217E0DE3;
 Thu, 21 Aug 2025 13:37:04 +0200 (CEST)
Date: Thu, 21 Aug 2025 13:36:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev, Asahi Lina
 <lina@asahilina.net>
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
Message-ID: <20250821133659.5e7d0cd2@fedora>
In-Reply-To: <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-2-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Fri, 11 Jul 2025 14:30:21 +0100
Steven Price <steven.price@arm.com> wrote:

> On 07/07/2025 18:04, Caterina Shablia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Move the lock/flush_mem operations around the gpuvm_sm_map() calls so
> > we can implement true atomic page updates, where any access in the
> > locked range done by the GPU has to wait for the page table updates
> > to land before proceeding.
> > 
> > This is needed for vkQueueBindSparse(), so we can replace the dummy
> > page mapped over the entire object by actual BO backed pages in an atomic
> > way.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 65 +++++++++++++++++++++++++--
> >  1 file changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index b39ea6acc6a9..9caaba03c5eb 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -387,6 +387,15 @@ struct panthor_vm {
> >  	 * flagged as faulty as a result.
> >  	 */
> >  	bool unhandled_fault;
> > +
> > +	/** @locked_region: Information about the currently locked region currently. */
> > +	struct {
> > +		/** @locked_region.start: Start of the locked region. */
> > +		u64 start;
> > +
> > +		/** @locked_region.size: Size of the locked region. */
> > +		u64 size;
> > +	} locked_region;
> >  };
> >  
> >  /**
> > @@ -775,6 +784,10 @@ int panthor_vm_active(struct panthor_vm *vm)
> >  	}
> >  
> >  	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> > +	if (!ret && vm->locked_region.size) {
> > +		lock_region(ptdev, vm->as.id, vm->locked_region.start, vm->locked_region.size);
> > +		ret = wait_ready(ptdev, vm->as.id);
> > +	}  
> 
> Do we need to do this? It seems odd to restore a MMU context and
> immediately set a lock region. Is there a good reason we can't just
> WARN_ON if there's a lock region set in panthor_vm_idle()?
> 
> I think we need to briefly take vm->op_lock to ensure synchronisation
> but that doesn't seem a big issue. Or perhaps there's a good reason that
> I'm missing?

Hm, I wish I had written a big fat comment along this change, because
indeed, it seems simpler to take the op_lock to ensure any in-flight PT
update is flushed before we make the AS active, and I definitely don't
remember why I didn't do that. Could be some locking order inversion of
some sort between the slot lock, or maybe I overthought this at the
time. In any case, it looks like it's worth a try.

> 
> >  
> >  out_make_active:
> >  	if (!ret) {
> > @@ -902,6 +915,9 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
> >  	struct io_pgtable_ops *ops = vm->pgtbl_ops;
> >  	u64 offset = 0;
> >  
> > +	drm_WARN_ON(&ptdev->base,
> > +		    (iova < vm->locked_region.start) ||
> > +		    (iova + size > vm->locked_region.start + vm->locked_region.size));
> >  	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
> >  
> >  	while (offset < size) {
> > @@ -915,13 +931,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
> >  				iova + offset + unmapped_sz,
> >  				iova + offset + pgsize * pgcount,
> >  				iova, iova + size);
> > -			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);
> >  			return  -EINVAL;
> >  		}
> >  		offset += unmapped_sz;
> >  	}
> >  
> > -	return panthor_vm_flush_range(vm, iova, size);
> > +	return 0;
> >  }
> >  
> >  static int
> > @@ -938,6 +953,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
> >  	if (!size)
> >  		return 0;
> >  
> > +	drm_WARN_ON(&ptdev->base,
> > +		    (iova < vm->locked_region.start) ||
> > +		    (iova + size > vm->locked_region.start + vm->locked_region.size));
> > +
> >  	for_each_sgtable_dma_sg(sgt, sgl, count) {
> >  		dma_addr_t paddr = sg_dma_address(sgl);
> >  		size_t len = sg_dma_len(sgl);
> > @@ -985,7 +1004,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
> >  		offset = 0;
> >  	}
> >  
> > -	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
> > +	return 0;
> >  }
> >  
> >  static int flags_to_prot(u32 flags)
> > @@ -1654,6 +1673,38 @@ static const char *access_type_name(struct panthor_device *ptdev,
> >  	}
> >  }
> >  
> > +static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
> > +{
> > +	struct panthor_device *ptdev = vm->ptdev;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&ptdev->mmu->as.slots_lock);
> > +	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
> > +	vm->locked_region.start = start;
> > +	vm->locked_region.size = size;
> > +	if (vm->as.id >= 0) {
> > +		lock_region(ptdev, vm->as.id, start, size);
> > +		ret = wait_ready(ptdev, vm->as.id);
> > +	}
> > +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void panthor_vm_unlock_region(struct panthor_vm *vm)
> > +{
> > +	struct panthor_device *ptdev = vm->ptdev;
> > +
> > +	mutex_lock(&ptdev->mmu->as.slots_lock);
> > +	if (vm->as.id >= 0) {
> > +		write_cmd(ptdev, vm->as.id, AS_COMMAND_FLUSH_MEM);
> > +		drm_WARN_ON(&ptdev->base, wait_ready(ptdev, vm->as.id));
> > +	}
> > +	vm->locked_region.start = 0;
> > +	vm->locked_region.size = 0;
> > +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > +}  
> 
> Do we need to include a drm_dev_enter() somewhere here? I note that
> panthor_vm_flush_range() has one and you've effectively replaced that
> code with the above.
> 
> Thanks,
> Steve
> 
> > +
> >  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  {
> >  	bool has_unhandled_faults = false;
> > @@ -2179,6 +2230,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
> >  
> >  	mutex_lock(&vm->op_lock);
> >  	vm->op_ctx = op;
> > +
> > +	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
> > +	if (ret)
> > +		goto out;
> > +
> >  	switch (op_type) {
> >  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> >  		if (vm->unusable) {
> > @@ -2199,6 +2255,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
> >  		break;
> >  	}
> >  
> > +	panthor_vm_unlock_region(vm);
> > +
> > +out:
> >  	if (ret && flag_vm_unusable_on_failure)
> >  		vm->unusable = true;
> >    
> 

