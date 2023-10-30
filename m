Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7927DBC31
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC610E2E9;
	Mon, 30 Oct 2023 14:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82D6A10E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:56:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9783FFEC;
 Mon, 30 Oct 2023 07:57:36 -0700 (PDT)
Received: from [10.57.36.72] (unknown [10.57.36.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92ACD3F64C;
 Mon, 30 Oct 2023 07:56:52 -0700 (PDT)
Message-ID: <f6b0d965-f386-48ad-80a7-072c81a9e4a8@arm.com>
Date: Mon, 30 Oct 2023 14:57:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
 <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
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

On 30/10/2023 13:22, AngeloGioacchino Del Regno wrote:
> Currently, the GPU is being internally powered off for runtime suspend
> and turned back on for runtime resume through commands sent to it, but
> note that the GPU doesn't need to be clocked during the poweroff state,
> hence it is possible to save some power on selected platforms.

Looks like a good addition - I suspect some implementations are quite
leaky so this could have a meaningful power saving in some cases.

> Add suspend and resume handlers for full system sleep and then add
> a new panfrost_gpu_pm enumeration and a pm_features variable in the
> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
> enable this power saving technique only on SoCs that are able to
> safely use it.
> 
> Note that this was implemented only for the system sleep case and not
> for runtime PM because testing on one of my MediaTek platforms showed
> issues when turning on and off clocks aggressively (in PM runtime),
> with the GPU locking up and unable to soft reset, eventually resulting
> in a full system lockup.

I think I know why you saw this - see below.

> Doing this only for full system sleep never showed issues in 3 days
> of testing by suspending and resuming the system continuously.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
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

So this function calls panfrost_gpu_power_off() which is simply:

void panfrost_gpu_power_off(struct panfrost_device *pfdev)
{
	gpu_write(pfdev, TILER_PWROFF_LO, 0);
	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
	gpu_write(pfdev, L2_PWROFF_LO, 0);
}

So we instruct the GPU to turn off, but don't wait for it to complete.

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

So here we've started shutting down the GPU (pm_runtime_force_suspend
eventually calls panfrost_gpu_power_off). But nothing here waits for the
GPU to actually finish shutting down. If we're unlucky there's dirty
data in the caches (or coherency which can snoop into the caches) so the
GPU could be actively making bus cycles...

> +
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> +		clk_disable(pfdev->clock);

... until its clock goes and everything locks up.

Something should be waiting for the power down to complete. Either poll
the L2_PWRTRANS_LO register to detect that the L2 is no longer
transitioning, or wait for the GPU_IRQ_POWER_CHANGED_ALL interrupt to fire.

It would be good to test this with the system suspend doing the full
power off, it should be safe so it would be a good stress test. Although
whether we want the overhead in normal operation is another matter - so
I suspect it should just be for testing purposes.

I would hope that we don't actually need the GPU_PM_CLK_DIS feature -
this should work as long as the GPU is given the time to shutdown.
Although note that actually cutting the power (patches 3 & 4) may expose
us to implementation errata - there have been issues with designs not
resetting correctly. I'm not sure if those made it into real products or
if such bugs are confined to test chips. So for the sake of not causing
regressions it's probably not a bad thing to have ;)

Steve

> +
> +		if (pfdev->bus_clock)
> +			clk_disable(pfdev->bus_clock);
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

