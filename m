Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DA82D804
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99D610E246;
	Mon, 15 Jan 2024 11:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F9210E246
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705316658;
 bh=8ebdJ2RDfFjh3AOlpVeHvBi2GYeXffCDKZwITuezNy8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iO1Z+PasQb73/Qmjz7+pBByIQpMKvM98U7QJNIyQduHuEMSx9P2nL4RHr8MfSCyeR
 X1Vfi4uuPBh4fr0B+thJg33PfWwtpH+ySs7waAwAoK/IE2NPT64bEEm3VJ82bD0fxp
 5yMpcvdLXSL6LPzbL8zGiwL5C7ZIqnMbJ1A2/mSuR+aUSZFQbgBSv9YyxEPj0/QZH9
 lMfR/Az5sZKYlLQgZhpPban062mu9wWU/bHJXDbJDONIQAoT9VaJHZv8bbC1IwsI8Y
 /QupCSLEoAGpri5pxnxvGi/FI5bWGrm4UjsEZ5Jp2ek+Qzo5YEgeGZpaGLlduLLWVP
 C5CjE98ybTKzg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 35207378134F;
 Mon, 15 Jan 2024 11:04:17 +0000 (UTC)
Date: Mon, 15 Jan 2024 12:04:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240115120415.14ed001c@collabora.com>
In-Reply-To: <99adc768-662a-4ebc-b305-cac5e2789bab@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-8-boris.brezillon@collabora.com>
 <99adc768-662a-4ebc-b305-cac5e2789bab@arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,

On Fri, 8 Dec 2023 14:28:05 +0000
Steven Price <steven.price@arm.com> wrote:

