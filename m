Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1D466F02
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 02:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231DE6E02E;
	Fri,  3 Dec 2021 01:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC546E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 01:11:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J4vsh14kQz4xbC;
 Fri,  3 Dec 2021 12:11:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1638493881;
 bh=WNY7OQiMece9tZ8GrfuUHJSD+XmDM7erV1iQqdBnuOs=;
 h=Date:From:To:Cc:Subject:From;
 b=AJzM3RF4pR/VkBAufrEUi9wYTIgjes7/7AeJHUAuV66u9QUeu8DmBVGkxT20bqWeW
 HxANj714F6HXZuwIfwEAJ0Vur8+B1AJSZDlPRCVjiyUMLBg4VSsjArNGS2wpgkxPhm
 R4BDsS539fgrEYmV8eONSTBqb05dCi69DgsvCY9GT52/bdQuXFvqVX3/U/CwjGmb2e
 itZEOGunX/JahDvQhl3c9CmQz1KthKz4dOZmW/DyiHEitl2pDqw8joQtBLS5eIgzH4
 OmVUnqxisiY081k7vF+LbX121DUmEKMjNbP3NRNpTydd420TMrqQSlXVb4knpdg2J+
 mJMIpn/psNjLQ==
Date: Fri, 3 Dec 2021 12:11:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211203121119.25674209@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G4D4CT346Q9OVzb_.d.VqS_";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Flora Cui <flora.cui@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/G4D4CT346Q9OVzb_.d.VqS_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c: In function 'amdgpu_vkms_sw_fini':
drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c:521:34: error: 'struct amdgpu_vkms=
_output' has no member named 'vblank_hrtimer'
  521 |   if (adev->amdgpu_vkms_output[i].vblank_hrtimer.function)
      |                                  ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c:522:47: error: 'struct amdgpu_vkms=
_output' has no member named 'vblank_hrtimer'
  522 |    hrtimer_cancel(&adev->amdgpu_vkms_output[i].vblank_hrtimer);
      |                                               ^

Caused by commit

  deefd07eedb7 ("drm/amdgpu: fix vkms crtc settings")

interacting with commit

  3e467e478ed3 ("drm/amdgpu: cancel the correct hrtimer on exit")

from the drm-fixes tree.  The problem is that this latter patch also
appears in the amdgpu tree as a different commit and git resolves it
incorrectly in the presence of the former commit :-(

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 3 Dec 2021 12:06:57 +1100
Subject: [PATCH] fix up for "drm/amdgpu: cancel the correct hrtimer on exit"

interacting with "drm/amdgpu: fix vkms crtc settings"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vkms.c
index e07fc64b655e..6c62c45e3e3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -518,8 +518,8 @@ static int amdgpu_vkms_sw_fini(void *handle)
 	int i =3D 0;
=20
 	for (i =3D 0; i < adev->mode_info.num_crtc; i++)
-		if (adev->amdgpu_vkms_output[i].vblank_hrtimer.function)
-			hrtimer_cancel(&adev->amdgpu_vkms_output[i].vblank_hrtimer);
+		if (adev->mode_info.crtcs[i])
+			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
=20
 	kfree(adev->mode_info.bios_hardcoded_edid);
 	kfree(adev->amdgpu_vkms_output);
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/G4D4CT346Q9OVzb_.d.VqS_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGpbrcACgkQAVBC80lX
0GwxMAgAhOYipZixSAIcd4IjhkofawUXcJnKRimQeSwWi4sk10wq+9I+8S3FiEJL
DfIAw1FOedP5fk4Xa4dhvJ6Kv1UD2SxbZ23KJANhWdQ0czkGUZmCpNgLy9D9Mn+r
yJN5/ha8OPnQAUG/MasNrjVlvlfxttvQy03G70SCW6eOhE3ujsOTwv2jqfgg3GE2
HBKkpn8Kq4PEnp/jlgqfjydHWdWJttoHMZ6ki/ELLDdNkjg47cTj84t/NVyQryBC
ogx+ubiHEqbKY2Zu6t1R66wSGcPRmb3TqVXod0f9xWBYnMIP+T7ie07+JOrn5ZB1
IOeJbPDUy7kJoBvTFhjQE5zf8TFZ0A==
=6jYe
-----END PGP SIGNATURE-----

--Sig_/G4D4CT346Q9OVzb_.d.VqS_--
