Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D5CE9466
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621910E892;
	Tue, 30 Dec 2025 09:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="olmeytOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1482410E892
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767088653; x=1767693453; i=deller@gmx.de;
 bh=W655YJR9d+1BjcFpbdv5IHrPJ/BMYQuU9FNei3KQepM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=olmeytOOZ8Q34fhLHhsTd0pNbBqpfAdrLOenOKWb0iIhQpMaHNqgy07l8ILXFgzq
 ARByZq6rbSm0YOXgXguVRxGCnaJfv4Qdq9pHP7Uo3sylofoD3EZR7DgP74+zaVScC
 NOyqeRKyaajTWbKC0nRF740IPsKIore0k1hc76i+W3Kr7SGHif6ogI0oyD+1dZPmr
 RwSfjrWOuGiaAgfGxdGBiGZ8B3qf7N2A8pWQEZ+7tKlglYt8RGi2QK0wb40eQIiX8
 Y5xpDg6cMw7mHVjVxrRyBrRDKBFGO1tiAZVTTAdkep7ltCJb+eNmJMYndp/l4I3t9
 S4PN2PLbkIwT89HHBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTABZ-1vUFF41bSR-00We5H; Tue, 30
 Dec 2025 10:57:33 +0100
Message-ID: <c3253bfe-e967-48ae-9376-a65ad1d53419@gmx.de>
Date: Tue, 30 Dec 2025 10:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: xilinxfb: request memory region before mapping
 framebuffer
To: patdiviyam@gmail.com
Cc: tzimmermann@suse.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251215225305.3820098-1-patdiviyam@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251215225305.3820098-1-patdiviyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cYRJRm4lrHdt0/WtFcAzMzKxRQuFWgEbmXySsi2m7HAsxh1HjQD
 PvZ8kjG2YNzDyIitogKuwVSzHPOzZWphyoUka0s6aP/weOOUCK6v3gF29SsLkgmkt7kBWzA
 VCFsVE/pu9+SuFiCknyKQHyriZrMjOsM/70uWJSeWFXo3lq3US3FjwuSclTPq8Etet7svkw
 glwx3jMQN6P6kwn4zZRkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZJkUoi6AAdY=;bgDwquZUPuNeAKIk6gwMT2u2J/Y
 +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
 vXfMT0ZKUs/xaTQ4UpV8CA2SsxlIy
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

On 12/15/25 23:53, patdiviyam@gmail.com wrote:
> From: DiviyamPathak <patdiviyam@gmail.com>
>=20
> The xilinxfb driver maps a physical framebuffer address with ioremap()
> without first reserving the memory region. This can conflict with other
> drivers accessing the same resource.
>=20
> Request the memory region with devm_request_mem_region() before mapping
> the framebuffer and use managed mappings for proper lifetime handling.
>=20
> This addresses the fbdev TODO about requesting memory regions and avoids
> potential resource conflicts.
>=20
> Signed-off-by: DiviyamPathak <patdiviyam@gmail.com>

Was it tested it on physical hardware?
If not, could someone test?

Helge


> ---
>   drivers/video/fbdev/xilinxfb.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinx=
fb.c
> index 0a6e05cd155a..f18437490de8 100644
> --- a/drivers/video/fbdev/xilinxfb.c
> +++ b/drivers/video/fbdev/xilinxfb.c
> @@ -280,19 +280,27 @@ static int xilinxfb_assign(struct platform_device =
*pdev,
>   	/* Allocate the framebuffer memory */
>   	if (pdata->fb_phys) {
>   		drvdata->fb_phys =3D pdata->fb_phys;
> -		drvdata->fb_virt =3D ioremap(pdata->fb_phys, fbsize);
> +		/* Request the memory region before mapping */
> +		if (!devm_request_mem_region(dev, pdata->fb_phys, fbsize,
> +					DRIVER_NAME)) {
> +			dev_err(dev, "Cannot request framebuffer memory region\n");
> +			return -EBUSY;
> +		}
> +		drvdata->fb_virt =3D devm_ioremap(dev, pdata->fb_phys, fbsize);
> +		if (!drvdata->fb_virt) {
> +			dev_err(dev, "Could not map framebuffer memory\n");
> +			return -ENOMEM;
> +		}
>   	} else {
>   		drvdata->fb_alloced =3D 1;
>   		drvdata->fb_virt =3D dma_alloc_coherent(dev, PAGE_ALIGN(fbsize),
> -						      &drvdata->fb_phys,
> -						      GFP_KERNEL);
> -	}
> -
> -	if (!drvdata->fb_virt) {
> -		dev_err(dev, "Could not allocate frame buffer memory\n");
> -		return -ENOMEM;
> +					&drvdata->fb_phys,
> +					GFP_KERNEL);
> +		if (!drvdata->fb_virt) {
> +			dev_err(dev, "Could not allocate frame buffer memory\n");
> +			return -ENOMEM;
> +		}
>   	}
> -
>   	/* Clear (turn to black) the framebuffer */
>   	memset_io((void __iomem *)drvdata->fb_virt, 0, fbsize);
>  =20
> @@ -362,8 +370,6 @@ static int xilinxfb_assign(struct platform_device *p=
dev,
>   	if (drvdata->fb_alloced)
>   		dma_free_coherent(dev, PAGE_ALIGN(fbsize), drvdata->fb_virt,
>   				  drvdata->fb_phys);
> -	else
> -		iounmap(drvdata->fb_virt);
>  =20
>   	/* Turn off the display */
>   	xilinx_fb_out32(drvdata, REG_CTRL, 0);
> @@ -386,8 +392,6 @@ static void xilinxfb_release(struct device *dev)
>   	if (drvdata->fb_alloced)
>   		dma_free_coherent(dev, PAGE_ALIGN(drvdata->info.fix.smem_len),
>   				  drvdata->fb_virt, drvdata->fb_phys);
> -	else
> -		iounmap(drvdata->fb_virt);
>  =20
>   	/* Turn off the display */
>   	xilinx_fb_out32(drvdata, REG_CTRL, 0);

