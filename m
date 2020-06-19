Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40181200465
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 10:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82F6EC33;
	Fri, 19 Jun 2020 08:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78A906EC33
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 08:52:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDAEB2B;
 Fri, 19 Jun 2020 01:52:28 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C21CB3F71F;
 Fri, 19 Jun 2020 01:52:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] panfrost: Make sure GPU is powered on when reading
 GPU_LATEST_FLUSH_ID
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2bd3f3c6-aa6f-4082-c2e4-949509c2ebae@arm.com>
Date: Fri, 19 Jun 2020 09:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2020 09:58, Tomeu Vizoso wrote:
> Bifrost devices do support the flush reduction feature, so on first job
> submit we were trying to read the register while still powered off.
> 
> If the GPU is powered off, the feature doesn't bring any benefit, so
> don't try to read.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f2c1ddc41a9b..e0f190e43813 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -10,6 +10,7 @@
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   
>   #include "panfrost_device.h"
>   #include "panfrost_features.h"
> @@ -368,7 +369,16 @@ void panfrost_gpu_fini(struct panfrost_device *pfdev)
>   
>   u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
>   {
> -	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
> -		return gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
> +	u32 flush_id;
> +
> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION)) {
> +		/* Flush reduction only makes sense when the GPU is kept powered on between jobs */
> +		if (pm_runtime_get_if_in_use(pfdev->dev)) {
> +			flush_id = gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
> +			pm_runtime_put(pfdev->dev);
> +			return flush_id;
> +		}
> +	}
> +
>   	return 0;
>   }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
