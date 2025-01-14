Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4BA0FE1B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD8A10E14E;
	Tue, 14 Jan 2025 01:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Or1VNnSW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471DD10E14E;
 Tue, 14 Jan 2025 01:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736818223;
 bh=uq4TdeSTT+OI1UyCzrbwriLkWC75e1mMtOZYuBwrIKA=;
 h=Date:From:To:Cc:Subject:From;
 b=Or1VNnSWjVecmiH7X0VYBn5IiBAw4na56uh2EN+m2O4Lirah7/H9MG+OUvBoyN51f
 A1/cMIcDBiQLM6Y2jW2ltt+HYuffVYSrPn1HCck6b0P8NjVNUYJJ/lmFv5wHSUTMGS
 gEFXmVUxmWAN/MmlwukaYyl3niGV16odhCQkScmTCXiFL2w3vJ0ywWtIgQPghbYr4L
 SBvFbDYyNZhecRtzCywGX/+cdX/D74tz8o2ixloyJbh4BzH+9Co7EqUnkiDo29viPb
 EyLZlvywLmpUZ6Qn6cj66v6XzzVgH0BKVxAtR3oefWFRhOHnu7Q6311kqQ9HI5Uzbl
 tU8SzxLMvWH9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXBQQ6t17z4wp0;
 Tue, 14 Jan 2025 12:30:22 +1100 (AEDT)
Date: Tue, 14 Jan 2025 12:30:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20250114123028.67761865@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xxx123I3QZ8_DDv4mUPmxfO";
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

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/display/drm_bridge_connector.c

between commit:

  1bd1562d3522 ("drm/bridge-connector: Sync supported_formats with computed=
 ycbcr_420_allowed")

from the drm-misc-fixes tree and commit:

  0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framewor=
k")

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

diff --cc drivers/gpu/drm/display/drm_bridge_connector.c
index 3a5a4f92c979,32108307de66..000000000000
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@@ -460,9 -596,8 +596,11 @@@ struct drm_connector *drm_bridge_connec
  		return ERR_PTR(-EINVAL);
 =20
  	if (bridge_connector->bridge_hdmi) {
 +		if (!connector->ycbcr_420_allowed)
 +			supported_formats &=3D ~BIT(HDMI_COLORSPACE_YUV420);
 +
+ 		bridge =3D bridge_connector->bridge_hdmi;
+=20
  		ret =3D drmm_connector_hdmi_init(drm, connector,
  					       bridge_connector->bridge_hdmi->vendor,
  					       bridge_connector->bridge_hdmi->product,

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeFvjQACgkQAVBC80lX
0GwvzQf8DvWQGTTDWj9o6J5uhESCy7Uz/Af+xkRfutHgKookbd8CtcFECpwG3YYo
mCwDmF1eKjIaymRDOP5yaeWmJ8FYRpcsvwSwCPl2/Lt9984LwxzTazAyehVWStRz
hButypZwbfcJ/6czOyAA1vfP280i5miFw9YWqrWsoQgDbTa4ueyH4ISy/hZEKuQ6
zuUalowKE3+kOH6PPuV/lcTWQd48s/wKG/IvXnFxDIiN2+IphWGifVJbQJniVia6
FivbIaUpEy3dVGbgmzy3hQ+2Cwzzo2l0yakePIWO8XZMo0dj/AiIHLH4o3HH1Scm
fgPsh1rQun9pV90GljCTRcsTJ0A1tw==
=ZojV
-----END PGP SIGNATURE-----

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO--
