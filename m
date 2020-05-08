Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C41CA24F
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 06:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FD6E1E0;
	Fri,  8 May 2020 04:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B2F6E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:35:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49JHYb2wD7z9sRf;
 Fri,  8 May 2020 14:34:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588912500;
 bh=tIayYZxVueV+PR3VYq1LmKUkTO9OK0vuZy2l55/pReI=;
 h=Date:From:To:Cc:Subject:From;
 b=NqxOz9zXfs6XrkfaBiIkkJUVvji+AJ3EWeOZGv3z1vo6D1eCEYYCLrk+ff/8A+r23
 Iu8/rYjHkmnjwZoZ4XcwFpDOctEqB1/rjwWz5iSDVIOF52IPHW9lL04jFH8LVlKbrz
 YgaNaHBEFd6yRzXr6REvd4MWvGphiFrkOaPWxqXEXalAdumPmvZUGSP1qJWO6Qish3
 3gllKYZ4g4Xuvaj5SGyUKk8mZS9zXXQ3DghSdDCNBBm/3m+xYfZCo66efJPphrdKHW
 n7ikEfghdPetED3khTChQtiEat5YRlLD/Tjlh0FrF51Rkufj5+Q7ozt0or/W0KAU6h
 RYZri5aiMgp/w==
Date: Fri, 8 May 2020 14:34:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Subject: linux-next: manual merge of the amdgpu tree with the pm tree
Message-ID: <20200508143457.14acfc46@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0092766076=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0092766076==
Content-Type: multipart/signed; boundary="Sig_/IC6dXXmr.J0j.0CdRqEFiwh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

between commit:

  e07515563d01 ("PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP")

from the pm tree and commit:

  500bd19a7e5d ("drm/amdgpu: only set DPM_FLAG_NEVER_SKIP for legacy ATPX B=
OCO")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index c201bc827389,4e4c9550dcf8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@@ -189,10 -188,12 +188,12 @@@ int amdgpu_driver_load_kms(struct drm_d
  		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
 =20
  	if (adev->runpm) {
- 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
+ 		/* only need to skip on ATPX */
+ 		if (amdgpu_device_supports_boco(dev) &&
+ 		    !amdgpu_is_atpx_hybrid())
 -			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
++			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
  		pm_runtime_use_autosuspend(dev->dev);
  		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
- 		pm_runtime_set_active(dev->dev);
  		pm_runtime_allow(dev->dev);
  		pm_runtime_mark_last_busy(dev->dev);
  		pm_runtime_put_autosuspend(dev->dev);

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl604XEACgkQAVBC80lX
0GxkRgf+P9we/5HxF6t1TApXGo0ooTk5FGWPYEpRZPAgF4BRJqOteGp+iQkDGUjL
sgEjUnz9EryYLCy1OXtLuf9eOQL/HuvJvL2V36g7VzO3CW+pUm9lMwGpjujm7DQZ
ZpjegyvDwQb0ouwV+5R8CKW2dSWDmiZ291FgTOmBy9G1bsn4XZPr9c9nlTZQW5si
Gyc5M78YgEaFh4F/5iR8BNJ8/Z52H9cQ3JkTE/sHYA1AJTUmbBGNOmzfbw6rRxQz
w1mbkRo38L8/ysrmipx8zdwjQwgm81JZKlvyy4CPJAcoETABeK1ki1usWAw0/eIz
pvFYwCB3XAFi2dt8oFf/JLnmHzeNMQ==
=U9dg
-----END PGP SIGNATURE-----

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh--

--===============0092766076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0092766076==--
