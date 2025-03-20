Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AAA69F78
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 06:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3938410E0FC;
	Thu, 20 Mar 2025 05:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aiQ23o1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7710E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 05:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1742449268;
 bh=om4SfL+rs7yXAMjmCpcR7Chi7f9L0ieNUX8zveSiNcQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aiQ23o1f+jZrqOsK2pg03xEcAhexQrbvHbm3HUgYj7l+LlE6ZOfzdUbfwwztm8TGE
 cln+WZ2uosC9oABcBCbBl32zhvcJhawyyi/dQD6CAY02MXTR9OyVXoRMRCQGPdQOW6
 LqorLZX+qwHZGFSTy7M+CFBFLmv9ATwg8N50EMHPoD/Qn/ugqqRIZQmvhGTN+uBoz8
 Y16cINFUXtgHEBOdiMxHHvzyxTZJE9nQ52KmWfACuFrfuWoeKqM06NA1Yvc0CeCZcK
 KyR2knlBwjyPHsPJvThV2JzOqo7n5ZXWIrZ8pUS1w5mMHopbIUkWRp3k8/SJDe3jdg
 qvXJWoWXmm0vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJDvl6Bbhz4wnp;
 Thu, 20 Mar 2025 16:41:07 +1100 (AEDT)
Date: Thu, 20 Mar 2025 16:41:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250320164107.51f7737e@canb.auug.org.au>
In-Reply-To: <Z9qnl2bxFZ-Q5Al4@pollux>
References: <20250319180556.4475584f@canb.auug.org.au>
 <Z9qnl2bxFZ-Q5Al4@pollux>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o2tDcpD+dduaO+xh.g0XoJL";
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

--Sig_/o2tDcpD+dduaO+xh.g0XoJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Wed, 19 Mar 2025 12:16:39 +0100 Danilo Krummrich <dakr@kernel.org> wrote:
>
> The following diff should fix the below conflict.
>=20
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 63c19f140fbd..a08fb6599267 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::{bindings, c_str, pci, prelude::*};
> +use kernel::{bindings, c_str, device::Core, pci, prelude::*};
> =20
>  use crate::gpu::Gpu;
> =20
> @@ -27,7 +27,7 @@ impl pci::Driver for NovaCore {
>      type IdInfo =3D ();
>      const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> =20
> -    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<P=
in<KBox<Self>>> {
>          dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> =20
>          pdev.enable_device_mem()?;
>=20

I have added that to the merge resolution for the merge of the
driver-core tree today and it works for me.  Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/o2tDcpD+dduaO+xh.g0XoJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfbqnMACgkQAVBC80lX
0Gw0mAf/a/d3kTac8y5zs/ehujge70tzHze+CLi6NpUOXIoVn2FcDV9uHVsskx23
1UaWfCsH+OBjy4u+Dl6CJ+Ch/Wse6C3wAZDR5ORxxIV0AdKKFXgMxlE8uYwAVMrL
QlsEiYNFjmcZMkvFA80EUCY/k7HGyEwapC7ZL8wzGZy7VViDq5wCr5gNxqOYeQQZ
WfOvPqKlNQYXTOVqnGb3XCRNKWyLb58CRNfCtPB17fDvwLNhDua1ohTCh59oJDTf
MZESYCy+d3suDDB81/PDsFpxZBfOwugE3GWAFniRoiH6cF4F9g6CoQ+Yy3nUt76o
RGgE6xGTwuiqfPUONIgkkw4qUXNpAg==
=RqmF
-----END PGP SIGNATURE-----

--Sig_/o2tDcpD+dduaO+xh.g0XoJL--
