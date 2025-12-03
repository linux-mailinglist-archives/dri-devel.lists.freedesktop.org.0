Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022BC9EE4D
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 12:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D79B10E778;
	Wed,  3 Dec 2025 11:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="f9mlpCoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9401E10E778
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764762461;
 bh=l1brxEcZEA0OgRbkgRwjthl5cw9jv+wS/NkiJhQwLE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f9mlpCoYxuvF1RhDsSx/P4LQ0tjviho15e1R+U7MuNlo6w8zzuQ+9MkiDESdz/o4q
 t4bwNcwjs0ISRbT3bn+nzmNZCe7qj4Ru53TbAQ4SUdHwYdGP8VKktbR09XpXhO7shA
 o7LoDKUmAYoHbSu1YR1HKUI2kANb5lqM/Mr9ISTGO4qYSSwP1O2z9rRMf7D4YMmTTH
 tSs2WaD+opmj89T7C6124APQYqxWcaurHD/7ukAYiR8buMKOAXzEo3HsOGNzu3oXGz
 ttC+3SLL3knJjRQvHrmEQAO0to9Npw8OO/sA256DDwtmi5SkGPoTDJJ5ZC1bY+B1Jh
 ByII+xJq6P8JA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D48C17E0117;
 Wed,  3 Dec 2025 12:47:40 +0100 (CET)
Date: Wed, 3 Dec 2025 12:47:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>, Chia-I
 Wu <olvaffe@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] drm/panthor: Unlock the locked region before
 disabling an AS
Message-ID: <20251203124735.61e7af54@fedora>
In-Reply-To: <20251203110527.367089-4-boris.brezillon@collabora.com>
References: <20251203110527.367089-1-boris.brezillon@collabora.com>
 <20251203110527.367089-4-boris.brezillon@collabora.com>
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

On Wed,  3 Dec 2025 12:05:27 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> An AS can be disabled in the middle of a VM operation (VM being
> evicted from an AS slot, for instance). In that case, we need the
> locked section to be unlocked before releasing the slot.
> 
> v2:
> - Add an lockdep_assert_held() in panthor_mmu_as_disable()
> - Collect R-bs
> 
> Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3644af1a8e56..493e6428d478 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -588,14 +588,27 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>  				  bool recycle_slot)
>  {
> +	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
>  	int ret;
>  
> +	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
> +
>  	/* Flush+invalidate RW caches, invalidate RO ones. */
>  	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
>  				       CACHE_CLEAN | CACHE_INV, CACHE_INV);
>  	if (ret)
>  		return ret;
>  
> +	if (vm && vm->locked_region.size) {
> +		/* Unlock the region if there a lock pending. */
> +		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
> +		if (ret)
> +			return ret;
> +
> +		vm->locked_region.start = 0;
> +		vm->locked_region.size = 0;

Actually, resetting the locked_region range triggers the WARN_ON()s in
the vm_[un]map_pages() path, so I'll get rid of that in v3.

> +	}
> +
>  	/* If the slot is going to be used immediately, don't bother changing
>  	 * the config.
>  	 */

