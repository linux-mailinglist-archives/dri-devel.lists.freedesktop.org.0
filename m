Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35E992902
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D94A10E36B;
	Mon,  7 Oct 2024 10:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5F10E365
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 10:20:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sxkqg-0006jO-HY; Mon, 07 Oct 2024 12:20:18 +0200
Message-ID: <fb5ae5769442f4c84098acd674d423cd3f00bc66.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] drm/etnaviv: Print an error message if inserting
 IOVA range fails
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 12:20:18 +0200
In-Reply-To: <20241004194207.1013744-4-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-4-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
> Print an error message to help debug when such an issue happen, since it'=
s
> not so obvious.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> v0 -> v1: Use dev_err_ratelimited() to prevent spamming the logs
>=20
> v0 is at https://lore.kernel.org/dri-devel/20240930221706.399139-1-sui.ji=
ngfeng@linux.dev/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index a52ec5eb0e3d..37866ed05c13 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -300,8 +300,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_conte=
xt *context,
>  		ret =3D etnaviv_iommu_insert_exact(context, node, user_size, va);
>  	else
>  		ret =3D etnaviv_iommu_find_iova(context, node, user_size);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err_ratelimited(context->global->dev,
> +				    "Insert iova failed: 0x%llx(0x%x)\n",
> +				    va, user_size);
>  		goto unlock;
> +	}
> =20
>  	mapping->iova =3D node->start;
>  	ret =3D etnaviv_iommu_map(context, node->start, user_size, sgt,

