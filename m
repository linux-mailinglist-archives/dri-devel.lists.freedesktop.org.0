Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA52D20C8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 03:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB466E93E;
	Tue,  8 Dec 2020 02:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1046E93E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 02:27:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqkcC1YMnz9sVl;
 Tue,  8 Dec 2020 13:27:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607394476;
 bh=Gdnq684lFz9atgY1eOCUXr2MAA6CAdhLY3wRaXZ8zAQ=;
 h=Date:From:To:Cc:Subject:From;
 b=hZbvXxLnnkungkLgzMGYvh+9zf8f2Ys0Y3qZNCbE2l9kvCv+MINgu+w+HYapZuhdM
 QyghCZmmZoWFBOPERilNlXqCY3qAc042jjFvHcCVcj4gKQk42puS+k5O5QmXOo4Hst
 aDedSVwd4REUhOg7y3g/SV2LErlO8UI7mxIhtQUIKGGdJwyUvebVQ3DMfyTqafhEdy
 17i1xUJuspPAvJ1HzTLkK84XKnLtAxBIUwO7qzDR7gkIbsnDBzKxIIb0eFsfYIoUC3
 N1Sy3KgKBvYkOkVEjEdmPggAPhCVSm5GHvbsQlOjG2Rt453KYFg0Rl7ouM5bSVVMj/
 uOvO8CsJbkpGQ==
Date: Tue, 8 Dec 2020 13:27:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>
Content-Type: multipart/mixed; boundary="===============1152996739=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1152996739==
Content-Type: multipart/signed; boundary="Sig_/wlM0Vl045sL0mWGkCn0hMk+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wlM0Vl045sL0mWGkCn0hMk+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/vga/vga_switcheroo.c

between commit:

  99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")

from the pci tree and commit:

  9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_swit=
cheroo_runtime_resume")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/vga/vga_switcheroo.c
index 8843b078ad4e,1401fd52f37a..000000000000
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@@ -1039,12 -1038,8 +1038,8 @@@ static int vga_switcheroo_runtime_resum
  	mutex_lock(&vgasr_mutex);
  	vga_switcheroo_power_switch(pdev, VGA_SWITCHEROO_ON);
  	mutex_unlock(&vgasr_mutex);
 -	pci_wakeup_bus(pdev->bus);
 +	pci_resume_bus(pdev->bus);
- 	ret =3D dev->bus->pm->runtime_resume(dev);
- 	if (ret)
- 		return ret;
-=20
- 	return 0;
+ 	return dev->bus->pm->runtime_resume(dev);
  }
 =20
  /**

--Sig_/wlM0Vl045sL0mWGkCn0hMk+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/O5KoACgkQAVBC80lX
0GyHNwgAjCac81ZtbZtstu/Gjqw5/GfHTHKRcW4TbLX4TXUgLFFkYKeXljFP4cve
q5CYQHeQo8Kh6fl3pbj0934BYUZcDSuFQgm5r7MKCAURB0Qkp5xTrKyZjnZu3oUO
q4qxK/Ljhzqu9sqTcMHOB8iDweUkPYn0BnYx/+W/gr8++rPlnNxjMUY8W+Eii1hW
fe9T6K0YuA2xpE0pTb97Hn4DgWQOv1IPiPAjoY//KxeVedV3VZuNPeNCKG/xefM6
ArZvkW1HhZk4rZsPzAyvudQbW4O9Jc3o99EdmRDos1jv6GjI70wUWIYBMre1//zh
BQkkw4LerfwLQByhsI3owyNrWIaiMQ==
=r5+o
-----END PGP SIGNATURE-----

--Sig_/wlM0Vl045sL0mWGkCn0hMk+--

--===============1152996739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1152996739==--
