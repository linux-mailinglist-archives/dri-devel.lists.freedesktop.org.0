Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758137D4454
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152FC10E07D;
	Tue, 24 Oct 2023 00:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81310E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1698108729;
 bh=pRZQGTQLgHsC5cvz7MkAgtW1cWzxBXH0WEqq3b3tmtA=;
 h=Date:From:To:Cc:Subject:From;
 b=fCY2f+5xM6nW/2gZ5/mvBnNmICJ3SSKMTtujVhzaxnd1571LiCyVvzkeMH9IakXQn
 mrFdndvt7LeqzoRICPNLz45j5djwu60/9w3cU/hcTtdIO6nLc9Kj7rj8dYHC/Yuuwv
 aCHNkiEPAenxk+kCM09ym1QLAJwES85Ig0HH8IQyTSrzVaNfiCDs2dalEVFsgPGRni
 TbqPt0VxDLUWnx5uZUrggnMSjzzLKIri76hVzXFWzZuzkOWpI6SKUTgWna9AHY7oZY
 dRjiwUvsEstZtndR8OHTLCLtt7fk4bA/GzIGOt8a38jONyHu1Rjjc0O12lN/KJ0mei
 zjUkhpq9b5zfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SDtn42cbGz4wnv;
 Tue, 24 Oct 2023 11:52:08 +1100 (AEDT)
Date: Tue, 24 Oct 2023 11:52:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: manual merge of the drm tree with the mm-stable tree
Message-ID: <20231024115206.4ce24d96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6gZg8B3hDt_KoJXk83GE/s";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/E6gZg8B3hDt_KoJXk83GE/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/msm/msm_drv.c

between commit:

  cd61a76c210a ("drm/msm: dynamically allocate the drm-msm_gem shrinker")

from the mm-stable tree and commit:

  506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")

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

diff --cc drivers/gpu/drm/msm/msm_drv.c
index 7f20249d6071,443bbc3ed750..000000000000
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@@ -457,23 -265,12 +265,14 @@@ static int msm_drm_init(struct device *
  	if (ret)
  		goto err_deinit_vram;
 =20
- 	/* the fw fb could be anywhere in memory */
- 	ret =3D drm_aperture_remove_framebuffers(drv);
- 	if (ret)
- 		goto err_msm_uninit;
-=20
 -	msm_gem_shrinker_init(ddev);
 +	ret =3D msm_gem_shrinker_init(ddev);
 +	if (ret)
 +		goto err_msm_uninit;
 =20
  	if (priv->kms_init) {
- 		ret =3D priv->kms_init(ddev);
- 		if (ret) {
- 			DRM_DEV_ERROR(dev, "failed to load kms\n");
- 			priv->kms =3D NULL;
+ 		ret =3D msm_drm_kms_init(dev, drv);
+ 		if (ret)
  			goto err_msm_uninit;
- 		}
- 		kms =3D priv->kms;
  	} else {
  		/* valid only for the dummy headless case, where of_node=3DNULL */
  		WARN_ON(dev->of_node);

--Sig_/E6gZg8B3hDt_KoJXk83GE/s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmU3FTYACgkQAVBC80lX
0Gwj/Qf+Nnq6P1WtH2q7Cgnqn4r9QcG4VJV0wqdU8SslgQlNtGCpqdLXSn/BN6sC
T8I2K3A8+dT1EPULcqZwWOQrnHjgaoQw0nCtACbGFJ2EYssxUHp7rxMPJwV7iVdM
KRaPMvSySfoYxvoBDPUPzfshIwjJUpgi7xUo7cjU9+sllJuP/dwk15fBdiK9zwTr
qQKYZr2HxxoAVu4BKX/ZeXvcdVxKqg0Iwl6CxamfEpuyAUM83jrDv6PCn0HQJSRF
I/YeHP2HIcBRZKptGWolRML2xjhEsNb4wGDsZvc4G5Jk3al4u/OyE7EW7fhEhnS+
qCHvJIcKuWiGMVzsafQ5iVq2aYDlJw==
=wpW6
-----END PGP SIGNATURE-----

--Sig_/E6gZg8B3hDt_KoJXk83GE/s--
