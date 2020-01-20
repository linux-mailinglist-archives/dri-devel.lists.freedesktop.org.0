Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121B142E21
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 15:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8691B6E9A2;
	Mon, 20 Jan 2020 14:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93A856E9A2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 14:53:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DBCFEC;
 Mon, 20 Jan 2020 06:53:48 -0800 (PST)
Received: from [10.1.194.52] (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CEDB3F52E;
 Mon, 20 Jan 2020 06:53:46 -0800 (PST)
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add support for multiple power
 domains
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-6-drinkcat@chromium.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <8b300f30-aa6d-89ee-77e3-271e3fa013f8@arm.com>
Date: Mon, 20 Jan 2020 14:53:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200114071602.47627-6-drinkcat@chromium.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/01/2020 07:16, Nicolas Boichat wrote:
> When there is a single power domain per device, the core will
> ensure the power domain is switched on (so it is technically
> equivalent to having not power domain specified at all).
> 
> However, when there are multiple domains, as in MT8183 Bifrost
> GPU, we need to handle them in driver code.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> 
> ---
> 
> The downstream driver we use on chromeos-4.19 currently uses 2
> additional devices in device tree to accomodate for this [1], but
> I believe this solution is cleaner.
> 
> [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
> 
> v3:
>  - Use the compatible matching data to specify the number of power
>    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
>    as the core will handle these 2 cases in the exact same way
>    (automatically, without driver intervention), and there should
>    be no adverse consequence in this case (the concern is about
>    switching on only some power domains and not others).
> 
>  drivers/gpu/drm/panfrost/panfrost_device.c | 95 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h |  9 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
>  3 files changed, 97 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index c30e0a3772a4f57..7c9766f76cc7689 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -5,6 +5,7 @@
>  #include <linux/clk.h>
>  #include <linux/reset.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include "panfrost_device.h"
> @@ -119,6 +120,75 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
>  			pfdev->regulators);
>  }
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
> +
> +	/*
> +	 * Single domain is handled by the core, and, if only a single power
> +	 * the power domain is requested, the property is optional.
> +	 */
> +	if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> +		return 0;
> +
> +	if (num_domains != pfdev->comp->num_pm_domains) {
> +		dev_err(pfdev->dev,
> +			"Incorrect number of power domains: %d provided, %d needed\n",
> +			num_domains, pfdev->comp->num_pm_domains);
> +		return -EINVAL;
> +	}
> +
> +	BUG_ON(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs));
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
>  int panfrost_device_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> @@ -149,37 +219,45 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  		goto err_out1;
>  	}
>  
> +	err = panfrost_pm_domain_init(pfdev);
> +	if (err) {
> +		dev_err(pfdev->dev, "pm_domain init failed %d\n", err);

No need for this print - panfrost_pm_domain_init() will output a (more
appropriate) error message on failure.

> +		goto err_out2;
> +	}
> +
>  	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
>  	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
>  	if (IS_ERR(pfdev->iomem)) {
>  		dev_err(pfdev->dev, "failed to ioremap iomem\n");
>  		err = PTR_ERR(pfdev->iomem);
> -		goto err_out2;
> +		goto err_out3;
>  	}
>  
>  	err = panfrost_gpu_init(pfdev);
>  	if (err)
> -		goto err_out2;
> +		goto err_out3;
>  
>  	err = panfrost_mmu_init(pfdev);
>  	if (err)
> -		goto err_out3;
> +		goto err_out4;
>  
>  	err = panfrost_job_init(pfdev);
>  	if (err)
> -		goto err_out4;
> +		goto err_out5;
>  
>  	err = panfrost_perfcnt_init(pfdev);
>  	if (err)
> -		goto err_out5;
> +		goto err_out6;
>  
>  	return 0;
> -err_out5:
> +err_out6:
>  	panfrost_job_fini(pfdev);
> -err_out4:
> +err_out5:
>  	panfrost_mmu_fini(pfdev);
> -err_out3:
> +err_out4:
>  	panfrost_gpu_fini(pfdev);
> +err_out3:
> +	panfrost_pm_domain_fini(pfdev);
>  err_out2:
>  	panfrost_reset_fini(pfdev);
>  err_out1:
> @@ -196,6 +274,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>  	panfrost_mmu_fini(pfdev);
>  	panfrost_gpu_fini(pfdev);
>  	panfrost_reset_fini(pfdev);
> +	panfrost_pm_domain_fini(pfdev);

NIT: The reverse of the construction order would be to do this before
panfrost_reset_fini().

Otherwise this LGTM.

Thanks,
Steve

>  	panfrost_regulator_fini(pfdev);
>  	panfrost_clk_fini(pfdev);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 021f063ffb3747f..143eab57180a2e1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -21,6 +21,7 @@ struct panfrost_perfcnt;
>  
>  #define NUM_JOB_SLOTS 3
>  #define MAX_REGULATORS 2
> +#define MAX_PM_DOMAINS 3
>  
>  struct panfrost_features {
>  	u16 id;
> @@ -61,6 +62,11 @@ struct panfrost_compatible {
>  	/* Supplies count and names. */
>  	int num_supplies;
>  	const char * const *supply_names;
> +	/*
> +	 * Number of power domains required, note that values 0 and 1 are
> +	 * handled identically, as only values > 1 need special handling.
> +	 */
> +	int num_pm_domains;
>  };
>  
>  struct panfrost_device {
> @@ -73,6 +79,9 @@ struct panfrost_device {
>  	struct clk *bus_clock;
>  	struct regulator_bulk_data regulators[MAX_REGULATORS];
>  	struct reset_control *rstc;
> +	/* pm_domains for devices with more than one. */
> +	struct device *pm_domain_devs[MAX_PM_DOMAINS];
> +	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
>  
>  	struct panfrost_features features;
>  	const struct panfrost_compatible* comp;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index db3563b80150c9d..42b87e29e605149 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -589,6 +589,7 @@ const char * const default_supplies[] = { "mali" };
>  static const struct panfrost_compatible default_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies),
>  	.supply_names = default_supplies,
> +	.num_pm_domains = 1, /* optional */
>  };
>  
>  static const struct of_device_id dt_match[] = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
