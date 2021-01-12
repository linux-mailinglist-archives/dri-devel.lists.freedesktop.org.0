Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373C2F2DE6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A296E1D3;
	Tue, 12 Jan 2021 11:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA416E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:30:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AAF7AFA8;
 Tue, 12 Jan 2021 11:30:01 +0000 (UTC)
Subject: Re: [PATCH 07/15] drm/arc: Use drmm_mode_config_cleanup
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
 <20210112084358.2771527-7-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <87d3aaed-dfe7-eb72-7bf5-f39cab5aa858@suse.de>
Date: Tue, 12 Jan 2021 12:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112084358.2771527-7-daniel.vetter@ffwll.ch>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 tiantao6@hisilicon.com, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1280115475=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1280115475==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1hSv29cMquYwjz8O8JMxXdq6K1eHnjewW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1hSv29cMquYwjz8O8JMxXdq6K1eHnjewW
Content-Type: multipart/mixed; boundary="LxHVhmCeseCxSHgoZno3FxlnKNJCqf1fZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Message-ID: <87d3aaed-dfe7-eb72-7bf5-f39cab5aa858@suse.de>
Subject: Re: [PATCH 07/15] drm/arc: Use drmm_mode_config_cleanup
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
 <20210112084358.2771527-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20210112084358.2771527-7-daniel.vetter@ffwll.ch>

--LxHVhmCeseCxSHgoZno3FxlnKNJCqf1fZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.21 um 09:43 schrieb Daniel Vetter:
> With autocleanup through drm_device management we can delete all the
> code. Possible now that there's no confusion against devm_kzalloc'ed
> structures anymore.
>=20
> I inlined arcpgu_setup_mode_config because it's tiny and the newly
> needed return value handling would have been more ...
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>   drivers/gpu/drm/arc/arcpgu_crtc.c |  4 +---
>   drivers/gpu/drm/arc/arcpgu_drv.c  | 21 +++++++++------------
>   drivers/gpu/drm/arc/arcpgu_hdmi.c |  6 +-----
>   drivers/gpu/drm/arc/arcpgu_sim.c  | 11 ++---------
>   4 files changed, 13 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/ar=
cpgu_crtc.c
> index 31a85c703307..43313adb1981 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -209,10 +209,8 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
>  =20
>   	ret =3D drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, =
NULL,
>   					&arc_pgu_crtc_funcs, NULL);
> -	if (ret) {
> -		arc_pgu_plane_destroy(primary);
> +	if (ret)
>   		return ret;
> -	}
>  =20
>   	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);=

>   	return 0;
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arc=
pgu_drv.c
> index 9020352816fa..6349e9dc770e 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -30,16 +30,6 @@ static const struct drm_mode_config_funcs arcpgu_drm=
_modecfg_funcs =3D {
>   	.atomic_commit =3D drm_atomic_helper_commit,
>   };
>  =20
> -static void arcpgu_setup_mode_config(struct drm_device *drm)
> -{
> -	drm_mode_config_init(drm);
> -	drm->mode_config.min_width =3D 0;
> -	drm->mode_config.min_height =3D 0;
> -	drm->mode_config.max_width =3D 1920;
> -	drm->mode_config.max_height =3D 1080;
> -	drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;
> -}
> -
>   DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
>  =20
>   static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
> @@ -54,7 +44,15 @@ static int arcpgu_load(struct arcpgu_drm_private *ar=
cpgu)
>   	if (IS_ERR(arcpgu->clk))
>   		return PTR_ERR(arcpgu->clk);
>  =20
> -	arcpgu_setup_mode_config(drm);
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width =3D 0;
> +	drm->mode_config.min_height =3D 0;
> +	drm->mode_config.max_width =3D 1920;
> +	drm->mode_config.max_height =3D 1080;
> +	drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;

It feels wrong to do this before even acquiring I/O memory. I would have =

