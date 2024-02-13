Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F48524FC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 02:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C572D10E380;
	Tue, 13 Feb 2024 01:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A8Uxo6+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1C410E12B;
 Tue, 13 Feb 2024 01:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707786253;
 bh=o5Tlbx4aE/Gpku6F/ewBl1HwifS1BiiLHPWkcYc/+es=;
 h=Date:From:To:Cc:Subject:From;
 b=A8Uxo6+ID6vcWIeRXHjyS097+pbzW3PIK5/sJBHSBncpF3pmDwK7qEFN5tniyQhml
 h9o4ZgcdefHlT4N72XruRKnzF66ts/ejMZQfsYz6oCwdwXEWJuljDrTKKN9z8hIkpp
 HPkQS7KZyRoqLbHsbFJQzySflfka+CWYhHXSW58e11CXAxvxPNzQtK1qBm6gPQfzeV
 vaORi25N2/3T6fHkgQ1NDPIkGKvvUEpl9dNgbDo9U7a6uGx3vGIiONqpIYX1jzUwWK
 lcz3buhllt8XYCR6fmrPNeYxFa2WVrmyB2is5IF81FX8Xv1pwNq1s3RxuqM+6+QT5e
 sW4ib29l1nL9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TYjlJ2q6jz4wcl;
 Tue, 13 Feb 2024 12:04:12 +1100 (AEDT)
Date: Tue, 13 Feb 2024 12:04:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240213120410.75c45763@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6SNLxr7Gj4oO+.6T.Mf7CrA";
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

--Sig_/6SNLxr7Gj4oO+.6T.Mf7CrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/xe/xe_guc_submit.c: In function 'simple_error_capture':
drivers/gpu/drm/xe/xe_guc_submit.c:814:48: error: passing argument 1 of 'dr=
m_err_printer' from incompatible pointer type [-Werror=3Dincompatible-point=
er-types]
  814 |         struct drm_printer p =3D drm_err_printer("");
      |                                                ^~
      |                                                |
      |                                                char *
In file included from drivers/gpu/drm/xe/xe_assert.h:11,
                 from drivers/gpu/drm/xe/xe_guc_submit.c:19:
include/drm/drm_print.h:349:69: note: expected 'struct drm_device *' but ar=
gument is of type 'char *'
  349 | static inline struct drm_printer drm_err_printer(struct drm_device =
*drm,
      |                                                  ~~~~~~~~~~~~~~~~~~=
~^~~
drivers/gpu/drm/xe/xe_guc_submit.c:814:32: error: too few arguments to func=
tion 'drm_err_printer'
  814 |         struct drm_printer p =3D drm_err_printer("");
      |                                ^~~~~~~~~~~~~~~
include/drm/drm_print.h:349:34: note: declared here
  349 | static inline struct drm_printer drm_err_printer(struct drm_device =
*drm,
      |                                  ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  5e0c04c8c40b ("drm/print: make drm_err_printer() device specific by using=
 drm_err()")

I have used the drm-misc tree from next-20240209 again today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6SNLxr7Gj4oO+.6T.Mf7CrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXKwAoACgkQAVBC80lX
0Gy6xwf+OZxIVBmEY/rj22JngdZj1fuLWrpqgw7hAF9Krd0UuevXsW9OYC5BbOjg
iQCHdt7epxWxRL6lVYIjfgxDeS3IcitHn+EA/K4FyWEJ+0ZpaIyJuH24N/IKiEqw
EsyYFWSaeYzzLE6z/Z+u/T9J/pXulyHS90cFkqU7zNTKdefyaMZ5NfU8RE+FtQY+
6XR8XQXHSZW87DZ7NsVEWx+IygxF93ayG61q6B0rR8nTmp7eR6mJZ4ZxJgNxMCS2
dksH50v3Jo1Dakw4IP73LY5WnnJXARBUHw80OlBnikD/J4GI8mKEw+emRvcUfVZQ
QpddlqwTobavbULIN1nVd54eZMYlkg==
=gzZk
-----END PGP SIGNATURE-----

--Sig_/6SNLxr7Gj4oO+.6T.Mf7CrA--
