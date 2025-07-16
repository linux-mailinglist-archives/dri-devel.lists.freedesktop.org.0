Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43422B06C95
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 06:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0BD10E64F;
	Wed, 16 Jul 2025 04:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XQP/a4Jw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F94C10E38A;
 Wed, 16 Jul 2025 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752639400;
 bh=S7mK2SBkhQMa5+gvlYeddVua2aIHqvsHbgJZfEWR6dI=;
 h=Date:From:To:Cc:Subject:From;
 b=XQP/a4Jwa5OQi0scktFHKYXE2tJMQNklweWuH8Du+Mn1hontLRAF7k0JJ5mpYgi+W
 fUCHG94BkOfHJLUQovuma6vZsBtfJR2qtqls7raqWs/kStlrE+L7gnxxkQ4vyH6zSY
 Jrvw2BQ2uVZkk1eAhk6hUwtd6zIvsMHe6ukFOJin9eOab9xs0pH8k9a47pMvw2v/XF
 Rgc3LrkJlc4zrBMrjDboj0JzEPBSJCoy7XMGS5t4lLVaioqO/+1mo5wb3GPalV8a1K
 LLqe8947E9jewDbQtzlcEPrpELMNy+hrhMQ2Du6vrayOnH9kBbgQu+eH7DdSkj0uL8
 vl71nY7ePvItg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhjRq5CDqz4wbY;
 Wed, 16 Jul 2025 14:16:39 +1000 (AEST)
Date: Wed, 16 Jul 2025 14:18:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20250716141832.5542b414@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jvGgs7I7tXJ4eKmy4eV7tUi";
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

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/display/drm_dp_helper.c

between commit:

  d34d6feaf4a7 ("drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS =
to TRAINING_PATTERN_SET")

from the drm-intel-fixes tree and commit:

  b87ed522b364 ("drm/dp: Add an EDID quirk for the DPCD register access pro=
be")

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

diff --cc drivers/gpu/drm/display/drm_dp_helper.c
index ea78c6c8ca7a,1c3920297906..000000000000
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@@ -712,20 -741,8 +741,8 @@@ ssize_t drm_dp_dpcd_read(struct drm_dp_
  {
  	int ret;
 =20
- 	/*
- 	 * HP ZR24w corrupts the first DPCD access after entering power save
- 	 * mode. Eg. on a read, the entire buffer will be filled with the same
- 	 * byte. Do a throw away read to avoid corrupting anything we care
- 	 * about. Afterwards things will work correctly until the monitor
- 	 * gets woken up and subsequently re-enters power save mode.
- 	 *
- 	 * The user pressing any button on the monitor is enough to wake it
- 	 * up, so there is no particularly good place to do the workaround.
- 	 * We just have to do it before any DPCD access and hope that the
- 	 * monitor doesn't power down exactly after the throw away read.
- 	 */
- 	if (!aux->is_remote) {
+ 	if (dpcd_access_needs_probe(aux)) {
 -		ret =3D drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 +		ret =3D drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
  		if (ret < 0)
  			return ret;
  	}

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3KBgACgkQAVBC80lX
0GyZMQf/aZIurtBVrIzuWKnDL8tM/37HjkjT5m6LzYhQSfEq+SwMpu/aAYEYeEcg
BnS95XPcGd7eHZnM8xg2HJ8WFVJCI1k/RzW4CmQO1qt322b/zqMIVZA8hickQpQ+
RgRk829fRZV0iR9NgJzmXcCVE3J6i6OisGHjwJxcHdIdKX4bCrcSCPhiy/z3mHDk
FhCa+Sq2PvQDXABNMvsYjpttezXWzQz6w7p0ekI95ccmyQHU5cFg4pL5/ddtu2J1
xV1jJ+lpeYUxn8UD5GNYc2WX+uGR9J9vX3TJH7hoW+aHp0M3EqWCeDHU238V0KHC
0psWZSHBraB+kLdJfke193RM3Vb3vQ==
=2xqe
-----END PGP SIGNATURE-----

--Sig_/jvGgs7I7tXJ4eKmy4eV7tUi--
