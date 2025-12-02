Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD54C9BC6D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640B10E07D;
	Tue,  2 Dec 2025 14:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54EDE10E07D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 14:28:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99496153B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:28:16 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 BAA703F73B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:28:23 -0800 (PST)
Date: Tue, 2 Dec 2025 14:28:04 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 3/3] drm/panthor: Unlock the locked region before
 disabling an AS
Message-ID: <aS73dBjgpd1hAMW1@e142607>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
 <20251202133538.83078-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202133538.83078-4-boris.brezillon@collabora.com>
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

On Tue, Dec 02, 2025 at 02:35:38PM +0100, Boris Brezillon wrote:
> An AS can be disabled in the middle of a VM operation (VM being
> evicted from an AS slot, for instance). In that case, we need the
> locked section to be unlocked before releasing the slot.
> 
> Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3644af1a8e56..4ed28bd1b8ec 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -588,6 +588,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>  				  bool recycle_slot)
>  {
> +	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
>  	int ret;
>  
>  	/* Flush+invalidate RW caches, invalidate RO ones. */
> @@ -596,6 +597,16 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
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
> +	}
> +
>  	/* If the slot is going to be used immediately, don't bother changing
>  	 * the config.
>  	 */
> -- 
> 2.51.1
> 
