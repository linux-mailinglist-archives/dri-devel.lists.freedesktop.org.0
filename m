Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2356B5B6A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33B10E0B0;
	Sat, 11 Mar 2023 12:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824410E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678536128; i=deller@gmx.de;
 bh=XHzjB+riYZupE9URm53jbBdbmmPt9aIVp+oDZubbiSk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XwvIerXlT2mounaGkH4bPd70VnPtb06B4Et9Zm1GSzNjQeF46OxOv+XOJx/POi+nW
 yz0uHVg5mJlA0+7JWQk+QAXNMYLwalZTf2qCuWevYvxJL4guI3hAe3FJzhjTbkuq8z
 EF5HN9UrL52LU7TZC98ooKdJsfGRdokX8rgN+tKb84/wt0FwupvA40oBBjY7bHubdu
 HyEWUdcSLsJ89F1G3nwjsVdy2iCxKUupQDluv8M/gCGgF0Edx8QvVyjwk8xaj0mYA7
 Z47W77i9b1EdrxzJCvJa02pu+X04ClF82Au2qdjO11st1A00mUGkh7NL5j+zktY+gy
 JbjBP0kKSElDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.154.207]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1pjS7T004l-00AoJM; Sat, 11
 Mar 2023 13:02:08 +0100
Message-ID: <3a1432d1-e31b-55bd-c7cc-fe8645f4a188@gmx.de>
Date: Sat, 11 Mar 2023 13:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: Use of_property_read_bool() for boolean properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
References: <20230310144730.1546031-1-robh@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230310144730.1546031-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X0J2z7aRj6j/qMuUHRdtmzCsXbISKEB333XHampK4aM+SECg9EJ
 D4HuvbyC4huv/cXgI86KQIVrhug1XQsYgjd1EVW9w65X4W8Bp2ycALX90Ti/0cuUwNBP+Tk
 3Tj6dBLbEcRi3uT8LkDNIO0s9yA0EbcWK77Sqv5dfr4IBzLJDmVgRxKwLr3rKssEoc9Hhlt
 I6MUOx4SpmcDEQg0e/lTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7d9rmOsCyLE=;E3XyDPaK+7R9zNu0Md/kvsEoh29
 ZWAkr4g1glgIG0NCK/kYaWz1WQrIqBk2krw0EjFZXe5ZSBYaFLKFrtvtuFLD1G646h0s4ooYl
 jenU9WTYplIATATZnLSex+YIHX+C8J7j2OQWQlsOGu8t6ZmrSSqhkPoXBQmrlIWBZEoUAtMss
 UvXv6/KhEtskttYG+eGfcJunaBIWDgHjhJM1Qam5UaqIwl1ZP6MLu0ooucYCISYfbQdNLYO46
 EHQHDCwwLOSRkpDh1/xBT/fRFk+dNjdO5iOLBbkkZfNpf27+zi6i7imbnAe1Phq7xU+Dp8M7G
 lta/mtJ9mvsEk1e5UsYYivWZRwk5zcJwFWgsHKZ8JxRioJIGVd9tQTPCZcrHiTkZn/f+qyCBW
 23BBgEZZMtglMNhzrou+xhpWq0k4+dkczeLTSYzIxI/0NK0DUmAO1K7y274X4ZkD64krqiipF
 /nY2K22rSI6thrReKuyyVYsPKLArxGACcBDdLzrXw2lMGqtVGHsZpqoqk9asnnM/NqePsyGxD
 ko1oT5fikdFn4o/stOUWc2Su2Kg9VfNfXPGQo0aHWUw35bS+/z6ta6gzKNs0djv7zxRdZkPqN
 91CeUzPhACCAMIwgwyfn/eAYMfDDMxnn4MGWwDSLOswq3AFqsSjmmyyeSkPugbc28IviFU/b/
 ISOtw8bJPAlBBbogNS7Owv+HnJbRTeI9L00rQFWfWhv/xdss01CPsehYIvnd7490kZgBbURyw
 mLHjWyYCFH+ckHG2XmRdkpUbIbIOlzrrPoqCUQgko+/G1/YxEHiX8pKxWRVlXgsNqFodjZTwo
 mInnIqEU1M4hC1fD1jxElVR87zhNLrOe4kGef4KvfqSpUSI9ny6rCseauC246zy2CJ0K25eKE
 VOZssyWK5JWos1b9FsCYLhpvWtJJLwVLsPGPUxyptRLvaoh3nesnPTwb1Y9oez7ZlDoAeacE8
 EEBdug==
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/23 15:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>

