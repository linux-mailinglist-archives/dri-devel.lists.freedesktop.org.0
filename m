Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E990BF01A3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF13710E32A;
	Mon, 20 Oct 2025 09:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A999710E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 09:10:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A4201063;
 Mon, 20 Oct 2025 02:10:43 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8E233F66E;
 Mon, 20 Oct 2025 02:10:48 -0700 (PDT)
Message-ID: <91b406f2-7221-49f9-89fd-6f3b6bd1f4f5@arm.com>
Date: Mon, 20 Oct 2025 10:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] drm/panthor: Add architecture-specific function
 operations
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-5-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-5-karunika.choo@arm.com>
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

On 14/10/2025 10:43, Karunika Choo wrote:
> Introduce architecture-specific function pointers to support
> architecture-dependent behaviours. This patch adds the following
> function pointers and updates their usage accordingly:
> 
> - soft_reset
> - l2_power_on
> - l2_power_off
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  4 ++--
>  drivers/gpu/drm/panthor/panthor_fw.c     |  5 +++--
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 13 ++++++++++---
>  drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c     |  9 ++++++++-
>  drivers/gpu/drm/panthor/panthor_hw.h     | 23 +++++++++++++++++++++++
>  6 files changed, 47 insertions(+), 8 deletions(-)
> 
<snip>
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 7a191e76aeec..5a4e4aad9099 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -20,12 +20,35 @@ enum panthor_hw_feature {
>  };
>  
>  
> +/**
> + * struct panthor_hw_ops - HW operations that are specific to a GPU
> + */
> +struct panthor_hw_ops {
> +	/** @soft_reset: Soft reset function pointer */
> +	int (*soft_reset)(struct panthor_device *ptdev);
> +#define panthor_hw_soft_reset(__ptdev) \
> +	((__ptdev)->hw->ops.soft_reset ? (__ptdev)->hw->ops.soft_reset(__ptdev) : 0)
> +
> +	/** @l2_power_off: L2 power off function pointer */
> +	int (*l2_power_off)(struct panthor_device *ptdev);
> +#define panthor_hw_l2_power_off(__ptdev) \
> +	((__ptdev)->hw->ops.l2_power_off ? (__ptdev)->hw->ops.l2_power_off(__ptdev) : 0)
> +
> +	/** @l2_power_on: L2 power on function pointer */
> +	int (*l2_power_on)(struct panthor_device *ptdev);
> +#define panthor_hw_l2_power_on(__ptdev) \
> +	((__ptdev)->hw->ops.l2_power_on ? (__ptdev)->hw->ops.l2_power_on(__ptdev) : 0)
> +};

Minor comments:

 * You are defining these to have a return value, but you haven't
updated any of the call-sites to deal with a failure (the return value
is ignored). This is actually an existing problem, but AFAICT the new
_pwr_ versions have more error codes which are simply getting thrown away.

 * Is there a good reason why we need to support these functions being
NULL? It seems unlikely to be useful, and TBH I'd prefer to just assign
a dummy (empty) function in those cases.

 * A static inline function would be neater and would avoid any
potential issues from the multiple evaluation of __ptdev.

Thanks,
Steve

> +
>  /**
>   * struct panthor_hw - GPU specific register mapping and functions
>   */
>  struct panthor_hw {
>  	/** @features: Bitmap containing panthor_hw_feature */
>  	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
> +
> +	/** @ops: Panthor HW specific operations */
> +	struct panthor_hw_ops ops;
>  };
>  
>  int panthor_hw_init(struct panthor_device *ptdev);

