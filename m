Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41096462853
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 00:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E14C6E0BC;
	Mon, 29 Nov 2021 23:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FBC6E0BC;
 Mon, 29 Nov 2021 23:34:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J31rj0pbcz4xPv;
 Tue, 30 Nov 2021 10:33:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1638228839;
 bh=inXtXHv6yn3YtBnuAAzAq6r5aKIXNSazQdd6UUlmByM=;
 h=Date:From:To:Cc:Subject:From;
 b=EDPAUye/rs3pl+bys5hBqUCI8EXVGofnoVzZwrn+G+I3BBAhfiXMdXuMB5/HMp+rA
 tlH6bgsUH5kj8IqhbRDL7uHwdqCQKBUgWM996G4tu6bv1alHUIs7zLLGDdmBj3Fn/H
 Fjq9hkziUGIZokeFtSRmHdG1lqEWounM9Rd4V1E2aGIpt4r9NMk8SXo3kLF9Q+y+Tt
 epcz2GoKtyw+uAt1yeeVflox666gYHKLoMYiezoKgvevzo0QkoloeopsY7GOKNaVMd
 Mis7E9aVyEa7neh6ZrBSeHF0EZcED94sdRBtotjDDUexhChq4N1FKEQ0wSqAM6Tfjh
 RhRsc1gp9rQoQ==
Date: Tue, 30 Nov 2021 10:33:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20211130103353.0ab1a44f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SRktUQT/MnVNywL02YSYaaF";
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
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/SRktUQT/MnVNywL02YSYaaF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_kms.c

between commits:

  f927767978d2 ("drm/vc4: kms: Fix return code check")
  d354699e2292 ("drm/vc4: kms: Don't duplicate pending commit")

from the drm-misc-fixes tree and commit:

  16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")

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

diff --cc drivers/gpu/drm/vc4/vc4_kms.c
index b61792d2aa65,79d4d9dd1394..000000000000
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@@ -337,12 -340,21 +340,21 @@@ static void vc4_atomic_commit_tail(stru
  	struct drm_device *dev =3D state->dev;
  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
  	struct vc4_hvs *hvs =3D vc4->hvs;
 -	struct drm_crtc_state *old_crtc_state;
  	struct drm_crtc_state *new_crtc_state;
+ 	struct vc4_hvs_state *new_hvs_state;
  	struct drm_crtc *crtc;
  	struct vc4_hvs_state *old_hvs_state;
 +	unsigned int channel;
  	int i;
 =20
+ 	old_hvs_state =3D vc4_hvs_get_old_global_state(state);
 -	if (WARN_ON(!old_hvs_state))
++	if (WARN_ON(IS_ERR(old_hvs_state)))
+ 		return;
+=20
+ 	new_hvs_state =3D vc4_hvs_get_new_global_state(state);
 -	if (WARN_ON(!new_hvs_state))
++	if (WARN_ON(IS_ERR(new_hvs_state)))
+ 		return;
+=20
  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
  		struct vc4_crtc_state *vc4_crtc_state;
 =20
@@@ -353,32 -365,31 +365,36 @@@
  		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
  	}
 =20
- 	old_hvs_state =3D vc4_hvs_get_old_global_state(state);
- 	if (IS_ERR(old_hvs_state))
- 		return;
+ 	if (vc4->hvs->hvs5) {
+ 		unsigned long core_rate =3D max_t(unsigned long,
+ 						500000000,
+ 						new_hvs_state->core_clock_rate);
+=20
+ 		clk_set_min_rate(hvs->core_clk, core_rate);
+ 	}
 =20
 -	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 -		struct vc4_crtc_state *vc4_crtc_state =3D
 -			to_vc4_crtc_state(old_crtc_state);
 -		unsigned int channel =3D vc4_crtc_state->assigned_channel;
 +	for (channel =3D 0; channel < HVS_NUM_CHANNELS; channel++) {
 +		struct drm_crtc_commit *commit;
  		int ret;
 =20
 -		if (channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
 +		if (!old_hvs_state->fifo_state[channel].in_use)
  			continue;
 =20
 -		if (!old_hvs_state->fifo_state[channel].in_use)
 +		commit =3D old_hvs_state->fifo_state[channel].pending_commit;
 +		if (!commit)
  			continue;
 =20
 -		ret =3D drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending=
_commit);
 +		ret =3D drm_crtc_commit_wait(commit);
  		if (ret)
  			drm_err(dev, "Timed out waiting for commit\n");
 +
 +		drm_crtc_commit_put(commit);
 +		old_hvs_state->fifo_state[channel].pending_commit =3D NULL;
  	}
 =20
 +	if (vc4->hvs->hvs5)
 +		clk_set_min_rate(hvs->core_clk, 500000000);
 +
  	drm_atomic_helper_commit_modeset_disables(dev, state);
 =20
  	vc4_ctm_commit(vc4, state);
