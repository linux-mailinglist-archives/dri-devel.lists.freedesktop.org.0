Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C502B2D154
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 03:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1BE10E236;
	Wed, 20 Aug 2025 01:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yl7iJrHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A010E235;
 Wed, 20 Aug 2025 01:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1755652906;
 bh=Cax4wsit9vDfDJ2iuUp1ECYmVzYSecXd37uVDPRDpBQ=;
 h=Date:From:To:Cc:Subject:From;
 b=Yl7iJrHcVMSN7pKJYQCxvuYTYI2uAh6cMvOq3cRTI2j90MpEN/ZfIW90FX+Ja7OuN
 HYtOUbmudABUn8xCqifqWQwAgV6XKR0rRjvRXgr2Kx8fnKU4fWKlwFbdxGKrlVNfbS
 wbSuv2LtgIToIEeSIFE4U4W6MUMwtvxmZI6wMmnXsE6vKIvu/xnR7t6a/vUW1uLNrg
 yysPfHDLoY5BMaiRu6fXRj1rlRpTcc8FXQrLe00fu4IuQXZybSw63Cy02RpPIRF/oD
 DiWUP81na6yb1T9/vuIl4rX8NBZ5AzYlOALmA4ftRwgj/VESHF0sAxlrSh6YB4h+QG
 EkhnLxrb+QzEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c67vt1Ltyz4w2K;
 Wed, 20 Aug 2025 11:21:46 +1000 (AEST)
Date: Wed, 20 Aug 2025 11:21:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Beata Michalska <beata.michalska@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20250820112144.43714c90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/87Z0/l_jCzW6qIQhqxZCqCL";
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

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/nova/file.rs

between commit:

  db2e7bcee11c ("drm: nova-drm: fix 32-bit arm build")

from the drm-misc-fixes tree and commit:

  94febfb5bcfb ("rust: drm: Drop the use of Opaque for ioctl arguments")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/nova/file.rs
index 4fe62cf98a23,7e7d4e2de2fb..000000000000
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@@ -39,8 -36,7 +36,8 @@@ impl File=20
              _ =3D> return Err(EINVAL),
          };
 =20
 -        getparam.value =3D value;
 +        #[allow(clippy::useless_conversion)]
-         getparam.set_value(value.into());
++        getparam.value =3D value.into();
 =20
          Ok(0)
      }

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilIygACgkQAVBC80lX
0GwchQf+M0lvHfwjGjfP6fpmNDnpbu+t+DHfUtBGIANf3KbiJW+/D/aHMmMil/I8
gATE4939NH5aVAe+LZ1BzF6KcPJN0FfjBvCg7SIIcyyzPgGLv6jVt2W8vCo4R0Ma
/xD5jNVLCa/jnUxDFz53SaAvqU+C8meNWcuYNDSvFEoUf1FdPQ0JL0D1Xwo8bWuz
OvxVbYnAl0f2SwefYCo5HRCDPnDedioDux0VPzwMIsW2WWbljs5lGSnt8tZpINxc
FO8mOKO1YK/YzvS90YKOsp+vnoqG2LWKLIg5GtsgHuzAGnbVdN1KdwNkbBYS+ERc
CQk0uWyqKHiSmj834aBzOOaEHGIxKg==
=a+Tu
-----END PGP SIGNATURE-----

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL--
