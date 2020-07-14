Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675B21E604
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 04:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC006E89B;
	Tue, 14 Jul 2020 02:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746416E89B;
 Tue, 14 Jul 2020 02:59:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5QGk17nqz9sRR;
 Tue, 14 Jul 2020 12:59:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1594695584;
 bh=JytnyXM7mLZ22ITo74iTEVgYm2GIE3T8PylBD0v5KgY=;
 h=Date:From:To:Cc:Subject:From;
 b=JdXSRbslO/Pgp5vOwnzDhf5U0D9sLTudJWxJLalueYDscSrqSNH2kz8JrhYO7Z/hN
 m5a0qEq5QdveiQxXgEDXWO+PxDBv9iUbeuTDdWhXYm89CeFQj58Eao4sCeiPgeznpD
 C/MS5eQzOcQpJzHPTVDycp16AkWBhE1KSOYeQl1CD+AdA5EMVRYCuciVvJSdZh/PL0
 7j7IuTHOxcO1bM8JbQGAHuc9Uch4iEZy0L8cTOkfVje/x03r8nDC231w9rtfEEoFcN
 m/fuySsulxwC36LDd/PiAs1b8h2nGPJ3zSC5GFox4o/vUuKP4afYI6oIs8MOfGwmtx
 dFBhm/kbFv1zQ==
Date: Tue, 14 Jul 2020 12:59:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20200714125941.2e95d167@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0084133494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0084133494==
Content-Type: multipart/signed; boundary="Sig_/TvsK9JqjR7N6ZoKB_AWExuI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TvsK9JqjR7N6ZoKB_AWExuI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/drm_probe_helper.c

between commit:

  12c683e12cd8 ("drm: bridge: Pass drm_display_info to drm_bridge_funcs .mo=
de_valid()")

from the drm tree and commit:

  1c26b8e09004 ("drm/probe_helper: Add drm_connector_helper_funcs.mode_vali=
d_ctx")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_probe_helper.c
index 09e872e61315,601a4f25bb47..000000000000
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@@ -114,10 -116,8 +116,10 @@@ drm_mode_validate_pipeline(struct drm_d
  		}
 =20
  		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
- 		ret =3D drm_bridge_chain_mode_valid(bridge,
- 						  &connector->display_info,
- 						  mode);
- 		if (ret !=3D MODE_OK) {
 -		*status =3D drm_bridge_chain_mode_valid(bridge, mode);
++		*status =3D drm_bridge_chain_mode_valid(bridge,
++						      &connector->display_info,
++						      mode);
+ 		if (*status !=3D MODE_OK) {
  			/* There is also no point in continuing for crtc check
  			 * here. */
  			continue;

--Sig_/TvsK9JqjR7N6ZoKB_AWExuI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NH50ACgkQAVBC80lX
0GzXtAf+PoX61dmQpbPg7isR1p+Aj2H9XJqtIJtg07sPx1L99h57SexFt7fDSwOf
lan4UNJQdY83y8IeWf5j1Jc4ra23HyiCTJFJvnoCXTSId5jpcYzeExKiAx3esXvu
K8JP8/sa27GUYQueZLnq/6UOfc8YBA2j93KubDqJcnX0gh+BxucYdo/eozlFobfz
NnDuLoLvnry6cGIsyEGiBBVrOwNKbXXahMw9awFfcJ7QPWQ+jBKXXpMmiuKvRTZc
jZAzuK2vk7VUjyIoZC1tCuFc5bcPiCv0H5vDFrPNsg57wzuTCaW2gawKnXE9rtD0
pKtW57wQ541NuMcbVQZgaTJEMowjmg==
=nBIt
-----END PGP SIGNATURE-----

--Sig_/TvsK9JqjR7N6ZoKB_AWExuI--

--===============0084133494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0084133494==--
