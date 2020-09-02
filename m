Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E925A3C8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 05:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F1A6E0B6;
	Wed,  2 Sep 2020 03:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4789CBE;
 Wed,  2 Sep 2020 03:06:32 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh83R5Kh2z9sSJ;
 Wed,  2 Sep 2020 13:06:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1599015990;
 bh=zim69dfuPpB8Yc/TUTIMWuP0ktKGex5mslQ+gJxzaq0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4NyqMv/TQ3NRUoeVx95Jqy8U4YUbFnZDytjI8fpZrDZYqqvSK6kp82n2SQpnRKjt
 PkBLDzrcz24MU2xUbXqehJgEXy89v5JM9+ETWwuL5ktGRyf078zXDRRwyJyBZ2A6dA
 76QM/XUS8aKK+dRL6YKa9GT5P1HNVoA/wZhg+QIO6qeuLM9M8fZs8WUTSvBxIii2oL
 ajU/FFlGx3EXM3NYTuSDXDCJMq5NzzPPXUQnZ5/dQ+Mbj1pvzdnpZQacD6gtnf9Wwv
 V/fUpA5CZLX9KEybaCM44/aHaCl482MG7h4BTbpq49hh/6nSHHZRKECudeEFbUWaui
 4+OKMjaKkalzg==
Date: Wed, 2 Sep 2020 13:06:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200902130624.18983108@canb.auug.org.au>
In-Reply-To: <20200826105547.4f6ea26d@canb.auug.org.au>
References: <20200826105547.4f6ea26d@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: multipart/mixed; boundary="===============1463785593=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1463785593==
Content-Type: multipart/signed; boundary="Sig_/YizQk8yowqeEyhmG.EVW9OP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YizQk8yowqeEyhmG.EVW9OP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 26 Aug 2020 10:55:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_display_read_client_m=
onitors_config':
> include/drm/drm_modeset_lock.h:167:7: error: implicit declaration of func=
tion 'drm_drv_uses_atomic_modeset' [-Werror=3Dimplicit-function-declaration]
>   167 |  if (!drm_drv_uses_atomic_modeset(dev))    \
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM=
_MODESET_LOCK_ALL_BEGIN'
>   187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRU=
PTIBLE, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:189:35: error: macro "DRM_MODESET_LOCK_=
ALL_END" requires 3 arguments, but only 2 given
>   189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
>       |                                   ^
> In file included from include/drm/drm_crtc.h:36,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/qxl/qxl_display.c:29:
> include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END=
" defined here
>   194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
>       |=20
> drivers/gpu/drm/qxl/qxl_display.c:189:2: error: 'DRM_MODESET_LOCK_ALL_END=
' undeclared (first use in this function)
>   189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:189:2: note: each undeclared identifier=
 is reported only once for each function it appears in
> drivers/gpu/drm/qxl/qxl_display.c:187:2: error: label 'modeset_lock_fail'=
 used but not defined
>   187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRU=
PTIBLE, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/drm/drm_crtc.h:36,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/qxl/qxl_display.c:29:
> include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry'=
 defined but not used [-Wunused-label]
>   170 | modeset_lock_retry:       \
>       | ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM=
_MODESET_LOCK_ALL_BEGIN'
>   187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRU=
PTIBLE, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_framebuffer_surface_d=
irty':
> drivers/gpu/drm/qxl/qxl_display.c:434:35: error: macro "DRM_MODESET_LOCK_=
ALL_END" requires 3 arguments, but only 2 given
>   434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
>       |                                   ^
> In file included from include/drm/drm_crtc.h:36,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/qxl/qxl_display.c:29:
> include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END=
" defined here
>   194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
>       |=20
> drivers/gpu/drm/qxl/qxl_display.c:434:2: error: 'DRM_MODESET_LOCK_ALL_END=
' undeclared (first use in this function)
>   434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:411:2: error: label 'modeset_lock_fail'=
 used but not defined
>   411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INT=
ERRUPTIBLE, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/drm/drm_crtc.h:36,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/qxl/qxl_display.c:29:
> include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry'=
 defined but not used [-Wunused-label]
>   170 | modeset_lock_retry:       \
>       | ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/qxl/qxl_display.c:411:2: note: in expansion of macro 'DRM=
_MODESET_LOCK_ALL_BEGIN'
>   411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INT=
ERRUPTIBLE, ret);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")
>=20
> interacting with commit
>=20
>   77ef38574beb ("drm/modeset-lock: Take the modeset BKL for legacy driver=
s")
>=20
> from the drm-misc-fixes tree.
>=20
> drivers/gpu/drm/qxl/qxl_display.c manages to include
> drm/drm_modeset_lock.h by some indirect route, but fails to have
> drm/drm_drv.h similarly included.  In fact, drm/drm_modeset_lock.h should
> have included drm/drm_drv.h since it uses things declared there, and
> drivers/gpu/drm/qxl/qxl_display.c should include drm/drm_modeset_lock.h
> similarly.
>=20
> I have added the following hack patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 26 Aug 2020 10:40:18 +1000
> Subject: [PATCH] fix interaction with drm-misc-fix commit
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_=
display.c
> index fa79688013b7..6063f3a15329 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -26,6 +26,7 @@
>  #include <linux/crc32.h>
>  #include <linux/delay.h>
> =20
> +#include <drm/drm_drv.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct q=
xl_device *qdev)
> =20
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE,=
 ret);
>  	qxl_update_offset_props(qdev);
> -	DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  	if (!drm_helper_hpd_irq_event(dev)) {
>  		/* notify that the monitor configuration changed, to
>  		   adjust at the arbitrary resolution */
> @@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_f=
ramebuffer *fb,
>  			  clips, num_clips, inc, 0);
> =20
>  out_lock_end:
> -	DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
> =20
>  	return 0;
>  }
> --=20
> 2.28.0

This is now a build failure in the drm tree merg.  I have added the
above hack to the merge of the drm tree today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YizQk8yowqeEyhmG.EVW9OP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9PDDAACgkQAVBC80lX
0GwWdQgAoEm/nwWRUBzrY04JBxZ/dU6Tyuaalu0tAfgNKW5ve0o+yoPr/wVNxDM5
hX94A3NBEErFIfrm2DSXLWhGmbO4MTYqxJVxFE9ZffZgiabFuQNpQXTVNYApFsuU
4Wo+7W02qcSFNP4wUEOpa45kHiBgdfbMhkc6nA7kepgDx6n1BWuwEhuv9gBhrnfu
hov8SK949yEdeWfkdLFkSv0LTsBVWjTHqMJT/qLBM/JCJooX2wIFcL2TMcKIO3qE
3lrUnoC0LIQsfLDXnhF8uaZvg3dwTRmc3YARO/iaCJGo0RIFIXVdH8JayAg9Dhk2
ei7kweWMeYAB9xeho1VqxUQC1vf3NQ==
=qzdE
-----END PGP SIGNATURE-----

--Sig_/YizQk8yowqeEyhmG.EVW9OP--

--===============1463785593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1463785593==--
