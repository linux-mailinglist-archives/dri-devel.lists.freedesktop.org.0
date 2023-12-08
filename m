Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8980A416
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B605F10EA9A;
	Fri,  8 Dec 2023 13:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8806510EA9A;
 Fri,  8 Dec 2023 13:01:40 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bce78f145so2386585e87.0; 
 Fri, 08 Dec 2023 05:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702040499; x=1702645299; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=RSgfe7PlDoU7eZbKVt4jsYdW1yhxnuWp9yHnF2KnbUo=;
 b=GmweC20bTNabK5DgSsQvo097Z6BB/IDH03PqBi+RKb4Lz82S89hVtpTroT7IzQh9Yz
 3H8CoAczIFaZEw3NAqgl/lUlVCcPHhreYP4vvvXUciYRWP2bCS0yPdARbcnXzFivm/aS
 iNZE9k/ELVzCKT+faHgYxediOkwQwpFFHaYHF0DCBtI/C2npKlZLKHRFonCuUDAhMmND
 VS9ce5PQdfmTNBfu8jiAJ85+DZ6WFThV+MISHGYEPWhzV32usaX6zoql2fcpsmNzf1Kt
 LcZRm9FfKxt8aEZa2sbjHXYji/5Ge7ZCI98IAioZZEYX70sUTgCD42TFOmB0PnFMTBPp
 hDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702040499; x=1702645299;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RSgfe7PlDoU7eZbKVt4jsYdW1yhxnuWp9yHnF2KnbUo=;
 b=U3e1OAajcWBwk4AaL78NvoMtinGP0Ey9R9c9rz3wT+t2siLmqyC4BCVR+XJRDCEcoe
 U3cKK/TCWsS5V1828OaMNxMUAH1bveCIqLO2+P4FhUVVzPSuLjdFI0ymjpAPplCV+n0s
 djrWLMed2smDyFEe+W+QRFHla5sO6WZ8ECuJ6WnWrHDh28Wu80RM3XmgPHfBaZeNo543
 BbuoK77gj/xJvrvSxX4q9iMGq1CuGaym9A9mB32sWwuQpsEo0bbXruASvUODCOdMa6pJ
 Q8ys/tqrEIE0aRUlILwGrIF8fcDwhc4/5ALitHFXooQx+mjQBZxVQ9x7/u496xQigMS2
 hPYA==
X-Gm-Message-State: AOJu0YylP1D7IsWcWFyouRPUk/HpHRnpVRlR4hSVYMyf5QYf5Vbe6Su1
 B8Kd/NNeI13TutJHbZSpowM=
X-Google-Smtp-Source: AGHT+IHReE7IGqFdW0wfxpUjPjTSX40/NsK7AzD7+889FeZWs1zDapzE6GhyeQoC7Zw7HjGmUgszEQ==
X-Received: by 2002:a05:6512:40c:b0:50b:f9b6:d57 with SMTP id
 u12-20020a056512040c00b0050bf9b60d57mr1259576lfk.166.1702040498486; 
 Fri, 08 Dec 2023 05:01:38 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w18-20020ac254b2000000b0050bfce1bc37sm208386lfk.166.2023.12.08.05.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:01:38 -0800 (PST)
Date: Fri, 8 Dec 2023 15:01:34 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 20/23] drm/vkms: Use s32 for internal color
 pipeline precision
Message-ID: <20231208150134.7665a03a@eldfell>
In-Reply-To: <20231108163647.106853-21-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-21-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eEoygNcbOurmajm0iV0rnPN";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/eEoygNcbOurmajm0iV0rnPN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:39 -0500
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

I think it's quite clear how those LUTs work: the assumed domain is
always [0.0, 1.0] unless otherwise stated. Anything outside of the
domain is theoretically undefined, but since raising an error is out of
the question, a LUT can clamp its input to its defined domain.

Btw. this reflects all the way to the colorop UAPI.

> In order to allow for this we'll also invert the nesting of our
> colorop processing loops. We now use the pixel iteration loop
> on the outside and the colorop iteration on the inside.

Yes, that's how it is probably the best, which kind of breaks my
previous comment about moving conditionals outside of the innermost
loop. You could pre-construct an array of function pointers and
arguments to run through in the innermost loop, but it's not clear to
me if that has a significant performance improvement.

