Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB822A9BA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A0A6E850;
	Thu, 23 Jul 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645C6E850
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 07:35:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E97BAD6B;
 Thu, 23 Jul 2020 07:36:06 +0000 (UTC)
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
Date: Thu, 23 Jul 2020 09:35:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722132558.28289-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de
Content-Type: multipart/mixed; boundary="===============0852017256=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0852017256==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EZEtKatSLkT4L6v1LWunVa4iesQnn76Vd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EZEtKatSLkT4L6v1LWunVa4iesQnn76Vd
Content-Type: multipart/mixed; boundary="ZjtAc1PAu4efAwoYylJPfymmKGgLEqb5t";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel@pengutronix.de
Message-ID: <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
In-Reply-To: <20200722132558.28289-1-p.zabel@pengutronix.de>

--ZjtAc1PAu4efAwoYylJPfymmKGgLEqb5t
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I have meanwhile seen your imx patchset where this would be useful.

I still think you should try to pre-allocated all encoders up to a
limit, so that an extra drmm_kzalloc() is not required. But see my
comments below.

Am 22.07.20 um 15:25 schrieb Philipp Zabel:
> Add a drm_simple_encoder_init() variant that registers
> drm_encoder_cleanup() with drmm_add_action().
>=20
> Now drivers can store encoders in memory allocated with drmm_kmalloc()
> after the call to drmm_mode_config_init(), without having to manually
> make sure that drm_encoder_cleanup() is called before the memory is
> freed.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 42 +++++++++++++++++++++++++=

>  include/drm/drm_simple_kms_helper.h     |  4 +++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/=
drm_simple_kms_helper.c
> index 74946690aba4..a243f00cf63d 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -71,6 +72,47 @@ int drm_simple_encoder_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_simple_encoder_init);
> =20
> +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)

It's the reset helper, so drmm_simple_encoder_reset() would be appropriat=
e.

> +{
> +	struct drm_encoder *encoder =3D ptr;
> +
> +	drm_encoder_cleanup(encoder);

This should first check for (encoder->dev) being true. If drivers
somehow manage to clean-up the mode config first, we should detect it. I
know it's a bug, but I wouldn't trust drivers with that.

> +}
> +
> +/**
> + * drmm_simple_encoder_init - Initialize a preallocated encoder with
> + *                            basic functionality.
> + * @dev: drm device
> + * @encoder: the encoder to initialize
> + * @encoder_type: user visible type of the encoder
> + *
> + * Initialises a preallocated encoder that has no further functionalit=
y.

'Initializes'

> + * Settings for possible CRTC and clones are left to their initial val=
ues.
> + * Cleanup is automatically handled through registering drm_encoder_cl=
eanup()
> + * with drmm_add_action().
> + *
> + * The caller of drmm_simple_encoder_init() is responsible for allocat=
ing
> + * the encoder's memory with drmm_kzalloc() to ensure it is automatica=
lly
> + * freed after the encoder has been cleaned up.
> + *

The idiomatic way of cleaning up an encoder is via mode-config cleanup.
This interface is an exception for a corner case. So there needs to be a
paragraph that clearly explains the corner case. Please also discourage
from using drmm_simple_encoder_init() if drm_simple_encoder_init() would
work.

Best regards
Thomas

> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_simple_encoder_init(struct drm_device *dev,
> +			     struct drm_encoder *encoder,
> +			     int encoder_type)
> +{
> +	int ret;
> +
> +	ret =3D drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_clea=
nup,
> +			       encoder_type, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return drmm_add_action_or_reset(dev, drmm_encoder_cleanup, encoder);
> +}
> +EXPORT_SYMBOL(drmm_simple_encoder_init);
> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simp=
le_kms_helper.h
> index a026375464ff..27f0915599c8 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -185,4 +185,8 @@ int drm_simple_encoder_init(struct drm_device *dev,=

>  			    struct drm_encoder *encoder,
>  			    int encoder_type);
> =20
> +int drmm_simple_encoder_init(struct drm_device *dev,
> +			     struct drm_encoder *encoder,
> +			     int encoder_type);
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZjtAc1PAu4efAwoYylJPfymmKGgLEqb5t--

--EZEtKatSLkT4L6v1LWunVa4iesQnn76Vd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ZPdoUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOzVAgAmXnW1Emmaog4Yl0j3oB6ylPLDhnH
VPgwCSQ2z8UXtV4aEzMlhTmvwZWEM0eJgfJrBdsOaLMsms+4M04Ve7XEDKvTlVOP
D4CfPNoHBd7GZXuVwPRbXjhxi2JGJSyEEQlKjgYtKaFsr9HAqtgtXHwL17q6bDoJ
9yhNGYi4uXa53GIDhvp9cTiJR4Jy303dTYMr9Pkam3fP9ilCnaYw5ihxGBtG4L5T
e6WAH0yCuYcFtRAtMUOv4vtHATMJuwu0Xjm46nVfL5vR6bPI6QA0wbZAcAl/+5BE
P0Uq2vCPzYfC+5m4jmnuAcyLafrBNy3X1t5w7VRVJlUDaiMYcFixeoe70A==
=hEaN
-----END PGP SIGNATURE-----

--EZEtKatSLkT4L6v1LWunVa4iesQnn76Vd--

--===============0852017256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0852017256==--
