Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B9245D55
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04CD6E4AE;
	Mon, 17 Aug 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EA06E2CA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 01:50:49 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200814015047epoutp03290a1bf1f869dc565bdcbb40031ea514~q-2nLL17P1181611816epoutp03G
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 01:50:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200814015047epoutp03290a1bf1f869dc565bdcbb40031ea514~q-2nLL17P1181611816epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597369847;
 bh=gowD4C7TEEhxrbqbRyTMZ6cmvxjAoXc2kJkQv2udKKc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=C1IQC4c5onIp/ufU/ZhB6OrLtaeV+cHKVH3auLna8OouTVJ9QFK63dptEOTuFQ99+
 alykeLieqfpeOUE1bc7h1SOsYUDQayMjCMZq8hswMUJu7o0/K4PnKdK0xH863wZ321
 pgGFGJJ3xHem5ED6J5Qo1shYiH0F9DWMfQw0VuEw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200814015045epcas1p30464b9319cb75a5e59ee92c3b56a9db7~q-2lMPHGU1837718377epcas1p3Z;
 Fri, 14 Aug 2020 01:50:45 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BSRGq16jszMqYlv; Fri, 14 Aug
 2020 01:50:43 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.38.28578.3FDE53F5; Fri, 14 Aug 2020 10:50:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200814015040epcas1p4e841745e198e780a70a0c2e7a88bc247~q-2giQhvm0697606976epcas1p4a;
 Fri, 14 Aug 2020 01:50:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200814015040epsmtrp1545ce583772938e12450f4c2cc378db7~q-2ghZaAz1653816538epsmtrp1e;
 Fri, 14 Aug 2020 01:50:40 +0000 (GMT)
X-AuditID: b6c32a39-8dfff70000006fa2-e4-5f35edf368e1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 85.1F.08303.0FDE53F5; Fri, 14 Aug 2020 10:50:40 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200814015040epsmtip2ed23f1a109fb486de020e525915be925~q-2gPshCb1260612606epsmtip20;
 Fri, 14 Aug 2020 01:50:40 +0000 (GMT)
