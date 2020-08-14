Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA3245CFF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445096E424;
	Mon, 17 Aug 2020 07:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 598 seconds by postgrey-1.36 at gabe;
 Fri, 14 Aug 2020 00:58:49 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845856E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:58:49 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200814004847epoutp029f0f7f4e1c1fbac821bf7314c517f2ad~q-Ae6FBqA2618626186epoutp02Q
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:48:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200814004847epoutp029f0f7f4e1c1fbac821bf7314c517f2ad~q-Ae6FBqA2618626186epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597366128;
 bh=e4Xon6lpxSkKHbuO67+S1JkH0bpnqs6utJMAst9eaWQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=V83dDb2d69JHn7xuocrwp79il8KJhEnIrV4IBGMh+3b4LTwSgO27VDHzODIIaDAM/
 tCQK0IJrXJMxp0mwO5pAb5ikB2W3disLYVyoXAB1YdRiykRvC3UI3KEa3KSFPeAKDm
 v/pLJtm9xY632E5wBJaIFXGajG6Y2vrB8Yb2ivIg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200814004847epcas1p202f4fea01ce691ab260db05de02f09b2~q-AedKpw52393723937epcas1p2v;
 Fri, 14 Aug 2020 00:48:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BSPvK1nW3zMqYkY; Fri, 14 Aug
 2020 00:48:45 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.06.29173.D6FD53F5; Fri, 14 Aug 2020 09:48:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200814004844epcas1p1b1a40e6e5106231df3abc92e5e5d5158~q-Ab9aMUX2057120571epcas1p1Y;
 Fri, 14 Aug 2020 00:48:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200814004844epsmtrp1d8e5fc0929ed11503a5c137a56580896~q-Ab8g-tE1694616946epsmtrp1C;
 Fri, 14 Aug 2020 00:48:44 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-ca-5f35df6d4f8f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.47.08303.C6FD53F5; Fri, 14 Aug 2020 09:48:44 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200814004844epsmtip2e3561dec68fbdd0d219f8de608946601~q-AbqMUbS0941709417epsmtip2a;
 Fri, 14 Aug 2020 00:48:44 +0000 (GMT)
