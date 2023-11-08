Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A07E5A56
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80810E7A9;
	Wed,  8 Nov 2023 15:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC66D10E7A9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:44:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B21AD1476;
 Wed,  8 Nov 2023 07:45:29 -0800 (PST)
Received: from [10.1.36.61] (e122027.cambridge.arm.com [10.1.36.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4BDD3F64C;
 Wed,  8 Nov 2023 07:44:42 -0800 (PST)
Message-ID: <92478932-4fd4-43c3-9ee0-c4ce19026984@arm.com>
Date: Wed, 8 Nov 2023 15:44:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/panfrost: Perform hard reset to recover GPU if
 soft reset fails
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-2-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231102142643.75288-2-angelogioacchino.delregno@collabora.com>
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

On 02/11/2023 14:26, AngeloGioacchino Del Regno wrote:
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
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c  | 14 ++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_regs.h |  1 +
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index fad75b6e543e..7e9e2cf26e4d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -60,14 +60,20 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  
>  	gpu_write(pfdev, GPU_INT_MASK, 0);
>  	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  
> +	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
>  		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
> -

I'm not sure what's going on with blank lines above - AFAICT there's no
actual change just a blank line being moved. It's best to avoid blank
line changes to keep the diff readable.

>  	if (ret) {
> -		dev_err(pfdev->dev, "gpu soft reset timed out\n");
> -		return ret;
> +		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
> +
> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_HARD_RESET);
> +		ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
> +			val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);

NIT: checkpatch complains about the alignment here.

Other than the minor comments this looks fine. Hard reset isn't
something we want to use (there's a possibility of locking up the system
if it occurs during a bus transaction) but it can sometimes recover an
otherwise completely locked up GPU.

Steve

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

