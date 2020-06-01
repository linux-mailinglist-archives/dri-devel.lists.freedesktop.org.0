Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC021EA4E7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFCF6E08C;
	Mon,  1 Jun 2020 13:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DEE6E08C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132523euoutp02f70387d26b0e935d921bf120de914ee1~Ubl8l_tBD1973719737euoutp02W
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200601132523euoutp02f70387d26b0e935d921bf120de914ee1~Ubl8l_tBD1973719737euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017923;
 bh=YiwThElw53LJigTjhogLOgCPtHePhvTe1Wd48l2j3Zk=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=MkZBcmx5dTkcTSvGNhCAM8dtsZZV2rfttLS8PpIFfmngDC4YynrrO31IcFh1hiwOQ
 ScgjCAgRdz4FPnA/YnrMqYVxuweUsE8COFV/k0QTW7BCrTUwngD4JSqvTmWJGKbMzU
 VN3lWbxInG/+bbDsfg8E2r5oR3YPiOuFFbnzAFvY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601132523eucas1p1487a12788c6e7f519fcdde3d83ce3ead~Ubl8WnRjC2549925499eucas1p1J;
 Mon,  1 Jun 2020 13:25:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D7.33.60679.2C105DE5; Mon,  1
 Jun 2020 14:25:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200601132522eucas1p2779cda96b3267b044b4eaae18c226d87~Ubl76CI3O2512925129eucas1p2q;
 Mon,  1 Jun 2020 13:25:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200601132522eusmtrp21f463bd75d32c710cbebf63f471af021~Ubl75RTq31059710597eusmtrp2o;
 Mon,  1 Jun 2020 13:25:22 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-48-5ed501c277e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4A.95.07950.2C105DE5; Mon,  1
 Jun 2020 14:25:22 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200601132521eusmtip2cfdcb48b1d4e86b512e5445c7d11ad62~Ubl7UgHnr1389413894eusmtip2T;
 Mon,  1 Jun 2020 13:25:21 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: pxafb: Fix the function used to balance a
 'dma_alloc_coherent()' call
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <b39fa7b2-fc01-be3e-f899-40b949aa11ee@samsung.com>
Date: Mon, 1 Jun 2020 15:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200429084505.108897-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfyyUcRzH932eu+ce5uzrXPMZle3WalmRau1ZydKMxz8qrc1S6uLparmL
 u1A2pmwRMdGoGyOSHxUydxf5I9dGuqUltYiJ1NTtjhxKC93jYfnv8+P1/ry/7+1Lk7JesTd9
 XnOJ02qUCQrKVWTsmn+z3Yzex+7ouRPEGDrLxcz482zE9M9OUkzWRCZiOoasiDEM+jAvC6bE
 zLv2MoqZnL5BMF/qbBLm1bBDwjyZZQ+4sdUd3wm2peEGxQ596KDYkbxugq0uKBazxffekqyj
 ZSPrGG4SH6aPuwbFcwnnUzhtQPBp13NXP8oTR10ufy2ZJTJRPp2LXGjAu2HINiDJRa60DNch
 mB8YW2lmENysmkM8JcMOBI/zw1YVpjk7JUC1CEqMz1Yam1NuyRXxFIX3wq3sBqdaQnviOKgI
 4adyvAfKCz6RPE7iJgJ69PMEv5DiYFhcyiP5WoQ3gd3St2y8DkfD9OcXYoHxgJ6748vnXXAo
 jBvKl3kSe8HgeAUh1L5gspUtGwD+KYGKmjxnHNrZhELR7xNCAE/40d0qEer1sNTGa3m+EcFC
 zsSK2ISgtniREqh9MNT7h+IPkXgrNLUHCOMQKGz9tXLfHT7aPIQ3uEORsZQUxlLIuS4T6M3Q
 /KCZWrXNbasnC5FCvyaZfk0a/Zo0+v++lUjUgLy4ZJ1axel2arhUf51SrUvWqPzjLqpbkPOX
 WRa7Z56i9r9nzAjTSOEmpcf6Y2ViZYruitqMgCYVcunB15ZYmTReeSWN0148pU1O4HRm5EOL
 FF7SXVXfT8qwSnmJu8BxiZx2dUvQLt6ZKKG0PDqlxzPq9n2/I5X7DyV1X+uIeOlRgDVGe0hZ
 8oWF+G/uGflb1KUxpnvuMWkwRVg95n9G/ogQTUsnvuSkW3NmRqMaO5Nmkrqy3DZWP9rGhNub
 5XrafHbAMX00XF8W+GGDtcbqZTAkZqQfG6lNjX5IhsmzVSPxvpH1u/v6UxUi3TlloB+p1Sn/
 AQbWc6NhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7qHGK/GGZxqlrfYenAuq8WTA+2M
 Fle+vmezaH7RwGix585rRoutt6QtTvR9YLW4vGsOm8X7T51MFo9XvGW3OHX3M7vFxq8eDjwe
 i/e8ZPLYtKqTzePOtT1sHve7jzN5LO6bzOoxeeFFZo/Pm+Q8Pt9dzxrAEaVnU5RfWpKqkJFf
 XGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX0XhDpOAhZ8XTaV+ZGhh7
 OboYOTkkBEwktn97x9bFyMUhJLCUUeLN3SnsXYwcQAkZiePryyBqhCX+XOuCqnnNKPFucj8L
 SIJNwEpiYvsqxi5Gdg5hgWSJ+Y4gUREBM4m5fbeZQcqZBdYzScw5/5sZonc6o8S8zsdsIFW8
 AnYS//53M4PYLAIqEu9OX2IEsUUFIiQO75jFCFEjKHFy5hOwXZwCLhJPts4Fq2cWUJf4M+8S
 lC0ucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L
 10vOz93ECIzebcd+btnB2PUu+BCjAAejEg/vhvtX4oRYE8uKK3MPMUpwMCuJ8DqdPR0nxJuS
 WFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAxJJXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEk
 NTs1tSC1CKaPiYNTqoFR0aM77YHmspdZ7ALedpErl64Ryda1YF151s/9O1dp5qTqf9OTKicG
 RD31M2z8k9RwfOKh63dPZuc59S/nvaz8hl9U+ePvuxqF5/ps7f9by6usPHN5Tnnb21k3vkY1
 XyrNjHe8s05rZX7rklVyO6q373nbqP5m/QOFXo/gCYGLGjj4ptjcdf+pxFKckWioxVxUnAgA
 PUEHRvQCAAA=
