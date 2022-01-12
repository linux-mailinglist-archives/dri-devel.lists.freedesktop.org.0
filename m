Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111448C780
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 16:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0807810E4CD;
	Wed, 12 Jan 2022 15:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B97C010E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 15:46:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A17DD6E;
 Wed, 12 Jan 2022 07:46:55 -0800 (PST)
Received: from [10.57.36.149] (unknown [10.57.36.149])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D960D3F774;
 Wed, 12 Jan 2022 07:46:53 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Check for error num after setting mask
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220106030326.2620942-1-jiasheng@iscas.ac.cn>
From: Steven Price <steven.price@arm.com>
Message-ID: <297c5a64-796b-66c5-749a-522fd17f75c2@arm.com>
Date: Wed, 12 Jan 2022 15:46:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106030326.2620942-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/01/2022 03:03, Jiasheng Jiang wrote:
> Because of the possible failure of the dma_supported(), the
> dma_set_mask_and_coherent() may return error num.
> Therefore, it should be better to check it and return the error if
> fails.
> 
> Fixes: d9b631f0a0c4 ("drm/panfrost: Set DMA masks earlier")

That commit just moved the code around, the actual missing error
handling dates from the very beginning (f3ba91228e8e ("drm/panfrost: Add
initial panfrost driver")). But I can fix that up when merging.

> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 2aae636f1cf5..107ad2d764ec 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -359,8 +359,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  
>  	panfrost_gpu_init_features(pfdev);
>  
> -	dma_set_mask_and_coherent(pfdev->dev,
> +	err = dma_set_mask_and_coherent(pfdev->dev,
>  		DMA_BIT_MASK(FIELD_GET(0xff00, pfdev->features.mmu_features)));
> +	if (err)
> +		return err;
> +
>  	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>  
>  	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> 

