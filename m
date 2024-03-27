Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F488D883
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7E10F921;
	Wed, 27 Mar 2024 08:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Mawn47hY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED3B10F92A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1711527233; x=1712132033; i=deller@gmx.de;
 bh=yURPtcVZg1YfdN89pi22a9VWPyDqYm49v3p+PFgem9s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=Mawn47hY0h8XnZ2+IUYHSyJBveDvW8QSaxq9Rovw7VzjxJh3zpK1rttvbRj+T5Up
 RbaBssZrbQcsVyCQ2nfRBjcjl3ZhJ572P7aH0mgpK12bGNNi9ZsN2lXNsg7bTr1ce
 Sty7Crp3EfQJ3fnKiCwKIVP8HXU5abpU4CmSMGMvWQLkFS+UZi70wTnjRYlQEjnHj
 0LJjqj1BozFti8muJAJpi3IGDug+XkBMcX52Vlk7CknOhBgAiYOkM1+8zqRJ++e/j
 7z9ACiUOFZapk9NHlQHJuI9ossDguWIOW6z6wINAjWugGtPz7qi+bp+LvH5qQ0KmU
 Yvfi07VOXmWglAj0Vw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.187.174]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1snOV21dkb-00yz9Q; Wed, 27
 Mar 2024 09:13:53 +0100
Message-ID: <a9bdefa3-2162-4ca1-a020-95e4e9d1ecdf@gmx.de>
Date: Wed, 27 Mar 2024 09:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] fbdev: shmobile: fix snprintf truncation
To: Arnd Bergmann <arnd@kernel.org>, llvm@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240326223825.4084412-1-arnd@kernel.org>
 <20240326223825.4084412-2-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240326223825.4084412-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9l8Ajuf8MU+eu7I7//8FmwZ6ItRejn74X3wHKuGH1DnsTKG9g28
 d7T6Ams4vxLTSh+ZI6MjAxCYWTjTH1cdbcjgLxrPK7QtSNGF+in5moOFeLYAHsFYjuKU9YV
 ZJYPp1nASoImLtIP94azdyPa0QhR2WqHAsZRFfZ1MlY3cf3OubbwWWcpKUBoAsW4AXXOsK6
 +s1l9HlTYT3OG4Cn4ervQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7LvRfy1nIfA=;CBa9xFAMCzAR6YbKkRNV0nxjc6X
 nYq7Sa6RRrfq4q93XOxT+A5gpbKMMJEXefTZKQJJPymMAJK0UATQxkWncQa3c3ul3a5cDSq/D
 47XpSpftyADDAdObbIA1yrarc5NEfr9tvBW8sMuGjTG7wpuLP4/C/TOYFE4F2z/mcGh2IRWu2
 yYGAp8rI470OvTy2gdVJxy2iXrj8jcfmPSj/bo1VJrjY2CAYlQ9kxWMSkjt99Nu43sr+hU7ac
 1vw3NRRakQDq9C6y3SX1muKsGMUvfBWDf20myW7jSY8Dau9uz02ICfzwaU0HSdhPkgcetrsIl
 LCRiQFHkfjp4uhJPEkZigB86XA2Q2Yh8NybEQeitTf67igSbVDXx0ys/qr9afEydXX+wCC7Ow
 2TvgZGnlCyPg/MyRAGBUoZ+2UT/5enUM3fiwW11e0+VLHzXsXPby7U9yI0i1ate7LewzSbHpf
 xcPruFRP/Dx3McPsOkeJUlbgtvj8PVQaBhdpzIuD0qHdlzBh0kQkAxYEbIhrZ7WLU1pMDO0IE
 K7+9oAuEG6j3K9uUuraoy0DpB7kj8ASwi/zxpIiPy6+4SE65ojEJS0nAGZ/8j+G9BEGRvQYQy
 OcjjWrT8kpp07mtoGNKRGAZDdzqCz3UVgwGFjiUo3tiGG/DHvHilraRUy46TdwbZLmzBjjVw7
 ds+f+0Rl/iVuq2THmihcjwdYu8T73Sro2SiMLxeFrXtBhKmINPKK3zNO4rYsmwvPD6tJEZuOX
 pry5J8Pwhh7ncbrlFKfrg1YntZWexpbMe7j8fuCruXxGNuGFUPURUWxZ0cCeXIjYObthR4a9X
 olBak6nfX2vx3BNuJAa6GX/zoCMAwA1BOx863fjvZhbro=
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

On 3/26/24 23:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The name of the overlay does not fit into the fixed-length field:
>
> drivers/video/fbdev/sh_mobile_lcdcfb.c:1577:2: error: 'snprintf' will al=
ways be truncated; specified size is 16, but format string expands to at l=
east 25
>
> Make it short enough by changing the string.
>
> Fixes: c5deac3c9b22 ("fbdev: sh_mobile_lcdc: Implement overlays support"=
)
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

applied to fbdev git tree.

Thanks!
Helge


> ---
>   drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbde=
v/sh_mobile_lcdcfb.c
> index eb2297b37504..d35d2cf99998 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1575,7 +1575,7 @@ sh_mobile_lcdc_overlay_fb_init(struct sh_mobile_lc=
dc_overlay *ovl)
>   	 */
>   	info->fix =3D sh_mobile_lcdc_overlay_fix;
>   	snprintf(info->fix.id, sizeof(info->fix.id),
> -		 "SH Mobile LCDC Overlay %u", ovl->index);
> +		 "SHMobile ovl %u", ovl->index);
>   	info->fix.smem_start =3D ovl->dma_handle;
>   	info->fix.smem_len =3D ovl->fb_size;
>   	info->fix.line_length =3D ovl->pitch;

