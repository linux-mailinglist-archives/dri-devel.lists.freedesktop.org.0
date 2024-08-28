Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10C962EDA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE9C10E59D;
	Wed, 28 Aug 2024 17:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="LwD6G8kq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308A510E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724867287; x=1725472087; i=deller@gmx.de;
 bh=1ItLr5inkzgvnqp9xEYMX6Pc1zaP7HMzAyR3tBSAwOA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LwD6G8kqS5xtp3zLeKzoFQRhJlRvz0EPMDe8GkSgnPLl1YNRCV0SxTI80RyG1i4W
 kYZT4mm+o84KXXmZsEo7TWmym09pXmQMsRN2kzhBiqrFaC0CWz/cPRuE/G4PYsTk5
 9TM4R7Kmlyg1g7GH7Wj9g/2yco3G0+/nityYZ0MjDjjJO/srY9569qyhcSbyw57Lw
 IWmRdNvGwkVU1W+MiuU+VzLXBqOrAPkmZ+YKtHxRtvuIsZvhP4A6JGkgriiq5+6Y8
 Kvd9LwODT2nZqAJDwh6e/Vg5lbf65Cdcl+rTtB0WyDyYHFujjgskRCw0Uooy1XS0n
 wU9sy/gv+1PoQNJbuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1s0J3o1ENY-010N5a; Wed, 28
 Aug 2024 19:42:52 +0200
Message-ID: <fef5bc70-3921-4562-b9d4-beccc76440a6@gmx.de>
Date: Wed, 28 Aug 2024 19:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] fbdev/efifb: Use stack memory for screeninfo structs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Peter Jones <pjones@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-1-c9cc3e052180@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240827-efifb-sysfs-v1-1-c9cc3e052180@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8bpszq7udg/1scxknG2i1tu1SIORmO3dPhMni8wIR8vYiXq59yp
 8iwdLUrwtVDBoHx89i2kCPFWkosu/8toUpCNlEs1OWJ3fhUmifqehWXcE5rt5m88G13eK8i
 fnjSE5Qb5GmkNeF6iFxEnWoYXPgIHBaWC3VUGBa1f8OFTo8QwmMpLLv3EXMaCAkK/FOICxC
 vce0eepT4c25eRA9URkyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R/McMdNqPaY=;+nlin0owVjd+4J3idTUHHF94t2S
 C7i88RssniTALMkHiNso9mGJ+GkQ8LK1AUVZ6WHS1Yt6UbKA00myXPE6kG/xqyv6pMQwGt9t+
 pVUpxPCQW6T83DN+K5dqJbl96p/P9ai/Gp4PpwyyeeWT5Nx4j2OZBH4t32AEyeo5TFQ4N+Kqs
 CLiYoSkZ2u+DfTP1n2gi3ZB8qyY4Iouhc19+JjsUtUChHdBClJAlg88xxO2PVUFnIRIUJAK5S
 ZnbO814wSChk1k8WObAYheKBDJLKm5jHiqv822kBeKLP6OStypjOl43CO+bS66nRWhZsOSRG9
 /rEQf73k+mS14+Z2pPdtOxPBnDhTwPv2VKwlQ9VPOZ/Xr4CkGbeunqZvKmMtGUuaZvG+t1tMK
 8odG7HgJVcAYzSkuCeIHiI4/7LpP5/dFukqH4xHIUNUKHXZQK+bYW5YaW89m3CoDBis9/iJrm
 Ms3+5eJbHZq4gd41Rq0WtWYajjU/be8KU7KhnNeGqLC8KwE8ZNwmfLiJiCEwSbCbcNDYw/UDJ
 G/Nc9ydv2SJXBkjPtvWG186tYxAeRIGwRkEdHtojvuES3KZKXr5AYIAESdDus7wSGkJ6fVA2A
 E61uJKFwoJuffb9FlN/NJCkcp05WRZ2haf5Wuv2oJ6ngo5uV08ZbbeoQizsacFbCg93h37O+/
 iQMU7h0mwaYOgyvIoXt8Q/I0itvopvCkTJmPMYIHl490c5qcc+tdcvhoLQnP3IcjiMrAhtl9E
 MzaeqnzB3xJBBitj2FZ8/u60Ajatr6uzc1HZYFt627Pysfi0b7Ff4WwNtig4l6kkxa51aM6nK
 Np9QYUOlRSojh1On5VAjdbfw==
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

On 8/27/24 17:25, Thomas Wei=C3=9Fschuh wrote:
> These variables are only used inside efifb_probe().
> Afterwards they are using memory unnecessarily.

Did you check if this change really saves some memory?
With your change, the compiler will either create a hidden
structure which it uses then, or it generates assembly
instructions to fill the struct at runtime.
Both options may not actually reduce the memory footprint...

Another option might be to mark the static struct __initdata
if you expect another card to take over before the memory is
freed at runtime. But I'm not sure if it's worth possible
implications.

Helge

> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   drivers/video/fbdev/efifb.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 8dd82afb3452..8bfe0ccbc67a 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -52,24 +52,6 @@ struct efifb_par {
>   	resource_size_t size;
>   };
>
> -static struct fb_var_screeninfo efifb_defined =3D {
> -	.activate		=3D FB_ACTIVATE_NOW,
> -	.height			=3D -1,
> -	.width			=3D -1,
> -	.right_margin		=3D 32,
> -	.upper_margin		=3D 16,
> -	.lower_margin		=3D 4,
> -	.vsync_len		=3D 4,
> -	.vmode			=3D FB_VMODE_NONINTERLACED,
> -};
> -
> -static struct fb_fix_screeninfo efifb_fix =3D {
> -	.id			=3D "EFI VGA",
> -	.type			=3D FB_TYPE_PACKED_PIXELS,
> -	.accel			=3D FB_ACCEL_NONE,
> -	.visual			=3D FB_VISUAL_TRUECOLOR,
> -};
> -
>   static int efifb_setcolreg(unsigned regno, unsigned red, unsigned gree=
n,
>   			   unsigned blue, unsigned transp,
>   			   struct fb_info *info)
> @@ -357,6 +339,24 @@ static int efifb_probe(struct platform_device *dev)
>   	char *option =3D NULL;
>   	efi_memory_desc_t md;
>
> +	struct fb_var_screeninfo efifb_defined =3D {
> +		.activate		=3D FB_ACTIVATE_NOW,
> +		.height			=3D -1,
> +		.width			=3D -1,
> +		.right_margin		=3D 32,
> +		.upper_margin		=3D 16,
> +		.lower_margin		=3D 4,
> +		.vsync_len		=3D 4,
> +		.vmode			=3D FB_VMODE_NONINTERLACED,
> +	};
> +
> +	struct fb_fix_screeninfo efifb_fix =3D {
> +		.id			=3D "EFI VGA",
> +		.type			=3D FB_TYPE_PACKED_PIXELS,
> +		.accel			=3D FB_ACCEL_NONE,
> +		.visual			=3D FB_VISUAL_TRUECOLOR,
> +	};
> +
>   	/*
>   	 * If we fail probing the device, the kernel might try a different
>   	 * driver. We get a copy of the attached screen_info, so that we can
>

