Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257CC90B9C2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF8110E06D;
	Mon, 17 Jun 2024 18:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l5ky6mip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8D510E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 18:33:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B0166143F;
 Mon, 17 Jun 2024 18:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7632C2BD10;
 Mon, 17 Jun 2024 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718649200;
 bh=Gt5AbKd0+XH+0wVvRk0f/xTWi7oQGBUFmyKGBfxlRQs=;
 h=Date:From:To:Cc:Subject:From;
 b=l5ky6mip2fAi9OyJx8SV0jjuR3GhcX3VJ5uyUNfB2Re+py+2S4JN4TQlbxhyswOWL
 7EE+KqdZTAW2plGjz1GBV4xMUUkr6ScT7ZKPGopdyYNgHc5bi6CzbhuQwKiXvBZirJ
 M3rCb2Fw5Jn17vhxoU8Qe63FXbd76FOl+nng17RWjTIz2zLqwwRcTGW5cQ5rSP98LH
 bNiu6w/IwXd78IGUk5gvzhsseDCA6b61Le0RtmiHsJW88JEfMx/B0G1GvMVLYbidrh
 NYJEhsXjDbHk/RH+ob8vwL+W27XCiHIe9lxqthALQX1k6NBkcVRkMDtcLXxtzLVoqv
 Im6MfFZ/QeeiA==
Date: Mon, 17 Jun 2024 19:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <ZnCBa7N6-wLbkERq@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9evfg1dnY7P2krFD"
Content-Disposition: inline
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


--9evfg1dnY7P2krFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/xe/xe_gt_idle.c
  drivers/gpu/drm/xe/xe_guc_pc.c

between commits:

  2470b141bfae2 ("drm/xe: move disable_c6 call")
  7c877115da419 ("drm/xe/xe_gt_idle: use GT forcewake domain assertion")

=66rom the drm-intel-fixes tree and commits:

  21b7085546481 ("drm/xe/xe_gt_idle: use GT forcewake domain assertion")
  6800e63cf97ba ("drm/xe: move disable_c6 call")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_gt_idle.c
index 944770fb2daff,5d6181117ab26..0000000000000
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
diff --cc drivers/gpu/drm/xe/xe_guc_pc.c
index 23382ced4ea74,508f0d39b4ad5..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c

--9evfg1dnY7P2krFD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwgWoACgkQJNaLcl1U
h9BPCQf/eXvzZZ5eZTqLMhQFs/NGozaFYKFjrAyueXxCVJ8IiLpTqKNWbD+16hLG
Zb/LAezv9dmR0iwtxMELBPX+YH5J/H4wMHA1tQ0FzqOVUhbr42kVNvv0ta/DZwb7
kyGfE95XkK4dZSVUld4TZhz5nhptU3KtSu5fE5o9VT5QQ9kPPsvovT4zZ1qcpzWe
chyYnpVSV8EgR2R653aqQ3DjIMYRReNFixwWL/MLwfDrCDvkuLLLxwb5eY2vV/IC
hr37RAdtC6NTlAmMmQzCCQPyEeL/u7AqspaZzjVIIOdL/BJvTWKfttlrG3HZAlfb
pwCtKRHC+eMAOsyN6Wh/mGyma47R3Q==
=COji
-----END PGP SIGNATURE-----

--9evfg1dnY7P2krFD--
