Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C7A6545F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02D510E415;
	Mon, 17 Mar 2025 14:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44D10E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:54:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tuBrI-0007hM-0L; Mon, 17 Mar 2025 15:54:28 +0100
Message-ID: <0ba6296be70bab38c761450388e18470d2c4a392.camel@pengutronix.de>
Subject: Re: [PATCH 03/15] drm/etnaviv: Use dma_buf from GEM object instance
From: Lucas Stach <l.stach@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch,  maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  etnaviv@lists.freedesktop.org
Date: Mon, 17 Mar 2025 15:54:26 +0100
In-Reply-To: <20250317131923.238374-4-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-4-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
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

Hi Thomas,

Am Montag, dem 17.03.2025 um 14:06 +0100 schrieb Thomas Zimmermann:
> Avoid dereferencing struct drm_gem_object.import_attach for the
> imported dma-buf. The dma_buf field in the GEM object instance refers
> to the same buffer. Prepares to make import_attach optional.
>=20
Both etnaviv patches are
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Feel free to take them through drm-misc if you want to put further
cleanups on top of that series.

Regards,
Lucas

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 40a50c60dfff..917ad527c961 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -65,7 +65,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_ge=
m_object *etnaviv_obj)
>  	struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
> =20
>  	if (etnaviv_obj->vaddr)
> -		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map)=
;
> +		dma_buf_vunmap_unlocked(etnaviv_obj->base.dma_buf, &map);
> =20
>  	/* Don't drop the pages for imported dmabuf, as they are not
>  	 * ours, just free the array we allocated:
> @@ -82,7 +82,7 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv=
_gem_object *etnaviv_obj)
> =20
>  	lockdep_assert_held(&etnaviv_obj->lock);
> =20
> -	ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> +	ret =3D dma_buf_vmap(etnaviv_obj->base.dma_buf, &map);
>  	if (ret)
>  		return NULL;
>  	return map.vaddr;

