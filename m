Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2711D253D3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F6010E789;
	Thu, 15 Jan 2026 15:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kA+/glLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44DC10E784
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768490282;
 bh=HGUdrdCR4GRlOPXVQa/LU8a/vqh79d8RiFDvquMpJ1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kA+/glLUDv6fU0gZ8ZRT7ShpQbfJ6ASt+Y0BVOaPdTeqvfat5BdkBaFgkGNG17f4I
 WHoizGl4K6/ZXSzT9WeBXlQqlKQTAJM+P0rwj9CMLRRwuhY58aDHsf2WC12GfxY1jy
 PSrd3D0vQafw2LcLAheZl06ghE1RtYd/eVetoXKZ5kVPEhgL5ni85lCPxAXsb5/U6u
 tvpGPxi9bgzFfruC6uNh+IvUIPyDIRmVJ4N5Ukf0ExFojfazUc2zEyqhFAfPrCJVG+
 7CrwuW28k3HJTv6E1H1abowPjQfUrLntOv2fRX6U45P2UHVNZAzIaRFtUfitPH62To
 WcUD0zBjDXlww==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D347017E0CF3;
 Thu, 15 Jan 2026 16:18:01 +0100 (CET)
Date: Thu, 15 Jan 2026 16:17:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 2/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Message-ID: <20260115161757.00f7f6df@fedora>
In-Reply-To: <20260115-panthor-tracepoints-v9-2-e13e4f7d01dc@collabora.com>
References: <20260115-panthor-tracepoints-v9-0-e13e4f7d01dc@collabora.com>
 <20260115-panthor-tracepoints-v9-2-e13e4f7d01dc@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 15 Jan 2026 14:59:00 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> The current IRQ helpers do not guarantee mutual exclusion that covers
> the entire transaction from accessing the mask member and modifying the
> mask register.
> 
> This makes it hard, if not impossible, to implement mask modification
> helpers that may change one of these outside the normal
> suspend/resume/isr code paths.
> 
> Add a spinlock to struct panthor_irq that protects both the mask member
> and register. Acquire it in all code paths that access these, but drop
> it before processing the threaded handler function. Then, add the
> aforementioned new helpers: enable_events, and disable_events. They work
> by ORing and NANDing the mask bits.
> 
> resume is changed to no longer have a mask passed, as pirq->mask is
> supposed to be the user-requested mask now, rather than a mirror of the
> INT_MASK register contents. Users of the resume helper are adjusted
> accordingly, including a rather painful refactor in panthor_mmu.c.
> 
> In panthor_mmu.c, the bespoke mask modification is excised, and replaced
> with enable_events/disable_events in as_enable/as_disable.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 74 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/panthor/panthor_fw.c     |  3 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 47 ++++++++++----------
>  drivers/gpu/drm/panthor/panthor_pwr.c    |  2 +-
>  5 files changed, 87 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 2bf9a8434dc5..42580968adb3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -84,9 +84,12 @@ struct panthor_irq {
>  	/** @irq: IRQ number. */
>  	int irq;
>  
> -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> +	/** @mask: Values to write to xxx_INT_MASK if active. */
>  	u32 mask;
>  
> +	/** @mask_lock: protects modifications to _INT_MASK and @mask */
> +	spinlock_t mask_lock;
> +
>  	/** @state: one of &enum panthor_irq_state reflecting the current state. */
>  	atomic_t state;
>  };
> @@ -422,6 +425,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>  	struct panthor_device *ptdev = pirq->ptdev;						\
>  	enum panthor_irq_state state;								\
>  												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\

That's me being old school, but I prefer to have a scoped_guard()
around the INT_MASK write happening at the end to reflect exactly the
data you're protecting against concurrent access. Unless mask_lock also
covers the state changes, in which case the documentation should
reflect that.


Also, _irqsave() in an interrupt context is redundant, I think, but
it's less of an issue, I guess.

> +												\
>  	state = atomic_read(&pirq->state);							\
>  	if (state == PANTHOR_IRQ_STATE_SUSPENDED || state == PANTHOR_IRQ_STATE_SUSPENDING)	\
>  		return IRQ_NONE;								\
> @@ -438,11 +443,16 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  	struct panthor_device *ptdev = pirq->ptdev;						\
>  	enum panthor_irq_state state;								\
>  	irqreturn_t ret = IRQ_NONE;								\
> +	u32 mask;										\
>  												\
> -	atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE, PANTHOR_IRQ_STATE_PROCESSING);	\
> +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> +		mask = pirq->mask;								\
> +		atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE,				\
> +			       PANTHOR_IRQ_STATE_PROCESSING);					\

