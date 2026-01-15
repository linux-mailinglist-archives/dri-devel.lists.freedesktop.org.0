Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644FD241C0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 12:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1E10E742;
	Thu, 15 Jan 2026 11:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QTnXkKqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1BD10E739
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 11:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768475731; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F0buTdyB0X5S3hDz5lz9ui8HY46j6qVVWPz8yG8hVOk9FE9GF5vOKslAwNRvCZbM6CqOULubVQuSyag2MkoiyfoxcvwKN3xvgzndAxgfF/jI/JrxmVnlTcEsUM+cbnPQPnUFLl/JT5OgskFCsZAgRa6LBNLVgW/fwjLZskzq700=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768475731;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hnhxa1s023/PpdBQbYtT2NXBMqt4LAVJC0hOZ9GU8dg=; 
 b=LKTwNiLjuXGdCseKhk8iz7LCoCkqyxqbhdAt4B69XIZ6ZkC6kdA+JDeTtOUEwKQ0/0+7/3PMDQDU77dcttkpWhUfZ18BoeZnI07h0Zd+ag/f0TGfoXw++JMY2UHBUGjAz9T8IuJSqEtDHXSPYa6WAU0/8q6dQzIhpnFjkM9HIp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768475731; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=hnhxa1s023/PpdBQbYtT2NXBMqt4LAVJC0hOZ9GU8dg=;
 b=QTnXkKqS9xBrsai89JI9bhUPmZBJz1vyHa5bOwDux101F+AQ7oAJucQDG4Wl9S24
 EzcmIjMPFYH7uFT90aSOzeIrO5Ix3XQg1/pP+oGWRwTEI1FaecRUu7xbRMlvObCt1b1
 WwvnaRXXBVlxsMNuTSyA3OyVPn6Pip6j4rKRU5Jo=
Received: by mx.zohomail.com with SMTPS id 17684757286631023.2475594982562;
 Thu, 15 Jan 2026 03:15:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 2/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Date: Thu, 15 Jan 2026 12:15:22 +0100
Message-ID: <3991854.44csPzL39Z@workhorse>
In-Reply-To: <20260112161252.09396916@fedora>
References: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
 <20260112-panthor-tracepoints-v8-2-63efcb421d22@collabora.com>
 <20260112161252.09396916@fedora>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Monday, 12 January 2026 16:12:52 Central European Standard Time Boris Brezillon wrote:
