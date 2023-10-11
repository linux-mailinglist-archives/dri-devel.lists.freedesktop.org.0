Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC17C59F7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 19:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25AA10E43C;
	Wed, 11 Oct 2023 17:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876D510E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 17:04:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qqcdM-0006JO-Tw; Wed, 11 Oct 2023 19:04:32 +0200
Message-ID: <3ce3b7b7e7c4344b8a36b2f73ff560e4e3cf8459.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Drop the 'len' parameter of
 etnaviv_iommu_map() function
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Wed, 11 Oct 2023 19:04:32 +0200
In-Reply-To: <20231007070312.1026296-1-suijingfeng@loongson.cn>
References: <20231007070312.1026296-1-suijingfeng@loongson.cn>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Samstag, dem 07.10.2023 um 15:03 +0800 schrieb Sui Jingfeng:
> The 'len' parameter is the 4th argument, because it is not get used, so
> drop it. No functional change.
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks, applied to my etnaviv/next branch.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index 4fa72567183a..1661d589bf3e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -70,7 +70,7 @@ static int etnaviv_context_map(struct etnaviv_iommu_con=
text *context,
>  }
> =20
>  static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 =
iova,
> -			     struct sg_table *sgt, unsigned len, int prot)
> +			     struct sg_table *sgt, int prot)
>  {	struct scatterlist *sg;
>  	unsigned int da =3D iova;
>  	unsigned int i;
> @@ -314,7 +314,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_contex=
t *context,
>  		goto unlock;
> =20
>  	mapping->iova =3D node->start;
> -	ret =3D etnaviv_iommu_map(context, node->start, sgt, etnaviv_obj->base.=
size,
> +	ret =3D etnaviv_iommu_map(context, node->start, sgt,
>  				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
> =20
>  	if (ret < 0) {

