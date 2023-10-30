Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0E7DBABB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90FD10E2BC;
	Mon, 30 Oct 2023 13:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2110E2BC;
 Mon, 30 Oct 2023 13:29:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c59a4dd14cso62391251fa.2; 
 Mon, 30 Oct 2023 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698672581; x=1699277381; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=V10adeEKqGzIckMZyRtRDYO+5uXXgL8drm78jy3daso=;
 b=NX86S52cOVXsB2PmKJZaCNQOGHmDcHl3ktcLwD+hOjFTMdf1Q+pLz8NUAZ/7+4Vxu1
 DYqw/02XntJA4diYSlxvCW5S1yeQH8Uut5UsMmO9AGljqeLU9y3jzqUJfjD3V46kfvZz
 gU6rVHRSdkqF43Bv4CfwWYhfDt2IjFdBxZurW5VFHxMB4na+0DiALaClgMvZ5L/aL5bY
 ncsGJ4hjPjlKfHcPgMd/mfvPVIYPE2YpVtwcxu0Fenh0TY+g36MfX9lOKh26wgMNWj+j
 pUjdkGJIat1PTibIx5V0XHN+o0uEWX/JKK/AOm3AFZ57AUcrgcA1hJkSLT6t+oExj41Q
 DkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672581; x=1699277381;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V10adeEKqGzIckMZyRtRDYO+5uXXgL8drm78jy3daso=;
 b=biWxEDonZcs5WMPIP/RseNEQJ1I4wjFTp5dA0ZrLH/mBF0GJAwWu8oIVJgUGd+5aZg
 LndvHf7vXYdxM9pxfjrvCkthEY83E2MKjHgS+RJ5eNGGgn+QNqXk5YlYRRbcGFd8w5wv
 fpw45e18a/K90rskMpgdcDCLuFeAy5xEu/woBgyuLP3Ld6ARjYfAQ9aJAi65ttHJmCO8
 DGbje6NBYoeMFPiYmyeZ0qwt0d0WiI2ptr/Y5m0pIPYS3Ngw67kleK5IxCQdDFMluml3
 U3uH6cKBuV8yJXWJanRq1WL3mPEIBeYHbfc5L610Yr9W2QF4uiw5lCULSxRMVsHn43rX
 iKpQ==
X-Gm-Message-State: AOJu0YyLOeb9UZT8U5yFw0+ZXn+jt1JhRfgSMt+ppeWAkjr9xbnA/reC
 RsiCMXglkeG4opWDLXarX/U=
X-Google-Smtp-Source: AGHT+IHUwGmYeCylvjyfm9cISDdSycbOJWWMBWg8tL9z+6p3sPLsH22M2MAZwFQU/HfzQWQsxXoUyg==
X-Received: by 2002:a2e:8643:0:b0:2c5:1553:9129 with SMTP id
 i3-20020a2e8643000000b002c515539129mr7575987ljj.35.1698672581031; 
 Mon, 30 Oct 2023 06:29:41 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 e20-20020a2e8ed4000000b002bfe8537f37sm1236230ljl.33.2023.10.30.06.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:29:40 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:29:28 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 05/17] drm/vkms: Avoid reading beyond LUT array
