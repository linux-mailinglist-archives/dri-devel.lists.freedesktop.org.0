Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855698BE71
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750AF10E622;
	Tue,  1 Oct 2024 13:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379110E622
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 13:51:59 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svdID-0005Al-Mh; Tue, 01 Oct 2024 15:51:57 +0200
Message-ID: <663c5f6f0610b7d3b47b115a51320f0eac7c4c06.camel@pengutronix.de>
Subject: Re: [PATCH v15 05/19] drm/etnaviv: Add contructor and destructor
 for etnaviv_gem_get_mapping structure
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 15:51:57 +0200
In-Reply-To: <20240908094357.291862-6-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-6-sui.jingfeng@linux.dev>
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
> Because this make the code more easier to understand, When GPU access the
> VRAM, it will allocate a new mapping to use if there don't have one.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 40 +++++++++++++++++++--------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h |  6 ++++
>  2 files changed, 34 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 85d4e7c87a6a..55004fa9fabd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -227,6 +227,30 @@ etnaviv_gem_get_vram_mapping(struct etnaviv_gem_obje=
ct *obj,
>  	return NULL;
>  }
> =20
> +static struct etnaviv_vram_mapping *
> +etnaviv_gem_vram_mapping_new(struct etnaviv_gem_object *etnaviv_obj)
> +{
> +	struct etnaviv_vram_mapping *mapping;
> +
> +	mapping =3D kzalloc(sizeof(*mapping), GFP_KERNEL);
> +	if (!mapping)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&mapping->scan_node);
> +	mapping->object =3D etnaviv_obj;
> +	mapping->use =3D 1;
> +
> +	list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
> +
> +	return mapping;
> +}
> +
> +static void etnaviv_gem_vram_mapping_destroy(struct etnaviv_vram_mapping=
 *mapping)
> +{
> +	list_del(&mapping->obj_node);
> +	kfree(mapping);
> +}
> +
>  void etnaviv_gem_mapping_unreference(struct etnaviv_vram_mapping *mappin=
g)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj =3D mapping->object;
> @@ -289,27 +313,20 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_ge=
t(
>  	 */
>  	mapping =3D etnaviv_gem_get_vram_mapping(etnaviv_obj, NULL);
>  	if (!mapping) {
> -		mapping =3D kzalloc(sizeof(*mapping), GFP_KERNEL);
> +		mapping =3D etnaviv_gem_vram_mapping_new(etnaviv_obj);
>  		if (!mapping) {
>  			ret =3D -ENOMEM;
>  			goto out;
>  		}
> -
> -		INIT_LIST_HEAD(&mapping->scan_node);
> -		mapping->object =3D etnaviv_obj;
>  	} else {
> -		list_del(&mapping->obj_node);
> +		mapping->use =3D 1;
>  	}
> =20
> -	mapping->use =3D 1;
> -
>  	ret =3D etnaviv_iommu_map_gem(mmu_context, etnaviv_obj,
>  				    mmu_context->global->memory_base,
>  				    mapping, va);
>  	if (ret < 0)
> -		kfree(mapping);
> -	else
> -		list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
> +		etnaviv_gem_vram_mapping_destroy(mapping);
> =20
>  out:
>  	mutex_unlock(&etnaviv_obj->lock);
> @@ -544,8 +561,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *o=
bj)
>  		if (context)
>  			etnaviv_iommu_unmap_gem(context, mapping);
> =20
> -		list_del(&mapping->obj_node);
> -		kfree(mapping);
> +		etnaviv_gem_vram_mapping_destroy(mapping);
>  	}
> =20
>  	etnaviv_obj->ops->vunmap(etnaviv_obj);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etna=
viv/etnaviv_gem.h
> index d4965de3007c..f2ac64d8e90b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -31,6 +31,12 @@ struct etnaviv_vram_mapping {
>  	u32 iova;
>  };
> =20
> +static inline struct etnaviv_vram_mapping *
> +to_etnaviv_vram_mapping(struct drm_mm_node *vram)
> +{
> +	return container_of(vram, struct etnaviv_vram_mapping, vram_node);
> +}
> +
This hunk looks unrelated to this patch. Otherwise patch looks good.

Regards,
Lucas

>  struct etnaviv_gem_object {
>  	struct drm_gem_object base;
>  	const struct etnaviv_gem_ops *ops;

