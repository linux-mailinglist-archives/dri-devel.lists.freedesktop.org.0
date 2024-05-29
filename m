Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F28D30F5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2470910E476;
	Wed, 29 May 2024 08:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnUGqoJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ECC10EF54;
 Wed, 29 May 2024 08:21:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16704CE02C3;
 Wed, 29 May 2024 08:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B943C2BD10;
 Wed, 29 May 2024 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716970907;
 bh=6BK6+4ZTYBHRXypx7xtkwUavViCKpZdvKxYGc7RKxGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnUGqoJRpH4TlPUymqlOoZaD5R2mVfBwT0MDS00Xof4mLDF0y+a6wX147kY8Iw0OP
 uH7JQZq3Yg9s2FBWS3Ug13oI94nM1LluDQbDlJxXol9chjHcoZDqY4CekxV4Ubp1+x
 mOWpcJ2VZfVJzC4T9q5mhEpW77j5gK2N10ZffPgUXKg/21GexN2p1LepTR3ciXhZ0l
 z2P7pRqJHAtbXRp5rCw1wC45mSUHmCwLpRiJzR6Jz4v8yR+YMCLquujeS0sxItVxWi
 JpiiW3spmVpkzQV5wfA+/qNuVYoWrpPfR3Unm6gDFOcoWbWmYyXfqz7fFQsdGdH743
 XLKQirTJCwCXg==
Date: Wed, 29 May 2024 10:21:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529-holistic-careful-jackrabbit-baaf5a@houat>
References: <20240529123531.324226b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2uj3c5rwxorjlbxh"
Content-Disposition: inline
In-Reply-To: <20240529123531.324226b4@canb.auug.org.au>
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


--2uj3c5rwxorjlbxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 29, 2024 at 12:35:31PM GMT, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector=
_mode_valid':
> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaratio=
n of function 'drm_connector_hdmi_compute_mode_clock'; did you mean 'drm_hd=
mi_compute_mode_clock'? [-Werror=3Dimplicit-function-declaration]
>   213 |                 drm_connector_hdmi_compute_mode_clock(mode, 8,
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 drm_hdmi_compute_mode_clock
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
>=20
> I have used the drm-misc tree from next-20240528 for today.

Thanks for the report. A fix is now merged into drm-misc-next
https://lore.kernel.org/dri-devel/20240528151056.2104153-1-mripard@kernel.o=
rg/

Maxime

--2uj3c5rwxorjlbxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlblmAAKCRAnX84Zoj2+
ds1UAX93OosObSLimqigmxVRb3xOAr040Zmgggq97UrYsYy8/uLiW1fvXF14BJ4X
muFdptoBgOiq3eiKYRsjDSDylPraRW9mL9qdfgUhPiKax4Nqu4Q1Ex3T+DjuHTKx
pfynwvtq/w==
=VNFU
-----END PGP SIGNATURE-----

--2uj3c5rwxorjlbxh--
