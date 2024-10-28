Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0F9B356B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9D10E4FE;
	Mon, 28 Oct 2024 15:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBEF10E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:55:00 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t5S4w-0004F2-N2; Mon, 28 Oct 2024 16:54:50 +0100
Message-ID: <0eb75d1a3d0da6ec4d520da9ba2061dcf69dadff.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/5] drm/etnaviv: Use unsigned type to count the
 number of pages
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime
 Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org, Christian
 Gmeiner <cgmeiner@igalia.com>
Date: Mon, 28 Oct 2024 16:54:50 +0100
In-Reply-To: <20240908121107.328740-1-sui.jingfeng@linux.dev>
References: <20240908121107.328740-1-sui.jingfeng@linux.dev>
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

Am Sonntag, dem 08.09.2024 um 20:11 +0800 schrieb Sui Jingfeng:
> The drm_prime_pages_to_sg() function takes an 'unsigned int' argument to
> store the length of the page vector. The size of the object in number of
> CPU pages can not be negative, hence, use 'unsigned' variable to store
> the number of pages, instead of the 'signed' one.
>=20
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thanks, series applied to etnaviv/next.

> ---
>=20
> v2: Pick up tags and improve commit message
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 3524b5811682..6b98200068e4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -17,7 +17,7 @@ static struct lock_class_key etnaviv_prime_lock_class;
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *o=
bj)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> -	int npages =3D obj->size >> PAGE_SHIFT;
> +	unsigned int npages =3D obj->size >> PAGE_SHIFT;
> =20
>  	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
>  		return ERR_PTR(-EINVAL);

