Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23C41DBFD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A006E40A;
	Thu, 30 Sep 2021 14:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE566E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:06:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21B0B60EFD;
 Thu, 30 Sep 2021 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633010801;
 bh=pV7wpRwYeddObrK3x2BRYB+BUb70rVeOOPgHw93L05s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwqrJQlhmfkysFaoognvTOMelKZtmYisb28Nclpv9JNZM5fKRoqU5N08wrdIB/8Ht
 uCsrMPtZOerzkZJDJxX8HuyOzi8v2dS05SPBGCeFL8co8ze1Eff0K8sTcO4xoF5BY3
 VkfLEMMzEdfpdHBcEpC36gkcfZNeS7UKbrcWf6vmNHI8Ik/zp7a1iZwnzMQbIpqqYJ
 UjRY3MtB2BMNzsvqw9EuTmsqIosTWxA967zuqh7NkSo4Zx3zDgTNogCUcsB3kSaxDD
 1ApooBGjRExDQPUD9YGX108RZp4nkFd4kE9Cc3+nBxRsInYcbhNPuMRrs+mdt6w/hY
 jeHacm3qNygIQ==
Date: Thu, 30 Sep 2021 22:06:30 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v13 16/35] usb: chipidea: tegra: Add runtime PM and OPP
 support
Message-ID: <20210930140630.GA6697@Peter>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-17-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210926224058.1252-17-digetx@gmail.com>
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

On 21-09-27 01:40:39, Dmitry Osipenko wrote:
> The Tegra USB controller belongs to the core power domain and we're going
> to enable GENPD support for the core domain. Now USB controller must be
> resumed using runtime PM API in order to initialize the USB power state.
> We already support runtime PM for the CI device, but CI's PM is separated
> from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
> to the driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 53 ++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 60361141ac04..3142ef7ebe42 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -7,6 +7,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
>  #include <linux/usb.h>
> @@ -15,6 +16,8 @@
>  #include <linux/usb/of.h>
>  #include <linux/usb/phy.h>
>  
> +#include <soc/tegra/common.h>
> +
>  #include "../host/ehci.h"
>  
>  #include "ci.h"
> @@ -278,6 +281,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	if (!usb)
>  		return -ENOMEM;
>  
> +	platform_set_drvdata(pdev, usb);
> +
>  	soc = of_device_get_match_data(&pdev->dev);
>  	if (!soc) {
>  		dev_err(&pdev->dev, "failed to match OF data\n");
> @@ -296,11 +301,17 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	err = clk_prepare_enable(usb->clk);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
> +	err = devm_pm_runtime_enable(&pdev->dev);
> +	if (err)
> +		return err;
> +
> +	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +	if (err)
> +		return err;
> +
> +	err = pm_runtime_resume_and_get(&pdev->dev);
> +	if (err)
>  		return err;
> -	}
>  
>  	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
>  		usb->needs_double_reset = true;
> @@ -320,8 +331,6 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	if (err)
>  		goto fail_power_off;
>  
> -	platform_set_drvdata(pdev, usb);
> -
>  	/* setup and register ChipIdea HDRC device */
>  	usb->soc = soc;
>  	usb->data.name = "tegra-usb";
> @@ -350,7 +359,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  phy_shutdown:
>  	usb_phy_shutdown(usb->phy);
>  fail_power_off:
> -	clk_disable_unprepare(usb->clk);
> +	pm_runtime_put(&pdev->dev);
> +
>  	return err;
>  }
>  
> @@ -360,15 +370,44 @@ static int tegra_usb_remove(struct platform_device *pdev)
>  
>  	ci_hdrc_remove_device(usb->dev);
>  	usb_phy_shutdown(usb->phy);
> +	pm_runtime_put(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
> +{
> +	struct tegra_usb *usb = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = clk_prepare_enable(usb->clk);
> +	if (err < 0) {
> +		dev_err(dev, "failed to enable clock: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
> +{
> +	struct tegra_usb *usb = dev_get_drvdata(dev);
> +
>  	clk_disable_unprepare(usb->clk);
>  
>  	return 0;
>  }
>  
> +static const struct dev_pm_ops tegra_usb_pm = {
> +	SET_RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume,
> +			   NULL)
> +};
> +
>  static struct platform_driver tegra_usb_driver = {
>  	.driver = {
>  		.name = "tegra-usb",
>  		.of_match_table = tegra_usb_of_match,
> +		.pm = &tegra_usb_pm,
>  	},
>  	.probe = tegra_usb_probe,
>  	.remove = tegra_usb_remove,
> -- 
> 2.32.0
> 

I got below compile error if only compile this file, I think previous patches
should include the definition, if that, feel free to add my ack to this
patch.

Acked-by: Peter Chen <peter.chen@kernel.org>

drivers/usb/chipidea/ci_hdrc_tegra.c:308:8: error: implicit declaration of function ‘devm_tegra_core_dev_init_opp_table_common’;
did you mean ‘devm_tegra_core_dev_init_opp_table’? [-Werror=implicit-function-declaration]
  308 |  err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |        devm_tegra_core_dev_init_opp_table


-- 

Thanks,
Peter Chen

