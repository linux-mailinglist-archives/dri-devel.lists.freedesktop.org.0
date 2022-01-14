Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42748E8E6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132510E520;
	Fri, 14 Jan 2022 11:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5F10E753
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:08:37 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220114110835epoutp02ed127a85e2e208f7793559656073fbd6~KHng9MohL0881208812epoutp02_
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:08:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220114110835epoutp02ed127a85e2e208f7793559656073fbd6~KHng9MohL0881208812epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642158515;
 bh=pfGpD4W/035PIQFiX2KcbGP5G2igcYQwaHKPpL7Giy0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HKiTUHeDSRXA9XZBOrcp/StY3e841AUXt+cW9DUbeaYl+lwzlU6J+NLZr00zCIfrd
 2pkT7+bFa1bdEGHlBFfgm+quSPuvnTextW/+xT/yIwkdEDJ2fl7Xi8/gN/JdPjQBWE
 3wR4fBeivh6fX1Tgz5MYuwlm2Z6xBHKk+ZsYe3jI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220114110835epcas1p4645b1409d138b857ec3d09d45e343215~KHngXeTgv1939919399epcas1p4O;
 Fri, 14 Jan 2022 11:08:35 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.236]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4JZz7M1BLZz4x9QC; Fri, 14 Jan
 2022 11:08:31 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 13.4E.08277.EA951E16; Fri, 14 Jan 2022 20:08:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220114110830epcas1p2d601346f9591baf7d3be1b35c241a98b~KHncFpt0H2954829548epcas1p2c;
 Fri, 14 Jan 2022 11:08:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220114110830epsmtrp297cb7564b27abc70954122c59f9aaf4f~KHncEk13Z2598625986epsmtrp2G;
 Fri, 14 Jan 2022 11:08:30 +0000 (GMT)
X-AuditID: b6c32a36-1edff70000002055-33-61e159aebae5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.28.29871.EA951E16; Fri, 14 Jan 2022 20:08:30 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220114110830epsmtip1be0a3b40cd19968fcc2612b6e1d47d54~KHnbvW7E51013810138epsmtip12;
 Fri, 14 Jan 2022 11:08:30 +0000 (GMT)
