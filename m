Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7A4B5611
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C31610E23D;
	Mon, 14 Feb 2022 16:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74F4610E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29F4713D5;
 Mon, 14 Feb 2022 08:23:39 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7453F70D;
 Mon, 14 Feb 2022 08:23:38 -0800 (PST)
Message-ID: <193fdaa1-ded8-98da-4b68-d5bf1cd74fdb@arm.com>
Date: Mon, 14 Feb 2022 16:23:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] drm/panfrost: Don't set L2_MMU_CONFIG quirks
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-8-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-8-alyssa.rosenzweig@collabora.com>
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> L2_MMU_CONFIG is an implementation-defined register. Different Mali GPUs
> define slightly different MAX_READS and MAX_WRITES fields, which
> throttle outstanding reads and writes when set to non-zero values. When
> left as zero, reads and writes are not throttled.
> 
> Both kbase and panfrost always zero these registers. Per discussion with
> Steven Price, there are two reasons these quirks may be used:
> 
> 1. Simulating slower memory subsystems. This use case is only of
>    interest to system-on-chip designers; it is not relevant to mainline.
> 
> 2. Working around broken memory subsystems. Hopefully we never see this
>    case in mainline. If we do, we'll need to set this register based on
>    an SoC-compatible, rather than generally matching on the GPU model.
> 
> To the best of our knowledge, these fields are zero at reset, so the
> write is not necessary. Let's remove the write to aid porting to new
> Mali GPUs, which have different layouts for the L2_MMU_CONFIG register.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Suggested-by: Steven Price <steven.price@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 1c1e2017aa80..73e5774f01c1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -127,18 +127,6 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>  	gpu_write(pfdev, GPU_TILER_CONFIG, quirks);
>  
>  
> -	quirks = gpu_read(pfdev, GPU_L2_MMU_CONFIG);
> -
> -	/* Limit read & write ID width for AXI */
> -	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
> -		quirks &= ~(L2_MMU_CONFIG_3BIT_LIMIT_EXTERNAL_READS |
> -			    L2_MMU_CONFIG_3BIT_LIMIT_EXTERNAL_WRITES);
> -	else
> -		quirks &= ~(L2_MMU_CONFIG_LIMIT_EXTERNAL_READS |
> -			    L2_MMU_CONFIG_LIMIT_EXTERNAL_WRITES);
> -
> -	gpu_write(pfdev, GPU_L2_MMU_CONFIG, quirks);
> -
>  	quirks = 0;
>  	if ((panfrost_model_eq(pfdev, 0x860) || panfrost_model_eq(pfdev, 0x880)) &&
>  	    pfdev->features.revision >= 0x2000)

