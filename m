Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71A41A05
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 03:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A878891A4;
	Wed, 12 Jun 2019 01:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6F2890AF;
 Wed, 12 Jun 2019 01:46:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45NqTj2JQyz9s3l;
 Wed, 12 Jun 2019 11:46:16 +1000 (AEST)
Date: Wed, 12 Jun 2019 11:46:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20190612114615.69a78655@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1560303979;
 bh=45fFLXH707RuVC+r3D6MLgxoOcS6lkh37RpWxE6pCG0=;
 h=Date:From:To:Cc:Subject:From;
 b=B6QwwN/MyJhRc5MMmVS5hkIY9b39wOmRJadZWnU5zcqPPAPA4hHEloUCMAWYBViPQ
 jcZpSLvRzM3ER0McWYKxgj6wbQbhuUkr3v28xFMyVwIah3gPZap9nl3NoM9FyWWq5S
 QpTdngwyezRCRmX2vrkycFA6oa0ERop0npao5FLouZ+VhcZEuHaTjZVm23OuKjVzLO
 e5uIJQoJpVGJK0miUSdMuGf3iuu1zpHBUb6BOPMt8lF/V7tONYwYTGx1ImlU4TaHzp
 wd8vWYUvTVcKkGq3PeN5LhH8xwkPVt9nqE2EUQHEWDipuccgdkhPgQGaeWWgmvtE2T
 Lk+lojGVFEzVw==
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
Cc: Dave Airlie <airlied@linux.ie>, Charlene Liu <charlene.liu@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2063793286=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2063793286==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4P5AwUEph_+1clfAOt0GSyc"; protocol="application/pgp-signature"

--Sig_/4P5AwUEph_+1clfAOt0GSyc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c

between commit:

  c7c7192c56d2 ("drm/amd/display: add audio related regs")

from the amdgpu tree and commit:

  4fc4dca8320e ("drm/amd: drop use of drmp.h in os_types.h")

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

diff --cc drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
index d43d5d924c19,9b078a71de2e..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
@@@ -22,7 -22,9 +22,10 @@@
   * Authors: AMD
   *
   */
+=20
+ #include <linux/slab.h>
+=20
 +#include "../dc.h"
  #include "reg_helper.h"
  #include "dce_audio.h"
  #include "dce/dce_11_0_d.h"

--Sig_/4P5AwUEph_+1clfAOt0GSyc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0AWWgACgkQAVBC80lX
0GyInAf9EkndAclA4v6jGiJ3ikxT3HRWH+0v8pKJ0AH0Q2+KPoLfPRfVMdOWEAbb
2L6jAiiPL2a2RCFSnsFMbxP6Ki48DQiJM2lhw/VA54Y8Db1XGXmN+0pmGCE1dvbc
0Bksmtcn/Hek8uE7GmM4ZfTLW8vnca7aey+KqC8bFt3oYntotcA2wYq5k0b8zuXV
vFZzj12lS5+N+f41zoYVBLwaHKB7h9mdwcQlPFRAl5YTySnXXieR2TL4h3Vzs16E
vtohgcJWUqiJSkAFwahAyW43Zt18BdD3kmgZqSpv0JgkWxXhrcTbUvSnbSTiRUmX
YaxywF9MrIjMLwZzCG3GT1Knbeph/w==
=dUfW
-----END PGP SIGNATURE-----

--Sig_/4P5AwUEph_+1clfAOt0GSyc--

--===============2063793286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2063793286==--
