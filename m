Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63862AFCE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 00:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283010E119;
	Tue, 15 Nov 2022 23:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B6810E0F9;
 Tue, 15 Nov 2022 23:57:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NBjlN0Qr6z4xDK;
 Wed, 16 Nov 2022 10:57:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668556624;
 bh=SOAAR+njNw3INBbf23L+zGH83Vm3xaTAHvnq1EaTm9w=;
 h=Date:From:To:Cc:Subject:From;
 b=dFFEw71ZV9IPGSSlK8bMIhrvK/8LswAo675y4s0xoj8Fgx2vEVg/d0zAqCpC+KfW2
 SLOHQqiTskERziUwvNS+PpxRYoYppcRNk7s7zCQdLXlGLAOFdewxgdp55TVhBhE3Qz
 VT5J23vwhNuwyuP8x40+oW+0ynF55YHlW+RfaXzWkaxQvJD92BaKfYBukng9UPXhoq
 0sMzimdjNKJ8cfp/YkiOBb/VuWMQkWtvuWaxHuhSHstoeRrj1dSFOLt4W5nWDVsxE3
 Ux6+Nt1yS+MBCNbkGojfL/lNzl6bjNsuXC34B5gCthzbb+WtWtQXQy9E7FP8cdwdos
 oaVfNwb6KKVFw==
Date: Wed, 16 Nov 2022 10:57:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20221116105702.746ce3cf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P12Sa_2We=6e8ciHH2y4_Od";
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
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P12Sa_2We=6e8ciHH2y4_Od
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_hdmi.c

between commit:

  682f99b8ae88 ("drm/vc4: hdmi: Take our lock to reset the link")

from the origin tree and commits:

  d218750805a3 ("drm/vc4: hdmi: Pass vc4_hdmi to vc4_hdmi_supports_scrambli=
ng()")
  0a99962c0dbf ("drm/vc4: hdmi: Fix pointer dereference before check")

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

diff --cc drivers/gpu/drm/vc4/vc4_hdmi.c
index d7fcc7a4c082,6b223a5fcf6f..000000000000
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@@ -349,12 -348,9 +348,13 @@@ static int vc4_hdmi_reset_link(struct d
  	if (!crtc_state->active)
  		return 0;
 =20
 +	mutex_lock(&vc4_hdmi->mutex);
 +
- 	if (!vc4_hdmi_supports_scrambling(encoder)) {
+ 	vc4_hdmi =3D connector_to_vc4_hdmi(connector);
 -	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
++	if (!vc4_hdmi_supports_scrambling(vc4_hdmi)) {
 +		mutex_unlock(&vc4_hdmi->mutex);
  		return 0;
 +	}
 =20
  	scrambling_needed =3D vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_ad=
justed_mode,
  							   vc4_hdmi->output_bpc,

--Sig_/P12Sa_2We=6e8ciHH2y4_Od
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN0J04ACgkQAVBC80lX
0GwRaQf/Q8h2ktVV7CYeiKNBoJU9zX+j/yv9PTNMbMzO8mTbb4ahk9s3SYINU4LC
6hkdaOsDeAaGtPCETYDJEirGMh12PRtgUIKAyHcm4MJSazMQnJo8MaO3ZpONw452
P7twC11nUDolbgOkYOU35YHvkD1b11l1XFWj3OR8rndF74AKv6uMpt4Dr6L96NhC
3037MLMBoKgn4H9SCTY7MkGbEtQ74v/oRIPMjcN3p1a6sqbJusq/gAH4W6Hl+JqJ
CalnbdgwPCVt7PnvPq9lcfZoSyK6J2hF5BP9keO1KdsaQ7y+Bzv0Pgfcmdhg/Q4e
GrammVlfft+eJo1asqQEfpl0K4MGXA==
=2tJB
-----END PGP SIGNATURE-----

--Sig_/P12Sa_2We=6e8ciHH2y4_Od--
