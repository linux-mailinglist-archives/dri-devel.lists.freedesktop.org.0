Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA5172CF6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 01:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E626ED78;
	Fri, 28 Feb 2020 00:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC4E6ED98
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 00:21:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48T9F16RlXz9sRR;
 Fri, 28 Feb 2020 11:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1582849274;
 bh=bqdlhaCdEDQDT6fMYuS3yfXwDRqxYLhmkBEqspxX+SA=;
 h=Date:From:To:Cc:Subject:From;
 b=PVVcUtLncUnQHw/RSYelG+mm5ydul2tL/gOubl5BsQOKfaJMlVQdOHTx0aos5eO5d
 HXphgeaI3XHAbCJvyuzAxRK0PDoij9NE3DnOUTNrVlfhZB4kHJ8IRoyX4viFyDlDOz
 R6xrJg2DqL0dkzUL1htwpy9tdbtMP+rEyiokKEpLqiE6RE+ykHyS/oSExseE5QdrUK
 h86heK9ArpX6KbYq1s0PuCvJ59s+ozbhW8k14ueSFRS5RqSBTvRQVX/eW1YXE325eR
 x/dRGbMprADGFbTU+dRFPQW582Nn06rU5SHydvTZjolbbr4NxvqhklV9OkbJGG16TC
 x8SnX+qnbKhcA==
Date: Fri, 28 Feb 2020 11:21:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20200228112104.519f002a@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0815746320=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0815746320==
Content-Type: multipart/signed; boundary="Sig_/AVQw4vs8Tk23cwQ7zQ.TRLY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AVQw4vs8Tk23cwQ7zQ.TRLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

between commits:

  ea702333e567 ("drm/amdgpu: Convert to struct drm_crtc_helper_funcs.get_sc=
anout_position()")
  e3eff4b5d91e ("drm/amdgpu: Convert to CRTC VBLANK callbacks")

from the drm tree and commit:

  c6385e503aea ("drm/amdgpu: drop legacy drm load and unload callbacks")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4598836c5fa4,4e868229e3b7..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@@ -1377,17 -1434,30 +1434,15 @@@ int amdgpu_file_to_fpriv(struct file *f
  	return 0;
  }
 =20
 -static bool
 -amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pip=
e,
 -				 bool in_vblank_irq, int *vpos, int *hpos,
 -				 ktime_t *stime, ktime_t *etime,
 -				 const struct drm_display_mode *mode)
 -{
 -	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
 -						  stime, etime, mode);
 -}
 -
  static struct drm_driver kms_driver =3D {
  	.driver_features =3D
- 	    DRIVER_USE_AGP | DRIVER_ATOMIC |
+ 	    DRIVER_ATOMIC |
  	    DRIVER_GEM |
  	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ |
  	    DRIVER_SYNCOBJ_TIMELINE,
  	.open =3D amdgpu_driver_open_kms,
  	.postclose =3D amdgpu_driver_postclose_kms,
  	.lastclose =3D amdgpu_driver_lastclose_kms,
- 	.unload =3D amdgpu_driver_unload_kms,
 -	.get_vblank_counter =3D amdgpu_get_vblank_counter_kms,
 -	.enable_vblank =3D amdgpu_enable_vblank_kms,
 -	.disable_vblank =3D amdgpu_disable_vblank_kms,
 -	.get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpos,
 -	.get_scanout_position =3D amdgpu_get_crtc_scanout_position,
  	.irq_handler =3D amdgpu_irq_handler,
  	.ioctls =3D amdgpu_ioctls_kms,
  	.gem_free_object_unlocked =3D amdgpu_gem_object_free,

--Sig_/AVQw4vs8Tk23cwQ7zQ.TRLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5YXPAACgkQAVBC80lX
0GzenAf/Wd+u9XikAJGbQ9oKu7F78Ud8B02dUODEjH+XLQi4E6Ng3RqFVWjhJr82
a3PevgG/R6G0SfkWMK2flCtxQ7zFRbzmBrhrP19PVi/uv7YuJ0KzFkQY4UOnQL+O
rBwsCjqzALfNS4cI5yYoALHfB43/oscyHB6aGLZyaGo1V8m5kIYr7k0ihq92XLcv
HV10qLd4W73ww0kzqc+LMSQhSieRTcQ3ZlshsryU/I92UO9ca95itgfZyCpXlefk
CtnkHl/XBhQtQKXHAmuXXH8OhPLLQZ3AfAfw1h6y2lztEPvkWWqBmkQrS8xlPt/b
GeozJOzvKNaqk7hXGDMBrRddlgG1zg==
=/PX2
-----END PGP SIGNATURE-----

--Sig_/AVQw4vs8Tk23cwQ7zQ.TRLY--

--===============0815746320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0815746320==--
