Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754949E29CE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97E110EAF5;
	Tue,  3 Dec 2024 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D311710EAF5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:46:17 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tIWyN-0003yC-P7; Tue, 03 Dec 2024 18:46:07 +0100
Message-ID: <fa93f48960c9ea5f5cb5693e6870e885fb1957ee.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Add fdinfo support for memory stats
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, tursulin@igalia.com, Christian Gmeiner
 <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Dec 2024 18:46:07 +0100
In-Reply-To: <20241121092409.3859592-1-christian.gmeiner@gmail.com>
References: <20241121092409.3859592-1-christian.gmeiner@gmail.com>
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

Am Donnerstag, dem 21.11.2024 um 10:24 +0100 schrieb Christian Gmeiner:
> From: Christian Gmeiner <cgmeiner@igalia.com>
>=20
> Use the new helper to export stats about memory usage.
>=20
Thanks, applied to etnaviv/next.

Regards,
Lucas

> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 12 +++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6500f3999c5f..35f47dd6367f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -488,7 +488,16 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] =
=3D {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
> =20
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *=
file)
> +{
> +	drm_show_memory_stats(p, file);
> +}
> +
> +static const struct file_operations fops =3D {
> +	.owner =3D THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo =3D drm_show_fdinfo,
> +};
> =20
>  static const struct drm_driver etnaviv_drm_driver =3D {
>  	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
> @@ -498,6 +507,7 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       =3D etnaviv_debugfs_init,
>  #endif
> +	.show_fdinfo        =3D etnaviv_show_fdinfo,
>  	.ioctls             =3D etnaviv_ioctls,
>  	.num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
>  	.fops               =3D &fops,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 5c0c9d4e3be1..e81c261b0017 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -527,6 +527,17 @@ void etnaviv_gem_obj_add(struct drm_device *dev, str=
uct drm_gem_object *obj)
>  	mutex_unlock(&priv->gem_lock);
>  }
> =20
> +static enum drm_gem_object_status etnaviv_gem_status(struct drm_gem_obje=
ct *obj)
> +{
> +	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> +	enum drm_gem_object_status status =3D 0;
> +
> +	if (etnaviv_obj->pages)
> +		status |=3D DRM_GEM_OBJECT_RESIDENT;
> +
> +	return status;
> +}
> +
>  static const struct vm_operations_struct vm_ops =3D {
>  	.fault =3D etnaviv_gem_fault,
>  	.open =3D drm_gem_vm_open,
> @@ -540,6 +551,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  	.get_sg_table =3D etnaviv_gem_prime_get_sg_table,
>  	.vmap =3D etnaviv_gem_prime_vmap,
>  	.mmap =3D etnaviv_gem_mmap,
> +	.status =3D etnaviv_gem_status,
>  	.vm_ops =3D &vm_ops,
>  };
> =20

