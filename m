Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B2C9CD2D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 20:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8E410E6A3;
	Tue,  2 Dec 2025 19:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SmIczK42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0904F10E6A3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764704945; x=1765309745; i=deller@gmx.de;
 bh=wcqCWjRiwmY+KVsK3v6eiQ+wC9MasYz6ZEu+phFOuGY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SmIczK42ilkok4jefQkGAJIc5ERFYf29Z60Wh37acEMAzn67aRuXJG54yCDIuqLR
 2rNCeBc8OoCF1pYFvtwjc69RRgq1zR4N2iQk2+ClaZvBdM0+edP5EJxR6WiiQYkbL
 KxNoYiuDmOhwCydFHfsUF/n6uqTzAiPQSAqlUPocggwcHTVPvlC1vZFLz4vmpp1D0
 EfzdX63I7mFoENUICFBWfuCj5Vrts1vt3iUodKulTNdJ1QLHD8S03ai54y+5RGA5h
 VRkdZ6za+ceB4iFFKqhPv4dbToQiy1ctyIkBNQhf6/Jv0QF54NXlyV4kIz1PiIR3C
 TKajsTdNrtjI31sQEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1vHkvZ1Ra4-003ceJ; Tue, 02
 Dec 2025 20:49:05 +0100
Message-ID: <cd0696c4-151c-4379-b718-d963d182a060@gmx.de>
Date: Tue, 2 Dec 2025 20:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: ssd1307fb: fix potential page leak in
 ssd1307fb_probe()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: niederp@physik.uni-kl.de, maxime.ripard@free-electrons.com,
 tomi.valkeinen@ti.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251202191225.111661-1-nihaal@cse.iitm.ac.in>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251202191225.111661-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ICg26XaGT/+Bt35pQ1/GplesvyPrQgzTsOvhru21kKdF3Jv6PQ0
 Gi27ySsur3ZaRxIpTmFSF11Kk0gMaRkdceVkXgtNwBLepqGw3idSvtLVWAbtXcoSiV4LJkj
 +sNBd001Aq/B8yjuvK/AU/+DpkBgtlLvcZkm6u0vMal1pIfRlYl6w8SRm7GFmkg86XinDN0
 9R/7DZ8Co6pzlmMNAEKbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tldy3HMHu94=;QfsKVrWF+k3CV1ZfVKfnAAn5M8S
 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
 mtxKubDoTneknstElM5d0BHflulbM9A+Yj5Na1
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

On 12/2/25 20:12, Abdun Nihaal wrote:
> The page allocated for vmem using __get_free_pages() is not freed on the
> error paths after it. Fix that by adding a corresponding __free_pages()
> call to the error path.
>=20
> Fixes: facd94bc458a ("fbdev: ssd1307fb: Allocate page aligned video memo=
ry.")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Not tested on hardware.
>=20
>   drivers/video/fbdev/ssd1307fb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd13=
07fb.c
> index aa6cc0a8151a..66da8a1a0941 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -680,7 +680,7 @@ static int ssd1307fb_probe(struct i2c_client *client=
)
>   	if (!ssd1307fb_defio) {
>   		dev_err(dev, "Couldn't allocate deferred io.\n");
>   		ret =3D -ENOMEM;
> -		goto fb_alloc_error;
> +		goto fb_defio_error;

this goto jumps over the assignment of info->fix.smem_start, so...
...

>   	}
>  =20
>   	ssd1307fb_defio->delay =3D HZ / refreshrate;
> @@ -757,6 +757,8 @@ static int ssd1307fb_probe(struct i2c_client *client=
)
>   		regulator_disable(par->vbat_reg);
>   reset_oled_error:
>   	fb_deferred_io_cleanup(info);
> +fb_defio_error:
> +	__free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_len)=
);

freeing info->fix.smem_start is wrong here as it was not initialized
to the value of vmem.

Please rework the patch.

Helge

