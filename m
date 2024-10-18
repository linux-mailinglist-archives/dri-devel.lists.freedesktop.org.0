Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA949A3251
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 03:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4D10E231;
	Fri, 18 Oct 2024 01:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sHaariLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49D10E231
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1729216610;
 bh=fv5TdDOtmjmY3nCw0vNFC8sXNVF3YhtQ6Nu/cO8upnc=;
 h=Date:From:To:Cc:Subject:From;
 b=sHaariLpZATKLtYKBTpSdCLHBYCSkF79Knk87lw2aaaHHJTYvDxtpLgwYlCE30MOs
 2EVMyuO64mr1ZGBtTfJMrkukE1MLnjyjq7BOPjiQqX6wCUt9Ne+2zoUqfGeaCbOBBn
 w7WdKlB1SLC5WFgSJtoyaNstDCoP6KZZauT9CKLYKRha5NZyBbYjqc6OdJNBTGIXsk
 J5jQgesy6JhlCszoS4mbdhouJvmJ/jNfQudISkJRwfCuur98WS8nZEBTwZKKxfjVmE
 6jhwK6tIAPB5ImqGyEB0w9a2NqjKA4mTnCVHR66ckMlt2ji58qaIlBBlehqeDIkepb
 k8SNZiNNaRmUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XV79X65rGz4wbr;
 Fri, 18 Oct 2024 12:56:48 +1100 (AEDT)
Date: Fri, 18 Oct 2024 12:56:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Imre Deak
 <imre.deak@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20241018125649.4475512d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/COgixQydqsn1b56oW9SrweM";
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

--Sig_/COgixQydqsn1b56oW9SrweM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  69b3d8721267 ("drm/i915/dp_mst: Handle error during DSC BW overhead/slice=
 calculation")

from the drm-fixes tree and commit:

  f2e2092a979c ("drm/i915/display: Use joined pipes in dsc helpers for slic=
es, bpp")

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

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index eeaedd979354,4765bda154c1..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -147,19 -156,6 +148,19 @@@ static int intel_dp_mst_calc_pbn(int pi
  	return DIV_ROUND_UP(effective_data_rate * 64, 54 * 1000);
  }
 =20
 +static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector =
*connector,
 +					    const struct intel_crtc_state *crtc_state)
 +{
 +	const struct drm_display_mode *adjusted_mode =3D
 +		&crtc_state->hw.adjusted_mode;
- 	int num_joined_pipes =3D crtc_state->joiner_pipes;
++	int num_joined_pipes =3D intel_crtc_num_joined_pipes(crtc_state);
 +
 +	return intel_dp_dsc_get_slice_count(connector,
 +					    adjusted_mode->clock,
 +					    adjusted_mode->hdisplay,
 +					    num_joined_pipes);
 +}
 +
  static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *enc=
oder,
  						struct intel_crtc_state *crtc_state,
  						int max_bpp,

--Sig_/COgixQydqsn1b56oW9SrweM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcRwGEACgkQAVBC80lX
0GwsUgf9ECD2mr/mFq+fMgD2By0ridFlFYOWazFyUXl8dCBFmYk+CgKOo9nNJhp7
5GZnvHQVR9dSTrM0GLo1QuUHzfU/XKh9sQSB9KdRg5K4wLVt8QX3k84mMxUb3VzW
PBNIWN7foKxYLTh4Vuc+47P5+2T/cgdQ5xc9uwu8U9nD7ZkIGe0RkW1oetRzMpFb
MQuhoo4iINAqmOnPBIvDVeHFf7Dy5h7eRD4rv/KXPOozt5VhttDZNx1yEvjLTRqR
2ephN5Mc/Yndrzy00orrVlQRRsyhDdianq+EnvqHZ9KClmJKXRJlLzu4hKA+XCqn
rZQhnrOXGGAln2/8hxXjokxDzhVD0g==
=UKhi
-----END PGP SIGNATURE-----

--Sig_/COgixQydqsn1b56oW9SrweM--
