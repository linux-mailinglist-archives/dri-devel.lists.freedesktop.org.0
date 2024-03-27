Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6388E27B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 14:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA4810EE6E;
	Wed, 27 Mar 2024 13:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p4cYrqgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F197210EE6E;
 Wed, 27 Mar 2024 13:27:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 632E7CE1DB4;
 Wed, 27 Mar 2024 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527BDC433C7;
 Wed, 27 Mar 2024 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711546051;
 bh=+fnPEP5LofR/YkwTOOjws1iuVa2ieMZ1vJLvtYNQ7OQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4cYrqgkZ5yR7qOyVmXAK6DNicMANTj9MoO3Ly2aMyd9olFbTRqMM410U7a1HbqBF
 BBGyKztQYn+jgZ0gMdHhmWE/CQLavoPNnnA77UiTkS+Jingwh7g5AVE4tP4G4e+WFy
 azkgCGC3Mk8wbHHnbmmKObNlVP5pDWzqdhqh+HAXPE8o+1l+Hlu8tswxiaVM1Ul+v3
 UZIRARydgHnI7ECFVslwev4AIl3+vH0o85jzBa4zAD8XNfd936b14q//9bEplTNQEs
 DOK3S7d/FoKpW3V3bjlb0IdnyLScR5VwaGAJ1kq+XFnDpPAL50yEJQi08FswygCuFA
 RH7g1qmxJ7Dxw==
Date: Wed, 27 Mar 2024 14:27:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alex Constantino <dreaming.about.electric.sheep@gmail.com>, 
 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, 
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi, tzimmermann@suse.de, 
 virtualization@lists.linux-foundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/qxl: fixes qxl_fence_wait
Message-ID: <20240327-cuddly-smooth-trogon-59c02d@houat>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
 <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
 <20240308010851.17104-2-dreaming.about.electric.sheep@gmail.com>
 <db4c8e74-5c79-49be-9781-a5d8669eccc1@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="odhn7ryspel32gtq"
Content-Disposition: inline
In-Reply-To: <db4c8e74-5c79-49be-9781-a5d8669eccc1@leemhuis.info>
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


--odhn7ryspel32gtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 20, 2024 at 04:25:48PM +0100, Linux regression tracking (Thorst=
en Leemhuis) wrote:
> On 08.03.24 02:08, Alex Constantino wrote:
> > Fix OOM scenario by doing multiple notifications to the OOM handler thr=
ough
> > a busy wait logic.
> > Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") w=
ould
> > result in a '[TTM] Buffer eviction failed' exception whenever it reache=
d a
> > timeout.
> >=20
> > Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
> > Link: https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e=
402b9af@leemhuis.info
> > Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
> > Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1054514
> > Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.co=
m>
> > ---
> >  drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> Hey Dave and Gerd as well as Thomas, Maarten and Maxime (the latter two
> I just added to the CC), it seems to me this regression fix did not
> maybe any progress since it was posted. Did I miss something, is it just
> "we are busy with the merge window", or is there some other a reason?
> Just wondering, I just saw someone on a Fedora IRC channel complaining
> about the regression, that's why I'm asking. Would be really good to
> finally get this resolved...

I've ping'd Gerd last week about it, but he couldn't remember the
details of why that patch was warranted in the first place.

If it works, I'd prefer to revert the original patch that we know used
to work instead of coming up with some less proven logic, which seems to
be quite different to what it used to be.

Alex, could you try reverting 5a838e5d5825c85556011478abde708251cc0776
and letting us know the result?

Thanks!
Maxime

--odhn7ryspel32gtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgQeuAAKCRAnX84Zoj2+
dtzBAX9D2qc3cRTI5gt0TJbZn+B1KZluieFl8m0F3A4+AMDS3Evkhqnpw13peeHP
19X3+xUBgN+7f0zhgWoJGzvnglkgra50VOoD9JZHUkmxpgZHXMavpspIDYDdwpKe
xEgQ8lSVDQ==
=4Ivy
-----END PGP SIGNATURE-----

--odhn7ryspel32gtq--