> > +/**
> > + * alloc_pt() - Custom page table allocator
> > + * @cookie: Cookie passed at page table allocation time.
> > + * @size: Size of the page table. This size should be fixed,
> > + * and determined at creation time based on the granule size.
> > + * @gfp: GFP flags.
> > + *
> > + * We want a custom allocator so we can use a cache for page table
> > + * allocations and amortize the cost of the over-reservation that's
> > + * done to allow asynchronous VM operations.
> > + *
> > + * Return: non-NULL on success, NULL if the allocation failed for any
> > + * reason.
> > + */
> > +static void *alloc_pt(void *cookie, size_t size, gfp_t gfp)
> > +{
> > +	struct panthor_vm *vm = cookie;
> > +	void *page;
> > +
> > +	/* Allocation of the root page table happening during init. */
> > +	if (unlikely(!vm->pgtbl_ops)) {  
> 
> I'm not that keen on using pgtbl_ops as the proxy for this. Can we use
> root_page_table instead?

Definitely, I actually intended to test ->root_page_table when I
introduced this field, but somehow forgot to update this part of the
code.

> 
> At the moment if the IOMMU code ever did multiple allocations during
> alloc_io_pgtable_ops() then we'd overwrite root_page_table and screw up
> on the free path.
> 
> If we use root_page_table == NULL as the check then things will
> 'cleanly' fail by falling through to the non-root case in that case.
> 
> Of course this really looks like we should have had a different
> allocator for the root table but I'm not (re)opening that can of worms! ;)
> 
> And of course it doesn't make any sense for the IOMMU code to do
> multiple allocations so this is all rather academic - but maybe one day
> there will be a different page table structure (16K pages maybe?).
> 
> > +		struct page *p;
> > +
> > +		drm_WARN_ON(&vm->ptdev->base, vm->op_ctx);
> > +		p = alloc_pages_node(dev_to_node(vm->ptdev->base.dev),
> > +				     gfp | __GFP_ZERO, get_order(size));
> > +		page = p ? page_address(p) : NULL;
> > +		vm->root_page_table = page;
> > +		return page;
> > +	}
> > +
> > +	/* We're not supposed to have anything bigger than 4k here, because we picked a
> > +	 * 4k granule size at init time.
> > +	 */
> > +	if (drm_WARN_ON(&vm->ptdev->base, size != SZ_4K))
> > +		return NULL;
> > +
> > +	/* We must have some op_ctx attached to the VM and it must have at least one
> > +	 * free page.
> > +	 */
> > +	if (drm_WARN_ON(&vm->ptdev->base, !vm->op_ctx) ||
> > +	    drm_WARN_ON(&vm->ptdev->base,
> > +			vm->op_ctx->rsvd_page_tables.ptr >= vm->op_ctx->rsvd_page_tables.count))
> > +		return NULL;
> > +
> > +	page = vm->op_ctx->rsvd_page_tables.pages[vm->op_ctx->rsvd_page_tables.ptr++];
> > +	memset(page, 0, SZ_4K);
> > +
> > +	/* Page table entries don't use virtual addresses, which trips out
> > +	 * kmemleak. kmemleak_alloc_phys() might work, but physical addresses
> > +	 * are mixed with other fields, and I fear kmemleak won't detect that
> > +	 * either.
> > +	 *
> > +	 * Let's just ignore memory passed to the page-table driver for now.
> > +	 */
> > +	kmemleak_ignore(page);
> > +	return page;
> > +}
> > +
> > +/**
> > + * @free_pt() - Custom page table free function
> > + * @cookie: Cookie passed at page table allocation time.
> > + * @data: Page table to free.
> > + * @size: Size of the page table. This size should be fixed,
> > + * and determined at creation time based on the granule size.
> > + */
> > +static void free_pt(void *cookie, void *data, size_t size)
> > +{
> > +	struct panthor_vm *vm = cookie;
> > +
> > +	if (unlikely(vm->root_page_table == data)) {
> > +		free_pages((unsigned long)data, get_order(size));  
> 
> Maybe add "vm->root_page_table = NULL;"?

Sure.

> 
> > +		return;
> > +	}

[...]

> > +/**
> > + * panthor_vm_alloc_va() - Allocate a region in the auto-va space
> > + * @VM: VM to allocate a region on.
> > + * @size: Size of the region.  
> 
> kerneldoc needs updating for the new arguments.

Will fix.

> 
> > + *
> > + * Some GPU objects, like heap chunks, are fully managed by the kernel and
> > + * need to be mapped to the userspace VM, in the region reserved for kernel
> > + * objects.
> > + *
> > + * This function takes care of allocating a region in this reserved space.
> > + *
> > + * Return: A valid pointer on success, and ERR_PTR() otherwise.  
> 
> Returns an error code not a pointer.

And that too.

> 
> > + */
> > +int
> > +panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
> > +		    struct drm_mm_node *va_node)
> > +{
> > +	int ret;
> > +
> > +	if (!size || (size & ~PAGE_MASK))
> > +		return -EINVAL;
> > +
> > +	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&vm->mm_lock);
> > +	if (va != PANTHOR_VM_KERNEL_AUTO_VA) {
> > +		memset(va_node, 0, sizeof(*va_node));  
> 
> This memset() seems redundant.

If we assume the va_node is initialized to zero, it's indeed redundant.
I'll update the doc to make this a caller requirement.

> I certainly can't see why it's only
> required on this path.

drm_mm_insert_node_in_range() seems to assign all fields explicitly,
while, according to the doc [1], drm_mm_reserve_node() wants the caller
to make sure the struct is zero-initialized, except for the start and
size fields.

> 
> > +		va_node->start = va;
> > +		va_node->size = size;
> > +		ret = drm_mm_reserve_node(&vm->mm, va_node);
> > +	} else {
> > +		ret = drm_mm_insert_node_in_range(&vm->mm, va_node, size,
> > +						  size >= SZ_2M ? SZ_2M : SZ_4K,
> > +						  0, vm->kernel_auto_va.start,
> > +						  vm->kernel_auto_va.end,
> > +						  DRM_MM_INSERT_BEST);
> > +	}
> > +	mutex_unlock(&vm->mm_lock);
> > +
> > +	return ret;
> > +}

[...]

