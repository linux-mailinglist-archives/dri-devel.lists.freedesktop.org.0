Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C06890531
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 17:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FB41124DF;
	Thu, 28 Mar 2024 16:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FE641124DE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 16:30:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 132A81476;
 Thu, 28 Mar 2024 09:31:15 -0700 (PDT)
Received: from [10.1.29.21] (e122027.cambridge.arm.com [10.1.29.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC09F3F694;
 Thu, 28 Mar 2024 09:30:39 -0700 (PDT)
Message-ID: <9b4ac3de-21b2-4602-b96d-f51e8d4e6b14@arm.com>
Date: Thu, 28 Mar 2024 16:30:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: fix power transition timeout warnings
Content-Language: en-GB
To: Christian Hewitt <christianshewitt@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240322164525.2617508-1-christianshewitt@gmail.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240322164525.2617508-1-christianshewitt@gmail.com>
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

On 22/03/2024 16:45, Christian Hewitt wrote:
> Increase the timeout value to prevent system logs on Amlogic boards flooding
> with power transition warnings:
> 
> [   13.047638] panfrost ffe40000.gpu: shader power transition timeout
> [   13.048674] panfrost ffe40000.gpu: l2 power transition timeout
> [   13.937324] panfrost ffe40000.gpu: shader power transition timeout
> [   13.938351] panfrost ffe40000.gpu: l2 power transition timeout
> ...
> [39829.506904] panfrost ffe40000.gpu: shader power transition timeout
> [39829.507938] panfrost ffe40000.gpu: l2 power transition timeout
> [39949.508369] panfrost ffe40000.gpu: shader power transition timeout
> [39949.509405] panfrost ffe40000.gpu: l2 power transition timeout
> 
> The 2000 value has been found through trial and error testing with devices
> using G52 and G31 GPUs.
> 
> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Queued to drm-misc-fixes.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 9063ce254642..fd8e44992184 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -441,19 +441,19 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>  
>  	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
> -					 val, !val, 1, 1000);
> +					 val, !val, 1, 2000);
>  	if (ret)
>  		dev_err(pfdev->dev, "shader power transition timeout");
>  
>  	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
> -					 val, !val, 1, 1000);
> +					 val, !val, 1, 2000);
>  	if (ret)
>  		dev_err(pfdev->dev, "tiler power transition timeout");
>  
>  	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>  	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
> -				 val, !val, 0, 1000);
> +				 val, !val, 0, 2000);
>  	if (ret)
>  		dev_err(pfdev->dev, "l2 power transition timeout");
>  }

