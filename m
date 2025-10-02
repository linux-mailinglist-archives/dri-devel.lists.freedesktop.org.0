Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE97BB3AB5
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 12:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8910E376;
	Thu,  2 Oct 2025 10:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2854510E376
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 10:41:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B927C1A00;
 Thu,  2 Oct 2025 03:41:27 -0700 (PDT)
Received: from [10.57.2.240] (unknown [10.57.2.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71EC53F66E;
 Thu,  2 Oct 2025 03:41:33 -0700 (PDT)
Message-ID: <c4f100fe-88a5-4409-a728-6b296ce23877@arm.com>
Date: Thu, 2 Oct 2025 11:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/panthor: add mmu_hw_cmd_update
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-5-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250916210823.4033529-5-olvaffe@gmail.com>
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

On 16/09/2025 22:08, Chia-I Wu wrote:
> Add a simple helper for the UPDATE command.

Why? There's only two call sites, so we're not saving much (indeed the
diffstat shows we've got over twice as many lines)...

> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 953348f9afdb8..727339d80d37e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -545,6 +545,27 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
>  	return status;
>  }
>  
> +/**
> + * mmu_hw_cmd_update() - Issue an UPDATE command
> + * @ptdev: Device.
> + * @as_nr: AS to issue command to.
> + * @transtab: Addr of the translation table.
> + * @transcfg: Bitmask of AS_TRANSCFG_*.
> + * @memattr: Bitmask of AS_MEMATTR_*.
> + *
> + * Issue an UPDATE command to invalidate MMU caches and update the translation
> + * table.
> + */
> +static int mmu_hw_cmd_update(struct panthor_device *ptdev, u32 as_nr, u64 transtab, u64 transcfg,
> +			     u64 memattr)
> +{
> +	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
> +	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
> +	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
> +
> +	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> +}
> +
>  /**
>   * mmu_hw_cmd_lock() - Issue a LOCK command
>   * @ptdev: Device.
> @@ -674,11 +695,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  	if (ret)
>  		return ret;
>  
> -	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
> -	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
> -	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
> -
> -	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	return mmu_hw_cmd_update(ptdev, as_nr, transtab, transcfg, memattr);
>  }
>  
>  static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
> @@ -689,11 +706,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	if (ret)
>  		return ret;
>  
> -	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
> -	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
> -	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> -
> -	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	return mmu_hw_cmd_update(ptdev, as_nr, 0, AS_TRANSCFG_ADRMODE_UNMAPPED, 0);

... and here in particular the code is less clear. It's no longer
obvious which registers we're writing 0 to.

Thanks,
Steve

>  }
>  
>  static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)

