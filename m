Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42044F5822
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF9510E218;
	Wed,  6 Apr 2022 08:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5610E218
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1649235406; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEZzm96WsgNKWPm41tm0nV++Aa+9P3fevYoGMhYP/zw=;
 b=K+QzKAh62GkPKnK6Gcgil9rxSfp1+cvt8KVYpFNbuVCaJH7XGTYwPrKQ3lC7uwqNN8o536
 3JB6vTsSqYEFI1tFPO+F5hs2nPadagcbo0of12TC1/Y+AvX3xXOncEdw7MmSOglpKij/Vg
 BEoimLtYd35UCWOAMqeHaRsgdOEH7sg=
Date: Wed, 06 Apr 2022 09:56:31 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-Id: <76UW9R.TLZ8ZU2LVHZW2@crapouillou.net>
In-Reply-To: <20220406105049.5f5e01c1@canb.auug.org.au>
References: <20220406105049.5f5e01c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Le mer., avril 6 2022 at 10:50:49 +1000, Stephen Rothwell=20
<sfr@canb.auug.org.au> a =E9crit :
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/panel/panel-newvision-nv3052c.c:478:19: error:=20
> initialization of 'void (*)(struct spi_device *)' from incompatible=20
> pointer type 'int (*)(struct spi_device *)'=20
> [-Werror=3Dincompatible-pointer-types]
>   478 |         .remove =3D nv3052c_remove,
>       |                   ^~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-newvision-nv3052c.c:478:19: note: (near=20
> initialization for 'nv3052c_driver.remove')
>=20
> Caused by commit
>=20
>   49956b505c53 ("drm/panel: Add panel driver for NewVision NV3052C=20
> based LCDs")
>=20
> interacting with commit
>=20
>   2cbfa2128662 ("spi: make remove callback a void function")
>=20
> from Linus' tree (merged in v5.18-rc1).
>=20
> I applied the following merge resolution patch for today.

Sorry about that, my fault.

I compile-tested Christophe's patchset *then* rebased to the latest=20
drm-misc-next and pushed, should have done the other way around.

-Paul

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Apr 2022 10:46:57 +1000
> Subject: [PATCH] fixup for "spi: make remove callback a void function"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c=20
> b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 127bcfdb59df..cf078f0d3cd3 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -416,15 +416,13 @@ static int nv3052c_probe(struct spi_device *spi)
>  	return 0;
>  }
>=20
> -static int nv3052c_remove(struct spi_device *spi)
> +static void nv3052c_remove(struct spi_device *spi)
>  {
>  	struct nv3052c *priv =3D spi_get_drvdata(spi);
>=20
>  	drm_panel_remove(&priv->panel);
>  	drm_panel_disable(&priv->panel);
>  	drm_panel_unprepare(&priv->panel);
> -
> -	return 0;
>  }
>=20
>  static const struct drm_display_mode ltk035c5444t_modes[] =3D {
> --
> 2.35.1
>=20
> --
> Cheers,
> Stephen Rothwell


