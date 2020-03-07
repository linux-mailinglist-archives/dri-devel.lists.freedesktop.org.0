Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7F17CD44
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 10:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BFE6E120;
	Sat,  7 Mar 2020 09:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4B6E10F;
 Sat,  7 Mar 2020 09:31:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 20AFA80507;
 Sat,  7 Mar 2020 10:31:52 +0100 (CET)
Date: Sat, 7 Mar 2020 10:31:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 46/51] drm/repaper: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200307093150.GI28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-47-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-47-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=SJz97ENfAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=dGF5jer_bRGR6o4oWjoA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=vFet0B0WnEQeilDPIY6i:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:26PM +0100, Daniel Vetter wrote:
> Allows us to drop the drm_driver.release callback.
> =

> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> =

> v2: Explain why this cleanup is possible (Laurent).
> =

> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
> I also noticed that I've failed to add the error checking,
> __must_check caught that.
> =

> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/tiny/repaper.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repape=
r.c
> index 4741ff670ec9..862c3ee6055d 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -909,13 +909,6 @@ static const struct drm_mode_config_funcs repaper_mo=
de_config_funcs =3D {
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
>  =

> -static void repaper_release(struct drm_device *drm)
> -{
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	drm_mode_config_cleanup(drm);
> -}
> -
>  static const uint32_t repaper_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  };
> @@ -953,7 +946,6 @@ DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
>  static struct drm_driver repaper_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &repaper_fops,
> -	.release		=3D repaper_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.name			=3D "repaper",
>  	.desc			=3D "Pervasive Displays RePaper e-ink panels",
> @@ -1023,7 +1015,9 @@ static int repaper_probe(struct spi_device *spi)
>  	}
>  	drmm_add_final_kfree(drm, epd);
>  =

> -	drm_mode_config_init(drm);
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
>  	drm->mode_config.funcs =3D &repaper_mode_config_funcs;
>  =

>  	epd->spi =3D spi;
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
