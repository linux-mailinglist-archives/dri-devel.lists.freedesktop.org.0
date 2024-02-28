Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E786B6EA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEAF10E0BD;
	Wed, 28 Feb 2024 18:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OHsoRZ2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36210E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709144061;
 bh=lFLmr4YsE/iHQkrK6fWHlChGvxg1NH/Nq4mPNkLEFIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OHsoRZ2FAmw36E5R8ClKabtQwkfH/vIBJE6ev/h9MCTFFMQx3zF9IqgKpF3XE6WcZ
 m3uX11fNIVqcXISEMbOaaM/qMt4J/3Gz0SjpXlWMhC3Ksn7tfGA5s9KNiHXSNx4qF3
 j/IL0TQTMYVKy66jQ6JE/PYY2oVN+Wl53lbkTq7yk8N/bzQA4Z1i2STTuYy60g5ir4
 OwZZCcTGiuh+11Vf02rfHuaYTJ/tEB/4+tmAjrXSrH3L8Io8izaH/BqspNQ/Q6Azdu
 4oSbARcDlx6Cms0Y6wJqjs8AJHE/E1+Ejaa3ynVKO6kRpcasLze0GWEeMBYMUqdusW
 ObVA78v7Wv5lw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE9F03781FE3;
 Wed, 28 Feb 2024 18:14:19 +0000 (UTC)
Date: Wed, 28 Feb 2024 19:14:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, "Marty E . Plummer"
 <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Grant Likely
 <grant.likely@linaro.org>
Subject: Re: [PATCH v5 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240228191418.614fc3c0@collabora.com>
In-Reply-To: <20240218214131.3035480-8-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
 <20240218214131.3035480-8-boris.brezillon@collabora.com>
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

On Sun, 18 Feb 2024 22:41:21 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

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
> +	if (refcount_inc_not_zero(&vm->as.active_cnt))
> +		goto out_dev_exit;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +
> +	if (refcount_inc_not_zero(&vm->as.active_cnt))
> +		goto out_unlock;
> +
> +	as = vm->as.id;
> +	if (as >= 0) {
> +		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
> +		 * re-enable the MMU after clearing+unmasking the AS interrupts.
> +		 */
> +		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
> +			goto out_enable_as;
> +
> +		goto out_make_active;
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
> +		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
> +		as = lru_vm->as.id;
> +		panthor_vm_release_as_locked(lru_vm);
> +	}
> +
> +	/* Assign the free or reclaimed AS to the FD */
> +	vm->as.id = as;
> +	set_bit(as, &ptdev->mmu->as.alloc_mask);
> +	ptdev->mmu->as.slots[as].vm = vm;
> +
> +out_enable_as:
> +	transtab = cfg->arm_lpae_s1_cfg.ttbr;
> +	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
> +		   AS_TRANSCFG_PTW_RA |
> +		   AS_TRANSCFG_ADRMODE_AARCH64_4K;

We also need

		   AS_TRANSCFG_INA_BITS(55 - va_bits);

otherwise we lack one page table level on 32-bit platforms where the
virtual address space is artificially limited to 32bits.


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
> +out_make_active:
> +	if (!ret) {
> +		refcount_set(&vm->as.active_cnt, 1);
> +		list_del_init(&vm->as.lru_node);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +
> +out_dev_exit:
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
