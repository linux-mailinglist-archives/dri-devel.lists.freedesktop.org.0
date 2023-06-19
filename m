Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CB7349AC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 03:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995B410E104;
	Mon, 19 Jun 2023 01:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8310E104
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 01:18:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QksMT5PTjz4x0B;
 Mon, 19 Jun 2023 11:17:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1687137478;
 bh=3GkgCEb+I0Mdl4Zdw8oQq3JXp496a5S+tCyi6fFcyEE=;
 h=Date:From:To:Cc:Subject:From;
 b=eOBZJ5LJIVq1z65Qm9w/Rq1cPme57oMCPkwhzfW5r0YQqJkBVbpzmWns4FSYJBUbh
 julOp30RTo4F5KjopvWwZ7YSeRhBgaX2QFdlimCTQY4TVJB5Nszc+F3ThHDSkR/EvL
 P1ZaxxEfxI+WkHOei2/vLT5iuwhGShhWcPba3oXoK+yumIqpfkwdmdD+xlGQz4octd
 wJpArpy0aIFlUuVq5u8JXRp1LYSo+3IoanEdhBORX51digpEFwSiNnbAH11z1RMO4K
 Hr84NMxnCn10zzuVlqakQDXMYFwXK4okzmwb48EDyAXV1p7VLCL+3mLUnjnMY7XqXv
 FeZ84TuQMxEgw==
Date: Mon, 19 Jun 2023 11:17:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20230619111756.452d0129@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sx=Nyc1AJ_H3UC9q_ot56pt";
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Sx=Nyc1AJ_H3UC9q_ot56pt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c

between commit:

  34e5a54327dc ("Revert "drm/amdgpu: remove TOPDOWN flags when allocating V=
RAM in large bar system"")

from Linus' tree and commit:

  7f6db89418f9 ("drm/amdgpu: dGPU mode placement support memory partition")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a70103ac0026,f76649e523a0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@@ -139,8 -149,8 +149,8 @@@ void amdgpu_bo_placement_from_domain(st
  		places[c].flags =3D 0;
 =20
  		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
- 			places[c].lpfn =3D visible_pfn;
+ 			places[c].lpfn =3D min_not_zero(places[c].lpfn, visible_pfn);
 -		else if (adev->gmc.real_vram_size !=3D adev->gmc.visible_vram_size)
 +		else
  			places[c].flags |=3D TTM_PL_FLAG_TOPDOWN;
 =20
  		if (flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)

--Sig_/Sx=Nyc1AJ_H3UC9q_ot56pt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSPrMQACgkQAVBC80lX
0GxaDQf/Yya5+wwBnWUhQ71mkV9FJuG0vgv44/j3JjsUyFWi9gEZhVmXL6aLBd3Q
kph+xmMNJbISAQ+NPv/euPSl8lP9M5UIG5h+6ELPOqe74r/QXlI8gzc9sLz7U7UG
r5PY2JCJhh2++EYIq+z+iYLtDzDUNQCEZcOoKuyUbFkx0u/REoRKHcWTOscZHbsD
nhkOoya3cDSkhuEdr00mg03IwC3rX135WSQ2Vc0sVLMXW2KiaSYijMP+iACUPtvz
9V+ax6kTJlHHKc7pmjl29pFRDXDeOQPgCbWUEC9gwsO0JnzrnVTZMpMxmc2y+UBt
eHCHopbw85Jm87YT8hpR2CO9JVB6Vw==
=JQkm
-----END PGP SIGNATURE-----

--Sig_/Sx=Nyc1AJ_H3UC9q_ot56pt--
