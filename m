Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C2A6877D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21C10E4E4;
	Wed, 19 Mar 2025 09:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MSgLBUVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502B10E4E4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1742375268;
 bh=qP/XoP4fN6Ss9CghqYcT+VLJmt1QhOCkgi0pnLbDRmQ=;
 h=Date:From:To:Cc:Subject:From;
 b=MSgLBUVF/Zp62VVTzmRnprI7ZQNPLTYzsVUVE0CwfdzpNRGAy6YSDhtIEbg+BfCAF
 dt37zcc165NvZX9ZV7rEaLiADE0OntpxZBytJUMoXoWV1rv530wnUG8JVR/F2vIy9X
 k/iSZeNTAzz54B2VMNzqQcFdITZLfrRYYZq3SvKA54ElVCYgmwZHMSh2ZwI+tP+UKF
 Bp9cuChgFSrTM63Kwz5Npac3gHjo0oKQADOzGZktxOxbdVSJNQzChQCNz0PffCcQko
 s9ZONoU6+vM4m8glQx+i1smPjEOFHMUyt6qpZslNnU+dGN5przjBgQiEsOHtB9ih0m
 n6vIEW/5plLSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHjXg1dM8z4x21;
 Wed, 19 Mar 2025 20:07:46 +1100 (AEDT)
Date: Wed, 19 Mar 2025 20:07:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, DRI <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250319180556.4475584f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G7IqSOMy=6nrw+DRW7jzKU_";
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

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0053]: method `probe` has an incompatible type for trait
  --> drivers/gpu/nova-core/driver.rs:30:20
   |
30 |     fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<P=
in<KBox<Self>>> {
   |                    ^^^^^^^^^^^^^^^^ types differ in mutability
   |
   =3D note: expected signature `fn(&kernel::pci::Device<Core>, &()) -> cor=
e::result::Result<_, _>`
              found signature `fn(&mut kernel::pci::Device<kernel::device::=
Normal>, &()) -> core::result::Result<_, _>`
help: change the parameter type to match the trait
   |
30 |     fn probe(pdev: &kernel::pci::Device<Core>, _info: &Self::IdInfo) -=
> Result<Pin<KBox<Self>>> {
   |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~

error[E0599]: no method named `enable_device_mem` found for mutable referen=
ce `&mut kernel::pci::Device` in the current scope
  --> drivers/gpu/nova-core/driver.rs:33:14
   |
33 |         pdev.enable_device_mem()?;
   |              ^^^^^^^^^^^^^^^^^ method not found in `&mut Device`

error[E0599]: no method named `set_master` found for mutable reference `&mu=
t kernel::pci::Device` in the current scope
  --> drivers/gpu/nova-core/driver.rs:34:14
   |
34 |         pdev.set_master();
   |              ^^^^^^^^^^ method not found in `&mut Device`

error: aborting due to 3 previous errors

Some errors have detailed explanations: E0053, E0599.
For more information about an error, try `rustc --explain E0053`.

Presumably caused by commit

  7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")

interacting with commit

  54e6baf123fd ("gpu: nova-core: add initial driver stub")

from the drm tree.

I have no idea how to fix this, so I have just used the driver-core tree
from next-20250318 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaiWIACgkQAVBC80lX
0Gzd5gf/cPm1IsUrN9ZA6Ow8dkPK3YSpp/aU4GD2ktEHnR+oKEI3ssr/YcrZFdLG
aE1erAP1mVjuw99ke1+2ttFPoSULP1BHPOGpXCzXY1DdhGDIz0qYXYsAZPD/7Ru0
RKTxk4Vl5t+9plq1dRirkkwMjGOSGSs3J6PVZPwNbJgF/PtRUEUntij0/iTXGFjx
oYPudEWoO1cNqzhdd7/4ZIJCufEyEuvduKONJvQBXM6aboL+yTBIxnPPMDXdF3Zg
EKrwyuTmn7Tln9NkK+ACVtBF6496t4SdK8bQryxwuomQ98tQmCUd/vTS4KP2tkQM
b6O2/Hpn/knL9WCUuVchof9khsSJFA==
=z0xT
-----END PGP SIGNATURE-----

--Sig_/G7IqSOMy=6nrw+DRW7jzKU_--
