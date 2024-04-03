Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E694C8966E1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E61112443;
	Wed,  3 Apr 2024 07:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DTHFvxYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94F112443;
 Wed,  3 Apr 2024 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712130183;
 bh=8GUfyMpfUxxwsfYZy18lB0UcL/QiywioGdkMmWO6JTo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DTHFvxYUxdXeiQNc245XfGp0qS/3bVadnx/xtEboHKgoLISP/c4/bmuIgXNIcBm8m
 Hn9KSb8BiPbkHKWpJB9athTnJbFbd6v2IxAt4BdTCL5W6NpDb1eGoKKg2CwVctM4D+
 XNxlHTvYf5U99Zun0mYXlp/rjzkpTPOobxGD1sxFy7Ff+xiviO9PhI7JZgAX35cvuI
 NbHMq4Gyjg8nvqVvn8T83erZN/LSNqQEKQtnuDI7ht5LozhX46Kp03cykPYnUmi86+
 5WmvO6oTGRAXsShFXLuVmwrtl7CbVRTR7QLKrq32rbpOVzuSX/fF68wOkxFTlpOjKr
 ejXvJf2eGeVZQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE96837820F5;
 Wed,  3 Apr 2024 07:43:02 +0000 (UTC)
Date: Wed, 3 Apr 2024 10:42:46 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 stable@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
Message-ID: <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
In-Reply-To: <20240402232813.2670131-6-zack.rusin@broadcom.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-6-zack.rusin@broadcom.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hA.YcA_c1NuAy1Btlx+H8RG";
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

--Sig_/hA.YcA_c1NuAy1Btlx+H8RG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  2 Apr 2024 19:28:13 -0400
Zack Rusin <zack.rusin@broadcom.com> wrote:

> The table of primary plane formats wasn't sorted at all, leading to
> applications picking our least desirable formats by defaults.
>=20
> Sort the primary plane formats according to our order of preference.

This is good.

> Fixes IGT's kms_atomic plane-invalid-params which assumes that the
> preferred format is a 32bpp format.

That sounds strange, why would IGT depend on preferred format being
32bpp?

That must be an oversight. IGT cannot dictate the format that hardware
must prefer. XRGB8888 is strongly suggested to be supported in general,
but why also preferred?


Thanks,
pq


> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 36cc79bc9077 ("drm/vmwgfx: Add universal plane support")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.12+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.h
> index bf9931e3a728..bf24f2f0dcfc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -233,10 +233,10 @@ struct vmw_framebuffer_bo {
> =20
> =20
>  static const uint32_t __maybe_unused vmw_primary_plane_formats[] =3D {
> -	DRM_FORMAT_XRGB1555,
> -	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB1555,
>  };
> =20
>  static const uint32_t __maybe_unused vmw_cursor_plane_formats[] =3D {


--Sig_/hA.YcA_c1NuAy1Btlx+H8RG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYNCHYACgkQI1/ltBGq
qqcCOhAAqFtBj7+geV1SkcyGkPs5VJCwgfvQgDA/r26bGjben/EL1sP0ZmGNVhnq
B+laklYfFji+v9CR4DAYNGv6XOVur4Aji6ZV/WaJgeDNX+/8ZOp17FGy47c26AoG
d9rcINU+bMhmVxZKh9KZdRCS1HA8/cTH0ajeLIkXcIv3sCmjpzDe4gbae4XAKN7w
00P2jVuo+Und7Eai+aDAiB5YTTUUynkjqLkodQQZCjZBO0yfwKGnFMujwiMRuLqE
BYMlZQOM1aVawl4CQBxjG+MNUzpfKArFaZRp4AHae3qmQtC9AT1fsxb0hK5bAqGL
mr7qlxAj+S5vruyxRezuwxFuE4lQ1kmSPJAh+xUGE+YtgRACGfs0qrkVDOdLuRTY
n9458Fhdph69orV9K7cNGAK1+jN2D342Tx35uvs6f1lrqTLh9OTd1TvCaF8UbkuW
1x7VB/yINAL3/mv4M7NbJKlfOkCkukNRxXNwHJd/3muOAenDILZXWyMyYUQN+vru
1sQhZfIUjYoK3v3YfDdJ3Lq0m9NzMKrGNitAwR26GqLF+LhPrmiVT2PH+h7I412V
Ynz+pVV+eh2+EQ98vSJUJk43RzMQOLQbNOktvqYQXQJ2jzjtziwJeE5w8f0pokTM
ReagiASt2ZkmYOR2ttiqlv+UQHUtAkq8Ve7E4T2gOpCcQCyK5IU=
=0d+L
-----END PGP SIGNATURE-----

--Sig_/hA.YcA_c1NuAy1Btlx+H8RG--
