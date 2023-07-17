Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE59755FD6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756DD10E218;
	Mon, 17 Jul 2023 09:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681EE10E21A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:51:27 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLKsw-0006l0-7n; Mon, 17 Jul 2023 11:51:18 +0200
Message-ID: <862358e67a6f118b11ba16fb94828e9d1635cb66.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jul 2023 11:51:16 +0200
In-Reply-To: <20230623100822.274706-4-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-4-sui.jingfeng@linux.dev>
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

Hi Jingfeng,

Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> Because it is not used by the etnaviv_gem_new_impl() function,
> no functional change.
>=20
I think it would make sense to move into the opposite direction: in
both callsites of etnaviv_gem_new_impl we immediately call
drm_gem_object_init with the size. A better cleanup would be to make
use of the size parameter and move this object init call into
etnaviv_gem_new_impl.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index b5f73502e3dd..be2f459c66b5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -542,7 +542,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  	.vm_ops =3D &vm_ops,
>  };
> =20
> -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 fl=
ags,
> +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj;
> @@ -591,8 +591,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, st=
ruct drm_file *file,
> =20
>  	size =3D PAGE_ALIGN(size);
> =20
> -	ret =3D etnaviv_gem_new_impl(dev, size, flags,
> -				   &etnaviv_gem_shmem_ops, &obj);
> +	ret =3D etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
>  	if (ret)
>  		goto fail;
> =20
> @@ -627,7 +626,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, s=
ize_t size, u32 flags,
>  	struct drm_gem_object *obj;
>  	int ret;
> =20
> -	ret =3D etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
> +	ret =3D etnaviv_gem_new_impl(dev, flags, ops, &obj);
>  	if (ret)
>  		return ret;
> =20

