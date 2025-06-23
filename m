Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B964FAE3C29
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F2210E2B0;
	Mon, 23 Jun 2025 10:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC24710E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:23:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59CCD113E;
 Mon, 23 Jun 2025 03:23:25 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6CA3F58B;
 Mon, 23 Jun 2025 03:23:39 -0700 (PDT)
Message-ID: <a0481aed-825f-4ba9-b112-df7891299015@arm.com>
Date: Mon, 23 Jun 2025 11:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-7-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250602143216.2621881-7-karunika.choo@arm.com>
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

On 02/06/2025 15:32, Karunika Choo wrote:
> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
> Mali-Gx20 onwards, this patch adds support for performing cache
> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of

NIT: s/GPU_CONTROL/GPU_COMMAND/ (also in the subject and below).
GPU_CONTROL is the register page.

> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
> feature bit.
> 
> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
> and Mali-Gx15 GPUs for consistency.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

I'm puzzled by this patch. You're introducing a new feature bit which is
always enabled on all GPUs at the end of the series. I think this should
be reworked to either:

a) Remove the feature bit and change all GPUs to the new GPU_COMMAND
cache flush mechanism. This should allow a minor code cleanup too.

b) Only opt-in new GPUs where FLUSH_MEM/FLUSH_PT are unavailable.

In particular this patch as it stands does two very different things -
it enables a new feature to be used on the new Gx20-onwards *and*
changes the existing behaviour on older GPUs (which has the possibility
of causing regressions).

A third option is of course to split the patch - add the new feature bit
but don't enable it in the first, and then the second patch is just
enabling the feature bit for existing GPUs. That makes reverting in case
of problems nice and easy. But there's also no point having the feature
bit if we don't expect any users of the old behaviour - so only do that
if you have good reason to think we're going to add a GPU using the old
behaviour.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index f5127a4b02dc..5ec9d7f28368 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  static struct panthor_hw panthor_hw_devices[] = {
>  	{
>  		.arch_major = 10,
> +		.features = {
> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +		},
>  	},
>  	{
>  		.arch_major = 11,
> +		.features = {
> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +		},
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 1a3cbc5589fd..2bb372fe9d4d 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -16,6 +16,12 @@ struct panthor_device;
>   * New feature flags will be added with support for newer GPU architectures.
>   */
>  enum panthor_hw_feature {
> +	/**
> +	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
> +	 * via GPU_CONTROL.
> +	 */
> +	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
> +
>  	/** @PANTHOR_HW_FEATURES_END: Must be last. */
>  	PANTHOR_HW_FEATURES_END
>  };
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b39ea6acc6a9..f9ccc8627032 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -29,7 +29,9 @@
>  
>  #include "panthor_device.h"
>  #include "panthor_gem.h"
> +#include "panthor_gpu.h"
>  #include "panthor_heap.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> +static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
> +				       u32 op)
> +{
> +	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
> +	u32 lsc_flush_op = 0;
> +	int ret;
> +
> +	if (op == AS_COMMAND_FLUSH_MEM)
> +		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
> +
> +	ret = wait_ready(ptdev, as_nr);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Explicitly unlock the region as the AS is not unlocked automatically
> +	 * at the end of the GPU_CONTROL cache flush command, unlike
> +	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
> +	 */
> +	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> +
> +	/* Wait for the unlock command to complete */
> +	return wait_ready(ptdev, as_nr);
> +}
> +
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  				      u64 iova, u64 size, u32 op)
>  {
> @@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	if (op != AS_COMMAND_UNLOCK)
>  		lock_region(ptdev, as_nr, iova, size);
>  
> +	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
> +		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
> +			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
> +
>  	/* Run the MMU operation */
>  	write_cmd(ptdev, as_nr, op);
>  

