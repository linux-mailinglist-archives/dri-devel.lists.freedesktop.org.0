Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902DBB3D85
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846E10E7C1;
	Thu,  2 Oct 2025 12:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V9Y2n59o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BA310E7C1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18A7C40910;
 Thu,  2 Oct 2025 12:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455DFC4CEF4;
 Thu,  2 Oct 2025 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759406751;
 bh=82GXG5deRe+qBSsXfxgmCHbJTIL+lairHB0bUXENPB4=;
 h=Date:From:To:Cc:Subject:From;
 b=V9Y2n59omsaROd4uoo1LbBkjSTMRYMlBD2PdpG74zXUyGKiXCUK3N+KLrxUo18gy7
 gUaxII/mOuCrsCZ9haXc4WZGA7xfeseLjlQcSJuVKaXuDt8GWdXL2L3KwsCSaoE49v
 rbKCjWC06GpE3ar06dVnD6Qt4INcs95LlPDuzGYzE8RT+LQ+OvoWSJv+1USBNU+csG
 TDdXE8s1iyVfKt/lC/Yh/OKXXlxxjx2gue77buABuirw5+qyJMwKVzsrd5I4BcRuTN
 eWdOSvA+eODU5fsFOZuvshXEr7sb9DLHr6MtN7rMRcULxIsyr8h6qART50m+5C/1uR
 JiUnB+ShkcW0Q==
Date: Thu, 2 Oct 2025 13:05:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Vitaly Wool <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aN5qmhC9tUOCNjed@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rExuMeJDLXkDakzC"
Content-Disposition: inline
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


--rExuMeJDLXkDakzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  rust/kernel/alloc/allocator.rs

between commit:

  1b1a946dc2b53 ("rust: alloc: specify the minimum alignment of each alloca=
tor")

=66rom the origin tree and commits:

  1738796994a43 ("rust: support large alignments in allocations")
  8e92c9902ff11 ("rust: alloc: vmalloc: implement Vmalloc::to_page()")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/alloc/allocator.rs
index 6426ba54cf98d,84ee7e9d7b0eb..0000000000000
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@@ -13,11 -13,14 +13,15 @@@ use core::alloc::Layout
  use core::ptr;
  use core::ptr::NonNull;
 =20
 -use crate::alloc::{AllocError, Allocator};
 +use crate::alloc::{AllocError, Allocator, NumaNode};
  use crate::bindings;
+ use crate::page;
 -use crate::pr_warn;
 +
 +const ARCH_KMALLOC_MINALIGN: usize =3D bindings::ARCH_KMALLOC_MINALIGN;
 =20
+ mod iter;
+ pub use self::iter::VmallocPageIter;
+=20
  /// The contiguous kernel allocator.
  ///
  /// `Kmalloc` is typically used for physically contiguous allocations up =
to page size, but also

--rExuMeJDLXkDakzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeapkACgkQJNaLcl1U
h9DfQwgAhvJY6cUn5+Hq+wjc2X0nQf5QVqqYwPIHFaOJbAXMTGT7XVFDMLThhFVQ
0rXUfChouzlNJRpPHXDGJaMxDSMnUilWPypK58KQUTpbgLtxAWk681FjmRzb+ZIJ
PD+XgzOiZYzuJHqkunTrKt5AUdAYLJ9SVOZfm1lpBiE79BqZ077VYAeC1qZs+/yK
2F42OPvhw29Z686BQEGKE1ButjQsIqVk8rN4fyk5SfEVJQMdPZlf924+T9w40rOX
99sBYJYpPcpArrOYcoXg7McoGmm4tFmm04QBFBPDsGKTGXyFPy7mPtg2XEhfr7sx
PqgFtgbIk7oPIroo0oXWXQ1JvTvojg==
=XH26
-----END PGP SIGNATURE-----

--rExuMeJDLXkDakzC--
