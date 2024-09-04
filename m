Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75096AEC9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 04:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23810E13B;
	Wed,  4 Sep 2024 02:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vz9NeF1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B491710E13B;
 Wed,  4 Sep 2024 02:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1725418328;
 bh=NzWDHpGMK1Y5E0oz7UeF25ek17MMwteEO3aXp+BCVGQ=;
 h=Date:From:To:Cc:Subject:From;
 b=Vz9NeF1ka9bu3HoIhkFGPTQNuBKEjakXrVKpsicmqd57gN5wIGM/mUmVa5QMXxm9k
 7vn6Ib9dLX981y5Jx+XizpScPtZUswAQzPY0ZNGPfrHwQZEsQCMs1lIw0sqrbbRElT
 SsFVRPaWihUmUKTzrpkOMCo2hlyDiO0TY+GTuqKwGudZyGJy0DnSbOhWSvB+ExtOF3
 9z30dbr1Np7xWqvlxMifqSibzmN1ZJGGPf/zvHaWVU+ArtvKDhWy/dabbnt2E6YLD2
 iAVd5GGSEpXluRcLB6GsfrtZO9EhQ2IYed0gC6uCRqlzNaOYAwwAEsHZC0BiQgJok+
 uN6XxqMxINI5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz6Tg3ydkz4wb7;
 Wed,  4 Sep 2024 12:52:06 +1000 (AEST)
Date: Wed, 4 Sep 2024 12:52:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Robert Foss <rfoss@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240904125206.6708daff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tY=/3VqKgcvxgAczf1kyZYF";
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

--Sig_/tY=/3VqKgcvxgAczf1kyZYF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_enable':
drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of fun=
ction 'gpiod_set_value_cansleep' [-Wimplicit-function-declaration]
   31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_probe':
drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of fu=
nction 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional=
'? [-Wimplicit-function-declaration]
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~
      |                          devm_regulator_get_optional
drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: 'GPIOD_OUT_LOW' undeclared=
 (first use in this function)
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                                                                 ^~~=
~~~~~~~~~~
drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier =
is reported only once for each function it appears in

Caused by commit

  a15710027afb ("drm/bridge: add support for TI TDP158")

I have used the drm-misc tree from next-20240903 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tY=/3VqKgcvxgAczf1kyZYF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXy1YACgkQAVBC80lX
0GwPLAf/YK0VC0D4tm5AcYS+9x10tmjpiL72Yckx9Iww5RIpOL8aT4NLnS7bvZ7u
UoXUDuS5JRKsGz6ut0qYYo+ppNmhfHfrtiLnWpcsEF9vTAPLRexw3lKqG4LCaheU
jt0j2G11VfCi+qosaPDjy1QoTYyyCG21HngnAQabMtNZzgamt8PLY+hQd4pAtJwt
IakY/Xc/vcJBaHxdlxtmKOAN0JDbDVw6GhDNPsl/4NGD8cxxU4cbpGsj6EYR/uS8
qQ9Q59XmAF55XHTv7+8oCSLbLkiJq51uzNplF1KhY+6jPKeUdjvcIuG5O+OVKXBX
XpeGatv2OW5Z8XEDfxpttOt4hrjuZQ==
=FIp0
-----END PGP SIGNATURE-----

--Sig_/tY=/3VqKgcvxgAczf1kyZYF--