Subject: Re: [PATCH 2/5] drm/exynos: mixer: Use platform_get_irq() to get
 the interrupt
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <a95b74fd-7118-b0fe-26b9-4665c719f1a0@samsung.com>
Date: Fri, 14 Jan 2022 20:20:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222190134.24866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRmVeSWpSXmKPExsWy7bCmvu76yIeJBjNOM1r0njvJZPF/20Rm
 iytf37NZvLh3kcVi49sfTBZnm96wW2x6fI3V4vKuOWwWM87vY7J4eX8Fs0Xfm3XMFq17j7Bb
 zJj8ks2B12Pli9nsHrMaetk89n5bwOKxc9Zddo9NqzrZPLZ/e8Dqcb/7OJPH5iX1Hn1bVjF6
 fN4kF8AVlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZ
 A3S8kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAtECvODG3uDQvXS8vtcTK0MDA
 yBSoMCE7Y3JbM3tBi1DF7c/b2BsYz/N1MXJySAiYSPzp+MfWxcjFISSwg1Hiy/PPLCAJIYFP
 jBLnFrJCJL4xSixaNhvI4QDraJsnAhHfyyhxY/I8RgjnPaPEghUbmUG6hQUiJc53tbGAJEQE
 ljNLPGw6ATaWWSBHYkrPMrAiNgFViYkr7rOB2LwCdhLvzzwEi7MAxe9+6mQCsUWBBt3/sZwd
 okZQ4uTMJ2BzOAV8Jd4sOMUKMVNc4taT+UwQtrxE89bZzCCLJQRucEjs/3iRHeJRF4mWfdeY
 IGxhiVfHt0DFpSQ+v9vLBtGwj1Fi+a6T7BDOYUaJ5p3NUB3GEvuXTmYCBQCzgKbE+l36EGFF
 iZ2/5zJCbOaTePe1BxpGvBIdbUIQJUoSxy7eYISwJSQuLJnIBmF7SPTtusY0gVFxFpLfZiH5
 ZxaSf2YhLF7AyLKKUSy1oDg3PbXYsMAIHt3J+bmbGMEpW8tsB+Oktx/0DjEycTAeYpTgYFYS
 4e0vup8oxJuSWFmVWpQfX1Sak1p8iNEUGNoTmaVEk/OBWSOvJN7QxNLAxMzI2MTC0MxQSZx3
 1bTTiUIC6YklqdmpqQWpRTB9TBycUg1M2kt3vLro0n30g6CA/dnyX9WvN/Q96zLds4L3d3n+
 ptN32AsF2M2EuBQZI162zeOKOaeRHVq/1+ihIKNL40LJO6/1ywpKLA/v4Jc7mll1aZ+XNhMP
 z6n2r339GjmvRI9K6s7p3TE5tcSAmT06PNKwZu21Rlv+G/7HX3fNkolSZu9b/etbl+9jwx9u
 1Vv9X6dYTvvGsYbnzNeIb9afewxuV4kENvnEPN8psoGbIWKK2cfTjMX3GYLeXDr3Yv/L9e93
 qD7bMVG3adbs7afKWbzufOu++1fGytpydYPyHa4P/ttX8bB8+qTu4n++X2Cj54os5hNZF7NP
 tHRM0jf5eOC3S3Hc5u/Nl1msNvNtWcKvxFKckWioxVxUnAgAccoLBmIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSnO66yIeJBp9Oylv0njvJZPF/20Rm
 iytf37NZvLh3kcVi49sfTBZnm96wW2x6fI3V4vKuOWwWM87vY7J4eX8Fs0Xfm3XMFq17j7Bb
 zJj8ks2B12Pli9nsHrMaetk89n5bwOKxc9Zddo9NqzrZPLZ/e8Dqcb/7OJPH5iX1Hn1bVjF6
 fN4kF8AVxWWTkpqTWZZapG+XwJUxua2ZvaBFqOL2523sDYzn+boYOTgkBEwk2uaJdDFycQgJ
 7GaU2LHmHAtEXEJiy1YOCFNY4vDhYoiSt4wSS3raGbsYOTmEBSIl9n74zQKSEBFYzSxx/vQf
 VpAEs0CORNPMVUwQHY8ZJb427wbrYBNQlZi44j4biM0rYCfx/sxDZhCbBSh+91MnE4gtCjR1
 3fFl7BA1ghInZz5hAbE5BXwl3iw4BbVAXeLPvEvMELa4xK0n85kgbHmJ5q2zmScwCs1C0j4L
 ScssJC2zkLQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHKFamjsYt6/6oHeI
 kYmD8RCjBAezkghvf9H9RCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphak
 FsFkmTg4pRqYmL2fTOU/yrrTd5/mg8NmoSHfH/Sda9xbeWTzE+GcyyVJelYvZqTPie2xaWtx
 nZJStSNj0rNr8+I95W91FLoUu0REONXML5A2LLrFmdx5Q3fyRj/Oz1b35BfNC9WbY3PMqHz+
 zw6RJV9mmrkU6vG3u04r4+JeGuu7n8f7wuq95cuuqW90qnwXaL12wo/5PW3ZFYefa9rLqy/Y
 N8GvikPctDD8stQ2wewLr/y2RRtvFb76/pIWq+VbQ4cbj02Ylh7rmb7CfZfUpWlpX/nyL+wL
 dzcS81u20bmlVInPLVDu6sP5dy/c10//uMVPb8bEFd+VnTmWOM1KP871oT136ZI9sZo7vPTz
 33w723K4/+FrJZbijERDLeai4kQA7ONwvT8DAAA=
X-CMS-MailID: 20220114110830epcas1p2d601346f9591baf7d3be1b35c241a98b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211222190203epcas1p2a7647eb2c09c29587b70982744c1a912
References: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CGME20211222190203epcas1p2a7647eb2c09c29587b70982744c1a912@epcas1p2.samsung.com>
 <20211222190134.24866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lad Prabhakar,

21. 12. 23. 오전 4:01에 Lad Prabhakar 이(가) 쓴 글:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi,
> 
> Ideally I would expect the mixer_resources_init() to be called from probe
> instead from the bind callback. If platform_get_irq() returns -EPROBE_DEFER
> the bind callback will fail :(

If the bind callback failed then probe function of exynos drm driver will call -EPROBE_DEFER like below so it must be no problem :),
--------------------------------------------
in exynos_drm_platform_probe function
    component_master_add_with_match()

in component_master_add_with_match function
    try_to_bring_up_master()

Thanks,
Inki Dae

> 
> Cheers,
> Prabhakar
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 41c54f1f60bc..e5204be86093 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -809,19 +809,17 @@ static int mixer_resources_init(struct mixer_context *mixer_ctx)
>  		return -ENXIO;
>  	}
>  
> -	res = platform_get_resource(mixer_ctx->pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(dev, "get interrupt resource failed.\n");
> -		return -ENXIO;
> -	}
> +	ret = platform_get_irq(mixer_ctx->pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +	mixer_ctx->irq = ret;
>  
> -	ret = devm_request_irq(dev, res->start, mixer_irq_handler,
> -						0, "drm_mixer", mixer_ctx);
> +	ret = devm_request_irq(dev, mixer_ctx->irq, mixer_irq_handler,
> +			       0, "drm_mixer", mixer_ctx);
>  	if (ret) {
>  		dev_err(dev, "request interrupt failed.\n");
>  		return ret;
>  	}
> -	mixer_ctx->irq = res->start;
>  
>  	return 0;
>  }
> 
