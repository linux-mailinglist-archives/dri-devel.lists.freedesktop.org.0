Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9B1358C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 13:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9B86E904;
	Thu,  9 Jan 2020 12:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1EB26E904
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 12:03:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7293831B;
 Thu,  9 Jan 2020 04:03:56 -0800 (PST)
Received: from [10.1.32.29] (e122027.cambridge.arm.com [10.1.32.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6553F534;
 Thu,  9 Jan 2020 04:03:53 -0800 (PST)
Subject: Re: [PATCH v2 3/7] drm/panfrost: Improve error reporting in
 panfrost_gpu_power_on
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-4-drinkcat@chromium.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <3997e444-e388-929f-b764-537d62643bae@arm.com>
Date: Thu, 9 Jan 2020 12:03:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108052337.65916-4-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2020 05:23, Nicolas Boichat wrote:
> It is useful to know which component cannot be powered on.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Looks like helpful error reporting.

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> ---
> 
> Was useful when trying to probe bifrost GPU, to understand what
> issue we are facing.
> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 8822ec13a0d619f..ba02bbfcf28c011 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -308,21 +308,26 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>   	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
>   		val, val == pfdev->features.l2_present, 100, 1000);
> +	if (ret)
> +		dev_err(pfdev->dev, "error powering up gpu L2");
>   
>   	gpu_write(pfdev, STACK_PWRON_LO, pfdev->features.stack_present);
> -	ret |= readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
> +	ret = readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
>   		val, val == pfdev->features.stack_present, 100, 1000);
> +	if (ret)
> +		dev_err(pfdev->dev, "error powering up gpu stack");

As mentioned in my previous email - we could just drop this entire section dealing with the core stacks and let the GPU's own dependency management code handle it. Of course there might be a GPU out there for which that is broken... in which case some sort of quirk handling will be needed :(

Steve

>   
>   	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
> -	ret |= readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
> +	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
>   		val, val == pfdev->features.shader_present, 100, 1000);
> +	if (ret)
> +		dev_err(pfdev->dev, "error powering up gpu shader");
>   
>   	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
> -	ret |= readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
> +	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
>   		val, val == pfdev->features.tiler_present, 100, 1000);
> -
>   	if (ret)
> -		dev_err(pfdev->dev, "error powering up gpu");
> +		dev_err(pfdev->dev, "error powering up gpu tiler");
>   }
>   
>   void panfrost_gpu_power_off(struct panfrost_device *pfdev)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
