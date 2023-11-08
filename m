Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F387E5A57
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90D10E7AB;
	Wed,  8 Nov 2023 15:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AB5410E7AA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:44:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 884951515;
 Wed,  8 Nov 2023 07:45:32 -0800 (PST)
Received: from [10.1.36.61] (e122027.cambridge.arm.com [10.1.36.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF543F64C;
 Wed,  8 Nov 2023 07:44:46 -0800 (PST)
Message-ID: <00029aa9-6a28-4f7f-bc96-cdf8c6820ea0@arm.com>
Date: Wed, 8 Nov 2023 15:44:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/panfrost: Tighten polling for soft reset and
 power on
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-3-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231102142643.75288-3-angelogioacchino.delregno@collabora.com>
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
> In many cases, soft reset takes more than 1 microsecond, but definitely
> less than 10; moreover in the poweron flow, tilers, shaders and l2 will
> become ready (each) in less than 10 microseconds as well.
> 
> Even in the cases (at least on my platforms, rarely) in which those take
> more than 10 microseconds, it's very unlikely to see both soft reset and
> poweron to take more than 70 microseconds.
> 
> Shorten the polling delay to 10 microseconds to consistently reduce the
> runtime resume time of the GPU.
> 
> As an indicative example, measurements taken on a MediaTek MT8195 SoC
> 
> Average runtime resume time in nanoseconds before this commit:
> GDM, user selection up/down:            88435ns
> GDM, Text Entry (typing user/password): 91489ns
> GNOME Desktop, idling, GKRELLM running: 73200ns
> 
> After this commit:
> 
> GDM: user selection up/down:            26690ns
> GDM: Text Entry (typing user/password): 27917ns
> GNOME Desktop, idling, GKRELLM running:	25304ns
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 7e9e2cf26e4d..e264e8c2252d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -63,7 +63,7 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  
>  	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
> -		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
> +		val, val & GPU_IRQ_RESET_COMPLETED, 10, 10000);
>  	if (ret) {
>  		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
>  
> @@ -403,7 +403,7 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
>  		val, val == (pfdev->features.l2_present & core_mask),
> -		100, 20000);
> +		10, 20000);
>  	if (ret)
>  		dev_err(pfdev->dev, "error powering up gpu L2");
>  
> @@ -411,13 +411,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  		  pfdev->features.shader_present & core_mask);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
>  		val, val == (pfdev->features.shader_present & core_mask),
> -		100, 20000);
> +		10, 20000);
>  	if (ret)
>  		dev_err(pfdev->dev, "error powering up gpu shader");
>  
>  	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
> -		val, val == pfdev->features.tiler_present, 100, 1000);
> +		val, val == pfdev->features.tiler_present, 10, 1000);
>  	if (ret)
>  		dev_err(pfdev->dev, "error powering up gpu tiler");
>  }

