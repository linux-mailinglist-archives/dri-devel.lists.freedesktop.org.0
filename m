Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DFF13391D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 03:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B679F6E160;
	Wed,  8 Jan 2020 02:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8CF6E160;
 Wed,  8 Jan 2020 02:28:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47stTB5bfQz9sPK;
 Wed,  8 Jan 2020 13:28:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578450495;
 bh=qIPTOKRKoZocSMYk/jePlbzyF7dkyjJs35dUjd+61F8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YH8jqhW41KHQOt4wqZod7LO09Ven0wXe+mlCighTRdYsdNp4T3oKPxE9uXMWo2tz/
 f6EQYKx12FYL1kIMhriH59VVUVzKyvWnp1YsMmz51S2ep6YI9v3XJiQLpM5bPQLV6y
 RUwSL72Cp9USyqbz4kOJCav+pGteyEelxb1b3zFjjR64Cz88qpsCUv7GCTZt+FWi4o
 5ufxVfFLb0uhD3X2znzGQiEQWNS7V/S/wjQGdfCT8bjQkf7IJDtNJ5n1UcHN0By7PH
 /gcsEAAMfePH4PeJTWfL1Mgy+e7g2pwgCFbs7eJSBq3RXeOi8xRbjOdY9wi4qNmFh8
 P81PcXlGEIxYA==
Date: Wed, 8 Jan 2020 13:28:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-intel-fixes tree
Message-ID: <20200108132814.2b170270@canb.auug.org.au>
In-Reply-To: <20200108120450.33ec0fdd@canb.auug.org.au>
References: <20200108120450.33ec0fdd@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============0998833030=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0998833030==
Content-Type: multipart/signed; boundary="Sig_/U5JCEU3ui9U8iGqVoROUqCR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U5JCEU3ui9U8iGqVoROUqCR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jan 2020 12:04:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
>  -		hw_flags =3D 0;
>  +		/* For resource streamer on HSW+ and power context elsewhere */
>  +		BUILD_BUG_ON(HSW_MI_RS_SAVE_STATE_EN !=3D MI_SAVE_EXT_STATE_EN);
>  +		BUILD_BUG_ON(HSW_MI_RS_RESTORE_STATE_EN !=3D MI_RESTORE_EXT_STATE_EN);
>  +
>  +		flags =3D MI_SAVE_EXT_STATE_EN | MI_MM_SPACE_GTT;
> - 		if (!i915_gem_context_is_kernel(rq->gem_context))
> + 		if (!test_bit(CONTEXT_VALID_BIT, &ce->flags))

I see from the drm-intel tree that this should have not have the '!'.
I have fixed up my resolution for tomorrow (and it has been fixed for
today's linux-next in the merge of the drm-intel tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/U5JCEU3ui9U8iGqVoROUqCR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4VPj4ACgkQAVBC80lX
0Gzn/Af/artJrwNGLOouRdytZN+URVKTBfaZRujVoEZSz0XEBUTpnEa/hFFeYfFI
ZNxPFB58dCUDdTkuJcoouWjfz+4a+JrO0B1h7yMXPHzXrRtyVQKRpOEFn3yXlF8l
R5Q5Pp95lhOBgzcbU2tQsBRGc4Df2wwdL4VNo+dFFJw5xyuv/4vlSCnxHqJhGl6a
B6ZaFFEVqpEHAmAcG2zrM29jCaHQnxUmRWjQSb+OzoH2ol29IZmnb+S0Qel1ueoF
qmDVvj56+aKp7pcjbd+egfzSbhtMI6ZV6BX6lrBRmW4Dh1lW3km0ohNzay8hVu0g
WvlOJl/9TZoOk743px9IMC5NN240dg==
=5BoX
-----END PGP SIGNATURE-----

--Sig_/U5JCEU3ui9U8iGqVoROUqCR--

--===============0998833030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0998833030==--
