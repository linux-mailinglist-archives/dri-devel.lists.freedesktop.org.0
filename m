Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8226A8266D7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 01:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2610E02F;
	Mon,  8 Jan 2024 00:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8328710E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1704672894;
 bh=037L4Bx9N+1mGd2j8MWjXO0307K1Ky4m2b0KGWg3Ki4=;
 h=Date:From:To:Cc:Subject:From;
 b=OmsTBqF3bIjUT99Rllsfo2snosICcCsQ6sj3p+4AS6+xGUpGG/ohO7cdEGBazQH4j
 FVKehnO4OEMo16FBlVhbk0wPr1f+q2A7m8n9OpvMjogj3TlxsdHLJKEaUxUdmAJVy2
 PfgBUNuCfK75gF0gHCvURQ6NHAyn5nEJR9UmZli4xketp9bqujkP1NCfTE41MrxtkT
 UEt7BOh7Mko8Sp7XXFpZXFj9JsQOq9E3UPHcMfXeoTp3h/4JVGq+C2betAPic7uFf0
 w/HwVbC7qYNOmgZy3cZpOtpCN+Y/X3kVJxOd9WxuY0KM7aZ2S6asWbx/4JVOSTxMX7
 HE8tSVNuKMaOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T7ZM10SZmz4wdB;
 Mon,  8 Jan 2024 11:14:53 +1100 (AEDT)
Date: Mon, 8 Jan 2024 11:14:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240108111451.67c34a93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d75n8xzFTcdrovT1=A9bA_h";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Wade Wang <wade.wang@hp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/d75n8xzFTcdrovT1=A9bA_h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  9cdef4f72037 ("drm/amd/display: pbn_div need be updated for hotplug event=
")

from Linus' tree and commit:

  191dc43935d1 ("drm/dp_mst: Store the MST PBN divider value in fixed point=
 format")

from the drm tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 73dd4bc870dc,54861136dafd..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -6916,7 -7007,8 +7009,7 @@@ static int dm_encoder_helper_atomic_che
  	if (IS_ERR(mst_state))
  		return PTR_ERR(mst_state);
 =20
- 	mst_state->pbn_div =3D dm_mst_get_pbn_divider(aconnector->mst_root->dc_l=
ink);
 -	if (!mst_state->pbn_div.full)
 -		mst_state->pbn_div.full =3D dfixed_const(dm_mst_get_pbn_divider(aconnec=
tor->mst_root->dc_link));
++	mst_state->pbn_div.full =3D dfixed_const(dm_mst_get_pbn_divider(aconnect=
or->mst_root->dc_link));
 =20
  	if (!state->duplicated) {
  		int max_bpc =3D conn_state->max_requested_bpc;

--Sig_/d75n8xzFTcdrovT1=A9bA_h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWbPnsACgkQAVBC80lX
0GyFVgf8DNuxxfYi5lerGxqQLb82OBymXJLZcvRwzmabkrIqRBrtIkkxVg+mz09z
s2+FF+0V87HFR3iO0E71WZr2oHZ/1nhQQNT6H5BKp7AcVj3n/xHcSkUlzvp8MfCs
mthwSP+dobQJMgr9Co9dwHnA+gCXh8vAMXZ+A/5pH3kj6J5AGJmDRmZXrn6SVLK8
dLRFykwOrE3DkaDtN11pRdVOhrl7+YvPc1+y/nzRQok+aWwwmxmNG1wCEX6Bp22p
zxP/tft4zJaJw+CAD/hQQk//GDcEuMKAuixCMp376V1agqYHPmnOBhQgFJ0K+Cpc
5u/A/WEXlwokNx0Nrfa9mX1bxR+rfg==
=F69V
-----END PGP SIGNATURE-----

--Sig_/d75n8xzFTcdrovT1=A9bA_h--