> v3:
>  - Use new colorop->next pointer
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 55 +++++++++++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
>  2 files changed, 46 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 9010415e4bd6..d04a235b9fcd 100644
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

IIRC, this will cause an implicit cast from s32 to u16, which is very
different from a clamp. I wouldn't call this "won't apply".

>  {
>  	/* TODO is this right? */
>  	struct drm_colorop_state *colorop_state =3D colorop->state;
> @@ -191,25 +191,54 @@ static void apply_colorop(struct pixel_argb_u16 *pi=
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
> +
> +		/*
> +		 * Some operations, such as applying a BT709 encoding matrix,
> +		 * followed by a decoding matrix, require that we preserve
> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
> +		 *
> +		 * Convert values to s32 for our internal pipeline and go back
> +		 * to u16 values at the end.
> +		 */
> +		pixel.a =3D output_buffer->pixels[x].a;
> +		pixel.r =3D output_buffer->pixels[x].r;
> +		pixel.g =3D output_buffer->pixels[x].g;
> +		pixel.b =3D output_buffer->pixels[x].b;
> +
> +		colorop =3D plane_state->base.base.color_pipeline;
> +		while (colorop) {
> +			struct drm_colorop_state *colorop_state;
> =20
> -		if (!colorop)
> -			return;
> +			if (!colorop)
> +				return;
> =20
> -		/* TODO this is probably wrong */
> -		colorop_state =3D colorop->state;
> +			/* TODO this is probably wrong */
> +			colorop_state =3D colorop->state;
> =20
> -		if (!colorop_state)
> -			return;
> +			if (!colorop_state)
> +				return;
> =20
> -		for (size_t x =3D 0; x < output_buffer->n_pixels; x++)
>  			if (!colorop_state->bypass)
> -				apply_colorop(&output_buffer->pixels[x], colorop);
> +				apply_colorop(&pixel, colorop);
> +
> +			colorop =3D colorop->next;
> +		}
> =20
> -		colorop =3D colorop->next;
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

It would be good to document, that s32 here still uses 16-bit... err.
It's an extended 16-bit UNORM format. It's not 16-bit fraction, because
1.0 is 0xffff, not 0x10000.

> +
>  struct pixel_argb_u16 {
>  	u16 a, r, g, b;
>  };

Thanks,
pq

--Sig_/eEoygNcbOurmajm0iV0rnPN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzE64ACgkQI1/ltBGq
qqczGxAAkIwwm++Gd9EotfrMFKdlG8Xf7h0yl4vL6qK0mNaPOrRoh0ph/eDeu2PW
Pc15uVaXtvfSy1wE/q26+FEBdja2zY2jk2Wgz33m1cgTIqPa51YVOUVL4e9FFauM
xDRIDtgyTBvkHIKmo7mhvJ8qbC+IOY2kcPAtqpwtOZv5ajKfxyMOqZrFmniHzwVD
dnc2grOzqG2ZhS57oTsMkzQMhyZNUh+naRBnqykwzaqpnxynPZtGj+td2wTxWXG0
KvrqitAzOgj8u3MDqMoXi73+xkVi0mpuliHr1eRz+SfNH8fbY1+lrOW/b7gDGbKY
3wiWOvg5vJh3/OkQau6zgy9Q98hk7zHXyxEhOSPeuzrna/+s0tG7a7Tu/Vnctnxk
exgzPDuPZOp70XcrvlniUVu46gDPQ3s2DPz1snX8+YACelMXNnPUSWYuHZ/EAwF5
GjO/1l9F3c1m9wW6cZkmq9holyp3WUyw3CRW6QXzLgujxy4HC16DvT+STqBMtFcu
VomlInGRqvepZULjhVrB6WBko/3ZqZ9yoggA2fMgyj8gG5JKtyMC5KmuuQsa0dXM
BKfwr3Pl1YcsB/7h/1MgrtU5qAiFQV9bVtX8J+J3DMoHgNLxsNSMZorz5sXyNsZ+
f3FcJnlVJ13YlrXmfKHHLOwgLP9zeYcjiJfwFVwmJfCN67ZzhR0=
=0Pl0
-----END PGP SIGNATURE-----

--Sig_/eEoygNcbOurmajm0iV0rnPN--