> > +/*
> > + * Only 32 VMs per open file. If that becomes a limiting factor, we can
> > + * increase this number.
> > + */
> > +#define PANTHOR_MAX_VMS_PER_FILE	32
> > +
> > +/**
> > + * panthor_vm_pool_create_vm() - Create a VM
> > + * @pool: The VM to create this VM on.
> > + * @kernel_va_start: Start of the region reserved for kernel objects.
> > + * @kernel_va_range: Size of the region reserved for kernel objects.
> > + *
> > + * Return: 0 on success, a negative error code otherwise.  
> 
> Actually returns the (positive) id on success.

Will fix.

> 
> > + */
> > +int panthor_vm_pool_create_vm(struct panthor_device *ptdev,
> > +			      struct panthor_vm_pool *pool,
> > +			      struct drm_panthor_vm_create *args)
> > +{
> > +	u64 kernel_va_start, kernel_va_range;
> > +	struct panthor_vm *vm;
> > +	int ret;
> > +	u32 id;
> > +
> > +	ret = panthor_vm_create_check_args(ptdev, args, &kernel_va_start, &kernel_va_range);
> > +	if (ret)
> > +		return ret;
> > +
> > +	vm = panthor_vm_create(ptdev, false, kernel_va_start, kernel_va_range,
> > +			       kernel_va_start, kernel_va_range);
> > +	if (IS_ERR(vm))
> > +		return PTR_ERR(vm);
> > +
> > +	ret = xa_alloc(&pool->xa, &id, vm,
> > +		       XA_LIMIT(1, PANTHOR_MAX_VMS_PER_FILE), GFP_KERNEL);
> > +
> > +	if (ret) {
> > +		panthor_vm_put(vm);
> > +		return ret;
> > +	}
> > +
> > +	args->user_va_range = kernel_va_start;
> > +	return id;
> > +}

[...]

> > +/**
> > + * panthor_vm_put() - Release a reference on a VM
> > + * @vm: VM to release the reference on. Can be NULL.
> > + */
> > +void panthor_vm_put(struct panthor_vm *vm)
> > +{
> > +	static_assert(offsetof(struct panthor_vm, base) == 0);  
> 
> Yuk! ;)
> 
> I'd prefer:
> 
>   drm_gpuvm_put(vm ? &vm->base : NULL);
> 
> which my compiler turns into the same thing rather than relying on the
> type punning. You can keep the static_assert if you like, but I don't
> like relying on it for correct code generation. Although I'll admit I
> couldn't actually get the compiler to produce incorrect code when I tried.

Sure, I'll pick your suggestion here.

> 
> > +	drm_gpuvm_put(&vm->base);
> > +}

[...]

> > +
> > +/**
> > + * panthor_vm_prepare_mapped_bos_resvs() - Prepare resvs on VM BOs.
> > + * @exec: Locking/preparation context.
> > + * @vm: VM targeted by the GPU job.
> > + * @slot_count: Number of slots to reserve.
> > + *
> > + * GPU jobs assume all BOs bound to the VM at the time the job is submitted
> > + * are available when the job is executed. In order to guarantee that, we
> > + * need to reserve a slot on all BOs mapped to a VM and update this slot with
> > + * the job fence after its submission.
> > + *
> > + * Return: 0 on success, a negative error code otherwise.
> > + */
> > +int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm *vm,
> > +					u32 slot_count)
> > +{
> > +	int ret;
> > +
> > +	/* Acquire the VM lock an reserve a slot for this GPU job. */
> > +	ret = drm_gpuvm_prepare_vm(&vm->base, exec, slot_count);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* VM operations are not protected by the VM resv-lock. We need to
> > +	 * take the op_lock to make sure the shared_bos list is not updated
> > +	 * while we're walking it.
> > +	 */  
> 
> Is the above comment stale? AFAIK the shared_bos list doesn't exist
> anymore and this doesn't appear to relate to anything here.

Oops, indeed. That predates to transition to drm_gpuvm for the VM <-> BO
association.

Thanks for the review!

[1]https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_mm.c#L441
