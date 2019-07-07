Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A456186B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 01:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9D6899E6;
	Sun,  7 Jul 2019 23:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5C899DC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 23:30:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45hlF41wvCz9sNk;
 Mon,  8 Jul 2019 09:30:32 +1000 (AEST)
Date: Mon, 8 Jul 2019 09:30:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190708093020.676f5b3f@canb.auug.org.au>
In-Reply-To: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562542234;
 bh=b3Cy3L6uJ1zllsblKuLVoOFBbe1oTg28owraNeOAFTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrXjpzMmuXVtUxH4xy+PPMxT/OcN8OknkLLRX0H+LcAZy1yOS5HQ0zCD4gMJPGwVz
 7LCjzhUowqxvuoFh6OoOf6ff6xadM+XO5FOGBpF2a3F3WPxydd/BedUBRqWhpw0zJJ
 8gyJT/VESyiyxAf+t63leV4ug1ZQbhk04vv6EcRtkV3tqGW8m8SthxBSGpuZ/qa9EE
 KMRFiSVV7oqjaQ6BltWMKbUtxKcFrpe1tRvRwbZdeURJFqz/4zMGrK1X0qprNq07yj
 szeLCMuESKjt8w0urx+SpnaLi40NLXtmCG+bYQlNGz+fQ/sJz8khOUINO2B0rh58te
 vOrJJGr9+SAHg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1915976656=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1915976656==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n1sGdhtFox.8qpMNicerEzu"; protocol="application/pgp-signature"

--Sig_/n1sGdhtFox.8qpMNicerEzu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jul 2019 17:09:16 -0400 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> On Wed, Jul 3, 2019 at 5:03 PM Kuehling, Felix <Felix.Kuehling@amd.com> w=
rote:
> >
> > On 2019-07-03 10:10 a.m., Jason Gunthorpe wrote: =20
> > > On Wed, Jul 03, 2019 at 01:55:08AM +0000, Kuehling, Felix wrote: =20
> > >> From: Philip Yang <Philip.Yang@amd.com>
> > >>
> > >> In order to pass mirror instead of mm to hmm_range_register, we need
> > >> pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirror
> > >> is part of amdgpu_mn structure, which is accessible from bo.
> > >>
> > >> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> > >> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> CC: Stephen Rothwell <sfr@canb.auug.org.au>
> > >> CC: Jason Gunthorpe <jgg@mellanox.com>
> > >> CC: Dave Airlie <airlied@linux.ie>
> > >> CC: Alex Deucher <alexander.deucher@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/Kconfig                          |  1 -
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
> > >>   8 files changed, 30 insertions(+), 11 deletions(-) =20
> > > This is too big to use as a conflict resolution, what you could do is
> > > apply the majority of the patch on top of your tree as-is (ie keep
> > > using the old hmm_range_register), then the conflict resolution for
> > > the updated AMD GPU tree can be a simple one line change:
> > >
> > >   -   hmm_range_register(range, mm, start,
> > >   +   hmm_range_register(range, mirror, start,
> > >                          start + ttm->num_pages * PAGE_SIZE, PAGE_SHI=
FT);
> > >
> > > Which is trivial for everone to deal with, and solves the problem. =20
> >
> > Good idea.

With the changes added to the amdgpu tree over the weekend, I will
apply the following merge fix patch to the hmm merge today:

From: Philip Yang <Philip.Yang@amd.com>
Sibject: drm/amdgpu: adopt to hmm_range_register API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
@@ -783,7 +783,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, st=
ruct page **pages)
 				0 : range->flags[HMM_PFN_WRITE];
 	range->pfn_flags_mask =3D 0;
 	range->pfns =3D pfns;
-	hmm_range_register(range, mm, start,
+	hmm_range_register(range, mirror, start,
 			   start + ttm->num_pages * PAGE_SIZE, PAGE_SHIFT);
=20
 retry:

And someone just needs to make sure Linus is aware of this needed merge fix.
--=20
Cheers,
Stephen Rothwell

--Sig_/n1sGdhtFox.8qpMNicerEzu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0igIwACgkQAVBC80lX
0GyMGwf9EHaqFsgZMnIUpi3rDZiJtUaKYpZhMRcEnEUKTBt9R7GcNMCmg+yWNWQm
ywXAzxy+94GmfnusEKWBCpCTTO9IyjctxH5P4i/myGwF867vEhGMXD2fg5ly85hr
oyQ60dHXBwNKwJlfoNfgC7XJ/sYSVrtngHZ+Up6SkAPlMccSJ+V4zQLi5qI8CjOz
Nqt8Eh+OHyjqZf9UdzFWAtHNO4rbIutkbdkh4YVD6V3USbcU2wJ1/8dmR8xIlvXL
BVWfIWkeX0lN+ASoK1Y3GL5RJB9ge5nRvmaRC5Tmq3dF9au7ihOveKfdqy+HdvWQ
cPEh8VGzNdBfQ1l0rDzj7y04IDNndg==
=yA1W
-----END PGP SIGNATURE-----

--Sig_/n1sGdhtFox.8qpMNicerEzu--

--===============1915976656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1915976656==--