> On Mon, 12 Jan 2026 15:37:50 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
> > The current IRQ helpers do not guarantee mutual exclusion that covers
> > the entire transaction from accessing the mask member and modifying the
> > mask register.
> > 
> > This makes it hard, if not impossible, to implement mask modification
> > helpers that may change one of these outside the normal
> > suspend/resume/isr code paths.
> > 
> > Add a spinlock to struct panthor_irq that protects both the mask member
> > and register. Acquire it in all code paths that access these, but drop
> > it before processing the threaded handler function. Then, add the
> > aforementioned new helpers: enable_events, and disable_events. They work
> > by ORing and NANDing the mask bits.
> > 
> > resume is changed to no longer have a mask passed, as pirq->mask is
> > supposed to be the user-requested mask now, rather than a mirror of the
> > INT_MASK register contents. Users of the resume helper are adjusted
> > accordingly, including a rather painful refactor in panthor_mmu.c.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h |  72 +++++++--
> >  drivers/gpu/drm/panthor/panthor_fw.c     |   3 +-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |   2 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
> >  drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
> >  5 files changed, 187 insertions(+), 139 deletions(-)
> > 
> [... snip ...]
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 198d59f42578..71b8318eab31 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -655,125 +655,6 @@ static void panthor_vm_release_as_locked(struct panthor_vm *vm)
> >  	vm->as.id = -1;
> >  }
> >  
> > -/**
> > - * panthor_vm_active() - Flag a VM as active
> > - * @vm: VM to flag as active.
> > - *
> > - * Assigns an address space to a VM so it can be used by the GPU/MCU.
> > - *
> > - * Return: 0 on success, a negative error code otherwise.
> > - */
> > -int panthor_vm_active(struct panthor_vm *vm)
> > -{
> > -	struct panthor_device *ptdev = vm->ptdev;
> > -	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> > -	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
> > -	int ret = 0, as, cookie;
> > -	u64 transtab, transcfg;
> > -
> > -	if (!drm_dev_enter(&ptdev->base, &cookie))
> > -		return -ENODEV;
> > -
> > -	if (refcount_inc_not_zero(&vm->as.active_cnt))
> > -		goto out_dev_exit;
> > -
> > -	/* Make sure we don't race with lock/unlock_region() calls
> > -	 * happening around VM bind operations.
> > -	 */
> > -	mutex_lock(&vm->op_lock);
> > -	mutex_lock(&ptdev->mmu->as.slots_lock);
> > -
> > -	if (refcount_inc_not_zero(&vm->as.active_cnt))
> > -		goto out_unlock;
> > -
> > -	as = vm->as.id;
> > -	if (as >= 0) {
> > -		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
> > -		 * re-enable the MMU after clearing+unmasking the AS interrupts.
> > -		 */
> > -		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
> > -			goto out_enable_as;
> > -
> > -		goto out_make_active;
> > -	}
> > -
> > -	/* Check for a free AS */
> > -	if (vm->for_mcu) {
> > -		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
> > -		as = 0;
> > -	} else {
> > -		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
> > -	}
> > -
> > -	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
> > -		struct panthor_vm *lru_vm;
> > -
> > -		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
> > -						  struct panthor_vm,
> > -						  as.lru_node);
> > -		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
> > -			ret = -EBUSY;
> > -			goto out_unlock;
> > -		}
> > -
> > -		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
> > -		as = lru_vm->as.id;
> > -
> > -		ret = panthor_mmu_as_disable(ptdev, as, true);
> > -		if (ret)
> > -			goto out_unlock;
> > -
> > -		panthor_vm_release_as_locked(lru_vm);
> > -	}
> > -
> > -	/* Assign the free or reclaimed AS to the FD */
> > -	vm->as.id = as;
> > -	set_bit(as, &ptdev->mmu->as.alloc_mask);
> > -	ptdev->mmu->as.slots[as].vm = vm;
> > -
> > -out_enable_as:
> > -	transtab = cfg->arm_lpae_s1_cfg.ttbr;
> > -	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> > -		   AS_TRANSCFG_PTW_RA |
> > -		   AS_TRANSCFG_ADRMODE_AARCH64_4K |
> > -		   AS_TRANSCFG_INA_BITS(55 - va_bits);
> > -	if (ptdev->coherent)
> > -		transcfg |= AS_TRANSCFG_PTW_SH_OS;
> > -
> > -	/* If the VM is re-activated, we clear the fault. */
> > -	vm->unhandled_fault = false;
> > -
> > -	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
> > -	 * before enabling the AS.
> > -	 */
> > -	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
> > -		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
> > -		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
> > -		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
> > -		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
> > -	}
> > -
> > -	/* The VM update is guarded by ::op_lock, which we take at the beginning
> > -	 * of this function, so we don't expect any locked region here.
> > -	 */
> > -	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
> > -	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> > -
> > -out_make_active:
> > -	if (!ret) {
> > -		refcount_set(&vm->as.active_cnt, 1);
> > -		list_del_init(&vm->as.lru_node);
> > -	}
> > -
> > -out_unlock:
> > -	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > -	mutex_unlock(&vm->op_lock);
> > -
> > -out_dev_exit:
> > -	drm_dev_exit(cookie);
> > -	return ret;
> > -}
> > -
> >  /**
> >   * panthor_vm_idle() - Flag a VM idle
> >   * @vm: VM to flag as idle.
> > @@ -1762,6 +1643,128 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  }
> >  PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
> >  
> > +/**
> > + * panthor_vm_active() - Flag a VM as active
> > + * @vm: VM to flag as active.
> > + *
> > + * Assigns an address space to a VM so it can be used by the GPU/MCU.
> > + *
> > + * Return: 0 on success, a negative error code otherwise.
> > + */
> > +int panthor_vm_active(struct panthor_vm *vm)
> > +{
> > +	struct panthor_device *ptdev = vm->ptdev;
> > +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> > +	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
> > +	int ret = 0, as, cookie;
> > +	u64 transtab, transcfg;
> > +	u32 fault_mask;
> > +
> > +	if (!drm_dev_enter(&ptdev->base, &cookie))
> > +		return -ENODEV;
> > +
> > +	if (refcount_inc_not_zero(&vm->as.active_cnt))
> > +		goto out_dev_exit;
> > +
> > +	/* Make sure we don't race with lock/unlock_region() calls
> > +	 * happening around VM bind operations.
> > +	 */
> > +	mutex_lock(&vm->op_lock);
> > +	mutex_lock(&ptdev->mmu->as.slots_lock);
> > +
> > +	if (refcount_inc_not_zero(&vm->as.active_cnt))
> > +		goto out_unlock;
> > +
> > +	as = vm->as.id;
> > +	if (as >= 0) {
> > +		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
> > +		 * re-enable the MMU after clearing+unmasking the AS interrupts.
> > +		 */
> > +		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
> > +			goto out_enable_as;
> > +
> > +		goto out_make_active;
> > +	}
> > +
> > +	/* Check for a free AS */
> > +	if (vm->for_mcu) {
> > +		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
> > +		as = 0;
> > +	} else {
> > +		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
> > +	}
> > +
> > +	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
> > +		struct panthor_vm *lru_vm;
> > +
> > +		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
> > +						  struct panthor_vm,
> > +						  as.lru_node);
> > +		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
> > +			ret = -EBUSY;
> > +			goto out_unlock;
> > +		}
> > +
> > +		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
> > +		as = lru_vm->as.id;
> > +
> > +		ret = panthor_mmu_as_disable(ptdev, as, true);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		panthor_vm_release_as_locked(lru_vm);
> > +	}
> > +
> > +	/* Assign the free or reclaimed AS to the FD */
> > +	vm->as.id = as;
> > +	set_bit(as, &ptdev->mmu->as.alloc_mask);
> > +	ptdev->mmu->as.slots[as].vm = vm;
> > +
> > +out_enable_as:
> > +	transtab = cfg->arm_lpae_s1_cfg.ttbr;
> > +	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> > +		   AS_TRANSCFG_PTW_RA |
> > +		   AS_TRANSCFG_ADRMODE_AARCH64_4K |
> > +		   AS_TRANSCFG_INA_BITS(55 - va_bits);
> > +	if (ptdev->coherent)
> > +		transcfg |= AS_TRANSCFG_PTW_SH_OS;
> > +
> > +	/* If the VM is re-activated, we clear the fault. */
> > +	vm->unhandled_fault = false;
> > +
> > +	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
> > +	 * before enabling the AS.
> > +	 */
> > +	fault_mask = panthor_mmu_as_fault_mask(ptdev, as);
> > +	if (ptdev->mmu->as.faulty_mask & fault_mask) {
> > +		gpu_write(ptdev, MMU_INT_CLEAR, fault_mask);
> > +		ptdev->mmu->as.faulty_mask &= ~fault_mask;
> > +		panthor_mmu_irq_enable_events(&ptdev->mmu->irq, fault_mask);
> > +		panthor_mmu_irq_disable_events(&ptdev->mmu->irq, ptdev->mmu->as.faulty_mask);
> 
> Why do we need a _disable_events() here?

It's what the code originally did as far as I can tell. Not super obvious
because I had to move the function, but it did:

	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
	 * before enabling the AS.
	 */
	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
	}

