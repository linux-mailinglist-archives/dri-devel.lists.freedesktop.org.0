Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42E1ADF07
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4423C6EC1D;
	Fri, 17 Apr 2020 14:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730126EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140821euoutp02108cd411a5eb2d868415d7df62622342~GoJnS2c9K1553015530euoutp02w
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140821euoutp02108cd411a5eb2d868415d7df62622342~GoJnS2c9K1553015530euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132501;
 bh=wU/u5yFVwW6Q0MZ+7cwWMbArKdCvY7UAvaNw+w73Lz0=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=rodtYEtSvR0j/PIemYUGu/3yIfZzqy0L96JRfM0zK6IJyaMTKm7PUaesVvum5Kw/T
 nCZdbTlzyB97vsqy70BDOY08WaKpEn/Ua9nKFV/iy3QS/UDhHtZRJC2PwslwQVBmWB
 jSAjJWVFbFDRX4IM3Lb7WJLk6uKUNUFUnxjIw7Pg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140821eucas1p13bbd564c40f19ed8516fb5b8436e04ac~GoJnKsD8n2642726427eucas1p1Y;
 Fri, 17 Apr 2020 14:08:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 85.DA.60698.558B99E5; Fri, 17
 Apr 2020 15:08:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140820eucas1p11ca145debc2f6154820238dca381f180~GoJm3b_-N2642726427eucas1p1V;
 Fri, 17 Apr 2020 14:08:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140820eusmtrp1dd0293a495c5cd1fc63ad18784506372~GoJm2nwZa2264522645eusmtrp1a;
 Fri, 17 Apr 2020 14:08:20 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-fb-5e99b8550b3a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8D.E0.07950.458B99E5; Fri, 17
 Apr 2020 15:08:20 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140820eusmtip2d87bb9f07f5237d0acc713b350086850~GoJmgEoWB0417604176eusmtip2O;
 Fri, 17 Apr 2020 14:08:20 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4] video: fbdev: arcfb: add missed free_irq and fix the
 order of request_irq
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <7f86f442-814c-be94-d387-5448f8260ca6@samsung.com>
Date: Fri, 17 Apr 2020 16:08:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324132353.21785-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djPc7qhO2bGGRybz2Jx5et7NovZh14y
 W5zo+8BqcXnXHDYHFo+ds+6ye9zvPs7k8XmTXABzFJdNSmpOZllqkb5dAldG16mf7AW3+Soe
 9c9mamB8wt3FyMkhIWAi8eT7UpYuRi4OIYEVjBKfWw4zQzhfGCXOND1kh3A+M0o8+bqZGabl
 3fQeRojEckaJF99OsEI4bxkl1hz/wAhSxSZgJTGxfRWYLSyQLHHgxBYmEFtEQF3i866d7CA2
 s0CCxOlF91hAbF4BO4kJDztZQWwWAVWJT0s/gMVFBSIkPj04zApRIyhxcuYToDgHByfQ/F/z
 DCHGiEvcejKfCcKWl9j+dg7YCxIC3ewS69d1M0Fc7SJx6sMdVghbWOLV8S3sELaMxOnJPSwQ
 DesYJf52vIDq3s4osXzyPzaIKmuJO+d+sYFsZhbQlFi/Sx8i7CgxZdJGJpCwhACfxI23ghBH
 8ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9gVJqF5LNZSN6ZheSdWQh7FzCyrGIUTy0t
 zk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMKaf/Hf+6g3Hfn6RDjAIcjEo8vAY9M+OEWBPLiitz
 DzFKcDArifAedAMK8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvE
 wSnVwMguX7K6sfbYjS6+Bmetg1rn+638Lu592Pwqnnfh1Q2xWxcd4nvwnrvjnptc+OeLi7my
 z+2WlN596Gt01VTNm9F76qOU99gpmW96GpOsInphDpPMslK+pmdrNb7kC5+o9mDOKWe60PS4
 JOxcQesuY57LT8Jn/roaq/h/xZpnqwyrW05rp2s+sFJiKc5INNRiLipOBAA/q2sdJQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7ohO2bGGaz8p25x5et7NovZh14y
 W5zo+8BqcXnXHDYHFo+ds+6ye9zvPs7k8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
 kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5G16mf7AW3+Soe9c9mamB8wt3FyMkhIWAi8W56
 DyOILSSwlFHif0N8FyMHUFxG4vj6MogSYYk/17rYuhi5gEpeM0qc37ULrJ5NwEpiYvsqMFtY
 IFniwIktTCC2iIC6xOddO9lB5jALJEg8m5cC0dvLKPH0+A9mkBpeATuJCQ87WUFsFgFViU9L
 P7CA2KICERKHd8xihKgRlDg58wkLyBxOoF2/5hmChJmBxv+Zd4kZwhaXuPVkPhOELS+x/e0c
 5gmMQrOQdM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbPtmM/t+xg
 7HoXfIhRgINRiYfXoGdmnBBrYllxZe4hRgkOZiUR3oNuQCHelMTKqtSi/Pii0pzU4kOMpkC/
 TWSWEk3OB0Z2Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRkaD
 zkNB95ZuNdExmXhtwnqfPf3Pnhc43xFzN1DfWndadcXRd106ldc/1wRODc9uiWxYt7DU/7Hq
 +Wkp/gEzElomsnzetDE/wWsHY/kS+d5raziUfj+d5vGR7+26mAm1lV3qh6TFI/PM5mUcn6S/
 f111Gsv5sG7hTedsPoXusoq8M+ENz62DIUosxRmJhlrMRcWJAJfi/DG0AgAA
