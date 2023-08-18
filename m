Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7C780389
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 03:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06DE10E2EF;
	Fri, 18 Aug 2023 01:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3F10E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 01:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1692323607;
 bh=3f0zBTiA//5gGXx/qQ6dBzFcQCrtR5703PUhKpUb/WU=;
 h=Date:From:To:Cc:Subject:From;
 b=SxlucnBtkFrel1BIAzdK0fUNyASUo5Ha22yxge1VUmeUCo8NJumyGzsyVtmeHkrj2
 wi4cQ85qT3Tu+m8Iw1zCJNfIwStzSE05R7O/vI0BKoP28f4YZdcPFLROqb2tW402r7
 mu7NIJZ28TeKrRwf5U1uM8REOL58/Y0R8v6e5O9mKKqV+NH5JBZRFsAM3agqzwxTJQ
 Xy73WB870HiQMFs7rie7KHJN/BsILjRxKvco/DnIi/yE+hjfux42wVPI8Lrt0g1vIa
 ZoOWuC0lE3X5jNwE+wlXnIE7eN0bqbf6EYplcVF9VvPrzzf3+m9nexcsEK3XlnybG2
 /oOTcfZ9z/hlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRlJk2yrkz4wxR;
 Fri, 18 Aug 2023 11:53:26 +1000 (AEST)
Date: Fri, 18 Aug 2023 11:53:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20230818115325.3ea01fcd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tnlWL.mShAsRT1uVsLdIvzg";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tnlWL.mShAsRT1uVsLdIvzg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c

between commits:

  61319b8e3b58 ("drm/amd/pm: disable the SMU13 OD feature support temporari=
ly")
  b6360a5ec31d ("drm/amd/pm: disallow the fan setting if there is no fan on=
 smu 13.0.0")

from the drm-fixes tree and commit:

  510d242f498a ("drm/amd/pm: disable the SMU13 OD feature support temporari=
ly")

from the drm tree.

The git automatic resolution got this wrong by adding an extra "#if 0"
above the duplicated "PPTable_t *pptable =3D smu->smu_table.driver_pptable;"
from b6360a5ec31d.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 0fb6be11a0cc,fddcd834bcec..000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@@ -331,9 -331,8 +331,8 @@@ static int smu_v13_0_0_check_powerplay_
  	struct smu_13_0_0_powerplay_table *powerplay_table =3D
  		table_context->power_play_table;
  	struct smu_baco_context *smu_baco =3D &smu->smu_baco;
 -#if 0
  	PPTable_t *pptable =3D smu->smu_table.driver_pptable;
 +#if 0
- 	PPTable_t *pptable =3D smu->smu_table.driver_pptable;
  	const OverDriveLimits_t * const overdrive_upperlimits =3D
  				&pptable->SkuTable.OverDriveLimitsBasicMax;
  	const OverDriveLimits_t * const overdrive_lowerlimits =3D

--Sig_/tnlWL.mShAsRT1uVsLdIvzg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTezxUACgkQAVBC80lX
0GzF/Af+Nt+9/9xhWuwJKrEtj3ryaT8z7KoZO34segjVj9XIcw91BOZDIGzviAH1
D8havbc3mEcHQLpWl87rC2eB2vtLPIFTLUx8niVoMpZ/dapMIxuVd7+x85++Eyjn
LtBARv0ND4fzGEmGHkCYwcG5yN/T2nMppTpncW698uPggJDH6gb8FFOzV4PEC3XM
VTL5N/taf1quCOclg90d0DuborZqt1M3OUQi7VuVMLCIoKOv12P/vyCUpZusi0Rk
hMsDT2Lm77vnrbGMTStvuyFVTVWIaPXrZmxJ6qkOe40EV2NLpyK/MuzK8vEapy9Z
/yp8e9Hr6JKx5z0V9+miEgahSJ8XDg==
=+TFw
-----END PGP SIGNATURE-----

--Sig_/tnlWL.mShAsRT1uVsLdIvzg--
