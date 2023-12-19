Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DF81804E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 04:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9933A10E17A;
	Tue, 19 Dec 2023 03:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8C10E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 03:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1702958258;
 bh=1wUCeG4DTjZol+zbKVzUI7RIWsRC0afzTNkzQR3IfSA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E0gaK5zuCeDJHqWX2XHEMt8o7/ks3Nuj3rQrewfm6t5WvS+XMI+FxM3vNkibBV2/7
 b0wgPj7i11trP0FMGtmDgF1xEHrZ4EQmKnd3FwgQWnAcsou8dtxh4yw7JSzch/TihP
 UWU38ffZgqtID0Fpym+CIxknLYqUlkON3T/6+sf47Lr3j/lB17aDqvCSyxKsr859J6
 /cP8pxs/7TfzTBGNdZg72bjmn73cNmF8LsKIHBcZuN1db+B6mD+VutqsSuEOv5CQLK
 kWAIjqmXF8eYmQrdvdOGSR1ujMfKTtKay7DMaxA2IYlDTWOuSW0EXbbqPlvMwTgilT
 ED6RmnMnS83BQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SvNFF18zBz4x2V;
 Tue, 19 Dec 2023 14:57:36 +1100 (AEDT)
Date: Tue, 19 Dec 2023 14:57:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Dave Airlie
 <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the header_cleanup tree
Message-ID: <20231219145734.13e40e1e@canb.auug.org.au>
In-Reply-To: <20231218174030.3ed72f54@canb.auug.org.au>
References: <20231218174030.3ed72f54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kbDiBDX1yGNRcZQ/EkQuPt9";
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
Cc: DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kbDiBDX1yGNRcZQ/EkQuPt9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Dec 2023 17:40:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the header_cleanup tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> In file included from include/linux/kernel.h:27,
>                  from drivers/gpu/ipu-v3/ipu-dp.c:7:
> include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
> include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of functi=
on 'mul_u32_u32' [-Werror=3Dimplicit-function-declaration]
>    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_inp=
ut, (1 << bit_precision) - 1),
>       |                                              ^~~~~~~~~~~
> include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOS=
EST_ULL'
>   104 |         unsigned long long _tmp =3D (x) + (__d) / 2;      \
>       |                                    ^
> In file included from include/linux/time.h:6,
>                  from include/linux/videodev2.h:59,
>                  from include/video/imx-ipu-v3.h:16,
>                  from drivers/gpu/ipu-v3/ipu-dp.c:14:
> include/linux/math64.h: At top level:
> include/linux/math64.h:155:19: error: conflicting types for 'mul_u32_u32'=
; have 'u64(u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigne=
d int)'}
>   155 | static inline u64 mul_u32_u32(u32 a, u32 b)
>       |                   ^~~~~~~~~~~
> include/drm/drm_color_mgmt.h:45:46: note: previous implicit declaration o=
f 'mul_u32_u32' with type 'int()'
>    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_inp=
ut, (1 << bit_precision) - 1),
>       |                                              ^~~~~~~~~~~
> include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOS=
EST_ULL'
>   104 |         unsigned long long _tmp =3D (x) + (__d) / 2;      \
>       |                                    ^
> cc1: some warnings being treated as errors
> In file included from include/linux/kernel.h:27,
>                  from drivers/gpu/drm/omapdrm/dss/dispc_coefs.c:7:
> include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
> include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of functi=
on 'mul_u32_u32' [-Werror=3Dimplicit-function-declaration]
>    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_inp=
ut, (1 << bit_precision) - 1),
>       |                                              ^~~~~~~~~~~
> include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOS=
EST_ULL'
>   104 |         unsigned long long _tmp =3D (x) + (__d) / 2;      \
>       |                                    ^
> In file included from include/linux/jiffies.h:7,
>                  from include/linux/ktime.h:25,
>                  from include/linux/timer.h:6,
>                  from include/linux/workqueue.h:9,
>                  from include/linux/mm_types.h:19,
>                  from include/linux/mmzone.h:22,
>                  from include/linux/gfp.h:7,
>                  from include/linux/stackdepot.h:25,
>                  from include/drm/drm_modeset_lock.h:28,
>                  from include/drm/drm_crtc.h:30,
>                  from drivers/gpu/drm/omapdrm/dss/omapdss.h:11,
>                  from drivers/gpu/drm/omapdrm/dss/dispc_coefs.c:9:
> include/linux/math64.h: At top level:
> include/linux/math64.h:155:19: error: conflicting types for 'mul_u32_u32'=
; have 'u64(u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigne=
d int)'}
>   155 | static inline u64 mul_u32_u32(u32 a, u32 b)
>       |                   ^~~~~~~~~~~
> include/drm/drm_color_mgmt.h:45:46: note: previous implicit declaration o=
f 'mul_u32_u32' with type 'int()'
>    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_inp=
ut, (1 << bit_precision) - 1),
>       |                                              ^~~~~~~~~~~
> include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOS=
EST_ULL'
>   104 |         unsigned long long _tmp =3D (x) + (__d) / 2;      \
>       |                                    ^
> cc1: some warnings being treated as errors

This turns out to be a semantic conflict (or exposing a bug in commit

 c6fbb6bca108 ("drm: Fix color LUT rounding")

from the drm tree.

I have applied the following merge fix up patch (which should probably
be applied to the drm tree, if possible).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 19 Dec 2023 14:43:41 +1100
Subject: [PATCH] drm: using mul_u32_u32() requires linux/math64.h

Some pending include file cleanups produced this error:

In file included from include/linux/kernel.h:27,
                 from drivers/gpu/ipu-v3/ipu-dp.c:7:
include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of function=
 'mul_u32_u32' [-Werror=3Dimplicit-function-declaration]
   45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input=
, (1 << bit_precision) - 1),
      |                                              ^~~~~~~~~~~

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/drm/drm_color_mgmt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 54b2b2467bfd..ed81741036d7 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -24,6 +24,7 @@
 #define __DRM_COLOR_MGMT_H__
=20
 #include <linux/ctype.h>
+#include <linux/math64.h>
 #include <drm/drm_property.h>
=20
 struct drm_crtc;
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/kbDiBDX1yGNRcZQ/EkQuPt9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWBFK4ACgkQAVBC80lX
0Gx95ggAjzxLekfkqt/d/rGtV4AWZfTveEEEXDDbbOyiopjNDr8fRuXc+M7hcjtY
F6+etu13w5f+g6hbcEumWMEq5978ZysjO2Ue/5E+hfRj9ajzG9JJv7/GwKKdqLSE
QSXLSHRpU6TyUvcGsq6vwDTl0bXGwB1YUyYwfV/pQgCHjENzTVtMHZZc5ilsqnxZ
3np39vt/u1lXPKb3rIOgrURKgsvCYlZPFb7UXhcBnt+3KIuQJ/rbXoAr7ricZ5fq
2hXspPTeryVpPL33Fm7FO/2Tj9jE/Ow4r9yizU15i5aGUfIFVbNZVF0SjGyouJgE
VzbabnsFU/jxwAZXF+0ycn+Vq9j8jQ==
=nZec
-----END PGP SIGNATURE-----

--Sig_/kbDiBDX1yGNRcZQ/EkQuPt9--
