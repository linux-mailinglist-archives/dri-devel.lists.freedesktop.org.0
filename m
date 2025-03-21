Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6BA6B624
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECED10E3C2;
	Fri, 21 Mar 2025 08:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YcCuxvUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DA810E3C2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742546474;
 bh=jFD41Ga1a3ERHEQFFB9Ia0CbBpdK6p7SMSxtDffC8Jg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YcCuxvUeYG37e/WVjVxRefcNzuE7LGgDwuFD3wUfinmTYt9J7wwIWe2G7wZVSg9uk
 hOnhtP1A5KE7UsrMd3sbvU0h4/sz1G8hTzkKe5TMhCPOsMO0RusSEM6ydCXSheTrI4
 HUVFhuJQkYv2ieQrK4+W0jioGtLvao2Pp5yHxqaCbkZqFIa2N7nkJMnwcJDothjTsa
 chpQNguAREeWsQsog5vntf15iK94niPYrv2Bmc3gyPaDn4aYTs6puRsUsIHJPSOapb
 QPPwKPrM5c+jaZ9qfD2YxqxwdNNdkUMaw7uNRXY59Xu81AxzfGHKQ0kXTd6cSyCZTr
 ybXRzop2xgu+g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 34CF117E0147;
 Fri, 21 Mar 2025 09:41:14 +0100 (CET)
Date: Fri, 21 Mar 2025 09:41:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] drm/panthor: Support GPU_CONTROL cache flush
 based on feature bit
Message-ID: <20250321094109.116a6915@collabora.com>
In-Reply-To: <20250320111741.1937892-8-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-8-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 20 Mar 2025 11:17:39 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
> Mali-G720 onwards, this patch adds support for performing cache
> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
> feature bit.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index dfe0f86c5d76..4d67fdfe86f9 100644
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
> index a0a79f19bdea..4ac8bf36177e 100644
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

Can't we use this sequence on v10 as well? The GPU flush_cache command
exists there, so I'd rather switch all CSF HW to this sequence than
diverge on v11+.

> +
>  	/* Run the MMU operation */
>  	write_cmd(ptdev, as_nr, op);
>  