Message-ID: <20231030152928.02cd8301@eldfell>
In-Reply-To: <20231019212133.245155-6-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-6-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rML9f6.xW.18bHb6BPJwrB2";
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/rML9f6.xW.18bHb6BPJwrB2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Oct 2023 17:21:21 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> When the floor LUT index (drm_fixp2int(lut_index) is the last
> index of the array the ceil LUT index will point to an entry
> beyond the array. Make sure we guard against it and use the
> value of the floot LUT index.
>=20
> Blurb about LUT creation and how first element should be 0x0 and
> last one 0xffff.
>=20
> Hold on, is that even correct? What should the ends of a LUT be?
> How does UNORM work and how does it apply to LUTs?

Do you mean how should UNORM input value map to LUT entries for LUT
indexing?

I suppose UNORM 16-bit converts to nominal real values as:
- 0x0: 0.0
- 0xffff: 1.0

And in LUT, you want 0.0 to map to the first LUT element exactly, and
1.0 to map to the last LUT element exactly, even if whatever
interpolation may be in use, right?

If so, it is important to make sure that, assuming linear interpolation
for instance, there is no "dead zone" at either end. Given high
interpolation precision, any step away from 0.0 or 1.0 needs to imply a
change in the real-valued output, assuming e.g. identity LUT.

If LUT has N elements, and 16-bit UNORM input value is I, then (in
naive real-valued math, so no implicit truncation between operations)

x =3D I / 0xffff * (N - 1)
ia =3D floor(x)
ib =3D min(ia + 1, N - 1)

f =3D x - floor(x)
y =3D (1 - f) * LUT[ia] + f * LUT[ib]


Does that help?

In my mind, I'm thinking of a uniformly distributed LUT as a 1-D
texture, because that's how I have implemented them in GL. There you
have to be careful so that input values 0.0 and 1.0 map to the *center*
of the first and last texel, and not to the edges of the texture like
texture coordinates do. Then you can use the GL linear texture
interpolation as-is.


Thanks,
pq


> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index a0a3a6fd2926..cf1dff162920 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vk=
ms_color_lut *lut, u16 chan
>  				      enum lut_channel channel)
>  {
>  	s64 lut_index =3D get_lut_index(lut, channel_value);
> +	u16 *floor_lut_value, *ceil_lut_value;
> +	u16 floor_channel_value, ceil_channel_value;
> =20
>  	/*
>  	 * This checks if `struct drm_color_lut` has any gap added by the compi=
ler
> @@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct =
vkms_color_lut *lut, u16 chan
>  	 */
>  	static_assert(sizeof(struct drm_color_lut) =3D=3D sizeof(__u16) * 4);
> =20
> -	u16 *floor_lut_value =3D (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> -	u16 *ceil_lut_value =3D (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index=
)];
> +	floor_lut_value =3D (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	if (drm_fixp2int(lut_index) =3D=3D (lut->lut_length - 1))
> +		/* We're at the end of the LUT array, use same value for ceil and floo=
r */
> +		ceil_lut_value =3D floor_lut_value;
> +	else
> +		ceil_lut_value =3D (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> =20
> -	u16 floor_channel_value =3D floor_lut_value[channel];
> -	u16 ceil_channel_value =3D ceil_lut_value[channel];
> +	floor_channel_value =3D floor_lut_value[channel];
> +	ceil_channel_value =3D ceil_lut_value[channel];
> =20
>  	return lerp_u16(floor_channel_value, ceil_channel_value,
>  			lut_index & DRM_FIXED_DECIMAL_MASK);


--Sig_/rML9f6.xW.18bHb6BPJwrB2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU/r7gACgkQI1/ltBGq
qqdJZA//e0Ee19TiFXj3CLeMjPE3RPCquYvOhaF1LGkRUCoTz8Hw3nkOFEW3bzL6
xmHPzw9fQUtrBuj5Jzwz1nh3Ee32zABaqY9qT49P9IKAfihpZrnYWS2CE55UZ72T
CGubKHMcnBkePHSmqk5AOaOq780HvCTTkChWpJdd8iQ8Sb+bhk0rBztcpex1s3WS
DMsdM4Gv27EKiXMfz0l4bASnME0GG32KBQOgNr65g/s5seMu6YapicZ3MjmNdJIA
6K9Muq9psdZNQ6drn60JxMbgojzvqn8uTPey8GI9OK6LsIH0ZpIbYb2zeux+6MsO
ZuSFUpt/mkKUpa1vZ3eGEC+XnEc6hEpTzijvFn9Vdy1fbaiNpME2/XGx0EpPJ4E2
zF1h7OvyD61n2tYTa5Yd0foBhSNkA9yH0y7vmOdA0jrsecZ/wa7BC6bCsCLv5RKw
VA07+15Uki6l5kju5d+B1lUyttkUPGAc9T0Ju4MwCAOtndE8mVlubQoSal19mZ9a
Iyzn8VsSPCsSWW1Ypq+6uBrXzXnUhPW3Ce7y1QoE2MHchpHmTDgIexfvfUQfhTRr
RtlTSQa0X+EeTarH7qNOJ1+CbQktqJtP2ZSYn/EYNcRtaYoOA/ZR1b4ykSrob8dR
U7pfqQU3gzONHGkwDoSqfl3uoq/mpa3qTTQmbSy8+v83XKWcI4s=
=X+WX
-----END PGP SIGNATURE-----

--Sig_/rML9f6.xW.18bHb6BPJwrB2--
