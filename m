Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E996F465AD5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 01:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFE26E896;
	Thu,  2 Dec 2021 00:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9F6E896;
 Thu,  2 Dec 2021 00:30:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J4H0z2yvqz4xbw;
 Thu,  2 Dec 2021 11:30:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1638405028;
 bh=TjyNYyoyPBdzTBSQjZxt0J1gGbnbmg1ai8+DULrZFQE=;
 h=Date:From:To:Cc:Subject:From;
 b=oKdOa53zFtGsIZmX9ID9GitRZlzZ1gwC24CacCWaW/qVXT1JIwdJRl2IcJu3o3gFM
 liM+d9UoIhqcSn8clqgLt1nVDZIIPQlC2HT4Xj1rU6WhgEi7uWXH63zVbo9Hh9P5su
 759pi3A/U9cPEloaw/ln79PVLfQgxW1elqEB8VZRU+k0pv/0whHUt/eNYTXVAkYWyY
 2FiUW3a6EjHOenGhPcu3C+m1mKnT+kWptDGiJRJ4L5zS+MfHgxKAkjgsunt1mUkF5o
 ThhzaDjizIjtfE51Q6BRwqojTqDIzF6kyCjEjf/A4julYTbClnax4fHoWkQE2IlvUN
 pmQ4fnOqhLA3g==
Date: Thu, 2 Dec 2021 11:30:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel-gt tree with the
 drm-intel tree
Message-ID: <20211202113025.71551241@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U5W8j29yaPF/IG8K8AyEq1R";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/U5W8j29yaPF/IG8K8AyEq1R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel-gt tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_fbc.c

between commit:

  d06188234427 ("drm/i915/fbc: s/dev_priv/i915/")

from the drm-intel tree and commit:

  cca084692394 ("drm/i915: Use per device iommu check")

from the drm-intel-gt tree.

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
index d0c34bc3af6c,c40444206425..000000000000
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@@ -1674,12 -1536,12 +1674,12 @@@ static int intel_sanitize_fbc_option(st
  	return 0;
  }
 =20
 -static bool need_fbc_vtd_wa(struct drm_i915_private *dev_priv)
 +static bool need_fbc_vtd_wa(struct drm_i915_private *i915)
  {
  	/* WaFbcTurnOffFbcWhenHyperVisorIsUsed:skl,bxt */
- 	if (intel_vtd_active() &&
 -	if (intel_vtd_active(dev_priv) &&
 -	    (IS_SKYLAKE(dev_priv) || IS_BROXTON(dev_priv))) {
 -		drm_info(&dev_priv->drm,
++	if (intel_vtd_active(i915) &&
 +	    (IS_SKYLAKE(i915) || IS_BROXTON(i915))) {
 +		drm_info(&i915->drm,
  			 "Disabling framebuffer compression (FBC) to prevent screen flicker wi=
th VT-d enabled\n");
  		return true;
  	}

--Sig_/U5W8j29yaPF/IG8K8AyEq1R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGoE6EACgkQAVBC80lX
0GzXDAf+OlGafDDLWTuvxxMYe2NkmdpUhDLDa5gxcGmBfe3DzkoC6pompmP8DPBO
/H+GR02MFdTl+y2rZkRLkHm2t0jQeiUXa9ccq99TiNaDf4FRGkx2xTRlDLqCfEcG
TCWIT3oDyz/rilgDHpCLwp8zIMzw7CvCeDUSohdMhFId0zHobvKp2w9LluvLGndl
s3EJk1DxJ4tPOxr80tRiqi4hypdHINwgQp+4YyagTqBD2yZMXfDdIDa81zDBPSrs
A7yq3BHvDMuOYsvhvBvUmpCQq0AsCamdUwPTVZU7P7eT1xH2f+W9hcz639utU1ve
07H3g7yUpEY68XvDOw46KxjUZXZohA==
=gaRM
-----END PGP SIGNATURE-----

--Sig_/U5W8j29yaPF/IG8K8AyEq1R--
