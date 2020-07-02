Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7C211CB8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A186E516;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60486E1F6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 04:07:08 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200702040706epoutp03a0ab157ecc99fd4edbbc4e24d9dbda08~d0_W09RPd0290102901epoutp031
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 04:07:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200702040706epoutp03a0ab157ecc99fd4edbbc4e24d9dbda08~d0_W09RPd0290102901epoutp031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593662826;
 bh=nSBloLjBMkhEq6dBnL0Yut7t5IwUXxI09+5uuRC+GYI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=AnwkEP3HZjzGy38t1rKrQ5Sq4bEi/VXmO+tZcn0w5+L4qn2Y3qoONPfDE5gM5Z1iS
 6chLBFWVaLxAX0X6AJcz7dZ6+Yp1MKNpUGkRKriyyhG5pebPa4sBBiLn9KGRg42JVw
 7FtrZtEJ9PV5nFBOAe/DQHd/Y2aBJxQ2fQy3+vRk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200702040706epcas1p4ded8bc0a4377b2e65a53400e4c98d717~d0_WUindx2564425644epcas1p4A;
 Thu,  2 Jul 2020 04:07:06 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49y4Kz693gzMqYm7; Thu,  2 Jul
 2020 04:07:03 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.D0.29173.76D5DFE5; Thu,  2 Jul 2020 13:07:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200702040703epcas1p3f8b2c6f5a3a9c49ce121659d0de215bd~d0_TY4jwO2343023430epcas1p3c;
 Thu,  2 Jul 2020 04:07:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702040702epsmtrp1b8419846011fd7e80cd260570f732743~d0_TX5xR50526105261epsmtrp1-;
 Thu,  2 Jul 2020 04:07:02 +0000 (GMT)
