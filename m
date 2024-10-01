Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BE98BD08
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF410E2E2;
	Tue,  1 Oct 2024 13:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEAD10E2E2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 13:04:57 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svcYg-0005l1-DU; Tue, 01 Oct 2024 15:04:54 +0200
Message-ID: <e4270c6629f4f7ac086e7a177374bdbc306226a0.camel@pengutronix.de>
Subject: Re: [PATCH v15 01/19] drm/etnaviv: Implement
 drm_gem_object_funcs::print_info()
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 15:04:53 +0200
In-Reply-To: <20240908094357.291862-2-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-2-sui.jingfeng@linux.dev>
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

Hi Sui,

Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
> It will be called by drm_gem_print_info() if implemented, and it can
> provide more information about the framebuffer objects.

Etnaviv GEM BOs are not framebuffer objects.

>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 32 +++++++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h |  2 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 4247a10f8d4f..543d881585b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -534,8 +534,40 @@ static const struct vm_operations_struct vm_ops =3D =
{
>  	.close =3D drm_gem_vm_close,
>  };
> =20
> +static const char *etnaviv_gem_obj_caching_info(u32 flags)
> +{
> +	switch (flags & ETNA_BO_CACHE_MASK) {
> +	case ETNA_BO_CACHED:
> +		return "cached";
> +	case ETNA_BO_UNCACHED:
> +		return "uncached";
> +	case ETNA_BO_WC:
> +		return "write-combine";

"write-combined" to be consistent with the other two.

> +	default:
> +		break;
> +	}
> +
> +	return "unknown";
> +}
> +
> +static void etnaviv_gem_object_info(struct drm_printer *p,
> +				    unsigned int indent,
> +				    const struct drm_gem_object *obj)
> +{
> +	const struct etnaviv_gem_object *etnaviv_obj;
> +
> +	etnaviv_obj =3D container_of(obj, struct etnaviv_gem_object, base);
> +
> +	drm_printf_indent(p, indent, "caching mode=3D%s\n",
> +			  etnaviv_gem_obj_caching_info(etnaviv_obj->flags));
> +	drm_printf_indent(p, indent, "active=3D%s\n",
> +			  str_yes_no(is_active(etnaviv_obj)));
> +	drm_printf_indent(p, indent, "vaddr=3D%p\n", etnaviv_obj->vaddr);

Why should we expose the vaddr to userspace? I don't see why this would
be relevant even as debug info and it leaks the kernel vmap area
address, which could be abused to facilitate kernel exploits.

Regards,
Lucas

> +}
> +
>  static const struct drm_gem_object_funcs etnaviv_gem_object_funcs =3D {
>  	.free =3D etnaviv_gem_free_object,
> +	.print_info =3D etnaviv_gem_object_info,
>  	.pin =3D etnaviv_gem_prime_pin,
>  	.unpin =3D etnaviv_gem_prime_unpin,
>  	.get_sg_table =3D etnaviv_gem_prime_get_sg_table,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etna=
viv/etnaviv_gem.h
> index a42d260cac2c..3f8fe19a77cc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -68,7 +68,7 @@ struct etnaviv_gem_ops {
>  	int (*mmap)(struct etnaviv_gem_object *, struct vm_area_struct *);
>  };
> =20
> -static inline bool is_active(struct etnaviv_gem_object *etnaviv_obj)
> +static inline bool is_active(const struct etnaviv_gem_object *etnaviv_ob=
j)
>  {
>  	return atomic_read(&etnaviv_obj->gpu_active) !=3D 0;
>  }

