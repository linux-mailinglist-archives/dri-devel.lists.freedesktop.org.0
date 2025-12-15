Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E4CBDD5F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFF710E488;
	Mon, 15 Dec 2025 12:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CyxnuF5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A710E488
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765802227;
 bh=vev719SQ9DXNTgNQoTR7IGZ4y0dW5rc0WNYszuHaFCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CyxnuF5WBXm7oaCFupy2BD2TQj7oWl3qZQOMCwSvChbC009nmFMS4psHOM22nXnw0
 WV/PSAbkU0vVl13k0nIHiCMmhi7FG0nfG6IiZOuua5ItydU9IInvqQc3TduKYEOmo7
 ZaHiCBbhpJZCvaHPFfA5H/1dKrzD2QXqcGD4PqUfaY3ggl2gjHY67wU1DQHEmbeych
 opOquLOxR8l9SBimk+v15grF0tT2od8qBIEH5X2zds3wQLaHeGOW0K/21s9uvBYRfU
 9BoTfPJ1CMlEx2gwLZioKyTRZ78oZka+AB2bbGFbBYP8qrMJdGrfgrQ4T4uxZxmNe6
 pdc5rjRfK/F2Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ED2017E1146;
 Mon, 15 Dec 2025 13:37:07 +0100 (CET)
Date: Mon, 15 Dec 2025 13:37:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] drm/panthor: Track VM faults
Message-ID: <20251215133703.3f1bf4d2@fedora>
In-Reply-To: <20251215115457.2137485-4-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-4-lukas.zapolskas@arm.com>
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

On Mon, 15 Dec 2025 11:54:55 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> Faults reported via the MMU_CONTROL register block will result in fatal
> faults for running groups on that AS, which will also be useful to know
> for the user.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_mmu.h  | 20 ++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
>  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 473a8bebd61e..10a7418eecda 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -384,6 +384,9 @@ struct panthor_vm {
>  		/** @locked_region.size: Size of the locked region. */
>  		u64 size;
>  	} locked_region;
> +
> +	/** @fault: Fault information (if any) for this VM. */
> +	struct panthor_vm_fault fault;
>  };
>  
>  /**
> @@ -741,6 +744,7 @@ int panthor_vm_active(struct panthor_vm *vm)
>  
>  	/* If the VM is re-activated, we clear the fault. */
>  	vm->unhandled_fault = false;
> +	vm->fault = (struct panthor_vm_fault){ 0 };

I'd rather go for a memset() here, to follow the kernel coding style.

	memset(&vm->fault, 0, sizeof(vm->fault));

>  
>  	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
>  	 * before enabling the AS.
> @@ -1744,8 +1748,16 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		 */
>  		ptdev->mmu->irq.mask = new_int_mask;
>  
> -		if (ptdev->mmu->as.slots[as].vm)
> -			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
> +		if (ptdev->mmu->as.slots[as].vm) {
> +			struct panthor_vm *vm = ptdev->mmu->as.slots[as].vm;
> +
> +			vm->unhandled_fault = true;
> +			vm->fault.exception_type = AS_FAULTSTATUS_EXCEPTION_TYPE(status);
> +			vm->fault.access_type = AS_FAULTSTATUS_ACCESS_TYPE(status);
> +			vm->fault.source_id = AS_FAULTSTATUS_SOURCE_ID(status);

I'd be tempted to return the raw value to userspace instead of parsing
it here. This way if the meaning/layout changes, it's the UMD
responsibility to adjust the parsing (we do that with various other
things already, based on the GPU_ID).

> +			vm->fault.valid_address = true;

Do we really need an extra field to report address validity? Can't we
just the UMD check the status and take a decision based on that?

> +			vm->fault.address = addr;
> +		}
>  
>  		/* Disable the MMU to kill jobs on this AS. */
>  		panthor_mmu_as_disable(ptdev, as, false);
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 0e268fdfdb2f..023fdc79c231 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -16,6 +16,26 @@ struct panthor_vm;
>  struct panthor_vma;
>  struct panthor_mmu;
>  
> +/**
> + * struct panthor_vm_fault - Tracking information for VM-level faults.
> + */
> +struct panthor_vm_fault {
> +	/** @address: Virtual address of the faulting access. */
> +	u64 address;
> +
> +	/** @exception_type: The type of exception that caused the fault. */
> +	u32 exception_type;
> +
> +	/** @access_type: The direction of data transfer that caused the fault. */
> +	u32 access_type;
> +
> +	/** @source_id: ID supplying further data about the source of the fault. */
> +	u32 source_id;
> +
> +	/** @valid_address: Whether the virtual address is valid. */
> +	bool valid_address;
> +};
> +
>  int panthor_mmu_init(struct panthor_device *ptdev);
>  void panthor_mmu_unplug(struct panthor_device *ptdev);
>  void panthor_mmu_pre_reset(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 08bf06c452d6..5aa5e37d29c9 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -178,10 +178,13 @@
>  #define   AS_LOCK_REGION_MIN_SIZE			(1ULL << 15)
>  #define AS_FAULTSTATUS(as)				(MMU_AS(as) + 0x1C)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_MASK		(0x3 << 8)
> +#define  AS_FAULTSTATUS_ACCESS_TYPE(x)			(((x) >> 8) & GENMASK(2, 0))
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC		(0x0 << 8)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
> +#define  AS_FAULTSTATUS_EXCEPTION_TYPE(x)		((x) & GENMASK(7, 0))
> +#define  AS_FAULTSTATUS_SOURCE_ID(x)			(((x) >> 16) & GENMASK(16, 0))
>  #define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
>  #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
>  #define   AS_STATUS_AS_ACTIVE				BIT(0)

