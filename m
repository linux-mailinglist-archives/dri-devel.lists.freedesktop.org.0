Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCD1E05AF
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 05:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500B189C49;
	Mon, 25 May 2020 03:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1C489C49
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:51:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Vjnk5ZQWz9sRK;
 Mon, 25 May 2020 13:51:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1590378702;
 bh=dD85KlQO7eQL4fMZBMu+JpbqAl6Gy9dAS0VsjQ5gE20=;
 h=Date:From:To:Cc:Subject:From;
 b=Khy3TuOqRVjNraCdhVxLQfeES/8tE7wzAiBMqnHcSECuzCFLe36ugvMcUQ0hrJvlu
 u0DNPUnfcRfj1GfmIKCYH9r9B5gRDfupFU5wD5Xi7AFWGEy/2O4cIJq5L+1ONtfzGq
 JZjzkaST7fdel/PJVwBEIrzIu5dhlzICAK9mpaGRQthNZTJ3ZVjURs3KDgbdb5PS4S
 Lem44p6uXZdy5BcMAfbMYn8A3AViJEC2VD1RSNw6FNJZPJiW/9GRAssc2CRvRn5+b4
 yEQlKcERczBNjqcehHSoKAYGX1869OgnWcj9zujCEU5IVaMp6cSFyrTKbRIhZzOwdY
 3nOMihdgAycYw==
Date: Mon, 25 May 2020 13:51:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20200525135132.14918f41@canb.auug.org.au>
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
Cc: Sung Lee <sung.lee@amd.com>, Jason Yan <yanaijie@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0060000996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0060000996==
Content-Type: multipart/signed; boundary="Sig_/SmEhE2DQbR1O+SQLdEKB76L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SmEhE2DQbR1O+SQLdEKB76L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c

between commit:

  31ecebee9c36 ("drm/amd/display: Defer cursor lock until after VUPDATE")

from Linus' tree and commits:

  b3a941df690f ("drm/amd/display: Power down hw blocks on boot")
  4b0e95d1838f ("drm/amd/display: Add set backlight to hw sequencer.")
  ddea4ed01058 ("drm/amd/display: remove duplicate assignment of dcn21_func=
s members")
  3ba01817365c ("drm/amd/display: Move panel_cntl specific register from ab=
m to panel_cntl.")

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

diff --cc drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
index 9e8e32629e47,897a3d25685a..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
@@@ -72,7 -72,8 +72,9 @@@ static const struct hw_sequencer_funcs=20
  	.set_clock =3D dcn10_set_clock,
  	.get_clock =3D dcn10_get_clock,
  	.get_vupdate_offset_from_vsync =3D dcn10_get_vupdate_offset_from_vsync,
+ 	.set_backlight_level =3D dce110_set_backlight_level,
+ 	.set_abm_immediate_disable =3D dce110_set_abm_immediate_disable,
 +	.calc_vupdate_position =3D dcn10_calc_vupdate_position,
  };
 =20
  static const struct hwseq_private_funcs dcn10_private_funcs =3D {
diff --cc drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
index 8334bbd6eabb,a8bcd747d7ba..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
@@@ -83,7 -83,8 +83,9 @@@ static const struct hw_sequencer_funcs=20
  	.init_vm_ctx =3D dcn20_init_vm_ctx,
  	.set_flip_control_gsl =3D dcn20_set_flip_control_gsl,
  	.get_vupdate_offset_from_vsync =3D dcn10_get_vupdate_offset_from_vsync,
+ 	.set_backlight_level =3D dce110_set_backlight_level,
+ 	.set_abm_immediate_disable =3D dce110_set_abm_immediate_disable,
 +	.calc_vupdate_position =3D dcn10_calc_vupdate_position,
  };
 =20
  static const struct hwseq_private_funcs dcn20_private_funcs =3D {
diff --cc drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
index 4dd634118df2,e97dfaa656e9..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
@@@ -86,12 -86,9 +86,10 @@@ static const struct hw_sequencer_funcs=20
  	.optimize_pwr_state =3D dcn21_optimize_pwr_state,
  	.exit_optimized_pwr_state =3D dcn21_exit_optimized_pwr_state,
  	.get_vupdate_offset_from_vsync =3D dcn10_get_vupdate_offset_from_vsync,
 +	.calc_vupdate_position =3D dcn10_calc_vupdate_position,
- 	.set_cursor_position =3D dcn10_set_cursor_position,
- 	.set_cursor_attribute =3D dcn10_set_cursor_attribute,
- 	.set_cursor_sdr_white_level =3D dcn10_set_cursor_sdr_white_level,
- 	.optimize_pwr_state =3D dcn21_optimize_pwr_state,
- 	.exit_optimized_pwr_state =3D dcn21_exit_optimized_pwr_state,
+ 	.power_down =3D dce110_power_down,
+ 	.set_backlight_level =3D dce110_set_backlight_level,
+ 	.set_abm_immediate_disable =3D dce110_set_abm_immediate_disable,
  };
 =20
  static const struct hwseq_private_funcs dcn21_private_funcs =3D {

--Sig_/SmEhE2DQbR1O+SQLdEKB76L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LQMQACgkQAVBC80lX
0Gw4BwgAg5TMCeLUxZpRwKgoMP1w7RBiF17CMOgoAta6c0V+K4aLvOnSiCahC6vH
+JqDafk/1mO2f74SCIM8yckvU13FxqTZo5SjyWNZON7T64oNnpm+x9wDbe6lYu3t
112wUKjW7dvO7wB6uoXN1iHAyp2swKNQdKsukELFbDQD+1sRdKB59QZ99zZvSJVM
cNl8ww8Bpw9qEfp+jbbRfoN1lf1JpvHXC1G72GqZ5+osOwBqY8zcx1KVnpLaEpAr
XfHC7n0unxu8rLjDxE5S3DlPcPZpYv95EPD/R02M/aZtuqbSzA1DybB/cMN8/Lji
/Iur3qQAPSQX5SIS7CTKhtOSVJ5unA==
=RRAU
-----END PGP SIGNATURE-----

--Sig_/SmEhE2DQbR1O+SQLdEKB76L--

--===============0060000996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0060000996==--
