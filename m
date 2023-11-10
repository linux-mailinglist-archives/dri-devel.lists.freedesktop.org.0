Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EDE7E7CCE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3691710E03F;
	Fri, 10 Nov 2023 14:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4795A10E03F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:03:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2379112FC;
 Fri, 10 Nov 2023 06:04:36 -0800 (PST)
Received: from [10.57.36.221] (unknown [10.57.36.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22FEA3F7C5;
 Fri, 10 Nov 2023 06:03:48 -0800 (PST)
Message-ID: <e2d278b6-2247-4b1c-b464-8b5903851f9a@arm.com>
Date: Fri, 10 Nov 2023 14:03:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/panfrost: Perform hard reset to recover GPU if
 soft reset fails
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
 <20231109102543.42971-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231109102543.42971-2-angelogioacchino.delregno@collabora.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2023 10:25, AngeloGioacchino Del Regno wrote:
> Even though soft reset should ideally never fail, during development of
> some power management features I managed to get some bits wrong: this
> resulted in GPU soft reset failures, where the GPU was never able to
> recover, not even after suspend/resume cycles, meaning that the only
> way to get functionality back was to reboot the machine.
> 
> Perform a hard reset after a soft reset failure to be able to recover
> the GPU during runtime (so, without any machine reboot).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c  | 13 ++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_regs.h |  1 +
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f0be7e19b13e..ae3f7d97bb47 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -60,14 +60,21 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  
>  	gpu_write(pfdev, GPU_INT_MASK, 0);
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  
> +	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
>  		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
>  
>  	if (ret) {
> -		dev_err(pfdev->dev, "gpu soft reset timed out\n");
> -		return ret;
> +		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
> +
> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_HARD_RESET);
> +		ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT, val,
> +						 val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
> +		if (ret) {
> +			dev_err(pfdev->dev, "gpu hard reset timed out\n");
> +			return ret;
> +		}
>  	}
>  
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 55ec807550b3..c25743b05c55 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -44,6 +44,7 @@
>  	 GPU_IRQ_MULTIPLE_FAULT)
>  #define GPU_CMD				0x30
>  #define   GPU_CMD_SOFT_RESET		0x01
> +#define   GPU_CMD_HARD_RESET		0x02
>  #define   GPU_CMD_PERFCNT_CLEAR		0x03
>  #define   GPU_CMD_PERFCNT_SAMPLE	0x04
>  #define   GPU_CMD_CYCLE_COUNT_START	0x05

