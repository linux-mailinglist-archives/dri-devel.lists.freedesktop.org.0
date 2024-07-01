Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5691DB2E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7C10E36B;
	Mon,  1 Jul 2024 09:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WLxj+aOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC2E10E36B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1719825201;
 bh=pntqiERvY5XH4mZl9gDPqfPzur6ofOBurt6MgCHU+uc=;
 h=Date:From:To:Cc:Subject:From;
 b=WLxj+aOz6Z8ovaI9h5E6jIyilGP7PfeuwbHdrBxAn3FqmBmQtPKYudzvhPU8LxpA6
 dn5mkW16GhNL2WkBATgqLrsvGigyI4M9dz9JaLEYYvtQx3KmuizlWrrLUlLMMcP9up
 nMwOnb6Eh6wziqK4+eMKoh0xmzPTEQeDWNqYumDJiOeeUWTWpnPeep5C1gBCZFI+G5
 UsCy65Sm1dwIji2Nwm+igUauM0VgwXfaFmmgpvoPPxy/5a2HdDVfMhz4DvRE8bf/87
 FIznBh05NGyiG58iveGEGAPaPiL2xOvO9O4EaZoQGa1z7vN9SIWnB9cOxMSA4DyKBk
 BGf5J3OHtm9ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCL1X0hnVz4wxs;
 Mon,  1 Jul 2024 19:13:20 +1000 (AEST)
Date: Mon, 1 Jul 2024 19:13:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20240701191319.087b227e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B/525Pd9aGGHMxX7KNdXK6F";
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

--Sig_/B/525Pd9aGGHMxX7KNdXK6F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from arch/powerpc/include/asm/mmu.h:144,
                 from arch/powerpc/include/asm/paca.h:18,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/dma-mapping.h:8,
                 from drivers/gpu/drm/omapdrm/omap_gem.c:7:
drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigne=
d int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0=
' [-Werror=3Doverflow]
   25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro 'PAG=
E_SIZE'
  758 |                                          PAGE_SIZE);
      |                                          ^~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigne=
d int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0=
' [-Werror=3Doverflow]
   25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro 'PA=
GE_SIZE'
 1504 |                         block =3D tiler_reserve_2d(fmts[i], w, h, P=
AGE_SIZE);
      |                                                                 ^~~=
~~~~~~
cc1: all warnings being treated as errors

Exposed by commit

  dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")

PowerPC 64 bit uses 64k pages.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/B/525Pd9aGGHMxX7KNdXK6F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCcy8ACgkQAVBC80lX
0GyEwQgAoOM0TkYVu4rVlwWtEHxMyN+WlQS3JRLPXW/xtjFnPJmZM2Mh6rXRqVxE
eqizwXjGj5tp1mxEbV3D4DAvEFXv3+4z6WRfdZVVvDdiM8QfFhy0ilGoJRdSKAcR
8Xpi41aQcLjuFMux1rJ6JKdFnQGQKoSHqBP4isEmyQwLIfxV+pR3d9kGAmtoFWLU
/5yuRoeIWA9AkXTm9RIxAAeEcIwcqCJSmDSe1hjfuH0ZsbT4VmjKB+DIc0Ho1jLk
a1pGL0fKvnvYqMGJX2sWpf70Ecrn1oCOHHs5C3oyqPv/p2ahc8l0HUhoPOkxsfVI
7AKJ29wyLnsRbVQBQZ6m/dpiYxh3Sw==
=OM/o
-----END PGP SIGNATURE-----

--Sig_/B/525Pd9aGGHMxX7KNdXK6F--
