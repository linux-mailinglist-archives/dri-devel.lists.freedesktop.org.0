Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6787DBC32
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873BB10E2ED;
	Mon, 30 Oct 2023 14:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58F7410E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:56:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8DC1007;
 Mon, 30 Oct 2023 07:57:38 -0700 (PDT)
Received: from [10.57.36.72] (unknown [10.57.36.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2817C3F64C;
 Mon, 30 Oct 2023 07:56:54 -0700 (PDT)
Message-ID: <2b553f07-71d0-4d06-8f60-7cd8f29d78e1@arm.com>
Date: Mon, 30 Oct 2023 14:57:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panfrost: Implement ability to turn on/off
 regulators in suspend
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
 <20231030132257.85379-4-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231030132257.85379-4-angelogioacchino.delregno@collabora.com>
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
> Some platforms/SoCs can power off the GPU entirely by completely cutting
> off power, greatly enhancing battery time during system suspend: add a
> new pm_feature GPU_PM_VREG_OFF to allow turning off the GPU regulators
> during full suspend only on selected platforms.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 2022ed76a620..51b22eb0971d 100644
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
> +		dev_pm_opp_put(opp);
> +		dev_pm_opp_set_opp(dev, opp);

These lines look the wrong way round - surely we want to hang onto the
reference until the set_opp call is made?

Steve

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
>  			clk_disable(pfdev->bus_clock);
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

