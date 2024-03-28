Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A1F8902E0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3910F369;
	Thu, 28 Mar 2024 15:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qTiIO0Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF57310F369;
 Thu, 28 Mar 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711639229;
 bh=5Xaxy/AFj7BsBxQjcw6JFkf4riFKNt7BsRomirQ/Jqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qTiIO0HyIneMSPtetjarqDXvUFv975k6KGbIBkqo8O+DTneEk/tc7mxIppJzVoAY8
 nMloXKUK5cdDyub9AGXpHHSICNqN+w7kysfyqI+gp6SAqfX41xB+eIQk+hThRDrMCW
 6J6FnkogEWQC9ATq88D2boOv4S/2Apg74FdoPWEMKDq4WEhV/LGN1zrRQk+8+Gi8p9
 MC5cX9VOa4P2TzYqyGvKZkzAxrvAWMUCmCy+1uJXYQEfwlx6nTxUu5h6yMaQ7ijTog
 pjJBHnNEwqwpN9hXGVPS+LOpvRkaGReyTB5oGgDA/L4jiMBVCACu0bI/HI22VXsMke
 z87zLHMCEIfOg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A547E3780C39;
 Thu, 28 Mar 2024 15:20:28 +0000 (UTC)
Date: Thu, 28 Mar 2024 17:20:27 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: <sunpeng.li@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, "Sean Paul" <sean@poorly.run>, Simon Ser
 <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, "Sebastian Wick"
 <sebastian.wick@redhat.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Move PRIMARY plane zpos higher
Message-ID: <20240328172027.46d0c4ae.pekka.paalanen@collabora.com>
In-Reply-To: <20240315170959.165505-3-sunpeng.li@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240315170959.165505-3-sunpeng.li@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rj2ooB6ahdetqGvxcKDNYFm";
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

--Sig_/Rj2ooB6ahdetqGvxcKDNYFm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Mar 2024 13:09:58 -0400
<sunpeng.li@amd.com> wrote:

> From: Leo Li <sunpeng.li@amd.com>
>=20
> [Why]
>=20
> Compositors have different ways of assigning surfaces to DRM planes for
> render offloading. It may decide between various strategies: overlay,
> underlay, or a mix of both
>=20
> One way for compositors to implement the underlay strategy is to assign
> a higher zpos to the DRM_PRIMARY plane than the DRM_OVERLAY planes,
> effectively turning the DRM_OVERLAY plane into an underlay plane.
>=20
> Today, amdgpu attaches an immutable zpos of 0 to the DRM_PRIMARY plane.
> This however, is an arbitrary restriction. DCN pipes are general
> purpose, and can be arranged in any z-order. To support compositors
> using this allocation scheme, we can set a non-zero immutable zpos for
> the PRIMARY, allowing the placement of OVERLAYS (mutable zpos range
> 0-254) beneath the PRIMARY.
>=20
> [How]
>=20
> Assign a zpos =3D #no of OVERLAY planes to the PRIMARY plane. Then, clean
> up any assumptions in the driver of PRIMARY plane having the lowest
> zpos.

This sounds good to me too. I suppose that means

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

for both patches. Or at least for their intentions. :-)


Thanks,
pq

> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 96 ++++++++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 17 +++-
>  2 files changed, 104 insertions(+), 9 deletions(-)

--Sig_/Rj2ooB6ahdetqGvxcKDNYFm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFirsACgkQI1/ltBGq
qqdxwRAAqCgdUxtUmFYDquNnfW+PEIli+07SPtCteKbwirDOYx/3+SF4QOetX7KG
aIMpkIhcI+Z2ATgEnv3eW5zfUCVKJMtSkKFsfh4EsIRwsAAtQuy277SDeX9TNK83
aleRWUJX5iECxg+V/Fle//fxNfOaKh1cNEpSs73mh3OWgeQEq9R8r4Ednb2Szgoj
vGrAseQ92NL6YHf12Y5I7WQTC+G5MuWlwo8PSNyfQbwGHW5vn1lZ6dCtL+tAdR+H
/3nyySmC1zDxoLw47nBW014ekA4dQUOwGT2Xn7uQpsSdTUGBm7stdrI1ubHcu8NE
Z/j1nPI+Z8FRD4sOhevWB5trR/Mli68YdzM9G5l/965v9UebXiesYtsMZxjI4Ijc
kBahWcyl7QZ+e2sRQPXiIbIWtFtI6wNLslgIDHytnj+c0GMgiRNBvum1wGGx7LeL
SpED4okPv3iM6P95OmsfnyAYf6XWlen5UgPpHQ8elr/cI+gj7E6LvR3mqErsKo3r
7fuU83JjouGGHY7xNhzpqahaiO4gMRvzv0wCUIXWme76/xphcbjD3ywPCOcldQeE
SZpjUjBVT056MQivf7wcItYf1O/Lp1u9NP73g4Avj9l81UI4FasX86jylBPmQl3+
PvQr4SbVappnUsFVW7isVAAzscw1e5VtgLBj4ex80z4qxGvFYto=
=63RC
-----END PGP SIGNATURE-----

--Sig_/Rj2ooB6ahdetqGvxcKDNYFm--
