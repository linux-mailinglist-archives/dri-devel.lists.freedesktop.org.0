Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A525D1B5250
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 04:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4C189FAD;
	Thu, 23 Apr 2020 02:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4FD89FA7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 02:13:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49717g1mmRz9sSd;
 Thu, 23 Apr 2020 12:13:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587608033;
 bh=xVuTqNfiwREg9OUyvTo3nmF/OVJaGHdlQk6JpY9joko=;
 h=Date:From:To:Cc:Subject:From;
 b=mExy4KoWKorVGiMLvmJogm4dmaC3orsjrkDTll7uYDL9ExSd4FzUL95NnerdYMOtE
 YOgfvsKn4+Hjuv4FVF7M2MnSGeGamBXGCcYhRzh5oVRQk0DjmcktND8lgVT7QMYpib
 g1LNv2zcPmhvkSofRFZjCGpoMFIflrXrRYArAEglieecKwfdqJHF+OtByZQBF0kr/F
 BxcMre6kPlKIxFvrpI4EfXvmsiMBVrUu9gBrOH8HmGeCsQrvbSNHJwkHltpPPxfE6L
 upKPJZjul49PjHPRWDmfH+QRjXbgMGHRTFK9nQZWe0s5Ro96q3WEgZqW2AAxJ3ZUyZ
 czivDrn3coC/w==
Date: Thu, 23 Apr 2020 12:13:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20200423121346.42e35467@canb.auug.org.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0307353143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0307353143==
Content-Type: multipart/signed; boundary="Sig_/+aoijb5RJMBtS7MePMMZmj8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+aoijb5RJMBtS7MePMMZmj8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c

between commit:

  09b974e8983a ("drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callba=
ck")

from the drm tree and commit:

  c33f212c0c92 ("drm/amdgpu/display: create fake mst encoders ahead of time=
")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 3db1ec35d2b4,4f0072a9396b..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@@ -136,23 -93,14 +93,20 @@@ static ssize_t dm_dp_aux_transfer(struc
  static void
  dm_dp_mst_connector_destroy(struct drm_connector *connector)
  {
 -	struct amdgpu_dm_connector *amdgpu_dm_connector =3D to_amdgpu_dm_connect=
or(connector);
 +	struct amdgpu_dm_connector *aconnector =3D
 +		to_amdgpu_dm_connector(connector);
- 	struct amdgpu_encoder *amdgpu_encoder =3D aconnector->mst_encoder;
 +
 +	if (aconnector->dc_sink) {
 +		dc_link_remove_remote_sink(aconnector->dc_link,
 +					   aconnector->dc_sink);
 +		dc_sink_release(aconnector->dc_sink);
 +	}
 =20
 -	kfree(amdgpu_dm_connector->edid);
 -	amdgpu_dm_connector->edid =3D NULL;
 +	kfree(aconnector->edid);
 =20
- 	drm_encoder_cleanup(&amdgpu_encoder->base);
- 	kfree(amdgpu_encoder);
  	drm_connector_cleanup(connector);
 -	drm_dp_mst_put_port_malloc(amdgpu_dm_connector->port);
 -	kfree(amdgpu_dm_connector);
 +	drm_dp_mst_put_port_malloc(aconnector->port);
 +	kfree(aconnector);
  }
 =20
  static int
@@@ -412,10 -358,11 +364,19 @@@ dm_dp_add_mst_connector(struct drm_dp_m
  		master->dc_link,
  		master->connector_id);
 =20
- 	aconnector->mst_encoder =3D dm_dp_create_fake_mst_encoder(master);
- 	drm_connector_attach_encoder(&aconnector->base,
- 				     &aconnector->mst_encoder->base);
+ 	for (i =3D 0; i < AMDGPU_DM_MAX_CRTC; i++) {
+ 		drm_connector_attach_encoder(&aconnector->base,
+ 					     &aconnector->mst_encoders[i].base);
+ 	}
+=20
++	connector->max_bpc_property =3D master->base.max_bpc_property;
++	if (connector->max_bpc_property)
++		drm_connector_attach_max_bpc_property(connector, 8, 16);
++
++	connector->vrr_capable_property =3D master->base.vrr_capable_property;
++	if (connector->vrr_capable_property)
++		drm_connector_attach_vrr_capable_property(connector);
 +
  	connector->max_bpc_property =3D master->base.max_bpc_property;
  	if (connector->max_bpc_property)
  		drm_connector_attach_max_bpc_property(connector, 8, 16);

--Sig_/+aoijb5RJMBtS7MePMMZmj8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6g+doACgkQAVBC80lX
0GzYsgf9HPCUYzxjIj08o53T96k048Rm4Ej9PAukiAH3p53qvOcyKzcQVuZQP8JB
uxZkddWLjhkzV3JLfdchTyV/e4UWkF+v8GaUfOYzPWwde94LkmMtDGiPtD8uCen0
61/wCiLg1XbjiuQJtmtRdAEiK3elwI2OKtK/yNvq0Ue9Vau2OpqozKjqeE+pH+xc
RP4m72sCXJ6ntOKyT14aKyZGpEZ29zBwN+mnoEoyg0DZVfS4SQcnjuzgQSYKBUdT
Fg9WUq61pUCz7+dpJpeprZA5QsQR2I0xtt4O5F/kFdG7GVPd+4YlT+763rF0G9q0
lriWtDXPBTtwGwjB3bXmXCghrc5l4A==
=MkmL
-----END PGP SIGNATURE-----

--Sig_/+aoijb5RJMBtS7MePMMZmj8--

--===============0307353143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0307353143==--