X-AuditID: b6c32a37-9b7ff700000071f5-9a-5efd5d6783da
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.C8.08303.66D5DFE5; Thu,  2 Jul 2020 13:07:02 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702040702epsmtip24222edcb032c7d2c57cc9c880c4e3847~d0_TGzNf71793117931epsmtip2x;
 Thu,  2 Jul 2020 04:07:02 +0000 (GMT)
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
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
Message-ID: <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
Date: Thu, 2 Jul 2020 13:18:18 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-13-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJsWRmVeSWpSXmKPExsWy7bCmrm567N84g0X/DSzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
 5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0
 ihNzi0vz0vWS83OtDA0MjEyBChOyM2Y072EqeCBYMXf2OqYGxql8XYycHBICJhJHzjxi6mLk
 4hAS2MEo0by/lRHC+cQo0b7vEZTzmVFi9totjDAtly+8YIZI7GKUmPZuCjtIQkjgPaPEh/MF
 ILawQIzEpO4ZLCBFIgJHmCVWdx4HG8UscJlR4mzbFzaQKjYBLYn9L26A2fwCihJXfzwGW8Er
 YCexunULK4jNIqAi0fD8EtgGUYEwiZPbWqBqBCVOznzCAmJzCphLrN+yGMxmFhCXuPVkPhOE
 LS+x/e0csFMlBNo5JU6vP8MK8YOLxNxpV5khbGGJV8e3sEPYUhIv+9ug7GqJlSePsEE0dzBK
 bNl/AarZWGL/0slAGziANmhKrN+lDxFWlNj5ey4jxGI+iXdfe1hBSiQEeCU62oQgSpQlLj+4
 ywRhS0osbu9km8CoNAvJO7OQvDALyQuzEJYtYGRZxSiWWlCcm55abFhgjBzfmxjBKV3LfAfj
 tLcf9A4xMnEwHmKU4GBWEuE9bfArTog3JbGyKrUoP76oNCe1+BCjKTCAJzJLiSbnA7NKXkm8
 oamRsbGxhYmhmamhoZI4r6/VhTghgfTEktTs1NSC1CKYPiYOTqkGJk8T1qV9QYZ+fMpX4lPz
 1kTXzjSbs+bv3ynn87l5N/Qu1jVUv2TXO/N3wMR9W1wKXcw/ejw+0Hw+uvulrc2/tAoR57zN
 7z+FV7xVNQ/wV6qK/CLlL+zXq279ZoJ5q5Th1VMFLPse1fw6s8aL/Wx9ZuK5A6unPt3ZzP6x
 dNexH4znpSNEl/ic/sG96qn9gvwNj/l+P+9wyhZZZ+x8JYCL8Tjb9oONbWcvxOrHOW2fHeY4
 IXTHVO4/O7ibSqfrPltZ5/iS/+uaBOaTzWo+Hw693jJt9zaTzZu/uUQZMy85v7f24Gqn55/+
 uFcaXZz2ZN3Tc5+Z8+8F8/1JTdo0f4/hwbsFnUnO67w59t1Z7LXhKp8SS3FGoqEWc1FxIgBk
 GHfccgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsWy7bCSvG5a7N84gyMzzS3uz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZM5r3MBU8EKyYO3sdUwPjVL4u
 Rk4OCQETicsXXjB3MXJxCAnsYJS4MbeZDSIhKTHt4lGgBAeQLSxx+HAxSFhI4C2jxI7DoiC2
 sECMxKTuGSwgvSICx5glNp0+zQTiMAtcBirq/MoGMXUbo8S1X29ZQVrYBLQk9r+4AbaBX0BR
 4uqPx4wgNq+AncTq1i1gNSwCKhINzy+xg9iiAmESO5c8ZoKoEZQ4OfMJC4jNKWAusX7LYjCb
 WUBd4s+8S8wQtrjErSfzmSBseYntb+cwT2AUnoWkfRaSlllIWmYhaVnAyLKKUTK1oDg3PbfY
 sMAoL7Vcrzgxt7g0L10vOT93EyM4trW0djDuWfVB7xAjEwfjIUYJDmYlEd7TBr/ihHhTEiur
 Uovy44tKc1KLDzFKc7AoifN+nbUwTkggPbEkNTs1tSC1CCbLxMEp1cCkxNAkkT6zc9XpY5I3
 LAU0WFhFnlvEVesIsn76c3xj5VqVKZu2FUxy+LHOLTeOL0ZOI+3C1kTxinKX3p0/ZmUsCzjK
 E73/xe6dV6N7XjE9yez9u+N7n+zf1pXrpZufbOoQO7bVTmW9oddH3TWpjSnPl0XZFhZvnhK2
 /fvUKcHH2+a/aiuQfORX7VhXevj58psla/Vq2J9ckJKbF1ewep3qAt9DMgstOOdJMDK7ng9f
 25gZZ+lQo8jYNdXOaePFQm4PhZ4dTWl7zzCl5xRs6E76sTg1cXbMhj6Dg1GxG1sP7rUojJX2
 +60aopcaeP/o1KdGXx/mzw+eH3Iz8rXU0Rd56n7LosR07za8jeYpZVBiKc5INNRiLipOBACK
 Lp0uXAMAAA==
X-CMS-MailID: 20200702040703epcas1p3f8b2c6f5a3a9c49ce121659d0de215bd
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
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
>  drivers/devfreq/tegra20-devfreq.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index 6469dc69c5e0..bf504ca4dea2 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -123,8 +123,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
>  	struct tegra_devfreq *tegra;
>  	struct tegra_mc *mc;
> -	unsigned long max_rate;
> -	unsigned long rate;
> +	unsigned int i;
>  	int err;
>  
>  	mc = tegra_get_memory_controller();
> @@ -151,12 +150,17 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	tegra->regs = mc->regs;
>  
> -	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> -
> -	for (rate = 0; rate <= max_rate; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> +	if (!mc->num_timings) {

Could you explain what is meaning of 'num_timing?
Also, why add the opp entry in case of mc->num_timings is zero?

> +		err = dev_pm_opp_add(&pdev->dev,
> +				     clk_get_rate(tegra->emc_clock), 0);
> +		if (err) {
> +			dev_err(&pdev->dev, "failed to add OPP: %d\n", err);
> +			return err;
> +		}
> +	}
>  
> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
> +	for (i = 0; i < mc->num_timings; i++) {
> +		err = dev_pm_opp_add(&pdev->dev, mc->timings[i].rate, 0);
>  		if (err) {
>  			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
>  			goto remove_opps;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
