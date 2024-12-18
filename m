Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F366F9F5BE3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 01:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481210E63C;
	Wed, 18 Dec 2024 00:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QjmBqDwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B628010E078;
 Wed, 18 Dec 2024 00:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1734483090;
 bh=1vpT2P+faVorP8ST2y/5c7i1Ua3G3TaAidqfaRre4Ks=;
 h=Date:From:To:Cc:Subject:From;
 b=QjmBqDwFF8r7Z4o9kxOEh+ttBKAyRMdPlDY/5kx4vLw2G7jff/5X/61j5tB3XKUDf
 OOSj10SxWK7CUWysSfYEaTCXv3gjCnZyCOcwUSAiq5NB9YKRbr76dcFZoP90ru3j3L
 bppiRjWGWk0cPnK1J3sNHfUSseycS72Q6X+Ti/2AN6zy5alt6QxFsmLwx+MkGyDyaG
 403gmq4x7c7SUcuHfUQitPe6PFbfr1HJ1QuF60md+LzS2zyC8KCRzwGBVMi4PSY9pQ
 4zA8QUXcfR9UkDRlr0Q+UvBnXtXo50ZBueoIX81LolLaPh6MnVvsFCEgCsZzyB+/ct
 L075q1NuFWKgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCZr105Hdz4wcw;
 Wed, 18 Dec 2024 11:51:28 +1100 (AEDT)
Date: Wed, 18 Dec 2024 11:51:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>, Jani
 Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc tree
Message-ID: <20241218115132.6e15b328@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/obtdIcF33TJJKbeG=JRDl0c";
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

--Sig_/obtdIcF33TJJKbeG=JRDl0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[Thanks, Imre for the heads up and help with the conflict resolution]

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  6fe7b1d10cbd ("drm/i915/dp_mst: Expose a connector to kernel users after =
it's properly initialized")

from the drm-misc tree and commits:

  529798bd786a ("drm/i915/mst: convert to struct intel_display")
  d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization in intel_dp_=
add_mst_connector()")
  fdb65ede8a45 ("drm/i915/mst: unify MST connector function naming to mst_c=
onnector_*")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index 56ca571e534c,326ff20a5a49..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1715,9 -1704,7 +1704,9 @@@ mst_topology_add_connector(struct drm_d
  	if (!intel_connector)
  		return NULL;
 =20
 +	connector =3D &intel_connector->base;
 +
- 	intel_connector->get_hw_state =3D intel_dp_mst_get_hw_state;
+ 	intel_connector->get_hw_state =3D mst_connector_get_hw_state;
  	intel_connector->sync_state =3D intel_dp_connector_sync_state;
  	intel_connector->mst_port =3D intel_dp;
  	intel_connector->port =3D port;
@@@ -1725,22 -1712,33 +1714,22 @@@
 =20
  	intel_dp_init_modeset_retry_work(intel_connector);
 =20
- 	ret =3D drm_connector_dynamic_init(&dev_priv->drm, connector, &intel_dp_=
mst_connector_funcs,
 -	/*
 -	 * TODO: The following drm_connector specific initialization belongs
 -	 * to DRM core, however it happens atm too late in
 -	 * drm_connector_init(). That function will also expose the connector
 -	 * to in-kernel users, so it can't be called until the connector is
 -	 * sufficiently initialized; init the device pointer used by the
 -	 * following DSC setup, until a fix moving this to DRM core.
 -	 */
 -	intel_connector->base.dev =3D mgr->dev;
 -
 -	intel_connector->dp.dsc_decompression_aux =3D drm_dp_mst_dsc_aux_for_por=
t(port);
 -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 -	intel_connector->dp.dsc_hblank_expansion_quirk =3D
 -		detect_dsc_hblank_expansion_quirk(intel_connector);
 -
 -	connector =3D &intel_connector->base;
 -	ret =3D drm_connector_init(display->drm, connector, &mst_connector_funcs,
 -				 DRM_MODE_CONNECTOR_DisplayPort);
++	ret =3D drm_connector_dynamic_init(display->drm, connector, &mst_connect=
or_funcs,
 +					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
  	if (ret) {
  		drm_dp_mst_put_port_malloc(port);
  		intel_connector_free(intel_connector);
  		return NULL;
  	}
 =20
 +	intel_connector->dp.dsc_decompression_aux =3D drm_dp_mst_dsc_aux_for_por=
t(port);
 +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 +	intel_connector->dp.dsc_hblank_expansion_quirk =3D
 +		detect_dsc_hblank_expansion_quirk(intel_connector);
 +
- 	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs=
);
+ 	drm_connector_helper_add(connector, &mst_connector_helper_funcs);
 =20
- 	for_each_pipe(dev_priv, pipe) {
+ 	for_each_pipe(display, pipe) {
  		struct drm_encoder *enc =3D
  			&intel_dp->mst_encoders[pipe]->base.base;
 =20

--Sig_/obtdIcF33TJJKbeG=JRDl0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdiHJQACgkQAVBC80lX
0GxBWwgAlUoIUXQ+BnMilG1IzyakMU861jRdJej/F85ZPKIFPAu2gd7Rd8pKQ/xl
mexyXs2KVhmRlQkdWh6s9puWet6tgx8jAR9QdKt99SgnEXMzQ+gbJsLYw+wB5055
5XvmWOkuzkLZC4elTtqUERVIElN+My8jSCISCdrZGpLB5LO6GtxiWanoKbxF+Kp1
8Hk0mXIXsShjYF/JVe8hvFlrLhJngvod4FIZLBaA/tsAz+5HMf0IcrFEoa2s3E5L
rP4S7LpyG+d9bc2p+BY8/7iEzVu1FEejEhKb8gG/874CjoAe4G2P6kODhVqLPSmK
UAfAas98XmTXZ49iNSQKFy/LkHd9bQ==
=zGYY
-----END PGP SIGNATURE-----

--Sig_/obtdIcF33TJJKbeG=JRDl0c--
