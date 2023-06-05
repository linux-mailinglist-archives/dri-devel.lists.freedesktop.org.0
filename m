Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44C72224F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 11:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9610E1EA;
	Mon,  5 Jun 2023 09:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CE610E1EA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1685957758; x=1686562558; i=deller@gmx.de;
 bh=4aZGFNHaqYts9HJGEBYu/SzlFrcSqs2ONdbIPv8h5ts=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=r+z4B2tupxVHJ63m3lXNOwXDv699zPSioDJ/oxQ5xFu2aTUX5146vaOrLKh47Lp3+qGQUo9
 OpOojKAaC8qwv2KkgOhLsrjAFQl/vLMeXes1RBy1F6zIujFqtvMLpQqSct/9PB9w8mWplGC8z
 m9TAbFcgnV/WRBVm9LA/kRbO+Vv8dZAgMQnEuFWOL6kQDRnzmJBDI3TWeP0Wn0AzvNjSPVt6a
 eN6PS0gxAUrpL3ASnlHToctdozh9CbA6k0+1QHiCc8VvC++HCTcWKcg97Aj1rwMH/8l/AZSXx
 aeSUtl1GS5ALxFhCDmQSPGmC8/ofE6j0jaYb1zae1j/hKB6xq2Lw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.56.61] ([109.43.115.72]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1qZxSj0dCJ-00flAb; Mon, 05
 Jun 2023 11:35:58 +0200
Message-ID: <848956d2-cf95-bd6a-1292-272438b0d860@gmx.de>
Date: Mon, 5 Jun 2023 11:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] video: fbdev: omapfb: lcd_mipid: Fix an error handling
 path in mipid_spi_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Imre Deak <imre.deak@nokia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Krzysztof Helt <krzysztof.h1@wp.pl>, Juha Yrjola <juha.yrjola@solidboot.com>
References: <f17221571f619c0829db56354f2b74d22f6702a7.1685893329.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f17221571f619c0829db56354f2b74d22f6702a7.1685893329.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O8jINPdRRRhdW6K/VPuIluO4TUz2RA7GWy7BS61PiwwjuaBm3oe
 xRlo+MX+oafQs54E/0uFtXBCfZw5grNtmkqDxHj6wY9m9btw8xD6T7Olg2so3cLBrN/Zo74
 cCewQOuFiAiYVTs/LQHBGZLCdQtHbocA0NpihSdNtkGutMHBukCis8UDnmtGt9UOLFweO98
 a0PowgyQXZCQkLEk0eJng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v7du267JY28=;ZwxfR0dFKojHp9ugRWseiTBAr+f
 23jU7ZfKH2FbkJvd9851IpoF7wmhSZj80LleRmWrnnMt4/7HyEz8L3a+y9CC4doJl9NGY0epA
 BiOhlf94atBk8WYxMVeBVIijVG3DMRNzPQK0rBevUF5h+VYN/5yQnVAXm+ORvF2NmkKFPYA3Z
 RsisHuM8OaM2mD+C+HD1UyAWdsWFYNyZtEZ6tuY0wNqiyNTBy3FGYuApK0HRM4l/Wlx4DY+/r
 NHsd+z3DN9/oNIWNNF/8SdyaTQqUqNpFcbgs+zD+s6cXbYSaZLo/GMaWnvzQvtTNyMZgInDSr
 4YeeUIyx08aVcXmByeMsErm5Z5PAFw/ZC4/3o2qdAmNVqxRM74O677Vvspzhyg6i7BZ7px1os
 /iGiaCsvKzVunj7ZQx1uMC5Fa1ZDZmSG2JKT0mi55fvEICsd20Ef1kiTtawoAjEz5vxKEQeK0
 76ql7QWVFZk1Fe2lsd7pym7UoE8e3liOFBK/ohkCnRJqdMbmi96Smj3qqkFlcuW/JFCG9qItI
 ZO58VAnaUg0gwQIi9bRo1oV6O618aCdmkbtdGs0xASCK6HYNpq1qCrhxGZP0zxq3QNm1tBspa
 MSDa3Ma6RazZqbSOE/nqKuMurQh75cX6KvRB5K32lpGER5YLkEzuXRh/c1Fdxa8yxLHWW6BjM
 7N2khHDlI5cNnW+6FP79RTBa9/QCPffMZ9SfMiYol0JedxLb/GsfXSfTc/k2daPXxsKqHllxR
 F5blRYIkhnVqAVnQW6tRCqIE4UQbhsYM6MzpLs97eGwMs0J5rqqLpZD4V+Tb/ADTWmiab+rsH
 O23y4a0T0T4kX8kfOOLwO25LTf9ZrogjxGGxXvGcJ4xvdLvrScEdMSYo7KtJdp+G66HP6AIF7
 Pww05UlUo/yqMcikZKE9l/tJY+3daL5vncoQKyoZ44NFGrLL804cs/gwinhUyWfkqLAhitnKK
 g9Tn3r41ZqctGPMTgzZGiZC1++Q=
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/4/23 17:42, Christophe JAILLET wrote:
> If 'mipid_detect()' fails, we must free 'md' to avoid a memory leak.
>
> Fixes: 66d2f99d0bb5 ("omapfb: add support for MIPI-DCS compatible LCDs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap/lcd_mipid.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/=
omap/lcd_mipid.c
> index e4a7f0b824ff..a0fc4570403b 100644
> --- a/drivers/video/fbdev/omap/lcd_mipid.c
> +++ b/drivers/video/fbdev/omap/lcd_mipid.c
> @@ -571,11 +571,15 @@ static int mipid_spi_probe(struct spi_device *spi)
>
>   	r =3D mipid_detect(md);
>   	if (r < 0)
> -		return r;
> +		goto free_md;
>
>   	omapfb_register_panel(&md->panel);
>
>   	return 0;
> +
> +free_md:
> +	kfree(md);
> +	return r;
>   }
>
>   static void mipid_spi_remove(struct spi_device *spi)