@@@ -667,11 -673,19 +678,13 @@@ vc4_hvs_channels_duplicate_state(struc
 =20
  	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
 =20
-=20
  	for (i =3D 0; i < HVS_NUM_CHANNELS; i++) {
  		state->fifo_state[i].in_use =3D old_state->fifo_state[i].in_use;
+ 		state->fifo_state[i].fifo_load =3D old_state->fifo_state[i].fifo_load;
 -
 -		if (!old_state->fifo_state[i].pending_commit)
 -			continue;
 -
 -		state->fifo_state[i].pending_commit =3D
 -			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
  	}
 =20
+ 	state->core_clock_rate =3D old_state->core_clock_rate;
+=20
  	return &state->base;
  }
 =20
@@@ -826,6 -840,76 +839,76 @@@ static int vc4_pv_muxing_atomic_check(s
  	return 0;
  }
 =20
+ static int
+ vc4_core_clock_atomic_check(struct drm_atomic_state *state)
+ {
+ 	struct vc4_dev *vc4 =3D to_vc4_dev(state->dev);
+ 	struct drm_private_state *priv_state;
+ 	struct vc4_hvs_state *hvs_new_state;
+ 	struct vc4_load_tracker_state *load_state;
+ 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+ 	struct drm_crtc *crtc;
+ 	unsigned int num_outputs;
+ 	unsigned long pixel_rate;
+ 	unsigned long cob_rate;
+ 	unsigned int i;
+=20
+ 	priv_state =3D drm_atomic_get_private_obj_state(state,
+ 						      &vc4->load_tracker);
+ 	if (IS_ERR(priv_state))
+ 		return PTR_ERR(priv_state);
+=20
+ 	load_state =3D to_vc4_load_tracker_state(priv_state);
+=20
+ 	hvs_new_state =3D vc4_hvs_get_global_state(state);
 -	if (!hvs_new_state)
 -		return -EINVAL;
++	if (IS_ERR(hvs_new_state))
++		return PTR_ERR(hvs_new_state);
+=20
+ 	for_each_oldnew_crtc_in_state(state, crtc,
+ 				      old_crtc_state,
+ 				      new_crtc_state,
+ 				      i) {
+ 		if (old_crtc_state->active) {
+ 			struct vc4_crtc_state *old_vc4_state =3D
+ 				to_vc4_crtc_state(old_crtc_state);
+ 			unsigned int channel =3D old_vc4_state->assigned_channel;
+=20
+ 			hvs_new_state->fifo_state[channel].fifo_load =3D 0;
+ 		}
+=20
+ 		if (new_crtc_state->active) {
+ 			struct vc4_crtc_state *new_vc4_state =3D
+ 				to_vc4_crtc_state(new_crtc_state);
+ 			unsigned int channel =3D new_vc4_state->assigned_channel;
+=20
+ 			hvs_new_state->fifo_state[channel].fifo_load =3D
+ 				new_vc4_state->hvs_load;
+ 		}
+ 	}
+=20
+ 	cob_rate =3D 0;
+ 	num_outputs =3D 0;
+ 	for (i =3D 0; i < HVS_NUM_CHANNELS; i++) {
+ 		if (!hvs_new_state->fifo_state[i].in_use)
+ 			continue;
+=20
+ 		num_outputs++;
+ 		cob_rate +=3D hvs_new_state->fifo_state[i].fifo_load;
+ 	}
+=20
+ 	pixel_rate =3D load_state->hvs_load;
+ 	if (num_outputs > 1) {
+ 		pixel_rate =3D (pixel_rate * 40) / 100;
+ 	} else {
+ 		pixel_rate =3D (pixel_rate * 60) / 100;
+ 	}
+=20
+ 	hvs_new_state->core_clock_rate =3D max(cob_rate, pixel_rate);
+=20
+ 	return 0;
+ }
+=20
+=20
  static int
  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
  {

--Sig_/SRktUQT/MnVNywL02YSYaaF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGlY2EACgkQAVBC80lX
0GxgDwf/Y2zmsDBVbJBKWov738mnjKysnZB7GVIAHJ0dLd3HQrFynMZoRGT6E8y3
+BKOFt/cAj4nPy7rYPzYmCzQEF9mtuzlCoVZmF9mWKCTKq2CPuVZYlkzkRNAFpR7
s2LCcUw44Po1IL8o10pXCGrFeFfPH0yFQc5XX0i3OS1sPunsPJg+fAAzPdN++gzQ
79+IYfcykH36wSiprGzhJXHqqBT4drIurU9odup7mmEsySvtFUKqGeiB7jRtHuFl
51wFPPMMXG2N4PWX6kQvMWZAdBpMtdKOeTkkZQXm96kjcdEktGuTqZAirfo4pnoO
BlJC3jD2TwVcRgzM2uFA2KTCLS6pZw==
=gLo3
-----END PGP SIGNATURE-----

--Sig_/SRktUQT/MnVNywL02YSYaaF--
