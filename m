Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E04970C26
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 05:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6698B10E0D3;
	Mon,  9 Sep 2024 03:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HzwSmNtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D3110E0D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 03:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1725851481;
 bh=1v72/rcYDS0zRktF/YD11IjuRHLtXhb86rJRmWyRvrY=;
 h=Date:From:To:Cc:Subject:From;
 b=HzwSmNtIQZfq7cykQ8/GQjInkwf4LBqXZ9xWyksTatIJuvBEp+hFi4l4qMD/naN3b
 kc+zdtv0p5PwAtT6eEzSJfMRyLijMJLNu3kZYa5e/jJ1GHZbKlyz+/PJfCufHdW4nz
 dTV41jkbnd/IOVnS8lFTbsEWXRVgC9Q7iBMmVkgJ1LuO+GWj+yl5a6MB1TAoby5Oey
 Ho+7r7eQweirYCcwhg5efcKqVd950T7twBcchvfFW0aDG9gryggkNI0ccXH/vdKMg4
 G6AOk7C8Zas53QLtEKK611tMKl2n33HlVzSnDvPlMaFMVyvv3IK9ptZ1f+qiSAk1Tc
 l+rb1JG2YfIrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2BgX4zjpz4wb0;
 Mon,  9 Sep 2024 13:11:20 +1000 (AEST)
Date: Mon, 9 Sep 2024 13:11:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240909131120.030c1d6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iVcqoWFXbHt=imaJWxm7oC_";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iVcqoWFXbHt=imaJWxm7oC_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  4bfc9c553f5e ("drm/xe/display: Avoid encoder_suspend at runtime suspend")

from Linus' tree and commit:

  769b081c18b9 ("drm/i915/opregion: convert to struct intel_display")

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

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index c860fda410c8,710b1e2170c1..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -331,12 -345,12 +345,12 @@@ void xe_display_pm_suspend(struct xe_de
 =20
  	intel_hpd_cancel_work(xe);
 =20
 -	if (!runtime && has_display(xe))
 +	if (!runtime && has_display(xe)) {
  		intel_display_driver_suspend_access(xe);
 -
 -	intel_encoder_suspend_all(&xe->display);
 +		intel_encoder_suspend_all(&xe->display);
 +	}
 =20
- 	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
+ 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 =20
  	intel_dmc_suspend(xe);
  }

--Sig_/iVcqoWFXbHt=imaJWxm7oC_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeZ1gACgkQAVBC80lX
0Gzf3wf8CZjsTcUuiP77Xy7iDHdwAFNHY0XIxXJY9sA4X3kCwqXPN76O3aRHPA2x
3h66J7KyDQH0RKJlat353yL6+742h8nwHDhcahQpG1NuY8yREt8zzfb53sUDff7o
ZLPIgI6wFUDvy5EuZkRsVvueJg2l9iYQRWGzTx7YhD9E/RPofSVLXyMZIhq96xX0
QrNXIuVh2nETV9jsBMunZmM+Nd4/9yL4yJP/LUd9RLPPX+wjAn264Wxbm7bvB5qV
jabkFODKwVuF7cYZMwtIwsQQnD1BVmX6bDFD7r6BwhxHn0A+8d1nRL+WksKiGiOG
SGfOvtz/vtuaAOwhtFqXEl0fWpO/4A==
=J+cB
-----END PGP SIGNATURE-----

--Sig_/iVcqoWFXbHt=imaJWxm7oC_--
