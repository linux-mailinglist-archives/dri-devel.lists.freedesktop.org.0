Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C4A87DEA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45BF10E551;
	Mon, 14 Apr 2025 10:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F610E551
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:46:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994271007;
 Mon, 14 Apr 2025 03:46:42 -0700 (PDT)
Received: from [10.57.87.24] (unknown [10.57.87.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BC7E3F694;
 Mon, 14 Apr 2025 03:46:41 -0700 (PDT)
Message-ID: <ae02f0ef-9bc7-400c-9852-2a7a50102af4@arm.com>
Date: Mon, 14 Apr 2025 11:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/panthor: Clean up 64-bit register definitions
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250411164805.2015088-1-karunika.choo@arm.com>
 <20250411164805.2015088-3-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250411164805.2015088-3-karunika.choo@arm.com>
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

On 11/04/2025 17:48, Karunika Choo wrote:
> With the introduction of 64-bit register accessors, the separate *_HI
> definitions are no longer necessary. This change removes them and
> renames the corresponding *_LO entries for cleaner and more consistent
> register definitions.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I would sort of prefer that the calls like gpu_read64() just appended
the _LO as a form of type checking (with some macro magic). But I can't
think of how to make it work with macros like AS_TRANSTAB() and similar
where the _LO needs inserting in the middle. So I think this is the best
we can do.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c  | 12 ++--
>  drivers/gpu/drm/panthor/panthor_gpu.h  | 10 +--
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++---
>  drivers/gpu/drm/panthor/panthor_regs.h | 94 +++++++++-----------------
>  4 files changed, 52 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index fd09f0928019..5fc45284c712 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -108,9 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  
>  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
>  
> -	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> -	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> -	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
>  
>  	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>  	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> @@ -147,7 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
> -		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
> +		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
>  
>  		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
>  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
> @@ -457,7 +457,7 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>   */
>  u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>  {
> -	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
> +	return gpu_read64_counter(ptdev, GPU_TIMESTAMP);
>  }
>  
>  /**
> @@ -468,5 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>   */
>  u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
>  {
> -	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
> +	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index 7f6133a66127..89a0bdb2fbc5 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -30,9 +30,9 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>   */
>  #define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
>  	panthor_gpu_block_power_on(ptdev, #type, \
> -				  type ## _PWRON_LO, \
> -				  type ## _PWRTRANS_LO, \
> -				  type ## _READY_LO, \
> +				  type ## _PWRON, \
> +				  type ## _PWRTRANS, \
> +				  type ## _READY, \
>  				  mask, timeout_us)
>  
>  /**
> @@ -42,8 +42,8 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>   */
>  #define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
>  	panthor_gpu_block_power_off(ptdev, #type, \
> -				   type ## _PWROFF_LO, \
> -				   type ## _PWRTRANS_LO, \
> +				   type ## _PWROFF, \
> +				   type ## _PWRTRANS, \
>  				   mask, timeout_us)
>  
>  int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index a0a79f19bdea..1db4a46ddf98 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -564,7 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	region = region_width | region_start;
>  
>  	/* Lock the region that needs to be updated */
> -	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
> +	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> @@ -614,9 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  	if (ret)
>  		return ret;
>  
> -	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
> -	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
> -	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
> +	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
> +	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
> +	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
>  
>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
> @@ -629,9 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	if (ret)
>  		return ret;
>  
> -	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
> -	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
> -	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> +	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
> +	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
> +	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>  
>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
> @@ -1669,7 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		u32 source_id;
>  
>  		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
> -		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
> +		addr = gpu_read64(ptdev, AS_FAULTADDRESS(as));
>  
>  		/* decode the fault status */
>  		exception_type = fault_status & 0xFF;
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 6fd39a52f887..7e21d6a25dc4 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -65,20 +65,16 @@
>  #define   GPU_STATUS_DBG_ENABLED			BIT(8)
>  
>  #define GPU_FAULT_STATUS				0x3C
> -#define GPU_FAULT_ADDR_LO				0x40
> -#define GPU_FAULT_ADDR_HI				0x44
> +#define GPU_FAULT_ADDR					0x40
>  
>  #define GPU_PWR_KEY					0x50
>  #define  GPU_PWR_KEY_UNLOCK				0x2968A819
>  #define GPU_PWR_OVERRIDE0				0x54
>  #define GPU_PWR_OVERRIDE1				0x58
>  
> -#define GPU_TIMESTAMP_OFFSET_LO				0x88
> -#define GPU_TIMESTAMP_OFFSET_HI				0x8C
> -#define GPU_CYCLE_COUNT_LO				0x90
> -#define GPU_CYCLE_COUNT_HI				0x94
> -#define GPU_TIMESTAMP_LO				0x98
> -#define GPU_TIMESTAMP_HI				0x9C
> +#define GPU_TIMESTAMP_OFFSET				0x88
> +#define GPU_CYCLE_COUNT					0x90
> +#define GPU_TIMESTAMP					0x98
>  
>  #define GPU_THREAD_MAX_THREADS				0xA0
>  #define GPU_THREAD_MAX_WORKGROUP_SIZE			0xA4
> @@ -87,47 +83,29 @@
>  
>  #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
>  
> -#define GPU_SHADER_PRESENT_LO				0x100
> -#define GPU_SHADER_PRESENT_HI				0x104
> -#define GPU_TILER_PRESENT_LO				0x110
> -#define GPU_TILER_PRESENT_HI				0x114
> -#define GPU_L2_PRESENT_LO				0x120
> -#define GPU_L2_PRESENT_HI				0x124
> -
> -#define SHADER_READY_LO					0x140
> -#define SHADER_READY_HI					0x144
> -#define TILER_READY_LO					0x150
> -#define TILER_READY_HI					0x154
> -#define L2_READY_LO					0x160
> -#define L2_READY_HI					0x164
> -
> -#define SHADER_PWRON_LO					0x180
> -#define SHADER_PWRON_HI					0x184
> -#define TILER_PWRON_LO					0x190
> -#define TILER_PWRON_HI					0x194
> -#define L2_PWRON_LO					0x1A0
> -#define L2_PWRON_HI					0x1A4
> -
> -#define SHADER_PWROFF_LO				0x1C0
> -#define SHADER_PWROFF_HI				0x1C4
> -#define TILER_PWROFF_LO					0x1D0
> -#define TILER_PWROFF_HI					0x1D4
> -#define L2_PWROFF_LO					0x1E0
> -#define L2_PWROFF_HI					0x1E4
> -
> -#define SHADER_PWRTRANS_LO				0x200
> -#define SHADER_PWRTRANS_HI				0x204
> -#define TILER_PWRTRANS_LO				0x210
> -#define TILER_PWRTRANS_HI				0x214
> -#define L2_PWRTRANS_LO					0x220
> -#define L2_PWRTRANS_HI					0x224
> -
> -#define SHADER_PWRACTIVE_LO				0x240
> -#define SHADER_PWRACTIVE_HI				0x244
> -#define TILER_PWRACTIVE_LO				0x250
> -#define TILER_PWRACTIVE_HI				0x254
> -#define L2_PWRACTIVE_LO					0x260
> -#define L2_PWRACTIVE_HI					0x264
> +#define GPU_SHADER_PRESENT				0x100
> +#define GPU_TILER_PRESENT				0x110
> +#define GPU_L2_PRESENT					0x120
> +
> +#define SHADER_READY					0x140
> +#define TILER_READY					0x150
> +#define L2_READY					0x160
> +
> +#define SHADER_PWRON					0x180
> +#define TILER_PWRON					0x190
> +#define L2_PWRON					0x1A0
> +
> +#define SHADER_PWROFF					0x1C0
> +#define TILER_PWROFF					0x1D0
> +#define L2_PWROFF					0x1E0
> +
> +#define SHADER_PWRTRANS					0x200
> +#define TILER_PWRTRANS					0x210
> +#define L2_PWRTRANS					0x220
> +
> +#define SHADER_PWRACTIVE				0x240
> +#define TILER_PWRACTIVE					0x250
> +#define L2_PWRACTIVE					0x260
>  
>  #define GPU_REVID					0x280
>  
> @@ -170,10 +148,8 @@
>  #define MMU_AS_SHIFT					6
>  #define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
>  
> -#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
> -#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
> -#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
> -#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
> +#define AS_TRANSTAB(as)					(MMU_AS(as) + 0x0)
> +#define AS_MEMATTR(as)					(MMU_AS(as) + 0x8)
>  #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
>  #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
>  							 ((w) ? BIT(0) : 0) | \
> @@ -185,8 +161,7 @@
>  #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
>  #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
>  #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
> -#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
> -#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
> +#define AS_LOCKADDR(as)					(MMU_AS(as) + 0x10)
>  #define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
>  #define   AS_COMMAND_NOP				0
>  #define   AS_COMMAND_UPDATE				1
> @@ -201,12 +176,10 @@
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
>  #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
> -#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
> -#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
> +#define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
>  #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
>  #define   AS_STATUS_AS_ACTIVE				BIT(0)
> -#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
> -#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
> +#define AS_TRANSCFG(as)					(MMU_AS(as) + 0x30)
>  #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
>  #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
>  #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
> @@ -224,8 +197,7 @@
>  #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
>  #define   AS_TRANSCFG_WXN				BIT(35)
>  #define   AS_TRANSCFG_XREADABLE				BIT(36)
> -#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
> -#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
> +#define AS_FAULTEXTRA(as)				(MMU_AS(as) + 0x38)
>  
>  #define CSF_GPU_LATEST_FLUSH_ID				0x10000
>  