Subject: Re: [PATCH v5 13/36] PM / devfreq: tegra30: Use MC timings for
 building OPP table
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <1b0d75fe-79af-70eb-8450-999a3bc72bac@samsung.com>
Date: Fri, 14 Aug 2020 11:02:40 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200814000621.8415-14-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmru7nt6bxBqt2sFq8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTjb9Ibd4vKuOWwWn3uPMFp0fpnFZnHxlKvF7cYVbBaT
 1k5ltGjde4Td4t+1jSwWP3fNY3EQ8Hh/o5XdY+esu+wel879YfbYtKqTzePOtT1sHve7jzN5
 9Da/Y/Po27KK0ePzJrkAzqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE
 3FRbJRefAF23zBygN5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJucWl
 eel6yfm5VoYGBkamQIUJ2RkPXm1iLejQrvjUsJq5gfGzYhcjJ4eEgIlEZ9N1ti5GLg4hgR2M
 EqubF7NDOJ8YJU4f+sUK4XxmlJh7ZCM7TMuHpWehqnYxSlz59oUZwnnPKPGq8SYrSJWwQIzE
 mXkbwapEBI4wS6zuPM4IkmAWmMEocWePMojNJqAlsf/FDTYQm19AUeLqj8dANRwcvAJ2Egv/
 2IGEWQRUJTZf3g22WVQgTOLkthawMbwCghInZz5hAbE5Bcwk+qdMYIIYLy5x68l8KFteYvvb
 OWDHSQj855CY8O0Z1AsuEvcXHmOFsIUlXh3fAhWXknjZ3wZlV0usPHmEDaK5g1Fiy/4LUA3G
 EvuXTmYCOZRZQFNi/S59iLCixM7fc6F+5JN497WHFaREQoBXoqNNCKJEWeLyg7tMELakxOL2
 TrYJjEqzkLwzC8kLs5C8MAth2QJGllWMYqkFxbnpqcWGBabI0b2JEZzGtSx3ME5/+0HvECMT
 B+MhRgkOZiURXubLxvFCvCmJlVWpRfnxRaU5qcWHGE2BATyRWUo0OR+YSfJK4g1NjYyNjS1M
 DM1MDQ2VxHkf3lKIFxJITyxJzU5NLUgtgulj4uCUamCawKS4b9/9Fadf7s2v7y97UnrAzFpT
 5tt64wNWq1Ur8lVd0rkuu3gKCX/geGH+Ot46k1/Wae+DprT965N8XzdsLft4627Tp8PmLClM
 1+fLZwpn+TvU3fJoej39y4+aQP33CVGbt0hOZ1gzQ8ZYdmrCyX9rOoN+XJnldON3q9RTrYIH
 kc9SCgM28a7bMf3alvIpu5JEXjwrWb/+psXPaS8OsqeX2zb92esy/7avYafE9nnb2wPWJfmZ
 H5lnezfB8HwkT3dbNIfsnAT12ycagiXlZ550uxhtfP5Qhl2dfo7iw83LBM+0f9K6sbhO6fUT
 t9+f5vO6H3u4/Zpp9eekSZLB3klv7SUyffJPrdzNaOehxFKckWioxVxUnAgAP2VMZ2wEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWy7bCSvO6Ht6bxBmtOyFq8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTjb9Ibd4vKuOWwWn3uPMFp0fpnFZnHxlKvF7cYVbBaT
 1k5ltGjde4Td4t+1jSwWP3fNY3EQ8Hh/o5XdY+esu+wel879YfbYtKqTzePOtT1sHve7jzN5
 9Da/Y/Po27KK0ePzJrkAzigum5TUnMyy1CJ9uwSujAevNrEWdGhXfGpYzdzA+Fmxi5GTQ0LA
 ROLD0rPsXYxcHEICOxglTqyazQSRkJSYdvEocxcjB5AtLHH4cDFEzVtGiZVHu1lAaoQFYiTO
 zNsI1iwicIxZYtPp00wgDrPADEaJPxs2Qo3dwiix/MUqdpAWNgEtif0vbrCB2PwCihJXfzxm
 BFnBK2AnsfCPHUiYRUBVYvPl3WDlogJhEjuXPAa7iFdAUOLkzCdgmzkFzCT6p0wAizMLqEv8
 mXeJGcIWl7j1ZD5UXF5i+9s5zBMYhWchaZ+FpGUWkpZZSFoWMLKsYpRMLSjOTc8tNiwwykst
 1ytOzC0uzUvXS87P3cQIjmgtrR2Me1Z90DvEyMTBeIhRgoNZSYSX+bJxvBBvSmJlVWpRfnxR
 aU5q8SFGaQ4WJXHer7MWxgkJpCeWpGanphakFsFkmTg4pRqYOtbpXvw441lZvskSXYZjSZfC
 /mdWLW6Javgyr8f2wrKna6/PXC2dP8X1o/Fd57WvTm3p/yTC9D6Wya7qDFtM6+Rm8XBj7dkc
 ZlyPL5vrztCtyfyiG7T/0sqO0Ow5Z7veXa7fq/dsn5ZYw9ffWw32Pjpz+Mm3Op4pSumqxWJr
 Eo5mf3z/+ZZ5yknVe9ZbGFXXWxd/l12QaiV43JT7wqr2fsddZ9LumzVwf59j+NFrplcMs93L
 WWtX5zBmsXu63PX3zb9ZdnTrLXedKM8J9ZKuDNMVJ3znfugeWrc8XXHBEQ65BD+2uhszmPSf
 zp1fKxa0xeCm3Zy0qxe9hDNlClWS2lQMqmfsqzvu/mVxU3qDEktxRqKhFnNRcSIAQxz53lcD
 AAA=
X-CMS-MailID: 20200814015040epcas1p4e841745e198e780a70a0c2e7a88bc247
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200814000944epcas1p3dfd0104c5fa640695dfcd4949f6b1818
References: <20200814000621.8415-1-digetx@gmail.com>
 <CGME20200814000944epcas1p3dfd0104c5fa640695dfcd4949f6b1818@epcas1p3.samsung.com>
 <20200814000621.8415-14-digetx@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I add the minor comment. Except of some comments, it looks good to me.

