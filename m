Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0A7E7CD9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48310E057;
	Fri, 10 Nov 2023 14:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6155910E057
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:08:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDBDA12FC;
 Fri, 10 Nov 2023 06:09:29 -0800 (PST)
Received: from [10.57.36.221] (unknown [10.57.36.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0BD73F7C5;
 Fri, 10 Nov 2023 06:08:42 -0800 (PST)
Message-ID: <2a170bec-dca9-483e-9f2b-9ef2662151f2@arm.com>
Date: Fri, 10 Nov 2023 14:08:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/panfrost: Implement ability to turn on/off
 regulators in suspend
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
 <20231109102543.42971-6-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231109102543.42971-6-angelogioacchino.delregno@collabora.com>
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
> Some platforms/SoCs can power off the GPU entirely by completely cutting
> off power, greatly enhancing battery time during system suspend: add a
> new pm_feature GPU_PM_VREG_OFF to allow turning off the GPU regulators
> during full suspend only on selected platforms.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index b4ddbc3b8069..c90ad5ee34e7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -431,10 +431,21 @@ static int panfrost_device_resume(struct device *dev)
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF)) {
> +		unsigned long freq = pfdev->pfdevfreq.fast_rate;
> +		struct dev_pm_opp *opp;
> +
> +		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +		if (IS_ERR(opp))
> +			return PTR_ERR(opp);
> +		dev_pm_opp_set_opp(dev, opp);
> +		dev_pm_opp_put(opp);
> +	}
> +
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>  		ret = clk_enable(pfdev->clock);
>  		if (ret)
> -			return ret;
> +			goto err_clk;
>  
>  		if (pfdev->bus_clock) {
>  			ret = clk_enable(pfdev->bus_clock);
> @@ -455,6 +466,9 @@ static int panfrost_device_resume(struct device *dev)
>  err_bus_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
>  		clk_disable(pfdev->clock);
> +err_clk:
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
> +		dev_pm_opp_set_opp(dev, NULL);
>  	return ret;
>  }
>  
> @@ -474,6 +488,9 @@ static int panfrost_device_suspend(struct device *dev)
>  		clk_disable(pfdev->clock);
>  	}
>  
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
> +		dev_pm_opp_set_opp(dev, NULL);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index d7f179eb8ea3..0fc558db6bfd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -28,9 +28,11 @@ struct panfrost_perfcnt;
>  /**
>   * enum panfrost_gpu_pm - Supported kernel power management features
>   * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> + * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
>   */
>  enum panfrost_gpu_pm {
>  	GPU_PM_CLK_DIS,
> +	GPU_PM_VREG_OFF,
>  };
>  
>  struct panfrost_features {