X-CMS-MailID: 20200601132522eucas1p2779cda96b3267b044b4eaae18c226d87
X-Msg-Generator: CA
X-RootMTR: 20200429084519eucas1p2813ed7e76d573778607ac1270d8cb2e7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200429084519eucas1p2813ed7e76d573778607ac1270d8cb2e7
References: <CGME20200429084519eucas1p2813ed7e76d573778607ac1270d8cb2e7@eucas1p2.samsung.com>
 <20200429084505.108897-1-christophe.jaillet@wanadoo.fr>
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
Cc: linux-fbdev@vger.kernel.org, corbet@lwn.net, jani.nikula@intel.com,
 viresh.kumar@linaro.org, rafael.j.wysocki@intel.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, eric.miao@marvell.com,
 mchehab+samsung@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/29/20 10:45 AM, Christophe JAILLET wrote:
> 'dma_alloc_coherent()' must be balanced by a call to 'dma_free_coherent()'
> not 'dma_free_wc()'.
> The correct dma_free_ function is already used in the error handling path
> of the probe function.
> 
> Fixes: 77e196752bdd ("[ARM] pxafb: allow video memory size to be configurable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/pxafb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index 00b96a78676e..6f972bed410a 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2417,8 +2417,8 @@ static int pxafb_remove(struct platform_device *dev)
>  
>  	free_pages_exact(fbi->video_mem, fbi->video_mem_size);
>  
> -	dma_free_wc(&dev->dev, fbi->dma_buff_size, fbi->dma_buff,
> -		    fbi->dma_buff_phys);
> +	dma_free_coherent(&dev->dev, fbi->dma_buff_size, fbi->dma_buff,
> +			  fbi->dma_buff_phys);
>  
>  	return 0;
>  }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
