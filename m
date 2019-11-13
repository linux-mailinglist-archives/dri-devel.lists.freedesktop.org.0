Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FBF9FA9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 01:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ED96E03F;
	Wed, 13 Nov 2019 00:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147F56E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:58:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CR753PcCz9sPh;
 Wed, 13 Nov 2019 11:58:09 +1100 (AEDT)
Date: Wed, 13 Nov 2019 11:58:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113115808.65d4138e@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573606689;
 bh=ZBkUHDMWS5AB+9yNCiNLnvsF5dXKFxRx6HUcHSjsaPQ=;
 h=Date:From:To:Cc:Subject:From;
 b=qYIKu66iwF18qDVT+9E8ozi4qN+qMIR4+z0NScyB1lUEpuPmZa9FFE3DfsBPz/Ye/
 FtR+im7O0SBWPIfYhhWRbIjVD+34DmQ2/pXTpUUFgIIZQssU1g4SBssDnCcpPotgQV
 ib1eIOuKfTfoGR9LoSa2s9PuXuLtmzqcWGoNfcbws0Gk6Gl2cTYVyZihvwBnus73yl
 SJPez+a6W/vPUP4QpCxRZ77GYQPum2mhqZ7nwCsCpKRKlicUgA27L+STl8/FZUFeEw
 0AXzJAPa/1MzkyG1KxDEv3GoZSIUSYEZhxT/1HG+Ip0En1tJTwtyIesG7Mx20EGjRo
 idSk0BOks1ADg==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============0638215705=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0638215705==
Content-Type: multipart/signed; boundary="Sig_/kV_LBYPKme8Ev4xmxVLLmHe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kV_LBYPKme8Ev4xmxVLLmHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.c

between commits:

  7e34f4e4aad3 ("drm/i915/gen8+: Add RC6 CTX corruption WA")
  2f216a850715 ("drm/i915: update rawclk also on resume")


from Linus' tree and commits:

  5bcd53aa39f3 ("drm/i915: pass i915 to i915_driver_modeset_probe()")
  fd6fe087ca47 ("drm/i915/gt: Call intel_gt_sanitize() directly")

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

diff --cc drivers/gpu/drm/i915/i915_drv.c
index 3d717e282908,ccb5b566795f..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@@ -364,11 -296,14 +296,11 @@@ static int i915_driver_modeset_probe(st
  	if (ret)
  		goto cleanup_vga_client;
 =20
- 	intel_power_domains_init_hw(dev_priv, false);
 -	/* must happen before intel_power_domains_init_hw() on VLV/CHV */
 -	intel_update_rawclk(i915);
 -
+ 	intel_power_domains_init_hw(i915, false);
 =20
- 	intel_csr_ucode_init(dev_priv);
+ 	intel_csr_ucode_init(i915);
 =20
- 	ret =3D intel_irq_install(dev_priv);
+ 	ret =3D intel_irq_install(i915);
  	if (ret)
  		goto cleanup_csr;
 =20
@@@ -2048,14 -1948,8 +1947,10 @@@ static int i915_drm_resume_early(struc
 =20
  	intel_display_power_resume_early(dev_priv);
 =20
- 	intel_sanitize_gt_powersave(dev_priv);
-=20
  	intel_power_domains_resume(dev_priv);
 =20
 +	i915_rc6_ctx_wa_resume(dev_priv);
 +
- 	intel_gt_sanitize(&dev_priv->gt, true);
-=20
  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 =20
  	return ret;

--Sig_/kV_LBYPKme8Ev4xmxVLLmHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LVSAACgkQAVBC80lX
0GxObAf9EK3RQ7S1TMgfyRmdBWJMZ5oAx/e6sgpyToIerf9imckzafTYAgoIss04
YJmorDSXjbBkrTcVB6whx+JvV/ULqLBQi9+PI3Af7QWM6pCoRpulCvnT8MGTYdSQ
Zz/R1cUnbbHxhSCol6KJBXKonxShqKkWJrXMZtj7buFjVAhA9pwLTFh9Cek/Z/zx
14ju1J07Id65nAFueapYh90uJAC/dm+ookXkSvIt+m+Ar1yHJtkWCsa3CDmjFLLr
z0mqCkwSEpkloWfFDPSRiP12eSm1R/qJWwYAxdqQrFsAkZTq+DZe/cJUZzPiA2YC
3d/yd/S6LqqHlpKiLSfR/Pg5XggIoA==
=nfXk
-----END PGP SIGNATURE-----

--Sig_/kV_LBYPKme8Ev4xmxVLLmHe--

--===============0638215705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0638215705==--