Subject: Re: [PATCH v5 12/36] PM / devfreq: tegra20: Use MC timings for
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
Message-ID: <784f000f-17fd-550d-382c-1f9c11ce808b@samsung.com>
Date: Fri, 14 Aug 2020 10:00:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200814000621.8415-13-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmvm7ufdN4g3eTOCzefXrKajH/yDlW
 i9UfHzNaXPn6ns1i+t5NbBYtsxaxWJxtesNucXnXHDaLz71HGC06v8xis7h4ytXiduMKNotJ
 a6cyWrTuPcJu8e/aRhaLn7vmsTgIeLy/0crusXPWXXaPS+f+MHtsWtXJ5nHn2h42j/vdx5k8
 epvfsXn0bVnF6PF5k1wAZ1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5i
 bqqtkotPgK5bZg7QG0oKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAssCveLE3OLS
 vHS95PxcK0MDAyNToMKE7IwVV54xFfQLVfyac5mpgfEkXxcjJ4eEgInEh/MTWLoYuTiEBHYw
 SsyZ2cUE4XxilNi5qgkq85lRYtbsD0wwLc9v7WeHSOxilJjYeB+q5T2jxPsVG9hAqoQFYiS2
 L9jPCpIQETjCLLG68zgjSIJZYAajxJ09yiA2m4CWxP4XN8Aa+AUUJa7+eAxWwytgJ7G7+zsz
 iM0ioCrx9vYrsBpRgTCJk9taoGoEJU7OfMICYnMKmEk839fOBjFfXOLWk/lMELa8xPa3c5gh
 zv7PIdH0IhjCdpFYt2EPC4QtLPHq+BZ2CFtK4mV/G5RdLbHy5BE2kAckBDoYJbbsv8AKkTCW
 2L90MtACDqAFmhLrd+lDhBUldv6eC/Ujn8S7rz2sICUSArwSHW1CECXKEpcf3IWGoqTE4vZO
 tgmMSrOQfDMLyQezkHwwC2HZAkaWVYxiqQXFuempxYYFxsjRvYkRnMa1zHcwTnv7Qe8QIxMH
 4yFGCQ5mJRFe5svG8UK8KYmVValF+fFFpTmpxYcYTYHhO5FZSjQ5H5hJ8kriDU2NjI2NLUwM
 zUwNDZXEeR/eUogXEkhPLEnNTk0tSC2C6WPi4JRqYOKW2qRwNUCq8/XZJSvl7c+tWSi6XWDB
 8rtXKtI2ehUV7N9yuvPPf3nf5JWiP1+3f85d5ZV1eltVOcNbqVCfKQ9PHJUqTIx6myTswLgx
 uLH1DuvHp5leMhOf16lxHJue1qEj+Oh/o9uNfVuvrM+ez7zVf4vPPeaOztV556SPL/mcUPmn
 1rQ8Y/ZzTubaDJ3/brJscjxT17+cYrKS2d83z7bMwe/+zsuPvPijZlg8Yk9hnJD2ITdlVnHG
 2oqHdrJbys6Inbc8dXTruUtiR8QuiRkvLjW0+Pzs7K6o92t9101hauG2NljHVCag/NpwTtH0
 ZepSzFKH3Z7dfnT1x7PAfrezSh+2+XzKvlrW8nirXpASS3FGoqEWc1FxIgC+/a0abAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWy7bCSvG7OfdN4g7nnNS3efXrKajH/yDlW
 i9UfHzNaXPn6ns1i+t5NbBYtsxaxWJxtesNucXnXHDaLz71HGC06v8xis7h4ytXiduMKNotJ
 a6cyWrTuPcJu8e/aRhaLn7vmsTgIeLy/0crusXPWXXaPS+f+MHtsWtXJ5nHn2h42j/vdx5k8
 epvfsXn0bVnF6PF5k1wAZxSXTUpqTmZZapG+XQJXxoorz5gK+oUqfs25zNTAeJKvi5GTQ0LA
 ROL5rf3sXYxcHEICOxglZt8+zAKRkJSYdvEocxcjB5AtLHH4cDFEzVtGid4jm5hBaoQFYiS2
 L9jPCpIQETjGLLHp9GkmEIdZYAajxJ8NG9lBqoQEtjBKdD5jA7HZBLQk9r+4AWbzCyhKXP3x
 mBHE5hWwk9jd/R1sKouAqsTb26/AakQFwiR2LnnMBFEjKHFy5hOw6zgFzCSe72sHq2EWUJf4
 M+8SM4QtLnHryXwmCFteYvvbOcwTGIVnIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMpL
 LdcrTswtLs1L10vOz93ECI5oLa0djHtWfdA7xMjEwXiIUYKDWUmEl/mycbwQb0piZVVqUX58
 UWlOavEhRmkOFiVx3q+zFsYJCaQnlqRmp6YWpBbBZJk4OKUamDYIzTkUVrH0YNyv26VXfJ+F
 hiw3kkhZ7vZHTieDY3bSGt5Wu3cHDHhTHIxCjx19/135YfyRBflBzV+178u+Ebx1MPLa8q9N
 bU9PLntbHXpvvV5i+W4tFc/fMwOE7zg2Mpkd+Rq1n8njC6flRb3r3AuXz9mVkOUqXPP11Zzs
 j1/MzLYGRtyZv8vo4K/tOe/u+T488P5HVkGS3JPjJR0FQUGxnzf/WqLPzsJRxXV0zZ+X12/X
 RUcYLHxssd6trf6SWvuaSZFsjWcmioYpR2zT/q4W18tkVp/g9Uq/WDF89hxl+7/BU9JzpHq7
 eRcsDmOJ1XisYf1PqHvOGrVpf/dsVk54VNOZozlrotCroqxpZ5VYijMSDbWYi4oTAUv9ZlFX
 AwAA
X-CMS-MailID: 20200814004844epcas1p1b1a40e6e5106231df3abc92e5e5d5158
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200814000944epcas1p4da08e1a6b03c80013a997fdc856a9486
References: <20200814000621.8415-1-digetx@gmail.com>
 <CGME20200814000944epcas1p4da08e1a6b03c80013a997fdc856a9486@epcas1p4.samsung.com>
 <20200814000621.8415-13-digetx@gmail.com>
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
>  drivers/devfreq/tegra20-devfreq.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index 6469dc69c5e0..a985f24098f5 100644
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
> @@ -135,6 +134,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	if (!mc->num_timings) {
> +		dev_info(&pdev->dev, "memory controller has no timings\n");
> +		return -ENODEV;
> +	}
> +
>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>  	if (!tegra)
>  		return -ENOMEM;
> @@ -151,12 +155,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	tegra->regs = mc->regs;
>  
> -	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> -
> -	for (rate = 0; rate <= max_rate; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> -
> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
> +	for (i = 0; i < mc->num_timings; i++) {
> +		err = dev_pm_opp_add(&pdev->dev, mc->timings[i].rate, 0);
>  		if (err) {
>  			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
>  			goto remove_opps;
> 

Ackded-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
