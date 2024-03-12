Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC12879854
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E95112EF5;
	Tue, 12 Mar 2024 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1TmDewdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA08112EFE;
 Tue, 12 Mar 2024 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710258611;
 bh=of33+2FStLO6ifIYx8BLxbRLIRNyrmzZr5NjtBoPN8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1TmDewdFYLvSntysK0y+pr5JdnPbjB60NEtK5PX+XelBgBhz5bYIbKGeGQ3eC5Mic
 hGJxkB22zOcY2w6UTfjV+kpiQWkGNxIALWddmVxz+OhgcrF8HitX0vmb5VoQszZ/EF
 SPZy1QuFqt1v/KSm2wEXudPSW5QlRkJ79tPvgx/CbNZngEtIt9b05l2f5GpwsVkiBs
 N92hu9d2hgFc3zxwEIkZ3pZ+wV4o3D1vuMbXETy95Z/CJb11O9g14V37kOMSmQZXcZ
 MtvKe8x2JOyb0Hn3+UbYe0zuqIa46oqwZUiGguqbJLQs27kFQwsSKSFtxvT121PdCx
 pTbuVEJOXxxyg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69817378209A;
 Tue, 12 Mar 2024 15:50:11 +0000 (UTC)
Date: Tue, 12 Mar 2024 17:50:09 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 22/42] drm/vkms: Use s32 for internal color
 pipeline precision
Message-ID: <20240312175009.2d00f836.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-23-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-23-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Ze2DpM.ZIoPSmX2yt/kl1S";
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

--Sig_/_Ze2DpM.ZIoPSmX2yt/kl1S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:36 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Certain operations require us to preserve values below 0.0 and
> above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
> such operation is a BT709 encoding operation followed by its
> decoding operation, or the reverse.
>=20
> We'll use s32 values as intermediate in and outputs of our
> color operations, for the operations where it matters.
>=20
> For now this won't apply to LUT operations. We might want to
> update those to work on s32 as well, but it's unclear how
> that should work for unorm LUT definitions. We'll revisit
> that once we add LUT + CTM tests.
>=20
> In order to allow for this we'll also invert the nesting of our
> colorop processing loops. We now use the pixel iteration loop
> on the outside and the colorop iteration on the inside.

I always go through the same thought process:

- putting the pixel iteration loop outermost is going to be horrible
  for performance

- maybe should turn the temporary line buffer to argb_s32 for all of
  VKMS

- that's going to be a lot of memory traffic... maybe your way is not
  horrible for performance

- maybe processing pixel by pixel is good, if you can prepare the
  operation in advance, so you don't need to analyze colorops again and
  again on each pixel

- eh, maybe it's not a gain after all, needs benchmarking

My comment on patch 17 was like the step 0 of this train of thought. I
just always get the same comments in my mind when seeing the same code
again.


Thanks,
pq

