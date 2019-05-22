Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7952730B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 01:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB089CA4;
	Wed, 22 May 2019 23:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A02889CA4;
 Wed, 22 May 2019 23:54:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458TxP6JLxz9s55;
 Thu, 23 May 2019 09:54:01 +1000 (AEST)
Date: Thu, 23 May 2019 09:53:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel tree
Message-ID: <20190523095341.728a79b7@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558569243;
 bh=4Ie1TzLXQj8FI5hKG+wwp2NDJHkk7TzCx/TL7beKews=;
 h=Date:From:To:Cc:Subject:From;
 b=W45yq2L2Kflk4ySOTn67aogaWM+73l8VU19rLtVoJexA84dXjXZhLtzn3OnZL0Pu3
 BcUQOTd9k4xgaMtcOSj3wpDzEW1QnaH4zqw3/y0sWRkR8GYz8+iTfQgGHjL+czT2zR
 bfTdjRMMwhDOscBSX/mTir2fFQpGylg/xE0MrVGw4D1WSonE0cAtcIoTivsOoTbvmV
 qttFnoDDh0ql8AQAm6CfR057fVCX+Lq7psr45pF530RhndZ+apC2SwvkJAJdwR5qYg
 r/5vRg+HThw++3LGpYilhnHuL0VuPRpy0b246vLqdKmxVQvH5FcEBdW9PEeM4ZSIqD
 zt3+HPT1U5s3A==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Uma Shankar <uma.shankar@intel.com>
Content-Type: multipart/mixed; boundary="===============0571844776=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0571844776==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XP=lWq5qsA1xog0vpv4kTbS"; protocol="application/pgp-signature"

--Sig_/XP=lWq5qsA1xog0vpv4kTbS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_atomic_uapi.c

between commit:

  585b000de23b ("drm: move content protection property to mode_config")

from the drm-intel tree and commit:

  fbb5d0353c62 ("drm: Add HDR source metadata property")

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

diff --cc drivers/gpu/drm/drm_atomic_uapi.c
index 4131e669785a,125605ff45af..000000000000
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@@ -814,7 -823,10 +823,10 @@@ drm_atomic_connector_get_property(struc
  		*val =3D state->colorspace;
  	} else if (property =3D=3D connector->scaling_mode_property) {
  		*val =3D state->scaling_mode;
+ 	} else if (property =3D=3D config->hdr_output_metadata_property) {
+ 		*val =3D state->hdr_output_metadata ?
+ 			state->hdr_output_metadata->base.id : 0;
 -	} else if (property =3D=3D connector->content_protection_property) {
 +	} else if (property =3D=3D config->content_protection_property) {
  		*val =3D state->content_protection;
  	} else if (property =3D=3D config->writeback_fb_id_property) {
  		/* Writeback framebuffer is one-shot, write and forget */

--Sig_/XP=lWq5qsA1xog0vpv4kTbS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzl4QUACgkQAVBC80lX
0GxSWwf+MTWafkXTbuoTHRn6ceiKD4K1BQsTENaQOxEaubqh5y9mLJZFPSonoirH
a/7tG2u3KTKKMI4fqHLWvnyHVUn7piAf7IU+rTFYHc1Mrfj8wYJzc8CbrS0AbQ14
840CxOiUewJJtziqeL4KGIrkQXD7KmQYtc/CgYN1OImZc9L344VS919941yEz8ad
MEEBPraKYvn4eYAVBhNmRGJR2H8/DSoprmJ26bCC/usFBLOI+Ux8yjIie1AF+Ev9
AKxufmlfLF22L7tIXnPLbAm6xe2SpjerAYK8hCHAp1Uv5swqsXj1TxFuIa0Bo87w
PmCWifWI4YNoD2JqY57vP2pS9eEWFQ==
=bwN4
-----END PGP SIGNATURE-----

--Sig_/XP=lWq5qsA1xog0vpv4kTbS--

--===============0571844776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0571844776==--