moved all this just before the call to arc_pgu_setup_crtc().

Best regards
Thomas

>  =20
>   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	arcpgu->regs =3D devm_ioremap_resource(&pdev->dev, res);
> @@ -108,7 +106,6 @@ static int arcpgu_unload(struct drm_device *drm)
>   {
>   	drm_kms_helper_poll_fini(drm);
>   	drm_atomic_helper_shutdown(drm);
> -	drm_mode_config_cleanup(drm);
>  =20
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/ar=
cpgu_hdmi.c
> index dbad2c9237fe..925d6d31bb78 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -39,9 +39,5 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, stru=
ct device_node *np)
>   		return ret;
>  =20
>   	/* Link drm_bridge to encoder */
> -	ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> -	if (ret)
> -		drm_encoder_cleanup(encoder);
> -
> -	return ret;
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
>   }
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arc=
pgu_sim.c
> index 3772df1647aa..afc34f8b4de0 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -73,21 +73,14 @@ int arcpgu_drm_sim_init(struct drm_device *drm, str=
uct device_node *np)
>   			DRM_MODE_CONNECTOR_VIRTUAL);
>   	if (ret < 0) {
>   		dev_err(drm->dev, "failed to initialize drm connector\n");
> -		goto error_encoder_cleanup;
> +		return ret;
>   	}
>  =20
>   	ret =3D drm_connector_attach_encoder(connector, encoder);
>   	if (ret < 0) {
>   		dev_err(drm->dev, "could not attach connector to encoder\n");
> -		goto error_connector_cleanup;
> +		return ret;
>   	}
>  =20
>   	return 0;
> -
> -error_connector_cleanup:
> -	drm_connector_cleanup(connector);
> -
> -error_encoder_cleanup:
> -	drm_encoder_cleanup(encoder);
> -	return ret;
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LxHVhmCeseCxSHgoZno3FxlnKNJCqf1fZ--

--1hSv29cMquYwjz8O8JMxXdq6K1eHnjewW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9iDcFAwAAAAAACgkQlh/E3EQov+Cb
IA//R/QwWBw69Aur1YHxpq8Fo91/qT5NgnuEpqrZI/T/Q0ge9Jk3FwllXt/TCDSfvYeJlu0VUdID
VMBUcfTdKDPXbE95fCJocafx1lDuUFbetAe3walvOmvTH/bZzUoeUlDUk/Wlkvq791tk5e7pfDXS
Ci1zr52NoZJQgO6mrjErLS5uD26qDO5+lP1coaWw5/lqUUZH0BWxvujsZzRVpYaCTBxU3c1m64g9
LsUHHZyhAs+q+E+dpnNhPiQuyK0l9KSUaD3YCJGRXZ+c5RtBvw+c5mLkWEHOWdtkpalpAWopfX77
AmVdZAUiCftQH8XpDyaTr0R+xYrBoSXHq4ZDqkmMcgqToriSrT9G3YgFyfwXzvAEq4V4dyKl63Fm
hzPKDZz1H0JIYNgFVk12CLQmTstGahgPjQIAc5K8HOVjfkZpxbeSiGUtP9H4ufJC5Rzm9xkPY5Y0
kzRq/r3Xt4thnfWeeEN13oMkn1fb17bearhbH3WSr3I52lIkwhKk9ctiXEgJ5sy5kT84jaLP3FTZ
Y56EPMWsAr0TT3PRUITCFyrsP0gng6wutezfyzvf0aH6rgQ887hMhTdfI6nIR4xut9oW3M33uSAX
IRBNZMXxTyB8ruCbfJ4pzO00rhQrmIW3MIjMGruJ2++Zfct1SsRNNN3sp+X/D4duNunAVaMAip5u
6VQ=
=xPa7
-----END PGP SIGNATURE-----

--1hSv29cMquYwjz8O8JMxXdq6K1eHnjewW--

--===============1280115475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1280115475==--