>=20
> v4:
>  - Clarify that we're packing 16-bit UNORM into s32, not
>    converting values to a different representation (Pekka)
>=20
> v3:
>  - Use new colorop->next pointer
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 57 +++++++++++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
>  2 files changed, 48 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 25b786b49db0..d2101fa55aa3 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *c=
rtc_state, struct line_buff
>  	}
>  }
> =20
> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_color=
op *colorop)
> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_color=
op *colorop)
>  {
>  	/* TODO is this right? */
>  	struct drm_colorop_state *colorop_state =3D colorop->state;
> @@ -191,25 +191,56 @@ static void apply_colorop(struct pixel_argb_u16 *pi=
xel, struct drm_colorop *colo
> =20
>  static void pre_blend_color_transform(const struct vkms_plane_state *pla=
ne_state, struct line_buffer *output_buffer)
>  {
> -	struct drm_colorop *colorop =3D plane_state->base.base.color_pipeline;
> +	struct drm_colorop *colorop;
> +	struct pixel_argb_s32 pixel;
> =20
> -	while (colorop) {
> -		struct drm_colorop_state *colorop_state;
> +	for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> =20
> -		if (!colorop)
> -			return;
> +		/*
> +		 * Some operations, such as applying a BT709 encoding matrix,
> +		 * followed by a decoding matrix, require that we preserve
> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
> +		 *
> +		 * Pack the 16-bit UNORM values into s32 to give us head-room to
> +		 * avoid clipping until we're at the end of the pipeline. Clip
> +		 * intentionally at the end of the pipeline before packing
> +		 * UNORM values back into u16.
> +		 */
> +		pixel.a =3D output_buffer->pixels[x].a;
> +		pixel.r =3D output_buffer->pixels[x].r;
> +		pixel.g =3D output_buffer->pixels[x].g;
> +		pixel.b =3D output_buffer->pixels[x].b;
> =20
> -		/* TODO this is probably wrong */
> -		colorop_state =3D colorop->state;
> +		colorop =3D plane_state->base.base.color_pipeline;
> +		while (colorop) {
> +			struct drm_colorop_state *colorop_state;
> =20
> -		if (!colorop_state)
> -			return;
> +			if (!colorop)
> +				return;
> +
> +			/* TODO this is probably wrong */
> +			colorop_state =3D colorop->state;
> +
> +			if (!colorop_state)
> +				return;
> =20
> -		for (size_t x =3D 0; x < output_buffer->n_pixels; x++)
>  			if (!colorop_state->bypass)
> -				apply_colorop(&output_buffer->pixels[x], colorop);
> +				apply_colorop(&pixel, colorop);
> =20
> -		colorop =3D colorop->next;
> +			colorop =3D colorop->next;
> +		}
> +
> +		/* clamp pixel */
> +		pixel.a =3D max(min(pixel.a, 0xffff), 0x0);
> +		pixel.r =3D max(min(pixel.r, 0xffff), 0x0);
> +		pixel.g =3D max(min(pixel.g, 0xffff), 0x0);
> +		pixel.b =3D max(min(pixel.b, 0xffff), 0x0);
> +
> +		/* put back to output_buffer */
> +		output_buffer->pixels[x].a =3D pixel.a;
> +		output_buffer->pixels[x].r =3D pixel.r;
> +		output_buffer->pixels[x].g =3D pixel.g;
> +		output_buffer->pixels[x].b =3D pixel.b;
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 2bcc24c196a2..fadb7685a360 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -36,6 +36,10 @@ struct vkms_frame_info {
>  	unsigned int cpp;
>  };
> =20
> +struct pixel_argb_s32 {
> +	s32 a, r, g, b;
> +};
> +
>  struct pixel_argb_u16 {
>  	u16 a, r, g, b;
>  };


--Sig_/_Ze2DpM.ZIoPSmX2yt/kl1S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXwebIACgkQI1/ltBGq
qqco+xAAgmK0dBQRO+mZF17VpUwkvrwpxIorD7MONRxBvHi7DW6MprsxPJxXBOhm
i2hbPABwASRCfq4wbTZCkD8grdrmzGuQmowUutGfVGhVLyXQhWAsEw5W720gfI6f
dcbSDKQ+/2lyjC4Oi3fdkV7ioo8rLlo4azz54UKgB0VYUhZnoGihKQkI9P3j9+UY
kHfK8plP/QzWSgxjt2ERhjwJQ3p86eYMfIky3pWxukski+yDQ7aik3lRt34qCBpM
sOZyyOEXEUoGYpkLKVQrEbFGA7jlw6uLTg2pgHQbMLMiD2/6uWwyCce/LiuOD1qZ
9zNTUS6MCVeLFq0OnFAs8DFPhBgS7kz47fz9yJ+9mIvi0V1raepBGTZ83N1KZXHc
nvA9ASABN1M0u269009mtY+J3h5Voph470zVQlz3ED/TwK+Z6lkZE9g5sy8wt/4A
ajVO+k26MmAE4aT8lI9x1b/drg9iaPkJro4N9qnlB9pDAEwPFdXI40S3poMhd3Oz
Baph/1kPpAySzyremvH/30JRpA1Ioze586PdaiD+NEPQmUDARvMecV2EKaXiXobY
I6J6ZthL+7+g4UAHSX1u8uDLNblAp0Kwi1GIYQ+HmbWjizZsmznHg5ChnVoNmjGs
3vic1Jc6w2luv64ikPwyHOud6MWwgDcTRB0odXtOFifG76Tc9Ss=
=+cIn
-----END PGP SIGNATURE-----

--Sig_/_Ze2DpM.ZIoPSmX2yt/kl1S--