On 8/14/20 9:05 AM, Dmitry Osipenko wrote:
> The clk_round_rate() won't be usable for building OPP table once
> interconnect support will be added to the EMC driver because that CLK API
> function limits the rounded rate based on the clk rate that is imposed by
> active clk-users, and thus, the rounding won't work as expected if
> interconnect will set the minimum EMC clock rate before devfreq driver is
> loaded. The struct tegra_mc contains memory timings which could be used by
> the devfreq driver for building up OPP table instead of rounding clock
> rate, this patch implements this idea.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 93 +++++++++++++++++++++----------
>  1 file changed, 65 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 423dd35c95b3..6c2f56b34535 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -19,6 +19,8 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>  
> +#include <soc/tegra/mc.h>
> +
>  #include "governor.h"
>  
>  #define ACTMON_GLB_STATUS					0x0
> @@ -153,6 +155,18 @@ struct tegra_devfreq_device {
>  	unsigned long target_freq;
>  };
>  
> +struct tegra_devfreq_soc_data {
> +	const char *mc_compatible;
> +};
> +
> +static const struct tegra_devfreq_soc_data tegra30_soc = {
> +	.mc_compatible = "nvidia,tegra30-mc",
> +};
> +
> +static const struct tegra_devfreq_soc_data tegra124_soc = {
> +	.mc_compatible = "nvidia,tegra124-mc",
> +};
> +
>  struct tegra_devfreq {
>  	struct devfreq		*devfreq;
>  
> @@ -771,15 +785,49 @@ static struct devfreq_governor tegra_devfreq_governor = {
>  	.interrupt_driven = true,
>  };
>  
> +static struct tegra_mc *tegra_get_memory_controller(const char *compatible)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct tegra_mc *mc;
> +
> +	np = of_find_compatible_node(NULL, NULL, compatible);
> +	if (!np)
> +		return ERR_PTR(-ENOENT);
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	mc = platform_get_drvdata(pdev);
> +	if (!mc)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return mc;
> +}
> +
>  static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
> +	const struct tegra_devfreq_soc_data *soc_data;
>  	struct tegra_devfreq_device *dev;
>  	struct tegra_devfreq *tegra;
>  	struct devfreq *devfreq;
> +	struct tegra_mc *mc;
>  	unsigned int i;
> -	long rate;
>  	int err;
>  
> +	soc_data = of_device_get_match_data(&pdev->dev);

I think that better to check whether 'soc_data' is not NULL.


> +
> +	mc = tegra_get_memory_controller(soc_data->mc_compatible);
> +	if (IS_ERR(mc))
> +		return PTR_ERR(mc);

You better to add error log.

> +
> +	if (!mc->num_timings) {
> +		dev_info(&pdev->dev, "memory controller has no timings\n");
> +		return -ENODEV;
> +	}
> +
>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>  	if (!tegra)
>  		return -ENOMEM;
> @@ -825,6 +873,20 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	for (i = 0; i < mc->num_timings; i++) {
> +		/*
> +		 * Memory Controller timings are sorted in ascending clock
> +		 * rate order, so the last timing will be the max freq.
> +		 */
> +		tegra->max_freq = mc->timings[i].rate / KHZ;
> +
> +		err = dev_pm_opp_add(&pdev->dev, tegra->max_freq, 0);
> +		if (err) {
> +			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
> +			goto remove_opps;
> +		}
> +	}
> +
>  	reset_control_assert(tegra->reset);
>  
>  	err = clk_prepare_enable(tegra->clock);
> @@ -836,37 +898,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	reset_control_deassert(tegra->reset);
>  
> -	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> -	if (rate < 0) {
> -		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
> -		return rate;
> -	}
> -
> -	tegra->max_freq = rate / KHZ;
> -
>  	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
>  		dev = tegra->devices + i;
>  		dev->config = actmon_device_configs + i;
>  		dev->regs = tegra->regs + dev->config->offset;
>  	}
>  
> -	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> -
> -		if (rate < 0) {
> -			dev_err(&pdev->dev,
> -				"Failed to round clock rate: %ld\n", rate);
> -			err = rate;
> -			goto remove_opps;
> -		}
> -
> -		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
> -		if (err) {
> -			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
> -			goto remove_opps;
> -		}
> -	}
> -
>  	platform_set_drvdata(pdev, tegra);
>  
>  	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
> @@ -921,8 +958,8 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id tegra_devfreq_of_match[] = {
> -	{ .compatible = "nvidia,tegra30-actmon" },
> -	{ .compatible = "nvidia,tegra124-actmon" },
> +	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
> +	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
>  	{ },
>  };
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
