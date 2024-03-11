Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C99878052
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64491112A61;
	Mon, 11 Mar 2024 13:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FAVb25RW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123031129B2;
 Mon, 11 Mar 2024 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710162716;
 bh=t8ybMr9aWUyQwAIakzMgcukMu62SVuGBqlSrDr6eFng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FAVb25RWbdnuJ2Evo6bHDFH7w6fHNfWxGDs0x6OAciHED6+sM0PLWD7F2yer1/Zym
 pmAB54dB1QNue/wXg2+ZuUBvU+ESrfVzXCR2BizNMt+/XPm8JHpO+CEmxbe70Vk8W3
 41BagS4p3m5nKeg0zadXyzM/5VbHGbvnGZ/3ZCzYAbRghhwI5rgUsj3yCdJewSNP3a
 xlQo4DcK7NB9CRj+vfwPvZB+Cj/AJgrzv3DFe3HH+vQ+315b33OAuBCXh62tysO8Jv
 kLzCOF+1K2lHB0FyE376nKVli1y+PcbKpYVxowZ7d6kDqm+UGxPXHB788H2r6YukjP
 TFgDsEf8W8g2Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB2AB378003D;
 Mon, 11 Mar 2024 13:11:55 +0000 (UTC)
Date: Mon, 11 Mar 2024 15:11:45 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 03/42] drm: Correctly round for fixp2int_round
Message-ID: <20240311151145.227222cb.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-4-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-4-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C/KR.w=Kev3_idWfyEicd=7";
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

--Sig_/C/KR.w=Kev3_idWfyEicd=7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:17 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> A value of 0x80000000 and higher should round up, and
> below should round down. VKMS Kunit tests for lerp_u16
> showed that this is not the case. Fix it.
>=20
> 1 << (DRM_FIXED_POINT_HALF - 1) =3D
> 1 << 15 =3D 0x8000
>=20
> This is not 0.5, but 0.00000762939453125.
>=20
> Instead of some smart math use a simple if/else to
> round up or down. This helps people like me to understand
> what the function does.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  include/drm/drm_fixed.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index cb842ba80ddd..8ee549f68537 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -77,6 +77,8 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
>  #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
>  #define DRM_FIXED_EPSILON	1LL
>  #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
> +#define DRM_FIXED_FRACTIONAL	0xffffffffll
> +#define DRM_FIXED_HALF		0x80000000ll
> =20
>  /**
>   * @drm_sm2fixp
> @@ -106,11 +108,6 @@ static inline int drm_fixp2int(s64 a)
>  	return ((s64)a) >> DRM_FIXED_POINT;
>  }
> =20
> -static inline int drm_fixp2int_round(s64 a)
> -{
> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
> -}
> -
>  static inline int drm_fixp2int_ceil(s64 a)
>  {
>  	if (a >=3D 0)
> @@ -119,6 +116,14 @@ static inline int drm_fixp2int_ceil(s64 a)
>  		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
>  }
> =20
> +static inline int drm_fixp2int_round(s64 a)
> +{
> +	if ((a & DRM_FIXED_FRACTIONAL) < DRM_FIXED_HALF)
> +		return drm_fixp2int(a);

So, if we take -epsilon (which is -1 in raw s64 value, the largest
possible value less than zero), this would return -1.0? That does not
sound right.

However, the "add 0.5 and truncate" trick always works, so I'd
recommend sticking that.


Thanks,
pq

> +	else
> +		return drm_fixp2int_ceil(a);
> +}
> +
>  static inline unsigned drm_fixp_msbset(s64 a)
>  {
>  	unsigned shift, sign =3D (a >> 63) & 1;


--Sig_/C/KR.w=Kev3_idWfyEicd=7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXvAxEACgkQI1/ltBGq
qqeOJw//a6PG7tSQ2UzSerdssV083e6z2B0IY5ysc2JvINerxzj8OMX3ZViYDZag
4K1q9ssa/hNlGRm8QcdMVRuEaavM59uf9v57XcRfAiOu/v+T2fRplRQw9Mspmc1x
zNbReJuEApLw1hZ0jB6ctEl91VL+zeUx78v+aQqJp/BJF2bQI6fKKjLRGo8hnij/
2C+irLlCookfdaBYxYg0lNsQetPxj+uaVmDlo1RAuApnnb1DW6OOFzvIgpauKj85
eMs0US28X/AyA+qT/n/c8VlRlXCrcclcKI1FhWN/zKH8r51kiq1fBLB7LbL4bRFu
Fgzqz8O+Q6AKfeKy1YyJKkE5fp8ByfQtIrbza+0BbP/Pj4dBm17YzmM8JItn2ofQ
HFsID1y59I+hB1M/SmXcmmFMdq/Q7Aeb1e5H2zz+ZUpo0mHKdlQb1WZyqjmUw8g2
OGi9Sr33hbHr6mfMy5hlmAK6NS2SxHgqY6wFPoGJ16zpzKtyqok+2ALxfZajK9nl
YCLrQQHqa6AVzcibjMcUy4L32pBRFUE7/7AgDf+a+UtIm/z2q5Tx+NCnNPcfCJ2I
LC8KgoM6bwsq8wRBCmNyBw3HYh2zX++V5u7P00SWH4eHmGSc1TgC1LJMDv68CB19
Nt2eAj3DIrn3mfyeRmrD0FWVAXDREm8lDlZn8mWG6lBO3CZpNf4=
=El6/
-----END PGP SIGNATURE-----

--Sig_/C/KR.w=Kev3_idWfyEicd=7--