X-CMS-MailID: 20200417140820eucas1p11ca145debc2f6154820238dca381f180
X-Msg-Generator: CA
X-RootMTR: 20200324132405eucas1p210aa8eaf8240ce1951514450e701179a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324132405eucas1p210aa8eaf8240ce1951514450e701179a
References: <CGME20200324132405eucas1p210aa8eaf8240ce1951514450e701179a@eucas1p2.samsung.com>
 <20200324132353.21785-1-hslester96@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/20 2:23 PM, Chuhong Yuan wrote:
> The driver forgets to free irq in remove which is requested in
> probe.
> Add the missed call to fix it.
> Also, the position of request_irq() in probe should be put before
> register_framebuffer().
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> Changes in v4:
>   - Use info->par->irq instead of par->irq to avoid dereferencing NULL pointer.
> 
>  drivers/video/fbdev/arcfb.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index 314ab82e01c0..6f7838979f0a 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -544,10 +544,6 @@ static int arcfb_probe(struct platform_device *dev)
>  	par->cslut[1] = 0x06;
>  	info->flags = FBINFO_FLAG_DEFAULT;
>  	spin_lock_init(&par->lock);
> -	retval = register_framebuffer(info);
> -	if (retval < 0)
> -		goto err1;
> -	platform_set_drvdata(dev, info);
>  	if (irq) {
>  		par->irq = irq;
>  		if (request_irq(par->irq, &arcfb_interrupt, IRQF_SHARED,
> @@ -558,6 +554,10 @@ static int arcfb_probe(struct platform_device *dev)
>  			goto err1;
>  		}
>  	}
> +	retval = register_framebuffer(info);
> +	if (retval < 0)
> +		goto err1;
> +	platform_set_drvdata(dev, info);
>  	fb_info(info, "Arc frame buffer device, using %dK of video memory\n",
>  		videomemorysize >> 10);
>  
> @@ -593,6 +593,8 @@ static int arcfb_remove(struct platform_device *dev)
>  
>  	if (info) {
>  		unregister_framebuffer(info);
> +		if (irq)
> +			free_irq(((struct arcfb_par *)(info->par))->irq, info);
>  		vfree((void __force *)info->screen_base);
>  		framebuffer_release(info);
>  	}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
