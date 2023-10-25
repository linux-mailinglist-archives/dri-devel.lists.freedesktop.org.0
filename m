Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75B7D6EBE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055BF10E672;
	Wed, 25 Oct 2023 14:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194DA10E672
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 124CACE38DE;
 Wed, 25 Oct 2023 14:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF815C433C8;
 Wed, 25 Oct 2023 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698244443;
 bh=lqwParP2axT3x7v3VlbAQ6ieAbJ8tmgAP/JeR2gEXFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7I5DTenM0K4I55YtMEkVWIKu9+9yOmNWMlyRpr38JOsai4x7OM7SROpAgWDYpCE1
 zl0ZnNTy4d2UgoU/BzVX/XVk/vOd38wP6YDb+7x8QNBlG6Kw+SXOozgwFNYoI/CzbQ
 bOGHX6+rj7AuJkPVO5QYSChpcEgjOHL8kacowM8kIF2hDk7oUIHP5ept7+tE7GMN3N
 qaNM5FZvYMs0k5mVPKSyPePgx+cmUEIy+BATEAHU6Yq/BX1UWSU9UGVgxjMa81K2SB
 67mvwXFWYnTj7ba/P8ogn3T5TqEpe6WjC33bktDBzHJKjPUfav2IfdyroMCPBcDf90
 XE6gLozziTRew==
Date: Wed, 25 Oct 2023 16:34:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 01/11] drm/tests: Stop using deprecated dev_private
 member on drm_framebuffer tests
Message-ID: <gvc3ml43uq4vaqibcdgkue2356lgsrxl2zzz5ovae7h2leuilx@5ay5emdl4xyq>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-2-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3ielaj5x4lqclzrj"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-2-gcarlos@disroot.org>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3ielaj5x4lqclzrj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 04:09:52PM -0300, Carlos Eduardo Gallo Filho wrote:
> The dev_private member of drm_device is deprecated and its use should
> be avoided. Stop using it by embedding the drm_device onto a mock struct
> with a void pointer like dev_private, using it instead.
>=20
> Also start using drm_kunit_helper_alloc_drm_device() for allocating
> the drm_device mock.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Start using drm_kunit_helper_alloc_drm_device() for drm_device mock.
>   - Rename struct drm_mock to drm_framebuffer_test_priv
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 42 ++++++++++++++------
>  1 file changed, 29 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index f759d9f3b76e..9c6170edd5f7 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -8,8 +8,10 @@
>  #include <kunit/test.h>
> =20
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
>  #include <drm/drm_print.h>
> =20
>  #include "../drm_crtc_internal.h"
> @@ -317,11 +319,17 @@ static const struct drm_framebuffer_test drm_frameb=
uffer_create_cases[] =3D {
>  },
>  };
> =20
> +struct drm_framebuffer_test_priv {
> +	struct drm_device dev;
> +	void *private;
> +};
> +

I'm not super confident with using a void pointer to whatever the test
wants it to be. Especially since it seems like you only use it to store
whether the buffer has been created, so I guess this could just be
converted to a boolean?

>  static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
>  					      struct drm_file *file_priv,
>  					      const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -	int *buffer_created =3D dev->dev_private;
> +	struct drm_framebuffer_test_priv *priv =3D container_of(dev, typeof(*pr=
iv), dev);
> +	int *buffer_created =3D priv->private;
>  	*buffer_created =3D 1;

And then you just need to change that line to priv->buffer_created =3D true;

Maxime

--3ielaj5x4lqclzrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTknWAAKCRDj7w1vZxhR
xV9RAP9r6YR7njv8EjYWM2kQ+sPnyopVKgv+PNt+gs2Wt3bNTAEA08uzLPaQRlmT
Hvf4W86kzwGnUz9pGdtOKi/WrNp3UAk=
=xhND
-----END PGP SIGNATURE-----

--3ielaj5x4lqclzrj--
