Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AE2DD81E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 19:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AB26E1BA;
	Thu, 17 Dec 2020 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E196E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k+TBWoCCmuI+juM/RDKcFjuPs5RlB1YJML8ROgxtvlw=; b=R5sL7KBWSOcu7q0eGSq07mz0ho
 j0+NPSXrRL9yeaniOZDHuWaAUVw2P1el8IkVWHrEKPgMyaBC6tPpkE02x+lkmACRyi1nUI8VYhEba
 GryzGGyvSAdgSkDMTxMEKoCwwgzZfq4x5sor0wcLurTcDMASw+FAGnWD3u9srW/2m1KyFb3bq1BD8
 YIjjrqGYlG6Uvnupn5dUXS/wm/r8RC4x4SnsVeQY9X9POgEG7Psy8lft01Vqfa3Qk/L1JC82JFrZE
 b6BZqcQDoGn0v3nSv9BC56rPFVkFjCWUpKHpOZ7VRD+T1n5S+8IZ4gdI2K2JtncSw/+m1ibYAuSDI
 8HY+qvmA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kpxu0-000859-J2; Thu, 17 Dec 2020 20:21:24 +0200
Subject: Re: [PATCH v2 34/48] gpu: host1x: Support power management
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-35-digetx@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <cb8dca7c-6ef2-5116-6c04-816a63525e2e@kapsi.fi>
Date: Thu, 17 Dec 2020 20:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201217180638.22748-35-digetx@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/20 8:06 PM, Dmitry Osipenko wrote:
> Add suspend/resume and generic power domain support to the Host1x driver.
> This is required for enabling system-wide DVFS and supporting dynamic
> power management using a generic power domain.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/gpu/host1x/dev.c | 102 ++++++++++++++++++++++++++++++++++-----
>   1 file changed, 91 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index d0ebb70e2fdd..c1525cffe7b1 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -12,6 +12,7 @@
>   #include <linux/module.h>
>   #include <linux/of_device.h>
>   #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/slab.h>
>   
>   #define CREATE_TRACE_POINTS
> @@ -417,7 +418,7 @@ static int host1x_probe(struct platform_device *pdev)
>   		return err;
>   	}
>   
> -	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
> +	host->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "host1x");
>   	if (IS_ERR(host->rst)) {
>   		err = PTR_ERR(host->rst);
>   		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
> @@ -437,16 +438,15 @@ static int host1x_probe(struct platform_device *pdev)
>   		goto iommu_exit;
>   	}
>   
> -	err = clk_prepare_enable(host->clk);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to enable clock\n");
> -		goto free_channels;
> -	}
> +	pm_runtime_enable(&pdev->dev);
> +	err = pm_runtime_get_sync(&pdev->dev);
> +	if (err < 0)
> +		goto rpm_disable;
>   
>   	err = reset_control_deassert(host->rst);
>   	if (err < 0) {
>   		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
> -		goto unprepare_disable;
> +		goto rpm_disable;
>   	}
>   
>   	err = host1x_syncpt_init(host);
> @@ -485,9 +485,10 @@ static int host1x_probe(struct platform_device *pdev)
>   	host1x_syncpt_deinit(host);
>   reset_assert:
>   	reset_control_assert(host->rst);
> -unprepare_disable:
> -	clk_disable_unprepare(host->clk);
> -free_channels:
> +rpm_disable:
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
>   	host1x_channel_list_free(&host->channel_list);
>   iommu_exit:
>   	host1x_iommu_exit(host);
> @@ -504,16 +505,95 @@ static int host1x_remove(struct platform_device *pdev)
>   	host1x_intr_deinit(host);
>   	host1x_syncpt_deinit(host);
>   	reset_control_assert(host->rst);
> -	clk_disable_unprepare(host->clk);
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
>   	host1x_iommu_exit(host);
>   
>   	return 0;
>   }
>   
> +static int __maybe_unused host1x_runtime_suspend(struct device *dev)
> +{
> +	struct host1x *host = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(host->clk);
> +	reset_control_release(host->rst);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused host1x_runtime_resume(struct device *dev)
> +{
> +	struct host1x *host = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = reset_control_acquire(host->rst);
> +	if (err) {
> +		dev_err(dev, "failed to acquire reset: %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_prepare_enable(host->clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable clock: %d\n", err);
> +		goto release_reset;
> +	}
> +
> +	return 0;
> +
> +release_reset:
> +	reset_control_release(host->rst);
> +
> +	return err;
> +}
> +
> +static __maybe_unused int host1x_suspend(struct device *dev)
> +{
> +	struct host1x *host = dev_get_drvdata(dev);
> +	int err;
> +
> +	host1x_syncpt_save(host);
> +
> +	err = pm_runtime_force_suspend(dev);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int host1x_resume(struct device *dev)
> +{
> +	struct host1x *host = dev_get_drvdata(dev);
> +	struct host1x_channel *channel;
> +	unsigned int index;
> +	int err;
> +
> +	err = pm_runtime_force_resume(dev);
> +	if (err < 0)
> +		return err;
> +
> +	host1x_syncpt_restore(host);

We also need to execute 'host1x_setup_sid_table' upon resume.

cheers,
Mikko

> +
> +	for_each_set_bit(index, host->channel_list.allocated_channels,
> +			 host->info->nb_channels) {
> +		channel = &host->channel_list.channels[index];
> +		host1x_hw_channel_init(host, channel, channel->id);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops host1x_pm = {
> +	SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
> +			   NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(host1x_suspend, host1x_resume)
> +};
> +
>   static struct platform_driver tegra_host1x_driver = {
>   	.driver = {
>   		.name = "tegra-host1x",
>   		.of_match_table = host1x_of_match,
> +		.pm = &host1x_pm,
>   	},
>   	.probe = host1x_probe,
>   	.remove = host1x_remove,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
