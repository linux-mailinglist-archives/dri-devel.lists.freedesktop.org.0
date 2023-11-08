Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5F7E5A58
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA75910E7AD;
	Wed,  8 Nov 2023 15:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 140DA10E7AA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:44:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B5F1476;
 Wed,  8 Nov 2023 07:45:35 -0800 (PST)
Received: from [10.1.36.61] (e122027.cambridge.arm.com [10.1.36.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1EA3F64C;
 Wed,  8 Nov 2023 07:44:48 -0800 (PST)
Message-ID: <343788b6-c3b7-44f3-9376-d6937baeb16e@arm.com>
Date: Wed, 8 Nov 2023 15:44:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
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
> Currently, the GPU is being internally powered off for runtime suspend
> and turned back on for runtime resume through commands sent to it, but
> note that the GPU doesn't need to be clocked during the poweroff state,
> hence it is possible to save some power on selected platforms.
> 
> Add suspend and resume handlers for full system sleep and then add
> a new panfrost_gpu_pm enumeration and a pm_features variable in the
> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
> enable this power saving technique only on SoCs that are able to
> safely use it.
> 
> Note that this was implemented only for the system sleep case and not
> for runtime PM because testing on one of my MediaTek platforms showed
> issues when turning on and off clocks aggressively (in PM runtime)
> resulting in a full system lockup.
> 
> Doing this only for full system sleep never showed issues during my
> testing by suspending and resuming the system continuously for more
> than 100 cycles.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Note: Even after fixing the panfrost_power_off() function, I'm still
> getting issues with turning off the clocks at .runtime_suspend() but
> this time, instead of getting a GPU lockup, the entire SoC will deadlock
> bringing down the entire system with it (so it's even worst!) :-)

Ouch! Hopefully that's a SoC issue as I can't see anything that should
cause problems. But note that if the GPU is powered down during a bus
transaction that can lock up the entire bus.
> 
> 
>  drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
>  2 files changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 28f7046e1b1a..2022ed76a620 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>  	panfrost_job_enable_interrupts(pfdev);
>  }
>  
> -static int panfrost_device_resume(struct device *dev)
> +static int panfrost_device_runtime_resume(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int panfrost_device_suspend(struct device *dev)
> +static int panfrost_device_runtime_suspend(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
> -			      panfrost_device_resume, NULL);
> +static int panfrost_device_resume(struct device *dev)
> +{
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> +		ret = clk_enable(pfdev->clock);
> +		if (ret)
> +			return ret;
> +
> +		if (pfdev->bus_clock) {
> +			ret = clk_enable(pfdev->bus_clock);
> +			if (ret)
> +				goto err_bus_clk;
> +		}
> +	}
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		goto err_resume;
> +
> +	return 0;
> +
> +err_resume:
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
> +		clk_disable(pfdev->bus_clock);
> +err_bus_clk:
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
> +		clk_disable(pfdev->clock);
> +	return ret;
> +}
> +
> +static int panfrost_device_suspend(struct device *dev)
> +{
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> +		clk_disable(pfdev->clock);
> +
> +		if (pfdev->bus_clock)
> +			clk_disable(pfdev->bus_clock);

NIT: I would normally expect panfrost_device_resume() to have the
opposite order. I'm not sure if there's an expected order here but I
feel like the bus should be enabled before core - so _resume() would
need to be swapped round.

Other than that:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> +	}
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
> +	RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
> +};
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 1ef38f60d5dc..d7f179eb8ea3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -25,6 +25,14 @@ struct panfrost_perfcnt;
>  #define NUM_JOB_SLOTS 3
>  #define MAX_PM_DOMAINS 5
>  
> +/**
> + * enum panfrost_gpu_pm - Supported kernel power management features
> + * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> + */
> +enum panfrost_gpu_pm {
> +	GPU_PM_CLK_DIS,
> +};
> +
>  struct panfrost_features {
>  	u16 id;
>  	u16 revision;
> @@ -75,6 +83,9 @@ struct panfrost_compatible {
>  
>  	/* Vendor implementation quirks callback */
>  	void (*vendor_quirk)(struct panfrost_device *pfdev);
> +
> +	/* Allowed PM features */
> +	u8 pm_features;
>  };
>  
>  struct panfrost_device {