We write `~(ptdev->mmu->as.faulty_mask & ~panthor_mmu_as_fault_mask(ptdev, as))` to
the mask register. Though now looking at it again, I don't think my new version
expands to the same thing at all, since
`ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);` is trying
to clear the fault mask of the one bit this translates to from what I can tell,
and then the negation in the write re-enables it but clears all other bits? That
can't be right. If anything if it wanted to re-enable interrupts it should OR
the register contents, not overwrite them.

I feel a little better about the me from a few days ago when I can look at the
code with a fresh set of eyes and still not get what it's actually trying to do,
other than trusting the comment.

Also, genuinely what is the point of `panthor_mmu_as_fault_mask`? Half of its
parameters are unused and its entire implementation is shorter than the function
name.

So yeah I think I'll remove the disable_events here and double-check what this
code is actually supposed to do, because the version I'm replacing seems very
non-obvious, as I can't see how what it does corresponds to what the comment
says it does (clear fault and re-enable its interrupt). This also plays into your
remark below.

> 
> > +	}
> > +
> > +	/* The VM update is guarded by ::op_lock, which we take at the beginning
> > +	 * of this function, so we don't expect any locked region here.
> > +	 */
> > +	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
> > +	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> > +
> > +out_make_active:
> > +	if (!ret) {
> > +		refcount_set(&vm->as.active_cnt, 1);
> > +		list_del_init(&vm->as.lru_node);
> > +	}
> > +
> > +out_unlock:
> > +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > +	mutex_unlock(&vm->op_lock);
> > +
> > +out_dev_exit:
> > +	drm_dev_exit(cookie);
> > +	return ret;
> > +}
> > +
> > +
> 
> nit: one too many empty lines.
> 
> >  /**
> >   * panthor_mmu_suspend() - Suspend the MMU logic
> >   * @ptdev: Device.
> > @@ -1805,7 +1808,8 @@ void panthor_mmu_resume(struct panthor_device *ptdev)
> >  	ptdev->mmu->as.faulty_mask = 0;
> >  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> >  
> > -	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> > +	panthor_mmu_irq_enable_events(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> 
> I don't think we should touch the events mask in the suspend/resume
> path. The way I see it, events should be:
> 
> - enabled when an AS is enabled (as_enable())
> - disabled when an AS is disabled (as_disable())
> - disabled when a VM has an unhandled faults
> 
> Because making a VM active might imply evicting another VM, we might
> end up with disable+enable_events() pairs that we could have been
> optimized into a NOP, but the overhead should be negligible, and if we
> have to rotate VMs on AS slots we've already lost anyway (in term of
> perfs).

Yep, I'll do that. I think I was naively trying to translate the code,
but since we now have pirq->mask preserved for us, this explicit juggling
of state can be removed.

> 
> > +	panthor_mmu_irq_resume(&ptdev->mmu->irq);
> >  }
> >  
> >  /**
> > @@ -1859,7 +1863,8 @@ void panthor_mmu_post_reset(struct panthor_device *ptdev)
> >  
> >  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> >  
> > -	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> > +	panthor_mmu_irq_enable_events(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
> 
> Same here, I don't think we need to change the event mask.
> 
> > +	panthor_mmu_irq_resume(&ptdev->mmu->irq);
> >  
> >  	/* Restart the VM_BIND queues. */
> >  	mutex_lock(&ptdev->mmu->vm.lock);
> > diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> > index 57cfc7ce715b..ed3b2b4479ca 100644
> > --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> > +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> > @@ -545,5 +545,5 @@ void panthor_pwr_resume(struct panthor_device *ptdev)
> >  	if (!ptdev->pwr)
> >  		return;
> >  
> > -	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
> > +	panthor_pwr_irq_resume(&ptdev->pwr->irq);
> >  }
> > 
> 
> 

Thanks for the review.

Kind regards,
Nicolas Frattaroli



