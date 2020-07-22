Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E460229A6E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9A89D4F;
	Wed, 22 Jul 2020 14:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBF289D4F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 14:43:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC694AC7F;
 Wed, 22 Jul 2020 14:43:58 +0000 (UTC)
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
Date: Wed, 22 Jul 2020 16:43:45 +0200
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
Content-Type: multipart/mixed; boundary="===============1621607108=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1621607108==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="388bGmlDlzZKQ3M202jHkyjRoPXgGkctO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--388bGmlDlzZKQ3M202jHkyjRoPXgGkctO
Content-Type: multipart/mixed; boundary="ymr65FRSXqTV8gXjqMXTDGovH9qkRzIru";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel@pengutronix.de
Message-ID: <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
In-Reply-To: <20200722132558.28289-1-p.zabel@pengutronix.de>

--ymr65FRSXqTV8gXjqMXTDGovH9qkRzIru
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

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
> +{
> +	struct drm_encoder *encoder =3D ptr;
> +
> +	drm_encoder_cleanup(encoder);
> +}

This doesn't work. DRM cleans up the encoder by invoking the destroy
callback from the encoder functions. This additional helper would
cleanup the encoder a second time.

You can already embed the encoder in another structure and things should
work as expected.

Best regards
Thomas

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


--ymr65FRSXqTV8gXjqMXTDGovH9qkRzIru--

--388bGmlDlzZKQ3M202jHkyjRoPXgGkctO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8YUKYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNLrgf/Xc/Wnh5HraJBp2GOZXNFpjtpiIJX
9pnStnnKywSMfmUs2O+0urX0a/mzYrM+qcPFfBYXQ8H+Dc+qjbsj/SUcWV/Zyn5M
pLNsnhvbSMMIkiIE6RDC8XB1NkeRBc8XoJAJHPDjMf+nO0igAQtPZF9zHcShfRPF
mlZtrTden7M5EtKbY5rmm8BbWVTwe58XnwZYpcz38x5zuVe5UgtRXzUkPv7T8pnx
xZ82+8ecmIMA/kWSL7GPJ+kUFiptPQzGb9wJ1SG5CqY8SJqVLv3mvasuH8GVu3Kq
4TpTkxOlm62ec3msfRknrr1pWZ5pqQelz+sWOeCoxsXZv1svNm0ch2sauA==
=sQ+1
-----END PGP SIGNATURE-----

--388bGmlDlzZKQ3M202jHkyjRoPXgGkctO--

--===============1621607108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1621607108==--
