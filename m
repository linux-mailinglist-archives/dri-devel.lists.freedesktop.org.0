Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C0C1E557
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 05:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7D410E8C2;
	Thu, 30 Oct 2025 04:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LBJ6sMir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A67D10E23F;
 Thu, 30 Oct 2025 04:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1761797671;
 bh=eloDQ1WUANcK2WNgL8Gpb6VYi6ac03vfbgQyidRCK+4=;
 h=Date:From:To:Cc:Subject:From;
 b=LBJ6sMirjmRUOj0QJ4AlsxUi3kmu0B0u+7IkLHugH3uiKf5pBp68PMM17gq5G50v8
 g33bRzj4Q5OCuYqivKgI+9+d1aHO1bNzKhm4iCi7Dyi9OrvsYXklChMRDqC4aKTA6/
 xCIqJtSJ6LoA0GsN3CFAu+MCXlTODQL3Hi+PWUeAW7x6j2vcy/RqQm8QBLg8vSoRSO
 0JhZNxMHdJ5D+aLffnRYAWc7JL2Nb3Cd+/drSF+Vjvj4kSm24FZYlg66cRmwmYyeYY
 HpzFKJuuPYkKhrhBvwbhqG8gsw5XdAD5EIVo9ytwTHgcAEEbxz4PQSaGKDKhy+OZl/
 4VZqfM1u8j0pA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxrNP2Bhsz4wBF;
 Thu, 30 Oct 2025 15:14:29 +1100 (AEDT)
Date: Thu, 30 Oct 2025 15:14:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Neil Armstrong <neil.armstrong@linaro.org>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the backlight tree with the drm-misc tree
Message-ID: <20251030151428.3c1f11ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ez_SQ4hryzaNMe3.ZeJk/zh";
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

--Sig_/Ez_SQ4hryzaNMe3.ZeJk/zh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the backlight tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: array type has i=
ncomplete element type 'struct regulator_bulk_data'
   41 | static const struct regulator_bulk_data tddi_supplies[] =3D {
      |                                         ^~~~~~~~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_prepare':
drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:15: error: implicit declara=
tion of function 'regulator_bulk_enable' [-Wimplicit-function-declaration]
   72 |         ret =3D regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ct=
x->supplies);
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/dev_printk.h:14,
                 from include/linux/device.h:15,
                 from include/linux/backlight.h:12,
                 from drivers/gpu/drm/panel/panel-synaptics-tddi.c:8:
include/linux/compiler.h:201:82: error: expression in static assertion is n=
ot an integer
  201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_=
Static_assert(!(e), msg);}))
      |                                                                    =
              ^
include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_O=
N_ZERO_MSG'
  206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array=
(a), \
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_ar=
ray'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:37: note: in expansion of m=
acro 'ARRAY_SIZE'
   72 |         ret =3D regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ct=
x->supplies);
      |                                     ^~~~~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_unprepare':
drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:9: error: implicit declara=
tion of function 'regulator_bulk_disable' [-Wimplicit-function-declaration]
  101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supp=
lies);
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/compiler.h:201:82: error: expression in static assertion is n=
ot an integer
  201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_=
Static_assert(!(e), msg);}))
      |                                                                    =
              ^
include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_O=
N_ZERO_MSG'
  206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array=
(a), \
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_ar=
ray'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:32: note: in expansion of =
macro 'ARRAY_SIZE'
  101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supp=
lies);
      |                                ^~~~~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_probe':
drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:15: error: implicit declar=
ation of function 'devm_regulator_bulk_get_const' [-Wimplicit-function-decl=
aration]
  183 |         ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_=
supplies),
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/compiler.h:201:82: error: expression in static assertion is n=
ot an integer
  201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_=
Static_assert(!(e), msg);}))
      |                                                                    =
              ^
include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_O=
N_ZERO_MSG'
  206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array=
(a), \
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_ar=
ray'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:50: note: in expansion of =
macro 'ARRAY_SIZE'
  183 |         ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_=
supplies),
      |                                                  ^~~~~~~~~~
drivers/gpu/drm/panel/panel-synaptics-tddi.c: At top level:
drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: 'tddi_supplies' =
defined but not used [-Werror=3Dunused-variable]
   41 | static const struct regulator_bulk_data tddi_supplies[] =3D {
      |                                         ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")

interacting with commit

  3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI pane=
ls")

from the drm-misc tree.

I have applied the following merge fix patch.  It (or something linke it)
should be applied to the drm-misc tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 Oct 2025 14:57:03 +1100
Subject: [PATCH] fix up for "backlight: Do not include <linux/fb.h> in head=
er file"

interacting with commit

  3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI pane=
ls")

from the drm-misc tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/panel/panel-synaptics-tddi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm=
/panel/panel-synaptics-tddi.c
index a4b3cbdebb6c..0aea1854710e 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-tddi.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
=20
 #include <video/mipi_display.h>
=20
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Ez_SQ4hryzaNMe3.ZeJk/zh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkC5iQACgkQAVBC80lX
0GzcPgf9GSHa4X4ISUXndf3sy8wWX7aU9KklzyrGVDQLzw7SgHHFzWHCn9d6o/ru
LyMaI6ZK4nrSQXMWLTpoo/S4vaN4kNg8Cq5i8CpzEG2BFRhgiSpZm5ziCZB/u0yv
ZwadF3d2QWx+7pyUWHESAk9uSE/ZDjEWPEzwXY28W3oFtmclRzKCqhRWfmVfoluR
cq1cWsB/4radIFFoONd/RzMjTNGfFltBYMGFqagESK3clGwyw1TmRQk1kf+VjLPv
LT8A1zT76ay2ItkTn01eD6R6hoES2HxYBd16iLzOqbcjOI7XPJARwk4dteLhxFrS
78PBBKOGmYt66GA8t13R2bb3qC2v+w==
=7ntn
-----END PGP SIGNATURE-----

--Sig_/Ez_SQ4hryzaNMe3.ZeJk/zh--
