Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D1879783
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03310E06C;
	Tue, 12 Mar 2024 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B1mvUxd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486D10E06C;
 Tue, 12 Mar 2024 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710257254;
 bh=ueGqMyU8LdG1VrYuRqTqRDBACthQtZHAgLXZ2oJ42os=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B1mvUxd4Mven6r26gNJDAHpNxCh2HuuiOxq4KOFlX5T7oV4uNkGmLbpGOm8ATfZlF
 32g/OG+vyOnDinaEyhgfeiILwuS+0PFjnGv/5adWsXrh51Ep1ViUiu3loUg8dPmq1V
 S8jeOiHeAO82v+yjJwESTHR9vGpzZGXQKoIQY5g9Nu4EvQkXn7WEZfQLX9wB7oY85j
 Y2osiMRKcLFA6j02QZdSM6ON7K/N+RkwiVQhjQWfzPUlUwzX4cVskZEp4CKsxgK3vR
 VsfNM+0rUKcjqx8YRaktCu9grzaB4TpQRMhuT8k7fTVhYdjCjcCopRaThfIJJLzBbQ
 o+SWW6r8mSjuQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12F8C37813DC;
 Tue, 12 Mar 2024 15:27:34 +0000 (UTC)
Date: Tue, 12 Mar 2024 17:27:32 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: Re: [RFC PATCH v4 17/42] drm/vkms: Add enumerated 1D curve colorop
Message-ID: <20240312172732.68b58a70.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-18-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-18-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d8C4qKOBpZDLf74P_bsanmm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/d8C4qKOBpZDLf74P_bsanmm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:31 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This patch introduces a VKMS color pipeline that includes two
> drm_colorops for named transfer functions. For now the only ones
> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
> We will expand this in the future but I don't want to do so
> without accompanying IGT tests.
>=20
> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
> generated with 256 entries each as IGT is currently testing
> only 8 bpc surfaces. We will likely need higher precision
> but I'm reluctant to make that change without clear indication
> that we need it. We'll revisit and, if necessary, regenerate
> the LUTs when we have IGT tests for higher precision buffers.
>=20
> v4:
>  - Drop _tf_ from color_pipeline init function
>  - Pass supported TFs into colorop init
>  - Create bypass pipeline in DRM helper (Pekka)
>=20
> v2:
>  - Add commit description
>  - Fix sRGB EOTF LUT definition
>  - Add linear and sRGB inverse EOTF LUTs
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  drivers/gpu/drm/vkms/Makefile        |   4 +-
>  drivers/gpu/drm/vkms/vkms_colorop.c  |  70 +++
>  drivers/gpu/drm/vkms/vkms_composer.c |  45 ++
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +
>  drivers/gpu/drm/vkms/vkms_luts.c     | 802 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>  7 files changed, 938 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h

...

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index b90e446d5954..9493bdb1ba3f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,7 @@
>  #include <linux/minmax.h>
> =20
>  #include "vkms_drv.h"
> +#include "vkms_luts.h"
> =20
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> @@ -163,6 +164,47 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +static void pre_blend_color_transform(const struct vkms_plane_state *pla=
ne_state, struct line_buffer *output_buffer)
> +{
> +	struct drm_colorop *colorop =3D plane_state->base.base.color_pipeline;
> +
> +	while (colorop) {

I think this would be easier to read if you used

	for (; colorop; colorop =3D colorop->next) {

and

> +		struct drm_colorop_state *colorop_state;
> +
> +		if (!colorop)
> +			return;
> +
> +		/* TODO this is probably wrong */
> +		colorop_state =3D colorop->state;
> +
> +		if (!colorop_state)
> +			return;

	if (colorop_state->bypass)
		continue;

Something about 'switch (colorop->type)' to pick a function pointer to
call, but hard to see at this point of the series how that would work.

However, you can pick between srgb_inv_eotf and srgb_eotf already here.
Then inside the loop you can just call one set of
apply_lut_to_channel_value() and not need conditionals and avoid
indentation levels.

> +
> +		for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> +			struct pixel_argb_u16 *pixel =3D &output_buffer->pixels[x];
> +
> +			if (colorop->type =3D=3D DRM_COLOROP_1D_CURVE &&
> +				colorop_state->bypass =3D=3D false) {
> +				switch (colorop_state->curve_1d_type) {
> +					case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +						pixel->r =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, =
LUT_RED);
> +						pixel->g =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, =
LUT_GREEN);
> +						pixel->b =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, =
LUT_BLUE);
> +						break;
> +					case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +					default:
> +						pixel->r =3D apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_=
RED);
> +						pixel->g =3D apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_=
GREEN);
> +						pixel->b =3D apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_=
BLUE);
> +						break;
> +				}
> +			}

else { aaargh_unknown_colorop(); }

> +		}
> +
> +		colorop =3D colorop->next;
> +	}
> +}

...

> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms=
_luts.c
> new file mode 100644
> index 000000000000..6553d6d442b4
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -0,0 +1,802 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <drm/drm_mode.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_luts.h"
> +

Here it would be really nice to explain how the tables were generated.

> +static struct drm_color_lut linear_array[LUT_SIZE] =3D {
> +	{ 0x0, 0x0, 0x0, 0 },

...

> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut linear_eotf =3D {
> +	.base =3D linear_array,
> +	.lut_length =3D LUT_SIZE,

Why not use just 2 table entries for the linear array?

I didn't see linear_eotf used at all? It could also just skip in the
code, not need an array.

> +	.channel_value2index_ratio =3D 0xff00ffll
> +};


Thanks,
pq

--Sig_/d8C4qKOBpZDLf74P_bsanmm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXwdGQACgkQI1/ltBGq
qqdYoQ//UaMaoW/CEU2QwU8iCYM/6T86SYJVkRIzv50dSvbtLzoLb2qg0KLCbptM
269CrVj2R1s6f4JQPH8zYokxzVHfTZRp0eHurQIYFi3yXSPvsOlgC9i1LODPEGFj
ZcN3j0Iw1B+VGk+RG2Tgmunrjhv5RmMHvFdAoyynHrN3qh009JrfjQAOD3tPn2lk
QY159zt9UFoEotg0HWBZ+DLMu+KO/zVK060rpWczKXYB3R3lmuFHRKQumFkozJtT
7Snh7aSzLQkbfLY52CwAjiNmDUvieObDGFEEd/5lMOa6C3QSS1A7w9m/TQwfzeGj
EMskQPe5tT8eigec2vklBk+xCvz9JBzU2Zl2pm39XXNxaB4BQMQbx0262IWvSWZh
W6TpDVYEX7rp0uOQU/lqlTEO8A3Di1SWzohocV5+eNYUEKzAbJXiI1EGZxxbHpiC
C8q8bwW/9/R+UCV1IkghfHzwWxWngAUpX3Hjmj/USjrqMVEtky9UWlsXCOlN5iCy
n7RtfWeXu0ALXJmFcx+d16IEhPrfwncEB3nCVaCilyFzxC2Zd/k2GnKiSgdISvuT
wJ9tAgj73HNX+e8ps3N1yzkR+R3Oi1UDtHObS3XE5jSk0IyawMiSdL8BozEVHa3g
ivNzYIoCczvoFDjvM4ir8EklmyOkR6m6dNRWRArPfGLSVNaqXCQ=
=wtFW
-----END PGP SIGNATURE-----

--Sig_/d8C4qKOBpZDLf74P_bsanmm--
