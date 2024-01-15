Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E382DE92
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092C10E33F;
	Mon, 15 Jan 2024 17:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C94E10E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705340468;
 bh=MbFnhJgLUrQQpIWvyukJXgpqOsNoICWLZKNc7sRCwa4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F5uPhLZeM7uCI3hStNWeBTgUw3uTzFLvFavKkbmTaSa2Vi8o7K6A/xvqop+v3DPDx
 YY6owi7rl17zc6H6lTaAkpPL3U8o5hCH8q0cnQHZ6sfThc/VDbP88P2Sii/wM6A46D
 xHEAZiEfASBVeU5SRTiaQ6/OBgzYgJccNR6AgFnKKcXAXlJEGzAwY1AwYLU9K1Ym5z
 9VMyY2Y5nwi9v2FWzUKvXNEeiXQ6/3jMP+Nke9WuIPtiLB5QK979sO6yJQcFqc8A+z
 AzLFS6URecEQV0jCqzmmRZU/OE6iTVdZXow2txCENLepUMstz3+LpyxyEq5ycmFyQ6
 4s8OJSU6CzRhg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 595B537813E4;
 Mon, 15 Jan 2024 17:41:07 +0000 (UTC)
Date: Mon, 15 Jan 2024 18:41:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240115184106.138b5eae@collabora.com>
In-Reply-To: <20231204173313.2098733-8-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-8-boris.brezillon@collabora.com>
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
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Dec 2023 18:33:00 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +/**
> + * panthor_vm_active() - Flag a VM as active
> + * @VM: VM to flag as active.
> + *
> + * Assigns an address space to a VM so it can be used by the GPU/MCU.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_vm_active(struct panthor_vm *vm)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
> +	int ret = 0, as, cookie;
> +	u64 transtab, transcfg;
> +
> +	if (!drm_dev_enter(&ptdev->base, &cookie))
> +		return -ENODEV;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +
> +	as = vm->as.id;
> +	if (as >= 0) {
> +		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
> +		 * re-enable the MMU after clearing+unmasking the AS interrupts.
> +		 */
> +		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
> +			goto out_enable_as;
> +

When the context was idle and we make it active, we never remove the VM
from the LRU list, which might cause this AS to be re-assigned to
someone else while the GPU is still using the AS. I'll fix that along
the active_cnt issue I mentioned in my previous reply.

> +		goto out_unlock;
> +	}
> +
> +	/* Check for a free AS */
> +	if (vm->for_mcu) {
> +		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
> +		as = 0;
> +	} else {
> +		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
> +	}
> +
> +	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
> +		struct panthor_vm *lru_vm;
> +
> +		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
> +						  struct panthor_vm,
> +						  as.lru_node);
> +		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
> +			ret = -EBUSY;
> +			goto out_unlock;
> +		}
> +
> +		list_del_init(&lru_vm->as.lru_node);
> +		as = lru_vm->as.id;
> +
> +		lru_vm->as.id = -1;
> +	} else {
> +		set_bit(as, &ptdev->mmu->as.alloc_mask);
> +	}
> +
> +	/* Assign the free or reclaimed AS to the FD */
> +	vm->as.id = as;
> +	ptdev->mmu->as.slots[as].vm = vm;
> +
> +out_enable_as:
> +	transtab = cfg->arm_lpae_s1_cfg.ttbr;
> +	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> +		   AS_TRANSCFG_PTW_RA |
> +		   AS_TRANSCFG_ADRMODE_AARCH64_4K;
> +	if (ptdev->coherent)
> +		transcfg |= AS_TRANSCFG_PTW_SH_OS;
> +
> +	/* If the VM is re-activated, we clear the fault. */
> +	vm->unhandled_fault = false;
> +
> +	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
> +	 * before enabling the AS.
> +	 */
> +	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
> +		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
> +		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
> +		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
> +	}
> +
> +	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> +
> +out_unlock:
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
