Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF262451D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 02:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29490891FA;
	Tue, 21 May 2019 00:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E23891FA;
 Tue, 21 May 2019 00:38:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457H1N1YFtz9s9T;
 Tue, 21 May 2019 10:38:15 +1000 (AEST)
Date: Tue, 21 May 2019 10:38:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20190521103815.21dcb0ba@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558399098;
 bh=IcmSxkyhyheY63x0Sqljy/UD2XTdhq+M+ULqA85IMVQ=;
 h=Date:From:To:Cc:Subject:From;
 b=X8iM6w02bCD//+TQlz+bmuk+7UeIDmbe3w2UuDhZ5Y8JSt7TeyY0//XXUslTIRL3L
 9drDsVuuGiTGR77pwrePkP7SoxX+Q8oVEjtZ0V6GxyZW34uULqMZ89fI50MsgBPPs8
 Dvop7iVlNMrIm776un8j9DCOovmC/FRwBfNVN6l64lDqBaBngM/+PSB75Oxw0oIQ6B
 bkgp48zpUOttwDnLRoo/fbl64bQZBz+IxQz22c9oL06wBW1AzbN27edFt+jsuRur6h
 NRVH+0lTtwTRTn0/f8d+G5iRzQ+GJLTXbx8C1ynJ+wgx55ueqdgHQVuRiC7jx55wLc
 T+8AJBQJzaXpQ==
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
Cc: xinhui pan <xinhui.pan@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0618853518=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0618853518==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F+2zI99WB3E_l/eAI8=GZdg"; protocol="application/pgp-signature"

--Sig_/F+2zI99WB3E_l/eAI8=GZdg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

between commit:

  56965ce261af ("drm/amdgpu: cancel late_init_work before gpu reset")

from the amdgpu tree and commit:

  1d721ed679db ("drm/amdgpu: Avoid HW reset if guilty job already signaled.=
")

from the drm-misc tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c9024f92e203,b9371ec5e04f..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@@ -3614,28 -3538,27 +3595,28 @@@ int amdgpu_device_gpu_recover(struct am
 =20
  	dev_info(adev->dev, "GPU reset begin!\n");
 =20
 +	cancel_delayed_work_sync(&adev->late_init_work);
+ 	hive =3D amdgpu_get_xgmi_hive(adev, false);
 =20
  	/*
- 	 * In case of XGMI hive disallow concurrent resets to be triggered
- 	 * by different nodes. No point also since the one node already executing
- 	 * reset will also reset all the other nodes in the hive.
+ 	 * Here we trylock to avoid chain of resets executing from
+ 	 * either trigger by jobs on different adevs in XGMI hive or jobs on
+ 	 * different schedulers for same device while this TO handler is running.
+ 	 * We always reset all schedulers for device and all devices for XGMI
+ 	 * hive so that should take care of them too.
  	 */
- 	hive =3D amdgpu_get_xgmi_hive(adev, 0);
- 	if (hive && adev->gmc.xgmi.num_physical_nodes > 1 &&
- 	    !mutex_trylock(&hive->reset_lock))
+=20
+ 	if (hive && !mutex_trylock(&hive->reset_lock)) {
+ 		DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already =
in progress",
+ 			 job->base.id, hive->hive_id);
  		return 0;
+ 	}
 =20
  	/* Start with adev pre asic reset first for soft reset check.*/
- 	amdgpu_device_lock_adev(adev);
- 	r =3D amdgpu_device_pre_asic_reset(adev,
- 					 job,
- 					 &need_full_reset);
- 	if (r) {
- 		/*TODO Should we stop ?*/
- 		DRM_ERROR("GPU pre asic reset failed with err, %d for drm dev, %s ",
- 			  r, adev->ddev->unique);
- 		adev->asic_reset_res =3D r;
+ 	if (!amdgpu_device_lock_adev(adev, !hive)) {
+ 		DRM_INFO("Bailing on TDR for s_job:%llx, as another already in progress=
",
+ 					 job->base.id);
+ 		return 0;
  	}
 =20
  	/* Build list of devices to reset */

--Sig_/F+2zI99WB3E_l/eAI8=GZdg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjSHcACgkQAVBC80lX
0Gwk+Af/bWXFQKn3v8vCeqqNO+4DfcXDlz579wmq2ctkdCwkYkmOnnfIKTrthi3Q
sKr2F+qc+132SCjhAQHPIuAE8zDFW9XasdKkdd36VJtrqaRitmWA8qvWkz8Riy5R
DHIAsy3W4evd19zi0X4Zbc8vPQewGdunLH1cvi9FOC1zr4/+nX+Zq5NV4LGfvZTf
ehr0AIxCxfAM3Dw9FYHtv0EdcFAF/m+LnKKLiZ5VJgS+XAM3/4q6swy/YMsHr0S5
yg+NgdmdjFvEqd+MZk68Fsb0LmIAMMS78ZRbMvVlRcG8ZaaGdDubaL4mHCp8hQV3
oWaF6GPjbv0+C0kDh6KDFYyzAPRHhQ==
=KYAk
-----END PGP SIGNATURE-----

--Sig_/F+2zI99WB3E_l/eAI8=GZdg--

--===============0618853518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0618853518==--
