Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C96A3CEB0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 02:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C325D10E060;
	Thu, 20 Feb 2025 01:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H7lalOPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E426110E060
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1740014913;
 bh=ymPGS3K8PtvdLHv0pCnuqbZVNZlMes3BilfU1Lqnccg=;
 h=Date:From:To:Cc:Subject:From;
 b=H7lalOPnBxLeghgNDfRCx7wufj2Hm2+MxWZnjIyJx1vGO1zreqwO06W3zPqH4ApD0
 9MUyNRiEUH4ZHGW1lMoRnIIUaWD8a4bCdJzCP7/s+VwSWIocCkoXhX6fBtxTIcOy7Y
 kAqQqIO0jWBkw+kZl2HvaU0heD4UQJ6kb1++TeXOSdu3BdnrPae7cdp4EmIweCD4GY
 XaIGTA4vr4Kq+RETGLBnab4MghnwsVq5r8hkYHnc2QcG3A1+c1VT/mPVWOLEvPO2Rq
 cE2BJae+CSx65tamtt8dADkqq6JvOqeOlLINWI22Qp8tZW6xrB0Pz7xG0PsqGWHhQi
 HRUWdaFj9AxpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YywdD5sjpz4wyk;
 Thu, 20 Feb 2025 12:28:32 +1100 (AEDT)
Date: Thu, 20 Feb 2025 12:28:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Harry Wentland <harry.wentland@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Roman Li <roman.li@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20250220122832.0d9d9eb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/efS0uCbL9qU9bEaGXfn_NVJ";
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

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  b255ce4388e0 ("drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_=
valid()")

from the drm tree and commit:

  cbf4890c6f28 ("drm/amd/display: Don't treat wb connector as physical in c=
reate_validate_stream_for_sink")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ea40696c955,8672c0c3c5db..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -7476,9 -7536,11 +7536,12 @@@ enum drm_mode_status amdgpu_dm_connecto
  {
  	int result =3D MODE_ERROR;
  	struct dc_sink *dc_sink;
 +	struct drm_display_mode *test_mode;
  	/* TODO: Unhardcode stream count */
  	struct dc_stream_state *stream;
+ 	/* we always have an amdgpu_dm_connector here since we got
+ 	 * here via the amdgpu_dm_connector_helper_funcs
+ 	 */
  	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(connec=
tor);
 =20
  	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) ||
@@@ -7501,16 -7563,11 +7564,16 @@@
  		goto fail;
  	}
 =20
 -	drm_mode_set_crtcinfo(mode, 0);
 +	test_mode =3D drm_mode_duplicate(connector->dev, mode);
 +	if (!test_mode)
 +		goto fail;
 =20
 -	stream =3D create_validate_stream_for_sink(connector, mode,
 +	drm_mode_set_crtcinfo(test_mode, 0);
 +
- 	stream =3D create_validate_stream_for_sink(aconnector, test_mode,
++	stream =3D create_validate_stream_for_sink(connector, test_mode,
  						 to_dm_connector_state(connector->state),
  						 NULL);
 +	drm_mode_destroy(connector->dev, test_mode);
  	if (stream) {
  		dc_stream_release(stream);
  		result =3D MODE_OK;

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2hUAACgkQAVBC80lX
0GwDxwf9GOEhJAsOiyeHp+Bg89a6OutNo2Kq/Eks3y4IxmsoDxmJ5Fw4HcF4GG1H
h18UUvF1iCxozICVtzIHxQxt8L+QBp3fvqSEb3yW5sa2X4Gs4vs8I9retJOC7Thq
1iWSfc+JHTL9N/Tw9uqkLeDyd9fwuIWsiqyhtRAymqLd06nhHPo8MMzY1mivSet8
pF2PZ1WSjkn2NkA8U4Otl+XnAh6H8ebvFkHL4er5qRIv5lIxWUvnqpI3vg/stxPt
ikSxvejUHM5ZUBy0eS2dE6KxEGUutNXubDVQj5j8bwEZG4RZ7SIeuIZsHKHmLsYf
JEZD3iqDZ0bOKdrCtulxiC83iZVGng==
=sycq
-----END PGP SIGNATURE-----

--Sig_/efS0uCbL9qU9bEaGXfn_NVJ--
