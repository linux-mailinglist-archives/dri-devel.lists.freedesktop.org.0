Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B2C80A2B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 14:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86710E117;
	Mon, 24 Nov 2025 13:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b7gfKzuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C582C10E117
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1763989315;
 bh=u6UXAk5VZCjPAVSRrVbWr/3ztRGborJIApr1elBT5PE=;
 h=Date:From:To:Cc:Subject:From;
 b=b7gfKzuoLrnItWAXl/gQXVOXiEVxUEdRUMroUBowuIaXrpEIrtVu7/B1688+s+3CE
 xdNwocVc5pSn3SoN/HmgxT/CK6ytRw1HGbUJ/oD8IIAdxZR6H4dPhCjpqYxPXg+teP
 MfEYYpEsFDSFHU5887hsH0JFAB/YDDUVOV5XI+CISBuMaY5Kpj8HCDXNNsdvqQFJKk
 T0KDUEJ+MnDUlIp++Z3yVzrK8DXD0GYVsqsDXO39JmeSgLuL86NbxAPrZm66gaDQT8
 3Dxz4OD2yV3i8iZUvRBceGF24DKckzkdI8A13o2vilZjo3rHOV2FJ+f7tvfHIDVvHs
 NwiTWFFY1d69w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFQvP0QHbz4w2R;
 Tue, 25 Nov 2025 00:01:52 +1100 (AEDT)
Date: Tue, 25 Nov 2025 00:01:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Dave Airlie <airlied@redhat.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, DRI <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20251125000151.23372279@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1rFUMRySHJGSinYlKIZ1Z.h";
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

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/gpu/drm/i915/gvt/kvmgt.c

between commit:

  69b4d367fff6 ("drm/i915/gvt: Simplify case switch in intel_vgpu_ioctl")

from the drm tree and commits:

  e664067b6035 ("vfio/gvt: Provide a get_region_info op")
  93165757c023 ("vfio/gvt: Convert to get_region_info_caps")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gvt/kvmgt.c
index bbeba0d3fca8,96d23717684f..000000000000
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@@ -1141,6 -1140,126 +1141,121 @@@ static int intel_vgpu_set_irqs(struct i
  	return func(vgpu, index, start, count, flags, data);
  }
 =20
+ static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
+ 					    struct vfio_region_info *info,
+ 					    struct vfio_info_cap *caps)
+ {
+ 	struct vfio_region_info_cap_sparse_mmap *sparse =3D NULL;
+ 	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
+ 	int nr_areas =3D 1;
+ 	int cap_type_id;
+ 	unsigned int i;
+ 	int ret;
+=20
+ 	switch (info->index) {
+ 	case VFIO_PCI_CONFIG_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->gvt->device_info.cfg_space_size;
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		break;
+ 	case VFIO_PCI_BAR0_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->cfg_space.bar[info->index].size;
+ 		if (!info->size) {
+ 			info->flags =3D 0;
+ 			break;
+ 		}
+=20
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		break;
+ 	case VFIO_PCI_BAR1_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+ 		break;
+ 	case VFIO_PCI_BAR2_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_CAPS |
+ 			      VFIO_REGION_INFO_FLAG_MMAP |
+ 			      VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		info->size =3D gvt_aperture_sz(vgpu->gvt);
+=20
+ 		sparse =3D kzalloc(struct_size(sparse, areas, nr_areas),
+ 				 GFP_KERNEL);
+ 		if (!sparse)
+ 			return -ENOMEM;
+=20
+ 		sparse->header.id =3D VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+ 		sparse->header.version =3D 1;
+ 		sparse->nr_areas =3D nr_areas;
+ 		cap_type_id =3D VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+ 		sparse->areas[0].offset =3D
+ 			PAGE_ALIGN(vgpu_aperture_offset(vgpu));
+ 		sparse->areas[0].size =3D vgpu_aperture_sz(vgpu);
+ 		break;
+=20
+ 	case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+=20
+ 		gvt_dbg_core("get region info bar:%d\n", info->index);
+ 		break;
+=20
+ 	case VFIO_PCI_ROM_REGION_INDEX:
+ 	case VFIO_PCI_VGA_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+=20
+ 		gvt_dbg_core("get region info index:%d\n", info->index);
+ 		break;
+ 	default: {
+ 		struct vfio_region_info_cap_type cap_type =3D {
+ 			.header.id =3D VFIO_REGION_INFO_CAP_TYPE,
+ 			.header.version =3D 1
+ 		};
+=20
+ 		if (info->index >=3D VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
+ 			return -EINVAL;
+ 		info->index =3D array_index_nospec(
+ 			info->index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
+=20
+ 		i =3D info->index - VFIO_PCI_NUM_REGIONS;
+=20
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->region[i].size;
+ 		info->flags =3D vgpu->region[i].flags;
+=20
+ 		cap_type.type =3D vgpu->region[i].type;
+ 		cap_type.subtype =3D vgpu->region[i].subtype;
+=20
+ 		ret =3D vfio_info_add_capability(caps, &cap_type.header,
+ 					       sizeof(cap_type));
+ 		if (ret)
+ 			return ret;
+ 	}
+ 	}
+=20
+ 	if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
 -		switch (cap_type_id) {
 -		case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
++		ret =3D -EINVAL;
++		if (cap_type_id =3D=3D VFIO_REGION_INFO_CAP_SPARSE_MMAP)
+ 			ret =3D vfio_info_add_capability(
+ 				caps, &sparse->header,
+ 				struct_size(sparse, areas, sparse->nr_areas));
 -			if (ret) {
 -				kfree(sparse);
 -				return ret;
 -			}
 -			break;
 -		default:
++		if (ret) {
+ 			kfree(sparse);
 -			return -EINVAL;
++			return ret;
+ 		}
+ 	}
+=20
+ 	kfree(sparse);
+ 	return 0;
+ }
+=20
  static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int c=
md,
  			     unsigned long arg)
  {

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkkVz8ACgkQAVBC80lX
0Gz1TAgAoEZIJ5/IeK8p9hifiStZ/jh/3iKPaCybV2k/AT+AFIe0ll+AmTTXEMXr
NnIyGgut00oyPURAkHwtfI/HfjCBtaiv96ZDufMC2ECFPpyt0qiBNUbufxvGfic3
ABtpkPepAEt9r7pInhm8rZMVXM6EvR3tVhBjlKkrYHhe8rL1Esexz9KPI3FFr2QW
m0S+hcZhDY+9Sp5//kVLoN76ei+0FtSxqJVID2lXYS83tTCKD79Icxc1PRyjrmP9
inPBCDps1MpB4j7oqmQN5WfsESovTQmKlH4yGHg+1QzG/ckWumKtg6zsK/dZ5r6i
w/iUjfPLvlSD+8pG/C7cczeRmqKozA==
=DXnF
-----END PGP SIGNATURE-----

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h--
