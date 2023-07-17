Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D2E755FE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192A310E219;
	Mon, 17 Jul 2023 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8359B10E21A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:58:58 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLL0F-0007XQ-3p; Mon, 17 Jul 2023 11:58:51 +0200
Message-ID: <4113bbafa3c69526392f9be5dcdff86a72f339a3.camel@pengutronix.de>
Subject: Re: [PATCH v1 4/8] drm/etnaviv: Remove surplus else after return
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jul 2023 11:58:48 +0200
In-Reply-To: <20230623100822.274706-5-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-5-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> Because the 'else' is not generally useful after the 'return'.

While your cleanup is a correct rewrite of the function, the current
code in this function is bogus, as we need to check for the
bidirectional (READ | WRITE) case first. Currently we just pick the
DMA_FROM_DEVICE direction when both flags are set, which is clearly not
right.

Regards,
Lucas

>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index be2f459c66b5..271470723d5e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -358,10 +358,11 @@ static inline enum dma_data_direction etnaviv_op_to=
_dma_dir(u32 op)
>  {
>  	if (op & ETNA_PREP_READ)
>  		return DMA_FROM_DEVICE;
> -	else if (op & ETNA_PREP_WRITE)
> +
> +	if (op & ETNA_PREP_WRITE)
>  		return DMA_TO_DEVICE;
> -	else
> -		return DMA_BIDIRECTIONAL;
> +
> +	return DMA_BIDIRECTIONAL;
>  }
> =20
>  int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,

