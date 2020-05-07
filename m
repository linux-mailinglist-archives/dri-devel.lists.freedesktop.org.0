Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA81C8018
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 04:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963F6E906;
	Thu,  7 May 2020 02:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB16E906;
 Thu,  7 May 2020 02:43:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Hd791Vtpz9sRf;
 Thu,  7 May 2020 12:43:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588819400;
 bh=3cql5VsIEDZ9sh1yQV7laVUfWk6ZJHdw0wTQwojE088=;
 h=Date:From:To:Cc:Subject:From;
 b=Ki7DJEmwamfoa/Ep0E/cK9nhK9D+Li1kKZb9dkJznsy8NWu6H9KYFbBHbBAscTqS1
 QhtByVVNwwVFkv6+zjC7VqiCAKShxF2z5lNTEB3/JlD1mCGsuNXmC57q1HVDTMDsHJ
 5VYnwSHdRH/o/BbwpJnMenT+mXCXI/7qr6F1D66Ts1/LhYEf4ZsmSxebRLN0RtFQDL
 Plpmi+jO5vx3cX0Rsc1zJevOBvQ2kWdCqvuMKihTajjj+LgJGeJyUe8cr7pZ89mjgN
 +IPntnmeP6gAAVsbvd89BOdk1dQ82ldil/6ZvWvNr9Zod5S8l+zHB0JbvfyGaNPcWZ
 ynNU/lUbV7jRQ==
Date: Thu, 7 May 2020 12:43:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20200507124311.3838e2a0@canb.auug.org.au>
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
Cc: Peter Jones <pjones@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: multipart/mixed; boundary="===============1063535850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1063535850==
Content-Type: multipart/signed; boundary="Sig_/avDbmjoaGsC/ysa+PA0FSf8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/avDbmjoaGsC/ysa+PA0FSf8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_fbc.c

between commit:

  82152d424b6c ("Make the "Reducing compressed framebufer size" message be =
DRM_INFO_ONCE()")

from the drm-intel-fixes tree and commit:

  97ed48b5c8b1 ("drm/i915/fbc: convert to drm_device based logging macros.")

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

diff --cc drivers/gpu/drm/i915/display/intel_fbc.c
index c125ca9ab9b3,56bcd6c52a02..000000000000
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@@ -485,7 -485,9 +485,8 @@@ static int intel_fbc_alloc_cfb(struct d
  	if (!ret)
  		goto err_llb;
  	else if (ret > 1) {
- 		DRM_INFO_ONCE("Reducing the compressed framebuffer size. This may lead =
to less power savings than a non-reduced-size. Try to increase stolen memor=
y size if available in BIOS.\n");
 -		drm_info(&dev_priv->drm,
++		drm_info_once(&dev_priv->drm,
+ 			 "Reducing the compressed framebuffer size. This may lead to less powe=
r savings than a non-reduced-size. Try to increase stolen memory size if av=
ailable in BIOS.\n");
 -
  	}
 =20
  	fbc->threshold =3D ret;

--Sig_/avDbmjoaGsC/ysa+PA0FSf8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zdb8ACgkQAVBC80lX
0GyuIgf+OkbDDmJb3xBZ3z4ltKh2Eq6GPhl9KgWPSF5jdRke+TGBjjiB66zZyGLL
dDLb9Ff96UIASj6ArDPb3E2TlAzxJ9TvOzBL32ggHlkBnmJk4xmlQqf6yoL49OYR
Iqzw5Ei+HSJCMP98oiCBKGKCSf3AhkT2dLoJfs503pflnfvSJ+AZCDWWkUDZYVGh
EUlrkEozwqs01u4zK8GlhYf7A4zsg9W0RQOn56CzkLMvtH5kn4fnLGiXkVkdHH4l
2XlC6v9UK/PSNs27mcZdI99vRgoLkkWimII7CM0s785UellFTSnsmhKm5czkZ1ZS
N/sRtKMcGNYod1a1zSLgTPwiQLH62w==
=fiYA
-----END PGP SIGNATURE-----

--Sig_/avDbmjoaGsC/ysa+PA0FSf8--

--===============1063535850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1063535850==--
