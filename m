Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1E997E86
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 09:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119010E87C;
	Thu, 10 Oct 2024 07:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a5nw1TDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019AB10E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 07:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65CE45C5D56;
 Thu, 10 Oct 2024 07:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE9BC4CEC6;
 Thu, 10 Oct 2024 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728545512;
 bh=fvdulN+HSluMHSv5RoD5Y2kJk9jbQpd12fEmlWe+beA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a5nw1TDBar5Kfat7PRy1RkM9mNm+nkxhMLjzJiqBAzgXIWh4PPMj1+nTZf5VzBlQw
 Jmz8B0SVIi/T4J/x7FXra+C/qTfjo9iPIlWPwY0gPnRjWt75nuh15uH7PA/sklfvjC
 Nxi1+gVp3407yms/TXS6wj/ZJcYWF4vBMRBHfqrMCVlppOWL0dMi0M9gRKosJGf/gw
 KcIEfKtr5TYhxIsqvecmvwJVbprRmnfFzGO2siCIk0UbwvsiDGzu77Ga4lmFpKTBcL
 aV6j0yLlMUtfBPGmgy68fPWj8jyQY0mwWBtMxVTSUOqDbNGjs14HdUXRUxncCd2qVb
 GOCqUVcuAmBWw==
Date: Thu, 10 Oct 2024 09:31:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Zichen Xie <zichenxie0106@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, Zijie Zhao <zzjas98@gmail.com>, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: Re: Question about possible NULL Pointer Dereference in
 hx83102_get_modes()
Message-ID: <20241010-striped-tamarin-of-brotherhood-482d0e@houat>
References: <CANdh5G6d823W0-LxWqWE8RnXc8iX97aHUEd2ZFL-=7++UpY04w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tma2kl2nhj4rzmsz"
Content-Disposition: inline
In-Reply-To: <CANdh5G6d823W0-LxWqWE8RnXc8iX97aHUEd2ZFL-=7++UpY04w@mail.gmail.com>
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


--tma2kl2nhj4rzmsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 09, 2024 at 02:38:22PM GMT, Zichen Xie wrote:
> Dear Developers for DRM PANEL DRIVERS,
>=20
> We are developing a static analyzer for Linux Kernel, and we are
> curious about the function drm_mode_duplicate() in
> hx83102_get_modes().
> https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/panel/p=
anel-himax-hx83102.c#L567
>=20
> ```
>=20
> struct drm_display_mode *mode;
>=20
> mode =3D drm_mode_duplicate(connector->dev, m);
>=20
> mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>=20
> ```
>=20
> drm_mode_duplicate() will return NULL if it fails to allocate memory,
> so NULL check is necessary for this function.
> Directly accessing 'mode->type' may lead to NULL Pointer Dereference.

Yes and no. drm_mode_create uses kzalloc to create the new mode
structure, and any kmalloc (GFP, really) allocations below 8 pages
cannot fail.

So, from an API standpoint, you're right. From a practical one, it won't
change anything.

Maxime

--tma2kl2nhj4rzmsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZweC4AAKCRAnX84Zoj2+
dqBxAX9Y/tcYtfCrMTjMj5gYMiQ/2tUW0pfAJzRqh7gA9+MrC9kPlmVodgyccHqH
twJT8DYBfizjQVHdz+xs8rbMsi2A8VNsYTR5Mkpuo0WVd9CdLaootbenX7y5VARt
ek/D5TaWAg==
=gcqn
-----END PGP SIGNATURE-----

--tma2kl2nhj4rzmsz--
