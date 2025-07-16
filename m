Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EDEB07307
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DA310E65A;
	Wed, 16 Jul 2025 10:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B8VovUOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1853210E65A;
 Wed, 16 Jul 2025 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752660901;
 bh=vfFNFk28QfT9KpRR3twKaJ6fyuRuP6P64ejSwvxbXsQ=;
 h=Date:From:To:Cc:Subject:From;
 b=B8VovUOJKsX84IYYfcYscLfoQdsJABv2iwY6FZ5y0VwK6gs8HHtpV9xNbmdgSfmoA
 fBCgTn//1syjkjicX9tmyFO6EEycJVzp5oDA+5AfKS9YuK9ut5f4v/VWdwOu6Z+SR8
 qMWHSsShapUvTUkHoCh5/zbUBmA2vnu5ymGQphX7hGYkL2WTbYASpruuIbzsrNKZJD
 f8uUwoBkaDgFVRhJCESd16d4tO5ec3lc7H5eQQ2gB9t1k7up6qHrMCH+vKiVrYCeO/
 FgeLk+FXhJWSdSXROWAbSA6fuHbnQ1VW24oBrSunDpsDEGfc2+PTTfmbZGemO02V6t
 MEjxMAEPAsZDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhsPK1WPhz4wbn;
 Wed, 16 Jul 2025 20:15:01 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:16:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the drm-misc tree
Message-ID: <20250716201656.4f0ea8d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/axF9tQlUxjmD/o3e4O5X_DP";
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

--Sig_/axF9tQlUxjmD/o3e4O5X_DP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/drm/gem/mod.rs

between commit:

  917b10d90990 ("drm: rust: rename as_ref() to from_raw() for drm construct=
ors")

from the drm-misc tree and commit:

  8802e1684378 ("rust: types: add Opaque::cast_from")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/drm/gem/mod.rs
index a24c9a2fc201,6f914ae0a5aa..000000000000
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@@ -124,12 -124,10 +124,10 @@@ impl<T: DriverObject> IntoGEMObject fo
          self.obj.get()
      }
 =20
 -    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a =
Self {
 +    unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'=
a Self {
-         let self_ptr: *mut Opaque<bindings::drm_gem_object> =3D self_ptr.=
cast();
-=20
          // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the sa=
fety contract of this
          // function
-         unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
+         unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), Obje=
ct<T>, obj) }
      }
  }
 =20

--Sig_/axF9tQlUxjmD/o3e4O5X_DP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3fBgACgkQAVBC80lX
0Gx0jAf9G/9ea6ueWCOlqmAoJhA4+jh+eVhFw5JBFTWSWS48AP8VlKf1JhPaj7hj
Zhmw6NX/w7tM6Cr/YlQ/tSinsebhRyH2bs6D30lBenFtQprqSqivc2PgK+p/HnsW
ZYW+ECdBNC87Wm6+Jxz0OpNJdhkcF3SAnfZ3hHYVROsN5Ds/CS+7Ca09JkMekaF6
X1B3Utv4RfOZRXjlF2Nag2J9j5FginurZ1YeOnQ+muN0/uDEZ0CWRU3pnSsxoIj1
+Fc/mgV/CrsOm5CJtBY8nJwkA69HiXSNjcF7kE1pAcF//59mrIMGGqYoIFRUd/Pu
glNVtOCnq+dGTneBgwFkYKStTMVgUA==
=ncWP
-----END PGP SIGNATURE-----

--Sig_/axF9tQlUxjmD/o3e4O5X_DP--
