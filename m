Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A55A0B19A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FE810E5CA;
	Mon, 13 Jan 2025 08:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB4F210E5C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:46:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB0631424;
 Mon, 13 Jan 2025 00:47:07 -0800 (PST)
Received: from [10.57.5.249] (unknown [10.57.5.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD4D33F673;
 Mon, 13 Jan 2025 00:46:37 -0800 (PST)
Message-ID: <c54e64d9-55de-49fe-9e6d-f6c358a41034@arm.com>
Date: Mon, 13 Jan 2025 08:46:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: fix all mmu kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250111062832.910495-1-rdunlap@infradead.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250111062832.910495-1-rdunlap@infradead.org>
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

On 11/01/2025 06:28, Randy Dunlap wrote:
> Use the correct format for all kernel-doc comments.
> Use structname.membername for named structs.
> Don't precede function names in kernel-doc with '@' sign.
> Use the correct function parameter names in kernel-doc comments.
> 
> This fixes around 80 kernel-doc warnings.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>

Thanks for doing this - it's been on my TODO list to take a look at
this, and I know we've got more issues in other files.

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c |   71 ++++++++++++------------
>  1 file changed, 37 insertions(+), 34 deletions(-)
> 
> --- linux-next-20250108.orig/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ linux-next-20250108/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -53,26 +53,27 @@ struct panthor_mmu {
>  	/** @irq: The MMU irq. */
>  	struct panthor_irq irq;
>  
> -	/** @as: Address space related fields.
> +	/**
> +	 * @as: Address space related fields.
>  	 *
>  	 * The GPU has a limited number of address spaces (AS) slots, forcing
>  	 * us to re-assign them to re-assign slots on-demand.
>  	 */
>  	struct {
> -		/** @slots_lock: Lock protecting access to all other AS fields. */
> +		/** @as.slots_lock: Lock protecting access to all other AS fields. */
>  		struct mutex slots_lock;
>  
> -		/** @alloc_mask: Bitmask encoding the allocated slots. */
> +		/** @as.alloc_mask: Bitmask encoding the allocated slots. */
>  		unsigned long alloc_mask;
>  
> -		/** @faulty_mask: Bitmask encoding the faulty slots. */
> +		/** @as.faulty_mask: Bitmask encoding the faulty slots. */
>  		unsigned long faulty_mask;
>  
> -		/** @slots: VMs currently bound to the AS slots. */
> +		/** @as.slots: VMs currently bound to the AS slots. */
>  		struct panthor_as_slot slots[MAX_AS_SLOTS];
>  
>  		/**
> -		 * @lru_list: List of least recently used VMs.
> +		 * @as.lru_list: List of least recently used VMs.
>  		 *
>  		 * We use this list to pick a VM to evict when all slots are
>  		 * used.
> @@ -87,16 +88,16 @@ struct panthor_mmu {
>  
>  	/** @vm: VMs management fields */
>  	struct {
> -		/** @lock: Lock protecting access to list. */
> +		/** @vm.lock: Lock protecting access to list. */
>  		struct mutex lock;
>  
> -		/** @list: List containing all VMs. */
> +		/** @vm.list: List containing all VMs. */
>  		struct list_head list;
>  
> -		/** @reset_in_progress: True if a reset is in progress. */
> +		/** @vm.reset_in_progress: True if a reset is in progress. */
>  		bool reset_in_progress;
>  
> -		/** @wq: Workqueue used for the VM_BIND queues. */
> +		/** @vm.wq: Workqueue used for the VM_BIND queues. */
>  		struct workqueue_struct *wq;
>  	} vm;
>  };
> @@ -143,14 +144,14 @@ struct panthor_vma {
>  struct panthor_vm_op_ctx {
>  	/** @rsvd_page_tables: Pages reserved for the MMU page table update. */
>  	struct {
> -		/** @count: Number of pages reserved. */
> +		/** @rsvd_page_tables.count: Number of pages reserved. */
>  		u32 count;
>  
> -		/** @ptr: Point to the first unused page in the @pages table. */
> +		/** @rsvd_page_tables.ptr: Point to the first unused page in the @pages table. */
>  		u32 ptr;
>  
>  		/**
> -		 * @page: Array of pages that can be used for an MMU page table update.
> +		 * @rsvd_page_tables.pages: Array of pages that can be used for an MMU page table update.
>  		 *
>  		 * After an VM operation, there might be free pages left in this array.
>  		 * They should be returned to the pt_cache as part of the op_ctx cleanup.
> @@ -172,10 +173,10 @@ struct panthor_vm_op_ctx {
>  
>  	/** @va: Virtual range targeted by the VM operation. */
>  	struct {
> -		/** @addr: Start address. */
> +		/** @va.addr: Start address. */
>  		u64 addr;
>  
> -		/** @range: Range size. */
> +		/** @va.range: Range size. */
>  		u64 range;
>  	} va;
>  
> @@ -195,14 +196,14 @@ struct panthor_vm_op_ctx {
>  
>  	/** @map: Fields specific to a map operation. */
>  	struct {
> -		/** @vm_bo: Buffer object to map. */
> +		/** @map.vm_bo: Buffer object to map. */
>  		struct drm_gpuvm_bo *vm_bo;
>  
> -		/** @bo_offset: Offset in the buffer object. */
> +		/** @map.bo_offset: Offset in the buffer object. */
>  		u64 bo_offset;
>  
>  		/**
> -		 * @sgt: sg-table pointing to pages backing the GEM object.
> +		 * @map.sgt: sg-table pointing to pages backing the GEM object.
>  		 *
>  		 * This is gathered at job creation time, such that we don't have
>  		 * to allocate in ::run_job().
> @@ -210,7 +211,7 @@ struct panthor_vm_op_ctx {
>  		struct sg_table *sgt;
>  
>  		/**
> -		 * @new_vma: The new VMA object that will be inserted to the VA tree.
> +		 * @map.new_vma: The new VMA object that will be inserted to the VA tree.
>  		 */
>  		struct panthor_vma *new_vma;
>  	} map;
> @@ -304,27 +305,27 @@ struct panthor_vm {
>  
>  	/** @kernel_auto_va: Automatic VA-range for kernel BOs. */
>  	struct {
> -		/** @start: Start of the automatic VA-range for kernel BOs. */
> +		/** @kernel_auto_va.start: Start of the automatic VA-range for kernel BOs. */
>  		u64 start;
>  
> -		/** @size: Size of the automatic VA-range for kernel BOs. */
> +		/** @kernel_auto_va.size: Size of the automatic VA-range for kernel BOs. */
>  		u64 end;
>  	} kernel_auto_va;
>  
>  	/** @as: Address space related fields. */
>  	struct {
>  		/**
> -		 * @id: ID of the address space this VM is bound to.
> +		 * @as.id: ID of the address space this VM is bound to.
>  		 *
>  		 * A value of -1 means the VM is inactive/not bound.
>  		 */
>  		int id;
>  
> -		/** @active_cnt: Number of active users of this VM. */
> +		/** @as.active_cnt: Number of active users of this VM. */
>  		refcount_t active_cnt;
>  
>  		/**
> -		 * @lru_node: Used to instead the VM in the panthor_mmu::as::lru_list.
> +		 * @as.lru_node: Used to instead the VM in the panthor_mmu::as::lru_list.
>  		 *
>  		 * Active VMs should not be inserted in the LRU list.
>  		 */
> @@ -336,13 +337,13 @@ struct panthor_vm {
>  	 */
>  	struct {
>  		/**
> -		 * @pool: The heap pool attached to this VM.
> +		 * @heaps.pool: The heap pool attached to this VM.
>  		 *
>  		 * Will stay NULL until someone creates a heap context on this VM.
>  		 */
>  		struct panthor_heap_pool *pool;
>  
> -		/** @lock: Lock used to protect access to @pool. */
> +		/** @heaps.lock: Lock used to protect access to @pool. */
>  		struct mutex lock;
>  	} heaps;
>  
> @@ -408,7 +409,7 @@ struct panthor_vm_bind_job {
>  	struct panthor_vm_op_ctx ctx;
>  };
>  
> -/**
> +/*
>   * @pt_cache: Cache used to allocate MMU page tables.
>   *
>   * The pre-allocation pattern forces us to over-allocate to plan for
> @@ -478,7 +479,7 @@ static void *alloc_pt(void *cookie, size
>  }
>  
>  /**
> - * @free_pt() - Custom page table free function
> + * free_pt() - Custom page table free function
>   * @cookie: Cookie passed at page table allocation time.
>   * @data: Page table to free.
>   * @size: Size of the page table. This size should be fixed,
> @@ -697,7 +698,7 @@ static void panthor_vm_release_as_locked
>  
>  /**
>   * panthor_vm_active() - Flag a VM as active
> - * @VM: VM to flag as active.
> + * @vm: VM to flag as active.
>   *
>   * Assigns an address space to a VM so it can be used by the GPU/MCU.
>   *
> @@ -801,7 +802,7 @@ out_dev_exit:
>  
>  /**
>   * panthor_vm_idle() - Flag a VM idle
> - * @VM: VM to flag as idle.
> + * @vm: VM to flag as idle.
>   *
>   * When we know the GPU is done with the VM (no more jobs to process),
>   * we can relinquish the AS slot attached to this VM, if any.
> @@ -1017,7 +1018,7 @@ static int flags_to_prot(u32 flags)
>  
>  /**
>   * panthor_vm_alloc_va() - Allocate a region in the auto-va space
> - * @VM: VM to allocate a region on.
> + * @vm: VM to allocate a region on.
>   * @va: start of the VA range. Can be PANTHOR_VM_KERNEL_AUTO_VA if the user
>   * wants the VA to be automatically allocated from the auto-VA range.
>   * @size: size of the VA range.
> @@ -1063,7 +1064,7 @@ panthor_vm_alloc_va(struct panthor_vm *v
>  
>  /**
>   * panthor_vm_free_va() - Free a region allocated with panthor_vm_alloc_va()
> - * @VM: VM to free the region on.
> + * @vm: VM to free the region on.
>   * @va_node: Memory node representing the region to free.
>   */
>  void panthor_vm_free_va(struct panthor_vm *vm, struct drm_mm_node *va_node)
> @@ -1492,9 +1493,9 @@ panthor_vm_create_check_args(const struc
>  
>  /**
>   * panthor_vm_pool_create_vm() - Create a VM
> + * @ptdev: The panthor device
>   * @pool: The VM to create this VM on.
> - * @kernel_va_start: Start of the region reserved for kernel objects.
> - * @kernel_va_range: Size of the region reserved for kernel objects.
> + * @args: VM creation args.
>   *
>   * Return: a positive VM ID on success, a negative error code otherwise.
>   */
> @@ -1558,6 +1559,8 @@ static void panthor_vm_destroy(struct pa
>   *
>   * The VM resources are freed when the last reference on the VM object is
>   * dropped.
> + *
> + * Return: %0 for success, negative errno value for failure
>   */
>  int panthor_vm_pool_destroy_vm(struct panthor_vm_pool *pool, u32 handle)
>  {

