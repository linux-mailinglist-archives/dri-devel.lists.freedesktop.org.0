Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577EA5BBDA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4CD10E543;
	Tue, 11 Mar 2025 09:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="beWikhIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3DD10E545
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741684649;
 bh=+7rgICWy4cnzwX384jJ8pJ+8ukLphTwXiqmF9tmuYq0=;
 h=Date:From:To:Cc:Subject:From;
 b=beWikhIvVfDpgOHMSRKU+GaukBeI+pGQvSxaxfWyKXfTtM6G4uJh4535HoKathiRY
 jOaLixcdE/RtxGl8W/6hSbpoj3W4qgZOyPjXSScwJzVlcPHywi0uqlruAwNnunGOIE
 XU4Ua0PBlBmcDnlD3BX8+xT+JasPZ/wZr8+8rxoQn9+zW490Z1rmIXMxge7uDUkhr6
 JaCGwkZsABkHpI1e33srrA1rF72uvkmxR1YEOF0fmK2i+DWkapNVHDx3LmaC/wJD+C
 Jf/lm1wEIeLOjdo2ufN+GK+BuwkQHv/iMAfN06XBv1lZXkTxWmqp3v44HLpnnmTTHB
 CVMEpAf13Ee+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBp7X62VWz4x3p;
 Tue, 11 Mar 2025 20:17:27 +1100 (AEDT)
Date: Tue, 11 Mar 2025 20:17:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Jocelyn Falempe
 <jfalempe@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the drm tree
Message-ID: <20250311201726.3f45cc67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WRC61WYquP.DU.LnirxUgyK";
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

--Sig_/WRC61WYquP.DU.LnirxUgyK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/gpu/drm/drm_panic_qr.rs

between commit:

  dbed4a797e00 ("drm/panic: Better binary encoding in QR code")

from the drm tree and commit:

  fc2f191f850d ("panic_qr: use new #[export] macro")

from the rust tree.

I fixed it up (I guess - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_panic_qr.rs
index 5d21f6d10bcb,ecd87e8ffe05..000000000000
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@@ -27,7 -26,8 +27,7 @@@
  //! * <https://github.com/erwanvivien/fast_qr>
  //! * <https://github.com/bjguillot/qr>
 =20
- use kernel::str::CStr;
 -use core::cmp;
+ use kernel::{prelude::*, str::CStr};
 =20
  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
  struct Version(usize);

--Sig_/WRC61WYquP.DU.LnirxUgyK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfP/6YACgkQAVBC80lX
0GwUWAf/cQViY4ylwkS/1xzQYSshSANM8Mdpc2O/hl93LFKTqI8CF5tz1s3Dnsxv
2Ds3e0pQED2VnOw2OAStVpKgJg/Mq48TCIiCpXV/5LYZ+/3pcChKI1X67KfXo6Cc
ZP9DPeJ6UoVQytvYSzzzAbvPm/HUHlIEkygRcTFvS/VhzsdnQ20w2JtcCqWGkv5D
P05bDe2xfremGB0zndwq8/GgQImITGSfQXaKy9htzlDqHubY270OYZlvqM/hYYbx
J9z/Dx4nPQnTQ5QtMKeVXPkYN+uIU235nebW+hQznrn8BV85Z026T9nuLROYwWmX
KVEgdPK6N7NJeHXiOqM5YO4JpIMfSg==
=O7nl
-----END PGP SIGNATURE-----

--Sig_/WRC61WYquP.DU.LnirxUgyK--
