Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1074D0431
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E86E8B3;
	Tue,  8 Oct 2019 23:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 86554 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2019 23:33:24 UTC
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382E36E8B2;
 Tue,  8 Oct 2019 23:33:24 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46ntvJ56D9z9sPL;
 Wed,  9 Oct 2019 10:33:15 +1100 (AEDT)
Date: Wed, 9 Oct 2019 10:33:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20191009103315.2f51e079@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570577600;
 bh=fCLq555CwsBdqSzNieFbT3yrcFvZ41mOJHpYKXLuEEk=;
 h=Date:From:To:Cc:Subject:From;
 b=kNyrXxEEy+s6GUEsPHqrCt1SsWqkv2V8WnRI98eGaBKtXJLJdtrHpaijx4vD32OH+
 tBCU/BXR6DCnkCBzMejqLrvWOmYLU4CwjQRkUD47HJbkHyy3dZhbl8KDVu4EzqhPRg
 DuHvY1usvbNtiojl78qd0leCOnXgMWrtKRJFW54bXxSZQv6eUBQ4mltZxtk3LGUUA+
 XMk3ZxX4Ue0tvTlO5YuZIsUI0NidWXtu/FseB+igHF9CJ62nAdrIwAi5pqgZ1s/GXz
 /pJUkNodm3Qmuxdlt0sWAl629X/ghl5RNWXG2SvT4XcrfFRJIejyjxkw/all4oJH5r
 viVf/on8Sne+A==
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0329963900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0329963900==
Content-Type: multipart/signed; boundary="Sig_/17ltTepqDW3c3omnX4kN7Pe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/17ltTepqDW3c3omnX4kN7Pe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

between commit:

  8a9a982767b7 ("drm/i915: use a separate context for gpu relocs")

from the drm tree and commit:

  4ee92c7149da ("drm/mm: Convert drm_mm_node booleans to bitops")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e8ddc2320efa,493f07806b08..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@@ -908,8 -902,7 +908,8 @@@ static void reloc_cache_init(struct rel
  	cache->use_64bit_reloc =3D HAS_64BIT_RELOC(i915);
  	cache->has_fence =3D cache->gen < 4;
  	cache->needs_unfenced =3D INTEL_INFO(i915)->unfenced_needs_alignment;
- 	cache->node.allocated =3D false;
+ 	cache->node.flags =3D 0;
 +	cache->ce =3D NULL;
  	cache->rq =3D NULL;
  	cache->rq_size =3D 0;
  }

--Sig_/17ltTepqDW3c3omnX4kN7Pe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2dHLsACgkQAVBC80lX
0GyUDwf8DQY+OK3S0jTEKtPrN9FJni3BxWGnlJpZVm9VEKhrVjMKXG3jyvRf/td5
FkO8KaQA0Xp0wzpW3aa3fkX7upqcay0MUtW1UVbGmujGJm7puWf34caBRYVUv8uZ
KLANW8GNcfY7t+SiB4HGr0pKRXH3FI5dDCEIlvmpb18Lrvv8bubQIuWyarn43+Oh
0Ie/366XKJJhT/tZPCVgwk6UKEEHDXenh3KeAzNhf43/JTZA1NytPqovvLGsr7ls
2mikO2tfzWAs4jxXCcXday5JP3HF+OBOO18SrNuPMbZMwGT1XDSb32kqE1uzuMHu
NhKK/OIaUOBBsq4txKSGWdmc6qyjqQ==
=xhhf
-----END PGP SIGNATURE-----

--Sig_/17ltTepqDW3c3omnX4kN7Pe--

--===============0329963900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0329963900==--
