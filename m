Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1E135B0F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 15:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D36E429;
	Thu,  9 Jan 2020 14:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1F1F6E429
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 14:08:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E6011FB;
 Thu,  9 Jan 2020 06:08:53 -0800 (PST)
Received: from [10.1.27.38] (unknown [10.1.27.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34AA63F534;
 Thu,  9 Jan 2020 06:08:49 -0800 (PST)
Subject: Re: [PATCH v2 5/7] drm/panfrost: Add support for multiple power
 domain support
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-6-drinkcat@chromium.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <b58a8cf9-3275-cf89-6dff-596aceeb8000@arm.com>
Date: Thu, 9 Jan 2020 14:08:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108052337.65916-6-drinkcat@chromium.org>
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
> When there is a single power domain per device, the core will
> ensure the power domains are all switched on.
> 
> However, when there are multiple ones, as in MT8183 Bifrost GPU,
> we need to handle them in driver code.
> 
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> The downstream driver we use on chromeos-4.19 currently uses 2
> additional devices in device tree to accomodate for this [1], but
> I believe this solution is cleaner.

I'm not sure what is best, but it seems odd to encode this into the Panfrost driver itself - it doesn't have any knowledge of what to do with these power domains. The naming of the domains looks suspiciously like someone thought that e.g. only half of the cores could be powered, but it doesn't look like that was implemented in the chromeos driver linked and anyway that is *meant* to be automatic in the hardware! (I.e. if you only power up one cores in one core stack then the PDC should only enable the power domain for that set of cores).

Steve

> 
> [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
> 
> drivers/gpu/drm/panfrost/panfrost_device.c | 87 ++++++++++++++++++++--
>   drivers/gpu/drm/panfrost/panfrost_device.h |  4 +
>   2 files changed, 83 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index a0b0a6fef8b4e63..c6e9e059de94a4d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -5,6 +5,7 @@
>   #include <linux/clk.h>
>   #include <linux/reset.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include "panfrost_device.h"
> @@ -131,6 +132,67 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
>   	regulator_disable(pfdev->regulator_sram);
>   }
>   
> +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> +		if (!pfdev->pm_domain_devs[i])
> +			break;
> +
> +		if (pfdev->pm_domain_links[i])
> +			device_link_del(pfdev->pm_domain_links[i]);
> +
> +		dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> +	}
> +}
> +
> +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> +{
> +	int err;
> +	int i, num_domains;
> +
> +	num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> +						 "power-domains",
> +						 "#power-domain-cells");
> +	/* Single domains are handled by the core. */
> +	if (num_domains < 2)
> +		return 0;
> +
> +	if (num_domains > ARRAY_SIZE(pfdev->pm_domain_devs)) {
> +		dev_err(pfdev->dev, "Too many pm-domains: %d\n", num_domains);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < num_domains; i++) {
> +		pfdev->pm_domain_devs[i] =
> +			dev_pm_domain_attach_by_id(pfdev->dev, i);
> +		if (IS_ERR(pfdev->pm_domain_devs[i])) {
> +			err = PTR_ERR(pfdev->pm_domain_devs[i]);
> +			pfdev->pm_domain_devs[i] = NULL;
> +			dev_err(pfdev->dev,
> +				"failed to get pm-domain %d: %d\n", i, err);
> +			goto err;
> +		}
> +
> +		pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> +				pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> +				DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
> +		if (!pfdev->pm_domain_links[i]) {
> +			dev_err(pfdev->pm_domain_devs[i],
> +				"adding device link failed!\n");
> +			err = -ENODEV;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	panfrost_pm_domain_fini(pfdev);
> +	return err;
> +}
> +
>   int panfrost_device_init(struct panfrost_device *pfdev)
>   {
>   	int err;
> @@ -161,37 +223,45 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   		goto err_out1;
>   	}
>   
> +	err = panfrost_pm_domain_init(pfdev);
> +	if (err) {
> +		dev_err(pfdev->dev, "pm_domain init failed %d\n", err);
> +		goto err_out2;
> +	}
> +
>   	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
>   	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
>   	if (IS_ERR(pfdev->iomem)) {
>   		dev_err(pfdev->dev, "failed to ioremap iomem\n");
>   		err = PTR_ERR(pfdev->iomem);
> -		goto err_out2;
> +		goto err_out3;
>   	}
>   
>   	err = panfrost_gpu_init(pfdev);
>   	if (err)
> -		goto err_out2;
> +		goto err_out3;
>   
>   	err = panfrost_mmu_init(pfdev);
>   	if (err)
> -		goto err_out3;
> +		goto err_out4;
>   
>   	err = panfrost_job_init(pfdev);
>   	if (err)
> -		goto err_out4;
> +		goto err_out5;
>   
>   	err = panfrost_perfcnt_init(pfdev);
>   	if (err)
> -		goto err_out5;
> +		goto err_out6;
>   
>   	return 0;
> -err_out5:
> +err_out6:
>   	panfrost_job_fini(pfdev);
> -err_out4:
> +err_out5:
>   	panfrost_mmu_fini(pfdev);
> -err_out3:
> +err_out4:
>   	panfrost_gpu_fini(pfdev);
> +err_out3:
> +	panfrost_pm_domain_fini(pfdev);
>   err_out2:
>   	panfrost_reset_fini(pfdev);
>   err_out1:
> @@ -208,6 +278,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>   	panfrost_mmu_fini(pfdev);
>   	panfrost_gpu_fini(pfdev);
>   	panfrost_reset_fini(pfdev);
> +	panfrost_pm_domain_fini(pfdev);
>   	panfrost_regulator_fini(pfdev);
>   	panfrost_clk_fini(pfdev);
>   }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index a124334d69e7e93..92d471676fc7823 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -19,6 +19,7 @@ struct panfrost_job;
>   struct panfrost_perfcnt;
>   
>   #define NUM_JOB_SLOTS 3
> +#define MAX_PM_DOMAINS 3
>   
>   struct panfrost_features {
>   	u16 id;
> @@ -62,6 +63,9 @@ struct panfrost_device {
>   	struct regulator *regulator;
>   	struct regulator *regulator_sram;
>   	struct reset_control *rstc;
> +	/* pm_domains for devices with more than one. */
> +	struct device *pm_domain_devs[MAX_PM_DOMAINS];
> +	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
>   
>   	struct panfrost_features features;
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
