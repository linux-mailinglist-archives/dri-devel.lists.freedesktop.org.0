Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0463755FA1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC45110E215;
	Mon, 17 Jul 2023 09:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7A10E214
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:43:56 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLKlM-0005SU-Ml; Mon, 17 Jul 2023 11:43:28 +0200
Message-ID: <4f80b175f94eaf386354d1f3425208ca6cf20482.camel@pengutronix.de>
Subject: Re: [PATCH v1 1/8] drm/etnaviv: Using the size_t variable to store
 the number of pages
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jul 2023 11:43:23 +0200
In-Reply-To: <20230623100822.274706-2-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-2-sui.jingfeng@linux.dev>
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
> Because the etnaviv_gem_new_private() function receives the size_t argume=
nt
> for the number of pages. And the number of pages should be unsigned.
>=20
> Note that Most 32-bit architectures use "unsigned int" size_t,
> and all 64-bit architectures use "unsigned long" size_t.
> So, let's keep the argument and parameter consistent.
>=20
This explanation doesn't add up. npages is just that: a number of
pages. Why would it make sense to use size_t here?

If you want to be consistent I would have expected this change to
switch things to unsigned int, as you did in the second patch of this
series.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 3524b5811682..b003481adc2b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -114,7 +114,8 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_ta=
ble(struct drm_device *dev,
>  {
>  	struct etnaviv_gem_object *etnaviv_obj;
>  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> -	int ret, npages;
> +	size_t npages =3D size / PAGE_SIZE;
> +	int ret;
> =20
>  	ret =3D etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>  				      &etnaviv_gem_prime_ops, &etnaviv_obj);
> @@ -123,8 +124,6 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_ta=
ble(struct drm_device *dev,
> =20
>  	lockdep_set_class(&etnaviv_obj->lock, &etnaviv_prime_lock_class);
> =20
> -	npages =3D size / PAGE_SIZE;
> -
>  	etnaviv_obj->sgt =3D sgt;
>  	etnaviv_obj->pages =3D kvmalloc_array(npages, sizeof(struct page *), GF=
P_KERNEL);
>  	if (!etnaviv_obj->pages) {

