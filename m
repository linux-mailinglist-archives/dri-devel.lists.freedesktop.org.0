Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFCC8745F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 03:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B272E1136AB;
	Thu,  7 Mar 2024 02:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ltpJub++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366A610E85B;
 Thu,  7 Mar 2024 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709777429;
 bh=aBC5lNlYQfzlwFaWA0idshYy9P2JYbt9Zw+CpC/ldcE=;
 h=Date:From:To:Cc:Subject:From;
 b=ltpJub++viAVgQpYOh1ttxr8ZbOLpl+tcVJqlwLV7b+RW312Eyc36mFq/hAfD9Qp7
 7qSfXlLiBBGK8mvu09QBy10AjXytMpyV0gyrvOHcL8zVTa9Q856YOxVTUQPKw5oRkU
 qXuuic/xlKBXO6bRL6oKsDZdt4wByjuYdylp9PO7n+0KhvyF/HFDfIv7RJ+nf67d4H
 ZP1CdadB+0E0/hY/u27nwSsUBXoB6TOE4Ovyu7qOpAnHXZ0wZLkhxJ3kCkB41AN9VS
 R2w8xQ1PmvcZi/xmVHVOSJf2MQu69yd31LCoGq99iAtJ+LY+Rfpq/nJgCqc+iRfqIL
 p6SfX33zU9aMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tqt780clSz4wcC;
 Thu,  7 Mar 2024 13:10:28 +1100 (AEDT)
Date: Thu, 7 Mar 2024 13:10:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Animesh Manna <animesh.manna@intel.com>,
 Imre Deak <imre.deak@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20240307131027.66be2266@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gBe8YFdyBRsQQ7vG967EwEz";
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

--Sig_/gBe8YFdyBRsQQ7vG967EwEz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp.c

between commit:

  984318aaf7b6 ("drm/i915/panelreplay: Move out psr_init_dpcd() from init_c=
onnector()")

from the drm-intel-fixes tree and commit:

  e60cff453b82 ("drm/i915/dp: Enable DP tunnel BW allocation mode")

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

diff --cc drivers/gpu/drm/i915/display/intel_dp.c
index 94d2a15d8444,6ece2c563c7a..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@@ -5699,9 -5702,13 +5702,16 @@@ intel_dp_detect(struct drm_connector *c
  		goto out;
  	}
 =20
+ 	ret =3D intel_dp_tunnel_detect(intel_dp, ctx);
+ 	if (ret =3D=3D -EDEADLK)
+ 		return ret;
+=20
+ 	if (ret =3D=3D 1)
+ 		intel_connector->base.epoch_counter++;
+=20
 +	if (!intel_dp_is_edp(intel_dp))
 +		intel_psr_init_dpcd(intel_dp);
 +
  	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 =20
  	intel_dp_configure_mst(intel_dp);

--Sig_/gBe8YFdyBRsQQ7vG967EwEz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXpIhMACgkQAVBC80lX
0GxBvQf7BmI0o7dg07Jqo6rgMQ9Ay2p8WMp/6yyo8Jwhyb5JmFYD87E2QNv9HHfT
HgoVX1Mb+jk665Q/obBnEcW1Hcp/sZuli4SU0FVufMV0DGCz/va+z8k2DhRTxgvq
oDwInGOeOksje6o31zYGtvcbkZ4CA9/GAaOIN+h/U+eNqALRgMS5p6GAMfZUCOl/
XipVMUDj8oqzgkeKY5rSop1lj0hF+Oi4NJSP4Z4W00+M/zB3QbyT4WzYRbLcloWH
UWBFoyOUzo/ShztOMcR/cBOIDSiwWc/VQum4259wUwPJvIXqaipIXhTrNMgBMTx3
m2UTeFGeAXW8d7sKGANRay06i4PH+Q==
=14RR
-----END PGP SIGNATURE-----

--Sig_/gBe8YFdyBRsQQ7vG967EwEz--
