Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7D62FA74
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD3210E776;
	Fri, 18 Nov 2022 16:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA5F10E776
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668789550; bh=a0vbrUlvLVO+t2uJ+7f9BfxYCaU70DpA3blyiDSkkAA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eBCtZbZDBGbgDrXs2XaINW82Mx6TQSDwWjHGlJ+pQBGK5xDJzwSRCku514TVXKIdu
 DSmR3A1jNzcx5788fk9MLK54O6yCqquwQ9BvpM0uThyql+fi9agT/HPET5WM8vPwyq
 IRRNmf18oisi/KseiB+rboseDItXLxuypRd1+6dqnTKspsNip9wfl8Lp1oIgHr3Ax/
 HkBeacoJR7RNuMcWrprAslB8/x3WQoPW0Zi6EF5c++T1431gOnLpppccH9fLfcClSH
 yUqEfGJe0WBxkyt+sqGS1p5cpXP3ALoqcgXBBlrVhcKo/Se6UkZOVuFhU9SgSHsGqJ
 QvNPAvN5PV8Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.156]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1oyhKt2dUc-015oBz; Fri, 18
 Nov 2022 17:39:09 +0100
Message-ID: <7fcf8e63-7b17-2817-db57-e046f9e2601f@gmx.de>
Date: Fri, 18 Nov 2022 17:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] fbdev: da8xx-fb: add missing regulator_disable() in
 fb_probe
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Cai Huoqing <cai.huoqing@linux.dev>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20221118141431.3005015-1-dzm91@hust.edu.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221118141431.3005015-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jqH1y703bQ6BAQ5V8xbTE+CDBa/IxHYCML1hy9S0oTMebLknPcF
 4ORBaAxOn//KRENmPkoqTtBCS5XHGpH74atGx0CH4eZEy0xjG1cjzpLHhJohT21Nu/66zBE
 nUi+oYe2HR2LFW+5+wN2ZVTHgZCnpGZgK6tzE6XvZ7kKRPzv8NWZnHuf7Vj2QxZq8zYMgv6
 +09dvVIfn2ldW7BVd7qXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8AqydaM4K6c=;zd58ZkKkuT5wsAKJtmkeedjRRT0
 L8NhWxJxYlBoolLo9tySS8S+Qh6+iMKPcnt69zKQ47SyTNYvKhI8grCpAURpidQyFqd81P3uf
 JBEXiXAU7Q5gCQwF0scz/X9hiLgbQ/JLNdw3K/49sQDScV5Wi2jQh0FpT9zLyxIeJoFKkePj9
 +upbFVUl/yCaV/dLWiCYMSwOk9PCFEoTyRv/LA1W02mRfLWYQhuS4f49BtClqsoXW6v/2qQXX
 Z8k02VcqyvTBC+I8OvVRc7QUG0hfK2JOGwYmmn3XqrK9jYYhCaOLCq0E5KKuW6dPrNVMXiZwQ
 Ot7XtGnD/lrr0B0HPdjuOOfgMSr/71wH00oAF/l8lzp8kD0/lHlsTT7LcS7CkWuOTLA7WNjKd
 //hZDcquEwJMHYSVgzFXn11ho4pHo/LdXMtjrJpjxuWeFHVNdaX+43eysv6CrvNL4WR7pFKfN
 a7CBT8tl8XaZCD/Ul5hHWJgyHIb+wkhAd4seJQBB87MYIrPBGnG/PUISBSVLK5GYs1RysiswK
 82TEizi5oDplNDfC+gAB70MUVUdYRBpPljtnQBmPh5geKhEOqR8d7N04KH0MSyDYtsqmSuNtT
 vAVnE40yWiL9J0Ak4BR97wiPQxjGfTFj1R8k+PuiI5eIC1ICbD2U8qKLylX1u7bHVJwYY//77
 +E/ePRm2zeY0LO/yMzX/PKpPsuinKNKDJE6Df0gyWYEdaDzibrANZGOXBGSNvJlCvh0mOfLZt
 YT06J8bRFBK2pKLrUbb9aBLZcWiAjX/gAzkP51MbCF7VQZXJXT2hWvWQh+5m+1a66SF4xkWD1
 7K/Wvpn1iqjn6szymYptMPK6skaNuzA15Jso7ih0CfcHktZK2RYoiHFZBTzipLc6p4xvQ63eG
 X3gF0uBZI370bR9rLhYEtSNtO6FSExRrVzD3BtjqvnOoVnnuWvnAbp4bfthfRZVjd2Lbow497
 nHHHi4ERZCN6kjs8qveaIaYdA18=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 15:14, Dongliang Mu wrote:
> The error handling code in fb_probe misses regulator_disable if
> regulator_enable is called successfully. The previous commit only
> adds regulator_disable in the .remove(), forgetting the error
> handling code in the .probe.
>
> Fix this by adding a new error label to call regulator_disable.
>
> Fixes: 611097d5daea("fbdev: da8xx: add support for a regulator")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/da8xx-fb.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-=
fb.c
> index 11922b009ed7..cd07e401b326 100644
> --- a/drivers/video/fbdev/da8xx-fb.c
> +++ b/drivers/video/fbdev/da8xx-fb.c
> @@ -1431,7 +1431,7 @@ static int fb_probe(struct platform_device *device=
)
>   		dev_err(&device->dev,
>   			"GLCD: kmalloc for frame buffer failed\n");
>   		ret =3D -EINVAL;
> -		goto err_release_fb;
> +		goto err_disable_reg;
>   	}
>
>   	da8xx_fb_info->screen_base =3D (char __iomem *) par->vram_virt;
> @@ -1475,7 +1475,7 @@ static int fb_probe(struct platform_device *device=
)
>
>   	ret =3D fb_alloc_cmap(&da8xx_fb_info->cmap, PALETTE_SIZE, 0);
>   	if (ret)
> -		goto err_release_fb;
> +		goto err_disable_reg;
>   	da8xx_fb_info->cmap.len =3D par->palette_sz;
>
>   	/* initialize var_screeninfo */
> @@ -1529,6 +1529,9 @@ static int fb_probe(struct platform_device *device=
)
>   err_dealloc_cmap:
>   	fb_dealloc_cmap(&da8xx_fb_info->cmap);
>
> +err_disable_reg:
> +	if (par->lcd_supply)
> +		regulator_disable(par->lcd_supply);
>   err_release_fb:
>   	framebuffer_release(da8xx_fb_info);
>

