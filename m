Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0698BFBD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157F710E17A;
	Tue,  1 Oct 2024 14:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201010E17A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:21:56 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svdlC-0005r6-D6; Tue, 01 Oct 2024 16:21:54 +0200
Message-ID: <45b8eb9a0a2b91d85f9dd6b7e66a1796398fa27c.camel@pengutronix.de>
Subject: Re: [PATCH v15 11/19] drm/etnaviv: Add etnaviv_gem_obj_remove() helper
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 16:21:53 +0200
In-Reply-To: <20240908094357.291862-12-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-12-sui.jingfeng@linux.dev>
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

Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
> Which is corresonding to the etnaviv_gem_obj_add()
>=20
While symmetry is nice, it's still not really symmetric, as this
function isn't exported into the PRIME parts of the driver like
etnaviv_gem_obj_add(). Given that I don't really see how this patch
improves code legibility.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 39cfece67b90..3732288ff530 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -19,6 +19,8 @@
>  static struct lock_class_key etnaviv_shm_lock_class;
>  static struct lock_class_key etnaviv_userptr_lock_class;
> =20
> +static void etnaviv_gem_obj_remove(struct drm_gem_object *obj);
> +
>  static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_o=
bj)
>  {
>  	struct drm_device *dev =3D etnaviv_obj->base.dev;
> @@ -555,15 +557,12 @@ void etnaviv_gem_free_object(struct drm_gem_object =
*obj)
>  {
>  	struct drm_device *drm =3D obj->dev;
>  	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> -	struct etnaviv_drm_private *priv =3D obj->dev->dev_private;
>  	struct etnaviv_vram_mapping *mapping, *tmp;
> =20
>  	/* object should not be active */
>  	drm_WARN_ON(drm, is_active(etnaviv_obj));
> =20
> -	mutex_lock(&priv->gem_lock);
> -	list_del(&etnaviv_obj->gem_node);
> -	mutex_unlock(&priv->gem_lock);
> +	etnaviv_gem_obj_remove(obj);
> =20
>  	list_for_each_entry_safe(mapping, tmp, &etnaviv_obj->vram_list,
>  				 obj_node) {
> @@ -595,6 +594,16 @@ void etnaviv_gem_obj_add(struct drm_device *dev, str=
uct drm_gem_object *obj)
>  	mutex_unlock(&priv->gem_lock);
>  }
> =20
> +static void etnaviv_gem_obj_remove(struct drm_gem_object *obj)
> +{
> +	struct etnaviv_drm_private *priv =3D to_etnaviv_priv(obj->dev);
> +	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> +
> +	mutex_lock(&priv->gem_lock);
> +	list_del(&etnaviv_obj->gem_node);
> +	mutex_unlock(&priv->gem_lock);
> +}
> +
>  static const struct vm_operations_struct vm_ops =3D {
>  	.fault =3D etnaviv_gem_fault,
>  	.open =3D drm_gem_vm_open,

