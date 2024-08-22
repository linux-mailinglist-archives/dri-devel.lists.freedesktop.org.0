Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9B95B357
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 13:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A98C10E855;
	Thu, 22 Aug 2024 11:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="bGGJMN5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED4310E855
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 11:00:27 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 5AE841C009C; Thu, 22 Aug 2024 13:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1724324425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DbN7xxKejcgonMeotHUK0SRxnMl5EyvNy1IsqTj1/es=;
 b=bGGJMN5+SGZzthtavwSMYsE86HTgzJnpwyZsyq+/sBhPAyLBVMRFjb5mGT7qoY9osjYx29
 iY65twuO4CGc0uw0zKxiPBitbzX+jzFfC+4s2J1p4ltyBYZmu2If7LE5b4qlFAJSOx5Ok7
 RJYFZGbAurXga17EzGNgRwdhDk2eGes=
Date: Thu, 22 Aug 2024 13:00:24 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tim Huang <Tim.Huang@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com,
 Zhigang.Luo@amd.com, Hawking.Zhang@amd.com, Yunxiang.Li@amd.com,
 victor.skvortsov@amd.com, victorchengchi.lu@amd.com,
 Vignesh.Chander@amd.com, surbhi.kakarya@amd.com,
 danijel.slivka@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 5.10 04/38] drm/amdgpu: fix uninitialized scalar
 variable warning
Message-ID: <ZscaSHwgW5fzy/Z+@duo.ucw.cz>
References: <20240801003643.3938534-1-sashal@kernel.org>
 <20240801003643.3938534-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="m3M4ZguZpdVcYcTu"
Content-Disposition: inline
In-Reply-To: <20240801003643.3938534-4-sashal@kernel.org>
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


--m3M4ZguZpdVcYcTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Tim Huang <Tim.Huang@amd.com>
>=20
> [ Upstream commit 9a5f15d2a29d06ce5bd50919da7221cda92afb69 ]
>=20
> Clear warning that uses uninitialized value fw_size.

This is queued for 5.15 and 6.10, but not 6.1, for example. Mistake?

Best regards,
								Pavel
							=09
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -404,6 +404,8 @@ static void amdgpu_virt_add_bad_page(struct amdgpu_de=
vice *adev,
>  	uint64_t retired_page;
>  	uint32_t bp_idx, bp_cnt;
> =20
> +	memset(&bp, 0, sizeof(bp));
> +
>  	if (bp_block_size) {
>  		bp_cnt =3D bp_block_size / sizeof(uint64_t);
>  		for (bp_idx =3D 0; bp_idx < bp_cnt; bp_idx++) {

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--m3M4ZguZpdVcYcTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZscaSAAKCRAw5/Bqldv6
8qmWAJ9K4ap3buYYXtSedluoaXWY+f/29QCgq2QwH5AqKX+fw4Vz68CQNy4tCfs=
=AenU
-----END PGP SIGNATURE-----

--m3M4ZguZpdVcYcTu--
