Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F528CE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 00:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689C36E06E;
	Thu, 23 May 2019 22:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DC46E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 22:29:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45941Q1cSPz9sBr;
 Fri, 24 May 2019 08:29:29 +1000 (AEST)
Date: Fri, 24 May 2019 08:29:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-fixes tree
Message-ID: <20190524082926.6e1a7d8f@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558650571;
 bh=oZ+Y4Oj9nlfaxg+9a4yhZHeUnYqYAt63cgwtgI91vS0=;
 h=Date:From:To:Cc:Subject:From;
 b=KnktJHetT3IepuRUUS14pUn3nwEyKmleQnnr37irUY8y32u0aQQiIh4o5/oVTuyh0
 oTqkISOqntV6hscMwoWTDUTLk+F2VpQGy1FJT7KRapF4wfKKx5V3zhaPyLwPYtbY+f
 q61LWFQ13oAtfXv0l5LXT2sPAirPEHIFXG5eBIU9ZtJpFgbFJkJUXHo0HSb3ykQkGz
 Nqta7ZZSGaIR4Buo3UoocOYIFSLZ3ivnqscB/2exCa3r10JYoC1yYdU1inKONZfZoq
 yMEt4vG8bA+FzvumnhNIYt8doHwhH82l1cXgND9Xwjfp5YKs74HIV3Nj94jCYXmoRh
 rYb7tcTWX7BoA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0300087361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0300087361==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3/vL9jhrSoegPrs8wupWN73"; protocol="application/pgp-signature"

--Sig_/3/vL9jhrSoegPrs8wupWN73
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'l=
oad_dmcu_fw':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: error: i=
mplicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASICREV=
_IS_VEGA12_P'? [-Werror=3Dimplicit-function-declaration]
   if (ASICREV_IS_PICASSO(adev->external_rev_id))
       ^~~~~~~~~~~~~~~~~~
       ASICREV_IS_VEGA12_P

Caused by commit

  55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3/vL9jhrSoegPrs8wupWN73
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznHsYACgkQAVBC80lX
0Gxiqgf/TX+jNEffQfpsZ0K5DEdyod6S5jH6C3F8/4luruSvyxWOVsJkfo3n7+eY
G3FgBMxNkwfk/gNzHujp7JwZ1cyONguMQhUd/MgTWdLtu8tj0sELLLxrLecDJtJA
ru1k5stROtvFEFJBt7ttqyQyqUQTCIH29WPrmnRDOlspkhVC9nnY1EaHhIjGJZkq
4Z1AmffQnv4BI0riIg+6EDgM8GlzkopAqn0JkSLXqXrlYyN7o9SyNoh/JsunmF02
+ySAqwq7WO3aAxGUAx24aO8MCJbFw6ZfwAZk+tF6h/28sV0Mkqs9p91uFmxFMqB/
d00p8y1eDXWFDmkJpd+l+HIXXMEP7w==
=XBe4
-----END PGP SIGNATURE-----

--Sig_/3/vL9jhrSoegPrs8wupWN73--

--===============0300087361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0300087361==--