Okay, it seems like it's the <mask,state> pair the lock protects.
There's probably a good reason which I'm missing, so it's probably
worth adding a comment somewhere to explain the locking scheme.

> +	}											\
>  												\
>  	while (true) {										\
> -		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> +		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & mask);		\
>  												\
>  		if (!status)									\
>  			break;									\
> @@ -451,10 +461,16 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  		ret = IRQ_HANDLED;								\
>  	}											\
>  												\
> -	state = atomic_read(&pirq->state);							\
> -	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING) {	\
> -		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> -		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);				\
> +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> +		state = atomic_read(&pirq->state);						\
> +		if (state != PANTHOR_IRQ_STATE_SUSPENDED &&					\
> +		    state != PANTHOR_IRQ_STATE_SUSPENDING) {					\
> +			/* Only restore the bits that were used and are still enabled */	\
> +			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
> +				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
> +				  (mask & pirq->mask));						\
> +			atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);			\
> +		}										\
>  	}											\
>  												\
>  	return ret;										\
> @@ -462,19 +478,21 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  												\
>  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
>  {												\
> -	pirq->mask = 0;										\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> -	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);					\
> +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> +		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);				\
> +	}											\
>  	synchronize_irq(pirq->irq);								\
>  	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
>  }												\
>  												\
> -static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
> +static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq)			\
>  {												\
> -	pirq->mask = mask;									\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
>  	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
>  }												\
>  												\
>  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> @@ -483,13 +501,39 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>  {												\
>  	pirq->ptdev = ptdev;									\
>  	pirq->irq = irq;									\
> -	panthor_ ## __name ## _irq_resume(pirq, mask);						\
> +	pirq->mask = mask;									\
> +	spin_lock_init(&pirq->mask_lock);							\
> +	panthor_ ## __name ## _irq_resume(pirq);						\
>  												\
>  	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
>  					 panthor_ ## __name ## _irq_raw_handler,		\
>  					 panthor_ ## __name ## _irq_threaded_handler,		\
>  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
>  					 pirq);							\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_enable_events(struct panthor_irq *pirq, u32 mask)	\
> +{												\
> +	enum panthor_irq_state state;								\
> +												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
> +	state = atomic_read(&pirq->state);							\
> +	pirq->mask |= mask;									\
> +	if (state != PANTHOR_IRQ_STATE_SUSPENDED || state != PANTHOR_IRQ_STATE_SUSPENDING)	\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_disable_events(struct panthor_irq *pirq, u32 mask)\
> +{												\
> +	enum panthor_irq_state state;								\
> +												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
> +	state = atomic_read(&pirq->state);							\
> +	pirq->mask &= ~mask;									\
> +	if (state != PANTHOR_IRQ_STATE_SUSPENDED || state != PANTHOR_IRQ_STATE_SUSPENDING)	\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>  }
>  
>  extern struct workqueue_struct *panthor_cleanup_wq;
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index a64ec8756bed..0e46625f7621 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1080,7 +1080,8 @@ static int panthor_fw_start(struct panthor_device *ptdev)
>  	bool timedout = false;
>  
>  	ptdev->fw->booted = false;
> -	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
> +	panthor_job_irq_enable_events(&ptdev->fw->irq, ~0);

We don't change the mask after initialization AFAICT, so I'm not sure
this _enable_events() is needed.

> +	panthor_job_irq_resume(&ptdev->fw->irq);
>  	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
>  
>  	if (!wait_event_timeout(ptdev->fw->req_waitqueue,
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 057e167468d0..9304469a711a 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -395,7 +395,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
>   */
>  void panthor_gpu_resume(struct panthor_device *ptdev)
>  {
> -	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
> +	panthor_gpu_irq_resume(&ptdev->gpu->irq);
>  	panthor_hw_l2_power_on(ptdev);
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 198d59f42578..a1b7917a31b1 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -562,9 +562,21 @@ static u64 pack_region_range(struct panthor_device *ptdev, u64 *region_start, u6
>  	return region_width | *region_start;
>  }
>  
> +static u32 panthor_mmu_as_fault_mask(struct panthor_device *ptdev, u32 as)
> +{
> +	return BIT(as);
> +}
> +
> +/* Forward declaration to call helpers within as_enable/disable */
> +static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status);
> +PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
> +
>  static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  				 u64 transtab, u64 transcfg, u64 memattr)
>  {
> +	panthor_mmu_irq_enable_events(&ptdev->mmu->irq,
> +				       panthor_mmu_as_fault_mask(ptdev, as_nr));
> +
>  	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
>  	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
>  	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
> @@ -580,6 +592,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>  
>  	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>  
> +	panthor_mmu_irq_disable_events(&ptdev->mmu->irq,
> +				       panthor_mmu_as_fault_mask(ptdev, as_nr));

I'd move that at the end, when everything else in this function
succeeded.

> +
>  	/* Flush+invalidate RW caches, invalidate RO ones. */
>  	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
>  				       CACHE_CLEAN | CACHE_INV, CACHE_INV);
> @@ -612,11 +627,6 @@ static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
>  	return value & GENMASK(15, 0);
>  }
>  
> -static u32 panthor_mmu_as_fault_mask(struct panthor_device *ptdev, u32 as)
> -{
> -	return BIT(as);
> -}
> -
>  /**
>   * panthor_vm_has_unhandled_faults() - Check if a VM has unhandled faults
>   * @vm: VM to check.
> @@ -670,6 +680,7 @@ int panthor_vm_active(struct panthor_vm *vm)
>  	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
>  	int ret = 0, as, cookie;
>  	u64 transtab, transcfg;
> +	u32 fault_mask;
>  
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return -ENODEV;
> @@ -743,14 +754,13 @@ int panthor_vm_active(struct panthor_vm *vm)
>  	/* If the VM is re-activated, we clear the fault. */
>  	vm->unhandled_fault = false;
>  
> -	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
> -	 * before enabling the AS.
> +	/* Unhandled pagefault on this AS, clear the fault and enable the AS,
> +	 * which re-enables interrupts.
>  	 */
> -	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
> -		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
> -		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
> -		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
> -		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
> +	fault_mask = panthor_mmu_as_fault_mask(ptdev, as);
> +	if (ptdev->mmu->as.faulty_mask & fault_mask) {
> +		gpu_write(ptdev, MMU_INT_CLEAR, fault_mask);
> +		ptdev->mmu->as.faulty_mask &= ~fault_mask;
>  	}
>  
>  	/* The VM update is guarded by ::op_lock, which we take at the beginning
> @@ -1698,7 +1708,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  	while (status) {
>  		u32 as = ffs(status | (status >> 16)) - 1;
>  		u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
> -		u32 new_int_mask;
>  		u64 addr;
>  		u32 fault_status;
>  		u32 exception_type;
> @@ -1716,8 +1725,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		mutex_lock(&ptdev->mmu->as.slots_lock);
>  
>  		ptdev->mmu->as.faulty_mask |= mask;
> -		new_int_mask =
> -			panthor_mmu_fault_mask(ptdev, ~ptdev->mmu->as.faulty_mask);
>  
>  		/* terminal fault, print info about the fault */
>  		drm_err(&ptdev->base,
> @@ -1741,11 +1748,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		 */
>  		gpu_write(ptdev, MMU_INT_CLEAR, mask);
>  
> -		/* Ignore MMU interrupts on this AS until it's been
> -		 * re-enabled.
> -		 */
> -		ptdev->mmu->irq.mask = new_int_mask;
> -

I guess we need a _diable_events(mask) to replace this.

>  		if (ptdev->mmu->as.slots[as].vm)
>  			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
>  
> @@ -1760,7 +1762,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  	if (has_unhandled_faults)
>  		panthor_sched_report_mmu_fault(ptdev);
>  }
> -PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
>  
>  /**
>   * panthor_mmu_suspend() - Suspend the MMU logic
> @@ -1805,7 +1806,7 @@ void panthor_mmu_resume(struct panthor_device *ptdev)
>  	ptdev->mmu->as.faulty_mask = 0;
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
>  
> -	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> +	panthor_mmu_irq_resume(&ptdev->mmu->irq);
>  }
>  
>  /**
> @@ -1859,7 +1860,7 @@ void panthor_mmu_post_reset(struct panthor_device *ptdev)
>  
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
>  
> -	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> +	panthor_mmu_irq_resume(&ptdev->mmu->irq);
>  
>  	/* Restart the VM_BIND queues. */
>  	mutex_lock(&ptdev->mmu->vm.lock);
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> index 57cfc7ce715b..ed3b2b4479ca 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -545,5 +545,5 @@ void panthor_pwr_resume(struct panthor_device *ptdev)
>  	if (!ptdev->pwr)
>  		return;
>  
> -	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
> +	panthor_pwr_irq_resume(&ptdev->pwr->irq);
>  }
> 