applied.

Thanks,
Helge

> ---
>   drivers/video/fbdev/offb.c     | 4 ++--
>   drivers/video/fbdev/sm501fb.c  | 4 ++--
>   drivers/video/fbdev/tcx.c      | 3 +--
>   drivers/video/fbdev/xilinxfb.c | 3 +--
>   4 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index f7ad6bc9d02d..b97d251d894b 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -549,10 +549,10 @@ static void offb_init_nodriver(struct platform_dev=
ice *parent, struct device_nod
>   	int foreign_endian =3D 0;
>
>   #ifdef __BIG_ENDIAN
> -	if (of_get_property(dp, "little-endian", NULL))
> +	if (of_property_read_bool(dp, "little-endian"))
>   		foreign_endian =3D FBINFO_FOREIGN_ENDIAN;
>   #else
> -	if (of_get_property(dp, "big-endian", NULL))
> +	if (of_property_read_bool(dp, "big-endian"))
>   		foreign_endian =3D FBINFO_FOREIGN_ENDIAN;
>   #endif
>
> diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb=
.c
> index f743bfbde2a6..1f3cbe723def 100644
> --- a/drivers/video/fbdev/sm501fb.c
> +++ b/drivers/video/fbdev/sm501fb.c
> @@ -1737,10 +1737,10 @@ static int sm501fb_init_fb(struct fb_info *fb, e=
num sm501_controller head,
>
>   #if defined(CONFIG_OF)
>   #ifdef __BIG_ENDIAN
> -	if (of_get_property(info->dev->parent->of_node, "little-endian", NULL)=
)
> +	if (of_property_read_bool(info->dev->parent->of_node, "little-endian")=
)
>   		fb->flags |=3D FBINFO_FOREIGN_ENDIAN;
>   #else
> -	if (of_get_property(info->dev->parent->of_node, "big-endian", NULL))
> +	if (of_property_read_bool(info->dev->parent->of_node, "big-endian"))
>   		fb->flags |=3D FBINFO_FOREIGN_ENDIAN;
>   #endif
>   #endif
> diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
> index 01d87f53324d..f2eaf6e7fff6 100644
> --- a/drivers/video/fbdev/tcx.c
> +++ b/drivers/video/fbdev/tcx.c
> @@ -379,8 +379,7 @@ static int tcx_probe(struct platform_device *op)
>
>   	spin_lock_init(&par->lock);
>
> -	par->lowdepth =3D
> -		(of_find_property(dp, "tcx-8-bit", NULL) !=3D NULL);
> +	par->lowdepth =3D of_property_read_bool(dp, "tcx-8-bit");
>
>   	sbusfb_fill_var(&info->var, dp, 8);
>   	info->var.red.length =3D 8;
> diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinx=
fb.c
> index 1ac83900a21c..c17cfffd9a84 100644
> --- a/drivers/video/fbdev/xilinxfb.c
> +++ b/drivers/video/fbdev/xilinxfb.c
> @@ -469,8 +469,7 @@ static int xilinxfb_of_probe(struct platform_device =
*pdev)
>   		pdata.yvirt =3D prop[1];
>   	}
>
> -	if (of_find_property(pdev->dev.of_node, "rotate-display", NULL))
> -		pdata.rotate_screen =3D 1;
> +	pdata.rotate_screen =3D of_property_read_bool(pdev->dev.of_node, "rota=
te-display");
>
>   	platform_set_drvdata(pdev, drvdata);
>   	return xilinxfb_assign(pdev, drvdata, &pdata);

