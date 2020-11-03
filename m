Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715AA2A4C46
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 18:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB606E8BC;
	Tue,  3 Nov 2020 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB36E8BC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:06:16 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa18e060000>; Tue, 03 Nov 2020 09:06:14 -0800
Received: from [10.26.45.122] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 17:06:13 +0000
Subject: Re: [PATCH] drm/tegra: sor: Don't warn on probe deferral
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201103114426.546626-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cc0e6f6e-2e06-81b3-38b8-fbdc5c772658@nvidia.com>
Date: Tue, 3 Nov 2020 17:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103114426.546626-1-jonathanh@nvidia.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604423174; bh=wLq1VK2L7j+qzIJOsu91q3Us07fpe99UhftzABkPUJw=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=bzkNQpyjQa6zoWrV4LtF9I/xCCgR5HgfDSoaKMcSTx+viezL7EssCm7uAx4gsHtGw
 6BO59p5M9FkbGxoE4K3MWb9TMiv1h3dS+YqX4c+04R+l7xUxlPSbLoZuKCIjC1s+Sh
 k05cflTwL/pLCWRwWuDKXv9SzBdxo+cJYHMcoPl5kvFi0Rq/0Q/DPgu7XMSHYV0Wrb
 Zx/wNP8oyB58cUBEjZnQG4CPoDPNVTxL1oUs79AK6Opy955M6utfl6JEur7Q49Yg0J
 gIjZGozkIyfITji3Vnhp62NPQkSU08Ya95av0aI85LZY5h0IpEjCNp24L3gMLfRmFb
 7Q7tMx9aIRD1A==
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/11/2020 11:44, Jon Hunter wrote:
> Deferred probe is an expected return value for tegra_output_probe().
> Given that the driver deals with it properly, there's no need to output
> a warning that may potentially confuse users.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index e88a17c2937f..5a232055b8cc 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3765,7 +3765,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  
>  	err = tegra_output_probe(&sor->output);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
> +		dev_err_probe(&pdev->dev, "failed to probe output: %d\n", err);
>  		return err;
>  	}

Sorry this is not right. I will fix this in V2.

Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
